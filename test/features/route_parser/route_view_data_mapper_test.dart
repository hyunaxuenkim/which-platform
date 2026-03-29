import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'resolves line colors from DB-backed map using canonical line names',
    () {
      const RouteViewDataMapper mapper = RouteViewDataMapper(
        lineColorHexByName: <String, String>{
          '경의선': '#77C4A3',
          '01호선': '#0D3692',
        },
      );

      const ParsedRoute route = ParsedRoute(
        totalDurationSeconds: 120,
        totalFare: 1400,
        transferCount: 0,
        stationTrail: <String>['서울역', '회현'],
        rawPathCount: 1,
        legs: <RouteLeg>[
          RouteLeg(
            lineName: '경의중앙선',
            fromStationName: '서울역',
            toStationName: '회현',
            stationNames: <String>['서울역', '회현'],
            stationCount: 2,
            directionLabel: '문산방면',
            apiDirection: '상행',
            terminalStationName: '문산',
            servicePatternKey: 'LOCAL',
            branchKey: 'MAIN',
            nextStationName: '회현',
            durationSeconds: 120,
            distanceMeters: 1000,
            segmentCount: 1,
          ),
        ],
        transfers: <TransferSegment>[],
      );

      final viewData = mapper.map(route);

      expect(viewData.legItems.single.lineColorHex, '#77C4A3');
      expect(
        viewData.legItems.single.stations.map((station) => station.fullText),
        <String>['서울역', '회현'],
      );
    },
  );

  test(
    'resolves negative direction label and opposite adjacent station from database',
    () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

      const String rawRouteCsv = '''
권역,권역명,철도운영기관명,노선명,순번,역명
01,수도권,코레일,1호선,44,신도림
01,수도권,코레일,1호선,45,구로
01,수도권,코레일,1호선,46,구일
''';

      const String rawBranchKeysCsv = '''
line_name,line_key,branch_key,is_default,branch_kind,status,note
01호선,LINE1,LINE1_MAIN,true,main,confirmed,
01호선,LINE1,LINE1_GYEONGIN,false,branch,confirmed,
''';

      const String rawDirectionPoliciesCsv = '''
line_name,line_key,branch_key,direction_kind,api_direction,api_terminal_station_code,display_label_ko,is_active,note,status
01호선,LINE1,LINE1_GYEONGIN,DOWN,하행,1812,인천행,true,,confirmed
01호선,LINE1,LINE1_GYEONGIN,UP,상행,102,연천행,true,,confirmed
''';

      const String rawOverridesCsv = '''
line_name,line_key,current_station_code,next_station_code,api_terminal_station_code,api_terminal_station_name,api_direction,resolved_branch_key,prev_station_code,priority,is_active,note,status
01호선,LINE1,1701,1813,1812,인천,하행,LINE1_GYEONGIN,,100,true,,confirmed
''';

      final String rawJson = jsonEncode(<String, Object?>{
        'DESCRIPTION': <String, Object?>{},
        'DATA': <Map<String, Object?>>[
          <String, Object?>{
            'line_num': '01호선',
            'station_nm': '신도림',
            'station_nm_eng': 'Sindorim',
            'station_nm_jpn': 'シンドリム',
            'station_nm_chn': '新道林',
            'station_cd': '1702',
            'fr_code': '140',
          },
          <String, Object?>{
            'line_num': '01호선',
            'station_nm': '구로',
            'station_nm_eng': 'Guro',
            'station_nm_jpn': 'クロ',
            'station_nm_chn': '九老',
            'station_cd': '1701',
            'fr_code': '141',
          },
          <String, Object?>{
            'line_num': '01호선',
            'station_nm': '구일',
            'station_nm_eng': 'Guil',
            'station_nm_jpn': 'クイル',
            'station_nm_chn': '九一',
            'station_cd': '1813',
            'fr_code': '142',
          },
        ],
      });

      await importer.importFromJsonString(
        rawJson,
        rawRouteCsv: rawRouteCsv,
        rawBranchKeysCsv: rawBranchKeysCsv,
        rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
        rawStationTransitionOverridesCsv: rawOverridesCsv,
      );

      const ParsedRoute route = ParsedRoute(
        totalDurationSeconds: 120,
        totalFare: 1400,
        transferCount: 0,
        stationTrail: <String>['구로', '구일'],
        rawPathCount: 1,
        legs: <RouteLeg>[
          RouteLeg(
            lineName: '1호선',
            fromStationName: '구로',
            toStationName: '구일',
            stationNames: <String>['구로', '구일'],
            stationCount: 2,
            directionLabel: '인천행',
            apiDirection: '하행',
            terminalStationName: '인천',
            servicePatternKey: 'LOCAL',
            branchKey: 'LINE1_GYEONGIN',
            nextStationName: '구일',
            durationSeconds: 120,
            distanceMeters: 1000,
            segmentCount: 1,
          ),
        ],
        transfers: <TransferSegment>[],
      );

      const RouteViewDataMapper mapper = RouteViewDataMapper(
        lineColorHexByName: <String, String>{'01호선': '#0D3692'},
      );
      final viewData = await mapper.mapWithDatabase(route, database: database);

      expect(viewData.legItems.single.directionNegativeExamplesText, '연천행');
      expect(viewData.legItems.single.nextNegativeStation.fullText, 'Sindorim');

      await database.close();
    },
  );

  test('localizes summary, legs, and transfers with station codes', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    addTearDown(database.close);

    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);
    await importer.importFromAsset();

    const ParsedRoute route = ParsedRoute(
      totalDurationSeconds: 180,
      totalFare: 1400,
      transferCount: 1,
      stationTrail: <String>['서울역', '동대문역사문화공원', '상왕십리'],
      stationTrailCodes: <String>['0426', '0422', '0207'],
      rawPathCount: 3,
      legs: <RouteLeg>[
        RouteLeg(
          lineName: '4호선',
          fromStationName: '서울역',
          fromStationCode: '0426',
          toStationName: '동대문역사문화공원',
          toStationCode: '0422',
          stationNames: <String>['서울역', '회현', '명동', '충무로', '동대문역사문화공원'],
          stationCodes: <String>['0426', '0425', '0424', '0423', '0422'],
          stationCount: 5,
          directionLabel: '진접행',
          apiDirection: '상행',
          terminalStationName: '진접',
          terminalStationCode: '0405',
          servicePatternKey: 'LOCAL',
          branchKey: 'MAIN',
          nextStationName: '회현',
          nextStationCode: '0425',
          durationSeconds: 120,
          distanceMeters: 1000,
          segmentCount: 4,
        ),
        RouteLeg(
          lineName: '2호선',
          fromStationName: '동대문역사문화공원',
          fromStationCode: '0205',
          toStationName: '상왕십리',
          toStationCode: '0207',
          stationNames: <String>['동대문역사문화공원', '신당', '상왕십리'],
          stationCodes: <String>['0205', '0206', '0207'],
          stationCount: 3,
          directionLabel: '내선순환',
          apiDirection: '내선',
          terminalStationName: '성수',
          terminalStationCode: '0211',
          servicePatternKey: 'LOCAL',
          branchKey: 'MAIN',
          nextStationName: '신당',
          nextStationCode: '0206',
          durationSeconds: 60,
          distanceMeters: 500,
          segmentCount: 2,
        ),
      ],
      transfers: <TransferSegment>[
        TransferSegment(
          stationName: '동대문역사문화공원',
          stationCode: '0422',
          fromLineName: '4호선',
          toLineName: '2호선',
          durationSeconds: 43,
          distanceMeters: 45,
          waitingSeconds: 90,
        ),
      ],
    );

    final RouteViewDataMapper mapper = RouteViewDataMapper(
      lineColorHexByName: await database.getLineColorHexByName(),
    );
    final viewData = await mapper.mapWithDatabase(
      route,
      database: database,
      language: AppLanguage.zhHans,
    );

    expect(viewData.summary.departureStation.primary, '首尔');
    expect(viewData.summary.departureStation.secondary, 'Seoul Station');
    expect(viewData.summary.arrivalStation.fullText, '上往十里 (Sangwangsimni)');
    expect(viewData.legItems.first.fromStation.fullText, '首尔 (Seoul Station)');
    expect(
      viewData.legItems.first.nextStation.fullText,
      '会贤(南大门市场) (Hoehyeon)',
    );
    expect(
      viewData.legItems.first.stations[4].fullText,
      '东大门历史文化公园(DDP) (Dongdaemun History  Culture Park)',
    );
    expect(
      viewData.transferItems.single.station.fullText,
      '东大门历史文化公园(DDP) (Dongdaemun History  Culture Park)',
    );
  });

  test(
    'keeps fallback station names predictable when localized packs are missing',
    () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

      final int stationId = await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '서울역',
              nameEn: const Value('Seoul Station'),
            ),
          );
      final int lineId = await database
          .into(database.lines)
          .insert(LinesCompanion.insert(name: '04호선'));
      await database
          .into(database.lineStations)
          .insert(
            LineStationsCompanion.insert(
              lineId: lineId,
              stationId: stationId,
              stationCode: '0426',
              orderIndex: 1,
            ),
          );

      const ParsedRoute route = ParsedRoute(
        totalDurationSeconds: 60,
        totalFare: 1400,
        transferCount: 0,
        stationTrail: <String>['서울역', '임시종점'],
        stationTrailCodes: <String>['0426', '9999'],
        rawPathCount: 1,
        legs: <RouteLeg>[
          RouteLeg(
            lineName: '4호선',
            fromStationName: '서울역',
            fromStationCode: '0426',
            toStationName: '임시종점',
            toStationCode: '9999',
            stationNames: <String>['서울역', '임시종점'],
            stationCodes: <String>['0426', '9999'],
            stationCount: 2,
            directionLabel: '임시종점행',
            apiDirection: '상행',
            terminalStationName: '임시종점',
            terminalStationCode: '9999',
            servicePatternKey: 'LOCAL',
            branchKey: 'MAIN',
            nextStationName: '임시종점',
            nextStationCode: '9999',
            durationSeconds: 60,
            distanceMeters: 500,
            segmentCount: 1,
          ),
        ],
        transfers: <TransferSegment>[],
      );

      final RouteViewDataMapper mapper = RouteViewDataMapper(
        lineColorHexByName: const <String, String>{'04호선': '#2F9D27'},
      );
      final RouteViewData viewData = await mapper.mapWithDatabase(
        route,
        database: database,
        language: AppLanguage.zhHans,
      );

      expect(viewData.summary.departureStation.fullText, 'Seoul Station');
      expect(viewData.summary.departureStation.secondary, isNull);
      expect(viewData.summary.arrivalStation.fullText, '임시종점');
      expect(viewData.legItems.single.fromStation.fullText, 'Seoul Station');
      expect(viewData.legItems.single.toStation.fullText, '임시종점');
      expect(viewData.legItems.single.nextStation.fullText, '임시종점');
    },
  );
}
