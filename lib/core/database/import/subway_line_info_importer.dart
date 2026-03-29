import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';

import 'asset_string_loader_stub.dart'
    if (dart.library.ui) 'asset_string_loader_flutter.dart' as asset_loader;
import '../app_database.dart';
import '../line_metadata_catalog.dart';

typedef JsonMap = Map<String, Object?>;
typedef AssetStringLoader = Future<String> Function(String path);

class SubwayLineInfoImportResult {
  const SubwayLineInfoImportResult({
    required this.processedRows,
    required this.insertedLines,
    required this.insertedStations,
    required this.insertedLineStations,
    required this.updatedStations,
    required this.skippedRows,
  });

  final int processedRows;
  final int insertedLines;
  final int insertedStations;
  final int insertedLineStations;
  final int updatedStations;
  final int skippedRows;
}

class SubwayLineInfoImporter {
  SubwayLineInfoImporter(this._database, {AssetStringLoader? assetLoader})
    : _assetLoader = assetLoader ?? asset_loader.loadAssetString;

  static const String defaultAssetPath = 'assets/data/subway_line_info.json';
  static const String defaultRouteAssetPath = 'assets/data/full_route_info.csv';
  static const String defaultBranchKeysAssetPath = 'assets/data/branch_keys.csv';
  static const String defaultDirectionPoliciesAssetPath =
      'assets/data/direction_policies.csv';
  static const String defaultStationTransitionOverridesAssetPath =
      'assets/data/station_transition_overrides.csv';

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
    '경의선',
    '수인분당선',
    '신분당선',
    '공항철도',
    '경춘선',
    '경강선',
    '서해선',
    '인천선',
    '인천2호선',
    '우이신설경전철',
    '신림선',
    '의정부경전철',
    '용인경전철',
    '김포도시철도',
  };

  final AppDatabase _database;
  final AssetStringLoader _assetLoader;

  Future<SubwayLineInfoImportResult> importFromAsset({
    String assetPath = defaultAssetPath,
    String routeAssetPath = defaultRouteAssetPath,
    String branchKeysAssetPath = defaultBranchKeysAssetPath,
    String directionPoliciesAssetPath = defaultDirectionPoliciesAssetPath,
    String stationTransitionOverridesAssetPath =
        defaultStationTransitionOverridesAssetPath,
    Set<String> includedLines = defaultIncludedLines,
    Map<String, LineMetadata> lineMetadataByName = defaultLineMetadataByName,
  }) async {
    final String rawJson = await _assetLoader(assetPath);
    final String rawRouteCsv = await _assetLoader(routeAssetPath);
    final String rawBranchKeysCsv = await _assetLoader(
      branchKeysAssetPath,
    );
    final String rawDirectionPoliciesCsv = await _assetLoader(
      directionPoliciesAssetPath,
    );
    final String rawStationTransitionOverridesCsv = await _assetLoader(
      stationTransitionOverridesAssetPath,
    );
    return importFromJsonString(
      rawJson,
      rawRouteCsv: rawRouteCsv,
      rawBranchKeysCsv: rawBranchKeysCsv,
      rawDirectionPoliciesCsv: rawDirectionPoliciesCsv,
      rawStationTransitionOverridesCsv: rawStationTransitionOverridesCsv,
      includedLines: includedLines,
      lineMetadataByName: lineMetadataByName,
    );
  }

  Future<SubwayLineInfoImportResult> importFromJsonString(
    String rawJson, {
    String? rawRouteCsv,
    String? rawBranchKeysCsv,
    String? rawDirectionPoliciesCsv,
    String? rawStationTransitionOverridesCsv,
    Set<String> includedLines = defaultIncludedLines,
    Map<String, LineMetadata> lineMetadataByName = defaultLineMetadataByName,
  }) async {
    final Object? decoded = jsonDecode(rawJson);

    if (decoded is! JsonMap) {
      throw const FormatException(
        'subway_line_info.json root must be an object.',
      );
    }

    final Object? dataField = decoded['DATA'];
    if (dataField is! List<Object?>) {
      throw const FormatException(
        'subway_line_info.json must contain a DATA array.',
      );
    }

    final List<_SubwayLineInfoRow> rows = dataField
        .whereType<JsonMap>()
        .map(_SubwayLineInfoRow.fromJson)
        .where((row) => includedLines.contains(row.lineNum))
        .toList();
    final _RouteOrderLookup routeOrderLookup = _RouteOrderLookup.fromCsv(
      rawRouteCsv,
    );
    final _BranchCatalog branchCatalog = _BranchCatalog.fromCsv(
      rawBranchKeysCsv,
    );
    final List<_DirectionPolicySeedRow> directionPolicyRows =
        _DirectionPolicySeedRow.fromCsv(rawDirectionPoliciesCsv);
    final List<_StationTransitionOverrideSeedRow> stationTransitionOverrideRows =
        _StationTransitionOverrideSeedRow.fromCsv(
          rawStationTransitionOverridesCsv,
        );

    return _database.transaction(() async {
      int insertedLines = 0;
      int insertedStations = 0;
      int insertedLineStations = 0;
      int updatedStations = 0;

      final Map<String, _LineSnapshot> linesByName = <String, _LineSnapshot>{};
      final Map<String, _StationSnapshot> stationsByName =
          <String, _StationSnapshot>{};
      final Map<String, _LineStationSnapshot> lineStationsByKey =
          <String, _LineStationSnapshot>{};
      final Map<String, DirectionPolicy> directionPoliciesByKey =
          <String, DirectionPolicy>{};
      final Map<String, StationTransitionOverride> stationTransitionOverridesByKey =
          <String, StationTransitionOverride>{};
      final Map<String, int> nextFallbackOrderByLine = <String, int>{};

      final existingLines = await _database.select(_database.lines).get();
      for (final line in existingLines) {
        linesByName[line.name] = _LineSnapshot(
          id: line.id,
          name: line.name,
          color: line.color,
          lineType: line.lineType,
        );
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

      final existingLineStations = await _database
          .select(_database.lineStations)
          .get();
      for (final lineStation in existingLineStations) {
        lineStationsByKey[_buildLineStationKey(
          lineId: lineStation.lineId,
          stationCode: lineStation.stationCode,
          branchKey: lineStation.branchKey,
        )] = _LineStationSnapshot(
          id: lineStation.id,
          lineId: lineStation.lineId,
          stationCode: lineStation.stationCode,
          branchKey: lineStation.branchKey,
        );
      }

      final existingDirectionPolicies = await _database
          .select(_database.directionPolicies)
          .get();
      for (final DirectionPolicy row in existingDirectionPolicies) {
        directionPoliciesByKey[_buildDirectionPolicyKey(
          lineId: row.lineId,
          branchKey: row.branchKey,
          directionKind: row.directionKind,
          apiDirection: row.apiDirection,
          apiTerminalStationCode: row.apiTerminalStationCode,
        )] = row;
      }

      final existingStationTransitionOverrides = await _database
          .select(_database.stationTransitionOverrides)
          .get();
      for (final StationTransitionOverride row
          in existingStationTransitionOverrides) {
        stationTransitionOverridesByKey[_buildStationTransitionOverrideKey(
          lineId: row.lineId,
          currentStationCode: row.currentStationCode,
          nextStationCode: row.nextStationCode,
          apiTerminalStationCode: row.apiTerminalStationCode,
          apiDirection: row.apiDirection,
          resolvedBranchKey: row.resolvedBranchKey,
        )] = row;
      }

      for (final row in rows) {
        final String canonicalLineName = canonicalizeLineName(row.lineNum);
        final LineMetadata? metadata = lineMetadataByName[canonicalLineName];
        final _LineSnapshot? existingLine = linesByName[row.lineNum];

        if (existingLine == null) {
          final int lineId = await _database
              .into(_database.lines)
              .insert(
                LinesCompanion.insert(
                  name: row.lineNum,
                  color: Value(_normalizeValue(metadata?.color)),
                  lineType: Value(_normalizeValue(metadata?.lineType)),
                ),
              );
          linesByName[row.lineNum] = _LineSnapshot(
            id: lineId,
            name: row.lineNum,
            color: _normalizeValue(metadata?.color),
            lineType: _normalizeValue(metadata?.lineType),
          );
          insertedLines++;
        } else if (_shouldUpdateLine(existingLine, metadata)) {
          await (_database.update(
            _database.lines,
          )..where((tbl) => tbl.id.equals(existingLine.id))).write(
            LinesCompanion(
              color: Value(
                _selectUpdatedValue(existingLine.color, metadata?.color),
              ),
              lineType: Value(
                _selectUpdatedValue(existingLine.lineType, metadata?.lineType),
              ),
            ),
          );

          linesByName[row.lineNum] = existingLine.copyWith(
            color: _selectUpdatedValue(existingLine.color, metadata?.color),
            lineType: _selectUpdatedValue(
              existingLine.lineType,
              metadata?.lineType,
            ),
          );
        }

        _StationSnapshot stationSnapshot;
        final _StationSnapshot? existingStation =
            stationsByName[row.stationNameKo];
        if (existingStation == null) {
          final int stationId = await _database
              .into(_database.stations)
              .insert(
                StationsCompanion.insert(
                  nameKo: row.stationNameKo,
                  nameEn: _presentValue(row.stationNameEn),
                  nameJp: _presentValue(row.stationNameJp),
                  nameCh: _presentValue(row.stationNameCh),
                ),
              );
          stationSnapshot = _StationSnapshot(
            id: stationId,
            nameKo: row.stationNameKo,
            nameEn: _normalizeValue(row.stationNameEn),
            nameJp: _normalizeValue(row.stationNameJp),
            nameCh: _normalizeValue(row.stationNameCh),
          );
          stationsByName[row.stationNameKo] = stationSnapshot;
          insertedStations++;
        } else {
          final String? nextNameEn = _mergeValue(
            existingStation.nameEn,
            row.stationNameEn,
          );
          final String? nextNameJp = _mergeValue(
            existingStation.nameJp,
            row.stationNameJp,
          );
          final String? nextNameCh = _mergeValue(
            existingStation.nameCh,
            row.stationNameCh,
          );

          final bool shouldUpdate =
              nextNameEn != existingStation.nameEn ||
              nextNameJp != existingStation.nameJp ||
              nextNameCh != existingStation.nameCh;

          stationSnapshot = shouldUpdate
              ? existingStation.copyWith(
                  nameEn: nextNameEn,
                  nameJp: nextNameJp,
                  nameCh: nextNameCh,
                )
              : existingStation;

          if (shouldUpdate) {
            await (_database.update(
              _database.stations,
            )..where((tbl) => tbl.id.equals(existingStation.id))).write(
              StationsCompanion(
                nameEn: Value(nextNameEn),
                nameJp: Value(nextNameJp),
                nameCh: Value(nextNameCh),
              ),
            );

            stationsByName[row.stationNameKo] = stationSnapshot;
            updatedStations++;
          }
        }

        final _LineSnapshot lineSnapshot = linesByName[row.lineNum]!;
        final int fallbackOrderIndex =
            (nextFallbackOrderByLine[row.lineNum] ?? 0) + 1;
        nextFallbackOrderByLine[row.lineNum] = fallbackOrderIndex;
        final int orderIndex =
            routeOrderLookup.findOrderIndex(
              lineName: canonicalLineName,
              stationName: row.stationNameKo,
            ) ??
            fallbackOrderIndex;

        final List<String> branchKeys = _resolveBranchKeysForRow(
          row: row,
          branchCatalog: branchCatalog,
        );

        for (final String branchKey in branchKeys) {
          final String lineStationKey = _buildLineStationKey(
            lineId: lineSnapshot.id,
            stationCode: row.stationCode,
            branchKey: branchKey,
          );

          if (lineStationsByKey.containsKey(lineStationKey)) {
            continue;
          }

          final int lineStationId = await _database
              .into(_database.lineStations)
              .insert(
                LineStationsCompanion.insert(
                lineId: lineSnapshot.id,
                stationId: stationSnapshot.id,
                stationCode: row.stationCode,
                stationNo: Value(_normalizeValue(row.stationNo)),
                orderIndex: orderIndex,
                branchKey: Value(branchKey),
              ),
            );
          lineStationsByKey[lineStationKey] = _LineStationSnapshot(
            id: lineStationId,
            lineId: lineSnapshot.id,
            stationCode: row.stationCode,
            branchKey: branchKey,
          );
          insertedLineStations++;
        }
      }

      final List<LineStation> insertedRows = await _database
          .select(_database.lineStations)
          .get();
      final Map<String, int> maxOrderIndexByBranch = <String, int>{};
      final Set<String> loopBranchKeys = branchCatalog.loopBranchKeys;
      for (final LineStation row in insertedRows) {
        final String key = '${row.lineId}::${row.branchKey}';
        final int currentMax = maxOrderIndexByBranch[key] ?? -0x7fffffff;
        if (row.orderIndex > currentMax) {
          maxOrderIndexByBranch[key] = row.orderIndex;
        }
      }

      for (final LineStation row in insertedRows) {
        final bool isLoopBranch = loopBranchKeys.contains(row.branchKey);
        final bool isTerminal =
            !isLoopBranch &&
            row.orderIndex == maxOrderIndexByBranch['${row.lineId}::${row.branchKey}'];
        if (row.isTerminal == isTerminal) {
          continue;
        }
        await (_database.update(
          _database.lineStations,
        )..where((tbl) => tbl.id.equals(row.id))).write(
          LineStationsCompanion(isTerminal: Value(isTerminal)),
        );
      }

      for (final _DirectionPolicySeedRow row in directionPolicyRows) {
        final _LineSnapshot? lineSnapshot = linesByName[row.lineName];
        if (lineSnapshot == null) {
          continue;
        }
        final String key = _buildDirectionPolicyKey(
          lineId: lineSnapshot.id,
          branchKey: row.branchKey,
          directionKind: row.directionKind,
          apiDirection: row.apiDirection,
          apiTerminalStationCode: row.apiTerminalStationCode,
        );
        final DirectionPoliciesCompanion companion = DirectionPoliciesCompanion.insert(
          lineId: lineSnapshot.id,
          branchKey: Value(row.branchKey),
          directionKind: row.directionKind,
          apiDirection: Value(row.apiDirection),
          apiTerminalStationCode: Value(row.apiTerminalStationCode),
          displayLabelKo: row.displayLabelKo,
          isActive: Value(row.isActive),
        );
        final DirectionPolicy? existing = directionPoliciesByKey[key];
        if (existing == null) {
          final int id = await _database
              .into(_database.directionPolicies)
              .insert(companion);
          directionPoliciesByKey[key] = DirectionPolicy(
            id: id,
            lineId: lineSnapshot.id,
            branchKey: row.branchKey,
            directionKind: row.directionKind,
            apiDirection: row.apiDirection,
            apiTerminalStationCode: row.apiTerminalStationCode,
            displayLabelKo: row.displayLabelKo,
            isActive: row.isActive,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          continue;
        }
        await (_database.update(
          _database.directionPolicies,
        )..where((tbl) => tbl.id.equals(existing.id))).write(
          DirectionPoliciesCompanion(
            displayLabelKo: Value(row.displayLabelKo),
            isActive: Value(row.isActive),
            apiDirection: Value(row.apiDirection),
            apiTerminalStationCode: Value(row.apiTerminalStationCode),
          ),
        );
      }

      for (final _StationTransitionOverrideSeedRow row
          in stationTransitionOverrideRows) {
        final _LineSnapshot? lineSnapshot = linesByName[row.lineName];
        if (lineSnapshot == null) {
          continue;
        }
        final String key = _buildStationTransitionOverrideKey(
          lineId: lineSnapshot.id,
          currentStationCode: row.currentStationCode,
          nextStationCode: row.nextStationCode,
          apiTerminalStationCode: row.apiTerminalStationCode,
          apiDirection: row.apiDirection,
          resolvedBranchKey: row.resolvedBranchKey,
        );
        final StationTransitionOverridesCompanion companion =
            StationTransitionOverridesCompanion.insert(
              lineId: lineSnapshot.id,
              currentStationCode: row.currentStationCode,
              nextStationCode: row.nextStationCode,
              apiTerminalStationCode: Value(row.apiTerminalStationCode),
              apiTerminalStationName: Value(row.apiTerminalStationName),
              apiDirection: Value(row.apiDirection),
              resolvedBranchKey: row.resolvedBranchKey,
              prevStationCode: Value(row.prevStationCode),
              priority: Value(row.priority),
              note: Value(row.note),
              isActive: Value(row.isActive),
            );
        final StationTransitionOverride? existing =
            stationTransitionOverridesByKey[key];
        if (existing == null) {
          final int id = await _database
              .into(_database.stationTransitionOverrides)
              .insert(companion);
          stationTransitionOverridesByKey[key] = StationTransitionOverride(
            id: id,
            lineId: lineSnapshot.id,
            currentStationCode: row.currentStationCode,
            nextStationCode: row.nextStationCode,
            apiTerminalStationCode: row.apiTerminalStationCode,
            apiTerminalStationName: row.apiTerminalStationName,
            apiDirection: row.apiDirection,
            resolvedBranchKey: row.resolvedBranchKey,
            prevStationCode: row.prevStationCode,
            priority: row.priority,
            note: row.note,
            isActive: row.isActive,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          continue;
        }
        await (_database.update(
          _database.stationTransitionOverrides,
        )..where((tbl) => tbl.id.equals(existing.id))).write(
          StationTransitionOverridesCompanion(
            apiTerminalStationCode: Value(row.apiTerminalStationCode),
            apiTerminalStationName: Value(row.apiTerminalStationName),
            apiDirection: Value(row.apiDirection),
            prevStationCode: Value(row.prevStationCode),
            priority: Value(row.priority),
            note: Value(row.note),
            isActive: Value(row.isActive),
          ),
        );
      }

      return SubwayLineInfoImportResult(
        processedRows: rows.length,
        insertedLines: insertedLines,
        insertedStations: insertedStations,
        insertedLineStations: insertedLineStations,
        updatedStations: updatedStations,
        skippedRows: dataField.length - rows.length,
      );
    });
  }

  Value<String?> _presentValue(String? raw) => Value(_normalizeValue(raw));

  bool _shouldUpdateLine(_LineSnapshot current, LineMetadata? metadata) {
    if (metadata == null) {
      return false;
    }
    return _selectUpdatedValue(current.color, metadata.color) !=
            current.color ||
        _selectUpdatedValue(current.lineType, metadata.lineType) !=
            current.lineType;
  }

  String? _selectUpdatedValue(String? current, String? incoming) {
    return current ?? _normalizeValue(incoming);
  }

  String? _mergeValue(String? current, String? incoming) {
    final String? normalizedIncoming = _normalizeValue(incoming);
    return current ?? normalizedIncoming;
  }

  String? _normalizeValue(String? raw) {
    final String trimmed = raw?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }

  String _buildLineStationKey({
    required int lineId,
    required String stationCode,
    required String branchKey,
  }) {
    return '$lineId::$stationCode::$branchKey';
  }

  String _buildDirectionPolicyKey({
    required int lineId,
    required String branchKey,
    required String directionKind,
    required String? apiDirection,
    required String? apiTerminalStationCode,
  }) {
    return [
      lineId.toString(),
      branchKey,
      directionKind,
      apiDirection ?? '',
      apiTerminalStationCode ?? '',
    ].join('::');
  }

  String _buildStationTransitionOverrideKey({
    required int lineId,
    required String currentStationCode,
    required String nextStationCode,
    required String? apiTerminalStationCode,
    required String? apiDirection,
    required String resolvedBranchKey,
  }) {
    return [
      lineId.toString(),
      currentStationCode,
      nextStationCode,
      apiTerminalStationCode ?? '',
      apiDirection ?? '',
      resolvedBranchKey,
    ].join('::');
  }

  List<String> _resolveBranchKeysForRow({
    required _SubwayLineInfoRow row,
    required _BranchCatalog branchCatalog,
  }) {
    final String mainBranchKey =
        branchCatalog.defaultBranchKeyByLineName[row.lineNum] ??
        _fallbackMainBranchKey(row.lineNum);
    final Set<String> branchKeys = <String>{};
    final String stationName = row.stationNameKo;

    switch (row.lineNum) {
      case '01호선':
        if (!_line1ExclusiveBranchStations.contains(stationName) ||
            _line1JunctionStations.contains(stationName)) {
          branchKeys.add(mainBranchKey);
        }
        if (_line1GyeonginStations.contains(stationName)) {
          branchKeys.add('LINE1_GYEONGIN');
        }
        if (_line1GyeongbuStations.contains(stationName)) {
          branchKeys.add('LINE1_GYEONGBU');
        }
        if (_line1GwangmyeongStations.contains(stationName)) {
          branchKeys.add('LINE1_GWANGMYEONG_SHUTTLE');
        }
        if (_line1SeodongtanStations.contains(stationName)) {
          branchKeys.add('LINE1_SEODONGTAN_SHUTTLE');
        }
        break;
      case '02호선':
        if (!_line2ExclusiveBranchStations.contains(stationName) ||
            _line2JunctionStations.contains(stationName)) {
          branchKeys.add(mainBranchKey);
        }
        if (_line2SeongsuBranchStations.contains(stationName)) {
          branchKeys.add('LINE2_SEONGSU_BRANCH');
        }
        if (_line2SinjeongBranchStations.contains(stationName)) {
          branchKeys.add('LINE2_SINJEONG_BRANCH');
        }
        break;
      case '05호선':
        if (!_line5ExclusiveBranchStations.contains(stationName) ||
            _line5JunctionStations.contains(stationName)) {
          branchKeys.add(mainBranchKey);
        }
        if (_line5HanamBranchStations.contains(stationName)) {
          branchKeys.add('LINE5_HANAM_BRANCH');
        }
        if (_line5MacheonBranchStations.contains(stationName)) {
          branchKeys.add('LINE5_MACHEON_BRANCH');
        }
        break;
      case '06호선':
        if (!_line6LoopExclusiveStations.contains(stationName) ||
            stationName == '응암') {
          branchKeys.add(mainBranchKey);
        }
        if (_line6EungamLoopStations.contains(stationName)) {
          branchKeys.add('LINE6_EUNGAM_LOOP');
        }
        break;
      default:
        branchKeys.add(mainBranchKey);
        break;
    }

    if (branchKeys.isEmpty) {
      branchKeys.add(mainBranchKey);
    }

    return branchKeys.toList()..sort();
  }

  String _fallbackMainBranchKey(String lineName) {
    final String canonicalLineName = canonicalizeLineName(lineName);
    switch (canonicalLineName) {
      case '01호선':
        return 'LINE1_MAIN';
      case '02호선':
        return 'LINE2_MAIN';
      case '03호선':
        return 'LINE3_MAIN';
      case '04호선':
        return 'LINE4_MAIN';
      case '05호선':
        return 'LINE5_MAIN';
      case '06호선':
        return 'LINE6_MAIN';
      case '07호선':
        return 'LINE7_MAIN';
      case '08호선':
        return 'LINE8_MAIN';
      case '09호선':
        return 'LINE9_MAIN';
      case '경의선':
        return 'GJ_MAIN';
      case '경춘선':
        return 'GC_MAIN';
      case '수인분당선':
        return 'SB_MAIN';
      case '공항철도':
        return 'AREX_MAIN';
      case '경강선':
        return 'GYEONGGANG_MAIN';
      case '서해선':
        return 'SEOHAE_MAIN';
      case '인천선':
        return 'INCHEON1_MAIN';
      case '인천2호선':
        return 'INCHEON2_MAIN';
      case '우이신설경전철':
        return 'UI_SINSEOL_MAIN';
      case '신림선':
        return 'SILLIM_MAIN';
      case '의정부경전철':
        return 'UJEONGBU_MAIN';
      case '용인경전철':
        return 'YONGIN_MAIN';
      case '김포도시철도':
        return 'GIMPO_MAIN';
      case '신분당선':
        return 'SINBUNDANG_MAIN';
      case 'GTX-A':
        return 'GTXA_MAIN';
      default:
        return '${canonicalLineName.toUpperCase()}_MAIN';
    }
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

class _LineSnapshot {
  const _LineSnapshot({
    required this.id,
    required this.name,
    required this.color,
    required this.lineType,
  });

  final int id;
  final String name;
  final String? color;
  final String? lineType;

  _LineSnapshot copyWith({String? color, String? lineType}) {
    return _LineSnapshot(
      id: id,
      name: name,
      color: color ?? this.color,
      lineType: lineType ?? this.lineType,
    );
  }
}

class _LineStationSnapshot {
  const _LineStationSnapshot({
    required this.id,
    required this.lineId,
    required this.stationCode,
    required this.branchKey,
  });

  final int id;
  final int lineId;
  final String stationCode;
  final String branchKey;
}

class _DirectionPolicySeedRow {
  const _DirectionPolicySeedRow({
    required this.lineName,
    required this.branchKey,
    required this.directionKind,
    required this.apiDirection,
    required this.apiTerminalStationCode,
    required this.displayLabelKo,
    required this.isActive,
  });

  factory _DirectionPolicySeedRow.fromRow(
    List<dynamic> row,
    Map<String, int> indexByHeader,
  ) {
    return _DirectionPolicySeedRow(
      lineName: _readCsvRequiredString(row, indexByHeader, 'line_name'),
      branchKey: _readCsvRequiredString(row, indexByHeader, 'branch_key'),
      directionKind: _readCsvRequiredString(row, indexByHeader, 'direction_kind'),
      apiDirection: _readCsvOptionalString(row, indexByHeader, 'api_direction'),
      apiTerminalStationCode: _readCsvOptionalString(
        row,
        indexByHeader,
        'api_terminal_station_code',
      ),
      displayLabelKo: _readCsvRequiredString(row, indexByHeader, 'display_label_ko'),
      isActive:
          _readCsvOptionalString(row, indexByHeader, 'is_active') != 'false',
    );
  }

  static List<_DirectionPolicySeedRow> fromCsv(String? rawCsv) {
    return _parseCsvRows(
      rawCsv,
      (row, indexByHeader) => _DirectionPolicySeedRow.fromRow(
        row,
        indexByHeader,
      ),
    );
  }

  final String lineName;
  final String branchKey;
  final String directionKind;
  final String? apiDirection;
  final String? apiTerminalStationCode;
  final String displayLabelKo;
  final bool isActive;
}

class _StationTransitionOverrideSeedRow {
  const _StationTransitionOverrideSeedRow({
    required this.lineName,
    required this.currentStationCode,
    required this.nextStationCode,
    required this.apiTerminalStationCode,
    required this.apiTerminalStationName,
    required this.apiDirection,
    required this.resolvedBranchKey,
    required this.prevStationCode,
    required this.priority,
    required this.note,
    required this.isActive,
  });

  factory _StationTransitionOverrideSeedRow.fromRow(
    List<dynamic> row,
    Map<String, int> indexByHeader,
  ) {
    return _StationTransitionOverrideSeedRow(
      lineName: _readCsvRequiredString(row, indexByHeader, 'line_name'),
      currentStationCode: _readCsvRequiredString(
        row,
        indexByHeader,
        'current_station_code',
      ),
      nextStationCode: _readCsvRequiredString(
        row,
        indexByHeader,
        'next_station_code',
      ),
      apiTerminalStationCode: _readCsvOptionalString(
        row,
        indexByHeader,
        'api_terminal_station_code',
      ),
      apiTerminalStationName: _readCsvOptionalString(
        row,
        indexByHeader,
        'api_terminal_station_name',
      ),
      apiDirection: _readCsvOptionalString(row, indexByHeader, 'api_direction'),
      resolvedBranchKey: _readCsvRequiredString(
        row,
        indexByHeader,
        'resolved_branch_key',
      ),
      prevStationCode: _readCsvOptionalString(
        row,
        indexByHeader,
        'prev_station_code',
      ),
      priority:
          int.tryParse(
            _readCsvOptionalString(row, indexByHeader, 'priority') ?? '',
          ) ??
          0,
      note: _readCsvOptionalString(row, indexByHeader, 'note'),
      isActive:
          _readCsvOptionalString(row, indexByHeader, 'is_active') != 'false',
    );
  }

  static List<_StationTransitionOverrideSeedRow> fromCsv(String? rawCsv) {
    return _parseCsvRows(
      rawCsv,
      (row, indexByHeader) => _StationTransitionOverrideSeedRow.fromRow(
        row,
        indexByHeader,
      ),
    );
  }

  final String lineName;
  final String currentStationCode;
  final String nextStationCode;
  final String? apiTerminalStationCode;
  final String? apiTerminalStationName;
  final String? apiDirection;
  final String resolvedBranchKey;
  final String? prevStationCode;
  final int priority;
  final String? note;
  final bool isActive;
}

List<T> _parseCsvRows<T>(
  String? rawCsv,
  T Function(List<dynamic> row, Map<String, int> indexByHeader) builder,
) {
  if (rawCsv == null || rawCsv.trim().isEmpty) {
    return <T>[];
  }
  final List<List<dynamic>> rows = const CsvToListConverter(
    shouldParseNumbers: false,
    eol: '\n',
  ).convert(rawCsv);
  if (rows.isEmpty) {
    return <T>[];
  }
  final Map<String, int> indexByHeader = <String, int>{};
  for (int index = 0; index < rows.first.length; index++) {
    indexByHeader[rows.first[index].toString().trim()] = index;
  }
  final List<T> result = <T>[];
  for (final List<dynamic> row in rows.skip(1)) {
    result.add(builder(row, indexByHeader));
  }
  return result;
}

String _readCsvRequiredString(
  List<dynamic> row,
  Map<String, int> indexByHeader,
  String header,
) {
  final String? value = _readCsvOptionalString(row, indexByHeader, header);
  if (value == null) {
    throw FormatException('Missing required CSV field: $header');
  }
  return value;
}

String? _readCsvOptionalString(
  List<dynamic> row,
  Map<String, int> indexByHeader,
  String header,
) {
  final int? index = indexByHeader[header];
  if (index == null || row.length <= index) {
    return null;
  }
  final String value = row[index].toString().trim();
  return value.isEmpty ? null : value;
}

class _BranchCatalog {
  const _BranchCatalog({
    required this.defaultBranchKeyByLineName,
    required this.loopBranchKeys,
  });

  factory _BranchCatalog.fromCsv(String? rawCsv) {
    if (rawCsv == null || rawCsv.trim().isEmpty) {
      return const _BranchCatalog(
        defaultBranchKeyByLineName: <String, String>{},
        loopBranchKeys: <String>{},
      );
    }

    final List<List<dynamic>> rows = const CsvToListConverter(
      shouldParseNumbers: false,
      eol: '\n',
    ).convert(rawCsv);
    if (rows.isEmpty) {
      return const _BranchCatalog(
        defaultBranchKeyByLineName: <String, String>{},
        loopBranchKeys: <String>{},
      );
    }

    final List<String> headers = rows.first
        .map((dynamic value) => value.toString().trim())
        .toList();
    final int lineNameIndex = headers.indexOf('line_name');
    final int branchKeyIndex = headers.indexOf('branch_key');
    final int isDefaultIndex = headers.indexOf('is_default');
    final int branchKindIndex = headers.indexOf('branch_kind');

    final Map<String, String> defaultBranchKeyByLineName = <String, String>{};
    final Set<String> loopBranchKeys = <String>{};

    for (final List<dynamic> row in rows.skip(1)) {
      if (row.length <= lineNameIndex ||
          row.length <= branchKeyIndex ||
          row.length <= isDefaultIndex ||
          row.length <= branchKindIndex) {
        continue;
      }

      final String lineName = row[lineNameIndex].toString().trim();
      final String branchKey = row[branchKeyIndex].toString().trim();
      final bool isDefault = row[isDefaultIndex].toString().trim() == 'true';
      final String branchKind = row[branchKindIndex].toString().trim();
      if (lineName.isEmpty || branchKey.isEmpty) {
        continue;
      }
      if (isDefault) {
        defaultBranchKeyByLineName[lineName] = branchKey;
      }
      if (branchKind == 'loop') {
        loopBranchKeys.add(branchKey);
      }
    }

    return _BranchCatalog(
      defaultBranchKeyByLineName: defaultBranchKeyByLineName,
      loopBranchKeys: loopBranchKeys,
    );
  }

  final Map<String, String> defaultBranchKeyByLineName;
  final Set<String> loopBranchKeys;
}

const Set<String> _line1GyeonginStations = <String>{
  '구로',
  '구일',
  '개봉',
  '오류동',
  '온수',
  '역곡',
  '소사',
  '부천',
  '중동',
  '송내',
  '부개',
  '부평',
  '백운',
  '동암',
  '간석',
  '주안',
  '도화',
  '제물포',
  '도원',
  '동인천',
  '인천',
};

const Set<String> _line1JunctionStations = <String>{'구로', '금천구청', '병점'};

const Set<String> _line1GyeongbuStations = <String>{
  '구로',
  '가산디지털단지',
  '독산',
  '금천구청',
  '석수',
  '관악',
  '안양',
  '명학',
  '금정',
  '군포',
  '당정',
  '의왕',
  '성균관대',
  '화서',
  '수원',
  '세류',
  '병점',
  '세마',
  '오산대',
  '오산',
  '진위',
  '송탄',
  '서정리',
  '평택지제',
  '평택',
  '성환',
  '직산',
  '두정',
  '천안',
  '봉명',
  '쌍용',
  '아산',
  '배방',
  '온양온천',
  '신창',
};

const Set<String> _line1GwangmyeongStations = <String>{
  '금천구청',
  '광명',
};

const Set<String> _line1SeodongtanStations = <String>{
  '병점',
  '서동탄',
};

final Set<String> _line1ExclusiveBranchStations = Set<String>.unmodifiable(<String>{
  ..._line1GyeonginStations,
  ..._line1GyeongbuStations,
  ..._line1GwangmyeongStations,
  ..._line1SeodongtanStations,
});

const Set<String> _line2SeongsuBranchStations = <String>{
  '성수',
  '용답',
  '신답',
  '용두',
  '신설동',
};

const Set<String> _line2SinjeongBranchStations = <String>{
  '신도림',
  '도림천',
  '양천구청',
  '신정네거리',
  '까치산',
};

const Set<String> _line2JunctionStations = <String>{'성수', '신도림'};

final Set<String> _line2ExclusiveBranchStations = Set<String>.unmodifiable(<String>{
  ..._line2SeongsuBranchStations,
  ..._line2SinjeongBranchStations,
});

const Set<String> _line5HanamBranchStations = <String>{
  '강동',
  '길동',
  '굽은다리',
  '명일',
  '고덕',
  '상일동',
  '강일',
  '미사',
  '하남풍산',
  '하남시청',
  '하남검단산',
};

const Set<String> _line5MacheonBranchStations = <String>{
  '강동',
  '둔촌동',
  '올림픽공원',
  '방이',
  '오금',
  '개롱',
  '거여',
  '마천',
};

const Set<String> _line5JunctionStations = <String>{'강동'};

final Set<String> _line5ExclusiveBranchStations = Set<String>.unmodifiable(<String>{
  ..._line5HanamBranchStations,
  ..._line5MacheonBranchStations,
});

const Set<String> _line6EungamLoopStations = <String>{
  '응암',
  '역촌',
  '불광',
  '독바위',
  '연신내',
  '구산',
};

const Set<String> _line6LoopExclusiveStations = <String>{
  '역촌',
  '불광',
  '독바위',
  '연신내',
  '구산',
};

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

  _StationSnapshot copyWith({String? nameEn, String? nameJp, String? nameCh}) {
    return _StationSnapshot(
      id: id,
      nameKo: nameKo,
      nameEn: nameEn ?? this.nameEn,
      nameJp: nameJp ?? this.nameJp,
      nameCh: nameCh ?? this.nameCh,
    );
  }
}

class _RouteOrderLookup {
  const _RouteOrderLookup(this._orderIndexByKey);

  factory _RouteOrderLookup.fromCsv(String? rawCsv) {
    if (rawCsv == null || rawCsv.trim().isEmpty) {
      return const _RouteOrderLookup(<String, int>{});
    }

    final List<List<dynamic>> rows = const CsvToListConverter(
      shouldParseNumbers: false,
      eol: '\n',
    ).convert(rawCsv);
    if (rows.isEmpty) {
      return const _RouteOrderLookup(<String, int>{});
    }

    final List<String> headers = rows.first
        .map((dynamic value) => value.toString().trim())
        .toList();
    final int lineIndex = headers.indexOf('노선명');
    final int orderIndex = headers.indexOf('순번');
    final int stationIndex = headers.indexOf('역명');
    if (lineIndex == -1 || orderIndex == -1 || stationIndex == -1) {
      return const _RouteOrderLookup(<String, int>{});
    }

    final Map<String, int> orderIndexByKey = <String, int>{};
    for (final List<dynamic> row in rows.skip(1)) {
      if (row.length <= stationIndex ||
          row.length <= lineIndex ||
          row.length <= orderIndex) {
        continue;
      }

      final String canonicalLineName = canonicalizeLineName(
        row[lineIndex].toString(),
      );
      final String stationName = row[stationIndex].toString().trim();
      final int? parsedOrderIndex = int.tryParse(
        row[orderIndex].toString().trim(),
      );
      if (canonicalLineName.isEmpty ||
          stationName.isEmpty ||
          parsedOrderIndex == null) {
        continue;
      }

      orderIndexByKey.putIfAbsent(
        _buildKey(lineName: canonicalLineName, stationName: stationName),
        () => parsedOrderIndex,
      );
    }
    return _RouteOrderLookup(orderIndexByKey);
  }

  final Map<String, int> _orderIndexByKey;

  int? findOrderIndex({required String lineName, required String stationName}) {
    return _orderIndexByKey[_buildKey(
      lineName: lineName,
      stationName: stationName,
    )];
  }

  static String _buildKey({
    required String lineName,
    required String stationName,
  }) {
    return '$lineName::$stationName';
  }
}
