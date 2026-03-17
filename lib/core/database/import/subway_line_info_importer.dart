import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../app_database.dart';

typedef JsonMap = Map<String, Object?>;

class SubwayLineInfoImportResult {
  const SubwayLineInfoImportResult({
    required this.processedRows,
    required this.insertedLines,
    required this.insertedStations,
    required this.updatedStations,
    required this.skippedRows,
  });

  final int processedRows;
  final int insertedLines;
  final int insertedStations;
  final int updatedStations;
  final int skippedRows;
}

class SubwayLineInfoImporter {
  SubwayLineInfoImporter(this._database, {AssetBundle? assetBundle})
      : _assetBundle = assetBundle ?? rootBundle;

  static const String defaultAssetPath = 'assets/data/subway_line_info.json';

  static const Set<String> defaultIncludedLines = <String>{
    '01호선',
    '02호선',
    '03호선',
    '04호선',
    '05호선',
    '06호선',
    '07호선',
    '08호선',
    '09호선',
  };

  final AppDatabase _database;
  final AssetBundle _assetBundle;

  Future<SubwayLineInfoImportResult> importFromAsset({
    String assetPath = defaultAssetPath,
    Set<String> includedLines = defaultIncludedLines,
  }) async {
    final String rawJson = await _assetBundle.loadString(assetPath);
    return importFromJsonString(rawJson, includedLines: includedLines);
  }

  Future<SubwayLineInfoImportResult> importFromJsonString(
    String rawJson, {
    Set<String> includedLines = defaultIncludedLines,
  }) async {
    final Object? decoded = jsonDecode(rawJson);

    if (decoded is! JsonMap) {
      throw const FormatException('subway_line_info.json root must be an object.');
    }

    final Object? dataField = decoded['DATA'];
    if (dataField is! List<Object?>) {
      throw const FormatException('subway_line_info.json must contain a DATA array.');
    }

    final List<_SubwayLineInfoRow> rows = dataField
        .whereType<JsonMap>()
        .map(_SubwayLineInfoRow.fromJson)
        .where((row) => includedLines.contains(row.lineNum))
        .toList();

    return _database.transaction(() async {
      int insertedLines = 0;
      int insertedStations = 0;
      int updatedStations = 0;

      final Map<String, int> lineIdsByName = <String, int>{};
      final Map<String, _StationSnapshot> stationsByName = <String, _StationSnapshot>{};

      final existingLines = await _database.select(_database.lines).get();
      for (final line in existingLines) {
        lineIdsByName[line.name] = line.id;
      }

      final existingStations = await _database.select(_database.stations).get();
      for (final station in existingStations) {
        stationsByName[station.nameKo] = _StationSnapshot(
          id: station.id,
          nameKo: station.nameKo,
          nameEn: station.nameEn,
          nameJp: station.nameJp,
          nameCh: station.nameCh,
        );
      }

      for (final row in rows) {
        if (!lineIdsByName.containsKey(row.lineNum)) {
          final int lineId = await _database.into(_database.lines).insert(
                LinesCompanion.insert(name: row.lineNum),
              );
          lineIdsByName[row.lineNum] = lineId;
          insertedLines++;
        }

        final _StationSnapshot? existingStation = stationsByName[row.stationNameKo];
        if (existingStation == null) {
          final int stationId = await _database.into(_database.stations).insert(
                StationsCompanion.insert(
                  nameKo: row.stationNameKo,
                  nameEn: _presentValue(row.stationNameEn),
                  nameJp: _presentValue(row.stationNameJp),
                  nameCh: _presentValue(row.stationNameCh),
                ),
              );
          stationsByName[row.stationNameKo] = _StationSnapshot(
            id: stationId,
            nameKo: row.stationNameKo,
            nameEn: _normalizeValue(row.stationNameEn),
            nameJp: _normalizeValue(row.stationNameJp),
            nameCh: _normalizeValue(row.stationNameCh),
          );
          insertedStations++;
          continue;
        }

        final String? nextNameEn = _mergeValue(existingStation.nameEn, row.stationNameEn);
        final String? nextNameJp = _mergeValue(existingStation.nameJp, row.stationNameJp);
        final String? nextNameCh = _mergeValue(existingStation.nameCh, row.stationNameCh);

        final bool shouldUpdate = nextNameEn != existingStation.nameEn ||
            nextNameJp != existingStation.nameJp ||
            nextNameCh != existingStation.nameCh;

        if (shouldUpdate) {
          await (_database.update(_database.stations)
                ..where((tbl) => tbl.id.equals(existingStation.id)))
              .write(
            StationsCompanion(
              nameEn: Value(nextNameEn),
              nameJp: Value(nextNameJp),
              nameCh: Value(nextNameCh),
            ),
          );

          stationsByName[row.stationNameKo] = existingStation.copyWith(
            nameEn: nextNameEn,
            nameJp: nextNameJp,
            nameCh: nextNameCh,
          );
          updatedStations++;
        }
      }

      return SubwayLineInfoImportResult(
        processedRows: rows.length,
        insertedLines: insertedLines,
        insertedStations: insertedStations,
        updatedStations: updatedStations,
        skippedRows: dataField.length - rows.length,
      );
    });
  }

  Value<String?> _presentValue(String? raw) => Value(_normalizeValue(raw));

  String? _mergeValue(String? current, String? incoming) {
    final String? normalizedIncoming = _normalizeValue(incoming);
    return current ?? normalizedIncoming;
  }

  String? _normalizeValue(String? raw) {
    final String trimmed = raw?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }
}

class _SubwayLineInfoRow {
  const _SubwayLineInfoRow({
    required this.lineNum,
    required this.stationCode,
    required this.stationNo,
    required this.stationNameKo,
    required this.stationNameEn,
    required this.stationNameJp,
    required this.stationNameCh,
  });

  factory _SubwayLineInfoRow.fromJson(JsonMap json) {
    return _SubwayLineInfoRow(
      lineNum: _readRequiredString(json, 'line_num'),
      stationCode: _readRequiredString(json, 'station_cd'),
      stationNo: _readRequiredString(json, 'fr_code'),
      stationNameKo: _readRequiredString(json, 'station_nm'),
      stationNameEn: _readOptionalString(json, 'station_nm_eng'),
      stationNameJp: _readOptionalString(json, 'station_nm_jpn'),
      stationNameCh: _readOptionalString(json, 'station_nm_chn'),
    );
  }

  final String lineNum;
  final String stationCode;
  final String stationNo;
  final String stationNameKo;
  final String? stationNameEn;
  final String? stationNameJp;
  final String? stationNameCh;

  static String _readRequiredString(JsonMap json, String key) {
    final String? value = _readOptionalString(json, key);
    if (value == null) {
      throw FormatException('Missing required field: $key');
    }
    return value;
  }

  static String? _readOptionalString(JsonMap json, String key) {
    final Object? value = json[key];
    if (value == null) {
      return null;
    }
    final String trimmed = value.toString().trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}

class _StationSnapshot {
  const _StationSnapshot({
    required this.id,
    required this.nameKo,
    required this.nameEn,
    required this.nameJp,
    required this.nameCh,
  });

  final int id;
  final String nameKo;
  final String? nameEn;
  final String? nameJp;
  final String? nameCh;

  _StationSnapshot copyWith({
    String? nameEn,
    String? nameJp,
    String? nameCh,
  }) {
    return _StationSnapshot(
      id: id,
      nameKo: nameKo,
      nameEn: nameEn ?? this.nameEn,
      nameJp: nameJp ?? this.nameJp,
      nameCh: nameCh ?? this.nameCh,
    );
  }
}
