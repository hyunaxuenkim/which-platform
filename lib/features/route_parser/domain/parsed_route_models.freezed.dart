// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_route_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParsedRouteParseResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedRouteParseResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParsedRouteParseResult()';
}


}

/// @nodoc
class $ParsedRouteParseResultCopyWith<$Res>  {
$ParsedRouteParseResultCopyWith(ParsedRouteParseResult _, $Res Function(ParsedRouteParseResult) __);
}


/// Adds pattern-matching-related methods to [ParsedRouteParseResult].
extension ParsedRouteParseResultPatterns on ParsedRouteParseResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ParsedRouteParseSuccess value)?  success,TResult Function( ParsedRouteParseFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ParsedRouteParseSuccess() when success != null:
return success(_that);case ParsedRouteParseFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ParsedRouteParseSuccess value)  success,required TResult Function( ParsedRouteParseFailure value)  failure,}){
final _that = this;
switch (_that) {
case ParsedRouteParseSuccess():
return success(_that);case ParsedRouteParseFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ParsedRouteParseSuccess value)?  success,TResult? Function( ParsedRouteParseFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ParsedRouteParseSuccess() when success != null:
return success(_that);case ParsedRouteParseFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ParsedRoute route)?  success,TResult Function( ParseFailureCode code,  String? message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ParsedRouteParseSuccess() when success != null:
return success(_that.route);case ParsedRouteParseFailure() when failure != null:
return failure(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ParsedRoute route)  success,required TResult Function( ParseFailureCode code,  String? message)  failure,}) {final _that = this;
switch (_that) {
case ParsedRouteParseSuccess():
return success(_that.route);case ParsedRouteParseFailure():
return failure(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ParsedRoute route)?  success,TResult? Function( ParseFailureCode code,  String? message)?  failure,}) {final _that = this;
switch (_that) {
case ParsedRouteParseSuccess() when success != null:
return success(_that.route);case ParsedRouteParseFailure() when failure != null:
return failure(_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ParsedRouteParseSuccess implements ParsedRouteParseResult {
  const ParsedRouteParseSuccess({required this.route});
  

 final  ParsedRoute route;

/// Create a copy of ParsedRouteParseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedRouteParseSuccessCopyWith<ParsedRouteParseSuccess> get copyWith => _$ParsedRouteParseSuccessCopyWithImpl<ParsedRouteParseSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedRouteParseSuccess&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,route);

@override
String toString() {
  return 'ParsedRouteParseResult.success(route: $route)';
}


}

/// @nodoc
abstract mixin class $ParsedRouteParseSuccessCopyWith<$Res> implements $ParsedRouteParseResultCopyWith<$Res> {
  factory $ParsedRouteParseSuccessCopyWith(ParsedRouteParseSuccess value, $Res Function(ParsedRouteParseSuccess) _then) = _$ParsedRouteParseSuccessCopyWithImpl;
@useResult
$Res call({
 ParsedRoute route
});


$ParsedRouteCopyWith<$Res> get route;

}
/// @nodoc
class _$ParsedRouteParseSuccessCopyWithImpl<$Res>
    implements $ParsedRouteParseSuccessCopyWith<$Res> {
  _$ParsedRouteParseSuccessCopyWithImpl(this._self, this._then);

  final ParsedRouteParseSuccess _self;
  final $Res Function(ParsedRouteParseSuccess) _then;

/// Create a copy of ParsedRouteParseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,}) {
  return _then(ParsedRouteParseSuccess(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as ParsedRoute,
  ));
}

/// Create a copy of ParsedRouteParseResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedRouteCopyWith<$Res> get route {
  
  return $ParsedRouteCopyWith<$Res>(_self.route, (value) {
    return _then(_self.copyWith(route: value));
  });
}
}

/// @nodoc


class ParsedRouteParseFailure implements ParsedRouteParseResult {
  const ParsedRouteParseFailure({required this.code, this.message});
  

 final  ParseFailureCode code;
 final  String? message;

/// Create a copy of ParsedRouteParseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedRouteParseFailureCopyWith<ParsedRouteParseFailure> get copyWith => _$ParsedRouteParseFailureCopyWithImpl<ParsedRouteParseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedRouteParseFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ParsedRouteParseResult.failure(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $ParsedRouteParseFailureCopyWith<$Res> implements $ParsedRouteParseResultCopyWith<$Res> {
  factory $ParsedRouteParseFailureCopyWith(ParsedRouteParseFailure value, $Res Function(ParsedRouteParseFailure) _then) = _$ParsedRouteParseFailureCopyWithImpl;
@useResult
$Res call({
 ParseFailureCode code, String? message
});




}
/// @nodoc
class _$ParsedRouteParseFailureCopyWithImpl<$Res>
    implements $ParsedRouteParseFailureCopyWith<$Res> {
  _$ParsedRouteParseFailureCopyWithImpl(this._self, this._then);

  final ParsedRouteParseFailure _self;
  final $Res Function(ParsedRouteParseFailure) _then;

/// Create a copy of ParsedRouteParseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = freezed,}) {
  return _then(ParsedRouteParseFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as ParseFailureCode,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ParsedRoute {

 int get totalDurationSeconds; int get totalFare; int get transferCount; List<RouteLeg> get legs; List<TransferSegment> get transfers; List<String> get stationTrail; List<String> get stationTrailCodes; int get rawPathCount;
/// Create a copy of ParsedRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedRouteCopyWith<ParsedRoute> get copyWith => _$ParsedRouteCopyWithImpl<ParsedRoute>(this as ParsedRoute, _$identity);

  /// Serializes this ParsedRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedRoute&&(identical(other.totalDurationSeconds, totalDurationSeconds) || other.totalDurationSeconds == totalDurationSeconds)&&(identical(other.totalFare, totalFare) || other.totalFare == totalFare)&&(identical(other.transferCount, transferCount) || other.transferCount == transferCount)&&const DeepCollectionEquality().equals(other.legs, legs)&&const DeepCollectionEquality().equals(other.transfers, transfers)&&const DeepCollectionEquality().equals(other.stationTrail, stationTrail)&&const DeepCollectionEquality().equals(other.stationTrailCodes, stationTrailCodes)&&(identical(other.rawPathCount, rawPathCount) || other.rawPathCount == rawPathCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDurationSeconds,totalFare,transferCount,const DeepCollectionEquality().hash(legs),const DeepCollectionEquality().hash(transfers),const DeepCollectionEquality().hash(stationTrail),const DeepCollectionEquality().hash(stationTrailCodes),rawPathCount);

@override
String toString() {
  return 'ParsedRoute(totalDurationSeconds: $totalDurationSeconds, totalFare: $totalFare, transferCount: $transferCount, legs: $legs, transfers: $transfers, stationTrail: $stationTrail, stationTrailCodes: $stationTrailCodes, rawPathCount: $rawPathCount)';
}


}

/// @nodoc
abstract mixin class $ParsedRouteCopyWith<$Res>  {
  factory $ParsedRouteCopyWith(ParsedRoute value, $Res Function(ParsedRoute) _then) = _$ParsedRouteCopyWithImpl;
@useResult
$Res call({
 int totalDurationSeconds, int totalFare, int transferCount, List<RouteLeg> legs, List<TransferSegment> transfers, List<String> stationTrail, List<String> stationTrailCodes, int rawPathCount
});




}
/// @nodoc
class _$ParsedRouteCopyWithImpl<$Res>
    implements $ParsedRouteCopyWith<$Res> {
  _$ParsedRouteCopyWithImpl(this._self, this._then);

  final ParsedRoute _self;
  final $Res Function(ParsedRoute) _then;

/// Create a copy of ParsedRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDurationSeconds = null,Object? totalFare = null,Object? transferCount = null,Object? legs = null,Object? transfers = null,Object? stationTrail = null,Object? stationTrailCodes = null,Object? rawPathCount = null,}) {
  return _then(_self.copyWith(
totalDurationSeconds: null == totalDurationSeconds ? _self.totalDurationSeconds : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,totalFare: null == totalFare ? _self.totalFare : totalFare // ignore: cast_nullable_to_non_nullable
as int,transferCount: null == transferCount ? _self.transferCount : transferCount // ignore: cast_nullable_to_non_nullable
as int,legs: null == legs ? _self.legs : legs // ignore: cast_nullable_to_non_nullable
as List<RouteLeg>,transfers: null == transfers ? _self.transfers : transfers // ignore: cast_nullable_to_non_nullable
as List<TransferSegment>,stationTrail: null == stationTrail ? _self.stationTrail : stationTrail // ignore: cast_nullable_to_non_nullable
as List<String>,stationTrailCodes: null == stationTrailCodes ? _self.stationTrailCodes : stationTrailCodes // ignore: cast_nullable_to_non_nullable
as List<String>,rawPathCount: null == rawPathCount ? _self.rawPathCount : rawPathCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedRoute].
extension ParsedRoutePatterns on ParsedRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedRoute value)  $default,){
final _that = this;
switch (_that) {
case _ParsedRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedRoute value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalDurationSeconds,  int totalFare,  int transferCount,  List<RouteLeg> legs,  List<TransferSegment> transfers,  List<String> stationTrail,  List<String> stationTrailCodes,  int rawPathCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedRoute() when $default != null:
return $default(_that.totalDurationSeconds,_that.totalFare,_that.transferCount,_that.legs,_that.transfers,_that.stationTrail,_that.stationTrailCodes,_that.rawPathCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalDurationSeconds,  int totalFare,  int transferCount,  List<RouteLeg> legs,  List<TransferSegment> transfers,  List<String> stationTrail,  List<String> stationTrailCodes,  int rawPathCount)  $default,) {final _that = this;
switch (_that) {
case _ParsedRoute():
return $default(_that.totalDurationSeconds,_that.totalFare,_that.transferCount,_that.legs,_that.transfers,_that.stationTrail,_that.stationTrailCodes,_that.rawPathCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalDurationSeconds,  int totalFare,  int transferCount,  List<RouteLeg> legs,  List<TransferSegment> transfers,  List<String> stationTrail,  List<String> stationTrailCodes,  int rawPathCount)?  $default,) {final _that = this;
switch (_that) {
case _ParsedRoute() when $default != null:
return $default(_that.totalDurationSeconds,_that.totalFare,_that.transferCount,_that.legs,_that.transfers,_that.stationTrail,_that.stationTrailCodes,_that.rawPathCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParsedRoute implements ParsedRoute {
  const _ParsedRoute({required this.totalDurationSeconds, required this.totalFare, required this.transferCount, required final  List<RouteLeg> legs, required final  List<TransferSegment> transfers, required final  List<String> stationTrail, final  List<String> stationTrailCodes = const <String>[], required this.rawPathCount}): _legs = legs,_transfers = transfers,_stationTrail = stationTrail,_stationTrailCodes = stationTrailCodes;
  factory _ParsedRoute.fromJson(Map<String, dynamic> json) => _$ParsedRouteFromJson(json);

@override final  int totalDurationSeconds;
@override final  int totalFare;
@override final  int transferCount;
 final  List<RouteLeg> _legs;
@override List<RouteLeg> get legs {
  if (_legs is EqualUnmodifiableListView) return _legs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_legs);
}

 final  List<TransferSegment> _transfers;
@override List<TransferSegment> get transfers {
  if (_transfers is EqualUnmodifiableListView) return _transfers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transfers);
}

 final  List<String> _stationTrail;
@override List<String> get stationTrail {
  if (_stationTrail is EqualUnmodifiableListView) return _stationTrail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stationTrail);
}

 final  List<String> _stationTrailCodes;
@override@JsonKey() List<String> get stationTrailCodes {
  if (_stationTrailCodes is EqualUnmodifiableListView) return _stationTrailCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stationTrailCodes);
}

@override final  int rawPathCount;

/// Create a copy of ParsedRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedRouteCopyWith<_ParsedRoute> get copyWith => __$ParsedRouteCopyWithImpl<_ParsedRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParsedRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedRoute&&(identical(other.totalDurationSeconds, totalDurationSeconds) || other.totalDurationSeconds == totalDurationSeconds)&&(identical(other.totalFare, totalFare) || other.totalFare == totalFare)&&(identical(other.transferCount, transferCount) || other.transferCount == transferCount)&&const DeepCollectionEquality().equals(other._legs, _legs)&&const DeepCollectionEquality().equals(other._transfers, _transfers)&&const DeepCollectionEquality().equals(other._stationTrail, _stationTrail)&&const DeepCollectionEquality().equals(other._stationTrailCodes, _stationTrailCodes)&&(identical(other.rawPathCount, rawPathCount) || other.rawPathCount == rawPathCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDurationSeconds,totalFare,transferCount,const DeepCollectionEquality().hash(_legs),const DeepCollectionEquality().hash(_transfers),const DeepCollectionEquality().hash(_stationTrail),const DeepCollectionEquality().hash(_stationTrailCodes),rawPathCount);

@override
String toString() {
  return 'ParsedRoute(totalDurationSeconds: $totalDurationSeconds, totalFare: $totalFare, transferCount: $transferCount, legs: $legs, transfers: $transfers, stationTrail: $stationTrail, stationTrailCodes: $stationTrailCodes, rawPathCount: $rawPathCount)';
}


}

/// @nodoc
abstract mixin class _$ParsedRouteCopyWith<$Res> implements $ParsedRouteCopyWith<$Res> {
  factory _$ParsedRouteCopyWith(_ParsedRoute value, $Res Function(_ParsedRoute) _then) = __$ParsedRouteCopyWithImpl;
@override @useResult
$Res call({
 int totalDurationSeconds, int totalFare, int transferCount, List<RouteLeg> legs, List<TransferSegment> transfers, List<String> stationTrail, List<String> stationTrailCodes, int rawPathCount
});




}
/// @nodoc
class __$ParsedRouteCopyWithImpl<$Res>
    implements _$ParsedRouteCopyWith<$Res> {
  __$ParsedRouteCopyWithImpl(this._self, this._then);

  final _ParsedRoute _self;
  final $Res Function(_ParsedRoute) _then;

/// Create a copy of ParsedRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDurationSeconds = null,Object? totalFare = null,Object? transferCount = null,Object? legs = null,Object? transfers = null,Object? stationTrail = null,Object? stationTrailCodes = null,Object? rawPathCount = null,}) {
  return _then(_ParsedRoute(
totalDurationSeconds: null == totalDurationSeconds ? _self.totalDurationSeconds : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,totalFare: null == totalFare ? _self.totalFare : totalFare // ignore: cast_nullable_to_non_nullable
as int,transferCount: null == transferCount ? _self.transferCount : transferCount // ignore: cast_nullable_to_non_nullable
as int,legs: null == legs ? _self._legs : legs // ignore: cast_nullable_to_non_nullable
as List<RouteLeg>,transfers: null == transfers ? _self._transfers : transfers // ignore: cast_nullable_to_non_nullable
as List<TransferSegment>,stationTrail: null == stationTrail ? _self._stationTrail : stationTrail // ignore: cast_nullable_to_non_nullable
as List<String>,stationTrailCodes: null == stationTrailCodes ? _self._stationTrailCodes : stationTrailCodes // ignore: cast_nullable_to_non_nullable
as List<String>,rawPathCount: null == rawPathCount ? _self.rawPathCount : rawPathCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RawPathSegment {

 String get departureStationCode; String get departureStationName; String get departureLineName; String? get departureBranchLineName; String get arrivalStationCode; String get arrivalStationName; String get arrivalLineName; String? get arrivalBranchLineName; String? get terminalStationCode; String? get terminalStationName; String? get apiDirection; int get distanceMeters; int get durationSeconds; int get waitingSeconds; bool get isTransfer; String? get trainNo; String? get trainDepartureTime; String? get trainArrivalTime; String get servicePatternKey; String get branchKey;
/// Create a copy of RawPathSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawPathSegmentCopyWith<RawPathSegment> get copyWith => _$RawPathSegmentCopyWithImpl<RawPathSegment>(this as RawPathSegment, _$identity);

  /// Serializes this RawPathSegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawPathSegment&&(identical(other.departureStationCode, departureStationCode) || other.departureStationCode == departureStationCode)&&(identical(other.departureStationName, departureStationName) || other.departureStationName == departureStationName)&&(identical(other.departureLineName, departureLineName) || other.departureLineName == departureLineName)&&(identical(other.departureBranchLineName, departureBranchLineName) || other.departureBranchLineName == departureBranchLineName)&&(identical(other.arrivalStationCode, arrivalStationCode) || other.arrivalStationCode == arrivalStationCode)&&(identical(other.arrivalStationName, arrivalStationName) || other.arrivalStationName == arrivalStationName)&&(identical(other.arrivalLineName, arrivalLineName) || other.arrivalLineName == arrivalLineName)&&(identical(other.arrivalBranchLineName, arrivalBranchLineName) || other.arrivalBranchLineName == arrivalBranchLineName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.waitingSeconds, waitingSeconds) || other.waitingSeconds == waitingSeconds)&&(identical(other.isTransfer, isTransfer) || other.isTransfer == isTransfer)&&(identical(other.trainNo, trainNo) || other.trainNo == trainNo)&&(identical(other.trainDepartureTime, trainDepartureTime) || other.trainDepartureTime == trainDepartureTime)&&(identical(other.trainArrivalTime, trainArrivalTime) || other.trainArrivalTime == trainArrivalTime)&&(identical(other.servicePatternKey, servicePatternKey) || other.servicePatternKey == servicePatternKey)&&(identical(other.branchKey, branchKey) || other.branchKey == branchKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,departureStationCode,departureStationName,departureLineName,departureBranchLineName,arrivalStationCode,arrivalStationName,arrivalLineName,arrivalBranchLineName,terminalStationCode,terminalStationName,apiDirection,distanceMeters,durationSeconds,waitingSeconds,isTransfer,trainNo,trainDepartureTime,trainArrivalTime,servicePatternKey,branchKey]);

@override
String toString() {
  return 'RawPathSegment(departureStationCode: $departureStationCode, departureStationName: $departureStationName, departureLineName: $departureLineName, departureBranchLineName: $departureBranchLineName, arrivalStationCode: $arrivalStationCode, arrivalStationName: $arrivalStationName, arrivalLineName: $arrivalLineName, arrivalBranchLineName: $arrivalBranchLineName, terminalStationCode: $terminalStationCode, terminalStationName: $terminalStationName, apiDirection: $apiDirection, distanceMeters: $distanceMeters, durationSeconds: $durationSeconds, waitingSeconds: $waitingSeconds, isTransfer: $isTransfer, trainNo: $trainNo, trainDepartureTime: $trainDepartureTime, trainArrivalTime: $trainArrivalTime, servicePatternKey: $servicePatternKey, branchKey: $branchKey)';
}


}

/// @nodoc
abstract mixin class $RawPathSegmentCopyWith<$Res>  {
  factory $RawPathSegmentCopyWith(RawPathSegment value, $Res Function(RawPathSegment) _then) = _$RawPathSegmentCopyWithImpl;
@useResult
$Res call({
 String departureStationCode, String departureStationName, String departureLineName, String? departureBranchLineName, String arrivalStationCode, String arrivalStationName, String arrivalLineName, String? arrivalBranchLineName, String? terminalStationCode, String? terminalStationName, String? apiDirection, int distanceMeters, int durationSeconds, int waitingSeconds, bool isTransfer, String? trainNo, String? trainDepartureTime, String? trainArrivalTime, String servicePatternKey, String branchKey
});




}
/// @nodoc
class _$RawPathSegmentCopyWithImpl<$Res>
    implements $RawPathSegmentCopyWith<$Res> {
  _$RawPathSegmentCopyWithImpl(this._self, this._then);

  final RawPathSegment _self;
  final $Res Function(RawPathSegment) _then;

/// Create a copy of RawPathSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departureStationCode = null,Object? departureStationName = null,Object? departureLineName = null,Object? departureBranchLineName = freezed,Object? arrivalStationCode = null,Object? arrivalStationName = null,Object? arrivalLineName = null,Object? arrivalBranchLineName = freezed,Object? terminalStationCode = freezed,Object? terminalStationName = freezed,Object? apiDirection = freezed,Object? distanceMeters = null,Object? durationSeconds = null,Object? waitingSeconds = null,Object? isTransfer = null,Object? trainNo = freezed,Object? trainDepartureTime = freezed,Object? trainArrivalTime = freezed,Object? servicePatternKey = null,Object? branchKey = null,}) {
  return _then(_self.copyWith(
departureStationCode: null == departureStationCode ? _self.departureStationCode : departureStationCode // ignore: cast_nullable_to_non_nullable
as String,departureStationName: null == departureStationName ? _self.departureStationName : departureStationName // ignore: cast_nullable_to_non_nullable
as String,departureLineName: null == departureLineName ? _self.departureLineName : departureLineName // ignore: cast_nullable_to_non_nullable
as String,departureBranchLineName: freezed == departureBranchLineName ? _self.departureBranchLineName : departureBranchLineName // ignore: cast_nullable_to_non_nullable
as String?,arrivalStationCode: null == arrivalStationCode ? _self.arrivalStationCode : arrivalStationCode // ignore: cast_nullable_to_non_nullable
as String,arrivalStationName: null == arrivalStationName ? _self.arrivalStationName : arrivalStationName // ignore: cast_nullable_to_non_nullable
as String,arrivalLineName: null == arrivalLineName ? _self.arrivalLineName : arrivalLineName // ignore: cast_nullable_to_non_nullable
as String,arrivalBranchLineName: freezed == arrivalBranchLineName ? _self.arrivalBranchLineName : arrivalBranchLineName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,waitingSeconds: null == waitingSeconds ? _self.waitingSeconds : waitingSeconds // ignore: cast_nullable_to_non_nullable
as int,isTransfer: null == isTransfer ? _self.isTransfer : isTransfer // ignore: cast_nullable_to_non_nullable
as bool,trainNo: freezed == trainNo ? _self.trainNo : trainNo // ignore: cast_nullable_to_non_nullable
as String?,trainDepartureTime: freezed == trainDepartureTime ? _self.trainDepartureTime : trainDepartureTime // ignore: cast_nullable_to_non_nullable
as String?,trainArrivalTime: freezed == trainArrivalTime ? _self.trainArrivalTime : trainArrivalTime // ignore: cast_nullable_to_non_nullable
as String?,servicePatternKey: null == servicePatternKey ? _self.servicePatternKey : servicePatternKey // ignore: cast_nullable_to_non_nullable
as String,branchKey: null == branchKey ? _self.branchKey : branchKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RawPathSegment].
extension RawPathSegmentPatterns on RawPathSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawPathSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawPathSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawPathSegment value)  $default,){
final _that = this;
switch (_that) {
case _RawPathSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawPathSegment value)?  $default,){
final _that = this;
switch (_that) {
case _RawPathSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String departureStationCode,  String departureStationName,  String departureLineName,  String? departureBranchLineName,  String arrivalStationCode,  String arrivalStationName,  String arrivalLineName,  String? arrivalBranchLineName,  String? terminalStationCode,  String? terminalStationName,  String? apiDirection,  int distanceMeters,  int durationSeconds,  int waitingSeconds,  bool isTransfer,  String? trainNo,  String? trainDepartureTime,  String? trainArrivalTime,  String servicePatternKey,  String branchKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawPathSegment() when $default != null:
return $default(_that.departureStationCode,_that.departureStationName,_that.departureLineName,_that.departureBranchLineName,_that.arrivalStationCode,_that.arrivalStationName,_that.arrivalLineName,_that.arrivalBranchLineName,_that.terminalStationCode,_that.terminalStationName,_that.apiDirection,_that.distanceMeters,_that.durationSeconds,_that.waitingSeconds,_that.isTransfer,_that.trainNo,_that.trainDepartureTime,_that.trainArrivalTime,_that.servicePatternKey,_that.branchKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String departureStationCode,  String departureStationName,  String departureLineName,  String? departureBranchLineName,  String arrivalStationCode,  String arrivalStationName,  String arrivalLineName,  String? arrivalBranchLineName,  String? terminalStationCode,  String? terminalStationName,  String? apiDirection,  int distanceMeters,  int durationSeconds,  int waitingSeconds,  bool isTransfer,  String? trainNo,  String? trainDepartureTime,  String? trainArrivalTime,  String servicePatternKey,  String branchKey)  $default,) {final _that = this;
switch (_that) {
case _RawPathSegment():
return $default(_that.departureStationCode,_that.departureStationName,_that.departureLineName,_that.departureBranchLineName,_that.arrivalStationCode,_that.arrivalStationName,_that.arrivalLineName,_that.arrivalBranchLineName,_that.terminalStationCode,_that.terminalStationName,_that.apiDirection,_that.distanceMeters,_that.durationSeconds,_that.waitingSeconds,_that.isTransfer,_that.trainNo,_that.trainDepartureTime,_that.trainArrivalTime,_that.servicePatternKey,_that.branchKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String departureStationCode,  String departureStationName,  String departureLineName,  String? departureBranchLineName,  String arrivalStationCode,  String arrivalStationName,  String arrivalLineName,  String? arrivalBranchLineName,  String? terminalStationCode,  String? terminalStationName,  String? apiDirection,  int distanceMeters,  int durationSeconds,  int waitingSeconds,  bool isTransfer,  String? trainNo,  String? trainDepartureTime,  String? trainArrivalTime,  String servicePatternKey,  String branchKey)?  $default,) {final _that = this;
switch (_that) {
case _RawPathSegment() when $default != null:
return $default(_that.departureStationCode,_that.departureStationName,_that.departureLineName,_that.departureBranchLineName,_that.arrivalStationCode,_that.arrivalStationName,_that.arrivalLineName,_that.arrivalBranchLineName,_that.terminalStationCode,_that.terminalStationName,_that.apiDirection,_that.distanceMeters,_that.durationSeconds,_that.waitingSeconds,_that.isTransfer,_that.trainNo,_that.trainDepartureTime,_that.trainArrivalTime,_that.servicePatternKey,_that.branchKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RawPathSegment implements RawPathSegment {
  const _RawPathSegment({required this.departureStationCode, required this.departureStationName, required this.departureLineName, required this.departureBranchLineName, required this.arrivalStationCode, required this.arrivalStationName, required this.arrivalLineName, required this.arrivalBranchLineName, required this.terminalStationCode, required this.terminalStationName, required this.apiDirection, required this.distanceMeters, required this.durationSeconds, required this.waitingSeconds, required this.isTransfer, required this.trainNo, required this.trainDepartureTime, required this.trainArrivalTime, required this.servicePatternKey, required this.branchKey});
  factory _RawPathSegment.fromJson(Map<String, dynamic> json) => _$RawPathSegmentFromJson(json);

@override final  String departureStationCode;
@override final  String departureStationName;
@override final  String departureLineName;
@override final  String? departureBranchLineName;
@override final  String arrivalStationCode;
@override final  String arrivalStationName;
@override final  String arrivalLineName;
@override final  String? arrivalBranchLineName;
@override final  String? terminalStationCode;
@override final  String? terminalStationName;
@override final  String? apiDirection;
@override final  int distanceMeters;
@override final  int durationSeconds;
@override final  int waitingSeconds;
@override final  bool isTransfer;
@override final  String? trainNo;
@override final  String? trainDepartureTime;
@override final  String? trainArrivalTime;
@override final  String servicePatternKey;
@override final  String branchKey;

/// Create a copy of RawPathSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawPathSegmentCopyWith<_RawPathSegment> get copyWith => __$RawPathSegmentCopyWithImpl<_RawPathSegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RawPathSegmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawPathSegment&&(identical(other.departureStationCode, departureStationCode) || other.departureStationCode == departureStationCode)&&(identical(other.departureStationName, departureStationName) || other.departureStationName == departureStationName)&&(identical(other.departureLineName, departureLineName) || other.departureLineName == departureLineName)&&(identical(other.departureBranchLineName, departureBranchLineName) || other.departureBranchLineName == departureBranchLineName)&&(identical(other.arrivalStationCode, arrivalStationCode) || other.arrivalStationCode == arrivalStationCode)&&(identical(other.arrivalStationName, arrivalStationName) || other.arrivalStationName == arrivalStationName)&&(identical(other.arrivalLineName, arrivalLineName) || other.arrivalLineName == arrivalLineName)&&(identical(other.arrivalBranchLineName, arrivalBranchLineName) || other.arrivalBranchLineName == arrivalBranchLineName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.waitingSeconds, waitingSeconds) || other.waitingSeconds == waitingSeconds)&&(identical(other.isTransfer, isTransfer) || other.isTransfer == isTransfer)&&(identical(other.trainNo, trainNo) || other.trainNo == trainNo)&&(identical(other.trainDepartureTime, trainDepartureTime) || other.trainDepartureTime == trainDepartureTime)&&(identical(other.trainArrivalTime, trainArrivalTime) || other.trainArrivalTime == trainArrivalTime)&&(identical(other.servicePatternKey, servicePatternKey) || other.servicePatternKey == servicePatternKey)&&(identical(other.branchKey, branchKey) || other.branchKey == branchKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,departureStationCode,departureStationName,departureLineName,departureBranchLineName,arrivalStationCode,arrivalStationName,arrivalLineName,arrivalBranchLineName,terminalStationCode,terminalStationName,apiDirection,distanceMeters,durationSeconds,waitingSeconds,isTransfer,trainNo,trainDepartureTime,trainArrivalTime,servicePatternKey,branchKey]);

@override
String toString() {
  return 'RawPathSegment(departureStationCode: $departureStationCode, departureStationName: $departureStationName, departureLineName: $departureLineName, departureBranchLineName: $departureBranchLineName, arrivalStationCode: $arrivalStationCode, arrivalStationName: $arrivalStationName, arrivalLineName: $arrivalLineName, arrivalBranchLineName: $arrivalBranchLineName, terminalStationCode: $terminalStationCode, terminalStationName: $terminalStationName, apiDirection: $apiDirection, distanceMeters: $distanceMeters, durationSeconds: $durationSeconds, waitingSeconds: $waitingSeconds, isTransfer: $isTransfer, trainNo: $trainNo, trainDepartureTime: $trainDepartureTime, trainArrivalTime: $trainArrivalTime, servicePatternKey: $servicePatternKey, branchKey: $branchKey)';
}


}

/// @nodoc
abstract mixin class _$RawPathSegmentCopyWith<$Res> implements $RawPathSegmentCopyWith<$Res> {
  factory _$RawPathSegmentCopyWith(_RawPathSegment value, $Res Function(_RawPathSegment) _then) = __$RawPathSegmentCopyWithImpl;
@override @useResult
$Res call({
 String departureStationCode, String departureStationName, String departureLineName, String? departureBranchLineName, String arrivalStationCode, String arrivalStationName, String arrivalLineName, String? arrivalBranchLineName, String? terminalStationCode, String? terminalStationName, String? apiDirection, int distanceMeters, int durationSeconds, int waitingSeconds, bool isTransfer, String? trainNo, String? trainDepartureTime, String? trainArrivalTime, String servicePatternKey, String branchKey
});




}
/// @nodoc
class __$RawPathSegmentCopyWithImpl<$Res>
    implements _$RawPathSegmentCopyWith<$Res> {
  __$RawPathSegmentCopyWithImpl(this._self, this._then);

  final _RawPathSegment _self;
  final $Res Function(_RawPathSegment) _then;

/// Create a copy of RawPathSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departureStationCode = null,Object? departureStationName = null,Object? departureLineName = null,Object? departureBranchLineName = freezed,Object? arrivalStationCode = null,Object? arrivalStationName = null,Object? arrivalLineName = null,Object? arrivalBranchLineName = freezed,Object? terminalStationCode = freezed,Object? terminalStationName = freezed,Object? apiDirection = freezed,Object? distanceMeters = null,Object? durationSeconds = null,Object? waitingSeconds = null,Object? isTransfer = null,Object? trainNo = freezed,Object? trainDepartureTime = freezed,Object? trainArrivalTime = freezed,Object? servicePatternKey = null,Object? branchKey = null,}) {
  return _then(_RawPathSegment(
departureStationCode: null == departureStationCode ? _self.departureStationCode : departureStationCode // ignore: cast_nullable_to_non_nullable
as String,departureStationName: null == departureStationName ? _self.departureStationName : departureStationName // ignore: cast_nullable_to_non_nullable
as String,departureLineName: null == departureLineName ? _self.departureLineName : departureLineName // ignore: cast_nullable_to_non_nullable
as String,departureBranchLineName: freezed == departureBranchLineName ? _self.departureBranchLineName : departureBranchLineName // ignore: cast_nullable_to_non_nullable
as String?,arrivalStationCode: null == arrivalStationCode ? _self.arrivalStationCode : arrivalStationCode // ignore: cast_nullable_to_non_nullable
as String,arrivalStationName: null == arrivalStationName ? _self.arrivalStationName : arrivalStationName // ignore: cast_nullable_to_non_nullable
as String,arrivalLineName: null == arrivalLineName ? _self.arrivalLineName : arrivalLineName // ignore: cast_nullable_to_non_nullable
as String,arrivalBranchLineName: freezed == arrivalBranchLineName ? _self.arrivalBranchLineName : arrivalBranchLineName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,waitingSeconds: null == waitingSeconds ? _self.waitingSeconds : waitingSeconds // ignore: cast_nullable_to_non_nullable
as int,isTransfer: null == isTransfer ? _self.isTransfer : isTransfer // ignore: cast_nullable_to_non_nullable
as bool,trainNo: freezed == trainNo ? _self.trainNo : trainNo // ignore: cast_nullable_to_non_nullable
as String?,trainDepartureTime: freezed == trainDepartureTime ? _self.trainDepartureTime : trainDepartureTime // ignore: cast_nullable_to_non_nullable
as String?,trainArrivalTime: freezed == trainArrivalTime ? _self.trainArrivalTime : trainArrivalTime // ignore: cast_nullable_to_non_nullable
as String?,servicePatternKey: null == servicePatternKey ? _self.servicePatternKey : servicePatternKey // ignore: cast_nullable_to_non_nullable
as String,branchKey: null == branchKey ? _self.branchKey : branchKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RideSegment {

 String get fromStationCode; String get fromStationName; String get toStationCode; String get toStationName; String get lineName; String? get terminalStationName; String? get terminalStationCode; String? get apiDirection; int get durationSeconds; int get distanceMeters; String? get trainNo; String get branchKey; String get servicePatternKey;
/// Create a copy of RideSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RideSegmentCopyWith<RideSegment> get copyWith => _$RideSegmentCopyWithImpl<RideSegment>(this as RideSegment, _$identity);

  /// Serializes this RideSegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RideSegment&&(identical(other.fromStationCode, fromStationCode) || other.fromStationCode == fromStationCode)&&(identical(other.fromStationName, fromStationName) || other.fromStationName == fromStationName)&&(identical(other.toStationCode, toStationCode) || other.toStationCode == toStationCode)&&(identical(other.toStationName, toStationName) || other.toStationName == toStationName)&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.trainNo, trainNo) || other.trainNo == trainNo)&&(identical(other.branchKey, branchKey) || other.branchKey == branchKey)&&(identical(other.servicePatternKey, servicePatternKey) || other.servicePatternKey == servicePatternKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromStationCode,fromStationName,toStationCode,toStationName,lineName,terminalStationName,terminalStationCode,apiDirection,durationSeconds,distanceMeters,trainNo,branchKey,servicePatternKey);

@override
String toString() {
  return 'RideSegment(fromStationCode: $fromStationCode, fromStationName: $fromStationName, toStationCode: $toStationCode, toStationName: $toStationName, lineName: $lineName, terminalStationName: $terminalStationName, terminalStationCode: $terminalStationCode, apiDirection: $apiDirection, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters, trainNo: $trainNo, branchKey: $branchKey, servicePatternKey: $servicePatternKey)';
}


}

/// @nodoc
abstract mixin class $RideSegmentCopyWith<$Res>  {
  factory $RideSegmentCopyWith(RideSegment value, $Res Function(RideSegment) _then) = _$RideSegmentCopyWithImpl;
@useResult
$Res call({
 String fromStationCode, String fromStationName, String toStationCode, String toStationName, String lineName, String? terminalStationName, String? terminalStationCode, String? apiDirection, int durationSeconds, int distanceMeters, String? trainNo, String branchKey, String servicePatternKey
});




}
/// @nodoc
class _$RideSegmentCopyWithImpl<$Res>
    implements $RideSegmentCopyWith<$Res> {
  _$RideSegmentCopyWithImpl(this._self, this._then);

  final RideSegment _self;
  final $Res Function(RideSegment) _then;

/// Create a copy of RideSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromStationCode = null,Object? fromStationName = null,Object? toStationCode = null,Object? toStationName = null,Object? lineName = null,Object? terminalStationName = freezed,Object? terminalStationCode = freezed,Object? apiDirection = freezed,Object? durationSeconds = null,Object? distanceMeters = null,Object? trainNo = freezed,Object? branchKey = null,Object? servicePatternKey = null,}) {
  return _then(_self.copyWith(
fromStationCode: null == fromStationCode ? _self.fromStationCode : fromStationCode // ignore: cast_nullable_to_non_nullable
as String,fromStationName: null == fromStationName ? _self.fromStationName : fromStationName // ignore: cast_nullable_to_non_nullable
as String,toStationCode: null == toStationCode ? _self.toStationCode : toStationCode // ignore: cast_nullable_to_non_nullable
as String,toStationName: null == toStationName ? _self.toStationName : toStationName // ignore: cast_nullable_to_non_nullable
as String,lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,trainNo: freezed == trainNo ? _self.trainNo : trainNo // ignore: cast_nullable_to_non_nullable
as String?,branchKey: null == branchKey ? _self.branchKey : branchKey // ignore: cast_nullable_to_non_nullable
as String,servicePatternKey: null == servicePatternKey ? _self.servicePatternKey : servicePatternKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RideSegment].
extension RideSegmentPatterns on RideSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RideSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RideSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RideSegment value)  $default,){
final _that = this;
switch (_that) {
case _RideSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RideSegment value)?  $default,){
final _that = this;
switch (_that) {
case _RideSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromStationCode,  String fromStationName,  String toStationCode,  String toStationName,  String lineName,  String? terminalStationName,  String? terminalStationCode,  String? apiDirection,  int durationSeconds,  int distanceMeters,  String? trainNo,  String branchKey,  String servicePatternKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RideSegment() when $default != null:
return $default(_that.fromStationCode,_that.fromStationName,_that.toStationCode,_that.toStationName,_that.lineName,_that.terminalStationName,_that.terminalStationCode,_that.apiDirection,_that.durationSeconds,_that.distanceMeters,_that.trainNo,_that.branchKey,_that.servicePatternKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromStationCode,  String fromStationName,  String toStationCode,  String toStationName,  String lineName,  String? terminalStationName,  String? terminalStationCode,  String? apiDirection,  int durationSeconds,  int distanceMeters,  String? trainNo,  String branchKey,  String servicePatternKey)  $default,) {final _that = this;
switch (_that) {
case _RideSegment():
return $default(_that.fromStationCode,_that.fromStationName,_that.toStationCode,_that.toStationName,_that.lineName,_that.terminalStationName,_that.terminalStationCode,_that.apiDirection,_that.durationSeconds,_that.distanceMeters,_that.trainNo,_that.branchKey,_that.servicePatternKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromStationCode,  String fromStationName,  String toStationCode,  String toStationName,  String lineName,  String? terminalStationName,  String? terminalStationCode,  String? apiDirection,  int durationSeconds,  int distanceMeters,  String? trainNo,  String branchKey,  String servicePatternKey)?  $default,) {final _that = this;
switch (_that) {
case _RideSegment() when $default != null:
return $default(_that.fromStationCode,_that.fromStationName,_that.toStationCode,_that.toStationName,_that.lineName,_that.terminalStationName,_that.terminalStationCode,_that.apiDirection,_that.durationSeconds,_that.distanceMeters,_that.trainNo,_that.branchKey,_that.servicePatternKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RideSegment implements RideSegment {
  const _RideSegment({required this.fromStationCode, required this.fromStationName, required this.toStationCode, required this.toStationName, required this.lineName, required this.terminalStationName, required this.terminalStationCode, required this.apiDirection, required this.durationSeconds, required this.distanceMeters, required this.trainNo, required this.branchKey, required this.servicePatternKey});
  factory _RideSegment.fromJson(Map<String, dynamic> json) => _$RideSegmentFromJson(json);

@override final  String fromStationCode;
@override final  String fromStationName;
@override final  String toStationCode;
@override final  String toStationName;
@override final  String lineName;
@override final  String? terminalStationName;
@override final  String? terminalStationCode;
@override final  String? apiDirection;
@override final  int durationSeconds;
@override final  int distanceMeters;
@override final  String? trainNo;
@override final  String branchKey;
@override final  String servicePatternKey;

/// Create a copy of RideSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RideSegmentCopyWith<_RideSegment> get copyWith => __$RideSegmentCopyWithImpl<_RideSegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RideSegmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RideSegment&&(identical(other.fromStationCode, fromStationCode) || other.fromStationCode == fromStationCode)&&(identical(other.fromStationName, fromStationName) || other.fromStationName == fromStationName)&&(identical(other.toStationCode, toStationCode) || other.toStationCode == toStationCode)&&(identical(other.toStationName, toStationName) || other.toStationName == toStationName)&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.trainNo, trainNo) || other.trainNo == trainNo)&&(identical(other.branchKey, branchKey) || other.branchKey == branchKey)&&(identical(other.servicePatternKey, servicePatternKey) || other.servicePatternKey == servicePatternKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromStationCode,fromStationName,toStationCode,toStationName,lineName,terminalStationName,terminalStationCode,apiDirection,durationSeconds,distanceMeters,trainNo,branchKey,servicePatternKey);

@override
String toString() {
  return 'RideSegment(fromStationCode: $fromStationCode, fromStationName: $fromStationName, toStationCode: $toStationCode, toStationName: $toStationName, lineName: $lineName, terminalStationName: $terminalStationName, terminalStationCode: $terminalStationCode, apiDirection: $apiDirection, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters, trainNo: $trainNo, branchKey: $branchKey, servicePatternKey: $servicePatternKey)';
}


}

/// @nodoc
abstract mixin class _$RideSegmentCopyWith<$Res> implements $RideSegmentCopyWith<$Res> {
  factory _$RideSegmentCopyWith(_RideSegment value, $Res Function(_RideSegment) _then) = __$RideSegmentCopyWithImpl;
@override @useResult
$Res call({
 String fromStationCode, String fromStationName, String toStationCode, String toStationName, String lineName, String? terminalStationName, String? terminalStationCode, String? apiDirection, int durationSeconds, int distanceMeters, String? trainNo, String branchKey, String servicePatternKey
});




}
/// @nodoc
class __$RideSegmentCopyWithImpl<$Res>
    implements _$RideSegmentCopyWith<$Res> {
  __$RideSegmentCopyWithImpl(this._self, this._then);

  final _RideSegment _self;
  final $Res Function(_RideSegment) _then;

/// Create a copy of RideSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromStationCode = null,Object? fromStationName = null,Object? toStationCode = null,Object? toStationName = null,Object? lineName = null,Object? terminalStationName = freezed,Object? terminalStationCode = freezed,Object? apiDirection = freezed,Object? durationSeconds = null,Object? distanceMeters = null,Object? trainNo = freezed,Object? branchKey = null,Object? servicePatternKey = null,}) {
  return _then(_RideSegment(
fromStationCode: null == fromStationCode ? _self.fromStationCode : fromStationCode // ignore: cast_nullable_to_non_nullable
as String,fromStationName: null == fromStationName ? _self.fromStationName : fromStationName // ignore: cast_nullable_to_non_nullable
as String,toStationCode: null == toStationCode ? _self.toStationCode : toStationCode // ignore: cast_nullable_to_non_nullable
as String,toStationName: null == toStationName ? _self.toStationName : toStationName // ignore: cast_nullable_to_non_nullable
as String,lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,trainNo: freezed == trainNo ? _self.trainNo : trainNo // ignore: cast_nullable_to_non_nullable
as String?,branchKey: null == branchKey ? _self.branchKey : branchKey // ignore: cast_nullable_to_non_nullable
as String,servicePatternKey: null == servicePatternKey ? _self.servicePatternKey : servicePatternKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TransferSegment {

 String get stationName; String? get stationCode; String get fromLineName; String get toLineName; int get durationSeconds; int get distanceMeters; int get waitingSeconds;
/// Create a copy of TransferSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferSegmentCopyWith<TransferSegment> get copyWith => _$TransferSegmentCopyWithImpl<TransferSegment>(this as TransferSegment, _$identity);

  /// Serializes this TransferSegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferSegment&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.stationCode, stationCode) || other.stationCode == stationCode)&&(identical(other.fromLineName, fromLineName) || other.fromLineName == fromLineName)&&(identical(other.toLineName, toLineName) || other.toLineName == toLineName)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.waitingSeconds, waitingSeconds) || other.waitingSeconds == waitingSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationName,stationCode,fromLineName,toLineName,durationSeconds,distanceMeters,waitingSeconds);

@override
String toString() {
  return 'TransferSegment(stationName: $stationName, stationCode: $stationCode, fromLineName: $fromLineName, toLineName: $toLineName, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters, waitingSeconds: $waitingSeconds)';
}


}

/// @nodoc
abstract mixin class $TransferSegmentCopyWith<$Res>  {
  factory $TransferSegmentCopyWith(TransferSegment value, $Res Function(TransferSegment) _then) = _$TransferSegmentCopyWithImpl;
@useResult
$Res call({
 String stationName, String? stationCode, String fromLineName, String toLineName, int durationSeconds, int distanceMeters, int waitingSeconds
});




}
/// @nodoc
class _$TransferSegmentCopyWithImpl<$Res>
    implements $TransferSegmentCopyWith<$Res> {
  _$TransferSegmentCopyWithImpl(this._self, this._then);

  final TransferSegment _self;
  final $Res Function(TransferSegment) _then;

/// Create a copy of TransferSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationName = null,Object? stationCode = freezed,Object? fromLineName = null,Object? toLineName = null,Object? durationSeconds = null,Object? distanceMeters = null,Object? waitingSeconds = null,}) {
  return _then(_self.copyWith(
stationName: null == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String,stationCode: freezed == stationCode ? _self.stationCode : stationCode // ignore: cast_nullable_to_non_nullable
as String?,fromLineName: null == fromLineName ? _self.fromLineName : fromLineName // ignore: cast_nullable_to_non_nullable
as String,toLineName: null == toLineName ? _self.toLineName : toLineName // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,waitingSeconds: null == waitingSeconds ? _self.waitingSeconds : waitingSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferSegment].
extension TransferSegmentPatterns on TransferSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferSegment value)  $default,){
final _that = this;
switch (_that) {
case _TransferSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferSegment value)?  $default,){
final _that = this;
switch (_that) {
case _TransferSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stationName,  String? stationCode,  String fromLineName,  String toLineName,  int durationSeconds,  int distanceMeters,  int waitingSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferSegment() when $default != null:
return $default(_that.stationName,_that.stationCode,_that.fromLineName,_that.toLineName,_that.durationSeconds,_that.distanceMeters,_that.waitingSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stationName,  String? stationCode,  String fromLineName,  String toLineName,  int durationSeconds,  int distanceMeters,  int waitingSeconds)  $default,) {final _that = this;
switch (_that) {
case _TransferSegment():
return $default(_that.stationName,_that.stationCode,_that.fromLineName,_that.toLineName,_that.durationSeconds,_that.distanceMeters,_that.waitingSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stationName,  String? stationCode,  String fromLineName,  String toLineName,  int durationSeconds,  int distanceMeters,  int waitingSeconds)?  $default,) {final _that = this;
switch (_that) {
case _TransferSegment() when $default != null:
return $default(_that.stationName,_that.stationCode,_that.fromLineName,_that.toLineName,_that.durationSeconds,_that.distanceMeters,_that.waitingSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferSegment implements TransferSegment {
  const _TransferSegment({required this.stationName, this.stationCode, required this.fromLineName, required this.toLineName, required this.durationSeconds, required this.distanceMeters, required this.waitingSeconds});
  factory _TransferSegment.fromJson(Map<String, dynamic> json) => _$TransferSegmentFromJson(json);

@override final  String stationName;
@override final  String? stationCode;
@override final  String fromLineName;
@override final  String toLineName;
@override final  int durationSeconds;
@override final  int distanceMeters;
@override final  int waitingSeconds;

/// Create a copy of TransferSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferSegmentCopyWith<_TransferSegment> get copyWith => __$TransferSegmentCopyWithImpl<_TransferSegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferSegmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferSegment&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.stationCode, stationCode) || other.stationCode == stationCode)&&(identical(other.fromLineName, fromLineName) || other.fromLineName == fromLineName)&&(identical(other.toLineName, toLineName) || other.toLineName == toLineName)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.waitingSeconds, waitingSeconds) || other.waitingSeconds == waitingSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationName,stationCode,fromLineName,toLineName,durationSeconds,distanceMeters,waitingSeconds);

@override
String toString() {
  return 'TransferSegment(stationName: $stationName, stationCode: $stationCode, fromLineName: $fromLineName, toLineName: $toLineName, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters, waitingSeconds: $waitingSeconds)';
}


}

/// @nodoc
abstract mixin class _$TransferSegmentCopyWith<$Res> implements $TransferSegmentCopyWith<$Res> {
  factory _$TransferSegmentCopyWith(_TransferSegment value, $Res Function(_TransferSegment) _then) = __$TransferSegmentCopyWithImpl;
@override @useResult
$Res call({
 String stationName, String? stationCode, String fromLineName, String toLineName, int durationSeconds, int distanceMeters, int waitingSeconds
});




}
/// @nodoc
class __$TransferSegmentCopyWithImpl<$Res>
    implements _$TransferSegmentCopyWith<$Res> {
  __$TransferSegmentCopyWithImpl(this._self, this._then);

  final _TransferSegment _self;
  final $Res Function(_TransferSegment) _then;

/// Create a copy of TransferSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationName = null,Object? stationCode = freezed,Object? fromLineName = null,Object? toLineName = null,Object? durationSeconds = null,Object? distanceMeters = null,Object? waitingSeconds = null,}) {
  return _then(_TransferSegment(
stationName: null == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String,stationCode: freezed == stationCode ? _self.stationCode : stationCode // ignore: cast_nullable_to_non_nullable
as String?,fromLineName: null == fromLineName ? _self.fromLineName : fromLineName // ignore: cast_nullable_to_non_nullable
as String,toLineName: null == toLineName ? _self.toLineName : toLineName // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,waitingSeconds: null == waitingSeconds ? _self.waitingSeconds : waitingSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RouteLeg {

 String get lineName; String get fromStationName; String? get fromStationCode; String get toStationName; String? get toStationCode; List<String> get stationNames; List<String> get stationCodes; int get stationCount; String get directionLabel; String? get apiDirection; String? get terminalStationName; String? get terminalStationCode; String get servicePatternKey; String get branchKey; String get nextStationName; String? get nextStationCode; int get durationSeconds; int get distanceMeters; int get segmentCount;
/// Create a copy of RouteLeg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteLegCopyWith<RouteLeg> get copyWith => _$RouteLegCopyWithImpl<RouteLeg>(this as RouteLeg, _$identity);

  /// Serializes this RouteLeg to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteLeg&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.fromStationName, fromStationName) || other.fromStationName == fromStationName)&&(identical(other.fromStationCode, fromStationCode) || other.fromStationCode == fromStationCode)&&(identical(other.toStationName, toStationName) || other.toStationName == toStationName)&&(identical(other.toStationCode, toStationCode) || other.toStationCode == toStationCode)&&const DeepCollectionEquality().equals(other.stationNames, stationNames)&&const DeepCollectionEquality().equals(other.stationCodes, stationCodes)&&(identical(other.stationCount, stationCount) || other.stationCount == stationCount)&&(identical(other.directionLabel, directionLabel) || other.directionLabel == directionLabel)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.servicePatternKey, servicePatternKey) || other.servicePatternKey == servicePatternKey)&&(identical(other.branchKey, branchKey) || other.branchKey == branchKey)&&(identical(other.nextStationName, nextStationName) || other.nextStationName == nextStationName)&&(identical(other.nextStationCode, nextStationCode) || other.nextStationCode == nextStationCode)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.segmentCount, segmentCount) || other.segmentCount == segmentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,lineName,fromStationName,fromStationCode,toStationName,toStationCode,const DeepCollectionEquality().hash(stationNames),const DeepCollectionEquality().hash(stationCodes),stationCount,directionLabel,apiDirection,terminalStationName,terminalStationCode,servicePatternKey,branchKey,nextStationName,nextStationCode,durationSeconds,distanceMeters,segmentCount]);

@override
String toString() {
  return 'RouteLeg(lineName: $lineName, fromStationName: $fromStationName, fromStationCode: $fromStationCode, toStationName: $toStationName, toStationCode: $toStationCode, stationNames: $stationNames, stationCodes: $stationCodes, stationCount: $stationCount, directionLabel: $directionLabel, apiDirection: $apiDirection, terminalStationName: $terminalStationName, terminalStationCode: $terminalStationCode, servicePatternKey: $servicePatternKey, branchKey: $branchKey, nextStationName: $nextStationName, nextStationCode: $nextStationCode, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters, segmentCount: $segmentCount)';
}


}

/// @nodoc
abstract mixin class $RouteLegCopyWith<$Res>  {
  factory $RouteLegCopyWith(RouteLeg value, $Res Function(RouteLeg) _then) = _$RouteLegCopyWithImpl;
@useResult
$Res call({
 String lineName, String fromStationName, String? fromStationCode, String toStationName, String? toStationCode, List<String> stationNames, List<String> stationCodes, int stationCount, String directionLabel, String? apiDirection, String? terminalStationName, String? terminalStationCode, String servicePatternKey, String branchKey, String nextStationName, String? nextStationCode, int durationSeconds, int distanceMeters, int segmentCount
});




}
/// @nodoc
class _$RouteLegCopyWithImpl<$Res>
    implements $RouteLegCopyWith<$Res> {
  _$RouteLegCopyWithImpl(this._self, this._then);

  final RouteLeg _self;
  final $Res Function(RouteLeg) _then;

/// Create a copy of RouteLeg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineName = null,Object? fromStationName = null,Object? fromStationCode = freezed,Object? toStationName = null,Object? toStationCode = freezed,Object? stationNames = null,Object? stationCodes = null,Object? stationCount = null,Object? directionLabel = null,Object? apiDirection = freezed,Object? terminalStationName = freezed,Object? terminalStationCode = freezed,Object? servicePatternKey = null,Object? branchKey = null,Object? nextStationName = null,Object? nextStationCode = freezed,Object? durationSeconds = null,Object? distanceMeters = null,Object? segmentCount = null,}) {
  return _then(_self.copyWith(
lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,fromStationName: null == fromStationName ? _self.fromStationName : fromStationName // ignore: cast_nullable_to_non_nullable
as String,fromStationCode: freezed == fromStationCode ? _self.fromStationCode : fromStationCode // ignore: cast_nullable_to_non_nullable
as String?,toStationName: null == toStationName ? _self.toStationName : toStationName // ignore: cast_nullable_to_non_nullable
as String,toStationCode: freezed == toStationCode ? _self.toStationCode : toStationCode // ignore: cast_nullable_to_non_nullable
as String?,stationNames: null == stationNames ? _self.stationNames : stationNames // ignore: cast_nullable_to_non_nullable
as List<String>,stationCodes: null == stationCodes ? _self.stationCodes : stationCodes // ignore: cast_nullable_to_non_nullable
as List<String>,stationCount: null == stationCount ? _self.stationCount : stationCount // ignore: cast_nullable_to_non_nullable
as int,directionLabel: null == directionLabel ? _self.directionLabel : directionLabel // ignore: cast_nullable_to_non_nullable
as String,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,servicePatternKey: null == servicePatternKey ? _self.servicePatternKey : servicePatternKey // ignore: cast_nullable_to_non_nullable
as String,branchKey: null == branchKey ? _self.branchKey : branchKey // ignore: cast_nullable_to_non_nullable
as String,nextStationName: null == nextStationName ? _self.nextStationName : nextStationName // ignore: cast_nullable_to_non_nullable
as String,nextStationCode: freezed == nextStationCode ? _self.nextStationCode : nextStationCode // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,segmentCount: null == segmentCount ? _self.segmentCount : segmentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteLeg].
extension RouteLegPatterns on RouteLeg {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteLeg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteLeg() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteLeg value)  $default,){
final _that = this;
switch (_that) {
case _RouteLeg():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteLeg value)?  $default,){
final _that = this;
switch (_that) {
case _RouteLeg() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lineName,  String fromStationName,  String? fromStationCode,  String toStationName,  String? toStationCode,  List<String> stationNames,  List<String> stationCodes,  int stationCount,  String directionLabel,  String? apiDirection,  String? terminalStationName,  String? terminalStationCode,  String servicePatternKey,  String branchKey,  String nextStationName,  String? nextStationCode,  int durationSeconds,  int distanceMeters,  int segmentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteLeg() when $default != null:
return $default(_that.lineName,_that.fromStationName,_that.fromStationCode,_that.toStationName,_that.toStationCode,_that.stationNames,_that.stationCodes,_that.stationCount,_that.directionLabel,_that.apiDirection,_that.terminalStationName,_that.terminalStationCode,_that.servicePatternKey,_that.branchKey,_that.nextStationName,_that.nextStationCode,_that.durationSeconds,_that.distanceMeters,_that.segmentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lineName,  String fromStationName,  String? fromStationCode,  String toStationName,  String? toStationCode,  List<String> stationNames,  List<String> stationCodes,  int stationCount,  String directionLabel,  String? apiDirection,  String? terminalStationName,  String? terminalStationCode,  String servicePatternKey,  String branchKey,  String nextStationName,  String? nextStationCode,  int durationSeconds,  int distanceMeters,  int segmentCount)  $default,) {final _that = this;
switch (_that) {
case _RouteLeg():
return $default(_that.lineName,_that.fromStationName,_that.fromStationCode,_that.toStationName,_that.toStationCode,_that.stationNames,_that.stationCodes,_that.stationCount,_that.directionLabel,_that.apiDirection,_that.terminalStationName,_that.terminalStationCode,_that.servicePatternKey,_that.branchKey,_that.nextStationName,_that.nextStationCode,_that.durationSeconds,_that.distanceMeters,_that.segmentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lineName,  String fromStationName,  String? fromStationCode,  String toStationName,  String? toStationCode,  List<String> stationNames,  List<String> stationCodes,  int stationCount,  String directionLabel,  String? apiDirection,  String? terminalStationName,  String? terminalStationCode,  String servicePatternKey,  String branchKey,  String nextStationName,  String? nextStationCode,  int durationSeconds,  int distanceMeters,  int segmentCount)?  $default,) {final _that = this;
switch (_that) {
case _RouteLeg() when $default != null:
return $default(_that.lineName,_that.fromStationName,_that.fromStationCode,_that.toStationName,_that.toStationCode,_that.stationNames,_that.stationCodes,_that.stationCount,_that.directionLabel,_that.apiDirection,_that.terminalStationName,_that.terminalStationCode,_that.servicePatternKey,_that.branchKey,_that.nextStationName,_that.nextStationCode,_that.durationSeconds,_that.distanceMeters,_that.segmentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteLeg implements RouteLeg {
  const _RouteLeg({required this.lineName, required this.fromStationName, this.fromStationCode, required this.toStationName, this.toStationCode, required final  List<String> stationNames, final  List<String> stationCodes = const <String>[], required this.stationCount, required this.directionLabel, required this.apiDirection, required this.terminalStationName, this.terminalStationCode, required this.servicePatternKey, required this.branchKey, required this.nextStationName, this.nextStationCode, required this.durationSeconds, required this.distanceMeters, required this.segmentCount}): _stationNames = stationNames,_stationCodes = stationCodes;
  factory _RouteLeg.fromJson(Map<String, dynamic> json) => _$RouteLegFromJson(json);

@override final  String lineName;
@override final  String fromStationName;
@override final  String? fromStationCode;
@override final  String toStationName;
@override final  String? toStationCode;
 final  List<String> _stationNames;
@override List<String> get stationNames {
  if (_stationNames is EqualUnmodifiableListView) return _stationNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stationNames);
}

 final  List<String> _stationCodes;
@override@JsonKey() List<String> get stationCodes {
  if (_stationCodes is EqualUnmodifiableListView) return _stationCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stationCodes);
}

@override final  int stationCount;
@override final  String directionLabel;
@override final  String? apiDirection;
@override final  String? terminalStationName;
@override final  String? terminalStationCode;
@override final  String servicePatternKey;
@override final  String branchKey;
@override final  String nextStationName;
@override final  String? nextStationCode;
@override final  int durationSeconds;
@override final  int distanceMeters;
@override final  int segmentCount;

/// Create a copy of RouteLeg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteLegCopyWith<_RouteLeg> get copyWith => __$RouteLegCopyWithImpl<_RouteLeg>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteLegToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteLeg&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.fromStationName, fromStationName) || other.fromStationName == fromStationName)&&(identical(other.fromStationCode, fromStationCode) || other.fromStationCode == fromStationCode)&&(identical(other.toStationName, toStationName) || other.toStationName == toStationName)&&(identical(other.toStationCode, toStationCode) || other.toStationCode == toStationCode)&&const DeepCollectionEquality().equals(other._stationNames, _stationNames)&&const DeepCollectionEquality().equals(other._stationCodes, _stationCodes)&&(identical(other.stationCount, stationCount) || other.stationCount == stationCount)&&(identical(other.directionLabel, directionLabel) || other.directionLabel == directionLabel)&&(identical(other.apiDirection, apiDirection) || other.apiDirection == apiDirection)&&(identical(other.terminalStationName, terminalStationName) || other.terminalStationName == terminalStationName)&&(identical(other.terminalStationCode, terminalStationCode) || other.terminalStationCode == terminalStationCode)&&(identical(other.servicePatternKey, servicePatternKey) || other.servicePatternKey == servicePatternKey)&&(identical(other.branchKey, branchKey) || other.branchKey == branchKey)&&(identical(other.nextStationName, nextStationName) || other.nextStationName == nextStationName)&&(identical(other.nextStationCode, nextStationCode) || other.nextStationCode == nextStationCode)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.segmentCount, segmentCount) || other.segmentCount == segmentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,lineName,fromStationName,fromStationCode,toStationName,toStationCode,const DeepCollectionEquality().hash(_stationNames),const DeepCollectionEquality().hash(_stationCodes),stationCount,directionLabel,apiDirection,terminalStationName,terminalStationCode,servicePatternKey,branchKey,nextStationName,nextStationCode,durationSeconds,distanceMeters,segmentCount]);

@override
String toString() {
  return 'RouteLeg(lineName: $lineName, fromStationName: $fromStationName, fromStationCode: $fromStationCode, toStationName: $toStationName, toStationCode: $toStationCode, stationNames: $stationNames, stationCodes: $stationCodes, stationCount: $stationCount, directionLabel: $directionLabel, apiDirection: $apiDirection, terminalStationName: $terminalStationName, terminalStationCode: $terminalStationCode, servicePatternKey: $servicePatternKey, branchKey: $branchKey, nextStationName: $nextStationName, nextStationCode: $nextStationCode, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters, segmentCount: $segmentCount)';
}


}

/// @nodoc
abstract mixin class _$RouteLegCopyWith<$Res> implements $RouteLegCopyWith<$Res> {
  factory _$RouteLegCopyWith(_RouteLeg value, $Res Function(_RouteLeg) _then) = __$RouteLegCopyWithImpl;
@override @useResult
$Res call({
 String lineName, String fromStationName, String? fromStationCode, String toStationName, String? toStationCode, List<String> stationNames, List<String> stationCodes, int stationCount, String directionLabel, String? apiDirection, String? terminalStationName, String? terminalStationCode, String servicePatternKey, String branchKey, String nextStationName, String? nextStationCode, int durationSeconds, int distanceMeters, int segmentCount
});




}
/// @nodoc
class __$RouteLegCopyWithImpl<$Res>
    implements _$RouteLegCopyWith<$Res> {
  __$RouteLegCopyWithImpl(this._self, this._then);

  final _RouteLeg _self;
  final $Res Function(_RouteLeg) _then;

/// Create a copy of RouteLeg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineName = null,Object? fromStationName = null,Object? fromStationCode = freezed,Object? toStationName = null,Object? toStationCode = freezed,Object? stationNames = null,Object? stationCodes = null,Object? stationCount = null,Object? directionLabel = null,Object? apiDirection = freezed,Object? terminalStationName = freezed,Object? terminalStationCode = freezed,Object? servicePatternKey = null,Object? branchKey = null,Object? nextStationName = null,Object? nextStationCode = freezed,Object? durationSeconds = null,Object? distanceMeters = null,Object? segmentCount = null,}) {
  return _then(_RouteLeg(
lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,fromStationName: null == fromStationName ? _self.fromStationName : fromStationName // ignore: cast_nullable_to_non_nullable
as String,fromStationCode: freezed == fromStationCode ? _self.fromStationCode : fromStationCode // ignore: cast_nullable_to_non_nullable
as String?,toStationName: null == toStationName ? _self.toStationName : toStationName // ignore: cast_nullable_to_non_nullable
as String,toStationCode: freezed == toStationCode ? _self.toStationCode : toStationCode // ignore: cast_nullable_to_non_nullable
as String?,stationNames: null == stationNames ? _self._stationNames : stationNames // ignore: cast_nullable_to_non_nullable
as List<String>,stationCodes: null == stationCodes ? _self._stationCodes : stationCodes // ignore: cast_nullable_to_non_nullable
as List<String>,stationCount: null == stationCount ? _self.stationCount : stationCount // ignore: cast_nullable_to_non_nullable
as int,directionLabel: null == directionLabel ? _self.directionLabel : directionLabel // ignore: cast_nullable_to_non_nullable
as String,apiDirection: freezed == apiDirection ? _self.apiDirection : apiDirection // ignore: cast_nullable_to_non_nullable
as String?,terminalStationName: freezed == terminalStationName ? _self.terminalStationName : terminalStationName // ignore: cast_nullable_to_non_nullable
as String?,terminalStationCode: freezed == terminalStationCode ? _self.terminalStationCode : terminalStationCode // ignore: cast_nullable_to_non_nullable
as String?,servicePatternKey: null == servicePatternKey ? _self.servicePatternKey : servicePatternKey // ignore: cast_nullable_to_non_nullable
as String,branchKey: null == branchKey ? _self.branchKey : branchKey // ignore: cast_nullable_to_non_nullable
as String,nextStationName: null == nextStationName ? _self.nextStationName : nextStationName // ignore: cast_nullable_to_non_nullable
as String,nextStationCode: freezed == nextStationCode ? _self.nextStationCode : nextStationCode // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,segmentCount: null == segmentCount ? _self.segmentCount : segmentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
