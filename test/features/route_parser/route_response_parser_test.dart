import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';
import 'package:which_platform/features/route_parser/data/sample_route_response.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_api_response_dto.dart';
import 'package:which_platform/features/route_parser/domain/route_response_parser.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';

void main() {
  const RouteResponseParser parser = RouteResponseParser();
  const RouteViewDataMapper mapper = RouteViewDataMapper(
    lineColorHexByName: <String, String>{
      '04호선': '#32A1C8',
      '02호선': '#33A23D',
    },
  );

  group('RouteResponseParser', () {
    test('parses sample response into legs and transfers', () {
      final ParsedRouteParseResult result = parser.parse(sampleRouteResponse);

      expect(result, isA<ParsedRouteParseSuccess>());

      final ParsedRoute route = (result as ParsedRouteParseSuccess).route;
      expect(route.rawPathCount, 7);
      expect(route.transferCount, 1);
      expect(route.legs.length, 2);
      expect(route.transfers.length, 1);
      expect(route.legs.first.directionLabel, '진접행');
      expect(route.legs.last.directionLabel, '내선순환');
      expect(route.stationTrail.first, '서울역');
      expect(route.stationTrail.last, '상왕십리');

      final viewData = mapper.map(route);
      expect(viewData.summary.totalFareText, '1750 KRW');
      expect(viewData.summary.transferCountText, '1 transfer');
      expect(viewData.legItems.first.lineColorHex, '#32A1C8');
      expect(viewData.legItems.first.directionPositiveExamplesText, '진접, 동대문역사문화공원');
      expect(viewData.legItems.first.nextStationName, '회현');
      expect(viewData.legItems.first.nextNegativeStationName, 'no information');
      expect(viewData.legItems.first.instructionText, 'Follow signs to 진접');
      expect(
        viewData.legItems.first.stationTrailText,
        contains('서울역 -> 회현'),
      );
      expect(viewData.transferItems.single.toLineColorHex, '#33A23D');
      expect(viewData.transferItems.single.walkingTimeText, '43s');
    });

    test('supports single line path without transfer', () {
      final RouteApiResponseDto response = _responseWithPaths(
        <Map<String, Object?>>[
          _ridePath(
            departureCode: '0426',
            departureName: '서울역',
            departureLine: '4호선',
            arrivalCode: '0425',
            arrivalName: '회현',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 90,
            distance: 900,
          ),
          _ridePath(
            departureCode: '0425',
            departureName: '회현',
            departureLine: '4호선',
            arrivalCode: '0424',
            arrivalName: '명동',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 60,
            distance: 700,
          ),
        ],
        totalreqHr: 150,
        totalCardCrg: 1400,
        trsitNmtm: 0,
      );

      final ParsedRoute route =
          (parser.parse(response) as ParsedRouteParseSuccess).route;

      expect(route.legs.length, 1);
      expect(route.transfers, isEmpty);
      expect(route.legs.single.stationNames, <String>['서울역', '회현', '명동']);
    });

    test('resolves line 2 inner direction on main loop', () {
      final ParsedRoute route =
          (parser.parse(
                    _responseWithPaths(<Map<String, Object?>>[
                      _ridePath(
                        departureCode: '0205',
                        departureName: '동대문역사문화공원',
                        departureLine: '2호선',
                        arrivalCode: '0206',
                        arrivalName: '신당',
                        arrivalLine: '2호선',
                        terminalName: '성수',
                        terminalCode: '0211',
                        direction: '내선',
                        duration: 90,
                        distance: 900,
                      ),
                    ]),
                  )
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.legs.single.directionLabel, '내선순환');
    });

    test('resolves line 2 outer direction on main loop', () {
      final ParsedRoute route =
          (parser.parse(
                    _responseWithPaths(<Map<String, Object?>>[
                      _ridePath(
                        departureCode: '0226',
                        departureName: '강남',
                        departureLine: '2호선',
                        arrivalCode: '0225',
                        arrivalName: '역삼',
                        arrivalLine: '2호선',
                        terminalName: '시청',
                        terminalCode: '0201',
                        direction: '외선',
                        duration: 90,
                        distance: 900,
                      ),
                    ]),
                  )
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.legs.single.directionLabel, '외선순환');
    });

    test('keeps transfer row valid when terminal is null', () {
      final RouteApiResponseDto response =
          _responseWithPaths(<Map<String, Object?>>[
            _ridePath(
              departureCode: '0423',
              departureName: '충무로',
              departureLine: '4호선',
              arrivalCode: '0422',
              arrivalName: '동대문역사문화공원',
              arrivalLine: '4호선',
              terminalName: '진접',
              terminalCode: '0405',
              direction: '상행',
              duration: 120,
              distance: 1300,
            ),
            _transferPath(
              departureCode: '0422',
              departureName: '동대문역사문화공원',
              departureLine: '4호선',
              arrivalCode: '0205',
              arrivalName: '동대문역사문화공원',
              arrivalLine: '2호선',
              duration: 43,
              distance: 45,
              waitingSeconds: 107,
            ),
            _ridePath(
              departureCode: '0205',
              departureName: '동대문역사문화공원',
              departureLine: '2호선',
              arrivalCode: '0206',
              arrivalName: '신당',
              arrivalLine: '2호선',
              terminalName: '성수',
              terminalCode: '0211',
              direction: '내선',
              duration: 90,
              distance: 900,
            ),
          ]);

      final ParsedRoute route =
          (parser.parse(response) as ParsedRouteParseSuccess).route;

      expect(route.transfers.single.stationName, '동대문역사문화공원');
      expect(route.transfers.single.fromLineName, '4호선');
      expect(route.transfers.single.toLineName, '2호선');
    });

    test('resolves line 1 direction from terminal station name', () {
      final ParsedRoute route =
          (parser.parse(
                    _responseWithPaths(<Map<String, Object?>>[
                      _ridePath(
                        departureCode: '0150',
                        departureName: '종각',
                        departureLine: '1호선',
                        arrivalCode: '0151',
                        arrivalName: '종로3가',
                        arrivalLine: '1호선',
                        terminalName: '인천',
                        terminalCode: '0180',
                        direction: '하행',
                        duration: 80,
                        distance: 600,
                      ),
                    ]),
                  )
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.legs.single.directionLabel, '인천행');
    });

    test('applies database direction policies and station transition overrides', () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

      const String rawRouteCsv = '''
권역,권역명,철도운영기관명,노선명,순번,역명
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

      final RouteApiResponseDto response = _responseWithPaths(<Map<String, Object?>>[
        _ridePath(
          departureCode: '1701',
          departureName: '구로',
          departureLine: '1호선',
          arrivalCode: '1813',
          arrivalName: '구일',
          arrivalLine: '1호선',
          terminalName: '인천',
          terminalCode: '1812',
          direction: '하행',
          duration: 80,
          distance: 600,
        ),
      ]);

      final ParsedRoute route =
          (await parser.parseWithDatabase(response, database: database)
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.legs.single.branchKey, 'LINE1_GYEONGIN');
      expect(route.legs.single.directionLabel, '인천행');

      await database.close();
    });

    test('supports one-path short movement', () {
      final ParsedRoute route =
          (parser.parse(
                    _responseWithPaths(
                      <Map<String, Object?>>[
                        _ridePath(
                          departureCode: '0426',
                          departureName: '서울역',
                          departureLine: '4호선',
                          arrivalCode: '0425',
                          arrivalName: '회현',
                          arrivalLine: '4호선',
                          terminalName: '진접',
                          terminalCode: '0405',
                          direction: '상행',
                          duration: 90,
                          distance: 900,
                        ),
                      ],
                      totalreqHr: 90,
                      totalCardCrg: 1400,
                      trsitNmtm: 0,
                    ),
                  )
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.rawPathCount, 1);
      expect(route.legs.single.nextStationName, '회현');
    });

    test('splits legs when same line transfer row exists', () {
      final ParsedRoute route =
          (parser.parse(
                    _responseWithPaths(<Map<String, Object?>>[
                      _ridePath(
                        departureCode: '211-1',
                        departureName: '용두',
                        departureLine: '2호선',
                        arrivalCode: '211-2',
                        arrivalName: '신답',
                        arrivalLine: '2호선',
                        terminalName: '성수',
                        terminalCode: '0211',
                        direction: '성수행',
                        duration: 90,
                        distance: 900,
                        branchLineName: '성수지선',
                      ),
                      _ridePath(
                        departureCode: '211-2',
                        departureName: '신답',
                        departureLine: '2호선',
                        arrivalCode: '211-3',
                        arrivalName: '용답',
                        arrivalLine: '2호선',
                        terminalName: '성수',
                        terminalCode: '0211',
                        direction: '성수행',
                        duration: 90,
                        distance: 900,
                        branchLineName: '성수지선',
                      ),
                      _transferPath(
                        departureCode: '211-3',
                        departureName: '용답',
                        departureLine: '2호선',
                        arrivalCode: '0208',
                        arrivalName: '용답',
                        arrivalLine: '2호선',
                        duration: 120,
                        distance: 50,
                        waitingSeconds: 30,
                      ),
                      _ridePath(
                        departureCode: '0208',
                        departureName: '용답',
                        departureLine: '2호선',
                        arrivalCode: '0207',
                        arrivalName: '성수',
                        arrivalLine: '2호선',
                        terminalName: '시청',
                        terminalCode: '0201',
                        direction: '내선',
                        duration: 90,
                        distance: 900,
                      ),
                    ]),
                  )
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.legs.length, 2);
      expect(route.transfers.length, 1);
      expect(route.legs.first.stationNames, <String>['용두', '신답', '용답']);
      expect(route.legs.last.stationNames, <String>['용답', '성수']);
      expect(route.transfers.single.stationName, '용답');
    });

    test('splits legs when ride signature changes without transfer row', () {
      final ParsedRoute route =
          (parser.parse(
                    _responseWithPaths(<Map<String, Object?>>[
                      _ridePath(
                        departureCode: '0201',
                        departureName: '시청',
                        departureLine: '2호선',
                        arrivalCode: '0202',
                        arrivalName: '을지로입구',
                        arrivalLine: '2호선',
                        terminalName: '성수',
                        terminalCode: '0211',
                        direction: '내선',
                        duration: 90,
                        distance: 900,
                      ),
                      _ridePath(
                        departureCode: '0202',
                        departureName: '을지로입구',
                        departureLine: '2호선',
                        arrivalCode: '0203',
                        arrivalName: '을지로3가',
                        arrivalLine: '2호선',
                        terminalName: '시청',
                        terminalCode: '0201',
                        direction: '외선',
                        duration: 90,
                        distance: 900,
                      ),
                    ]),
                  )
                  as ParsedRouteParseSuccess)
              .route;

      expect(route.legs.length, 2);
      expect(route.transfers, isEmpty);
      expect(route.legs.first.directionLabel, '내선순환');
      expect(route.legs.last.directionLabel, '외선순환');
    });

    test('maps empty display fields to no information', () {
      final RouteViewData viewData = mapper.map(
        ParsedRoute(
          totalDurationSeconds: 0,
          totalFare: 0,
          transferCount: 0,
          legs: <RouteLeg>[
            const RouteLeg(
              lineName: '',
              fromStationName: '',
              toStationName: '',
              stationNames: <String>['', ''],
              stationCount: 2,
              directionLabel: '',
              apiDirection: null,
              terminalStationName: null,
              servicePatternKey: 'LOCAL',
              branchKey: 'MAIN',
              nextStationName: '',
              durationSeconds: 0,
              distanceMeters: 0,
              segmentCount: 1,
            ),
          ],
          transfers: <TransferSegment>[
            const TransferSegment(
              stationName: '',
              fromLineName: '',
              toLineName: '',
              durationSeconds: 0,
              distanceMeters: 0,
              waitingSeconds: 0,
            ),
          ],
          stationTrail: <String>[],
          rawPathCount: 1,
        ),
      );

      expect(viewData.summary.departureStationName, 'no information');
      expect(viewData.summary.arrivalStationName, 'no information');
      expect(viewData.summary.totalDurationText, '0s');
      expect(viewData.summary.totalFareText, '0 KRW');
      expect(viewData.summary.transferCountText, '0 transfers');
      expect(viewData.legItems.single.lineName, 'no information');
      expect(viewData.legItems.single.lineColorHex, '#9E9E9E');
      expect(viewData.legItems.single.directionLabel, 'no information');
      expect(
        viewData.legItems.single.directionPositiveExamplesText,
        'no information',
      );
      expect(
        viewData.legItems.single.directionNegativeExamplesText,
        'no information',
      );
      expect(viewData.legItems.single.nextStationName, 'no information');
      expect(viewData.legItems.single.nextNegativeStationName, 'no information');
      expect(viewData.legItems.single.stationTrailText, 'no information -> no information');
      expect(viewData.legItems.single.instructionText, 'Follow signs to no information');
      expect(viewData.transferItems.single.stationName, 'no information');
      expect(viewData.transferItems.single.fromLineName, 'no information');
      expect(viewData.transferItems.single.toLineName, 'no information');
      expect(viewData.transferItems.single.toLineColorHex, '#9E9E9E');
      expect(viewData.transferItems.single.walkingTimeText, '0s');
    });

    test('fails when response body is missing', () {
      final ParsedRouteParseResult result = parser.parse(
        const RouteApiResponseDto(header: RouteApiHeaderDto(resultCode: '00')),
      );

      expect(
        result,
        const ParsedRouteParseResult.failure(
          code: ParseFailureCode.missingBody,
          message: 'response.body is missing.',
        ),
      );
    });

    test('fails when paths field is missing', () {
      final ParsedRouteParseResult result = parser.parse(
        const RouteApiResponseDto(
          header: RouteApiHeaderDto(resultCode: '00'),
          body: RouteApiBodyDto(),
        ),
      );

      expect(
        result,
        const ParsedRouteParseResult.failure(
          code: ParseFailureCode.missingPaths,
          message: 'response.body.paths is missing.',
        ),
      );
    });

    test('fails when paths is empty', () {
      final ParsedRouteParseResult result = parser.parse(
        const RouteApiResponseDto(
          header: RouteApiHeaderDto(resultCode: '00'),
          body: RouteApiBodyDto(paths: <RouteApiPathDto>[]),
        ),
      );

      expect(
        result,
        const ParsedRouteParseResult.failure(
          code: ParseFailureCode.emptyPaths,
          message: 'response.body.paths is empty.',
        ),
      );
    });

    test('fails when paths contains only transfer rows', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _transferPath(
            departureCode: '0422',
            departureName: '동대문역사문화공원',
            departureLine: '4호선',
            arrivalCode: '0205',
            arrivalName: '동대문역사문화공원',
            arrivalLine: '2호선',
            duration: 43,
            distance: 45,
            waitingSeconds: 107,
          ),
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(result.message, 'First path cannot be a transfer segment.');
    });

    test('fails when a path is missing required station fields', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _ridePath(
            departureCode: '0426',
            departureName: '서울역',
            departureLine: '4호선',
            arrivalCode: '0425',
            arrivalName: '회현',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 90,
            distance: 900,
          )..['dptreStn'] = <String, Object?>{
              'stnCd': '0426',
              'stnNo': '0426',
              'stnNm': '',
              'lineNm': '4호선',
              'brlnNm': null,
            },
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(
        result.message,
        'Invalid path at index 0. paths[0] is missing required fields: departureStation.stationName.',
      );
    });

    test('fails when a path is missing required numeric fields', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _ridePath(
            departureCode: '0426',
            departureName: 'Seoul Station',
            departureLine: 'Line 4',
            arrivalCode: '0425',
            arrivalName: 'Hoehyeon',
            arrivalLine: 'Line 4',
            terminalName: 'Jinjeop',
            terminalCode: '0405',
            direction: 'UP',
            duration: 90,
            distance: 900,
          )..remove('reqHr'),
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(
        result.message,
        'Invalid path at index 0. paths[0] is missing required fields: sectionDurationSeconds.',
      );
    });

    test('fails when transfer flag is not Y or N', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _ridePath(
            departureCode: '0426',
            departureName: '서울역',
            departureLine: '4호선',
            arrivalCode: '0425',
            arrivalName: '회현',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 90,
            distance: 900,
          )..['trsitYn'] = 'MAYBE',
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(
        result.message,
        'Invalid path at index 0. paths[0].transferYn must be "Y" or "N", got "MAYBE".',
      );
    });

    test('fails when last path is transfer', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _ridePath(
            departureCode: '0423',
            departureName: '충무로',
            departureLine: '4호선',
            arrivalCode: '0422',
            arrivalName: '동대문역사문화공원',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 120,
            distance: 1300,
          ),
          _transferPath(
            departureCode: '0422',
            departureName: '동대문역사문화공원',
            departureLine: '4호선',
            arrivalCode: '0205',
            arrivalName: '동대문역사문화공원',
            arrivalLine: '2호선',
            duration: 43,
            distance: 45,
            waitingSeconds: 107,
          ),
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(result.message, 'Last path cannot be a transfer segment.');
    });

    test('fails when consecutive transfer rows are present', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _ridePath(
            departureCode: '0423',
            departureName: '충무로',
            departureLine: '4호선',
            arrivalCode: '0422',
            arrivalName: '동대문역사문화공원',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 120,
            distance: 1300,
          ),
          _transferPath(
            departureCode: '0422',
            departureName: '동대문역사문화공원',
            departureLine: '4호선',
            arrivalCode: '0205',
            arrivalName: '동대문역사문화공원',
            arrivalLine: '2호선',
            duration: 43,
            distance: 45,
            waitingSeconds: 107,
          ),
          _transferPath(
            departureCode: '0205',
            departureName: '동대문역사문화공원',
            departureLine: '2호선',
            arrivalCode: '0321',
            arrivalName: '왕십리',
            arrivalLine: '3호선',
            duration: 60,
            distance: 70,
            waitingSeconds: 90,
          ),
          _ridePath(
            departureCode: '0321',
            departureName: '왕십리',
            departureLine: '3호선',
            arrivalCode: '0322',
            arrivalName: '금호',
            arrivalLine: '3호선',
            terminalName: '오금',
            terminalCode: '0340',
            direction: '하행',
            duration: 80,
            distance: 900,
          ),
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(
        result.message,
        'Consecutive transfer segments are not allowed at paths[1] and [2].',
      );
    });

    test('fails when adjacent paths are not connected', () {
      final ParsedRouteParseResult result = parser.parse(
        _responseWithPaths(<Map<String, Object?>>[
          _ridePath(
            departureCode: '0426',
            departureName: '서울역',
            departureLine: '4호선',
            arrivalCode: '0425',
            arrivalName: '회현',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 90,
            distance: 900,
          ),
          _ridePath(
            departureCode: '0423',
            departureName: '충무로',
            departureLine: '4호선',
            arrivalCode: '0422',
            arrivalName: '동대문역사문화공원',
            arrivalLine: '4호선',
            terminalName: '진접',
            terminalCode: '0405',
            direction: '상행',
            duration: 120,
            distance: 1300,
          ),
        ]),
      );

      expect(result, isA<ParsedRouteParseFailure>());
      expect(
        (result as ParsedRouteParseFailure).code,
        ParseFailureCode.invalidPathShape,
      );
      expect(
        result.message,
        'Path connectivity breaks between paths[0] and [1].',
      );
    });
  });
}

RouteApiResponseDto _responseWithPaths(
  List<Map<String, Object?>> paths, {
  int totalreqHr = 90,
  int totalCardCrg = 1400,
  int trsitNmtm = 0,
}) {
  return RouteApiResponseDto.fromJson(<String, Object?>{
    'header': <String, Object?>{'resultCode': '00', 'resultMsg': '성공'},
    'body': <String, Object?>{
      'totalreqHr': totalreqHr,
      'totalCardCrg': totalCardCrg,
      'trsitNmtm': trsitNmtm,
      'trfstnNms': <Object?>[],
      'paths': jsonDecode(jsonEncode(paths)) as List<Object?>,
    },
  });
}

Map<String, Object?> _ridePath({
  required String departureCode,
  required String departureName,
  required String departureLine,
  required String arrivalCode,
  required String arrivalName,
  required String arrivalLine,
  required String terminalName,
  required String terminalCode,
  required String direction,
  required int duration,
  required int distance,
  String? branchLineName,
}) {
  return <String, Object?>{
    'dptreStn': <String, Object?>{
      'stnCd': departureCode,
      'stnNo': departureCode,
      'stnNm': departureName,
      'lineNm': departureLine,
      'brlnNm': branchLineName,
    },
    'arvlStn': <String, Object?>{
      'stnCd': arrivalCode,
      'stnNo': arrivalCode,
      'stnNm': arrivalName,
      'lineNm': arrivalLine,
      'brlnNm': branchLineName,
    },
    'stnSctnDstc': distance,
    'reqHr': duration,
    'wtngHr': 0,
    'tmnlStnNm': terminalName,
    'tmnlStnCd': terminalCode,
    'upbdnbSe': direction,
    'trainno': '1001',
    'trainDptreTm': '10:00:00',
    'trainArvlTm': '10:01:00',
    'trsitYn': 'N',
    'nonstopYn': 'N',
  };
}

Map<String, Object?> _transferPath({
  required String departureCode,
  required String departureName,
  required String departureLine,
  required String arrivalCode,
  required String arrivalName,
  required String arrivalLine,
  required int duration,
  required int distance,
  required int waitingSeconds,
}) {
  return <String, Object?>{
    'dptreStn': <String, Object?>{
      'stnCd': departureCode,
      'stnNo': departureCode,
      'stnNm': departureName,
      'lineNm': departureLine,
      'brlnNm': null,
    },
    'arvlStn': <String, Object?>{
      'stnCd': arrivalCode,
      'stnNo': arrivalCode,
      'stnNm': arrivalName,
      'lineNm': arrivalLine,
      'brlnNm': null,
    },
    'stnSctnDstc': distance,
    'reqHr': duration,
    'wtngHr': waitingSeconds,
    'tmnlStnNm': null,
    'tmnlStnCd': null,
    'upbdnbSe': null,
    'trainno': null,
    'trainDptreTm': null,
    'trainArvlTm': null,
    'trsitYn': 'Y',
    'nonstopYn': 'N',
  };
}
