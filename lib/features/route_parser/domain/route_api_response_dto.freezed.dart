// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_api_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteApiResponseDto {

 RouteApiHeaderDto? get header; RouteApiBodyDto? get body;
/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteApiResponseDtoCopyWith<RouteApiResponseDto> get copyWith => _$RouteApiResponseDtoCopyWithImpl<RouteApiResponseDto>(this as RouteApiResponseDto, _$identity);

  /// Serializes this RouteApiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteApiResponseDto&&(identical(other.header, header) || other.header == header)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,body);

@override
String toString() {
  return 'RouteApiResponseDto(header: $header, body: $body)';
}


}

/// @nodoc
abstract mixin class $RouteApiResponseDtoCopyWith<$Res>  {
  factory $RouteApiResponseDtoCopyWith(RouteApiResponseDto value, $Res Function(RouteApiResponseDto) _then) = _$RouteApiResponseDtoCopyWithImpl;
@useResult
$Res call({
 RouteApiHeaderDto? header, RouteApiBodyDto? body
});


$RouteApiHeaderDtoCopyWith<$Res>? get header;$RouteApiBodyDtoCopyWith<$Res>? get body;

}
/// @nodoc
class _$RouteApiResponseDtoCopyWithImpl<$Res>
    implements $RouteApiResponseDtoCopyWith<$Res> {
  _$RouteApiResponseDtoCopyWithImpl(this._self, this._then);

  final RouteApiResponseDto _self;
  final $Res Function(RouteApiResponseDto) _then;

/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = freezed,Object? body = freezed,}) {
  return _then(_self.copyWith(
header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as RouteApiHeaderDto?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as RouteApiBodyDto?,
  ));
}
/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiHeaderDtoCopyWith<$Res>? get header {
    if (_self.header == null) {
    return null;
  }

  return $RouteApiHeaderDtoCopyWith<$Res>(_self.header!, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiBodyDtoCopyWith<$Res>? get body {
    if (_self.body == null) {
    return null;
  }

  return $RouteApiBodyDtoCopyWith<$Res>(_self.body!, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteApiResponseDto].
extension RouteApiResponseDtoPatterns on RouteApiResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteApiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteApiResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteApiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _RouteApiResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteApiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _RouteApiResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RouteApiHeaderDto? header,  RouteApiBodyDto? body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteApiResponseDto() when $default != null:
return $default(_that.header,_that.body);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RouteApiHeaderDto? header,  RouteApiBodyDto? body)  $default,) {final _that = this;
switch (_that) {
case _RouteApiResponseDto():
return $default(_that.header,_that.body);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RouteApiHeaderDto? header,  RouteApiBodyDto? body)?  $default,) {final _that = this;
switch (_that) {
case _RouteApiResponseDto() when $default != null:
return $default(_that.header,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteApiResponseDto implements RouteApiResponseDto {
  const _RouteApiResponseDto({this.header, this.body});
  factory _RouteApiResponseDto.fromJson(Map<String, dynamic> json) => _$RouteApiResponseDtoFromJson(json);

@override final  RouteApiHeaderDto? header;
@override final  RouteApiBodyDto? body;

/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteApiResponseDtoCopyWith<_RouteApiResponseDto> get copyWith => __$RouteApiResponseDtoCopyWithImpl<_RouteApiResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteApiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteApiResponseDto&&(identical(other.header, header) || other.header == header)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,body);

@override
String toString() {
  return 'RouteApiResponseDto(header: $header, body: $body)';
}


}

/// @nodoc
abstract mixin class _$RouteApiResponseDtoCopyWith<$Res> implements $RouteApiResponseDtoCopyWith<$Res> {
  factory _$RouteApiResponseDtoCopyWith(_RouteApiResponseDto value, $Res Function(_RouteApiResponseDto) _then) = __$RouteApiResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 RouteApiHeaderDto? header, RouteApiBodyDto? body
});


@override $RouteApiHeaderDtoCopyWith<$Res>? get header;@override $RouteApiBodyDtoCopyWith<$Res>? get body;

}
/// @nodoc
class __$RouteApiResponseDtoCopyWithImpl<$Res>
    implements _$RouteApiResponseDtoCopyWith<$Res> {
  __$RouteApiResponseDtoCopyWithImpl(this._self, this._then);

  final _RouteApiResponseDto _self;
  final $Res Function(_RouteApiResponseDto) _then;

/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = freezed,Object? body = freezed,}) {
  return _then(_RouteApiResponseDto(
header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as RouteApiHeaderDto?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as RouteApiBodyDto?,
  ));
}

