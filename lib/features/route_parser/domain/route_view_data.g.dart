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

_StationDisplayNameViewData _$StationDisplayNameViewDataFromJson(
  Map<String, dynamic> json,
) => _StationDisplayNameViewData(
  primary: json['primary'] as String,
  secondary: json['secondary'] as String?,
  fullText: json['fullText'] as String,
);

Map<String, dynamic> _$StationDisplayNameViewDataToJson(
  _StationDisplayNameViewData instance,
) => <String, dynamic>{
  'primary': instance.primary,
  'secondary': instance.secondary,
  'fullText': instance.fullText,
};

_RouteSummaryViewData _$RouteSummaryViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteSummaryViewData(
  departureStation: StationDisplayNameViewData.fromJson(
    json['departureStation'] as Map<String, dynamic>,
  ),
  arrivalStation: StationDisplayNameViewData.fromJson(
    json['arrivalStation'] as Map<String, dynamic>,
  ),
  totalDurationSeconds: (json['totalDurationSeconds'] as num).toInt(),
  totalFare: (json['totalFare'] as num).toInt(),
  transferCount: (json['transferCount'] as num).toInt(),
  totalDurationText: json['totalDurationText'] as String,
  totalFareText: json['totalFareText'] as String,
  transferCountText: json['transferCountText'] as String,
);

Map<String, dynamic> _$RouteSummaryViewDataToJson(
  _RouteSummaryViewData instance,
) => <String, dynamic>{
  'departureStation': instance.departureStation,
  'arrivalStation': instance.arrivalStation,
  'totalDurationSeconds': instance.totalDurationSeconds,
  'totalFare': instance.totalFare,
  'transferCount': instance.transferCount,
  'totalDurationText': instance.totalDurationText,
  'totalFareText': instance.totalFareText,
  'transferCountText': instance.transferCountText,
};

_RouteLegItemViewData _$RouteLegItemViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteLegItemViewData(
  lineName: json['lineName'] as String,
  lineColorHex: json['lineColorHex'] as String,
  stationCount: (json['stationCount'] as num).toInt(),
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  directionLabel: json['directionLabel'] as String,
  directionPositiveExamplesText:
      json['directionPositiveExamplesText'] as String,
  directionNegativeExamplesText:
      json['directionNegativeExamplesText'] as String,
  fromStation: StationDisplayNameViewData.fromJson(
    json['fromStation'] as Map<String, dynamic>,
  ),
  toStation: StationDisplayNameViewData.fromJson(
    json['toStation'] as Map<String, dynamic>,
  ),
  stations: (json['stations'] as List<dynamic>)
      .map(
        (e) => StationDisplayNameViewData.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  nextStation: StationDisplayNameViewData.fromJson(
    json['nextStation'] as Map<String, dynamic>,
  ),
  nextNegativeStation: StationDisplayNameViewData.fromJson(
    json['nextNegativeStation'] as Map<String, dynamic>,
  ),
  stationTrailText: json['stationTrailText'] as String,
  stationCountText: json['stationCountText'] as String,
  durationText: json['durationText'] as String,
);

Map<String, dynamic> _$RouteLegItemViewDataToJson(
  _RouteLegItemViewData instance,
) => <String, dynamic>{
  'lineName': instance.lineName,
  'lineColorHex': instance.lineColorHex,
  'stationCount': instance.stationCount,
  'durationSeconds': instance.durationSeconds,
  'directionLabel': instance.directionLabel,
  'directionPositiveExamplesText': instance.directionPositiveExamplesText,
  'directionNegativeExamplesText': instance.directionNegativeExamplesText,
  'fromStation': instance.fromStation,
  'toStation': instance.toStation,
  'stations': instance.stations,
  'nextStation': instance.nextStation,
  'nextNegativeStation': instance.nextNegativeStation,
  'stationTrailText': instance.stationTrailText,
  'stationCountText': instance.stationCountText,
  'durationText': instance.durationText,
};

_RouteTransferItemViewData _$RouteTransferItemViewDataFromJson(
  Map<String, dynamic> json,
) => _RouteTransferItemViewData(
  station: StationDisplayNameViewData.fromJson(
    json['station'] as Map<String, dynamic>,
  ),
  fromLineName: json['fromLineName'] as String,
  toLineName: json['toLineName'] as String,
  toLineColorHex: json['toLineColorHex'] as String,
  walkingTimeSeconds: (json['walkingTimeSeconds'] as num).toInt(),
  walkingTimeText: json['walkingTimeText'] as String,
);

Map<String, dynamic> _$RouteTransferItemViewDataToJson(
  _RouteTransferItemViewData instance,
) => <String, dynamic>{
  'station': instance.station,
  'fromLineName': instance.fromLineName,
  'toLineName': instance.toLineName,
  'toLineColorHex': instance.toLineColorHex,
  'walkingTimeSeconds': instance.walkingTimeSeconds,
  'walkingTimeText': instance.walkingTimeText,
};
