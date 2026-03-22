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
  lineColorHex: json['lineColorHex'] as String,
  directionLabel: json['directionLabel'] as String,
  directionPositiveExamplesText:
      json['directionPositiveExamplesText'] as String,
  directionNegativeExamplesText:
      json['directionNegativeExamplesText'] as String,
  fromStationName: json['fromStationName'] as String,
  toStationName: json['toStationName'] as String,
  nextStationName: json['nextStationName'] as String,
  nextNegativeStationName: json['nextNegativeStationName'] as String,
  stationTrailText: json['stationTrailText'] as String,
  stationCountText: json['stationCountText'] as String,
  durationText: json['durationText'] as String,
  instructionText: json['instructionText'] as String,
);

Map<String, dynamic> _$RouteLegItemViewDataToJson(
  _RouteLegItemViewData instance,
) => <String, dynamic>{
  'lineName': instance.lineName,
  'lineColorHex': instance.lineColorHex,
  'directionLabel': instance.directionLabel,
  'directionPositiveExamplesText': instance.directionPositiveExamplesText,
  'directionNegativeExamplesText': instance.directionNegativeExamplesText,
  'fromStationName': instance.fromStationName,
  'toStationName': instance.toStationName,
  'nextStationName': instance.nextStationName,
  'nextNegativeStationName': instance.nextNegativeStationName,
  'stationTrailText': instance.stationTrailText,
  'stationCountText': instance.stationCountText,
  'durationText': instance.durationText,
  'instructionText': instance.instructionText,
};

_RouteTransferItemViewData _$RouteTransferItemViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteTransferItemViewData(
  stationName: json['stationName'] as String,
  fromLineName: json['fromLineName'] as String,
  toLineName: json['toLineName'] as String,
  toLineColorHex: json['toLineColorHex'] as String,
  walkingTimeText: json['walkingTimeText'] as String,
);

Map<String, dynamic> _$RouteTransferItemViewDataToJson(
  _RouteTransferItemViewData instance,
) => <String, dynamic>{
  'stationName': instance.stationName,
  'fromLineName': instance.fromLineName,
  'toLineName': instance.toLineName,
  'toLineColorHex': instance.toLineColorHex,
  'walkingTimeText': instance.walkingTimeText,
};
