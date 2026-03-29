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
mixin _$StationDisplayNameViewData {

 String get primary; String? get secondary; String get fullText;
/// Create a copy of StationDisplayNameViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<StationDisplayNameViewData> get copyWith => _$StationDisplayNameViewDataCopyWithImpl<StationDisplayNameViewData>(this as StationDisplayNameViewData, _$identity);

  /// Serializes this StationDisplayNameViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StationDisplayNameViewData&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.fullText, fullText) || other.fullText == fullText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary,fullText);

@override
String toString() {
  return 'StationDisplayNameViewData(primary: $primary, secondary: $secondary, fullText: $fullText)';
}


}

/// @nodoc
abstract mixin class $StationDisplayNameViewDataCopyWith<$Res>  {
  factory $StationDisplayNameViewDataCopyWith(StationDisplayNameViewData value, $Res Function(StationDisplayNameViewData) _then) = _$StationDisplayNameViewDataCopyWithImpl;
@useResult
$Res call({
 String primary, String? secondary, String fullText
});




}
/// @nodoc
class _$StationDisplayNameViewDataCopyWithImpl<$Res>
    implements $StationDisplayNameViewDataCopyWith<$Res> {
  _$StationDisplayNameViewDataCopyWithImpl(this._self, this._then);

  final StationDisplayNameViewData _self;
  final $Res Function(StationDisplayNameViewData) _then;

/// Create a copy of StationDisplayNameViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = null,Object? secondary = freezed,Object? fullText = null,}) {
  return _then(_self.copyWith(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as String,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as String?,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StationDisplayNameViewData].
extension StationDisplayNameViewDataPatterns on StationDisplayNameViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StationDisplayNameViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StationDisplayNameViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StationDisplayNameViewData value)  $default,){
final _that = this;
switch (_that) {
case _StationDisplayNameViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StationDisplayNameViewData value)?  $default,){
final _that = this;
switch (_that) {
case _StationDisplayNameViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String primary,  String? secondary,  String fullText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StationDisplayNameViewData() when $default != null:
return $default(_that.primary,_that.secondary,_that.fullText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String primary,  String? secondary,  String fullText)  $default,) {final _that = this;
switch (_that) {
case _StationDisplayNameViewData():
return $default(_that.primary,_that.secondary,_that.fullText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String primary,  String? secondary,  String fullText)?  $default,) {final _that = this;
switch (_that) {
case _StationDisplayNameViewData() when $default != null:
return $default(_that.primary,_that.secondary,_that.fullText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StationDisplayNameViewData implements StationDisplayNameViewData {
  const _StationDisplayNameViewData({required this.primary, this.secondary, required this.fullText});
  factory _StationDisplayNameViewData.fromJson(Map<String, dynamic> json) => _$StationDisplayNameViewDataFromJson(json);

@override final  String primary;
@override final  String? secondary;
@override final  String fullText;

/// Create a copy of StationDisplayNameViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationDisplayNameViewDataCopyWith<_StationDisplayNameViewData> get copyWith => __$StationDisplayNameViewDataCopyWithImpl<_StationDisplayNameViewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationDisplayNameViewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StationDisplayNameViewData&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.fullText, fullText) || other.fullText == fullText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary,fullText);

@override
String toString() {
  return 'StationDisplayNameViewData(primary: $primary, secondary: $secondary, fullText: $fullText)';
}


}

/// @nodoc
abstract mixin class _$StationDisplayNameViewDataCopyWith<$Res> implements $StationDisplayNameViewDataCopyWith<$Res> {
  factory _$StationDisplayNameViewDataCopyWith(_StationDisplayNameViewData value, $Res Function(_StationDisplayNameViewData) _then) = __$StationDisplayNameViewDataCopyWithImpl;
@override @useResult
$Res call({
 String primary, String? secondary, String fullText
});




}
/// @nodoc
class __$StationDisplayNameViewDataCopyWithImpl<$Res>
    implements _$StationDisplayNameViewDataCopyWith<$Res> {
  __$StationDisplayNameViewDataCopyWithImpl(this._self, this._then);

  final _StationDisplayNameViewData _self;
  final $Res Function(_StationDisplayNameViewData) _then;

/// Create a copy of StationDisplayNameViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = null,Object? secondary = freezed,Object? fullText = null,}) {
  return _then(_StationDisplayNameViewData(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as String,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as String?,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RouteSummaryViewData {

 StationDisplayNameViewData get departureStation; StationDisplayNameViewData get arrivalStation; int get totalDurationSeconds; int get totalFare; int get transferCount; String get totalDurationText; String get totalFareText; String get transferCountText;
/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteSummaryViewDataCopyWith<RouteSummaryViewData> get copyWith => _$RouteSummaryViewDataCopyWithImpl<RouteSummaryViewData>(this as RouteSummaryViewData, _$identity);

  /// Serializes this RouteSummaryViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteSummaryViewData&&(identical(other.departureStation, departureStation) || other.departureStation == departureStation)&&(identical(other.arrivalStation, arrivalStation) || other.arrivalStation == arrivalStation)&&(identical(other.totalDurationSeconds, totalDurationSeconds) || other.totalDurationSeconds == totalDurationSeconds)&&(identical(other.totalFare, totalFare) || other.totalFare == totalFare)&&(identical(other.transferCount, transferCount) || other.transferCount == transferCount)&&(identical(other.totalDurationText, totalDurationText) || other.totalDurationText == totalDurationText)&&(identical(other.totalFareText, totalFareText) || other.totalFareText == totalFareText)&&(identical(other.transferCountText, transferCountText) || other.transferCountText == transferCountText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureStation,arrivalStation,totalDurationSeconds,totalFare,transferCount,totalDurationText,totalFareText,transferCountText);

@override
String toString() {
  return 'RouteSummaryViewData(departureStation: $departureStation, arrivalStation: $arrivalStation, totalDurationSeconds: $totalDurationSeconds, totalFare: $totalFare, transferCount: $transferCount, totalDurationText: $totalDurationText, totalFareText: $totalFareText, transferCountText: $transferCountText)';
}


}

/// @nodoc
abstract mixin class $RouteSummaryViewDataCopyWith<$Res>  {
  factory $RouteSummaryViewDataCopyWith(RouteSummaryViewData value, $Res Function(RouteSummaryViewData) _then) = _$RouteSummaryViewDataCopyWithImpl;
@useResult
$Res call({
 StationDisplayNameViewData departureStation, StationDisplayNameViewData arrivalStation, int totalDurationSeconds, int totalFare, int transferCount, String totalDurationText, String totalFareText, String transferCountText
});


$StationDisplayNameViewDataCopyWith<$Res> get departureStation;$StationDisplayNameViewDataCopyWith<$Res> get arrivalStation;

}
/// @nodoc
class _$RouteSummaryViewDataCopyWithImpl<$Res>
    implements $RouteSummaryViewDataCopyWith<$Res> {
  _$RouteSummaryViewDataCopyWithImpl(this._self, this._then);

  final RouteSummaryViewData _self;
  final $Res Function(RouteSummaryViewData) _then;

/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departureStation = null,Object? arrivalStation = null,Object? totalDurationSeconds = null,Object? totalFare = null,Object? transferCount = null,Object? totalDurationText = null,Object? totalFareText = null,Object? transferCountText = null,}) {
  return _then(_self.copyWith(
departureStation: null == departureStation ? _self.departureStation : departureStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,arrivalStation: null == arrivalStation ? _self.arrivalStation : arrivalStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,totalDurationSeconds: null == totalDurationSeconds ? _self.totalDurationSeconds : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,totalFare: null == totalFare ? _self.totalFare : totalFare // ignore: cast_nullable_to_non_nullable
as int,transferCount: null == transferCount ? _self.transferCount : transferCount // ignore: cast_nullable_to_non_nullable
as int,totalDurationText: null == totalDurationText ? _self.totalDurationText : totalDurationText // ignore: cast_nullable_to_non_nullable
as String,totalFareText: null == totalFareText ? _self.totalFareText : totalFareText // ignore: cast_nullable_to_non_nullable
as String,transferCountText: null == transferCountText ? _self.transferCountText : transferCountText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get departureStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.departureStation, (value) {
    return _then(_self.copyWith(departureStation: value));
  });
}/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get arrivalStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.arrivalStation, (value) {
    return _then(_self.copyWith(arrivalStation: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StationDisplayNameViewData departureStation,  StationDisplayNameViewData arrivalStation,  int totalDurationSeconds,  int totalFare,  int transferCount,  String totalDurationText,  String totalFareText,  String transferCountText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteSummaryViewData() when $default != null:
return $default(_that.departureStation,_that.arrivalStation,_that.totalDurationSeconds,_that.totalFare,_that.transferCount,_that.totalDurationText,_that.totalFareText,_that.transferCountText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StationDisplayNameViewData departureStation,  StationDisplayNameViewData arrivalStation,  int totalDurationSeconds,  int totalFare,  int transferCount,  String totalDurationText,  String totalFareText,  String transferCountText)  $default,) {final _that = this;
switch (_that) {
case _RouteSummaryViewData():
return $default(_that.departureStation,_that.arrivalStation,_that.totalDurationSeconds,_that.totalFare,_that.transferCount,_that.totalDurationText,_that.totalFareText,_that.transferCountText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StationDisplayNameViewData departureStation,  StationDisplayNameViewData arrivalStation,  int totalDurationSeconds,  int totalFare,  int transferCount,  String totalDurationText,  String totalFareText,  String transferCountText)?  $default,) {final _that = this;
switch (_that) {
case _RouteSummaryViewData() when $default != null:
return $default(_that.departureStation,_that.arrivalStation,_that.totalDurationSeconds,_that.totalFare,_that.transferCount,_that.totalDurationText,_that.totalFareText,_that.transferCountText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteSummaryViewData implements RouteSummaryViewData {
  const _RouteSummaryViewData({required this.departureStation, required this.arrivalStation, required this.totalDurationSeconds, required this.totalFare, required this.transferCount, required this.totalDurationText, required this.totalFareText, required this.transferCountText});
  factory _RouteSummaryViewData.fromJson(Map<String, dynamic> json) => _$RouteSummaryViewDataFromJson(json);

@override final  StationDisplayNameViewData departureStation;
@override final  StationDisplayNameViewData arrivalStation;
@override final  int totalDurationSeconds;
@override final  int totalFare;
@override final  int transferCount;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteSummaryViewData&&(identical(other.departureStation, departureStation) || other.departureStation == departureStation)&&(identical(other.arrivalStation, arrivalStation) || other.arrivalStation == arrivalStation)&&(identical(other.totalDurationSeconds, totalDurationSeconds) || other.totalDurationSeconds == totalDurationSeconds)&&(identical(other.totalFare, totalFare) || other.totalFare == totalFare)&&(identical(other.transferCount, transferCount) || other.transferCount == transferCount)&&(identical(other.totalDurationText, totalDurationText) || other.totalDurationText == totalDurationText)&&(identical(other.totalFareText, totalFareText) || other.totalFareText == totalFareText)&&(identical(other.transferCountText, transferCountText) || other.transferCountText == transferCountText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureStation,arrivalStation,totalDurationSeconds,totalFare,transferCount,totalDurationText,totalFareText,transferCountText);

@override
String toString() {
  return 'RouteSummaryViewData(departureStation: $departureStation, arrivalStation: $arrivalStation, totalDurationSeconds: $totalDurationSeconds, totalFare: $totalFare, transferCount: $transferCount, totalDurationText: $totalDurationText, totalFareText: $totalFareText, transferCountText: $transferCountText)';
}


}

/// @nodoc
abstract mixin class _$RouteSummaryViewDataCopyWith<$Res> implements $RouteSummaryViewDataCopyWith<$Res> {
  factory _$RouteSummaryViewDataCopyWith(_RouteSummaryViewData value, $Res Function(_RouteSummaryViewData) _then) = __$RouteSummaryViewDataCopyWithImpl;
@override @useResult
$Res call({
 StationDisplayNameViewData departureStation, StationDisplayNameViewData arrivalStation, int totalDurationSeconds, int totalFare, int transferCount, String totalDurationText, String totalFareText, String transferCountText
});


@override $StationDisplayNameViewDataCopyWith<$Res> get departureStation;@override $StationDisplayNameViewDataCopyWith<$Res> get arrivalStation;

}
/// @nodoc
class __$RouteSummaryViewDataCopyWithImpl<$Res>
    implements _$RouteSummaryViewDataCopyWith<$Res> {
  __$RouteSummaryViewDataCopyWithImpl(this._self, this._then);

  final _RouteSummaryViewData _self;
  final $Res Function(_RouteSummaryViewData) _then;

/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departureStation = null,Object? arrivalStation = null,Object? totalDurationSeconds = null,Object? totalFare = null,Object? transferCount = null,Object? totalDurationText = null,Object? totalFareText = null,Object? transferCountText = null,}) {
  return _then(_RouteSummaryViewData(
departureStation: null == departureStation ? _self.departureStation : departureStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,arrivalStation: null == arrivalStation ? _self.arrivalStation : arrivalStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,totalDurationSeconds: null == totalDurationSeconds ? _self.totalDurationSeconds : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,totalFare: null == totalFare ? _self.totalFare : totalFare // ignore: cast_nullable_to_non_nullable
as int,transferCount: null == transferCount ? _self.transferCount : transferCount // ignore: cast_nullable_to_non_nullable
as int,totalDurationText: null == totalDurationText ? _self.totalDurationText : totalDurationText // ignore: cast_nullable_to_non_nullable
as String,totalFareText: null == totalFareText ? _self.totalFareText : totalFareText // ignore: cast_nullable_to_non_nullable
as String,transferCountText: null == transferCountText ? _self.transferCountText : transferCountText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get departureStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.departureStation, (value) {
    return _then(_self.copyWith(departureStation: value));
  });
}/// Create a copy of RouteSummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get arrivalStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.arrivalStation, (value) {
    return _then(_self.copyWith(arrivalStation: value));
  });
}
}


/// @nodoc
mixin _$RouteLegItemViewData {

 String get lineName; String get lineColorHex; int get stationCount; int get durationSeconds; String get directionLabel; String get directionPositiveExamplesText; String get directionNegativeExamplesText; StationDisplayNameViewData get fromStation; StationDisplayNameViewData get toStation; List<StationDisplayNameViewData> get stations; StationDisplayNameViewData get nextStation; StationDisplayNameViewData get nextNegativeStation; String get stationTrailText; String get stationCountText; String get durationText;
/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteLegItemViewDataCopyWith<RouteLegItemViewData> get copyWith => _$RouteLegItemViewDataCopyWithImpl<RouteLegItemViewData>(this as RouteLegItemViewData, _$identity);

  /// Serializes this RouteLegItemViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteLegItemViewData&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.lineColorHex, lineColorHex) || other.lineColorHex == lineColorHex)&&(identical(other.stationCount, stationCount) || other.stationCount == stationCount)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.directionLabel, directionLabel) || other.directionLabel == directionLabel)&&(identical(other.directionPositiveExamplesText, directionPositiveExamplesText) || other.directionPositiveExamplesText == directionPositiveExamplesText)&&(identical(other.directionNegativeExamplesText, directionNegativeExamplesText) || other.directionNegativeExamplesText == directionNegativeExamplesText)&&(identical(other.fromStation, fromStation) || other.fromStation == fromStation)&&(identical(other.toStation, toStation) || other.toStation == toStation)&&const DeepCollectionEquality().equals(other.stations, stations)&&(identical(other.nextStation, nextStation) || other.nextStation == nextStation)&&(identical(other.nextNegativeStation, nextNegativeStation) || other.nextNegativeStation == nextNegativeStation)&&(identical(other.stationTrailText, stationTrailText) || other.stationTrailText == stationTrailText)&&(identical(other.stationCountText, stationCountText) || other.stationCountText == stationCountText)&&(identical(other.durationText, durationText) || other.durationText == durationText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineName,lineColorHex,stationCount,durationSeconds,directionLabel,directionPositiveExamplesText,directionNegativeExamplesText,fromStation,toStation,const DeepCollectionEquality().hash(stations),nextStation,nextNegativeStation,stationTrailText,stationCountText,durationText);

@override
String toString() {
  return 'RouteLegItemViewData(lineName: $lineName, lineColorHex: $lineColorHex, stationCount: $stationCount, durationSeconds: $durationSeconds, directionLabel: $directionLabel, directionPositiveExamplesText: $directionPositiveExamplesText, directionNegativeExamplesText: $directionNegativeExamplesText, fromStation: $fromStation, toStation: $toStation, stations: $stations, nextStation: $nextStation, nextNegativeStation: $nextNegativeStation, stationTrailText: $stationTrailText, stationCountText: $stationCountText, durationText: $durationText)';
}


}

/// @nodoc
abstract mixin class $RouteLegItemViewDataCopyWith<$Res>  {
  factory $RouteLegItemViewDataCopyWith(RouteLegItemViewData value, $Res Function(RouteLegItemViewData) _then) = _$RouteLegItemViewDataCopyWithImpl;
@useResult
$Res call({
 String lineName, String lineColorHex, int stationCount, int durationSeconds, String directionLabel, String directionPositiveExamplesText, String directionNegativeExamplesText, StationDisplayNameViewData fromStation, StationDisplayNameViewData toStation, List<StationDisplayNameViewData> stations, StationDisplayNameViewData nextStation, StationDisplayNameViewData nextNegativeStation, String stationTrailText, String stationCountText, String durationText
});


$StationDisplayNameViewDataCopyWith<$Res> get fromStation;$StationDisplayNameViewDataCopyWith<$Res> get toStation;$StationDisplayNameViewDataCopyWith<$Res> get nextStation;$StationDisplayNameViewDataCopyWith<$Res> get nextNegativeStation;

}
/// @nodoc
class _$RouteLegItemViewDataCopyWithImpl<$Res>
    implements $RouteLegItemViewDataCopyWith<$Res> {
  _$RouteLegItemViewDataCopyWithImpl(this._self, this._then);

  final RouteLegItemViewData _self;
  final $Res Function(RouteLegItemViewData) _then;

/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineName = null,Object? lineColorHex = null,Object? stationCount = null,Object? durationSeconds = null,Object? directionLabel = null,Object? directionPositiveExamplesText = null,Object? directionNegativeExamplesText = null,Object? fromStation = null,Object? toStation = null,Object? stations = null,Object? nextStation = null,Object? nextNegativeStation = null,Object? stationTrailText = null,Object? stationCountText = null,Object? durationText = null,}) {
  return _then(_self.copyWith(
lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,lineColorHex: null == lineColorHex ? _self.lineColorHex : lineColorHex // ignore: cast_nullable_to_non_nullable
as String,stationCount: null == stationCount ? _self.stationCount : stationCount // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,directionLabel: null == directionLabel ? _self.directionLabel : directionLabel // ignore: cast_nullable_to_non_nullable
as String,directionPositiveExamplesText: null == directionPositiveExamplesText ? _self.directionPositiveExamplesText : directionPositiveExamplesText // ignore: cast_nullable_to_non_nullable
as String,directionNegativeExamplesText: null == directionNegativeExamplesText ? _self.directionNegativeExamplesText : directionNegativeExamplesText // ignore: cast_nullable_to_non_nullable
as String,fromStation: null == fromStation ? _self.fromStation : fromStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,toStation: null == toStation ? _self.toStation : toStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,stations: null == stations ? _self.stations : stations // ignore: cast_nullable_to_non_nullable
as List<StationDisplayNameViewData>,nextStation: null == nextStation ? _self.nextStation : nextStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,nextNegativeStation: null == nextNegativeStation ? _self.nextNegativeStation : nextNegativeStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,stationTrailText: null == stationTrailText ? _self.stationTrailText : stationTrailText // ignore: cast_nullable_to_non_nullable
as String,stationCountText: null == stationCountText ? _self.stationCountText : stationCountText // ignore: cast_nullable_to_non_nullable
as String,durationText: null == durationText ? _self.durationText : durationText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get fromStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.fromStation, (value) {
    return _then(_self.copyWith(fromStation: value));
  });
}/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get toStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.toStation, (value) {
    return _then(_self.copyWith(toStation: value));
  });
}/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get nextStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.nextStation, (value) {
    return _then(_self.copyWith(nextStation: value));
  });
}/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get nextNegativeStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.nextNegativeStation, (value) {
    return _then(_self.copyWith(nextNegativeStation: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lineName,  String lineColorHex,  int stationCount,  int durationSeconds,  String directionLabel,  String directionPositiveExamplesText,  String directionNegativeExamplesText,  StationDisplayNameViewData fromStation,  StationDisplayNameViewData toStation,  List<StationDisplayNameViewData> stations,  StationDisplayNameViewData nextStation,  StationDisplayNameViewData nextNegativeStation,  String stationTrailText,  String stationCountText,  String durationText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteLegItemViewData() when $default != null:
return $default(_that.lineName,_that.lineColorHex,_that.stationCount,_that.durationSeconds,_that.directionLabel,_that.directionPositiveExamplesText,_that.directionNegativeExamplesText,_that.fromStation,_that.toStation,_that.stations,_that.nextStation,_that.nextNegativeStation,_that.stationTrailText,_that.stationCountText,_that.durationText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lineName,  String lineColorHex,  int stationCount,  int durationSeconds,  String directionLabel,  String directionPositiveExamplesText,  String directionNegativeExamplesText,  StationDisplayNameViewData fromStation,  StationDisplayNameViewData toStation,  List<StationDisplayNameViewData> stations,  StationDisplayNameViewData nextStation,  StationDisplayNameViewData nextNegativeStation,  String stationTrailText,  String stationCountText,  String durationText)  $default,) {final _that = this;
switch (_that) {
case _RouteLegItemViewData():
return $default(_that.lineName,_that.lineColorHex,_that.stationCount,_that.durationSeconds,_that.directionLabel,_that.directionPositiveExamplesText,_that.directionNegativeExamplesText,_that.fromStation,_that.toStation,_that.stations,_that.nextStation,_that.nextNegativeStation,_that.stationTrailText,_that.stationCountText,_that.durationText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lineName,  String lineColorHex,  int stationCount,  int durationSeconds,  String directionLabel,  String directionPositiveExamplesText,  String directionNegativeExamplesText,  StationDisplayNameViewData fromStation,  StationDisplayNameViewData toStation,  List<StationDisplayNameViewData> stations,  StationDisplayNameViewData nextStation,  StationDisplayNameViewData nextNegativeStation,  String stationTrailText,  String stationCountText,  String durationText)?  $default,) {final _that = this;
switch (_that) {
case _RouteLegItemViewData() when $default != null:
return $default(_that.lineName,_that.lineColorHex,_that.stationCount,_that.durationSeconds,_that.directionLabel,_that.directionPositiveExamplesText,_that.directionNegativeExamplesText,_that.fromStation,_that.toStation,_that.stations,_that.nextStation,_that.nextNegativeStation,_that.stationTrailText,_that.stationCountText,_that.durationText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteLegItemViewData implements RouteLegItemViewData {
  const _RouteLegItemViewData({required this.lineName, required this.lineColorHex, required this.stationCount, required this.durationSeconds, required this.directionLabel, required this.directionPositiveExamplesText, required this.directionNegativeExamplesText, required this.fromStation, required this.toStation, required final  List<StationDisplayNameViewData> stations, required this.nextStation, required this.nextNegativeStation, required this.stationTrailText, required this.stationCountText, required this.durationText}): _stations = stations;
  factory _RouteLegItemViewData.fromJson(Map<String, dynamic> json) => _$RouteLegItemViewDataFromJson(json);

@override final  String lineName;
@override final  String lineColorHex;
@override final  int stationCount;
@override final  int durationSeconds;
@override final  String directionLabel;
@override final  String directionPositiveExamplesText;
@override final  String directionNegativeExamplesText;
@override final  StationDisplayNameViewData fromStation;
@override final  StationDisplayNameViewData toStation;
 final  List<StationDisplayNameViewData> _stations;
@override List<StationDisplayNameViewData> get stations {
  if (_stations is EqualUnmodifiableListView) return _stations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stations);
}

@override final  StationDisplayNameViewData nextStation;
@override final  StationDisplayNameViewData nextNegativeStation;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteLegItemViewData&&(identical(other.lineName, lineName) || other.lineName == lineName)&&(identical(other.lineColorHex, lineColorHex) || other.lineColorHex == lineColorHex)&&(identical(other.stationCount, stationCount) || other.stationCount == stationCount)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.directionLabel, directionLabel) || other.directionLabel == directionLabel)&&(identical(other.directionPositiveExamplesText, directionPositiveExamplesText) || other.directionPositiveExamplesText == directionPositiveExamplesText)&&(identical(other.directionNegativeExamplesText, directionNegativeExamplesText) || other.directionNegativeExamplesText == directionNegativeExamplesText)&&(identical(other.fromStation, fromStation) || other.fromStation == fromStation)&&(identical(other.toStation, toStation) || other.toStation == toStation)&&const DeepCollectionEquality().equals(other._stations, _stations)&&(identical(other.nextStation, nextStation) || other.nextStation == nextStation)&&(identical(other.nextNegativeStation, nextNegativeStation) || other.nextNegativeStation == nextNegativeStation)&&(identical(other.stationTrailText, stationTrailText) || other.stationTrailText == stationTrailText)&&(identical(other.stationCountText, stationCountText) || other.stationCountText == stationCountText)&&(identical(other.durationText, durationText) || other.durationText == durationText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineName,lineColorHex,stationCount,durationSeconds,directionLabel,directionPositiveExamplesText,directionNegativeExamplesText,fromStation,toStation,const DeepCollectionEquality().hash(_stations),nextStation,nextNegativeStation,stationTrailText,stationCountText,durationText);

@override
String toString() {
  return 'RouteLegItemViewData(lineName: $lineName, lineColorHex: $lineColorHex, stationCount: $stationCount, durationSeconds: $durationSeconds, directionLabel: $directionLabel, directionPositiveExamplesText: $directionPositiveExamplesText, directionNegativeExamplesText: $directionNegativeExamplesText, fromStation: $fromStation, toStation: $toStation, stations: $stations, nextStation: $nextStation, nextNegativeStation: $nextNegativeStation, stationTrailText: $stationTrailText, stationCountText: $stationCountText, durationText: $durationText)';
}


}

/// @nodoc
abstract mixin class _$RouteLegItemViewDataCopyWith<$Res> implements $RouteLegItemViewDataCopyWith<$Res> {
  factory _$RouteLegItemViewDataCopyWith(_RouteLegItemViewData value, $Res Function(_RouteLegItemViewData) _then) = __$RouteLegItemViewDataCopyWithImpl;
@override @useResult
$Res call({
 String lineName, String lineColorHex, int stationCount, int durationSeconds, String directionLabel, String directionPositiveExamplesText, String directionNegativeExamplesText, StationDisplayNameViewData fromStation, StationDisplayNameViewData toStation, List<StationDisplayNameViewData> stations, StationDisplayNameViewData nextStation, StationDisplayNameViewData nextNegativeStation, String stationTrailText, String stationCountText, String durationText
});


@override $StationDisplayNameViewDataCopyWith<$Res> get fromStation;@override $StationDisplayNameViewDataCopyWith<$Res> get toStation;@override $StationDisplayNameViewDataCopyWith<$Res> get nextStation;@override $StationDisplayNameViewDataCopyWith<$Res> get nextNegativeStation;

}
/// @nodoc
class __$RouteLegItemViewDataCopyWithImpl<$Res>
    implements _$RouteLegItemViewDataCopyWith<$Res> {
  __$RouteLegItemViewDataCopyWithImpl(this._self, this._then);

  final _RouteLegItemViewData _self;
  final $Res Function(_RouteLegItemViewData) _then;

/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineName = null,Object? lineColorHex = null,Object? stationCount = null,Object? durationSeconds = null,Object? directionLabel = null,Object? directionPositiveExamplesText = null,Object? directionNegativeExamplesText = null,Object? fromStation = null,Object? toStation = null,Object? stations = null,Object? nextStation = null,Object? nextNegativeStation = null,Object? stationTrailText = null,Object? stationCountText = null,Object? durationText = null,}) {
  return _then(_RouteLegItemViewData(
lineName: null == lineName ? _self.lineName : lineName // ignore: cast_nullable_to_non_nullable
as String,lineColorHex: null == lineColorHex ? _self.lineColorHex : lineColorHex // ignore: cast_nullable_to_non_nullable
as String,stationCount: null == stationCount ? _self.stationCount : stationCount // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,directionLabel: null == directionLabel ? _self.directionLabel : directionLabel // ignore: cast_nullable_to_non_nullable
as String,directionPositiveExamplesText: null == directionPositiveExamplesText ? _self.directionPositiveExamplesText : directionPositiveExamplesText // ignore: cast_nullable_to_non_nullable
as String,directionNegativeExamplesText: null == directionNegativeExamplesText ? _self.directionNegativeExamplesText : directionNegativeExamplesText // ignore: cast_nullable_to_non_nullable
as String,fromStation: null == fromStation ? _self.fromStation : fromStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,toStation: null == toStation ? _self.toStation : toStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,stations: null == stations ? _self._stations : stations // ignore: cast_nullable_to_non_nullable
as List<StationDisplayNameViewData>,nextStation: null == nextStation ? _self.nextStation : nextStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,nextNegativeStation: null == nextNegativeStation ? _self.nextNegativeStation : nextNegativeStation // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,stationTrailText: null == stationTrailText ? _self.stationTrailText : stationTrailText // ignore: cast_nullable_to_non_nullable
as String,stationCountText: null == stationCountText ? _self.stationCountText : stationCountText // ignore: cast_nullable_to_non_nullable
as String,durationText: null == durationText ? _self.durationText : durationText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get fromStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.fromStation, (value) {
    return _then(_self.copyWith(fromStation: value));
  });
}/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get toStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.toStation, (value) {
    return _then(_self.copyWith(toStation: value));
  });
}/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get nextStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.nextStation, (value) {
    return _then(_self.copyWith(nextStation: value));
  });
}/// Create a copy of RouteLegItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get nextNegativeStation {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.nextNegativeStation, (value) {
    return _then(_self.copyWith(nextNegativeStation: value));
  });
}
}


/// @nodoc
mixin _$RouteTransferItemViewData {

 StationDisplayNameViewData get station; String get fromLineName; String get toLineName; String get toLineColorHex; int get walkingTimeSeconds; String get walkingTimeText;
/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteTransferItemViewDataCopyWith<RouteTransferItemViewData> get copyWith => _$RouteTransferItemViewDataCopyWithImpl<RouteTransferItemViewData>(this as RouteTransferItemViewData, _$identity);

  /// Serializes this RouteTransferItemViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteTransferItemViewData&&(identical(other.station, station) || other.station == station)&&(identical(other.fromLineName, fromLineName) || other.fromLineName == fromLineName)&&(identical(other.toLineName, toLineName) || other.toLineName == toLineName)&&(identical(other.toLineColorHex, toLineColorHex) || other.toLineColorHex == toLineColorHex)&&(identical(other.walkingTimeSeconds, walkingTimeSeconds) || other.walkingTimeSeconds == walkingTimeSeconds)&&(identical(other.walkingTimeText, walkingTimeText) || other.walkingTimeText == walkingTimeText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,station,fromLineName,toLineName,toLineColorHex,walkingTimeSeconds,walkingTimeText);

@override
String toString() {
  return 'RouteTransferItemViewData(station: $station, fromLineName: $fromLineName, toLineName: $toLineName, toLineColorHex: $toLineColorHex, walkingTimeSeconds: $walkingTimeSeconds, walkingTimeText: $walkingTimeText)';
}


}

/// @nodoc
abstract mixin class $RouteTransferItemViewDataCopyWith<$Res>  {
  factory $RouteTransferItemViewDataCopyWith(RouteTransferItemViewData value, $Res Function(RouteTransferItemViewData) _then) = _$RouteTransferItemViewDataCopyWithImpl;
@useResult
$Res call({
 StationDisplayNameViewData station, String fromLineName, String toLineName, String toLineColorHex, int walkingTimeSeconds, String walkingTimeText
});


$StationDisplayNameViewDataCopyWith<$Res> get station;

}
/// @nodoc
class _$RouteTransferItemViewDataCopyWithImpl<$Res>
    implements $RouteTransferItemViewDataCopyWith<$Res> {
  _$RouteTransferItemViewDataCopyWithImpl(this._self, this._then);

  final RouteTransferItemViewData _self;
  final $Res Function(RouteTransferItemViewData) _then;

/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? station = null,Object? fromLineName = null,Object? toLineName = null,Object? toLineColorHex = null,Object? walkingTimeSeconds = null,Object? walkingTimeText = null,}) {
  return _then(_self.copyWith(
station: null == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,fromLineName: null == fromLineName ? _self.fromLineName : fromLineName // ignore: cast_nullable_to_non_nullable
as String,toLineName: null == toLineName ? _self.toLineName : toLineName // ignore: cast_nullable_to_non_nullable
as String,toLineColorHex: null == toLineColorHex ? _self.toLineColorHex : toLineColorHex // ignore: cast_nullable_to_non_nullable
as String,walkingTimeSeconds: null == walkingTimeSeconds ? _self.walkingTimeSeconds : walkingTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,walkingTimeText: null == walkingTimeText ? _self.walkingTimeText : walkingTimeText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get station {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.station, (value) {
    return _then(_self.copyWith(station: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StationDisplayNameViewData station,  String fromLineName,  String toLineName,  String toLineColorHex,  int walkingTimeSeconds,  String walkingTimeText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteTransferItemViewData() when $default != null:
return $default(_that.station,_that.fromLineName,_that.toLineName,_that.toLineColorHex,_that.walkingTimeSeconds,_that.walkingTimeText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StationDisplayNameViewData station,  String fromLineName,  String toLineName,  String toLineColorHex,  int walkingTimeSeconds,  String walkingTimeText)  $default,) {final _that = this;
switch (_that) {
case _RouteTransferItemViewData():
return $default(_that.station,_that.fromLineName,_that.toLineName,_that.toLineColorHex,_that.walkingTimeSeconds,_that.walkingTimeText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StationDisplayNameViewData station,  String fromLineName,  String toLineName,  String toLineColorHex,  int walkingTimeSeconds,  String walkingTimeText)?  $default,) {final _that = this;
switch (_that) {
case _RouteTransferItemViewData() when $default != null:
return $default(_that.station,_that.fromLineName,_that.toLineName,_that.toLineColorHex,_that.walkingTimeSeconds,_that.walkingTimeText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteTransferItemViewData implements RouteTransferItemViewData {
  const _RouteTransferItemViewData({required this.station, required this.fromLineName, required this.toLineName, required this.toLineColorHex, required this.walkingTimeSeconds, required this.walkingTimeText});
  factory _RouteTransferItemViewData.fromJson(Map<String, dynamic> json) => _$RouteTransferItemViewDataFromJson(json);

@override final  StationDisplayNameViewData station;
@override final  String fromLineName;
@override final  String toLineName;
@override final  String toLineColorHex;
@override final  int walkingTimeSeconds;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteTransferItemViewData&&(identical(other.station, station) || other.station == station)&&(identical(other.fromLineName, fromLineName) || other.fromLineName == fromLineName)&&(identical(other.toLineName, toLineName) || other.toLineName == toLineName)&&(identical(other.toLineColorHex, toLineColorHex) || other.toLineColorHex == toLineColorHex)&&(identical(other.walkingTimeSeconds, walkingTimeSeconds) || other.walkingTimeSeconds == walkingTimeSeconds)&&(identical(other.walkingTimeText, walkingTimeText) || other.walkingTimeText == walkingTimeText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,station,fromLineName,toLineName,toLineColorHex,walkingTimeSeconds,walkingTimeText);

@override
String toString() {
  return 'RouteTransferItemViewData(station: $station, fromLineName: $fromLineName, toLineName: $toLineName, toLineColorHex: $toLineColorHex, walkingTimeSeconds: $walkingTimeSeconds, walkingTimeText: $walkingTimeText)';
}


}

/// @nodoc
abstract mixin class _$RouteTransferItemViewDataCopyWith<$Res> implements $RouteTransferItemViewDataCopyWith<$Res> {
  factory _$RouteTransferItemViewDataCopyWith(_RouteTransferItemViewData value, $Res Function(_RouteTransferItemViewData) _then) = __$RouteTransferItemViewDataCopyWithImpl;
@override @useResult
$Res call({
 StationDisplayNameViewData station, String fromLineName, String toLineName, String toLineColorHex, int walkingTimeSeconds, String walkingTimeText
});


@override $StationDisplayNameViewDataCopyWith<$Res> get station;

}
/// @nodoc
class __$RouteTransferItemViewDataCopyWithImpl<$Res>
    implements _$RouteTransferItemViewDataCopyWith<$Res> {
  __$RouteTransferItemViewDataCopyWithImpl(this._self, this._then);

  final _RouteTransferItemViewData _self;
  final $Res Function(_RouteTransferItemViewData) _then;

/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? station = null,Object? fromLineName = null,Object? toLineName = null,Object? toLineColorHex = null,Object? walkingTimeSeconds = null,Object? walkingTimeText = null,}) {
  return _then(_RouteTransferItemViewData(
station: null == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as StationDisplayNameViewData,fromLineName: null == fromLineName ? _self.fromLineName : fromLineName // ignore: cast_nullable_to_non_nullable
as String,toLineName: null == toLineName ? _self.toLineName : toLineName // ignore: cast_nullable_to_non_nullable
as String,toLineColorHex: null == toLineColorHex ? _self.toLineColorHex : toLineColorHex // ignore: cast_nullable_to_non_nullable
as String,walkingTimeSeconds: null == walkingTimeSeconds ? _self.walkingTimeSeconds : walkingTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,walkingTimeText: null == walkingTimeText ? _self.walkingTimeText : walkingTimeText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RouteTransferItemViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationDisplayNameViewDataCopyWith<$Res> get station {
  
  return $StationDisplayNameViewDataCopyWith<$Res>(_self.station, (value) {
    return _then(_self.copyWith(station: value));
  });
}
}

// dart format on
