# 사용하려고 하는 API 예시 result

- request:
{{base_url}}/{{api_key}}/json/getShtrmPath/1/5/서울역/잠실/2026-03-13 10:00:00
- response:
{
    "header": {
        "resultCode": "00",
        "resultMsg": "성공"
    },
    "body": {
        "searchType": "duration",
        "totalDstc": 15645,
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
        "exclTrfstnNms": [],
        "thrghStnNms": [],
        "schInclYn": "Y",
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
                "etrnYn": "N",
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
                "etrnYn": "N",
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
                "etrnYn": "N",
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
                "etrnYn": "N",
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
                "etrnYn": "N",
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
                "etrnYn": "N",
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
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0207",
                    "stnNo": "207",
                    "stnNm": "상왕십리",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0208",
                    "stnNo": "208",
                    "stnNm": "왕십리",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 800,
                "reqHr": 60,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2132",
                "trainDptreTm": "10:17:30",
                "trainArvlTm": "10:18:30",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0208",
                    "stnNo": "208",
                    "stnNm": "왕십리",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0209",
                    "stnNo": "209",
                    "stnNm": "한양대",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 1000,
                "reqHr": 90,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2132",
                "trainDptreTm": "10:19:00",
                "trainArvlTm": "10:20:30",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0209",
                    "stnNo": "209",
                    "stnNm": "한양대",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0210",
                    "stnNo": "210",
                    "stnNm": "뚝섬",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 1100,
                "reqHr": 90,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2132",
                "trainDptreTm": "10:21:00",
                "trainArvlTm": "10:22:30",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0210",
                    "stnNo": "210",
                    "stnNm": "뚝섬",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0211",
                    "stnNo": "211",
                    "stnNm": "성수",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 800,
                "reqHr": 60,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2132",
                "trainDptreTm": "10:23:00",
                "trainArvlTm": "10:24:00",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0211",
                    "stnNo": "211",
                    "stnNm": "성수",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0212",
                    "stnNo": "212",
                    "stnNm": "건대입구",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 1200,
                "reqHr": 90,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2178",
                "trainDptreTm": "10:25:00",
                "trainArvlTm": "10:26:30",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0212",
                    "stnNo": "212",
                    "stnNm": "건대입구",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0213",
                    "stnNo": "213",
                    "stnNm": "구의",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 1600,
                "reqHr": 120,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2178",
                "trainDptreTm": "10:27:00",
                "trainArvlTm": "10:29:00",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0213",
                    "stnNo": "213",
                    "stnNm": "구의",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0214",
                    "stnNo": "214",
                    "stnNm": "강변",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 900,
                "reqHr": 60,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2178",
                "trainDptreTm": "10:29:30",
                "trainArvlTm": "10:30:30",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0214",
                    "stnNo": "214",
                    "stnNm": "강변",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0215",
                    "stnNo": "215",
                    "stnNm": "잠실나루",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 1800,
                "reqHr": 120,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2178",
                "trainDptreTm": "10:31:00",
                "trainArvlTm": "10:33:00",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            },
            {
                "dptreStn": {
                    "stnCd": "0215",
                    "stnNo": "215",
                    "stnNm": "잠실나루",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "arvlStn": {
                    "stnCd": "0216",
                    "stnNo": "216",
                    "stnNm": "잠실",
                    "lineNm": "2호선",
                    "brlnNm": null
                },
                "stnSctnDstc": 1000,
                "reqHr": 90,
                "wtngHr": 0,
                "tmnlStnNm": "성수",
                "tmnlStnCd": "0211",
                "upbdnbSe": "내선",
                "trainno": "2178",
                "trainDptreTm": "10:33:30",
                "trainArvlTm": "10:35:00",
                "trsitYn": "N",
                "etrnYn": "N",
                "nonstopYn": "N"
            }
        ]
    }
}