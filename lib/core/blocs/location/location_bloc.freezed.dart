// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationEvent()';
  }
}

/// @nodoc
class $LocationEventCopyWith<$Res> {
  $LocationEventCopyWith(LocationEvent _, $Res Function(LocationEvent) __);
}

/// Adds pattern-matching-related methods to [LocationEvent].
extension LocationEventPatterns on LocationEvent {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckLocation value)? checkLocation,
    TResult Function(_SetManualLocation value)? setManualLocation,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckLocation() when checkLocation != null:
        return checkLocation(_that);
      case _SetManualLocation() when setManualLocation != null:
        return setManualLocation(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckLocation value) checkLocation,
    required TResult Function(_SetManualLocation value) setManualLocation,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckLocation():
        return checkLocation(_that);
      case _SetManualLocation():
        return setManualLocation(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckLocation value)? checkLocation,
    TResult? Function(_SetManualLocation value)? setManualLocation,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckLocation() when checkLocation != null:
        return checkLocation(_that);
      case _SetManualLocation() when setManualLocation != null:
        return setManualLocation(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkLocation,
    TResult Function(LocationDetailsDM locationDM)? setManualLocation,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckLocation() when checkLocation != null:
        return checkLocation();
      case _SetManualLocation() when setManualLocation != null:
        return setManualLocation(_that.locationDM);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkLocation,
    required TResult Function(LocationDetailsDM locationDM) setManualLocation,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckLocation():
        return checkLocation();
      case _SetManualLocation():
        return setManualLocation(_that.locationDM);
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkLocation,
    TResult? Function(LocationDetailsDM locationDM)? setManualLocation,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckLocation() when checkLocation != null:
        return checkLocation();
      case _SetManualLocation() when setManualLocation != null:
        return setManualLocation(_that.locationDM);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckLocation implements LocationEvent {
  const _CheckLocation();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationEvent.checkLocation()';
  }
}

/// @nodoc

class _SetManualLocation implements LocationEvent {
  const _SetManualLocation(this.locationDM);

  final LocationDetailsDM locationDM;

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetManualLocationCopyWith<_SetManualLocation> get copyWith =>
      __$SetManualLocationCopyWithImpl<_SetManualLocation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetManualLocation &&
            (identical(other.locationDM, locationDM) ||
                other.locationDM == locationDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationDM);

  @override
  String toString() {
    return 'LocationEvent.setManualLocation(locationDM: $locationDM)';
  }
}

/// @nodoc
abstract mixin class _$SetManualLocationCopyWith<$Res>
    implements $LocationEventCopyWith<$Res> {
  factory _$SetManualLocationCopyWith(
          _SetManualLocation value, $Res Function(_SetManualLocation) _then) =
      __$SetManualLocationCopyWithImpl;
  @useResult
  $Res call({LocationDetailsDM locationDM});

  $LocationDetailsDMCopyWith<$Res> get locationDM;
}

/// @nodoc
class __$SetManualLocationCopyWithImpl<$Res>
    implements _$SetManualLocationCopyWith<$Res> {
  __$SetManualLocationCopyWithImpl(this._self, this._then);

  final _SetManualLocation _self;
  final $Res Function(_SetManualLocation) _then;

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locationDM = null,
  }) {
    return _then(_SetManualLocation(
      null == locationDM
          ? _self.locationDM
          : locationDM // ignore: cast_nullable_to_non_nullable
              as LocationDetailsDM,
    ));
  }

  /// Create a copy of LocationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDetailsDMCopyWith<$Res> get locationDM {
    return $LocationDetailsDMCopyWith<$Res>(_self.locationDM, (value) {
      return _then(_self.copyWith(locationDM: value));
    });
  }
}

/// @nodoc
mixin _$LocationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState()';
  }
}

/// @nodoc
class $LocationStateCopyWith<$Res> {
  $LocationStateCopyWith(LocationState _, $Res Function(LocationState) __);
}

