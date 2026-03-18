// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteApiResponseDto _$RouteApiResponseDtoFromJson(Map<String, dynamic> json) =>
    _RouteApiResponseDto(
      header: json['header'] == null
          ? null
          : RouteApiHeaderDto.fromJson(json['header'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : RouteApiBodyDto.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteApiResponseDtoToJson(
  _RouteApiResponseDto instance,
) => <String, dynamic>{'header': instance.header, 'body': instance.body};

_RouteApiHeaderDto _$RouteApiHeaderDtoFromJson(Map<String, dynamic> json) =>
    _RouteApiHeaderDto(
      resultCode: json['resultCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
    );

Map<String, dynamic> _$RouteApiHeaderDtoToJson(_RouteApiHeaderDto instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

_RouteApiBodyDto _$RouteApiBodyDtoFromJson(Map<String, dynamic> json) =>
    _RouteApiBodyDto(
      totalreqHr: (json['totalreqHr'] as num?)?.toInt(),
      totalCardCrg: (json['totalCardCrg'] as num?)?.toInt(),
      trsitNmtm: (json['trsitNmtm'] as num?)?.toInt(),
      trfstnNms: (json['trfstnNms'] as List<dynamic>?)
          ?.map((e) => RouteApiTransferDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      paths: (json['paths'] as List<dynamic>?)
          ?.map((e) => RouteApiPathDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteApiBodyDtoToJson(_RouteApiBodyDto instance) =>
    <String, dynamic>{
      'totalreqHr': instance.totalreqHr,
      'totalCardCrg': instance.totalCardCrg,
      'trsitNmtm': instance.trsitNmtm,
      'trfstnNms': instance.trfstnNms,
      'paths': instance.paths,
    };

_RouteApiTransferDto _$RouteApiTransferDtoFromJson(Map<String, dynamic> json) =>
    _RouteApiTransferDto(
      stnNm: json['stnNm'] as String?,
      dptreLineNm: json['dptreLineNm'] as String?,
      arvlLineNm: json['arvlLineNm'] as String?,
    );

Map<String, dynamic> _$RouteApiTransferDtoToJson(
  _RouteApiTransferDto instance,
) => <String, dynamic>{
  'stnNm': instance.stnNm,
  'dptreLineNm': instance.dptreLineNm,
  'arvlLineNm': instance.arvlLineNm,
};

_RouteApiPathDto _$RouteApiPathDtoFromJson(
  Map<String, dynamic> json,
) => _RouteApiPathDto(
  departureStation: json['dptreStn'] == null
      ? null
      : RouteApiStationDto.fromJson(json['dptreStn'] as Map<String, dynamic>),
  arrivalStation: json['arvlStn'] == null
      ? null
      : RouteApiStationDto.fromJson(json['arvlStn'] as Map<String, dynamic>),
  sectionDistanceMeters: (json['stnSctnDstc'] as num?)?.toInt(),
  sectionDurationSeconds: (json['reqHr'] as num?)?.toInt(),
  waitingSeconds: (json['wtngHr'] as num?)?.toInt(),
  terminalStationName: json['tmnlStnNm'] as String?,
  terminalStationCode: json['tmnlStnCd'] as String?,
  apiDirection: json['upbdnbSe'] as String?,
  trainNo: json['trainno'] as String?,
  trainDepartureTime: json['trainDptreTm'] as String?,
  trainArrivalTime: json['trainArvlTm'] as String?,
  transferYn: json['trsitYn'] as String?,
  nonstopYn: json['nonstopYn'] as String?,
);

Map<String, dynamic> _$RouteApiPathDtoToJson(_RouteApiPathDto instance) =>
    <String, dynamic>{
      'dptreStn': instance.departureStation,
      'arvlStn': instance.arrivalStation,
      'stnSctnDstc': instance.sectionDistanceMeters,
      'reqHr': instance.sectionDurationSeconds,
      'wtngHr': instance.waitingSeconds,
      'tmnlStnNm': instance.terminalStationName,
      'tmnlStnCd': instance.terminalStationCode,
      'upbdnbSe': instance.apiDirection,
      'trainno': instance.trainNo,
      'trainDptreTm': instance.trainDepartureTime,
      'trainArvlTm': instance.trainArrivalTime,
      'trsitYn': instance.transferYn,
      'nonstopYn': instance.nonstopYn,
    };

_RouteApiStationDto _$RouteApiStationDtoFromJson(Map<String, dynamic> json) =>
    _RouteApiStationDto(
      stationCode: json['stnCd'] as String?,
      stationNo: json['stnNo'] as String?,
      stationName: json['stnNm'] as String?,
      lineName: json['lineNm'] as String?,
      branchLineName: json['brlnNm'] as String?,
    );

Map<String, dynamic> _$RouteApiStationDtoToJson(_RouteApiStationDto instance) =>
    <String, dynamic>{
      'stnCd': instance.stationCode,
      'stnNo': instance.stationNo,
      'stnNm': instance.stationName,
      'lineNm': instance.lineName,
      'brlnNm': instance.branchLineName,
    };