/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiHeaderDtoCopyWith<$Res>? get header {
    if (_self.header == null) {
    return null;
  }

  return $RouteApiHeaderDtoCopyWith<$Res>(_self.header!, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of RouteApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiBodyDtoCopyWith<$Res>? get body {
    if (_self.body == null) {
    return null;
  }

  return $RouteApiBodyDtoCopyWith<$Res>(_self.body!, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// @nodoc
mixin _$RouteApiHeaderDto {

 String? get resultCode; String? get resultMsg;
/// Create a copy of RouteApiHeaderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteApiHeaderDtoCopyWith<RouteApiHeaderDto> get copyWith => _$RouteApiHeaderDtoCopyWithImpl<RouteApiHeaderDto>(this as RouteApiHeaderDto, _$identity);

  /// Serializes this RouteApiHeaderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteApiHeaderDto&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resultCode,resultMsg);

@override
String toString() {
  return 'RouteApiHeaderDto(resultCode: $resultCode, resultMsg: $resultMsg)';
}


}

/// @nodoc
abstract mixin class $RouteApiHeaderDtoCopyWith<$Res>  {
  factory $RouteApiHeaderDtoCopyWith(RouteApiHeaderDto value, $Res Function(RouteApiHeaderDto) _then) = _$RouteApiHeaderDtoCopyWithImpl;
@useResult
$Res call({
 String? resultCode, String? resultMsg
});




}
/// @nodoc
class _$RouteApiHeaderDtoCopyWithImpl<$Res>
    implements $RouteApiHeaderDtoCopyWith<$Res> {
  _$RouteApiHeaderDtoCopyWithImpl(this._self, this._then);

  final RouteApiHeaderDto _self;
  final $Res Function(RouteApiHeaderDto) _then;

/// Create a copy of RouteApiHeaderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultCode = freezed,Object? resultMsg = freezed,}) {
  return _then(_self.copyWith(
resultCode: freezed == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String?,resultMsg: freezed == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteApiHeaderDto].
extension RouteApiHeaderDtoPatterns on RouteApiHeaderDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteApiHeaderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteApiHeaderDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteApiHeaderDto value)  $default,){
final _that = this;
switch (_that) {
case _RouteApiHeaderDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteApiHeaderDto value)?  $default,){
final _that = this;
switch (_that) {
case _RouteApiHeaderDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? resultCode,  String? resultMsg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteApiHeaderDto() when $default != null:
return $default(_that.resultCode,_that.resultMsg);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? resultCode,  String? resultMsg)  $default,) {final _that = this;
switch (_that) {
case _RouteApiHeaderDto():
return $default(_that.resultCode,_that.resultMsg);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? resultCode,  String? resultMsg)?  $default,) {final _that = this;
switch (_that) {
case _RouteApiHeaderDto() when $default != null:
return $default(_that.resultCode,_that.resultMsg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteApiHeaderDto implements RouteApiHeaderDto {
  const _RouteApiHeaderDto({this.resultCode, this.resultMsg});
  factory _RouteApiHeaderDto.fromJson(Map<String, dynamic> json) => _$RouteApiHeaderDtoFromJson(json);

@override final  String? resultCode;
@override final  String? resultMsg;

/// Create a copy of RouteApiHeaderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteApiHeaderDtoCopyWith<_RouteApiHeaderDto> get copyWith => __$RouteApiHeaderDtoCopyWithImpl<_RouteApiHeaderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteApiHeaderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteApiHeaderDto&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resultCode,resultMsg);

@override
String toString() {
  return 'RouteApiHeaderDto(resultCode: $resultCode, resultMsg: $resultMsg)';
}


}

/// @nodoc
abstract mixin class _$RouteApiHeaderDtoCopyWith<$Res> implements $RouteApiHeaderDtoCopyWith<$Res> {
  factory _$RouteApiHeaderDtoCopyWith(_RouteApiHeaderDto value, $Res Function(_RouteApiHeaderDto) _then) = __$RouteApiHeaderDtoCopyWithImpl;
@override @useResult
$Res call({
 String? resultCode, String? resultMsg
});




}
/// @nodoc
class __$RouteApiHeaderDtoCopyWithImpl<$Res>
    implements _$RouteApiHeaderDtoCopyWith<$Res> {
  __$RouteApiHeaderDtoCopyWithImpl(this._self, this._then);

  final _RouteApiHeaderDto _self;
  final $Res Function(_RouteApiHeaderDto) _then;

/// Create a copy of RouteApiHeaderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultCode = freezed,Object? resultMsg = freezed,}) {
  return _then(_RouteApiHeaderDto(
resultCode: freezed == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String?,resultMsg: freezed == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RouteApiBodyDto {

 int? get totalreqHr; int? get totalCardCrg; int? get trsitNmtm; List<RouteApiTransferDto>? get trfstnNms; List<RouteApiPathDto>? get paths;
/// Create a copy of RouteApiBodyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteApiBodyDtoCopyWith<RouteApiBodyDto> get copyWith => _$RouteApiBodyDtoCopyWithImpl<RouteApiBodyDto>(this as RouteApiBodyDto, _$identity);

  /// Serializes this RouteApiBodyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteApiBodyDto&&(identical(other.totalreqHr, totalreqHr) || other.totalreqHr == totalreqHr)&&(identical(other.totalCardCrg, totalCardCrg) || other.totalCardCrg == totalCardCrg)&&(identical(other.trsitNmtm, trsitNmtm) || other.trsitNmtm == trsitNmtm)&&const DeepCollectionEquality().equals(other.trfstnNms, trfstnNms)&&const DeepCollectionEquality().equals(other.paths, paths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalreqHr,totalCardCrg,trsitNmtm,const DeepCollectionEquality().hash(trfstnNms),const DeepCollectionEquality().hash(paths));

@override
String toString() {
  return 'RouteApiBodyDto(totalreqHr: $totalreqHr, totalCardCrg: $totalCardCrg, trsitNmtm: $trsitNmtm, trfstnNms: $trfstnNms, paths: $paths)';
}


}

/// @nodoc
abstract mixin class $RouteApiBodyDtoCopyWith<$Res>  {
  factory $RouteApiBodyDtoCopyWith(RouteApiBodyDto value, $Res Function(RouteApiBodyDto) _then) = _$RouteApiBodyDtoCopyWithImpl;
@useResult
$Res call({
 int? totalreqHr, int? totalCardCrg, int? trsitNmtm, List<RouteApiTransferDto>? trfstnNms, List<RouteApiPathDto>? paths
});




}
/// @nodoc
class _$RouteApiBodyDtoCopyWithImpl<$Res>
    implements $RouteApiBodyDtoCopyWith<$Res> {
  _$RouteApiBodyDtoCopyWithImpl(this._self, this._then);

  final RouteApiBodyDto _self;
  final $Res Function(RouteApiBodyDto) _then;

/// Create a copy of RouteApiBodyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalreqHr = freezed,Object? totalCardCrg = freezed,Object? trsitNmtm = freezed,Object? trfstnNms = freezed,Object? paths = freezed,}) {
  return _then(_self.copyWith(
totalreqHr: freezed == totalreqHr ? _self.totalreqHr : totalreqHr // ignore: cast_nullable_to_non_nullable
as int?,totalCardCrg: freezed == totalCardCrg ? _self.totalCardCrg : totalCardCrg // ignore: cast_nullable_to_non_nullable
as int?,trsitNmtm: freezed == trsitNmtm ? _self.trsitNmtm : trsitNmtm // ignore: cast_nullable_to_non_nullable
as int?,trfstnNms: freezed == trfstnNms ? _self.trfstnNms : trfstnNms // ignore: cast_nullable_to_non_nullable
as List<RouteApiTransferDto>?,paths: freezed == paths ? _self.paths : paths // ignore: cast_nullable_to_non_nullable
as List<RouteApiPathDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteApiBodyDto].
extension RouteApiBodyDtoPatterns on RouteApiBodyDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteApiBodyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteApiBodyDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteApiBodyDto value)  $default,){
final _that = this;
switch (_that) {
case _RouteApiBodyDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteApiBodyDto value)?  $default,){
final _that = this;
switch (_that) {
case _RouteApiBodyDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? totalreqHr,  int? totalCardCrg,  int? trsitNmtm,  List<RouteApiTransferDto>? trfstnNms,  List<RouteApiPathDto>? paths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteApiBodyDto() when $default != null:
return $default(_that.totalreqHr,_that.totalCardCrg,_that.trsitNmtm,_that.trfstnNms,_that.paths);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? totalreqHr,  int? totalCardCrg,  int? trsitNmtm,  List<RouteApiTransferDto>? trfstnNms,  List<RouteApiPathDto>? paths)  $default,) {final _that = this;
switch (_that) {
case _RouteApiBodyDto():
return $default(_that.totalreqHr,_that.totalCardCrg,_that.trsitNmtm,_that.trfstnNms,_that.paths);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? totalreqHr,  int? totalCardCrg,  int? trsitNmtm,  List<RouteApiTransferDto>? trfstnNms,  List<RouteApiPathDto>? paths)?  $default,) {final _that = this;
switch (_that) {
case _RouteApiBodyDto() when $default != null:
return $default(_that.totalreqHr,_that.totalCardCrg,_that.trsitNmtm,_that.trfstnNms,_that.paths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteApiBodyDto implements RouteApiBodyDto {
  const _RouteApiBodyDto({this.totalreqHr, this.totalCardCrg, this.trsitNmtm, final  List<RouteApiTransferDto>? trfstnNms, final  List<RouteApiPathDto>? paths}): _trfstnNms = trfstnNms,_paths = paths;
  factory _RouteApiBodyDto.fromJson(Map<String, dynamic> json) => _$RouteApiBodyDtoFromJson(json);

@override final  int? totalreqHr;
@override final  int? totalCardCrg;
@override final  int? trsitNmtm;
 final  List<RouteApiTransferDto>? _trfstnNms;
@override List<RouteApiTransferDto>? get trfstnNms {
  final value = _trfstnNms;
  if (value == null) return null;
  if (_trfstnNms is EqualUnmodifiableListView) return _trfstnNms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RouteApiPathDto>? _paths;
@override List<RouteApiPathDto>? get paths {
  final value = _paths;
  if (value == null) return null;
  if (_paths is EqualUnmodifiableListView) return _paths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RouteApiBodyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteApiBodyDtoCopyWith<_RouteApiBodyDto> get copyWith => __$RouteApiBodyDtoCopyWithImpl<_RouteApiBodyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteApiBodyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteApiBodyDto&&(identical(other.totalreqHr, totalreqHr) || other.totalreqHr == totalreqHr)&&(identical(other.totalCardCrg, totalCardCrg) || other.totalCardCrg == totalCardCrg)&&(identical(other.trsitNmtm, trsitNmtm) || other.trsitNmtm == trsitNmtm)&&const DeepCollectionEquality().equals(other._trfstnNms, _trfstnNms)&&const DeepCollectionEquality().equals(other._paths, _paths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalreqHr,totalCardCrg,trsitNmtm,const DeepCollectionEquality().hash(_trfstnNms),const DeepCollectionEquality().hash(_paths));

@override
String toString() {
  return 'RouteApiBodyDto(totalreqHr: $totalreqHr, totalCardCrg: $totalCardCrg, trsitNmtm: $trsitNmtm, trfstnNms: $trfstnNms, paths: $paths)';
}


}

/// @nodoc
abstract mixin class _$RouteApiBodyDtoCopyWith<$Res> implements $RouteApiBodyDtoCopyWith<$Res> {
  factory _$RouteApiBodyDtoCopyWith(_RouteApiBodyDto value, $Res Function(_RouteApiBodyDto) _then) = __$RouteApiBodyDtoCopyWithImpl;
@override @useResult
$Res call({
 int? totalreqHr, int? totalCardCrg, int? trsitNmtm, List<RouteApiTransferDto>? trfstnNms, List<RouteApiPathDto>? paths
});




}
/// @nodoc
class __$RouteApiBodyDtoCopyWithImpl<$Res>
    implements _$RouteApiBodyDtoCopyWith<$Res> {
  __$RouteApiBodyDtoCopyWithImpl(this._self, this._then);

  final _RouteApiBodyDto _self;
  final $Res Function(_RouteApiBodyDto) _then;

/// Create a copy of RouteApiBodyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalreqHr = freezed,Object? totalCardCrg = freezed,Object? trsitNmtm = freezed,Object? trfstnNms = freezed,Object? paths = freezed,}) {
  return _then(_RouteApiBodyDto(
totalreqHr: freezed == totalreqHr ? _self.totalreqHr : totalreqHr // ignore: cast_nullable_to_non_nullable
as int?,totalCardCrg: freezed == totalCardCrg ? _self.totalCardCrg : totalCardCrg // ignore: cast_nullable_to_non_nullable
as int?,trsitNmtm: freezed == trsitNmtm ? _self.trsitNmtm : trsitNmtm // ignore: cast_nullable_to_non_nullable
as int?,trfstnNms: freezed == trfstnNms ? _self._trfstnNms : trfstnNms // ignore: cast_nullable_to_non_nullable
as List<RouteApiTransferDto>?,paths: freezed == paths ? _self._paths : paths // ignore: cast_nullable_to_non_nullable
as List<RouteApiPathDto>?,
  ));
}


}


/// @nodoc
mixin _$RouteApiTransferDto {

 String? get stnNm; String? get dptreLineNm; String? get arvlLineNm;
/// Create a copy of RouteApiTransferDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteApiTransferDtoCopyWith<RouteApiTransferDto> get copyWith => _$RouteApiTransferDtoCopyWithImpl<RouteApiTransferDto>(this as RouteApiTransferDto, _$identity);

  /// Serializes this RouteApiTransferDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteApiTransferDto&&(identical(other.stnNm, stnNm) || other.stnNm == stnNm)&&(identical(other.dptreLineNm, dptreLineNm) || other.dptreLineNm == dptreLineNm)&&(identical(other.arvlLineNm, arvlLineNm) || other.arvlLineNm == arvlLineNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stnNm,dptreLineNm,arvlLineNm);

@override
String toString() {
  return 'RouteApiTransferDto(stnNm: $stnNm, dptreLineNm: $dptreLineNm, arvlLineNm: $arvlLineNm)';
}


}

/// @nodoc
abstract mixin class $RouteApiTransferDtoCopyWith<$Res>  {
  factory $RouteApiTransferDtoCopyWith(RouteApiTransferDto value, $Res Function(RouteApiTransferDto) _then) = _$RouteApiTransferDtoCopyWithImpl;
@useResult
$Res call({
 String? stnNm, String? dptreLineNm, String? arvlLineNm
});




}
/// @nodoc
class _$RouteApiTransferDtoCopyWithImpl<$Res>
    implements $RouteApiTransferDtoCopyWith<$Res> {
  _$RouteApiTransferDtoCopyWithImpl(this._self, this._then);

  final RouteApiTransferDto _self;
  final $Res Function(RouteApiTransferDto) _then;

/// Create a copy of RouteApiTransferDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stnNm = freezed,Object? dptreLineNm = freezed,Object? arvlLineNm = freezed,}) {
  return _then(_self.copyWith(
stnNm: freezed == stnNm ? _self.stnNm : stnNm // ignore: cast_nullable_to_non_nullable
as String?,dptreLineNm: freezed == dptreLineNm ? _self.dptreLineNm : dptreLineNm // ignore: cast_nullable_to_non_nullable
as String?,arvlLineNm: freezed == arvlLineNm ? _self.arvlLineNm : arvlLineNm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteApiTransferDto].
extension RouteApiTransferDtoPatterns on RouteApiTransferDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteApiTransferDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteApiTransferDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteApiTransferDto value)  $default,){
final _that = this;
switch (_that) {
case _RouteApiTransferDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteApiTransferDto value)?  $default,){
final _that = this;
switch (_that) {
case _RouteApiTransferDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? stnNm,  String? dptreLineNm,  String? arvlLineNm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteApiTransferDto() when $default != null:
return $default(_that.stnNm,_that.dptreLineNm,_that.arvlLineNm);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? stnNm,  String? dptreLineNm,  String? arvlLineNm)  $default,) {final _that = this;
switch (_that) {
case _RouteApiTransferDto():
return $default(_that.stnNm,_that.dptreLineNm,_that.arvlLineNm);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? stnNm,  String? dptreLineNm,  String? arvlLineNm)?  $default,) {final _that = this;
switch (_that) {
case _RouteApiTransferDto() when $default != null:
return $default(_that.stnNm,_that.dptreLineNm,_that.arvlLineNm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteApiTransferDto implements RouteApiTransferDto {
  const _RouteApiTransferDto({this.stnNm, this.dptreLineNm, this.arvlLineNm});
  factory _RouteApiTransferDto.fromJson(Map<String, dynamic> json) => _$RouteApiTransferDtoFromJson(json);

@override final  String? stnNm;
@override final  String? dptreLineNm;
@override final  String? arvlLineNm;

/// Create a copy of RouteApiTransferDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteApiTransferDtoCopyWith<_RouteApiTransferDto> get copyWith => __$RouteApiTransferDtoCopyWithImpl<_RouteApiTransferDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteApiTransferDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteApiTransferDto&&(identical(other.stnNm, stnNm) || other.stnNm == stnNm)&&(identical(other.dptreLineNm, dptreLineNm) || other.dptreLineNm == dptreLineNm)&&(identical(other.arvlLineNm, arvlLineNm) || other.arvlLineNm == arvlLineNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stnNm,dptreLineNm,arvlLineNm);

@override
String toString() {
  return 'RouteApiTransferDto(stnNm: $stnNm, dptreLineNm: $dptreLineNm, arvlLineNm: $arvlLineNm)';
}


}

/// @nodoc
abstract mixin class _$RouteApiTransferDtoCopyWith<$Res> implements $RouteApiTransferDtoCopyWith<$Res> {
  factory _$RouteApiTransferDtoCopyWith(_RouteApiTransferDto value, $Res Function(_RouteApiTransferDto) _then) = __$RouteApiTransferDtoCopyWithImpl;
@override @useResult
$Res call({
 String? stnNm, String? dptreLineNm, String? arvlLineNm
});




}
/// @nodoc
class __$RouteApiTransferDtoCopyWithImpl<$Res>
    implements _$RouteApiTransferDtoCopyWith<$Res> {
  __$RouteApiTransferDtoCopyWithImpl(this._self, this._then);

  final _RouteApiTransferDto _self;
  final $Res Function(_RouteApiTransferDto) _then;

/// Create a copy of RouteApiTransferDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stnNm = freezed,Object? dptreLineNm = freezed,Object? arvlLineNm = freezed,}) {
  return _then(_RouteApiTransferDto(
stnNm: freezed == stnNm ? _self.stnNm : stnNm // ignore: cast_nullable_to_non_nullable
as String?,dptreLineNm: freezed == dptreLineNm ? _self.dptreLineNm : dptreLineNm // ignore: cast_nullable_to_non_nullable
as String?,arvlLineNm: freezed == arvlLineNm ? _self.arvlLineNm : arvlLineNm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RouteApiPathDto {

@JsonKey(name: 'dptreStn') RouteApiStationDto? get departureStation;@JsonKey(name: 'arvlStn') RouteApiStationDto? get arrivalStation;@JsonKey(name: 'stnSctnDstc') int? get sectionDistanceMeters;@JsonKey(name: 'reqHr') int? get sectionDurationSeconds;@JsonKey(name: 'wtngHr') int? get waitingSeconds;@JsonKey(name: 'tmnlStnNm') String? get terminalStationName;@JsonKey(name: 'tmnlStnCd') String? get terminalStationCode;@JsonKey(name: 'upbdnbSe') String? get apiDirection;@JsonKey(name: 'trainno') String? get trainNo;@JsonKey(name: 'trainDptreTm') String? get trainDepartureTime;@JsonKey(name: 'trainArvlTm') String? get trainArrivalTime;@JsonKey(name: 'trsitYn') String? get transferYn;@JsonKey(name: 'nonstopYn') String? get nonstopYn;
/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteApiPathDtoCopyWith<RouteApiPathDto> get copyWith => _$RouteApiPathDtoCopyWithImpl<RouteApiPathDto>(this as RouteApiPathDto, _$identity);

  /// Serializes this RouteApiPathDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteApiPathDto&&(identical(other.departureStation, departureStation) || other.departureStation == departureStation)&&(identical(other.arrivalStation, arrivalStation) || other.arrivalStation == arrivalStation)&&(identical(other.sectionDistanceMeters, sectionDistanceMeters) || other.sectionDistanceMeters == sectionDistanceMeters)&&(identical(other.sectionDurationSeconds, sectionDurationSeconds) || other.sectionDurationSeconds == sectionDurationSeconds)&&(identical(other.waitingSeconds, waitingSeconds) || other.waitingSeconds == waitingSeconds)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.trainNo, trainNo) || other.trainNo == trainNo)&&(identical(other.trainDepartureTime, trainDepartureTime) || other.trainDepartureTime == trainDepartureTime)&&(identical(other.trainArrivalTime, trainArrivalTime) || other.trainArrivalTime == trainArrivalTime)&&(identical(other.transferYn, transferYn) || other.transferYn == transferYn)&&(identical(other.nonstopYn, nonstopYn) || other.nonstopYn == nonstopYn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureStation,arrivalStation,sectionDistanceMeters,sectionDurationSeconds,waitingSeconds,terminalStationName,terminalStationCode,apiDirection,trainNo,trainDepartureTime,trainArrivalTime,transferYn,nonstopYn);

@override
String toString() {
  return 'RouteApiPathDto(departureStation: $departureStation, arrivalStation: $arrivalStation, sectionDistanceMeters: $sectionDistanceMeters, sectionDurationSeconds: $sectionDurationSeconds, waitingSeconds: $waitingSeconds, terminalStationName: $terminalStationName, terminalStationCode: $terminalStationCode, apiDirection: $apiDirection, trainNo: $trainNo, trainDepartureTime: $trainDepartureTime, trainArrivalTime: $trainArrivalTime, transferYn: $transferYn, nonstopYn: $nonstopYn)';
}


}

/// @nodoc
abstract mixin class $RouteApiPathDtoCopyWith<$Res>  {
  factory $RouteApiPathDtoCopyWith(RouteApiPathDto value, $Res Function(RouteApiPathDto) _then) = _$RouteApiPathDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dptreStn') RouteApiStationDto? departureStation,@JsonKey(name: 'arvlStn') RouteApiStationDto? arrivalStation,@JsonKey(name: 'stnSctnDstc') int? sectionDistanceMeters,@JsonKey(name: 'reqHr') int? sectionDurationSeconds,@JsonKey(name: 'wtngHr') int? waitingSeconds,@JsonKey(name: 'tmnlStnNm') String? terminalStationName,@JsonKey(name: 'tmnlStnCd') String? terminalStationCode,@JsonKey(name: 'upbdnbSe') String? apiDirection,@JsonKey(name: 'trainno') String? trainNo,@JsonKey(name: 'trainDptreTm') String? trainDepartureTime,@JsonKey(name: 'trainArvlTm') String? trainArrivalTime,@JsonKey(name: 'trsitYn') String? transferYn,@JsonKey(name: 'nonstopYn') String? nonstopYn
});


$RouteApiStationDtoCopyWith<$Res>? get departureStation;$RouteApiStationDtoCopyWith<$Res>? get arrivalStation;

}
/// @nodoc
class _$RouteApiPathDtoCopyWithImpl<$Res>
    implements $RouteApiPathDtoCopyWith<$Res> {
  _$RouteApiPathDtoCopyWithImpl(this._self, this._then);

  final RouteApiPathDto _self;
  final $Res Function(RouteApiPathDto) _then;

/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departureStation = freezed,Object? arrivalStation = freezed,Object? sectionDistanceMeters = freezed,Object? sectionDurationSeconds = freezed,Object? waitingSeconds = freezed,Object? terminalStationName = freezed,Object? terminalStationCode = freezed,Object? apiDirection = freezed,Object? trainNo = freezed,Object? trainDepartureTime = freezed,Object? trainArrivalTime = freezed,Object? transferYn = freezed,Object? nonstopYn = freezed,}) {
  return _then(_self.copyWith(
departureStation: freezed == departureStation ? _self.departureStation : departureStation // ignore: cast_nullable_to_non_nullable
as RouteApiStationDto?,arrivalStation: freezed == arrivalStation ? _self.arrivalStation : arrivalStation // ignore: cast_nullable_to_non_nullable
as RouteApiStationDto?,sectionDistanceMeters: freezed == sectionDistanceMeters ? _self.sectionDistanceMeters : sectionDistanceMeters // ignore: cast_nullable_to_non_nullable
as int?,sectionDurationSeconds: freezed == sectionDurationSeconds ? _self.sectionDurationSeconds : sectionDurationSeconds // ignore: cast_nullable_to_non_nullable
as int?,waitingSeconds: freezed == waitingSeconds ? _self.waitingSeconds : waitingSeconds // ignore: cast_nullable_to_non_nullable
as int?,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,trainNo: freezed == trainNo ? _self.trainNo : trainNo // ignore: cast_nullable_to_non_nullable
as String?,trainDepartureTime: freezed == trainDepartureTime ? _self.trainDepartureTime : trainDepartureTime // ignore: cast_nullable_to_non_nullable
as String?,trainArrivalTime: freezed == trainArrivalTime ? _self.trainArrivalTime : trainArrivalTime // ignore: cast_nullable_to_non_nullable
as String?,transferYn: freezed == transferYn ? _self.transferYn : transferYn // ignore: cast_nullable_to_non_nullable
as String?,nonstopYn: freezed == nonstopYn ? _self.nonstopYn : nonstopYn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiStationDtoCopyWith<$Res>? get departureStation {
    if (_self.departureStation == null) {
    return null;
  }

  return $RouteApiStationDtoCopyWith<$Res>(_self.departureStation!, (value) {
    return _then(_self.copyWith(departureStation: value));
  });
}/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiStationDtoCopyWith<$Res>? get arrivalStation {
    if (_self.arrivalStation == null) {
    return null;
  }

  return $RouteApiStationDtoCopyWith<$Res>(_self.arrivalStation!, (value) {
    return _then(_self.copyWith(arrivalStation: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteApiPathDto].
extension RouteApiPathDtoPatterns on RouteApiPathDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteApiPathDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteApiPathDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteApiPathDto value)  $default,){
final _that = this;
switch (_that) {
case _RouteApiPathDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteApiPathDto value)?  $default,){
final _that = this;
switch (_that) {
case _RouteApiPathDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dptreStn')  RouteApiStationDto? departureStation, @JsonKey(name: 'arvlStn')  RouteApiStationDto? arrivalStation, @JsonKey(name: 'stnSctnDstc')  int? sectionDistanceMeters, @JsonKey(name: 'reqHr')  int? sectionDurationSeconds, @JsonKey(name: 'wtngHr')  int? waitingSeconds, @JsonKey(name: 'tmnlStnNm')  String? terminalStationName, @JsonKey(name: 'tmnlStnCd')  String? terminalStationCode, @JsonKey(name: 'upbdnbSe')  String? apiDirection, @JsonKey(name: 'trainno')  String? trainNo, @JsonKey(name: 'trainDptreTm')  String? trainDepartureTime, @JsonKey(name: 'trainArvlTm')  String? trainArrivalTime, @JsonKey(name: 'trsitYn')  String? transferYn, @JsonKey(name: 'nonstopYn')  String? nonstopYn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteApiPathDto() when $default != null:
return $default(_that.departureStation,_that.arrivalStation,_that.sectionDistanceMeters,_that.sectionDurationSeconds,_that.waitingSeconds,_that.terminalStationName,_that.terminalStationCode,_that.apiDirection,_that.trainNo,_that.trainDepartureTime,_that.trainArrivalTime,_that.transferYn,_that.nonstopYn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dptreStn')  RouteApiStationDto? departureStation, @JsonKey(name: 'arvlStn')  RouteApiStationDto? arrivalStation, @JsonKey(name: 'stnSctnDstc')  int? sectionDistanceMeters, @JsonKey(name: 'reqHr')  int? sectionDurationSeconds, @JsonKey(name: 'wtngHr')  int? waitingSeconds, @JsonKey(name: 'tmnlStnNm')  String? terminalStationName, @JsonKey(name: 'tmnlStnCd')  String? terminalStationCode, @JsonKey(name: 'upbdnbSe')  String? apiDirection, @JsonKey(name: 'trainno')  String? trainNo, @JsonKey(name: 'trainDptreTm')  String? trainDepartureTime, @JsonKey(name: 'trainArvlTm')  String? trainArrivalTime, @JsonKey(name: 'trsitYn')  String? transferYn, @JsonKey(name: 'nonstopYn')  String? nonstopYn)  $default,) {final _that = this;
switch (_that) {
case _RouteApiPathDto():
return $default(_that.departureStation,_that.arrivalStation,_that.sectionDistanceMeters,_that.sectionDurationSeconds,_that.waitingSeconds,_that.terminalStationName,_that.terminalStationCode,_that.apiDirection,_that.trainNo,_that.trainDepartureTime,_that.trainArrivalTime,_that.transferYn,_that.nonstopYn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dptreStn')  RouteApiStationDto? departureStation, @JsonKey(name: 'arvlStn')  RouteApiStationDto? arrivalStation, @JsonKey(name: 'stnSctnDstc')  int? sectionDistanceMeters, @JsonKey(name: 'reqHr')  int? sectionDurationSeconds, @JsonKey(name: 'wtngHr')  int? waitingSeconds, @JsonKey(name: 'tmnlStnNm')  String? terminalStationName, @JsonKey(name: 'tmnlStnCd')  String? terminalStationCode, @JsonKey(name: 'upbdnbSe')  String? apiDirection, @JsonKey(name: 'trainno')  String? trainNo, @JsonKey(name: 'trainDptreTm')  String? trainDepartureTime, @JsonKey(name: 'trainArvlTm')  String? trainArrivalTime, @JsonKey(name: 'trsitYn')  String? transferYn, @JsonKey(name: 'nonstopYn')  String? nonstopYn)?  $default,) {final _that = this;
switch (_that) {
case _RouteApiPathDto() when $default != null:
return $default(_that.departureStation,_that.arrivalStation,_that.sectionDistanceMeters,_that.sectionDurationSeconds,_that.waitingSeconds,_that.terminalStationName,_that.terminalStationCode,_that.apiDirection,_that.trainNo,_that.trainDepartureTime,_that.trainArrivalTime,_that.transferYn,_that.nonstopYn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteApiPathDto implements RouteApiPathDto {
  const _RouteApiPathDto({@JsonKey(name: 'dptreStn') this.departureStation, @JsonKey(name: 'arvlStn') this.arrivalStation, @JsonKey(name: 'stnSctnDstc') this.sectionDistanceMeters, @JsonKey(name: 'reqHr') this.sectionDurationSeconds, @JsonKey(name: 'wtngHr') this.waitingSeconds, @JsonKey(name: 'tmnlStnNm') this.terminalStationName, @JsonKey(name: 'tmnlStnCd') this.terminalStationCode, @JsonKey(name: 'upbdnbSe') this.apiDirection, @JsonKey(name: 'trainno') this.trainNo, @JsonKey(name: 'trainDptreTm') this.trainDepartureTime, @JsonKey(name: 'trainArvlTm') this.trainArrivalTime, @JsonKey(name: 'trsitYn') this.transferYn, @JsonKey(name: 'nonstopYn') this.nonstopYn});
  factory _RouteApiPathDto.fromJson(Map<String, dynamic> json) => _$RouteApiPathDtoFromJson(json);

@override@JsonKey(name: 'dptreStn') final  RouteApiStationDto? departureStation;
@override@JsonKey(name: 'arvlStn') final  RouteApiStationDto? arrivalStation;
@override@JsonKey(name: 'stnSctnDstc') final  int? sectionDistanceMeters;
@override@JsonKey(name: 'reqHr') final  int? sectionDurationSeconds;
@override@JsonKey(name: 'wtngHr') final  int? waitingSeconds;
@override@JsonKey(name: 'tmnlStnNm') final  String? terminalStationName;
@override@JsonKey(name: 'tmnlStnCd') final  String? terminalStationCode;
@override@JsonKey(name: 'upbdnbSe') final  String? apiDirection;
@override@JsonKey(name: 'trainno') final  String? trainNo;
@override@JsonKey(name: 'trainDptreTm') final  String? trainDepartureTime;
@override@JsonKey(name: 'trainArvlTm') final  String? trainArrivalTime;
@override@JsonKey(name: 'trsitYn') final  String? transferYn;
@override@JsonKey(name: 'nonstopYn') final  String? nonstopYn;

/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteApiPathDtoCopyWith<_RouteApiPathDto> get copyWith => __$RouteApiPathDtoCopyWithImpl<_RouteApiPathDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteApiPathDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteApiPathDto&&(identical(other.departureStation, departureStation) || other.departureStation == departureStation)&&(identical(other.arrivalStation, arrivalStation) || other.arrivalStation == arrivalStation)&&(identical(other.sectionDistanceMeters, sectionDistanceMeters) || other.sectionDistanceMeters == sectionDistanceMeters)&&(identical(other.sectionDurationSeconds, sectionDurationSeconds) || other.sectionDurationSeconds == sectionDurationSeconds)&&(identical(other.waitingSeconds, waitingSeconds) || other.waitingSeconds == waitingSeconds)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.trainNo, trainNo) || other.trainNo == trainNo)&&(identical(other.trainDepartureTime, trainDepartureTime) || other.trainDepartureTime == trainDepartureTime)&&(identical(other.trainArrivalTime, trainArrivalTime) || other.trainArrivalTime == trainArrivalTime)&&(identical(other.transferYn, transferYn) || other.transferYn == transferYn)&&(identical(other.nonstopYn, nonstopYn) || other.nonstopYn == nonstopYn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureStation,arrivalStation,sectionDistanceMeters,sectionDurationSeconds,waitingSeconds,terminalStationName,terminalStationCode,apiDirection,trainNo,trainDepartureTime,trainArrivalTime,transferYn,nonstopYn);

@override
String toString() {
  return 'RouteApiPathDto(departureStation: $departureStation, arrivalStation: $arrivalStation, sectionDistanceMeters: $sectionDistanceMeters, sectionDurationSeconds: $sectionDurationSeconds, waitingSeconds: $waitingSeconds, terminalStationName: $terminalStationName, terminalStationCode: $terminalStationCode, apiDirection: $apiDirection, trainNo: $trainNo, trainDepartureTime: $trainDepartureTime, trainArrivalTime: $trainArrivalTime, transferYn: $transferYn, nonstopYn: $nonstopYn)';
}


}

/// @nodoc
abstract mixin class _$RouteApiPathDtoCopyWith<$Res> implements $RouteApiPathDtoCopyWith<$Res> {
  factory _$RouteApiPathDtoCopyWith(_RouteApiPathDto value, $Res Function(_RouteApiPathDto) _then) = __$RouteApiPathDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dptreStn') RouteApiStationDto? departureStation,@JsonKey(name: 'arvlStn') RouteApiStationDto? arrivalStation,@JsonKey(name: 'stnSctnDstc') int? sectionDistanceMeters,@JsonKey(name: 'reqHr') int? sectionDurationSeconds,@JsonKey(name: 'wtngHr') int? waitingSeconds,@JsonKey(name: 'tmnlStnNm') String? terminalStationName,@JsonKey(name: 'tmnlStnCd') String? terminalStationCode,@JsonKey(name: 'upbdnbSe') String? apiDirection,@JsonKey(name: 'trainno') String? trainNo,@JsonKey(name: 'trainDptreTm') String? trainDepartureTime,@JsonKey(name: 'trainArvlTm') String? trainArrivalTime,@JsonKey(name: 'trsitYn') String? transferYn,@JsonKey(name: 'nonstopYn') String? nonstopYn
});


@override $RouteApiStationDtoCopyWith<$Res>? get departureStation;@override $RouteApiStationDtoCopyWith<$Res>? get arrivalStation;

}
/// @nodoc
class __$RouteApiPathDtoCopyWithImpl<$Res>
    implements _$RouteApiPathDtoCopyWith<$Res> {
  __$RouteApiPathDtoCopyWithImpl(this._self, this._then);

  final _RouteApiPathDto _self;
  final $Res Function(_RouteApiPathDto) _then;

/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departureStation = freezed,Object? arrivalStation = freezed,Object? sectionDistanceMeters = freezed,Object? sectionDurationSeconds = freezed,Object? waitingSeconds = freezed,Object? terminalStationName = freezed,Object? terminalStationCode = freezed,Object? apiDirection = freezed,Object? trainNo = freezed,Object? trainDepartureTime = freezed,Object? trainArrivalTime = freezed,Object? transferYn = freezed,Object? nonstopYn = freezed,}) {
  return _then(_RouteApiPathDto(
departureStation: freezed == departureStation ? _self.departureStation : departureStation // ignore: cast_nullable_to_non_nullable
as RouteApiStationDto?,arrivalStation: freezed == arrivalStation ? _self.arrivalStation : arrivalStation // ignore: cast_nullable_to_non_nullable
as RouteApiStationDto?,sectionDistanceMeters: freezed == sectionDistanceMeters ? _self.sectionDistanceMeters : sectionDistanceMeters // ignore: cast_nullable_to_non_nullable
as int?,sectionDurationSeconds: freezed == sectionDurationSeconds ? _self.sectionDurationSeconds : sectionDurationSeconds // ignore: cast_nullable_to_non_nullable
as int?,waitingSeconds: freezed == waitingSeconds ? _self.waitingSeconds : waitingSeconds // ignore: cast_nullable_to_non_nullable
as int?,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,trainNo: freezed == trainNo ? _self.trainNo : trainNo // ignore: cast_nullable_to_non_nullable
as String?,trainDepartureTime: freezed == trainDepartureTime ? _self.trainDepartureTime : trainDepartureTime // ignore: cast_nullable_to_non_nullable
as String?,trainArrivalTime: freezed == trainArrivalTime ? _self.trainArrivalTime : trainArrivalTime // ignore: cast_nullable_to_non_nullable
as String?,transferYn: freezed == transferYn ? _self.transferYn : transferYn // ignore: cast_nullable_to_non_nullable
as String?,nonstopYn: freezed == nonstopYn ? _self.nonstopYn : nonstopYn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiStationDtoCopyWith<$Res>? get departureStation {
    if (_self.departureStation == null) {
    return null;
  }

  return $RouteApiStationDtoCopyWith<$Res>(_self.departureStation!, (value) {
    return _then(_self.copyWith(departureStation: value));
  });
}/// Create a copy of RouteApiPathDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteApiStationDtoCopyWith<$Res>? get arrivalStation {
    if (_self.arrivalStation == null) {
    return null;
  }

  return $RouteApiStationDtoCopyWith<$Res>(_self.arrivalStation!, (value) {
    return _then(_self.copyWith(arrivalStation: value));
  });
}
}


/// @nodoc
mixin _$RouteApiStationDto {

@JsonKey(name: 'stnCd') String? get stationCode;@JsonKey(name: 'stnNo') String? get stationNo;@JsonKey(name: 'stnNm') String? get stationName;@JsonKey(name: 'lineNm') String? get lineName;@JsonKey(name: 'brlnNm') String? get branchLineName;
/// Create a copy of RouteApiStationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteApiStationDtoCopyWith<RouteApiStationDto> get copyWith => _$RouteApiStationDtoCopyWithImpl<RouteApiStationDto>(this as RouteApiStationDto, _$identity);

  /// Serializes this RouteApiStationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteApiStationDto&&(identical(other.stationCode, stationCode) || other.stationCode == stationCode)&&(identical(other.stationNo, stationNo) || other.stationNo == stationNo)&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.branchLineName, branchLineName) || other.branchLineName == branchLineName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationCode,stationNo,stationName,lineName,branchLineName);

@override
String toString() {
  return 'RouteApiStationDto(stationCode: $stationCode, stationNo: $stationNo, stationName: $stationName, lineName: $lineName, branchLineName: $branchLineName)';
}


}

/// @nodoc
abstract mixin class $RouteApiStationDtoCopyWith<$Res>  {
  factory $RouteApiStationDtoCopyWith(RouteApiStationDto value, $Res Function(RouteApiStationDto) _then) = _$RouteApiStationDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'stnCd') String? stationCode,@JsonKey(name: 'stnNo') String? stationNo,@JsonKey(name: 'stnNm') String? stationName,@JsonKey(name: 'lineNm') String? lineName,@JsonKey(name: 'brlnNm') String? branchLineName
});




}
/// @nodoc
class _$RouteApiStationDtoCopyWithImpl<$Res>
    implements $RouteApiStationDtoCopyWith<$Res> {
  _$RouteApiStationDtoCopyWithImpl(this._self, this._then);

  final RouteApiStationDto _self;
  final $Res Function(RouteApiStationDto) _then;

/// Create a copy of RouteApiStationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationCode = freezed,Object? stationNo = freezed,Object? stationName = freezed,Object? lineName = freezed,Object? branchLineName = freezed,}) {
  return _then(_self.copyWith(
stationCode: freezed == stationCode ? _self.stationCode : stationCode // ignore: cast_nullable_to_non_nullable
as String?,stationNo: freezed == stationNo ? _self.stationNo : stationNo // ignore: cast_nullable_to_non_nullable
as String?,stationName: freezed == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String?,lineName: freezed == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String?,branchLineName: freezed == branchLineName ? _self.branchLineName : branchLineName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteApiStationDto].
extension RouteApiStationDtoPatterns on RouteApiStationDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteApiStationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteApiStationDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteApiStationDto value)  $default,){
final _that = this;
switch (_that) {
case _RouteApiStationDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteApiStationDto value)?  $default,){
final _that = this;
switch (_that) {
case _RouteApiStationDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'stnCd')  String? stationCode, @JsonKey(name: 'stnNo')  String? stationNo, @JsonKey(name: 'stnNm')  String? stationName, @JsonKey(name: 'lineNm')  String? lineName, @JsonKey(name: 'brlnNm')  String? branchLineName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteApiStationDto() when $default != null:
return $default(_that.stationCode,_that.stationNo,_that.stationName,_that.lineName,_that.branchLineName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'stnCd')  String? stationCode, @JsonKey(name: 'stnNo')  String? stationNo, @JsonKey(name: 'stnNm')  String? stationName, @JsonKey(name: 'lineNm')  String? lineName, @JsonKey(name: 'brlnNm')  String? branchLineName)  $default,) {final _that = this;
switch (_that) {
case _RouteApiStationDto():
return $default(_that.stationCode,_that.stationNo,_that.stationName,_that.lineName,_that.branchLineName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'stnCd')  String? stationCode, @JsonKey(name: 'stnNo')  String? stationNo, @JsonKey(name: 'stnNm')  String? stationName, @JsonKey(name: 'lineNm')  String? lineName, @JsonKey(name: 'brlnNm')  String? branchLineName)?  $default,) {final _that = this;
switch (_that) {
case _RouteApiStationDto() when $default != null:
return $default(_that.stationCode,_that.stationNo,_that.stationName,_that.lineName,_that.branchLineName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteApiStationDto implements RouteApiStationDto {
  const _RouteApiStationDto({@JsonKey(name: 'stnCd') this.stationCode, @JsonKey(name: 'stnNo') this.stationNo, @JsonKey(name: 'stnNm') this.stationName, @JsonKey(name: 'lineNm') this.lineName, @JsonKey(name: 'brlnNm') this.branchLineName});
  factory _RouteApiStationDto.fromJson(Map<String, dynamic> json) => _$RouteApiStationDtoFromJson(json);

@override@JsonKey(name: 'stnCd') final  String? stationCode;
@override@JsonKey(name: 'stnNo') final  String? stationNo;
@override@JsonKey(name: 'stnNm') final  String? stationName;
@override@JsonKey(name: 'lineNm') final  String? lineName;
@override@JsonKey(name: 'brlnNm') final  String? branchLineName;

/// Create a copy of RouteApiStationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteApiStationDtoCopyWith<_RouteApiStationDto> get copyWith => __$RouteApiStationDtoCopyWithImpl<_RouteApiStationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteApiStationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteApiStationDto&&(identical(other.stationCode, stationCode) || other.stationCode == stationCode)&&(identical(other.stationNo, stationNo) || other.stationNo == stationNo)&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.branchLineName, branchLineName) || other.branchLineName == branchLineName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationCode,stationNo,stationName,lineName,branchLineName);

@override
String toString() {
  return 'RouteApiStationDto(stationCode: $stationCode, stationNo: $stationNo, stationName: $stationName, lineName: $lineName, branchLineName: $branchLineName)';
}


}

/// @nodoc
abstract mixin class _$RouteApiStationDtoCopyWith<$Res> implements $RouteApiStationDtoCopyWith<$Res> {
  factory _$RouteApiStationDtoCopyWith(_RouteApiStationDto value, $Res Function(_RouteApiStationDto) _then) = __$RouteApiStationDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'stnCd') String? stationCode,@JsonKey(name: 'stnNo') String? stationNo,@JsonKey(name: 'stnNm') String? stationName,@JsonKey(name: 'lineNm') String? lineName,@JsonKey(name: 'brlnNm') String? branchLineName
});




}
/// @nodoc
class __$RouteApiStationDtoCopyWithImpl<$Res>
    implements _$RouteApiStationDtoCopyWith<$Res> {
  __$RouteApiStationDtoCopyWithImpl(this._self, this._then);

  final _RouteApiStationDto _self;
  final $Res Function(_RouteApiStationDto) _then;

/// Create a copy of RouteApiStationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationCode = freezed,Object? stationNo = freezed,Object? stationName = freezed,Object? lineName = freezed,Object? branchLineName = freezed,}) {
  return _then(_RouteApiStationDto(
stationCode: freezed == stationCode ? _self.stationCode : stationCode // ignore: cast_nullable_to_non_nullable
as String?,stationNo: freezed == stationNo ? _self.stationNo : stationNo // ignore: cast_nullable_to_non_nullable
as String?,stationName: freezed == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String?,lineName: freezed == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String?,branchLineName: freezed == branchLineName ? _self.branchLineName : branchLineName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