/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _CheckingLocation() when checkingLocation != null:
        return checkingLocation(_that);
      case _LocationChecked() when locationChecked != null:
        return locationChecked(_that);
      case _LocationError() when locationError != null:
        return locationError(_that);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that);
      case _PermissionDenied() when permissionDenied != null:
        return permissionDenied(_that);
      case _PermissionPermanentlyDenied()
          when permissionPermanentlyDenied != null:
        return permissionPermanentlyDenied(_that);
      case _:
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
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _CheckingLocation():
        return checkingLocation(_that);
      case _LocationChecked():
        return locationChecked(_that);
      case _LocationError():
        return locationError(_that);
      case _ServiceDisabled():
        return serviceDisabled(_that);
      case _PermissionDenied():
        return permissionDenied(_that);
      case _PermissionPermanentlyDenied():
        return permissionPermanentlyDenied(_that);
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
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _CheckingLocation() when checkingLocation != null:
        return checkingLocation(_that);
      case _LocationChecked() when locationChecked != null:
        return locationChecked(_that);
      case _LocationError() when locationError != null:
        return locationError(_that);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that);
      case _PermissionDenied() when permissionDenied != null:
        return permissionDenied(_that);
      case _PermissionPermanentlyDenied()
          when permissionPermanentlyDenied != null:
        return permissionPermanentlyDenied(_that);
      case _:
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
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _CheckingLocation() when checkingLocation != null:
        return checkingLocation();
      case _LocationChecked() when locationChecked != null:
        return locationChecked(_that.locationDM);
      case _LocationError() when locationError != null:
        return locationError(_that.message);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that.message);
      case _PermissionDenied() when permissionDenied != null:
        return permissionDenied(_that.message);
      case _PermissionPermanentlyDenied()
          when permissionPermanentlyDenied != null:
        return permissionPermanentlyDenied(_that.message);
      case _:
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
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _CheckingLocation():
        return checkingLocation();
      case _LocationChecked():
        return locationChecked(_that.locationDM);
      case _LocationError():
        return locationError(_that.message);
      case _ServiceDisabled():
        return serviceDisabled(_that.message);
      case _PermissionDenied():
        return permissionDenied(_that.message);
      case _PermissionPermanentlyDenied():
        return permissionPermanentlyDenied(_that.message);
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
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _CheckingLocation() when checkingLocation != null:
        return checkingLocation();
      case _LocationChecked() when locationChecked != null:
        return locationChecked(_that.locationDM);
      case _LocationError() when locationError != null:
        return locationError(_that.message);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that.message);
      case _PermissionDenied() when permissionDenied != null:
        return permissionDenied(_that.message);
      case _PermissionPermanentlyDenied()
          when permissionPermanentlyDenied != null:
        return permissionPermanentlyDenied(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements LocationState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.initial()';
  }
}

/// @nodoc

class _CheckingLocation implements LocationState {
  const _CheckingLocation();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckingLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.checkingLocation()';
  }
}

/// @nodoc

class _LocationChecked implements LocationState {
  const _LocationChecked(this.locationDM);

  final LocationDetailsDM locationDM;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationCheckedCopyWith<_LocationChecked> get copyWith =>
      __$LocationCheckedCopyWithImpl<_LocationChecked>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationChecked &&
            (identical(other.locationDM, locationDM) ||
                other.locationDM == locationDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationDM);

  @override
  String toString() {
    return 'LocationState.locationChecked(locationDM: $locationDM)';
  }
}

/// @nodoc
abstract mixin class _$LocationCheckedCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$LocationCheckedCopyWith(
          _LocationChecked value, $Res Function(_LocationChecked) _then) =
      __$LocationCheckedCopyWithImpl;
  @useResult
  $Res call({LocationDetailsDM locationDM});

  $LocationDetailsDMCopyWith<$Res> get locationDM;
}

