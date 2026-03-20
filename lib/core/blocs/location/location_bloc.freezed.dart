// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkLocation,
    required TResult Function(LocationDetailsDM locationDM) setManualLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkLocation,
    TResult? Function(LocationDetailsDM locationDM)? setManualLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkLocation,
    TResult Function(LocationDetailsDM locationDM)? setManualLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckLocation value) checkLocation,
    required TResult Function(_SetManualLocation value) setManualLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckLocation value)? checkLocation,
    TResult? Function(_SetManualLocation value)? setManualLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckLocation value)? checkLocation,
    TResult Function(_SetManualLocation value)? setManualLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res, LocationEvent>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res, $Val extends LocationEvent>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckLocationImplCopyWith<$Res> {
  factory _$$CheckLocationImplCopyWith(
          _$CheckLocationImpl value, $Res Function(_$CheckLocationImpl) then) =
      __$$CheckLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckLocationImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$CheckLocationImpl>
    implements _$$CheckLocationImplCopyWith<$Res> {
  __$$CheckLocationImplCopyWithImpl(
      _$CheckLocationImpl _value, $Res Function(_$CheckLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckLocationImpl implements _CheckLocation {
  const _$CheckLocationImpl();

  @override
  String toString() {
    return 'LocationEvent.checkLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkLocation,
    required TResult Function(LocationDetailsDM locationDM) setManualLocation,
  }) {
    return checkLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkLocation,
    TResult? Function(LocationDetailsDM locationDM)? setManualLocation,
  }) {
    return checkLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkLocation,
    TResult Function(LocationDetailsDM locationDM)? setManualLocation,
    required TResult orElse(),
  }) {
    if (checkLocation != null) {
      return checkLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckLocation value) checkLocation,
    required TResult Function(_SetManualLocation value) setManualLocation,
  }) {
    return checkLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckLocation value)? checkLocation,
    TResult? Function(_SetManualLocation value)? setManualLocation,
  }) {
    return checkLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckLocation value)? checkLocation,
    TResult Function(_SetManualLocation value)? setManualLocation,
    required TResult orElse(),
  }) {
    if (checkLocation != null) {
      return checkLocation(this);
    }
    return orElse();
  }
}

abstract class _CheckLocation implements LocationEvent {
  const factory _CheckLocation() = _$CheckLocationImpl;
}

/// @nodoc
abstract class _$$SetManualLocationImplCopyWith<$Res> {
  factory _$$SetManualLocationImplCopyWith(_$SetManualLocationImpl value,
          $Res Function(_$SetManualLocationImpl) then) =
      __$$SetManualLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationDetailsDM locationDM});

  $LocationDetailsDMCopyWith<$Res> get locationDM;
}

/// @nodoc
class __$$SetManualLocationImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$SetManualLocationImpl>
    implements _$$SetManualLocationImplCopyWith<$Res> {
  __$$SetManualLocationImplCopyWithImpl(_$SetManualLocationImpl _value,
      $Res Function(_$SetManualLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationDM = null,
  }) {
    return _then(_$SetManualLocationImpl(
      null == locationDM
          ? _value.locationDM
          : locationDM // ignore: cast_nullable_to_non_nullable
              as LocationDetailsDM,
    ));
  }

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDetailsDMCopyWith<$Res> get locationDM {
    return $LocationDetailsDMCopyWith<$Res>(_value.locationDM, (value) {
      return _then(_value.copyWith(locationDM: value));
    });
  }
}

/// @nodoc

class _$SetManualLocationImpl implements _SetManualLocation {
  const _$SetManualLocationImpl(this.locationDM);

  @override
  final LocationDetailsDM locationDM;

  @override
  String toString() {
    return 'LocationEvent.setManualLocation(locationDM: $locationDM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetManualLocationImpl &&
            (identical(other.locationDM, locationDM) ||
                other.locationDM == locationDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationDM);

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetManualLocationImplCopyWith<_$SetManualLocationImpl> get copyWith =>
      __$$SetManualLocationImplCopyWithImpl<_$SetManualLocationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkLocation,
    required TResult Function(LocationDetailsDM locationDM) setManualLocation,
  }) {
    return setManualLocation(locationDM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkLocation,
    TResult? Function(LocationDetailsDM locationDM)? setManualLocation,
  }) {
    return setManualLocation?.call(locationDM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkLocation,
    TResult Function(LocationDetailsDM locationDM)? setManualLocation,
    required TResult orElse(),
  }) {
    if (setManualLocation != null) {
      return setManualLocation(locationDM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckLocation value) checkLocation,
    required TResult Function(_SetManualLocation value) setManualLocation,
  }) {
    return setManualLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckLocation value)? checkLocation,
    TResult? Function(_SetManualLocation value)? setManualLocation,
  }) {
    return setManualLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckLocation value)? checkLocation,
    TResult Function(_SetManualLocation value)? setManualLocation,
    required TResult orElse(),
  }) {
    if (setManualLocation != null) {
      return setManualLocation(this);
    }
    return orElse();
  }
}

