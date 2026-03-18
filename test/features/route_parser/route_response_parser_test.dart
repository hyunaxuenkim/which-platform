import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/features/route_parser/data/sample_route_response.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_api_response_dto.dart';
import 'package:which_platform/features/route_parser/domain/route_response_parser.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';

void main() {
  const RouteResponseParser parser = RouteResponseParser();
  const RouteViewDataMapper mapper = RouteViewDataMapper();

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
      expect(viewData.summary.totalFareText, '1750원');
      expect(viewData.legItems.first.stationTrailText, contains('서울역 → 회현'));
      expect(viewData.transferItems.single.walkingTimeText, '43초');
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

    test('fails when response body is missing', () {
      final ParsedRouteParseResult result = parser.parse(
        const RouteApiResponseDto(header: RouteApiHeaderDto(resultCode: '00')),
      );

      expect(
        result,
        const ParsedRouteParseResult.failure(
          code: ParseFailureCode.missingBody,
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
