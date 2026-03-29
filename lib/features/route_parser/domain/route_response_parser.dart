import '../../../core/database/app_database.dart';
import '../../../core/database/line_metadata_catalog.dart';
import 'route_api_response_dto.dart';
import 'parsed_route_models.dart';

class RouteResponseParser {
  const RouteResponseParser({
    DirectionLabelResolver directionLabelResolver =
        const DirectionLabelResolver(),
  }) : _directionLabelResolver = directionLabelResolver;

  final DirectionLabelResolver _directionLabelResolver;

  Future<ParsedRouteParseResult> parseWithDatabase(
    RouteApiResponseDto response, {
    required AppDatabase database,
  }) async {
    final _DatabasePolicyContext context = await _DatabasePolicyContext.load(
      database,
    );
    return _parseInternal(response, policyContext: context);
  }

  ParsedRouteParseResult parse(RouteApiResponseDto response) {
    return _parseInternal(response);
  }

  ParsedRouteParseResult _parseInternal(
    RouteApiResponseDto response, {
    _DatabasePolicyContext? policyContext,
  }) {
    final RouteApiBodyDto? body = response.body;
    if (body == null) {
      return const ParsedRouteParseResult.failure(
        code: ParseFailureCode.missingBody,
        message: 'response.body is missing.',
      );
    }

    final List<RouteApiPathDto>? paths = body.paths;
    if (paths == null) {
      return const ParsedRouteParseResult.failure(
        code: ParseFailureCode.missingPaths,
        message: 'response.body.paths is missing.',
      );
    }

    if (paths.isEmpty) {
      return const ParsedRouteParseResult.failure(
        code: ParseFailureCode.emptyPaths,
        message: 'response.body.paths is empty.',
      );
    }

    final List<RawPathSegment> rawSegments = <RawPathSegment>[];
    RawPathSegment? previousRideSegment;
    for (int pathIndex = 0; pathIndex < paths.length; pathIndex++) {
      final _NormalizedPathResult normalizedPath = _normalizePath(
        path: paths[pathIndex],
        pathIndex: pathIndex,
        previousRideSegment: previousRideSegment,
        policyContext: policyContext,
      );
      if (normalizedPath.failure != null) {
        return normalizedPath.failure!;
      }
      final RawPathSegment segment = normalizedPath.segment!;
      rawSegments.add(segment);
      if (segment.isTransfer) {
        previousRideSegment = null;
      } else {
        previousRideSegment = segment;
      }
    }

    final ParsedRouteParseFailure? shapeFailure = _validateRawSegments(
      rawSegments,
    );
    if (shapeFailure != null) {
      return shapeFailure;
    }

    final List<RideSegment> rideSegments = rawSegments
        .where((RawPathSegment segment) => !segment.isTransfer)
        .map(_toRideSegment)
        .toList(growable: false);
    final List<TransferSegment> transferSegments = rawSegments
        .where((RawPathSegment segment) => segment.isTransfer)
        .map(_toTransferSegment)
        .toList(growable: false);

    if (rideSegments.isEmpty) {
      return const ParsedRouteParseResult.failure(
        code: ParseFailureCode.invalidPathShape,
        message: 'No ride segments found in response.',
      );
    }

    final List<RouteLeg> legs = _buildLegs(
      rideSegments,
      rawSegments,
      policyContext: policyContext,
    );
    final List<String> stationTrail = _buildStationTrail(rideSegments);
    final List<String> stationTrailCodes = _buildStationTrailCodes(
      rideSegments,
    );

    return ParsedRouteParseResult.success(
      route: ParsedRoute(
        totalDurationSeconds: body.totalreqHr ?? 0,
        totalFare: body.totalCardCrg ?? 0,
        transferCount: body.trsitNmtm ?? transferSegments.length,
        legs: legs,
        transfers: transferSegments,
        stationTrail: stationTrail,
        stationTrailCodes: stationTrailCodes,
        rawPathCount: rawSegments.length,
      ),
    );
  }

