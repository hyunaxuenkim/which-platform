import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';

void main() {
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
    },
  );

  test(
    'resolves negative direction label and opposite adjacent station from database',
    () async {
      final AppDatabase database = AppDatabase.forTesting(NativeDatabase.memory());
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
      expect(viewData.legItems.single.nextNegativeStationName, '신도림');

      await database.close();
    },
  );
}
