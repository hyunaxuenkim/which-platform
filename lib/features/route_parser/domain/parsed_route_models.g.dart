// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsed_route_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParsedRoute _$ParsedRouteFromJson(Map<String, dynamic> json) => _ParsedRoute(
  totalDurationSeconds: (json['totalDurationSeconds'] as num).toInt(),
  totalFare: (json['totalFare'] as num).toInt(),
  transferCount: (json['transferCount'] as num).toInt(),
  legs: (json['legs'] as List<dynamic>)
      .map((e) => RouteLeg.fromJson(e as Map<String, dynamic>))
      .toList(),
  transfers: (json['transfers'] as List<dynamic>)
      .map((e) => TransferSegment.fromJson(e as Map<String, dynamic>))
      .toList(),
  stationTrail: (json['stationTrail'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  stationTrailCodes:
      (json['stationTrailCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  rawPathCount: (json['rawPathCount'] as num).toInt(),
);

Map<String, dynamic> _$ParsedRouteToJson(_ParsedRoute instance) =>
    <String, dynamic>{
      'totalDurationSeconds': instance.totalDurationSeconds,
      'totalFare': instance.totalFare,
      'transferCount': instance.transferCount,
      'legs': instance.legs,
      'transfers': instance.transfers,
      'stationTrail': instance.stationTrail,
      'stationTrailCodes': instance.stationTrailCodes,
      'rawPathCount': instance.rawPathCount,
    };

_RawPathSegment _$RawPathSegmentFromJson(Map<String, dynamic> json) =>
    _RawPathSegment(
      departureStationCode: json['departureStationCode'] as String,
      departureStationName: json['departureStationName'] as String,
      departureLineName: json['departureLineName'] as String,
      departureBranchLineName: json['departureBranchLineName'] as String?,
      arrivalStationCode: json['arrivalStationCode'] as String,
      arrivalStationName: json['arrivalStationName'] as String,
      arrivalLineName: json['arrivalLineName'] as String,
      arrivalBranchLineName: json['arrivalBranchLineName'] as String?,
      terminalStationCode: json['terminalStationCode'] as String?,
      terminalStationName: json['terminalStationName'] as String?,
      apiDirection: json['apiDirection'] as String?,
      distanceMeters: (json['distanceMeters'] as num).toInt(),
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      waitingSeconds: (json['waitingSeconds'] as num).toInt(),
      isTransfer: json['isTransfer'] as bool,
      trainNo: json['trainNo'] as String?,
      trainDepartureTime: json['trainDepartureTime'] as String?,
      trainArrivalTime: json['trainArrivalTime'] as String?,
      servicePatternKey: json['servicePatternKey'] as String,
      branchKey: json['branchKey'] as String,
    );

Map<String, dynamic> _$RawPathSegmentToJson(_RawPathSegment instance) =>
    <String, dynamic>{
      'departureStationCode': instance.departureStationCode,
      'departureStationName': instance.departureStationName,
      'departureLineName': instance.departureLineName,
      'departureBranchLineName': instance.departureBranchLineName,
      'arrivalStationCode': instance.arrivalStationCode,
      'arrivalStationName': instance.arrivalStationName,
      'arrivalLineName': instance.arrivalLineName,
      'arrivalBranchLineName': instance.arrivalBranchLineName,
      'terminalStationCode': instance.terminalStationCode,
      'terminalStationName': instance.terminalStationName,
      'apiDirection': instance.apiDirection,
      'distanceMeters': instance.distanceMeters,
      'durationSeconds': instance.durationSeconds,
      'waitingSeconds': instance.waitingSeconds,
      'isTransfer': instance.isTransfer,
      'trainNo': instance.trainNo,
      'trainDepartureTime': instance.trainDepartureTime,
      'trainArrivalTime': instance.trainArrivalTime,
      'servicePatternKey': instance.servicePatternKey,
      'branchKey': instance.branchKey,
    };

_RideSegment _$RideSegmentFromJson(Map<String, dynamic> json) => _RideSegment(
  fromStationCode: json['fromStationCode'] as String,
  fromStationName: json['fromStationName'] as String,
  toStationCode: json['toStationCode'] as String,
  toStationName: json['toStationName'] as String,
  lineName: json['lineName'] as String,
  terminalStationName: json['terminalStationName'] as String?,
  terminalStationCode: json['terminalStationCode'] as String?,
  apiDirection: json['apiDirection'] as String?,
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  distanceMeters: (json['distanceMeters'] as num).toInt(),
  trainNo: json['trainNo'] as String?,
  branchKey: json['branchKey'] as String,
  servicePatternKey: json['servicePatternKey'] as String,
);

Map<String, dynamic> _$RideSegmentToJson(_RideSegment instance) =>
    <String, dynamic>{
      'fromStationCode': instance.fromStationCode,
      'fromStationName': instance.fromStationName,
      'toStationCode': instance.toStationCode,
      'toStationName': instance.toStationName,
      'lineName': instance.lineName,
      'terminalStationName': instance.terminalStationName,
      'terminalStationCode': instance.terminalStationCode,
      'apiDirection': instance.apiDirection,
      'durationSeconds': instance.durationSeconds,
      'distanceMeters': instance.distanceMeters,
      'trainNo': instance.trainNo,
      'branchKey': instance.branchKey,
      'servicePatternKey': instance.servicePatternKey,
    };

_TransferSegment _$TransferSegmentFromJson(Map<String, dynamic> json) =>
    _TransferSegment(
      stationName: json['stationName'] as String,
      stationCode: json['stationCode'] as String?,
      fromLineName: json['fromLineName'] as String,
      toLineName: json['toLineName'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      distanceMeters: (json['distanceMeters'] as num).toInt(),
      waitingSeconds: (json['waitingSeconds'] as num).toInt(),
    );

Map<String, dynamic> _$TransferSegmentToJson(_TransferSegment instance) =>
    <String, dynamic>{
      'stationName': instance.stationName,
      'stationCode': instance.stationCode,
      'fromLineName': instance.fromLineName,
      'toLineName': instance.toLineName,
      'durationSeconds': instance.durationSeconds,
      'distanceMeters': instance.distanceMeters,
      'waitingSeconds': instance.waitingSeconds,
    };

_RouteLeg _$RouteLegFromJson(Map<String, dynamic> json) => _RouteLeg(
  lineName: json['lineName'] as String,
  fromStationName: json['fromStationName'] as String,
  fromStationCode: json['fromStationCode'] as String?,
  toStationName: json['toStationName'] as String,
  toStationCode: json['toStationCode'] as String?,
  stationNames: (json['stationNames'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  stationCodes:
      (json['stationCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  stationCount: (json['stationCount'] as num).toInt(),
  directionLabel: json['directionLabel'] as String,
  apiDirection: json['apiDirection'] as String?,
  terminalStationName: json['terminalStationName'] as String?,
  terminalStationCode: json['terminalStationCode'] as String?,
  servicePatternKey: json['servicePatternKey'] as String,
  branchKey: json['branchKey'] as String,
  nextStationName: json['nextStationName'] as String,
  nextStationCode: json['nextStationCode'] as String?,
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  distanceMeters: (json['distanceMeters'] as num).toInt(),
  segmentCount: (json['segmentCount'] as num).toInt(),
);

Map<String, dynamic> _$RouteLegToJson(_RouteLeg instance) => <String, dynamic>{
  'lineName': instance.lineName,
  'fromStationName': instance.fromStationName,
  'fromStationCode': instance.fromStationCode,
  'toStationName': instance.toStationName,
  'toStationCode': instance.toStationCode,
  'stationNames': instance.stationNames,
  'stationCodes': instance.stationCodes,
  'stationCount': instance.stationCount,
  'directionLabel': instance.directionLabel,
  'apiDirection': instance.apiDirection,
  'terminalStationName': instance.terminalStationName,
  'terminalStationCode': instance.terminalStationCode,
  'servicePatternKey': instance.servicePatternKey,
  'branchKey': instance.branchKey,
  'nextStationName': instance.nextStationName,
  'nextStationCode': instance.nextStationCode,
  'durationSeconds': instance.durationSeconds,
  'distanceMeters': instance.distanceMeters,
  'segmentCount': instance.segmentCount,
};