  _NormalizedPathResult _normalizePath({
    required RouteApiPathDto path,
    required int pathIndex,
    required RawPathSegment? previousRideSegment,
    required _DatabasePolicyContext? policyContext,
  }) {
    final RouteApiStationDto? departureStation = path.departureStation;
    final RouteApiStationDto? arrivalStation = path.arrivalStation;
    if (departureStation == null) {
      return _NormalizedPathResult.failure(
        _invalidPathFailure(
          pathIndex: pathIndex,
          message: 'paths[$pathIndex].departureStation is missing.',
        ),
      );
    }
    if (arrivalStation == null) {
      return _NormalizedPathResult.failure(
        _invalidPathFailure(
          pathIndex: pathIndex,
          message: 'paths[$pathIndex].arrivalStation is missing.',
        ),
      );
    }

    final String? departureStationCode = _normalizeNullableText(
      departureStation.stationCode,
    );
    final String? departureStationName = _normalizeNullableText(
      departureStation.stationName,
    );
    final String? departureLineName = _normalizeNullableText(
      departureStation.lineName,
    );
    final String? arrivalStationCode = _normalizeNullableText(
      arrivalStation.stationCode,
    );
    final String? arrivalStationName = _normalizeNullableText(
      arrivalStation.stationName,
    );
    final String? arrivalLineName = _normalizeNullableText(
      arrivalStation.lineName,
    );
    final String? transferYn = _normalizeNullableText(path.transferYn);
    final List<String> missingFields = <String>[
      if (departureStationCode == null) 'departureStation.stationCode',
      if (departureStationName == null) 'departureStation.stationName',
      if (departureLineName == null) 'departureStation.lineName',
      if (arrivalStationCode == null) 'arrivalStation.stationCode',
      if (arrivalStationName == null) 'arrivalStation.stationName',
      if (arrivalLineName == null) 'arrivalStation.lineName',
      if (path.sectionDistanceMeters == null) 'sectionDistanceMeters',
      if (path.sectionDurationSeconds == null) 'sectionDurationSeconds',
      if (path.waitingSeconds == null) 'waitingSeconds',
      if (transferYn == null) 'transferYn',
    ];

    if (missingFields.isNotEmpty) {
      return _NormalizedPathResult.failure(
        _invalidPathFailure(
          pathIndex: pathIndex,
          message:
              'paths[$pathIndex] is missing required fields: ${missingFields.join(', ')}.',
        ),
      );
    }

    if (transferYn != 'Y' && transferYn != 'N') {
      return _NormalizedPathResult.failure(
        _invalidPathFailure(
          pathIndex: pathIndex,
          message:
              'paths[$pathIndex].transferYn must be "Y" or "N", got "$transferYn".',
        ),
      );
    }
    final bool isTransfer = transferYn == 'Y';

    final String branchKey =
        policyContext?.resolveBranchKey(
          lineName: departureLineName!,
          currentStationCode: departureStationCode!,
          nextStationCode: arrivalStationCode!,
          terminalStationCode: _normalizeNullableText(path.terminalStationCode),
          apiDirection: _normalizeNullableText(path.apiDirection),
          previousRideSegment: previousRideSegment,
        ) ??
        _normalizeNullableText(departureStation.branchLineName) ??
        _normalizeNullableText(arrivalStation.branchLineName) ??
        'MAIN';
    final String servicePatternKey =
        _normalizeNullableText(path.nonstopYn) == 'Y' ? 'NONSTOP' : 'LOCAL';

    return _NormalizedPathResult.success(
      RawPathSegment(
        departureStationCode: departureStationCode!,
        departureStationName: departureStationName!,
        departureLineName: departureLineName!,
        departureBranchLineName: _normalizeNullableText(
          departureStation.branchLineName,
        ),
        arrivalStationCode: arrivalStationCode!,
        arrivalStationName: arrivalStationName!,
        arrivalLineName: arrivalLineName!,
        arrivalBranchLineName: _normalizeNullableText(
          arrivalStation.branchLineName,
        ),
        terminalStationCode: _normalizeNullableText(path.terminalStationCode),
        terminalStationName: _normalizeNullableText(path.terminalStationName),
        apiDirection: _normalizeNullableText(path.apiDirection),
        distanceMeters: path.sectionDistanceMeters!,
        durationSeconds: path.sectionDurationSeconds!,
        waitingSeconds: path.waitingSeconds!,
        isTransfer: isTransfer,
        trainNo: _normalizeNullableText(path.trainNo),
        trainDepartureTime: _normalizeNullableText(path.trainDepartureTime),
        trainArrivalTime: _normalizeNullableText(path.trainArrivalTime),
        servicePatternKey: servicePatternKey,
        branchKey: branchKey,
      ),
    );
  }

