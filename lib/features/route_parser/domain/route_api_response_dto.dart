import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_api_response_dto.freezed.dart';
part 'route_api_response_dto.g.dart';

@freezed
abstract class RouteApiResponseDto with _$RouteApiResponseDto {
  const factory RouteApiResponseDto({
    RouteApiHeaderDto? header,
    RouteApiBodyDto? body,
  }) = _RouteApiResponseDto;

  factory RouteApiResponseDto.fromJson(Map<String, Object?> json) =>
      _$RouteApiResponseDtoFromJson(json);
}

@freezed
abstract class RouteApiHeaderDto with _$RouteApiHeaderDto {
  const factory RouteApiHeaderDto({String? resultCode, String? resultMsg}) =
      _RouteApiHeaderDto;

  factory RouteApiHeaderDto.fromJson(Map<String, Object?> json) =>
      _$RouteApiHeaderDtoFromJson(json);
}

@freezed
abstract class RouteApiBodyDto with _$RouteApiBodyDto {
  const factory RouteApiBodyDto({
    int? totalreqHr,
    int? totalCardCrg,
    int? trsitNmtm,
    List<RouteApiTransferDto>? trfstnNms,
    List<RouteApiPathDto>? paths,
  }) = _RouteApiBodyDto;

  factory RouteApiBodyDto.fromJson(Map<String, Object?> json) =>
      _$RouteApiBodyDtoFromJson(json);
}

@freezed
abstract class RouteApiTransferDto with _$RouteApiTransferDto {
  const factory RouteApiTransferDto({
    String? stnNm,
    String? dptreLineNm,
    String? arvlLineNm,
  }) = _RouteApiTransferDto;

  factory RouteApiTransferDto.fromJson(Map<String, Object?> json) =>
      _$RouteApiTransferDtoFromJson(json);
}

@freezed
abstract class RouteApiPathDto with _$RouteApiPathDto {
  const factory RouteApiPathDto({
    @JsonKey(name: 'dptreStn') RouteApiStationDto? departureStation,
    @JsonKey(name: 'arvlStn') RouteApiStationDto? arrivalStation,
    @JsonKey(name: 'stnSctnDstc') int? sectionDistanceMeters,
    @JsonKey(name: 'reqHr') int? sectionDurationSeconds,
    @JsonKey(name: 'wtngHr') int? waitingSeconds,
    @JsonKey(name: 'tmnlStnNm') String? terminalStationName,
    @JsonKey(name: 'tmnlStnCd') String? terminalStationCode,
    @JsonKey(name: 'upbdnbSe') String? apiDirection,
    @JsonKey(name: 'trainno') String? trainNo,
    @JsonKey(name: 'trainDptreTm') String? trainDepartureTime,
    @JsonKey(name: 'trainArvlTm') String? trainArrivalTime,
    @JsonKey(name: 'trsitYn') String? transferYn,
    @JsonKey(name: 'nonstopYn') String? nonstopYn,
  }) = _RouteApiPathDto;

  factory RouteApiPathDto.fromJson(Map<String, Object?> json) =>
      _$RouteApiPathDtoFromJson(json);
}

@freezed
abstract class RouteApiStationDto with _$RouteApiStationDto {
  const factory RouteApiStationDto({
    @JsonKey(name: 'stnCd') String? stationCode,
    @JsonKey(name: 'stnNo') String? stationNo,
    @JsonKey(name: 'stnNm') String? stationName,
    @JsonKey(name: 'lineNm') String? lineName,
    @JsonKey(name: 'brlnNm') String? branchLineName,
  }) = _RouteApiStationDto;

  factory RouteApiStationDto.fromJson(Map<String, Object?> json) =>
      _$RouteApiStationDtoFromJson(json);
}
