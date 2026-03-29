import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/line_metadata_catalog.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';

void main() {
  const String rawRouteCsv = '''
권역,권역명,철도운영기관명,노선명,순번,역명
01,수도권,서울교통공사,1호선,5,서울역
01,수도권,서울교통공사,4호선,11,서울역
01,수도권,네오트랜스,신분당,7,강남
''';

  const String rawBranchKeysCsv = '''
line_name,line_key,branch_key,is_default,branch_kind,status,note
01호선,LINE1,LINE1_MAIN,true,main,confirmed,default main branch
01호선,LINE1,LINE1_GYEONGIN,false,branch,confirmed,
01호선,LINE1,LINE1_GYEONGBU,false,branch,confirmed,
01호선,LINE1,LINE1_GWANGMYEONG_SHUTTLE,false,shuttle,confirmed,
01호선,LINE1,LINE1_SEODONGTAN_SHUTTLE,false,shuttle,confirmed,
02호선,LINE2,LINE2_MAIN,true,main,confirmed,default main branch
02호선,LINE2,LINE2_SEONGSU_BRANCH,false,branch,confirmed,
02호선,LINE2,LINE2_SINJEONG_BRANCH,false,branch,confirmed,
04호선,LINE4,LINE4_MAIN,true,main,confirmed,default main branch
05호선,LINE5,LINE5_MAIN,true,main,confirmed,default main branch
05호선,LINE5,LINE5_HANAM_BRANCH,false,branch,confirmed,
05호선,LINE5,LINE5_MACHEON_BRANCH,false,branch,confirmed,
06호선,LINE6,LINE6_MAIN,true,main,confirmed,default main branch
06호선,LINE6,LINE6_EUNGAM_LOOP,false,loop,confirmed,
08호선,LINE8,LINE8_MAIN,true,main,confirmed,default main branch
09호선,LINE9,LINE9_MAIN,true,main,confirmed,default main branch
경의선,GJ,GJ_MAIN,true,main,confirmed,default main branch
수인분당선,SB,SB_MAIN,true,main,confirmed,default main branch
신분당선,SINBUNDANG,SINBUNDANG_MAIN,true,main,confirmed,default main branch
공항철도,AREX,AREX_MAIN,true,main,confirmed,default main branch
경춘선,GC,GC_MAIN,true,main,confirmed,default main branch
''';

  const String rawDirectionPoliciesCsv = '''
line_name,line_key,branch_key,direction_kind,api_direction,api_terminal_station_code,display_label_ko,is_active,note,status
01호선,LINE1,LINE1_MAIN,UP,상행,0150,서울역행,true,,confirmed
04호선,LINE4,LINE4_MAIN,DOWN,하행,0426,서울역행,true,,confirmed
신분당선,SINBUNDANG,SINBUNDANG_MAIN,DOWN,하행,D100,강남행,true,,confirmed
''';

  const String rawStationTransitionOverridesCsv = '''
line_name,line_key,current_station_code,next_station_code,api_terminal_station_code,api_terminal_station_name,api_direction,resolved_branch_key,prev_station_code,priority,is_active,note,status
01호선,LINE1,0150,0151,1812,인천,하행,LINE1_MAIN,,100,true,example,confirmed
''';

  test('imports stations and lines from line info json', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

    final String rawJson = jsonEncode(<String, Object?>{
      'DESCRIPTION': <String, Object?>{},
      'DATA': <Map<String, Object?>>[
        <String, Object?>{
          'line_num': '01호선',
          'station_nm': '서울역',
          'station_nm_eng': 'Seoul Station',
          'station_nm_jpn': 'ソウル駅',
          'station_nm_chn': '首尔站',
          'station_cd': '0150',
          'fr_code': '133',
        },
        <String, Object?>{
          'line_num': '04호선',
          'station_nm': '서울역',
          'station_nm_eng': 'Seoul Station',
          'station_nm_jpn': 'ソウル駅',
          'station_nm_chn': '首尔站',
          'station_cd': '0426',
          'fr_code': '426',
        },
        <String, Object?>{
          'line_num': '신분당선',
          'station_nm': '강남',
          'station_nm_eng': 'Gangnam',
          'station_nm_jpn': 'カンナム',
          'station_nm_chn': '江南',
          'station_cd': 'D100',
          'fr_code': 'D01',
        },
      ],
    });

    final SubwayLineInfoImportResult result = await importer
        .importFromJsonString(
          rawJson,
          rawRouteCsv: rawRouteCsv,
          rawBranchKeysCsv: rawBranchKeysCsv,
          rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
          rawStationTransitionOverridesCsv: rawStationTransitionOverridesCsv,
        );

    final lines = await database.select(database.lines).get();
    final stations = await database.select(database.stations).get();
    final lineStations = await database.select(database.lineStations).get();
    final directionPolicies = await database
        .select(database.directionPolicies)
        .get();
    final stationTransitionOverrides = await database
        .select(database.stationTransitionOverrides)
        .get();

    expect(result.processedRows, 3);
    expect(result.insertedLines, 3);
    expect(result.insertedStations, 2);
    expect(result.insertedLineStations, 3);
    expect(result.skippedRows, 0);

    expect(lines.map((line) => line.name).toSet(), <String>{
      '01호선',
      '04호선',
      '신분당선',
    });
    expect(stations.map((station) => station.nameKo).toSet(), <String>{
      '서울역',
      '강남',
    });
    expect(lineStations, hasLength(3));
    expect(
      lineStations.where((row) => row.stationCode == '0150').single.orderIndex,
      5,
    );
    expect(
      lineStations.where((row) => row.stationCode == '0426').single.orderIndex,
      11,
    );
    expect(
      lineStations.where((row) => row.stationCode == 'D100').single.orderIndex,
      7,
    );
    expect(
      lineStations.every((row) => row.branchKey.endsWith('_MAIN')),
      isTrue,
    );
    expect(lineStations.every((row) => row.isTerminal), isTrue);
    expect(directionPolicies, hasLength(3));
    expect(stationTransitionOverrides, hasLength(1));

    await database.close();
  });

  test('preloads line metadata when provided', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

    final String rawJson = jsonEncode(<String, Object?>{
      'DESCRIPTION': <String, Object?>{},
      'DATA': <Map<String, Object?>>[
        <String, Object?>{
          'line_num': '01호선',
          'station_nm': '서울역',
          'station_nm_eng': 'Seoul Station',
          'station_nm_jpn': 'ソウル駅',
          'station_nm_chn': '首尔站',
          'station_cd': '0150',
          'fr_code': '133',
        },
      ],
    });

    await importer.importFromJsonString(
      rawJson,
      rawRouteCsv: rawRouteCsv,
      rawBranchKeysCsv: rawBranchKeysCsv,
      rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
      rawStationTransitionOverridesCsv: rawStationTransitionOverridesCsv,
      lineMetadataByName: const <String, LineMetadata>{
        '01호선': LineMetadata(color: '#0D3692', lineType: 'BRANCH'),
      },
    );

    final lines = await database.select(database.lines).get();

    expect(lines.single.name, '01호선');
    expect(lines.single.color, '#0D3692');
    expect(lines.single.lineType, 'BRANCH');

    await database.close();
  });

  test('duplicates junction stations across branch keys and marks branch terminal', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

    const String branchRouteCsv = '''
권역,권역명,철도운영기관명,노선명,순번,역명
01,수도권,코레일,1호선,45,구로
01,수도권,코레일,1호선,46,가산디지털단지
01,수도권,코레일,1호선,46,구일
01,수도권,코레일,1호선,48,금천구청
01,수도권,코레일,1호선,49,광명
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
        <String, Object?>{
          'line_num': '01호선',
          'station_nm': '가산디지털단지',
          'station_nm_eng': 'Gasan Digital Complex',
          'station_nm_jpn': 'カサンデジタルダンジ',
          'station_nm_chn': '加山数码园区',
          'station_cd': '1702',
          'fr_code': 'P142',
        },
        <String, Object?>{
          'line_num': '01호선',
          'station_nm': '금천구청',
          'station_nm_eng': 'Geumcheon-gu Office',
          'station_nm_jpn': 'クムチョングチョン',
          'station_nm_chn': '衿川区厅',
          'station_cd': '1703',
          'fr_code': 'P144',
        },
        <String, Object?>{
          'line_num': '01호선',
          'station_nm': '광명',
          'station_nm_eng': 'Gwangmyeong',
          'station_nm_jpn': 'クァンミョン',
          'station_nm_chn': '光明',
          'station_cd': '1750',
          'fr_code': 'P144-1',
        },
      ],
    });

    await importer.importFromJsonString(
      rawJson,
      rawRouteCsv: branchRouteCsv,
      rawBranchKeysCsv: rawBranchKeysCsv,
      rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
      rawStationTransitionOverridesCsv: rawStationTransitionOverridesCsv,
    );

    final lines = await database.select(database.lines).get();
    final lineStations = await database.select(database.lineStations).get();
    final int line1Id = lines.singleWhere((line) => line.name == '01호선').id;

    final guroRows = lineStations.where((row) => row.stationCode == '1701').toList();
    expect(guroRows.map((row) => row.branchKey).toSet(), <String>{
      'LINE1_MAIN',
      'LINE1_GYEONGIN',
      'LINE1_GYEONGBU',
    });

    final gwangmyeongRow = lineStations.singleWhere(
      (row) => row.lineId == line1Id && row.stationCode == '1750',
    );
    expect(gwangmyeongRow.branchKey, 'LINE1_GWANGMYEONG_SHUTTLE');
    expect(gwangmyeongRow.isTerminal, isTrue);

    final geumcheonRows = lineStations
        .where((row) => row.stationCode == '1703')
        .map((row) => row.branchKey)
        .toSet();
    expect(geumcheonRows, <String>{
      'LINE1_MAIN',
      'LINE1_GYEONGBU',
      'LINE1_GWANGMYEONG_SHUTTLE',
    });

    await database.close();
  });

  test('backfills missing Japanese station name when later line row provides it', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

    const String pangyoRouteCsv = '''
권역,권역명,철도운영기관명,노선명,순번,역명
01,수도권,경강선,경강선,1,판교
01,수도권,네오트랜스,신분당,11,판교
''';

    final String rawJson = jsonEncode(<String, Object?>{
      'DESCRIPTION': <String, Object?>{},
      'DATA': <Map<String, Object?>>[
        <String, Object?>{
          'line_num': '경강선',
          'station_nm': '판교',
          'station_nm_eng': 'Pangyo',
          'station_nm_jpn': '',
          'station_nm_chn': '板橋',
          'station_cd': '1501',
          'fr_code': 'K409',
        },
        <String, Object?>{
          'line_num': '신분당선',
          'station_nm': '판교',
          'station_nm_eng': 'Pangyo',
          'station_nm_jpn': 'パンギョ',
          'station_nm_chn': '板橋',
          'station_cd': '4311',
          'fr_code': 'D11',
        },
      ],
    });

    await importer.importFromJsonString(
      rawJson,
      rawRouteCsv: pangyoRouteCsv,
      rawBranchKeysCsv: rawBranchKeysCsv,
      rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
      rawStationTransitionOverridesCsv: rawStationTransitionOverridesCsv,
    );

    final stations = await database.select(database.stations).get();
    final station = stations.singleWhere((row) => row.nameKo == '판교');

    expect(station.nameEn, 'Pangyo');
    expect(station.nameCh, '板橋');
    expect(station.nameJp, 'パンギョ');

    await database.close();
  });

  test('keeps first non-empty localized names when later line rows differ', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

    const String gimpoRouteCsv = '''
권역,권역명,철도운영기관명,노선명,순번,역명
01,수도권,서울교통공사,9호선,2,김포공항
01,수도권,공항철도,공항철도,7,김포공항
''';

    final String rawJson = jsonEncode(<String, Object?>{
      'DESCRIPTION': <String, Object?>{},
      'DATA': <Map<String, Object?>>[
        <String, Object?>{
          'line_num': '09호선',
          'station_nm': '김포공항',
          'station_nm_eng': 'Gimpo Int\'l Airport',
          'station_nm_jpn': 'キンポゴンハン',
          'station_nm_chn': '金浦机场',
          'station_cd': '4102',
          'fr_code': '902',
        },
        <String, Object?>{
          'line_num': '공항철도',
          'station_nm': '김포공항',
          'station_nm_eng': 'Gimpo Intl. Airport',
          'station_nm_jpn': 'キンポゴンハン',
          'station_nm_chn': '金浦机场',
          'station_cd': '4207',
          'fr_code': 'A05',
        },
      ],
    });

    await importer.importFromJsonString(
      rawJson,
      rawRouteCsv: gimpoRouteCsv,
      rawBranchKeysCsv: rawBranchKeysCsv,
      rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
      rawStationTransitionOverridesCsv: rawStationTransitionOverridesCsv,
    );

    final stations = await database.select(database.stations).get();
    final station = stations.singleWhere((row) => row.nameKo == '김포공항');

    expect(station.nameEn, 'Gimpo Int\'l Airport');
    expect(station.nameCh, '金浦机场');
    expect(station.nameJp, 'キンポゴンハン');

    await database.close();
  });
}