  ParsedRouteParseFailure _invalidPathFailure({
    required int pathIndex,
    required String message,
  }) {
    return ParsedRouteParseFailure(
      code: ParseFailureCode.invalidPathShape,
      message: 'Invalid path at index $pathIndex. $message',
    );
  }

  ParsedRouteParseFailure? _validateRawSegments(List<RawPathSegment> segments) {
    if (segments.isEmpty) {
      return const ParsedRouteParseFailure(
        code: ParseFailureCode.emptyPaths,
        message: 'Normalized paths are empty.',
      );
    }

    if (segments.first.isTransfer) {
      return const ParsedRouteParseFailure(
        code: ParseFailureCode.invalidPathShape,
        message: 'First path cannot be a transfer segment.',
      );
    }

    if (segments.last.isTransfer) {
      return const ParsedRouteParseFailure(
        code: ParseFailureCode.invalidPathShape,
        message: 'Last path cannot be a transfer segment.',
      );
    }

    for (int i = 1; i < segments.length; i++) {
      if (segments[i - 1].isTransfer && segments[i].isTransfer) {
        return ParsedRouteParseFailure(
          code: ParseFailureCode.invalidPathShape,
          message:
              'Consecutive transfer segments are not allowed at paths[${i - 1}] and [$i].',
        );
      }

      if (!_segmentsConnect(segments[i - 1], segments[i])) {
        return ParsedRouteParseFailure(
          code: ParseFailureCode.invalidPathShape,
          message: 'Path connectivity breaks between paths[${i - 1}] and [$i].',
        );
      }
    }

    return null;
  }

  bool _segmentsConnect(RawPathSegment previous, RawPathSegment current) {
    return previous.arrivalStationCode == current.departureStationCode &&
        previous.arrivalStationName == current.departureStationName;
  }

  RideSegment _toRideSegment(RawPathSegment segment) {
    return RideSegment(
      fromStationCode: segment.departureStationCode,
      fromStationName: segment.departureStationName,
      toStationCode: segment.arrivalStationCode,
      toStationName: segment.arrivalStationName,
      lineName: segment.departureLineName,
      terminalStationName: segment.terminalStationName,
      terminalStationCode: segment.terminalStationCode,
      apiDirection: segment.apiDirection,
      durationSeconds: segment.durationSeconds,
      distanceMeters: segment.distanceMeters,
      trainNo: segment.trainNo,
      branchKey: segment.branchKey,
      servicePatternKey: segment.servicePatternKey,
    );
  }

  TransferSegment _toTransferSegment(RawPathSegment segment) {
    return TransferSegment(
      stationName: segment.departureStationName,
      stationCode: segment.departureStationCode,
      fromLineName: segment.departureLineName,
      toLineName: segment.arrivalLineName,
      durationSeconds: segment.durationSeconds,
      distanceMeters: segment.distanceMeters,
      waitingSeconds: segment.waitingSeconds,
    );
  }

  List<RouteLeg> _buildLegs(
    List<RideSegment> rideSegments,
    List<RawPathSegment> rawSegments, {
    _DatabasePolicyContext? policyContext,
  }) {
    final List<List<RideSegment>> groups = <List<RideSegment>>[];
    int rideIndex = 0;
    RideSegment? previousRideSegment;

    for (int i = 0; i < rawSegments.length; i++) {
      final RawPathSegment rawSegment = rawSegments[i];
      if (rawSegment.isTransfer) {
        continue;
      }

      final RideSegment rideSegment = rideSegments[rideIndex];
      final bool shouldStartNewGroup =
          groups.isEmpty ||
          (i > 0 && rawSegments[i - 1].isTransfer) ||
          previousRideSegment == null ||
          !_canMergeIntoSameLeg(previousRideSegment, rideSegment);

      if (shouldStartNewGroup) {
        groups.add(<RideSegment>[rideSegment]);
      } else {
        groups.last.add(rideSegment);
      }

      previousRideSegment = rideSegment;
      rideIndex += 1;
    }

    return groups
        .map((group) => _buildLeg(group, policyContext: policyContext))
        .toList(growable: false);
  }