/// @nodoc
class __$LocationCheckedCopyWithImpl<$Res>
    implements _$LocationCheckedCopyWith<$Res> {
  __$LocationCheckedCopyWithImpl(this._self, this._then);

  final _LocationChecked _self;
  final $Res Function(_LocationChecked) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locationDM = null,
  }) {
    return _then(_LocationChecked(
      null == locationDM
          ? _self.locationDM
          : locationDM // ignore: cast_nullable_to_non_nullable
              as LocationDetailsDM,
    ));
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDetailsDMCopyWith<$Res> get locationDM {
    return $LocationDetailsDMCopyWith<$Res>(_self.locationDM, (value) {
      return _then(_self.copyWith(locationDM: value));
    });
  }
}

/// @nodoc

class _LocationError implements LocationState {
  const _LocationError(this.message);

  final String message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationErrorCopyWith<_LocationError> get copyWith =>
      __$LocationErrorCopyWithImpl<_LocationError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LocationState.locationError(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$LocationErrorCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$LocationErrorCopyWith(
          _LocationError value, $Res Function(_LocationError) _then) =
      __$LocationErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$LocationErrorCopyWithImpl<$Res>
    implements _$LocationErrorCopyWith<$Res> {
  __$LocationErrorCopyWithImpl(this._self, this._then);

  final _LocationError _self;
  final $Res Function(_LocationError) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_LocationError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ServiceDisabled implements LocationState {
  const _ServiceDisabled(this.message);

  final String message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceDisabledCopyWith<_ServiceDisabled> get copyWith =>
      __$ServiceDisabledCopyWithImpl<_ServiceDisabled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceDisabled &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LocationState.serviceDisabled(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ServiceDisabledCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$ServiceDisabledCopyWith(
          _ServiceDisabled value, $Res Function(_ServiceDisabled) _then) =
      __$ServiceDisabledCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ServiceDisabledCopyWithImpl<$Res>
    implements _$ServiceDisabledCopyWith<$Res> {
  __$ServiceDisabledCopyWithImpl(this._self, this._then);

  final _ServiceDisabled _self;
  final $Res Function(_ServiceDisabled) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ServiceDisabled(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PermissionDenied implements LocationState {
  const _PermissionDenied(this.message);

  final String message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionDeniedCopyWith<_PermissionDenied> get copyWith =>
      __$PermissionDeniedCopyWithImpl<_PermissionDenied>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionDenied &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LocationState.permissionDenied(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$PermissionDeniedCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$PermissionDeniedCopyWith(
          _PermissionDenied value, $Res Function(_PermissionDenied) _then) =
      __$PermissionDeniedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$PermissionDeniedCopyWithImpl<$Res>
    implements _$PermissionDeniedCopyWith<$Res> {
  __$PermissionDeniedCopyWithImpl(this._self, this._then);

  final _PermissionDenied _self;
  final $Res Function(_PermissionDenied) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_PermissionDenied(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PermissionPermanentlyDenied implements LocationState {
  const _PermissionPermanentlyDenied(this.message);

  final String message;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionPermanentlyDeniedCopyWith<_PermissionPermanentlyDenied>
      get copyWith => __$PermissionPermanentlyDeniedCopyWithImpl<
          _PermissionPermanentlyDenied>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionPermanentlyDenied &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LocationState.permissionPermanentlyDenied(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$PermissionPermanentlyDeniedCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$PermissionPermanentlyDeniedCopyWith(
          _PermissionPermanentlyDenied value,
          $Res Function(_PermissionPermanentlyDenied) _then) =
      __$PermissionPermanentlyDeniedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$PermissionPermanentlyDeniedCopyWithImpl<$Res>
    implements _$PermissionPermanentlyDeniedCopyWith<$Res> {
  __$PermissionPermanentlyDeniedCopyWithImpl(this._self, this._then);

  final _PermissionPermanentlyDenied _self;
  final $Res Function(_PermissionPermanentlyDenied) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_PermissionPermanentlyDenied(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
