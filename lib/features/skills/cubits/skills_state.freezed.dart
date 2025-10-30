// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SkillsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SkillsState()';
}


}

/// @nodoc
class $SkillsStateCopyWith<$Res>  {
$SkillsStateCopyWith(SkillsState _, $Res Function(SkillsState) __);
}


/// Adds pattern-matching-related methods to [SkillsState].
extension SkillsStatePatterns on SkillsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SkillsLoading value)?  skillsLoading,TResult Function( _SkillsLoaded value)?  skillsLoaded,TResult Function( _SkillsError value)?  skillsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SkillsLoading() when skillsLoading != null:
return skillsLoading(_that);case _SkillsLoaded() when skillsLoaded != null:
return skillsLoaded(_that);case _SkillsError() when skillsError != null:
return skillsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SkillsLoading value)  skillsLoading,required TResult Function( _SkillsLoaded value)  skillsLoaded,required TResult Function( _SkillsError value)  skillsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SkillsLoading():
return skillsLoading(_that);case _SkillsLoaded():
return skillsLoaded(_that);case _SkillsError():
return skillsError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SkillsLoading value)?  skillsLoading,TResult? Function( _SkillsLoaded value)?  skillsLoaded,TResult? Function( _SkillsError value)?  skillsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SkillsLoading() when skillsLoading != null:
return skillsLoading(_that);case _SkillsLoaded() when skillsLoaded != null:
return skillsLoaded(_that);case _SkillsError() when skillsError != null:
return skillsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  skillsLoading,TResult Function( List<SkillModel> list)?  skillsLoaded,TResult Function( String error)?  skillsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SkillsLoading() when skillsLoading != null:
return skillsLoading();case _SkillsLoaded() when skillsLoaded != null:
return skillsLoaded(_that.list);case _SkillsError() when skillsError != null:
return skillsError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  skillsLoading,required TResult Function( List<SkillModel> list)  skillsLoaded,required TResult Function( String error)  skillsError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _SkillsLoading():
return skillsLoading();case _SkillsLoaded():
return skillsLoaded(_that.list);case _SkillsError():
return skillsError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  skillsLoading,TResult? Function( List<SkillModel> list)?  skillsLoaded,TResult? Function( String error)?  skillsError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SkillsLoading() when skillsLoading != null:
return skillsLoading();case _SkillsLoaded() when skillsLoaded != null:
return skillsLoaded(_that.list);case _SkillsError() when skillsError != null:
return skillsError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SkillsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SkillsState.initial()';
}


}




/// @nodoc


class _SkillsLoading implements SkillsState {
  const _SkillsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkillsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SkillsState.skillsLoading()';
}


}




/// @nodoc


class _SkillsLoaded implements SkillsState {
  const _SkillsLoaded(final  List<SkillModel> list): _list = list;
  

 final  List<SkillModel> _list;
 List<SkillModel> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkillsLoadedCopyWith<_SkillsLoaded> get copyWith => __$SkillsLoadedCopyWithImpl<_SkillsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkillsLoaded&&const DeepCollectionEquality().equals(other._list, _list));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'SkillsState.skillsLoaded(list: $list)';
}


}

/// @nodoc
abstract mixin class _$SkillsLoadedCopyWith<$Res> implements $SkillsStateCopyWith<$Res> {
  factory _$SkillsLoadedCopyWith(_SkillsLoaded value, $Res Function(_SkillsLoaded) _then) = __$SkillsLoadedCopyWithImpl;
@useResult
$Res call({
 List<SkillModel> list
});




}
/// @nodoc
class __$SkillsLoadedCopyWithImpl<$Res>
    implements _$SkillsLoadedCopyWith<$Res> {
  __$SkillsLoadedCopyWithImpl(this._self, this._then);

  final _SkillsLoaded _self;
  final $Res Function(_SkillsLoaded) _then;

/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_SkillsLoaded(
null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<SkillModel>,
  ));
}


}

/// @nodoc


class _SkillsError implements SkillsState {
  const _SkillsError(this.error);
  

 final  String error;

/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkillsErrorCopyWith<_SkillsError> get copyWith => __$SkillsErrorCopyWithImpl<_SkillsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkillsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SkillsState.skillsError(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SkillsErrorCopyWith<$Res> implements $SkillsStateCopyWith<$Res> {
  factory _$SkillsErrorCopyWith(_SkillsError value, $Res Function(_SkillsError) _then) = __$SkillsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$SkillsErrorCopyWithImpl<$Res>
    implements _$SkillsErrorCopyWith<$Res> {
  __$SkillsErrorCopyWithImpl(this._self, this._then);

  final _SkillsError _self;
  final $Res Function(_SkillsError) _then;

/// Create a copy of SkillsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SkillsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
