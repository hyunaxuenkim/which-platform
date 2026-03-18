import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsed_route_models.freezed.dart';
part 'parsed_route_models.g.dart';

enum ParseFailureCode {
  missingBody,
  missingPaths,
  emptyPaths,
  invalidPathShape,
}

@freezed
abstract class ParsedRouteParseResult with _$ParsedRouteParseResult {
  const factory ParsedRouteParseResult.success({required ParsedRoute route}) =
      ParsedRouteParseSuccess;

  const factory ParsedRouteParseResult.failure({
    required ParseFailureCode code,
    String? message,
  }) = ParsedRouteParseFailure;
}

@freezed
abstract class ParsedRoute with _$ParsedRoute {
  const factory ParsedRoute({
    required int totalDurationSeconds,
    required int totalFare,
    required int transferCount,
    required List<RouteLeg> legs,
    required List<TransferSegment> transfers,
    required List<String> stationTrail,
    required int rawPathCount,
  }) = _ParsedRoute;

  factory ParsedRoute.fromJson(Map<String, Object?> json) =>
      _$ParsedRouteFromJson(json);
}

@freezed
abstract class RawPathSegment with _$RawPathSegment {
  const factory RawPathSegment({
    required String departureStationCode,
    required String departureStationName,
    required String departureLineName,
    required String? departureBranchLineName,
    required String arrivalStationCode,
    required String arrivalStationName,
    required String arrivalLineName,
    required String? arrivalBranchLineName,
    required String? terminalStationCode,
    required String? terminalStationName,
    required String? apiDirection,
    required int distanceMeters,
    required int durationSeconds,
    required int waitingSeconds,
    required bool isTransfer,
    required String? trainNo,
    required String? trainDepartureTime,
    required String? trainArrivalTime,
    required String servicePatternKey,
    required String branchKey,
  }) = _RawPathSegment;

  factory RawPathSegment.fromJson(Map<String, Object?> json) =>
      _$RawPathSegmentFromJson(json);
}

@freezed
abstract class RideSegment with _$RideSegment {
  const factory RideSegment({
    required String fromStationCode,
    required String fromStationName,
    required String toStationCode,
    required String toStationName,
    required String lineName,
    required String? terminalStationName,
    required String? terminalStationCode,
    required String? apiDirection,
    required int durationSeconds,
    required int distanceMeters,
    required String? trainNo,
    required String branchKey,
    required String servicePatternKey,
  }) = _RideSegment;

  factory RideSegment.fromJson(Map<String, Object?> json) =>
      _$RideSegmentFromJson(json);
}

@freezed
abstract class TransferSegment with _$TransferSegment {
  const factory TransferSegment({
    required String stationName,
    required String fromLineName,
    required String toLineName,
    required int durationSeconds,
    required int distanceMeters,
    required int waitingSeconds,
  }) = _TransferSegment;

  factory TransferSegment.fromJson(Map<String, Object?> json) =>
      _$TransferSegmentFromJson(json);
}

@freezed
abstract class RouteLeg with _$RouteLeg {
  const factory RouteLeg({
    required String lineName,
    required String fromStationName,
    required String toStationName,
    required List<String> stationNames,
    required int stationCount,
    required String directionLabel,
    required String? apiDirection,
    required String? terminalStationName,
    required String servicePatternKey,
    required String branchKey,
    required String nextStationName,
    required int durationSeconds,
    required int distanceMeters,
    required int segmentCount,
  }) = _RouteLeg;

  factory RouteLeg.fromJson(Map<String, Object?> json) =>
      _$RouteLegFromJson(json);
}
