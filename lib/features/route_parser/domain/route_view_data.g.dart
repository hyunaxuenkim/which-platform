// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_view_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteViewData _$RouteViewDataFromJson(Map<String, dynamic> json) =>
    _RouteViewData(
      summary: RouteSummaryViewData.fromJson(
        json['summary'] as Map<String, dynamic>,
      ),
      legItems: (json['legItems'] as List<dynamic>)
          .map((e) => RouteLegItemViewData.fromJson(e as Map<String, dynamic>))
          .toList(),
      transferItems: (json['transferItems'] as List<dynamic>)
          .map(
            (e) =>
                RouteTransferItemViewData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$RouteViewDataToJson(_RouteViewData instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'legItems': instance.legItems,
      'transferItems': instance.transferItems,
    };

_RouteSummaryViewData _$RouteSummaryViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteSummaryViewData(
  departureStationName: json['departureStationName'] as String,
  arrivalStationName: json['arrivalStationName'] as String,
  totalDurationText: json['totalDurationText'] as String,
  totalFareText: json['totalFareText'] as String,
  transferCountText: json['transferCountText'] as String,
);

Map<String, dynamic> _$RouteSummaryViewDataToJson(
  _RouteSummaryViewData instance,
) => <String, dynamic>{
  'departureStationName': instance.departureStationName,
  'arrivalStationName': instance.arrivalStationName,
  'totalDurationText': instance.totalDurationText,
  'totalFareText': instance.totalFareText,
  'transferCountText': instance.transferCountText,
};

_RouteLegItemViewData _$RouteLegItemViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteLegItemViewData(
  lineName: json['lineName'] as String,
  directionLabel: json['directionLabel'] as String,
  fromStationName: json['fromStationName'] as String,
  toStationName: json['toStationName'] as String,
  nextStationName: json['nextStationName'] as String,
  stationTrailText: json['stationTrailText'] as String,
  stationCountText: json['stationCountText'] as String,
  durationText: json['durationText'] as String,
);

Map<String, dynamic> _$RouteLegItemViewDataToJson(
  _RouteLegItemViewData instance,
) => <String, dynamic>{
  'lineName': instance.lineName,
  'directionLabel': instance.directionLabel,
  'fromStationName': instance.fromStationName,
  'toStationName': instance.toStationName,
  'nextStationName': instance.nextStationName,
  'stationTrailText': instance.stationTrailText,
  'stationCountText': instance.stationCountText,
  'durationText': instance.durationText,
};

_RouteTransferItemViewData _$RouteTransferItemViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteTransferItemViewData(
  stationName: json['stationName'] as String,
  fromLineName: json['fromLineName'] as String,
  toLineName: json['toLineName'] as String,
  walkingTimeText: json['walkingTimeText'] as String,
);

Map<String, dynamic> _$RouteTransferItemViewDataToJson(
  _RouteTransferItemViewData instance,
) => <String, dynamic>{
  'stationName': instance.stationName,
  'fromLineName': instance.fromLineName,
  'toLineName': instance.toLineName,
  'walkingTimeText': instance.walkingTimeText,
};