  bool _canMergeIntoSameLeg(RideSegment previous, RideSegment current) {
    return previous.lineName == current.lineName &&
        previous.branchKey == current.branchKey &&
        previous.servicePatternKey == current.servicePatternKey &&
        previous.apiDirection == current.apiDirection &&
        previous.terminalStationCode == current.terminalStationCode &&
        previous.terminalStationName == current.terminalStationName;
  }

  RouteLeg _buildLeg(
    List<RideSegment> segments, {
    _DatabasePolicyContext? policyContext,
  }) {
    final RideSegment first = segments.first;
    final RideSegment last = segments.last;
    final List<String> stationNames = <String>[
      first.fromStationName,
      ...segments.map((RideSegment segment) => segment.toStationName),
    ];
    final List<String> stationCodes = <String>[
      first.fromStationCode,
      ...segments.map((RideSegment segment) => segment.toStationCode),
    ];

    return RouteLeg(
      lineName: first.lineName,
      fromStationName: first.fromStationName,
      fromStationCode: first.fromStationCode,
      toStationName: last.toStationName,
      toStationCode: last.toStationCode,
      stationNames: stationNames,
      stationCodes: stationCodes,
      stationCount: stationNames.length,
      directionLabel:
          policyContext?.resolveDirectionLabel(
            lineName: first.lineName,
            branchKey: first.branchKey,
            apiDirection: first.apiDirection,
            terminalStationCode: first.terminalStationCode,
          ) ??
          _directionLabelResolver.resolve(
            lineName: first.lineName,
            apiDirection: first.apiDirection,
            terminalStationName: first.terminalStationName,
            terminalStationCode: first.terminalStationCode,
            branchKey: first.branchKey,
            servicePatternKey: first.servicePatternKey,
          ),
      apiDirection: first.apiDirection,
      terminalStationName: first.terminalStationName,
      terminalStationCode: first.terminalStationCode,
      servicePatternKey: first.servicePatternKey,
      branchKey: first.branchKey,
      nextStationName: first.toStationName,
      nextStationCode: first.toStationCode,
      durationSeconds: segments.fold<int>(
        0,
        (int total, RideSegment segment) => total + segment.durationSeconds,
      ),
      distanceMeters: segments.fold<int>(
        0,
        (int total, RideSegment segment) => total + segment.distanceMeters,
      ),
      segmentCount: segments.length,
    );
  }

  List<String> _buildStationTrail(List<RideSegment> rideSegments) {
    return <String>[
      rideSegments.first.fromStationName,
      ...rideSegments.map((RideSegment segment) => segment.toStationName),
    ];
  }

  List<String> _buildStationTrailCodes(List<RideSegment> rideSegments) {
    return <String>[
      rideSegments.first.fromStationCode,
      ...rideSegments.map((RideSegment segment) => segment.toStationCode),
    ];
  }

  String? _normalizeNullableText(String? value) {
    final String trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }
}

class _NormalizedPathResult {
  const _NormalizedPathResult.success(this.segment) : failure = null;

  const _NormalizedPathResult.failure(this.failure) : segment = null;

  final RawPathSegment? segment;
  final ParsedRouteParseFailure? failure;
}

class DirectionLabelResolver {
  const DirectionLabelResolver();

  String resolve({
    required String lineName,
    required String? apiDirection,
    required String? terminalStationName,
    required String? terminalStationCode,
    required String branchKey,
    required String servicePatternKey,
  }) {
    final bool isMainLineTwo =
        lineName == '2호선' && (branchKey == 'MAIN' || branchKey == 'LINE2_MAIN');
    if (lineName == '1호선' && terminalStationName != null) {
      return '$terminalStationName행';
    }
    if (isMainLineTwo && apiDirection == '내선') {
      return '내선순환';
    }
    if (isMainLineTwo && apiDirection == '외선') {
      return '외선순환';
    }
    if (lineName == '2호선' &&
        branchKey != 'MAIN' &&
        branchKey != 'LINE2_MAIN' &&
        terminalStationName != null) {
      return '$terminalStationName행';
    }
    if (terminalStationName != null) {
      return '$terminalStationName행';
    }
    return apiDirection ?? '방향 미정';
  }
}