abstract class _SetManualLocation implements LocationEvent {
  const factory _SetManualLocation(final LocationDetailsDM locationDM) =
      _$SetManualLocationImpl;

  LocationDetailsDM get locationDM;

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetManualLocationImplCopyWith<_$SetManualLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res, LocationState>;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LocationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckingLocationImplCopyWith<$Res> {
  factory _$$CheckingLocationImplCopyWith(_$CheckingLocationImpl value,
          $Res Function(_$CheckingLocationImpl) then) =
      __$$CheckingLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingLocationImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$CheckingLocationImpl>
    implements _$$CheckingLocationImplCopyWith<$Res> {
  __$$CheckingLocationImplCopyWithImpl(_$CheckingLocationImpl _value,
      $Res Function(_$CheckingLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckingLocationImpl implements _CheckingLocation {
  const _$CheckingLocationImpl();

  @override
  String toString() {
    return 'LocationState.checkingLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckingLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return checkingLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return checkingLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (checkingLocation != null) {
      return checkingLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return checkingLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return checkingLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (checkingLocation != null) {
      return checkingLocation(this);
    }
    return orElse();
  }
}

abstract class _CheckingLocation implements LocationState {
  const factory _CheckingLocation() = _$CheckingLocationImpl;
}

/// @nodoc
abstract class _$$LocationCheckedImplCopyWith<$Res> {
  factory _$$LocationCheckedImplCopyWith(_$LocationCheckedImpl value,
          $Res Function(_$LocationCheckedImpl) then) =
      __$$LocationCheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationDetailsDM locationDM});

  $LocationDetailsDMCopyWith<$Res> get locationDM;
}

/// @nodoc
class __$$LocationCheckedImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationCheckedImpl>
    implements _$$LocationCheckedImplCopyWith<$Res> {
  __$$LocationCheckedImplCopyWithImpl(
      _$LocationCheckedImpl _value, $Res Function(_$LocationCheckedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationDM = null,
  }) {
    return _then(_$LocationCheckedImpl(
      null == locationDM
          ? _value.locationDM
          : locationDM // ignore: cast_nullable_to_non_nullable
              as LocationDetailsDM,
    ));
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDetailsDMCopyWith<$Res> get locationDM {
    return $LocationDetailsDMCopyWith<$Res>(_value.locationDM, (value) {
      return _then(_value.copyWith(locationDM: value));
    });
  }
}

/// @nodoc

class _$LocationCheckedImpl implements _LocationChecked {
  const _$LocationCheckedImpl(this.locationDM);

  @override
  final LocationDetailsDM locationDM;

  @override
  String toString() {
    return 'LocationState.locationChecked(locationDM: $locationDM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationCheckedImpl &&
            (identical(other.locationDM, locationDM) ||
                other.locationDM == locationDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationDM);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationCheckedImplCopyWith<_$LocationCheckedImpl> get copyWith =>
      __$$LocationCheckedImplCopyWithImpl<_$LocationCheckedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return locationChecked(locationDM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return locationChecked?.call(locationDM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (locationChecked != null) {
      return locationChecked(locationDM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return locationChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return locationChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (locationChecked != null) {
      return locationChecked(this);
    }
    return orElse();
  }
}

abstract class _LocationChecked implements LocationState {
  const factory _LocationChecked(final LocationDetailsDM locationDM) =
      _$LocationCheckedImpl;

  LocationDetailsDM get locationDM;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationCheckedImplCopyWith<_$LocationCheckedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationErrorImplCopyWith<$Res> {
  factory _$$LocationErrorImplCopyWith(
          _$LocationErrorImpl value, $Res Function(_$LocationErrorImpl) then) =
      __$$LocationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LocationErrorImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationErrorImpl>
    implements _$$LocationErrorImplCopyWith<$Res> {
  __$$LocationErrorImplCopyWithImpl(
      _$LocationErrorImpl _value, $Res Function(_$LocationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LocationErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationErrorImpl implements _LocationError {
  const _$LocationErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationState.locationError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationErrorImplCopyWith<_$LocationErrorImpl> get copyWith =>
      __$$LocationErrorImplCopyWithImpl<_$LocationErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return locationError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return locationError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (locationError != null) {
      return locationError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return locationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return locationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (locationError != null) {
      return locationError(this);
    }
    return orElse();
  }
}

abstract class _LocationError implements LocationState {
  const factory _LocationError(final String message) = _$LocationErrorImpl;

  String get message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationErrorImplCopyWith<_$LocationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceDisabledImplCopyWith<$Res> {
  factory _$$ServiceDisabledImplCopyWith(_$ServiceDisabledImpl value,
          $Res Function(_$ServiceDisabledImpl) then) =
      __$$ServiceDisabledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServiceDisabledImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$ServiceDisabledImpl>
    implements _$$ServiceDisabledImplCopyWith<$Res> {
  __$$ServiceDisabledImplCopyWithImpl(
      _$ServiceDisabledImpl _value, $Res Function(_$ServiceDisabledImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServiceDisabledImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServiceDisabledImpl implements _ServiceDisabled {
  const _$ServiceDisabledImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationState.serviceDisabled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDisabledImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDisabledImplCopyWith<_$ServiceDisabledImpl> get copyWith =>
      __$$ServiceDisabledImplCopyWithImpl<_$ServiceDisabledImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return serviceDisabled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return serviceDisabled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (serviceDisabled != null) {
      return serviceDisabled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return serviceDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return serviceDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (serviceDisabled != null) {
      return serviceDisabled(this);
    }
    return orElse();
  }
}

abstract class _ServiceDisabled implements LocationState {
  const factory _ServiceDisabled(final String message) = _$ServiceDisabledImpl;

  String get message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceDisabledImplCopyWith<_$ServiceDisabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionDeniedImplCopyWith<$Res> {
  factory _$$PermissionDeniedImplCopyWith(_$PermissionDeniedImpl value,
          $Res Function(_$PermissionDeniedImpl) then) =
      __$$PermissionDeniedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionDeniedImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$PermissionDeniedImpl>
    implements _$$PermissionDeniedImplCopyWith<$Res> {
  __$$PermissionDeniedImplCopyWithImpl(_$PermissionDeniedImpl _value,
      $Res Function(_$PermissionDeniedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PermissionDeniedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionDeniedImpl implements _PermissionDenied {
  const _$PermissionDeniedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationState.permissionDenied(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionDeniedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionDeniedImplCopyWith<_$PermissionDeniedImpl> get copyWith =>
      __$$PermissionDeniedImplCopyWithImpl<_$PermissionDeniedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return permissionDenied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return permissionDenied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class _PermissionDenied implements LocationState {
  const factory _PermissionDenied(final String message) =
      _$PermissionDeniedImpl;

  String get message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionDeniedImplCopyWith<_$PermissionDeniedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionPermanentlyDeniedImplCopyWith<$Res> {
  factory _$$PermissionPermanentlyDeniedImplCopyWith(
          _$PermissionPermanentlyDeniedImpl value,
          $Res Function(_$PermissionPermanentlyDeniedImpl) then) =
      __$$PermissionPermanentlyDeniedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionPermanentlyDeniedImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$PermissionPermanentlyDeniedImpl>
    implements _$$PermissionPermanentlyDeniedImplCopyWith<$Res> {
  __$$PermissionPermanentlyDeniedImplCopyWithImpl(
      _$PermissionPermanentlyDeniedImpl _value,
      $Res Function(_$PermissionPermanentlyDeniedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PermissionPermanentlyDeniedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionPermanentlyDeniedImpl
    implements _PermissionPermanentlyDenied {
  const _$PermissionPermanentlyDeniedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationState.permissionPermanentlyDenied(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionPermanentlyDeniedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionPermanentlyDeniedImplCopyWith<_$PermissionPermanentlyDeniedImpl>
      get copyWith => __$$PermissionPermanentlyDeniedImplCopyWithImpl<
          _$PermissionPermanentlyDeniedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingLocation,
    required TResult Function(LocationDetailsDM locationDM) locationChecked,
    required TResult Function(String message) locationError,
    required TResult Function(String message) serviceDisabled,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionPermanentlyDenied,
  }) {
    return permissionPermanentlyDenied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingLocation,
    TResult? Function(LocationDetailsDM locationDM)? locationChecked,
    TResult? Function(String message)? locationError,
    TResult? Function(String message)? serviceDisabled,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionPermanentlyDenied,
  }) {
    return permissionPermanentlyDenied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingLocation,
    TResult Function(LocationDetailsDM locationDM)? locationChecked,
    TResult Function(String message)? locationError,
    TResult Function(String message)? serviceDisabled,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (permissionPermanentlyDenied != null) {
      return permissionPermanentlyDenied(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingLocation value) checkingLocation,
    required TResult Function(_LocationChecked value) locationChecked,
    required TResult Function(_LocationError value) locationError,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_PermissionPermanentlyDenied value)
        permissionPermanentlyDenied,
  }) {
    return permissionPermanentlyDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingLocation value)? checkingLocation,
    TResult? Function(_LocationChecked value)? locationChecked,
    TResult? Function(_LocationError value)? locationError,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
  }) {
    return permissionPermanentlyDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingLocation value)? checkingLocation,
    TResult Function(_LocationChecked value)? locationChecked,
    TResult Function(_LocationError value)? locationError,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_PermissionPermanentlyDenied value)?
        permissionPermanentlyDenied,
    required TResult orElse(),
  }) {
    if (permissionPermanentlyDenied != null) {
      return permissionPermanentlyDenied(this);
    }
    return orElse();
  }
}

abstract class _PermissionPermanentlyDenied implements LocationState {
  const factory _PermissionPermanentlyDenied(final String message) =
      _$PermissionPermanentlyDeniedImpl;

  String get message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionPermanentlyDeniedImplCopyWith<_$PermissionPermanentlyDeniedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
