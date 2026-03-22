import 'route_api_response_dto.dart';
import 'parsed_route_models.dart';

class RouteResponseParser {
  const RouteResponseParser({
    DirectionLabelResolver directionLabelResolver =
        const DirectionLabelResolver(),
  }) : _directionLabelResolver = directionLabelResolver;

  final DirectionLabelResolver _directionLabelResolver;

  ParsedRouteParseResult parse(RouteApiResponseDto response) {
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
    for (int pathIndex = 0; pathIndex < paths.length; pathIndex++) {
      final _NormalizedPathResult normalizedPath = _normalizePath(
        path: paths[pathIndex],
        pathIndex: pathIndex,
      );
      if (normalizedPath.failure != null) {
        return normalizedPath.failure!;
      }
      rawSegments.add(normalizedPath.segment!);
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

    final List<RouteLeg> legs = _buildLegs(rideSegments, rawSegments);
    final List<String> stationTrail = _buildStationTrail(rideSegments);

    return ParsedRouteParseResult.success(
      route: ParsedRoute(
        totalDurationSeconds: body.totalreqHr ?? 0,
        totalFare: body.totalCardCrg ?? 0,
        transferCount: body.trsitNmtm ?? transferSegments.length,
        legs: legs,
        transfers: transferSegments,
        stationTrail: stationTrail,
        rawPathCount: rawSegments.length,
      ),
    );
  }

  _NormalizedPathResult _normalizePath({
    required RouteApiPathDto path,
    required int pathIndex,
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
          message:
              'Path connectivity breaks between paths[${i - 1}] and [$i].',
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
      fromLineName: segment.departureLineName,
      toLineName: segment.arrivalLineName,
      durationSeconds: segment.durationSeconds,
      distanceMeters: segment.distanceMeters,
      waitingSeconds: segment.waitingSeconds,
    );
  }

  List<RouteLeg> _buildLegs(
    List<RideSegment> rideSegments,
    List<RawPathSegment> rawSegments,
  ) {
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

    return groups.map(_buildLeg).toList(growable: false);
  }

  bool _canMergeIntoSameLeg(RideSegment previous, RideSegment current) {
    return previous.lineName == current.lineName &&
        previous.branchKey == current.branchKey &&
        previous.servicePatternKey == current.servicePatternKey &&
        previous.apiDirection == current.apiDirection &&
        previous.terminalStationCode == current.terminalStationCode &&
        previous.terminalStationName == current.terminalStationName;
  }

  RouteLeg _buildLeg(List<RideSegment> segments) {
    final RideSegment first = segments.first;
    final RideSegment last = segments.last;
    final List<String> stationNames = <String>[
      first.fromStationName,
      ...segments.map((RideSegment segment) => segment.toStationName),
    ];

    return RouteLeg(
      lineName: first.lineName,
      fromStationName: first.fromStationName,
      toStationName: last.toStationName,
      stationNames: stationNames,
      stationCount: stationNames.length,
      directionLabel: _directionLabelResolver.resolve(
        lineName: first.lineName,
        apiDirection: first.apiDirection,
        terminalStationName: first.terminalStationName,
        terminalStationCode: first.terminalStationCode,
        branchKey: first.branchKey,
        servicePatternKey: first.servicePatternKey,
      ),
      apiDirection: first.apiDirection,
      terminalStationName: first.terminalStationName,
      servicePatternKey: first.servicePatternKey,
      branchKey: first.branchKey,
      nextStationName: first.toStationName,
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
    final bool isMainLineTwo = lineName == '2호선' && branchKey == 'MAIN';
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
        terminalStationName != null) {
      return '$terminalStationName행';
    }
    if (terminalStationName != null) {
      return '$terminalStationName행';
    }
    return apiDirection ?? '방향 미정';
  }
}