class _DatabasePolicyContext {
  const _DatabasePolicyContext({
    required this.lineIdByCanonicalName,
    required this.defaultMainBranchKeyByLineId,
    required this.branchStationCodesByLineId,
    required this.directionPoliciesByLineId,
    required this.stationTransitionOverridesByLineId,
  });

  static Future<_DatabasePolicyContext> load(AppDatabase database) async {
    final List<Line> lines = await database.select(database.lines).get();
    final List<LineStation> lineStations = await database
        .select(database.lineStations)
        .get();
    final List<DirectionPolicy> directionPolicies = await database
        .select(database.directionPolicies)
        .get();
    final List<StationTransitionOverride> stationTransitionOverrides =
        await database.select(database.stationTransitionOverrides).get();

    final Map<String, int> lineIdByCanonicalName = <String, int>{};
    final Map<int, String> defaultMainBranchKeyByLineId = <int, String>{};
    for (final Line line in lines) {
      final String canonicalLineName = canonicalizeLineName(line.name);
      lineIdByCanonicalName[canonicalLineName] = line.id;
      defaultMainBranchKeyByLineId[line.id] = _fallbackMainBranchKey(
        canonicalLineName,
      );
    }

    final Map<int, Map<String, Set<String>>> branchStationCodesByLineId =
        <int, Map<String, Set<String>>>{};
    for (final LineStation row in lineStations) {
      final Map<String, Set<String>> byBranch = branchStationCodesByLineId
          .putIfAbsent(row.lineId, () => <String, Set<String>>{});
      final Set<String> stationCodes = byBranch.putIfAbsent(
        row.branchKey,
        () => <String>{},
      );
      stationCodes.add(row.stationCode);
      if (row.branchKey.endsWith('_MAIN')) {
        defaultMainBranchKeyByLineId[row.lineId] = row.branchKey;
      }
    }

    final Map<int, List<DirectionPolicy>> directionPoliciesByLineId =
        <int, List<DirectionPolicy>>{};
    for (final DirectionPolicy row in directionPolicies) {
      directionPoliciesByLineId
          .putIfAbsent(row.lineId, () => <DirectionPolicy>[])
          .add(row);
    }

    final Map<int, List<StationTransitionOverride>>
    stationTransitionOverridesByLineId =
        <int, List<StationTransitionOverride>>{};
    for (final StationTransitionOverride row in stationTransitionOverrides) {
      stationTransitionOverridesByLineId
          .putIfAbsent(row.lineId, () => <StationTransitionOverride>[])
          .add(row);
    }

    return _DatabasePolicyContext(
      lineIdByCanonicalName: lineIdByCanonicalName,
      defaultMainBranchKeyByLineId: defaultMainBranchKeyByLineId,
      branchStationCodesByLineId: branchStationCodesByLineId,
      directionPoliciesByLineId: directionPoliciesByLineId,
      stationTransitionOverridesByLineId: stationTransitionOverridesByLineId,
    );
  }

  final Map<String, int> lineIdByCanonicalName;
  final Map<int, String> defaultMainBranchKeyByLineId;
  final Map<int, Map<String, Set<String>>> branchStationCodesByLineId;
  final Map<int, List<DirectionPolicy>> directionPoliciesByLineId;
  final Map<int, List<StationTransitionOverride>>
  stationTransitionOverridesByLineId;

