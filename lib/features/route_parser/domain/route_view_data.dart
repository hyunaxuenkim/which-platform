import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_view_data.freezed.dart';
part 'route_view_data.g.dart';

@freezed
abstract class RouteViewData with _$RouteViewData {
  const factory RouteViewData({
    required RouteSummaryViewData summary,
    required List<RouteLegItemViewData> legItems,
    required List<RouteTransferItemViewData> transferItems,
  }) = _RouteViewData;

  factory RouteViewData.fromJson(Map<String, Object?> json) =>
      _$RouteViewDataFromJson(json);
}

@freezed
abstract class StationDisplayNameViewData with _$StationDisplayNameViewData {
  const factory StationDisplayNameViewData({
    required String primary,
    String? secondary,
    required String fullText,
  }) = _StationDisplayNameViewData;

  factory StationDisplayNameViewData.fromJson(Map<String, Object?> json) =>
      _$StationDisplayNameViewDataFromJson(json);
}

@freezed
abstract class RouteSummaryViewData with _$RouteSummaryViewData {
  const factory RouteSummaryViewData({
    required StationDisplayNameViewData departureStation,
    required StationDisplayNameViewData arrivalStation,
    required int totalDurationSeconds,
    required int totalFare,
    required int transferCount,
    required String totalDurationText,
    required String totalFareText,
    required String transferCountText,
  }) = _RouteSummaryViewData;

  factory RouteSummaryViewData.fromJson(Map<String, Object?> json) =>
      _$RouteSummaryViewDataFromJson(json);
}

@freezed
abstract class RouteLegItemViewData with _$RouteLegItemViewData {
  const factory RouteLegItemViewData({
    required String lineName,
    required String lineColorHex,
    required int stationCount,
    required int durationSeconds,
    required String directionLabel,
    required String directionPositiveExamplesText,
    required String directionNegativeExamplesText,
    required StationDisplayNameViewData fromStation,
    required StationDisplayNameViewData toStation,
    required List<StationDisplayNameViewData> stations,
    required StationDisplayNameViewData nextStation,
    required StationDisplayNameViewData nextNegativeStation,
    required String stationTrailText,
    required String stationCountText,
    required String durationText,
  }) = _RouteLegItemViewData;

  factory RouteLegItemViewData.fromJson(Map<String, Object?> json) =>
      _$RouteLegItemViewDataFromJson(json);
}

@freezed
abstract class RouteTransferItemViewData with _$RouteTransferItemViewData {
  const factory RouteTransferItemViewData({
    required StationDisplayNameViewData station,
    required String fromLineName,
    required String toLineName,
    required String toLineColorHex,
    required int walkingTimeSeconds,
    required String walkingTimeText,
  }) = _RouteTransferItemViewData;

  factory RouteTransferItemViewData.fromJson(Map<String, Object?> json) =>
      _$RouteTransferItemViewDataFromJson(json);
}
