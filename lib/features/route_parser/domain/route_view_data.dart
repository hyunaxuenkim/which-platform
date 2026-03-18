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
abstract class RouteSummaryViewData with _$RouteSummaryViewData {
  const factory RouteSummaryViewData({
    required String departureStationName,
    required String arrivalStationName,
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
    required String directionLabel,
    required String fromStationName,
    required String toStationName,
    required String nextStationName,
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
    required String stationName,
    required String fromLineName,
    required String toLineName,
    required String walkingTimeText,
  }) = _RouteTransferItemViewData;

  factory RouteTransferItemViewData.fromJson(Map<String, Object?> json) =>
      _$RouteTransferItemViewDataFromJson(json);
}
