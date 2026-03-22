import '../../../core/database/app_database.dart';
import '../../../core/database/line_metadata_catalog.dart';
import 'parsed_route_models.dart';
import 'route_view_data.dart';

class RouteViewDataMapper {
  static const String missingInformationText = 'no information';
  static const String defaultLineColorHex = '#9E9E9E';

  const RouteViewDataMapper({
    this.lineColorHexByName = const <String, String>{},
  });

  final Map<String, String> lineColorHexByName;

  Future<RouteViewData> mapWithDatabase(
    ParsedRoute route, {
    required AppDatabase database,
  }) async {
    final _RouteViewDatabaseContext databaseContext =
        await _RouteViewDatabaseContext.load(database);
    return _map(route, databaseContext: databaseContext);
  }

  RouteViewData map(ParsedRoute route) {
    return _map(route);
  }

  RouteViewData _map(
    ParsedRoute route, {
    _RouteViewDatabaseContext? databaseContext,
  }) {
    final String departureStationName = route.stationTrail.isEmpty
        ? missingInformationText
        : _fallbackText(route.stationTrail.first);
    final String arrivalStationName = route.stationTrail.isEmpty
        ? missingInformationText
        : _fallbackText(route.stationTrail.last);

    return RouteViewData(
      summary: RouteSummaryViewData(
        departureStationName: departureStationName,
        arrivalStationName: arrivalStationName,
        totalDurationText: _formatDuration(route.totalDurationSeconds),
        totalFareText: _formatFare(route.totalFare),
        transferCountText: _formatTransferCount(route.transferCount),
      ),
      legItems: route.legs
          .map(
            (RouteLeg leg) => RouteLegItemViewData(
              lineName: _fallbackText(leg.lineName),
              lineColorHex: _resolveLineColorHex(leg.lineName),
              directionLabel: _fallbackText(leg.directionLabel),
              directionPositiveExamplesText: _buildDirectionPositiveExamples(
                leg,
              ),
              directionNegativeExamplesText:
                  databaseContext?.resolveDirectionNegativeExamplesText(leg) ??
                  missingInformationText,
              fromStationName: _fallbackText(leg.fromStationName),
              toStationName: _fallbackText(leg.toStationName),
              nextStationName: _fallbackText(leg.nextStationName),
              nextNegativeStationName:
                  databaseContext?.resolveNextNegativeStationName(leg) ??
                  missingInformationText,
              stationTrailText: _formatStationTrail(leg.stationNames),
              stationCountText: _formatStationCount(leg.stationCount),
              durationText: _formatDuration(leg.durationSeconds),
              instructionText: _buildInstructionText(leg),
            ),
          )
          .toList(growable: false),
      transferItems: route.transfers
          .map(
            (TransferSegment transfer) => RouteTransferItemViewData(
              stationName: _fallbackText(transfer.stationName),
              fromLineName: _fallbackText(transfer.fromLineName),
              toLineName: _fallbackText(transfer.toLineName),
              toLineColorHex: _resolveLineColorHex(transfer.toLineName),
              walkingTimeText: _formatDuration(transfer.durationSeconds),
            ),
          )
          .toList(growable: false),
    );
  }

