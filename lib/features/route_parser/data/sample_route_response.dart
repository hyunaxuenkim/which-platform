import 'dart:convert';

import '../domain/route_api_response_dto.dart';

final RouteApiResponseDto sampleRouteResponse = RouteApiResponseDto.fromJson(
  jsonDecode(_sampleRouteResponseJson) as Map<String, Object?>,
);

const String _sampleRouteResponseJson = '''
{
  "header": {
    "resultCode": "00",
    "resultMsg": "성공"
  },
  "body": {
    "totalreqHr": 1830,
    "totalCardCrg": 1750,
    "trsitNmtm": 1,
    "trfstnNms": [
      {
        "stnNm": "동대문역사문화공원",
        "dptreLineNm": "4호선",
        "arvlLineNm": "2호선"
      }
    ],
    "paths": [
      {
        "dptreStn": {
          "stnCd": "0426",
          "stnNo": "426",
          "stnNm": "서울역",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0425",
          "stnNo": "425",
          "stnNm": "회현",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "stnSctnDstc": 900,
        "reqHr": 90,
        "wtngHr": 0,
        "tmnlStnNm": "진접",
        "tmnlStnCd": "0405",
        "upbdnbSe": "상행",
        "trainno": "4066",
        "trainDptreTm": "10:04:30",
        "trainArvlTm": "10:06:00",
        "trsitYn": "N",
        "nonstopYn": "N"
      },
      {
        "dptreStn": {
          "stnCd": "0425",
          "stnNo": "425",
          "stnNm": "회현",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0424",
          "stnNo": "424",
          "stnNm": "명동",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "stnSctnDstc": 700,
        "reqHr": 60,
        "wtngHr": 0,
        "tmnlStnNm": "진접",
        "tmnlStnCd": "0405",
        "upbdnbSe": "상행",
        "trainno": "4066",
        "trainDptreTm": "10:06:30",
        "trainArvlTm": "10:07:30",
        "trsitYn": "N",
        "nonstopYn": "N"
      },
      {
        "dptreStn": {
          "stnCd": "0424",
          "stnNo": "424",
          "stnNm": "명동",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0423",
          "stnNo": "423",
          "stnNm": "충무로",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "stnSctnDstc": 700,
        "reqHr": 60,
        "wtngHr": 0,
        "tmnlStnNm": "진접",
        "tmnlStnCd": "0405",
        "upbdnbSe": "상행",
        "trainno": "4066",
        "trainDptreTm": "10:08:00",
        "trainArvlTm": "10:09:00",
        "trsitYn": "N",
        "nonstopYn": "N"
      },
      {
        "dptreStn": {
          "stnCd": "0423",
          "stnNo": "423",
          "stnNm": "충무로",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0422",
          "stnNo": "422",
          "stnNm": "동대문역사문화공원",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "stnSctnDstc": 1300,
        "reqHr": 120,
        "wtngHr": 0,
        "tmnlStnNm": "진접",
        "tmnlStnCd": "0405",
        "upbdnbSe": "상행",
        "trainno": "4066",
        "trainDptreTm": "10:09:30",
        "trainArvlTm": "10:11:30",
        "trsitYn": "N",
        "nonstopYn": "N"
      },
      {
        "dptreStn": {
          "stnCd": "0422",
          "stnNo": "422",
          "stnNm": "동대문역사문화공원",
          "lineNm": "4호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0205",
          "stnNo": "205",
          "stnNm": "동대문역사문화공원",
          "lineNm": "2호선",
          "brlnNm": null
        },
        "stnSctnDstc": 45,
        "reqHr": 43,
        "wtngHr": 107,
        "tmnlStnNm": null,
        "tmnlStnCd": null,
        "upbdnbSe": null,
        "trainno": null,
        "trainDptreTm": null,
        "trainArvlTm": null,
        "trsitYn": "Y",
        "nonstopYn": "N"
      },
      {
        "dptreStn": {
          "stnCd": "0205",
          "stnNo": "205",
          "stnNm": "동대문역사문화공원",
          "lineNm": "2호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0206",
          "stnNo": "206",
          "stnNm": "신당",
          "lineNm": "2호선",
          "brlnNm": null
        },
        "stnSctnDstc": 900,
        "reqHr": 90,
        "wtngHr": 0,
        "tmnlStnNm": "성수",
        "tmnlStnCd": "0211",
        "upbdnbSe": "내선",
        "trainno": "2132",
        "trainDptreTm": "10:14:00",
        "trainArvlTm": "10:15:30",
        "trsitYn": "N",
        "nonstopYn": "N"
      },
      {
        "dptreStn": {
          "stnCd": "0206",
          "stnNo": "206",
          "stnNm": "신당",
          "lineNm": "2호선",
          "brlnNm": null
        },
        "arvlStn": {
          "stnCd": "0207",
          "stnNo": "207",
          "stnNm": "상왕십리",
          "lineNm": "2호선",
          "brlnNm": null
        },
        "stnSctnDstc": 900,
        "reqHr": 60,
        "wtngHr": 0,
        "tmnlStnNm": "성수",
        "tmnlStnCd": "0211",
        "upbdnbSe": "내선",
        "trainno": "2132",
        "trainDptreTm": "10:16:00",
        "trainArvlTm": "10:17:00",
        "trsitYn": "N",
        "nonstopYn": "N"
      }
    ]
  }
}
''';
