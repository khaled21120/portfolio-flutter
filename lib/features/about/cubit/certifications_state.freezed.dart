// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CertificationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificationsState()';
}


}

/// @nodoc
class $CertificationsStateCopyWith<$Res>  {
$CertificationsStateCopyWith(CertificationsState _, $Res Function(CertificationsState) __);
}


/// Adds pattern-matching-related methods to [CertificationsState].
extension CertificationsStatePatterns on CertificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _CertificationsLoading value)?  certificationsLoading,TResult Function( _CertificationsLoaded value)?  certificationsLoaded,TResult Function( _CertificationsError value)?  certificationsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _CertificationsLoading() when certificationsLoading != null:
return certificationsLoading(_that);case _CertificationsLoaded() when certificationsLoaded != null:
return certificationsLoaded(_that);case _CertificationsError() when certificationsError != null:
return certificationsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _CertificationsLoading value)  certificationsLoading,required TResult Function( _CertificationsLoaded value)  certificationsLoaded,required TResult Function( _CertificationsError value)  certificationsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _CertificationsLoading():
return certificationsLoading(_that);case _CertificationsLoaded():
return certificationsLoaded(_that);case _CertificationsError():
return certificationsError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _CertificationsLoading value)?  certificationsLoading,TResult? Function( _CertificationsLoaded value)?  certificationsLoaded,TResult? Function( _CertificationsError value)?  certificationsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _CertificationsLoading() when certificationsLoading != null:
return certificationsLoading(_that);case _CertificationsLoaded() when certificationsLoaded != null:
return certificationsLoaded(_that);case _CertificationsError() when certificationsError != null:
return certificationsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  certificationsLoading,TResult Function( List<CertificationModel> list)?  certificationsLoaded,TResult Function( String error)?  certificationsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _CertificationsLoading() when certificationsLoading != null:
return certificationsLoading();case _CertificationsLoaded() when certificationsLoaded != null:
return certificationsLoaded(_that.list);case _CertificationsError() when certificationsError != null:
return certificationsError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  certificationsLoading,required TResult Function( List<CertificationModel> list)  certificationsLoaded,required TResult Function( String error)  certificationsError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _CertificationsLoading():
return certificationsLoading();case _CertificationsLoaded():
return certificationsLoaded(_that.list);case _CertificationsError():
return certificationsError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  certificationsLoading,TResult? Function( List<CertificationModel> list)?  certificationsLoaded,TResult? Function( String error)?  certificationsError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _CertificationsLoading() when certificationsLoading != null:
return certificationsLoading();case _CertificationsLoaded() when certificationsLoaded != null:
return certificationsLoaded(_that.list);case _CertificationsError() when certificationsError != null:
return certificationsError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CertificationsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificationsState.initial()';
}


}




/// @nodoc


class _CertificationsLoading implements CertificationsState {
  const _CertificationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CertificationsState.certificationsLoading()';
}


}




/// @nodoc


class _CertificationsLoaded implements CertificationsState {
  const _CertificationsLoaded(final  List<CertificationModel> list): _list = list;
  

 final  List<CertificationModel> _list;
 List<CertificationModel> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of CertificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificationsLoadedCopyWith<_CertificationsLoaded> get copyWith => __$CertificationsLoadedCopyWithImpl<_CertificationsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificationsLoaded&&const DeepCollectionEquality().equals(other._list, _list));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'CertificationsState.certificationsLoaded(list: $list)';
}


}

/// @nodoc
abstract mixin class _$CertificationsLoadedCopyWith<$Res> implements $CertificationsStateCopyWith<$Res> {
  factory _$CertificationsLoadedCopyWith(_CertificationsLoaded value, $Res Function(_CertificationsLoaded) _then) = __$CertificationsLoadedCopyWithImpl;
@useResult
$Res call({
 List<CertificationModel> list
});




}
/// @nodoc
class __$CertificationsLoadedCopyWithImpl<$Res>
    implements _$CertificationsLoadedCopyWith<$Res> {
  __$CertificationsLoadedCopyWithImpl(this._self, this._then);

  final _CertificationsLoaded _self;
  final $Res Function(_CertificationsLoaded) _then;

/// Create a copy of CertificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_CertificationsLoaded(
null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<CertificationModel>,
  ));
}


}

/// @nodoc


class _CertificationsError implements CertificationsState {
  const _CertificationsError(this.error);
  

 final  String error;

/// Create a copy of CertificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificationsErrorCopyWith<_CertificationsError> get copyWith => __$CertificationsErrorCopyWithImpl<_CertificationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificationsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CertificationsState.certificationsError(error: $error)';
}


}

/// @nodoc
abstract mixin class _$CertificationsErrorCopyWith<$Res> implements $CertificationsStateCopyWith<$Res> {
  factory _$CertificationsErrorCopyWith(_CertificationsError value, $Res Function(_CertificationsError) _then) = __$CertificationsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$CertificationsErrorCopyWithImpl<$Res>
    implements _$CertificationsErrorCopyWith<$Res> {
  __$CertificationsErrorCopyWithImpl(this._self, this._then);

  final _CertificationsError _self;
  final $Res Function(_CertificationsError) _then;

/// Create a copy of CertificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_CertificationsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