  String _formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainSeconds = seconds % 60;
    if (minutes == 0) {
      return '${remainSeconds}s';
    }
    if (remainSeconds == 0) {
      return '${minutes}m';
    }
    return '${minutes}m ${remainSeconds}s';
  }

  String _formatFare(int fare) {
    return '$fare KRW';
  }

  String _formatTransferCount(int transferCount) {
    return '$transferCount transfer${transferCount == 1 ? '' : 's'}';
  }

  String _formatStationCount(int stationCount) {
    return '$stationCount station${stationCount == 1 ? '' : 's'}';
  }

  String _formatStationTrail(List<String> stationNames) {
    final List<String> normalizedStationNames = stationNames
        .map(_fallbackText)
        .toList(growable: false);
    if (normalizedStationNames.isEmpty) {
      return missingInformationText;
    }
    return normalizedStationNames.join(' -> ');
  }

  String _buildDirectionPositiveExamples(RouteLeg leg) {
    final List<String> candidates = <String>[
      if (_hasText(leg.terminalStationName)) leg.terminalStationName!,
      _fallbackText(leg.toStationName),
    ];
    return _joinUniqueCandidates(candidates);
  }

  String _buildInstructionText(RouteLeg leg) {
    final String directionTarget = _firstAvailable(<String?>[
      leg.terminalStationName,
      leg.directionLabel,
      leg.nextStationName,
    ]);
    return 'Follow signs to $directionTarget';
  }

  String _joinUniqueCandidates(List<String> values) {
    final List<String> unique = <String>[];
    for (final String value in values) {
      if (!_hasText(value) || value == missingInformationText) {
        continue;
      }
      if (!unique.contains(value)) {
        unique.add(value);
      }
    }
    if (unique.isEmpty) {
      return missingInformationText;
    }
    return unique.join(', ');
  }

  String _firstAvailable(List<String?> values) {
    for (final String? value in values) {
      if (_hasText(value)) {
        return value!.trim();
      }
    }
    return missingInformationText;
  }

  bool _hasText(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  String _fallbackText(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return missingInformationText;
    }
    return trimmed;
  }

  String _resolveLineColorHex(String? lineName) {
    final String resolvedLineName = canonicalizeLineName(
      _fallbackText(lineName),
    );
    return lineColorHexByName[resolvedLineName] ?? defaultLineColorHex;
  }
}

class _RouteViewDatabaseContext {
  const _RouteViewDatabaseContext({
    required this.lineIdByCanonicalName,
    required this.orderedLineStationsByBranchKey,
    required this.orderedMainLineStationsByLineId,
    required this.directionPolicyLabelsByBranchKey,
  });

  static Future<_RouteViewDatabaseContext> load(AppDatabase database) async {
    final List<Line> lines = await database.select(database.lines).get();
    final List<Station> stations = await database.select(database.stations).get();
    final List<LineStation> lineStations = await database
        .select(database.lineStations)
        .get();
    final List<DirectionPolicy> directionPolicies = await database
        .select(database.directionPolicies)
        .get();

    final Map<String, int> lineIdByCanonicalName = <String, int>{};
    for (final Line line in lines) {
      lineIdByCanonicalName[canonicalizeLineName(line.name)] = line.id;
    }

    final Map<int, String> stationNameById = <int, String>{};
    for (final Station station in stations) {
      stationNameById[station.id] = station.nameKo;
    }

    final Map<String, List<_OrderedLineStation>> orderedLineStationsByBranchKey =
        <String, List<_OrderedLineStation>>{};
    final Map<int, List<_OrderedLineStation>> orderedMainLineStationsByLineId =
        <int, List<_OrderedLineStation>>{};
    for (final LineStation row in lineStations) {
      final String? stationName = stationNameById[row.stationId];
      if (stationName == null) {
        continue;
      }
      final String key = '${row.lineId}::${row.branchKey}';
      orderedLineStationsByBranchKey
          .putIfAbsent(key, () => <_OrderedLineStation>[])
          .add(
            _OrderedLineStation(
              stationName: stationName,
              orderIndex: row.orderIndex,
            ),
          );
      if (row.branchKey.endsWith('_MAIN')) {
        orderedMainLineStationsByLineId
            .putIfAbsent(row.lineId, () => <_OrderedLineStation>[])
            .add(
              _OrderedLineStation(
                stationName: stationName,
                orderIndex: row.orderIndex,
              ),
            );
      }
    }
    for (final List<_OrderedLineStation> rows
        in orderedLineStationsByBranchKey.values) {
      rows.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }
    for (final List<_OrderedLineStation> rows
        in orderedMainLineStationsByLineId.values) {
      rows.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }

    final Map<String, List<String>> directionPolicyLabelsByBranchKey =
        <String, List<String>>{};
    for (final DirectionPolicy row in directionPolicies.where(
      (policy) => policy.isActive,
    )) {
      final String key = '${row.lineId}::${row.branchKey}';
      final List<String> labels = directionPolicyLabelsByBranchKey.putIfAbsent(
        key,
        () => <String>[],
      );
      if (!labels.contains(row.displayLabelKo)) {
        labels.add(row.displayLabelKo);
      }
    }

    return _RouteViewDatabaseContext(
      lineIdByCanonicalName: lineIdByCanonicalName,
      orderedLineStationsByBranchKey: orderedLineStationsByBranchKey,
      orderedMainLineStationsByLineId: orderedMainLineStationsByLineId,
      directionPolicyLabelsByBranchKey: directionPolicyLabelsByBranchKey,
    );
  }

