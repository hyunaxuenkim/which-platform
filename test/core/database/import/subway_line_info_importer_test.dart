import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';

void main() {
  test('imports stations and lines from line info json', () async {
    final AppDatabase database = AppDatabase.forTesting(NativeDatabase.memory());
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

    final SubwayLineInfoImportResult result =
        await importer.importFromJsonString(rawJson);

    final lines = await database.select(database.lines).get();
    final stations = await database.select(database.stations).get();

    expect(result.processedRows, 2);
    expect(result.insertedLines, 2);
    expect(result.insertedStations, 1);
    expect(result.skippedRows, 1);

    expect(lines.map((line) => line.name).toSet(), <String>{'01호선', '04호선'});
    expect(stations.single.nameKo, '서울역');
    expect(stations.single.nameEn, 'Seoul Station');

    await database.close();
  });
}
