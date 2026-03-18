// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteViewData {

 RouteSummaryViewData get summary; List<RouteLegItemViewData> get legItems; List<RouteTransferItemViewData> get transferItems;
/// Create a copy of RouteViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteViewDataCopyWith<RouteViewData> get copyWith => _$RouteViewDataCopyWithImpl<RouteViewData>(this as RouteViewData, _$identity);

  /// Serializes this RouteViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteViewData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.legItems, legItems)&&const DeepCollectionEquality().equals(other.transferItems, transferItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(legItems),const DeepCollectionEquality().hash(transferItems));

@override
String toString() {
  return 'RouteViewData(summary: $summary, legItems: $legItems, transferItems: $transferItems)';
}


}

/// @nodoc
abstract mixin class $RouteViewDataCopyWith<$Res>  {
  factory $RouteViewDataCopyWith(RouteViewData value, $Res Function(RouteViewData) _then) = _$RouteViewDataCopyWithImpl;
@useResult
$Res call({
 RouteSummaryViewData summary, List<RouteLegItemViewData> legItems, List<RouteTransferItemViewData> transferItems
});


$RouteSummaryViewDataCopyWith<$Res> get summary;

}
/// @nodoc
class _$RouteViewDataCopyWithImpl<$Res>
    implements $RouteViewDataCopyWith<$Res> {
  _$RouteViewDataCopyWithImpl(this._self, this._then);

  final RouteViewData _self;
  final $Res Function(RouteViewData) _then;

/// Create a copy of RouteViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? legItems = null,Object? transferItems = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RouteSummaryViewData,legItems: null == legItems ? _self.legItems : legItems // ignore: cast_nullable_to_non_nullable
as List<RouteLegItemViewData>,transferItems: null == transferItems ? _self.transferItems : transferItems // ignore: cast_nullable_to_non_nullable
as List<RouteTransferItemViewData>,
  ));
}
/// Create a copy of RouteViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteSummaryViewDataCopyWith<$Res> get summary {
  
  return $RouteSummaryViewDataCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteViewData].
