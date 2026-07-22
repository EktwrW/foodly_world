// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalAuthDTO {
  bool get deviceIsSupported;
  bool get isAuthenticating;
  bool get canCheckBiometrics;
  List<BiometricType> get availableBiometrics;
  bool get authenticated;
  UserSessionDM get userSessionDM;

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<LocalAuthDTO> get copyWith =>
      _$LocalAuthDTOCopyWithImpl<LocalAuthDTO>(
          this as LocalAuthDTO, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalAuthDTO &&
            (identical(other.deviceIsSupported, deviceIsSupported) ||
                other.deviceIsSupported == deviceIsSupported) &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                other.isAuthenticating == isAuthenticating) &&
            (identical(other.canCheckBiometrics, canCheckBiometrics) ||
                other.canCheckBiometrics == canCheckBiometrics) &&
            const DeepCollectionEquality()
                .equals(other.availableBiometrics, availableBiometrics) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated) &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceIsSupported,
      isAuthenticating,
      canCheckBiometrics,
      const DeepCollectionEquality().hash(availableBiometrics),
      authenticated,
      userSessionDM);

  @override
  String toString() {
    return 'LocalAuthDTO(deviceIsSupported: $deviceIsSupported, isAuthenticating: $isAuthenticating, canCheckBiometrics: $canCheckBiometrics, availableBiometrics: $availableBiometrics, authenticated: $authenticated, userSessionDM: $userSessionDM)';
  }
}

/// @nodoc
abstract mixin class $LocalAuthDTOCopyWith<$Res> {
  factory $LocalAuthDTOCopyWith(
          LocalAuthDTO value, $Res Function(LocalAuthDTO) _then) =
      _$LocalAuthDTOCopyWithImpl;
  @useResult
  $Res call(
      {bool deviceIsSupported,
      bool isAuthenticating,
      bool canCheckBiometrics,
      List<BiometricType> availableBiometrics,
      bool authenticated,
      UserSessionDM userSessionDM});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class _$LocalAuthDTOCopyWithImpl<$Res> implements $LocalAuthDTOCopyWith<$Res> {
  _$LocalAuthDTOCopyWithImpl(this._self, this._then);

  final LocalAuthDTO _self;
  final $Res Function(LocalAuthDTO) _then;

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceIsSupported = null,
    Object? isAuthenticating = null,
    Object? canCheckBiometrics = null,
    Object? availableBiometrics = null,
    Object? authenticated = null,
    Object? userSessionDM = null,
  }) {
    return _then(_self.copyWith(
      deviceIsSupported: null == deviceIsSupported
          ? _self.deviceIsSupported
          : deviceIsSupported // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticating: null == isAuthenticating
          ? _self.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      canCheckBiometrics: null == canCheckBiometrics
          ? _self.canCheckBiometrics
          : canCheckBiometrics // ignore: cast_nullable_to_non_nullable
              as bool,
      availableBiometrics: null == availableBiometrics
          ? _self.availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      authenticated: null == authenticated
          ? _self.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocalAuthDTO].
extension LocalAuthDTOPatterns on LocalAuthDTO {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalAuthDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalAuthDTO() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_LocalAuthDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalAuthDTO():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalAuthDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalAuthDTO() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool deviceIsSupported,
            bool isAuthenticating,
            bool canCheckBiometrics,
            List<BiometricType> availableBiometrics,
            bool authenticated,
            UserSessionDM userSessionDM)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalAuthDTO() when $default != null:
        return $default(
            _that.deviceIsSupported,
            _that.isAuthenticating,
            _that.canCheckBiometrics,
            _that.availableBiometrics,
            _that.authenticated,
            _that.userSessionDM);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            bool deviceIsSupported,
            bool isAuthenticating,
            bool canCheckBiometrics,
            List<BiometricType> availableBiometrics,
            bool authenticated,
            UserSessionDM userSessionDM)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalAuthDTO():
        return $default(
            _that.deviceIsSupported,
            _that.isAuthenticating,
            _that.canCheckBiometrics,
            _that.availableBiometrics,
            _that.authenticated,
            _that.userSessionDM);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool deviceIsSupported,
            bool isAuthenticating,
            bool canCheckBiometrics,
            List<BiometricType> availableBiometrics,
            bool authenticated,
            UserSessionDM userSessionDM)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalAuthDTO() when $default != null:
        return $default(
            _that.deviceIsSupported,
            _that.isAuthenticating,
            _that.canCheckBiometrics,
            _that.availableBiometrics,
            _that.authenticated,
            _that.userSessionDM);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocalAuthDTO implements LocalAuthDTO {
  const _LocalAuthDTO(
      {this.deviceIsSupported = false,
      this.isAuthenticating = false,
      this.canCheckBiometrics = false,
      final List<BiometricType> availableBiometrics = const [],
      this.authenticated = false,
      this.userSessionDM = const UserSessionDM(user: UserDM(), token: '')})
      : _availableBiometrics = availableBiometrics;

  @override
  @JsonKey()
  final bool deviceIsSupported;
  @override
  @JsonKey()
  final bool isAuthenticating;
  @override
  @JsonKey()
  final bool canCheckBiometrics;
  final List<BiometricType> _availableBiometrics;
  @override
  @JsonKey()
  List<BiometricType> get availableBiometrics {
    if (_availableBiometrics is EqualUnmodifiableListView)
      return _availableBiometrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableBiometrics);
  }

  @override
  @JsonKey()
  final bool authenticated;
  @override
  @JsonKey()
  final UserSessionDM userSessionDM;

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalAuthDTOCopyWith<_LocalAuthDTO> get copyWith =>
      __$LocalAuthDTOCopyWithImpl<_LocalAuthDTO>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalAuthDTO &&
            (identical(other.deviceIsSupported, deviceIsSupported) ||
                other.deviceIsSupported == deviceIsSupported) &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                other.isAuthenticating == isAuthenticating) &&
            (identical(other.canCheckBiometrics, canCheckBiometrics) ||
                other.canCheckBiometrics == canCheckBiometrics) &&
            const DeepCollectionEquality()
                .equals(other._availableBiometrics, _availableBiometrics) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated) &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceIsSupported,
      isAuthenticating,
      canCheckBiometrics,
      const DeepCollectionEquality().hash(_availableBiometrics),
      authenticated,
      userSessionDM);

  @override
  String toString() {
    return 'LocalAuthDTO(deviceIsSupported: $deviceIsSupported, isAuthenticating: $isAuthenticating, canCheckBiometrics: $canCheckBiometrics, availableBiometrics: $availableBiometrics, authenticated: $authenticated, userSessionDM: $userSessionDM)';
  }
}

