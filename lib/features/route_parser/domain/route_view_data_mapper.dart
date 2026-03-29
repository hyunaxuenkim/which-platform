import '../../../core/database/app_database.dart';
import '../../../core/database/line_metadata_catalog.dart';
import '../../settings/domain/app_language.dart';
import 'parsed_route_models.dart';
import 'resolved_station_display_name.dart';
import 'station_display_name_formatter.dart';
import 'station_display_name_resolver.dart';
import 'route_view_data.dart';

class RouteViewDataMapper {
  static const String missingInformationText = 'no information';
  static const String defaultLineColorHex = '#9E9E9E';

  const RouteViewDataMapper({
    this.lineColorHexByName = const <String, String>{},
    this.stationDisplayNameResolver = const StationDisplayNameResolver(),
    this.stationDisplayNameFormatter = const StationDisplayNameFormatter(),
  });

  final Map<String, String> lineColorHexByName;
  final StationDisplayNameResolver stationDisplayNameResolver;
  final StationDisplayNameFormatter stationDisplayNameFormatter;

  Future<RouteViewData> mapWithDatabase(
    ParsedRoute route, {
    required AppDatabase database,
    AppLanguage language = AppLanguage.en,
  }) async {
    final RouteViewDataMapperContext databaseContext =
        await RouteViewDataMapperContext.load(database);
    return _map(route, language: language, databaseContext: databaseContext);
  }

  RouteViewData map(
    ParsedRoute route, {
    AppLanguage language = AppLanguage.en,
    RouteViewDataMapperContext? databaseContext,
  }) {
    return _map(route, language: language, databaseContext: databaseContext);
  }

