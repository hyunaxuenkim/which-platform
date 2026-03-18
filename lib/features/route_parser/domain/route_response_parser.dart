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
      );
    }

    final List<RouteApiPathDto>? paths = body.paths;
    if (paths == null) {
      return const ParsedRouteParseResult.failure(
        code: ParseFailureCode.missingPaths,
      );
    }

    if (paths.isEmpty) {
      return const ParsedRouteParseResult.failure(
        code: ParseFailureCode.emptyPaths,
      );
    }

    final List<RawPathSegment> rawSegments = <RawPathSegment>[];
    for (final RouteApiPathDto path in paths) {
      final RawPathSegment? segment = _normalizePath(path);
      if (segment == null) {
        return const ParsedRouteParseResult.failure(
          code: ParseFailureCode.invalidPathShape,
        );
      }
      rawSegments.add(segment);
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
        message: 'Ride segment가 없는 응답입니다.',
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

  RawPathSegment? _normalizePath(RouteApiPathDto path) {
    final RouteApiStationDto? departureStation = path.departureStation;
    final RouteApiStationDto? arrivalStation = path.arrivalStation;
    if (departureStation == null || arrivalStation == null) {
      return null;
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

    if (departureStationCode == null ||
        departureStationName == null ||
        departureLineName == null ||
        arrivalStationCode == null ||
        arrivalStationName == null ||
        arrivalLineName == null ||
        path.sectionDistanceMeters == null ||
        path.sectionDurationSeconds == null ||
        path.waitingSeconds == null ||
        transferYn == null) {
      return null;
    }

    final String branchKey =
        _normalizeNullableText(departureStation.branchLineName) ??
        _normalizeNullableText(arrivalStation.branchLineName) ??
        'MAIN';
    final String servicePatternKey =
        _normalizeNullableText(path.nonstopYn) == 'Y' ? 'NONSTOP' : 'LOCAL';

    return RawPathSegment(
      departureStationCode: departureStationCode,
      departureStationName: departureStationName,
      departureLineName: departureLineName,
      departureBranchLineName: _normalizeNullableText(
        departureStation.branchLineName,
      ),
      arrivalStationCode: arrivalStationCode,
      arrivalStationName: arrivalStationName,
      arrivalLineName: arrivalLineName,
      arrivalBranchLineName: _normalizeNullableText(
        arrivalStation.branchLineName,
      ),
      terminalStationCode: _normalizeNullableText(path.terminalStationCode),
      terminalStationName: _normalizeNullableText(path.terminalStationName),
      apiDirection: _normalizeNullableText(path.apiDirection),
      distanceMeters: path.sectionDistanceMeters!,
      durationSeconds: path.sectionDurationSeconds!,
      waitingSeconds: path.waitingSeconds!,
      isTransfer: transferYn == 'Y',
      trainNo: _normalizeNullableText(path.trainNo),
      trainDepartureTime: _normalizeNullableText(path.trainDepartureTime),
      trainArrivalTime: _normalizeNullableText(path.trainArrivalTime),
      servicePatternKey: servicePatternKey,
      branchKey: branchKey,
    );
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

    for (int i = 0; i < rawSegments.length; i++) {
      final RawPathSegment rawSegment = rawSegments[i];
      if (rawSegment.isTransfer) {
        continue;
      }

      final RideSegment rideSegment = rideSegments[rideIndex];
      final bool shouldStartNewGroup =
          groups.isEmpty ||
          (i > 0 && rawSegments[i - 1].isTransfer) ||
          groups.last.last.lineName != rideSegment.lineName;

      if (shouldStartNewGroup) {
        groups.add(<RideSegment>[rideSegment]);
      } else {
        groups.last.add(rideSegment);
      }

      rideIndex += 1;
    }

    return groups.map(_buildLeg).toList(growable: false);
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
