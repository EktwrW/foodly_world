// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalAuthState implements DiagnosticableTreeMixin {
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalAuthStateCopyWith<LocalAuthState> get copyWith =>
      _$LocalAuthStateCopyWithImpl<LocalAuthState>(
          this as LocalAuthState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalAuthState &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class $LocalAuthStateCopyWith<$Res> {
  factory $LocalAuthStateCopyWith(
          LocalAuthState value, $Res Function(LocalAuthState) _then) =
      _$LocalAuthStateCopyWithImpl;
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class _$LocalAuthStateCopyWithImpl<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  _$LocalAuthStateCopyWithImpl(this._self, this._then);

  final LocalAuthState _self;
  final $Res Function(LocalAuthState) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_self.copyWith(
      localAuthDTO: null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocalAuthState].
extension LocalAuthStatePatterns on LocalAuthState {
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NeedAuthentication value)? needAuthentication,
    TResult Function(_CredentialsNotAvailable value)? credentialsNotAvailable,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _NeedAuthentication() when needAuthentication != null:
        return needAuthentication(_that);
      case _CredentialsNotAvailable() when credentialsNotAvailable != null:
        return credentialsNotAvailable(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
      case _Error() when error != null:
        return error(_that);
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NeedAuthentication value) needAuthentication,
    required TResult Function(_CredentialsNotAvailable value)
        credentialsNotAvailable,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _NeedAuthentication():
        return needAuthentication(_that);
      case _CredentialsNotAvailable():
        return credentialsNotAvailable(_that);
      case _Authenticated():
        return authenticated(_that);
      case _Error():
        return error(_that);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NeedAuthentication value)? needAuthentication,
    TResult? Function(_CredentialsNotAvailable value)? credentialsNotAvailable,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _NeedAuthentication() when needAuthentication != null:
        return needAuthentication(_that);
      case _CredentialsNotAvailable() when credentialsNotAvailable != null:
        return credentialsNotAvailable(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
      case _Error() when error != null:
        return error(_that);
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
    TResult Function(LocalAuthDTO localAuthDTO)? initial,
    TResult Function(LocalAuthDTO localAuthDTO)? loading,
    TResult Function(LocalAuthDTO localAuthDTO)? loaded,
    TResult Function(LocalAuthDTO localAuthDTO)? needAuthentication,
    TResult Function(LocalAuthDTO localAuthDTO)? credentialsNotAvailable,
    TResult Function(LocalAuthDTO localAuthDTO)? authenticated,
    TResult Function(String msg, LocalAuthDTO localAuthDTO)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.localAuthDTO);
      case _Loading() when loading != null:
        return loading(_that.localAuthDTO);
      case _Loaded() when loaded != null:
        return loaded(_that.localAuthDTO);
      case _NeedAuthentication() when needAuthentication != null:
        return needAuthentication(_that.localAuthDTO);
      case _CredentialsNotAvailable() when credentialsNotAvailable != null:
        return credentialsNotAvailable(_that.localAuthDTO);
      case _Authenticated() when authenticated != null:
        return authenticated(_that.localAuthDTO);
      case _Error() when error != null:
        return error(_that.msg, _that.localAuthDTO);
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
    required TResult Function(LocalAuthDTO localAuthDTO) initial,
    required TResult Function(LocalAuthDTO localAuthDTO) loading,
    required TResult Function(LocalAuthDTO localAuthDTO) loaded,
    required TResult Function(LocalAuthDTO localAuthDTO) needAuthentication,
    required TResult Function(LocalAuthDTO localAuthDTO)
        credentialsNotAvailable,
    required TResult Function(LocalAuthDTO localAuthDTO) authenticated,
    required TResult Function(String msg, LocalAuthDTO localAuthDTO) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.localAuthDTO);
      case _Loading():
        return loading(_that.localAuthDTO);
      case _Loaded():
        return loaded(_that.localAuthDTO);
      case _NeedAuthentication():
        return needAuthentication(_that.localAuthDTO);
      case _CredentialsNotAvailable():
        return credentialsNotAvailable(_that.localAuthDTO);
      case _Authenticated():
        return authenticated(_that.localAuthDTO);
      case _Error():
        return error(_that.msg, _that.localAuthDTO);
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
    TResult? Function(LocalAuthDTO localAuthDTO)? initial,
    TResult? Function(LocalAuthDTO localAuthDTO)? loading,
    TResult? Function(LocalAuthDTO localAuthDTO)? loaded,
    TResult? Function(LocalAuthDTO localAuthDTO)? needAuthentication,
    TResult? Function(LocalAuthDTO localAuthDTO)? credentialsNotAvailable,
    TResult? Function(LocalAuthDTO localAuthDTO)? authenticated,
    TResult? Function(String msg, LocalAuthDTO localAuthDTO)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.localAuthDTO);
      case _Loading() when loading != null:
        return loading(_that.localAuthDTO);
      case _Loaded() when loaded != null:
        return loaded(_that.localAuthDTO);
      case _NeedAuthentication() when needAuthentication != null:
        return needAuthentication(_that.localAuthDTO);
      case _CredentialsNotAvailable() when credentialsNotAvailable != null:
        return credentialsNotAvailable(_that.localAuthDTO);
      case _Authenticated() when authenticated != null:
        return authenticated(_that.localAuthDTO);
      case _Error() when error != null:
        return error(_that.msg, _that.localAuthDTO);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements LocalAuthState {
  const _Initial(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.initial'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.initial(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_Initial(
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// @nodoc

class _Loading with DiagnosticableTreeMixin implements LocalAuthState {
  const _Loading(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.loading'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.loading(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_Loading(
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// @nodoc

class _Loaded with DiagnosticableTreeMixin implements LocalAuthState {
  const _Loaded(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.loaded'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.loaded(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_Loaded(
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// @nodoc

class _NeedAuthentication
    with DiagnosticableTreeMixin
    implements LocalAuthState {
  const _NeedAuthentication(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NeedAuthenticationCopyWith<_NeedAuthentication> get copyWith =>
      __$NeedAuthenticationCopyWithImpl<_NeedAuthentication>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.needAuthentication'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NeedAuthentication &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.needAuthentication(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$NeedAuthenticationCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$NeedAuthenticationCopyWith(
          _NeedAuthentication value, $Res Function(_NeedAuthentication) _then) =
      __$NeedAuthenticationCopyWithImpl;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$NeedAuthenticationCopyWithImpl<$Res>
    implements _$NeedAuthenticationCopyWith<$Res> {
  __$NeedAuthenticationCopyWithImpl(this._self, this._then);

  final _NeedAuthentication _self;
  final $Res Function(_NeedAuthentication) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_NeedAuthentication(
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// @nodoc

class _CredentialsNotAvailable
    with DiagnosticableTreeMixin
    implements LocalAuthState {
  const _CredentialsNotAvailable(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CredentialsNotAvailableCopyWith<_CredentialsNotAvailable> get copyWith =>
      __$CredentialsNotAvailableCopyWithImpl<_CredentialsNotAvailable>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'LocalAuthState.credentialsNotAvailable'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CredentialsNotAvailable &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.credentialsNotAvailable(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$CredentialsNotAvailableCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$CredentialsNotAvailableCopyWith(_CredentialsNotAvailable value,
          $Res Function(_CredentialsNotAvailable) _then) =
      __$CredentialsNotAvailableCopyWithImpl;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$CredentialsNotAvailableCopyWithImpl<$Res>
    implements _$CredentialsNotAvailableCopyWith<$Res> {
  __$CredentialsNotAvailableCopyWithImpl(this._self, this._then);

  final _CredentialsNotAvailable _self;
  final $Res Function(_CredentialsNotAvailable) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_CredentialsNotAvailable(
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// @nodoc

class _Authenticated with DiagnosticableTreeMixin implements LocalAuthState {
  const _Authenticated(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.authenticated'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticated &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.authenticated(localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) _then) =
      __$AuthenticatedCopyWithImpl;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_Authenticated(
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements LocalAuthState {
  const _Error(this.msg, this.localAuthDTO);

  final String msg;
  @override
  final LocalAuthDTO localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.error'))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg, localAuthDTO);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.error(msg: $msg, localAuthDTO: $localAuthDTO)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String msg, LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
    Object? localAuthDTO = null,
  }) {
    return _then(_Error(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      null == localAuthDTO
          ? _self.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_self.localAuthDTO, (value) {
      return _then(_self.copyWith(localAuthDTO: value));
    });
  }
}

// dart format on