  RouteViewData _map(
    ParsedRoute route, {
    required AppLanguage language,
    RouteViewDataMapperContext? databaseContext,
  }) {
    final StationDisplayNameViewData departureStation =
        route.stationTrail.isEmpty
        ? _missingStationDisplay()
        : _resolveStationViewData(
            language: language,
            rawStationName: route.stationTrail.first,
            stationCode: route.stationTrailCodes.isEmpty
                ? null
                : route.stationTrailCodes.first,
            databaseContext: databaseContext,
          );
    final StationDisplayNameViewData arrivalStation = route.stationTrail.isEmpty
        ? _missingStationDisplay()
        : _resolveStationViewData(
            language: language,
            rawStationName: route.stationTrail.last,
            stationCode: route.stationTrailCodes.isEmpty
                ? null
                : route.stationTrailCodes.last,
            databaseContext: databaseContext,
          );

    return RouteViewData(
      summary: RouteSummaryViewData(
        departureStation: departureStation,
        arrivalStation: arrivalStation,
        totalDurationSeconds: route.totalDurationSeconds,
        totalFare: route.totalFare,
        transferCount: route.transferCount,
        totalDurationText: _formatDuration(route.totalDurationSeconds),
        totalFareText: _formatFare(route.totalFare),
        transferCountText: _formatTransferCount(route.transferCount),
      ),
      legItems: route.legs
          .map((RouteLeg leg) {
            final List<StationDisplayNameViewData> stations =
                _resolveStationSequence(
                  language: language,
                  rawStationNames: leg.stationNames,
                  stationCodes: leg.stationCodes,
                  databaseContext: databaseContext,
                );
            final StationDisplayNameViewData fromStation = stations.isEmpty
                ? _resolveStationViewData(
                    language: language,
                    rawStationName: leg.fromStationName,
                    stationCode: leg.fromStationCode,
                    databaseContext: databaseContext,
                  )
                : stations.first;
            final StationDisplayNameViewData toStation = stations.isEmpty
                ? _resolveStationViewData(
                    language: language,
                    rawStationName: leg.toStationName,
                    stationCode: leg.toStationCode,
                    databaseContext: databaseContext,
                  )
                : stations.last;
            final StationDisplayNameViewData nextStation =
                _resolveStationViewData(
                  language: language,
                  rawStationName: leg.nextStationName,
                  stationCode: leg.nextStationCode,
                  databaseContext: databaseContext,
                );
            final _StationReference? nextNegativeStationReference =
                databaseContext?._resolveNextNegativeStation(leg);
            final StationDisplayNameViewData nextNegativeStation =
                nextNegativeStationReference == null
                ? _missingStationDisplay()
                : _resolveStationViewData(
                    language: language,
                    rawStationName: nextNegativeStationReference.stationName,
                    stationCode: nextNegativeStationReference.stationCode,
                    databaseContext: databaseContext,
                  );
            final StationDisplayNameViewData? terminalStation =
                _hasText(leg.terminalStationName) ||
                    _hasText(leg.terminalStationCode)
                ? _resolveStationViewData(
                    language: language,
                    rawStationName: leg.terminalStationName,
                    stationCode: leg.terminalStationCode,
                    databaseContext: databaseContext,
                  )
                : null;

            return RouteLegItemViewData(
              lineName: _fallbackText(leg.lineName),
              lineColorHex: _resolveLineColorHex(leg.lineName),
              stationCount: leg.stationCount,
              durationSeconds: leg.durationSeconds,
              directionLabel: _fallbackText(leg.directionLabel),
              directionPositiveExamplesText: _buildDirectionPositiveExamples(
                terminalStation: terminalStation,
                toStation: toStation,
              ),
              directionNegativeExamplesText:
                  databaseContext?.resolveDirectionNegativeExamplesText(leg) ??
                  missingInformationText,
              fromStation: fromStation,
              toStation: toStation,
              stations: stations,
              nextStation: nextStation,
              nextNegativeStation: nextNegativeStation,
              stationTrailText: _formatStationTrail(stations),
              stationCountText: _formatStationCount(leg.stationCount),
              durationText: _formatDuration(leg.durationSeconds),
            );
          })
          .toList(growable: false),
      transferItems: route.transfers
          .map(
            (TransferSegment transfer) => RouteTransferItemViewData(
              station: _resolveStationViewData(
                language: language,
                rawStationName: transfer.stationName,
                stationCode: transfer.stationCode,
                databaseContext: databaseContext,
              ),
              fromLineName: _fallbackText(transfer.fromLineName),
              toLineName: _fallbackText(transfer.toLineName),
              toLineColorHex: _resolveLineColorHex(transfer.toLineName),
              walkingTimeSeconds: transfer.durationSeconds,
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

  List<StationDisplayNameViewData> _resolveStationSequence({
    required AppLanguage language,
    required List<String> rawStationNames,
    required List<String> stationCodes,
    required RouteViewDataMapperContext? databaseContext,
  }) {
    return List<StationDisplayNameViewData>.generate(rawStationNames.length, (
      int index,
    ) {
      final String? stationCode = index < stationCodes.length
          ? stationCodes[index]
          : null;
      return _resolveStationViewData(
        language: language,
        rawStationName: rawStationNames[index],
        stationCode: stationCode,
        databaseContext: databaseContext,
      );
    }, growable: false);
  }

  StationDisplayNameViewData _resolveStationViewData({
    required AppLanguage language,
    required String? rawStationName,
    required String? stationCode,
    required RouteViewDataMapperContext? databaseContext,
  }) {
    final ResolvedStationDisplayName resolved = databaseContext == null
        ? stationDisplayNameFormatter.resolve(
            language: language,
            rawStationName: rawStationName,
          )
        : stationDisplayNameResolver.resolve(
            lookup: databaseContext.stationDisplayNameLookup,
            language: language,
            stationCode: stationCode,
            rawStationName: rawStationName,
          );
    return StationDisplayNameViewData(
      primary: resolved.primary,
      secondary: resolved.secondary,
      fullText: resolved.fullText,
    );
  }

  StationDisplayNameViewData _missingStationDisplay() {
    return const StationDisplayNameViewData(
      primary: missingInformationText,
      fullText: missingInformationText,
    );
  }

  String _formatStationTrail(List<StationDisplayNameViewData> stations) {
    final List<String> normalizedStationNames = stations
        .map((StationDisplayNameViewData station) => station.fullText)
        .toList(growable: false);
    if (normalizedStationNames.isEmpty) {
      return missingInformationText;
    }
    return normalizedStationNames.join(' -> ');
  }

  String _buildDirectionPositiveExamples({
    required StationDisplayNameViewData? terminalStation,
    required StationDisplayNameViewData toStation,
  }) {
    final List<String> candidates = <String>[
      if (terminalStation != null) terminalStation.fullText,
      toStation.fullText,
    ];
    return _joinUniqueCandidates(candidates);
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

class RouteViewDataMapperContext {
  const RouteViewDataMapperContext._({
    required this.lineIdByCanonicalName,
    required this.stationDisplayNameLookup,
    required Map<String, List<_OrderedLineStation>>
    orderedLineStationsByBranchKey,
    required Map<int, List<_OrderedLineStation>>
    orderedMainLineStationsByLineId,
    required this.directionPolicyLabelsByBranchKey,
  }) : _orderedLineStationsByBranchKey = orderedLineStationsByBranchKey,
       _orderedMainLineStationsByLineId = orderedMainLineStationsByLineId;

  static Future<RouteViewDataMapperContext> load(AppDatabase database) async {
    final List<Line> lines = await database.select(database.lines).get();
    final List<Station> stations = await database
        .select(database.stations)
        .get();
    final List<LineStation> lineStations = await database
        .select(database.lineStations)
        .get();
    final List<DirectionPolicy> directionPolicies = await database
        .select(database.directionPolicies)
        .get();
    final StationDisplayNameLookup stationDisplayNameLookup =
        await StationDisplayNameLookup.load(database);

    final Map<String, int> lineIdByCanonicalName = <String, int>{};
    for (final Line line in lines) {
      lineIdByCanonicalName[canonicalizeLineName(line.name)] = line.id;
    }

    final Map<int, String> stationNameById = <int, String>{};
    for (final Station station in stations) {
      stationNameById[station.id] = station.nameKo;
    }

    final Map<String, List<_OrderedLineStation>>
    orderedLineStationsByBranchKey = <String, List<_OrderedLineStation>>{};
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
              stationCode: row.stationCode,
              orderIndex: row.orderIndex,
            ),
          );
      if (row.branchKey.endsWith('_MAIN')) {
        orderedMainLineStationsByLineId
            .putIfAbsent(row.lineId, () => <_OrderedLineStation>[])
            .add(
              _OrderedLineStation(
                stationName: stationName,
                stationCode: row.stationCode,
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

    return RouteViewDataMapperContext._(
      lineIdByCanonicalName: lineIdByCanonicalName,
      stationDisplayNameLookup: stationDisplayNameLookup,
      orderedLineStationsByBranchKey: orderedLineStationsByBranchKey,
      orderedMainLineStationsByLineId: orderedMainLineStationsByLineId,
      directionPolicyLabelsByBranchKey: directionPolicyLabelsByBranchKey,
    );
  }

  final Map<String, int> lineIdByCanonicalName;
  final StationDisplayNameLookup stationDisplayNameLookup;
  final Map<String, List<_OrderedLineStation>> _orderedLineStationsByBranchKey;
  final Map<int, List<_OrderedLineStation>> _orderedMainLineStationsByLineId;
  final Map<String, List<String>> directionPolicyLabelsByBranchKey;

  _StationReference? _resolveNextNegativeStation(RouteLeg leg) {
    final int? lineId =
        lineIdByCanonicalName[canonicalizeLineName(leg.lineName)];
    if (lineId == null) {
      return null;
    }

    final String branchLookupKey = '$lineId::${leg.branchKey}';
    final _StationReference? branchResult = _resolveAdjacentOppositeStation(
      rows:
          _orderedLineStationsByBranchKey[branchLookupKey] ??
          const <_OrderedLineStation>[],
      currentStationName: leg.fromStationName,
      nextStationName: leg.nextStationName,
    );
    if (branchResult != null) {
      return branchResult;
    }

    return _resolveAdjacentOppositeStation(
      rows:
          _orderedMainLineStationsByLineId[lineId] ??
          const <_OrderedLineStation>[],
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
    final int? lineId =
        lineIdByCanonicalName[canonicalizeLineName(leg.lineName)];
    if (lineId == null) {
      return null;
    }
    return '$lineId::${leg.branchKey}';
  }

  _StationReference? _resolveAdjacentOppositeStation({
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

    final List<_OrderedLineStation> adjacentRows = <_OrderedLineStation>[];
    if (currentIndex > 0) {
      adjacentRows.add(rows[currentIndex - 1]);
    }
    if (currentIndex + 1 < rows.length) {
      adjacentRows.add(rows[currentIndex + 1]);
    }

    for (final _OrderedLineStation station in adjacentRows) {
      if (station.stationName != nextStationName) {
        return _StationReference(
          stationName: station.stationName,
          stationCode: station.stationCode,
        );
      }
    }
    return null;
  }
}

class _OrderedLineStation {
  const _OrderedLineStation({
    required this.stationName,
    required this.stationCode,
    required this.orderIndex,
  });

  final String stationName;
  final String stationCode;
  final int orderIndex;
}

class _StationReference {
  const _StationReference({
    required this.stationName,
    required this.stationCode,
  });

  final String stationName;
  final String stationCode;
}