  String resolveBranchKey({
    required String lineName,
    required String currentStationCode,
    required String nextStationCode,
    required String? terminalStationCode,
    required String? apiDirection,
    required RawPathSegment? previousRideSegment,
  }) {
    final String canonicalLineName = canonicalizeLineName(lineName);
    final int? lineId = lineIdByCanonicalName[canonicalLineName];
    if (lineId == null) {
      return _fallbackMainBranchKey(canonicalLineName);
    }

    final List<String> candidateBranchKeys = _resolveCandidateBranchKeys(
      lineId: lineId,
      currentStationCode: currentStationCode,
      nextStationCode: nextStationCode,
    );

    final StationTransitionOverride? override = _resolveOverride(
      lineId: lineId,
      currentStationCode: currentStationCode,
      nextStationCode: nextStationCode,
      terminalStationCode: terminalStationCode,
      apiDirection: apiDirection,
    );
    if (override != null) {
      return override.resolvedBranchKey;
    }

    if (candidateBranchKeys.length == 1) {
      return candidateBranchKeys.single;
    }

    if (previousRideSegment != null &&
        previousRideSegment.departureLineName == lineName &&
        previousRideSegment.branchKey.isNotEmpty &&
        candidateBranchKeys.contains(previousRideSegment.branchKey)) {
      return previousRideSegment.branchKey;
    }

    return defaultMainBranchKeyByLineId[lineId] ??
        _fallbackMainBranchKey(canonicalLineName);
  }

  String? resolveDirectionLabel({
    required String lineName,
    required String branchKey,
    required String? apiDirection,
    required String? terminalStationCode,
  }) {
    final String canonicalLineName = canonicalizeLineName(lineName);
    final int? lineId = lineIdByCanonicalName[canonicalLineName];
    if (lineId == null) {
      return null;
    }

    final Iterable<DirectionPolicy> candidates =
        (directionPoliciesByLineId[lineId] ?? const <DirectionPolicy>[])
            .where((row) => row.isActive && row.branchKey == branchKey)
            .where(
              (row) =>
                  row.apiDirection == null || row.apiDirection == apiDirection,
            )
            .where(
              (row) =>
                  row.apiTerminalStationCode == null ||
                  row.apiTerminalStationCode == terminalStationCode,
            );

    final List<DirectionPolicy> sorted = candidates.toList()
      ..sort(
        (a, b) => _directionPolicyScore(b).compareTo(_directionPolicyScore(a)),
      );
    if (sorted.isEmpty) {
      return null;
    }
    return sorted.first.displayLabelKo;
  }

  List<String> _resolveCandidateBranchKeys({
    required int lineId,
    required String currentStationCode,
    required String nextStationCode,
  }) {
    final Map<String, Set<String>> byBranch =
        branchStationCodesByLineId[lineId] ?? const <String, Set<String>>{};
    final List<String> result = <String>[];
    for (final MapEntry<String, Set<String>> entry in byBranch.entries) {
      if (entry.value.contains(currentStationCode) &&
          entry.value.contains(nextStationCode)) {
        result.add(entry.key);
      }
    }
    result.sort();
    return result;
  }

  StationTransitionOverride? _resolveOverride({
    required int lineId,
    required String currentStationCode,
    required String nextStationCode,
    required String? terminalStationCode,
    required String? apiDirection,
  }) {
    final List<StationTransitionOverride> candidates =
        (stationTransitionOverridesByLineId[lineId] ??
                const <StationTransitionOverride>[])
            .where((row) => row.isActive)
            .where((row) => row.currentStationCode == currentStationCode)
            .where((row) => row.nextStationCode == nextStationCode)
            .where(
              (row) =>
                  row.apiTerminalStationCode == null ||
                  row.apiTerminalStationCode == terminalStationCode,
            )
            .where(
              (row) =>
                  row.apiDirection == null || row.apiDirection == apiDirection,
            )
            .toList();
    if (candidates.isEmpty) {
      return null;
    }
    candidates.sort(
      (a, b) => _stationTransitionOverrideScore(
        b,
      ).compareTo(_stationTransitionOverrideScore(a)),
    );
    return candidates.first;
  }

  int _directionPolicyScore(DirectionPolicy row) {
    int score = 0;
    if (row.apiDirection != null) {
      score += 1;
    }
    if (row.apiTerminalStationCode != null) {
      score += 2;
    }
    return score;
  }

  int _stationTransitionOverrideScore(StationTransitionOverride row) {
    int score = row.priority;
    if (row.apiDirection != null) {
      score += 1;
    }
    if (row.apiTerminalStationCode != null) {
      score += 2;
    }
    if (row.prevStationCode != null) {
      score += 4;
    }
    return score;
  }
}

String _fallbackMainBranchKey(String canonicalLineName) {
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
