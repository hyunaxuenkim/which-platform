import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';
import 'package:which_platform/features/route_parser/domain/wrong_platform_localization_audit.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'flags Korean raw direction data on zh-Hans screen',
    () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

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
01호선,LINE1,LINE1_GYEONGIN,DOWN,하행,1812,연천행,true,,confirmed
01호선,LINE1,LINE1_GYEONGIN,UP,상행,102,연천행,true,,confirmed
''';

      const String rawOverridesCsv = '''
line_name,line_key,current_station_code,next_station_code,api_terminal_station_code,api_terminal_station_name,api_direction,resolved_branch_key,prev_station_code,priority,is_active,note,status
01호선,LINE1,1701,1813,1812,인천,하행,LINE1_GYEONGIN,,100,true,,confirmed
''';

      const String rawJson = '''
{
  "DESCRIPTION": {},
  "DATA": [
    {
      "line_num": "01호선",
      "station_nm": "신도림",
      "station_nm_eng": "Sindorim",
      "station_nm_jpn": "シンドリム",
      "station_nm_chn": "新道林",
      "station_cd": "1702",
      "fr_code": "140"
    },
    {
      "line_num": "01호선",
      "station_nm": "구로",
      "station_nm_eng": "Guro",
      "station_nm_jpn": "クロ",
      "station_nm_chn": "九老",
      "station_cd": "1701",
      "fr_code": "141"
    },
    {
      "line_num": "01호선",
      "station_nm": "구일",
      "station_nm_eng": "Guil",
      "station_nm_jpn": "クイル",
      "station_nm_chn": "九一",
      "station_cd": "1813",
      "fr_code": "142"
    }
  ]
}
''';

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
        stationTrailCodes: <String>['1701', '1813'],
        rawPathCount: 1,
        legs: <RouteLeg>[
          RouteLeg(
            lineName: '1호선',
            fromStationName: '구로',
            fromStationCode: '1701',
            toStationName: '구일',
            toStationCode: '1813',
            stationNames: <String>['구로', '구일'],
            stationCodes: <String>['1701', '1813'],
            stationCount: 2,
            directionLabel: '인천행',
            apiDirection: '하행',
            terminalStationName: '인천',
            terminalStationCode: '1812',
            servicePatternKey: 'LOCAL',
            branchKey: 'LINE1_GYEONGIN',
            nextStationName: '구일',
            nextStationCode: '1813',
            durationSeconds: 120,
            distanceMeters: 1000,
            segmentCount: 1,
          ),
        ],
        transfers: <TransferSegment>[],
      );

      final RouteViewDataMapper mapper = RouteViewDataMapper(
        lineColorHexByName: const <String, String>{'01호선': '#0D3692'},
      );
      final RouteViewData viewData = await mapper.mapWithDatabase(
        route,
        database: database,
        language: AppLanguage.zhHans,
      );

      const WrongPlatformLocalizationAuditor auditor =
          WrongPlatformLocalizationAuditor();
      final WrongPlatformLegLocalizationAudit audit = auditor.auditLeg(
        leg: route.legs.single,
        item: viewData.legItems.single,
        language: AppLanguage.zhHans,
      );

      expect(
        audit.fields.firstWhere((field) => field.fieldName == 'directionLabel').issue,
        WrongPlatformLocalizationIssue.koreanRaw,
      );
      expect(
        audit.fields
            .firstWhere((field) => field.fieldName == 'negativeExamples')
            .issue,
        WrongPlatformLocalizationIssue.koreanRaw,
      );
      expect(
        audit.fields
            .firstWhere((field) => field.fieldName == 'previousStation')
            .issue,
        WrongPlatformLocalizationIssue.none,
      );
    },
  );

  test('flags missing previous station separately from Korean raw fields', () {
    const ParsedRoute route = ParsedRoute(
      totalDurationSeconds: 60,
      totalFare: 1400,
      transferCount: 0,
      stationTrail: <String>['서울역', '임시종점'],
      rawPathCount: 1,
      legs: <RouteLeg>[
        RouteLeg(
          lineName: '4호선',
          fromStationName: '서울역',
          toStationName: '임시종점',
          stationNames: <String>['서울역', '임시종점'],
          stationCount: 2,
          directionLabel: '임시종점행',
          apiDirection: '상행',
          terminalStationName: '임시종점',
          servicePatternKey: 'LOCAL',
          branchKey: 'MAIN',
          nextStationName: '임시종점',
          durationSeconds: 60,
          distanceMeters: 500,
          segmentCount: 1,
        ),
      ],
      transfers: <TransferSegment>[],
    );

    const RouteViewData viewData = RouteViewData(
      summary: RouteSummaryViewData(
        departureStation: StationDisplayNameViewData(
          primary: 'Seoul Station',
          fullText: 'Seoul Station',
        ),
        arrivalStation: StationDisplayNameViewData(
          primary: '임시종점',
          fullText: '임시종점',
        ),
        totalDurationSeconds: 60,
        totalFare: 1400,
        transferCount: 0,
        totalDurationText: '1m',
        totalFareText: '1400 KRW',
        transferCountText: '0 transfers',
      ),
      legItems: <RouteLegItemViewData>[
        RouteLegItemViewData(
          lineName: '4호선',
          lineColorHex: '#2F9D27',
          stationCount: 2,
          durationSeconds: 60,
          directionLabel: '임시종점행',
          directionPositiveExamplesText: '임시종점',
          directionNegativeExamplesText: '임시종점행',
          fromStation: StationDisplayNameViewData(
            primary: 'Seoul Station',
            fullText: 'Seoul Station',
          ),
          toStation: StationDisplayNameViewData(
            primary: '임시종점',
            fullText: '임시종점',
          ),
          stations: <StationDisplayNameViewData>[
            StationDisplayNameViewData(
              primary: 'Seoul Station',
              fullText: 'Seoul Station',
            ),
            StationDisplayNameViewData(
              primary: '임시종점',
              fullText: '임시종점',
            ),
          ],
          nextStation: StationDisplayNameViewData(
            primary: '임시종점',
            fullText: '임시종점',
          ),
          nextNegativeStation: StationDisplayNameViewData(
            primary: RouteViewDataMapper.missingInformationText,
            fullText: RouteViewDataMapper.missingInformationText,
          ),
          stationTrailText: 'Seoul Station -> 임시종점',
          stationCountText: '2 stations',
          durationText: '1m',
        ),
      ],
      transferItems: <RouteTransferItemViewData>[],
    );

    const WrongPlatformLocalizationAuditor auditor =
        WrongPlatformLocalizationAuditor();
    final WrongPlatformLegLocalizationAudit audit = auditor.auditLeg(
      leg: route.legs.single,
      item: viewData.legItems.single,
      language: AppLanguage.ja,
    );

    expect(
      audit.fields
          .firstWhere((field) => field.fieldName == 'previousStation')
          .issue,
      WrongPlatformLocalizationIssue.missing,
    );
    expect(
      audit.fields.firstWhere((field) => field.fieldName == 'lineName').issue,
      WrongPlatformLocalizationIssue.koreanRaw,
    );
  });
}