extension RouteViewDataPatterns on RouteViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteViewData value)  $default,){
final _that = this;
switch (_that) {
case _RouteViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteViewData value)?  $default,){
final _that = this;
switch (_that) {
case _RouteViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RouteSummaryViewData summary,  List<RouteLegItemViewData> legItems,  List<RouteTransferItemViewData> transferItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteViewData() when $default != null:
return $default(_that.summary,_that.legItems,_that.transferItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RouteSummaryViewData summary,  List<RouteLegItemViewData> legItems,  List<RouteTransferItemViewData> transferItems)  $default,) {final _that = this;
switch (_that) {
case _RouteViewData():
return $default(_that.summary,_that.legItems,_that.transferItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RouteSummaryViewData summary,  List<RouteLegItemViewData> legItems,  List<RouteTransferItemViewData> transferItems)?  $default,) {final _that = this;
switch (_that) {
case _RouteViewData() when $default != null:
return $default(_that.summary,_that.legItems,_that.transferItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteViewData implements RouteViewData {
  const _RouteViewData({required this.summary, required final  List<RouteLegItemViewData> legItems, required final  List<RouteTransferItemViewData> transferItems}): _legItems = legItems,_transferItems = transferItems;
  factory _RouteViewData.fromJson(Map<String, dynamic> json) => _$RouteViewDataFromJson(json);

@override final  RouteSummaryViewData summary;
 final  List<RouteLegItemViewData> _legItems;
@override List<RouteLegItemViewData> get legItems {
  if (_legItems is EqualUnmodifiableListView) return _legItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_legItems);
}

 final  List<RouteTransferItemViewData> _transferItems;
@override List<RouteTransferItemViewData> get transferItems {
  if (_transferItems is EqualUnmodifiableListView) return _transferItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transferItems);
}


/// Create a copy of RouteViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteViewDataCopyWith<_RouteViewData> get copyWith => __$RouteViewDataCopyWithImpl<_RouteViewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteViewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteViewData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._legItems, _legItems)&&const DeepCollectionEquality().equals(other._transferItems, _transferItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_legItems),const DeepCollectionEquality().hash(_transferItems));

@override
String toString() {
  return 'RouteViewData(summary: $summary, legItems: $legItems, transferItems: $transferItems)';
}


}

/// @nodoc
abstract mixin class _$RouteViewDataCopyWith<$Res> implements $RouteViewDataCopyWith<$Res> {
  factory _$RouteViewDataCopyWith(_RouteViewData value, $Res Function(_RouteViewData) _then) = __$RouteViewDataCopyWithImpl;
@override @useResult
$Res call({
 RouteSummaryViewData summary, List<RouteLegItemViewData> legItems, List<RouteTransferItemViewData> transferItems
});


@override $RouteSummaryViewDataCopyWith<$Res> get summary;

}
/// @nodoc
class __$RouteViewDataCopyWithImpl<$Res>
    implements _$RouteViewDataCopyWith<$Res> {
  __$RouteViewDataCopyWithImpl(this._self, this._then);

  final _RouteViewData _self;
  final $Res Function(_RouteViewData) _then;

/// Create a copy of RouteViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? legItems = null,Object? transferItems = null,}) {
  return _then(_RouteViewData(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RouteSummaryViewData,legItems: null == legItems ? _self._legItems : legItems // ignore: cast_nullable_to_non_nullable
as List<RouteLegItemViewData>,transferItems: null == transferItems ? _self._transferItems : transferItems // ignore: cast_nullable_to_non_nullable
as List<RouteTransferItemViewData>,
  ));
}

/// Create a copy of RouteViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteSummaryViewDataCopyWith<$Res> get summary {
  
  return $RouteSummaryViewDataCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$RouteSummaryViewData {

 String get departureStationName; String get arrivalStationName; String get totalDurationText; String get totalFareText; String get transferCountText;
/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteSummaryViewDataCopyWith<RouteSummaryViewData> get copyWith => _$RouteSummaryViewDataCopyWithImpl<RouteSummaryViewData>(this as RouteSummaryViewData, _$identity);

  /// Serializes this RouteSummaryViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteSummaryViewData&&(identical(other.departureStationName, departureStationName) || other.departureStationName == departureStationName)&&(identical(other.arrivalStationName, arrivalStationName) || other.arrivalStationName == arrivalStationName)&&(identical(other.totalDurationText, totalDurationText) || other.totalDurationText == totalDurationText)&&(identical(other.totalFareText, totalFareText) || other.totalFareText == totalFareText)&&(identical(other.transferCountText, transferCountText) || other.transferCountText == transferCountText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureStationName,arrivalStationName,totalDurationText,totalFareText,transferCountText);

@override
String toString() {
  return 'RouteSummaryViewData(departureStationName: $departureStationName, arrivalStationName: $arrivalStationName, totalDurationText: $totalDurationText, totalFareText: $totalFareText, transferCountText: $transferCountText)';
}


}

/// @nodoc
abstract mixin class $RouteSummaryViewDataCopyWith<$Res>  {
  factory $RouteSummaryViewDataCopyWith(RouteSummaryViewData value, $Res Function(RouteSummaryViewData) _then) = _$RouteSummaryViewDataCopyWithImpl;
@useResult
$Res call({
 String departureStationName, String arrivalStationName, String totalDurationText, String totalFareText, String transferCountText
});




}
/// @nodoc
class _$RouteSummaryViewDataCopyWithImpl<$Res>
    implements $RouteSummaryViewDataCopyWith<$Res> {
  _$RouteSummaryViewDataCopyWithImpl(this._self, this._then);

  final RouteSummaryViewData _self;
  final $Res Function(RouteSummaryViewData) _then;

/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departureStationName = null,Object? arrivalStationName = null,Object? totalDurationText = null,Object? totalFareText = null,Object? transferCountText = null,}) {
  return _then(_self.copyWith(
departureStationName: null == departureStationName ? _self.departureStationName : departureStationName // ignore: cast_nullable_to_non_nullable
as String,arrivalStationName: null == arrivalStationName ? _self.arrivalStationName : arrivalStationName // ignore: cast_nullable_to_non_nullable
as String,totalDurationText: null == totalDurationText ? _self.totalDurationText : totalDurationText // ignore: cast_nullable_to_non_nullable
as String,totalFareText: null == totalFareText ? _self.totalFareText : totalFareText // ignore: cast_nullable_to_non_nullable
as String,transferCountText: null == transferCountText ? _self.transferCountText : transferCountText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteSummaryViewData].
extension RouteSummaryViewDataPatterns on RouteSummaryViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteSummaryViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteSummaryViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteSummaryViewData value)  $default,){
final _that = this;
switch (_that) {
case _RouteSummaryViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteSummaryViewData value)?  $default,){
final _that = this;
switch (_that) {
case _RouteSummaryViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String departureStationName,  String arrivalStationName,  String totalDurationText,  String totalFareText,  String transferCountText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteSummaryViewData() when $default != null:
return $default(_that.departureStationName,_that.arrivalStationName,_that.totalDurationText,_that.totalFareText,_that.transferCountText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String departureStationName,  String arrivalStationName,  String totalDurationText,  String totalFareText,  String transferCountText)  $default,) {final _that = this;
switch (_that) {
case _RouteSummaryViewData():
return $default(_that.departureStationName,_that.arrivalStationName,_that.totalDurationText,_that.totalFareText,_that.transferCountText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String departureStationName,  String arrivalStationName,  String totalDurationText,  String totalFareText,  String transferCountText)?  $default,) {final _that = this;
switch (_that) {
case _RouteSummaryViewData() when $default != null:
return $default(_that.departureStationName,_that.arrivalStationName,_that.totalDurationText,_that.totalFareText,_that.transferCountText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteSummaryViewData implements RouteSummaryViewData {
  const _RouteSummaryViewData({required this.departureStationName, required this.arrivalStationName, required this.totalDurationText, required this.totalFareText, required this.transferCountText});
  factory _RouteSummaryViewData.fromJson(Map<String, dynamic> json) => _$RouteSummaryViewDataFromJson(json);

@override final  String departureStationName;
@override final  String arrivalStationName;
@override final  String totalDurationText;
@override final  String totalFareText;
@override final  String transferCountText;

/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteSummaryViewDataCopyWith<_RouteSummaryViewData> get copyWith => __$RouteSummaryViewDataCopyWithImpl<_RouteSummaryViewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteSummaryViewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteSummaryViewData&&(identical(other.departureStationName, departureStationName) || other.departureStationName == departureStationName)&&(identical(other.arrivalStationName, arrivalStationName) || other.arrivalStationName == arrivalStationName)&&(identical(other.totalDurationText, totalDurationText) || other.totalDurationText == totalDurationText)&&(identical(other.totalFareText, totalFareText) || other.totalFareText == totalFareText)&&(identical(other.transferCountText, transferCountText) || other.transferCountText == transferCountText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureStationName,arrivalStationName,totalDurationText,totalFareText,transferCountText);

@override
String toString() {
  return 'RouteSummaryViewData(departureStationName: $departureStationName, arrivalStationName: $arrivalStationName, totalDurationText: $totalDurationText, totalFareText: $totalFareText, transferCountText: $transferCountText)';
}


}

/// @nodoc
abstract mixin class _$RouteSummaryViewDataCopyWith<$Res> implements $RouteSummaryViewDataCopyWith<$Res> {
  factory _$RouteSummaryViewDataCopyWith(_RouteSummaryViewData value, $Res Function(_RouteSummaryViewData) _then) = __$RouteSummaryViewDataCopyWithImpl;
@override @useResult
$Res call({
 String departureStationName, String arrivalStationName, String totalDurationText, String totalFareText, String transferCountText
});




}
/// @nodoc
class __$RouteSummaryViewDataCopyWithImpl<$Res>
    implements _$RouteSummaryViewDataCopyWith<$Res> {
  __$RouteSummaryViewDataCopyWithImpl(this._self, this._then);

  final _RouteSummaryViewData _self;
  final $Res Function(_RouteSummaryViewData) _then;

/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departureStationName = null,Object? arrivalStationName = null,Object? totalDurationText = null,Object? totalFareText = null,Object? transferCountText = null,}) {
  return _then(_RouteSummaryViewData(
departureStationName: null == departureStationName ? _self.departureStationName : departureStationName // ignore: cast_nullable_to_non_nullable
as String,arrivalStationName: null == arrivalStationName ? _self.arrivalStationName : arrivalStationName // ignore: cast_nullable_to_non_nullable
as String,totalDurationText: null == totalDurationText ? _self.totalDurationText : totalDurationText // ignore: cast_nullable_to_non_nullable
as String,totalFareText: null == totalFareText ? _self.totalFareText : totalFareText // ignore: cast_nullable_to_non_nullable
as String,transferCountText: null == transferCountText ? _self.transferCountText : transferCountText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RouteLegItemViewData {

 String get lineName; String get directionLabel; String get fromStationName; String get toStationName; String get nextStationName; String get stationTrailText; String get stationCountText; String get durationText;
/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteLegItemViewDataCopyWith<RouteLegItemViewData> get copyWith => _$RouteLegItemViewDataCopyWithImpl<RouteLegItemViewData>(this as RouteLegItemViewData, _$identity);

  /// Serializes this RouteLegItemViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteLegItemViewData&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.directionLabel, directionLabel) || other.directionLabel == directionLabel)&&(identical(other.fromStationName, fromStationName) || other.fromStationName == fromStationName)&&(identical(other.toStationName, toStationName) || other.toStationName == toStationName)&&(identical(other.nextStationName, nextStationName) || other.nextStationName == nextStationName)&&(identical(other.stationTrailText, stationTrailText) || other.stationTrailText == stationTrailText)&&(identical(other.stationCountText, stationCountText) || other.stationCountText == stationCountText)&&(identical(other.durationText, durationText) || other.durationText == durationText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineName,directionLabel,fromStationName,toStationName,nextStationName,stationTrailText,stationCountText,durationText);

@override
String toString() {
  return 'RouteLegItemViewData(lineName: $lineName, directionLabel: $directionLabel, fromStationName: $fromStationName, toStationName: $toStationName, nextStationName: $nextStationName, stationTrailText: $stationTrailText, stationCountText: $stationCountText, durationText: $durationText)';
}


}

/// @nodoc
abstract mixin class $RouteLegItemViewDataCopyWith<$Res>  {
  factory $RouteLegItemViewDataCopyWith(RouteLegItemViewData value, $Res Function(RouteLegItemViewData) _then) = _$RouteLegItemViewDataCopyWithImpl;
@useResult
$Res call({
 String lineName, String directionLabel, String fromStationName, String toStationName, String nextStationName, String stationTrailText, String stationCountText, String durationText
});




}
/// @nodoc
class _$RouteLegItemViewDataCopyWithImpl<$Res>
    implements $RouteLegItemViewDataCopyWith<$Res> {
  _$RouteLegItemViewDataCopyWithImpl(this._self, this._then);

  final RouteLegItemViewData _self;
  final $Res Function(RouteLegItemViewData) _then;

/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineName = null,Object? directionLabel = null,Object? fromStationName = null,Object? toStationName = null,Object? nextStationName = null,Object? stationTrailText = null,Object? stationCountText = null,Object? durationText = null,}) {
  return _then(_self.copyWith(
lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,directionLabel: null == directionLabel ? _self.directionLabel : directionLabel // ignore: cast_nullable_to_non_nullable
as String,fromStationName: null == fromStationName ? _self.fromStationName : fromStationName // ignore: cast_nullable_to_non_nullable
as String,toStationName: null == toStationName ? _self.toStationName : toStationName // ignore: cast_nullable_to_non_nullable
as String,nextStationName: null == nextStationName ? _self.nextStationName : nextStationName // ignore: cast_nullable_to_non_nullable
as String,stationTrailText: null == stationTrailText ? _self.stationTrailText : stationTrailText // ignore: cast_nullable_to_non_nullable
as String,stationCountText: null == stationCountText ? _self.stationCountText : stationCountText // ignore: cast_nullable_to_non_nullable
as String,durationText: null == durationText ? _self.durationText : durationText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteLegItemViewData].
extension RouteLegItemViewDataPatterns on RouteLegItemViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteLegItemViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteLegItemViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteLegItemViewData value)  $default,){
final _that = this;
switch (_that) {
case _RouteLegItemViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteLegItemViewData value)?  $default,){
final _that = this;
switch (_that) {
case _RouteLegItemViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lineName,  String directionLabel,  String fromStationName,  String toStationName,  String nextStationName,  String stationTrailText,  String stationCountText,  String durationText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteLegItemViewData() when $default != null:
return $default(_that.lineName,_that.directionLabel,_that.fromStationName,_that.toStationName,_that.nextStationName,_that.stationTrailText,_that.stationCountText,_that.durationText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lineName,  String directionLabel,  String fromStationName,  String toStationName,  String nextStationName,  String stationTrailText,  String stationCountText,  String durationText)  $default,) {final _that = this;
switch (_that) {
case _RouteLegItemViewData():
return $default(_that.lineName,_that.directionLabel,_that.fromStationName,_that.toStationName,_that.nextStationName,_that.stationTrailText,_that.stationCountText,_that.durationText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lineName,  String directionLabel,  String fromStationName,  String toStationName,  String nextStationName,  String stationTrailText,  String stationCountText,  String durationText)?  $default,) {final _that = this;
switch (_that) {
case _RouteLegItemViewData() when $default != null:
return $default(_that.lineName,_that.directionLabel,_that.fromStationName,_that.toStationName,_that.nextStationName,_that.stationTrailText,_that.stationCountText,_that.durationText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteLegItemViewData implements RouteLegItemViewData {
  const _RouteLegItemViewData({required this.lineName, required this.directionLabel, required this.fromStationName, required this.toStationName, required this.nextStationName, required this.stationTrailText, required this.stationCountText, required this.durationText});
  factory _RouteLegItemViewData.fromJson(Map<String, dynamic> json) => _$RouteLegItemViewDataFromJson(json);

@override final  String lineName;
@override final  String directionLabel;
@override final  String fromStationName;
@override final  String toStationName;
@override final  String nextStationName;
@override final  String stationTrailText;
@override final  String stationCountText;
@override final  String durationText;

/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteLegItemViewDataCopyWith<_RouteLegItemViewData> get copyWith => __$RouteLegItemViewDataCopyWithImpl<_RouteLegItemViewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteLegItemViewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteLegItemViewData&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.directionLabel, directionLabel) || other.directionLabel == directionLabel)&&(identical(other.fromStationName, fromStationName) || other.fromStationName == fromStationName)&&(identical(other.toStationName, toStationName) || other.toStationName == toStationName)&&(identical(other.nextStationName, nextStationName) || other.nextStationName == nextStationName)&&(identical(other.stationTrailText, stationTrailText) || other.stationTrailText == stationTrailText)&&(identical(other.stationCountText, stationCountText) || other.stationCountText == stationCountText)&&(identical(other.durationText, durationText) || other.durationText == durationText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineName,directionLabel,fromStationName,toStationName,nextStationName,stationTrailText,stationCountText,durationText);

@override
String toString() {
  return 'RouteLegItemViewData(lineName: $lineName, directionLabel: $directionLabel, fromStationName: $fromStationName, toStationName: $toStationName, nextStationName: $nextStationName, stationTrailText: $stationTrailText, stationCountText: $stationCountText, durationText: $durationText)';
}


}

/// @nodoc
abstract mixin class _$RouteLegItemViewDataCopyWith<$Res> implements $RouteLegItemViewDataCopyWith<$Res> {
  factory _$RouteLegItemViewDataCopyWith(_RouteLegItemViewData value, $Res Function(_RouteLegItemViewData) _then) = __$RouteLegItemViewDataCopyWithImpl;
@override @useResult
$Res call({
 String lineName, String directionLabel, String fromStationName, String toStationName, String nextStationName, String stationTrailText, String stationCountText, String durationText
});




}
/// @nodoc
class __$RouteLegItemViewDataCopyWithImpl<$Res>
    implements _$RouteLegItemViewDataCopyWith<$Res> {
  __$RouteLegItemViewDataCopyWithImpl(this._self, this._then);

  final _RouteLegItemViewData _self;
  final $Res Function(_RouteLegItemViewData) _then;

/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineName = null,Object? directionLabel = null,Object? fromStationName = null,Object? toStationName = null,Object? nextStationName = null,Object? stationTrailText = null,Object? stationCountText = null,Object? durationText = null,}) {
  return _then(_RouteLegItemViewData(
lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,directionLabel: null == directionLabel ? _self.directionLabel : directionLabel // ignore: cast_nullable_to_non_nullable
as String,fromStationName: null == fromStationName ? _self.fromStationName : fromStationName // ignore: cast_nullable_to_non_nullable
as String,toStationName: null == toStationName ? _self.toStationName : toStationName // ignore: cast_nullable_to_non_nullable
as String,nextStationName: null == nextStationName ? _self.nextStationName : nextStationName // ignore: cast_nullable_to_non_nullable
as String,stationTrailText: null == stationTrailText ? _self.stationTrailText : stationTrailText // ignore: cast_nullable_to_non_nullable
as String,stationCountText: null == stationCountText ? _self.stationCountText : stationCountText // ignore: cast_nullable_to_non_nullable
as String,durationText: null == durationText ? _self.durationText : durationText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RouteTransferItemViewData {

 String get stationName; String get fromLineName; String get toLineName; String get walkingTimeText;
/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteTransferItemViewDataCopyWith<RouteTransferItemViewData> get copyWith => _$RouteTransferItemViewDataCopyWithImpl<RouteTransferItemViewData>(this as RouteTransferItemViewData, _$identity);

  /// Serializes this RouteTransferItemViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteTransferItemViewData&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.fromLineName, fromLineName) || other.fromLineName == fromLineName)&&(identical(other.toLineName, toLineName) || other.toLineName == toLineName)&&(identical(other.walkingTimeText, walkingTimeText) || other.walkingTimeText == walkingTimeText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationName,fromLineName,toLineName,walkingTimeText);

@override
String toString() {
  return 'RouteTransferItemViewData(stationName: $stationName, fromLineName: $fromLineName, toLineName: $toLineName, walkingTimeText: $walkingTimeText)';
}


}

/// @nodoc
abstract mixin class $RouteTransferItemViewDataCopyWith<$Res>  {
  factory $RouteTransferItemViewDataCopyWith(RouteTransferItemViewData value, $Res Function(RouteTransferItemViewData) _then) = _$RouteTransferItemViewDataCopyWithImpl;
@useResult
$Res call({
 String stationName, String fromLineName, String toLineName, String walkingTimeText
});




}
/// @nodoc
class _$RouteTransferItemViewDataCopyWithImpl<$Res>
    implements $RouteTransferItemViewDataCopyWith<$Res> {
  _$RouteTransferItemViewDataCopyWithImpl(this._self, this._then);

  final RouteTransferItemViewData _self;
  final $Res Function(RouteTransferItemViewData) _then;

/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationName = null,Object? fromLineName = null,Object? toLineName = null,Object? walkingTimeText = null,}) {
  return _then(_self.copyWith(
stationName: null == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String,fromLineName: null == fromLineName ? _self.fromLineName : fromLineName // ignore: cast_nullable_to_non_nullable
as String,toLineName: null == toLineName ? _self.toLineName : toLineName // ignore: cast_nullable_to_non_nullable
as String,walkingTimeText: null == walkingTimeText ? _self.walkingTimeText : walkingTimeText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteTransferItemViewData].
extension RouteTransferItemViewDataPatterns on RouteTransferItemViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteTransferItemViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteTransferItemViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteTransferItemViewData value)  $default,){
final _that = this;
switch (_that) {
case _RouteTransferItemViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteTransferItemViewData value)?  $default,){
final _that = this;
switch (_that) {
case _RouteTransferItemViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stationName,  String fromLineName,  String toLineName,  String walkingTimeText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteTransferItemViewData() when $default != null:
return $default(_that.stationName,_that.fromLineName,_that.toLineName,_that.walkingTimeText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stationName,  String fromLineName,  String toLineName,  String walkingTimeText)  $default,) {final _that = this;
switch (_that) {
case _RouteTransferItemViewData():
return $default(_that.stationName,_that.fromLineName,_that.toLineName,_that.walkingTimeText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stationName,  String fromLineName,  String toLineName,  String walkingTimeText)?  $default,) {final _that = this;
switch (_that) {
case _RouteTransferItemViewData() when $default != null:
return $default(_that.stationName,_that.fromLineName,_that.toLineName,_that.walkingTimeText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteTransferItemViewData implements RouteTransferItemViewData {
  const _RouteTransferItemViewData({required this.stationName, required this.fromLineName, required this.toLineName, required this.walkingTimeText});
  factory _RouteTransferItemViewData.fromJson(Map<String, dynamic> json) => _$RouteTransferItemViewDataFromJson(json);

@override final  String stationName;
@override final  String fromLineName;
@override final  String toLineName;
@override final  String walkingTimeText;

/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteTransferItemViewDataCopyWith<_RouteTransferItemViewData> get copyWith => __$RouteTransferItemViewDataCopyWithImpl<_RouteTransferItemViewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteTransferItemViewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteTransferItemViewData&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.fromLineName, fromLineName) || other.fromLineName == fromLineName)&&(identical(other.toLineName, toLineName) || other.toLineName == toLineName)&&(identical(other.walkingTimeText, walkingTimeText) || other.walkingTimeText == walkingTimeText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationName,fromLineName,toLineName,walkingTimeText);

@override
String toString() {
  return 'RouteTransferItemViewData(stationName: $stationName, fromLineName: $fromLineName, toLineName: $toLineName, walkingTimeText: $walkingTimeText)';
}


}

/// @nodoc
abstract mixin class _$RouteTransferItemViewDataCopyWith<$Res> implements $RouteTransferItemViewDataCopyWith<$Res> {
  factory _$RouteTransferItemViewDataCopyWith(_RouteTransferItemViewData value, $Res Function(_RouteTransferItemViewData) _then) = __$RouteTransferItemViewDataCopyWithImpl;
@override @useResult
$Res call({
 String stationName, String fromLineName, String toLineName, String walkingTimeText
});




}
/// @nodoc
class __$RouteTransferItemViewDataCopyWithImpl<$Res>
    implements _$RouteTransferItemViewDataCopyWith<$Res> {
  __$RouteTransferItemViewDataCopyWithImpl(this._self, this._then);

  final _RouteTransferItemViewData _self;
  final $Res Function(_RouteTransferItemViewData) _then;

/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationName = null,Object? fromLineName = null,Object? toLineName = null,Object? walkingTimeText = null,}) {
  return _then(_RouteTransferItemViewData(
stationName: null == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String,fromLineName: null == fromLineName ? _self.fromLineName : fromLineName // ignore: cast_nullable_to_non_nullable
as String,toLineName: null == toLineName ? _self.toLineName : toLineName // ignore: cast_nullable_to_non_nullable
as String,walkingTimeText: null == walkingTimeText ? _self.walkingTimeText : walkingTimeText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