  final Map<String, int> lineIdByCanonicalName;
  final Map<String, List<_OrderedLineStation>> orderedLineStationsByBranchKey;
  final Map<int, List<_OrderedLineStation>> orderedMainLineStationsByLineId;
  final Map<String, List<String>> directionPolicyLabelsByBranchKey;

  String? resolveNextNegativeStationName(RouteLeg leg) {
    final int? lineId = lineIdByCanonicalName[canonicalizeLineName(leg.lineName)];
    if (lineId == null) {
      return null;
    }

    final String branchLookupKey = '$lineId::${leg.branchKey}';
    final String? branchResult = _resolveAdjacentOppositeStationName(
      rows: orderedLineStationsByBranchKey[branchLookupKey] ?? const <_OrderedLineStation>[],
      currentStationName: leg.fromStationName,
      nextStationName: leg.nextStationName,
    );
    if (branchResult != null) {
      return branchResult;
    }

    return _resolveAdjacentOppositeStationName(
      rows: orderedMainLineStationsByLineId[lineId] ?? const <_OrderedLineStation>[],
      currentStationName: leg.fromStationName,
      nextStationName: leg.nextStationName,
    );
  }

  String? resolveDirectionNegativeExamplesText(RouteLeg leg) {
    final String? branchLookupKey = _buildBranchLookupKey(leg);
    if (branchLookupKey == null) {
      return null;
    }

    final List<String> labels =
        directionPolicyLabelsByBranchKey[branchLookupKey] ?? const <String>[];
    final List<String> negatives = labels
        .where((label) => label != leg.directionLabel)
        .toList(growable: false);
    if (negatives.isEmpty) {
      return null;
    }
    return negatives.take(2).join(', ');
  }

  String? _buildBranchLookupKey(RouteLeg leg) {
    final int? lineId = lineIdByCanonicalName[canonicalizeLineName(leg.lineName)];
    if (lineId == null) {
      return null;
    }
    return '$lineId::${leg.branchKey}';
  }

  String? _resolveAdjacentOppositeStationName({
    required List<_OrderedLineStation> rows,
    required String currentStationName,
    required String? nextStationName,
  }) {
    if (rows.isEmpty) {
      return null;
    }

    final int currentIndex = rows.indexWhere(
      (row) => row.stationName == currentStationName,
    );
    if (currentIndex < 0) {
      return null;
    }

    final List<String> adjacentNames = <String>[];
    if (currentIndex > 0) {
      adjacentNames.add(rows[currentIndex - 1].stationName);
    }
    if (currentIndex + 1 < rows.length) {
      adjacentNames.add(rows[currentIndex + 1].stationName);
    }

    for (final String stationName in adjacentNames) {
      if (stationName != nextStationName) {
        return stationName;
      }
    }
    return null;
  }
}

class _OrderedLineStation {
  const _OrderedLineStation({
    required this.stationName,
    required this.orderIndex,
  });

  final String stationName;
  final int orderIndex;
}