/// @nodoc
abstract mixin class _$LocalAuthDTOCopyWith<$Res>
    implements $LocalAuthDTOCopyWith<$Res> {
  factory _$LocalAuthDTOCopyWith(
          _LocalAuthDTO value, $Res Function(_LocalAuthDTO) _then) =
      __$LocalAuthDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool deviceIsSupported,
      bool isAuthenticating,
      bool canCheckBiometrics,
      List<BiometricType> availableBiometrics,
      bool authenticated,
      UserSessionDM userSessionDM});

  @override
  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$LocalAuthDTOCopyWithImpl<$Res>
    implements _$LocalAuthDTOCopyWith<$Res> {
  __$LocalAuthDTOCopyWithImpl(this._self, this._then);

  final _LocalAuthDTO _self;
  final $Res Function(_LocalAuthDTO) _then;

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? deviceIsSupported = null,
    Object? isAuthenticating = null,
    Object? canCheckBiometrics = null,
    Object? availableBiometrics = null,
    Object? authenticated = null,
    Object? userSessionDM = null,
  }) {
    return _then(_LocalAuthDTO(
      deviceIsSupported: null == deviceIsSupported
          ? _self.deviceIsSupported
          : deviceIsSupported // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticating: null == isAuthenticating
          ? _self.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      canCheckBiometrics: null == canCheckBiometrics
          ? _self.canCheckBiometrics
          : canCheckBiometrics // ignore: cast_nullable_to_non_nullable
              as bool,
      availableBiometrics: null == availableBiometrics
          ? _self._availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      authenticated: null == authenticated
          ? _self.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }
}

// dart format on
