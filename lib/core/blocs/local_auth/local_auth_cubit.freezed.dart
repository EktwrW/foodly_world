// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalAuthState {
  LocalAuthDTO get localAuthDTO => throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocalAuthDTO localAuthDTO)? initial,
    TResult? Function(LocalAuthDTO localAuthDTO)? loading,
    TResult? Function(LocalAuthDTO localAuthDTO)? loaded,
    TResult? Function(LocalAuthDTO localAuthDTO)? needAuthentication,
    TResult? Function(LocalAuthDTO localAuthDTO)? credentialsNotAvailable,
    TResult? Function(LocalAuthDTO localAuthDTO)? authenticated,
    TResult? Function(String msg, LocalAuthDTO localAuthDTO)? error,
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NeedAuthentication value)? needAuthentication,
    TResult? Function(_CredentialsNotAvailable value)? credentialsNotAvailable,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalAuthStateCopyWith<LocalAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAuthStateCopyWith<$Res> {
  factory $LocalAuthStateCopyWith(
          LocalAuthState value, $Res Function(LocalAuthState) then) =
      _$LocalAuthStateCopyWithImpl<$Res, LocalAuthState>;
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class _$LocalAuthStateCopyWithImpl<$Res, $Val extends LocalAuthState>
    implements $LocalAuthStateCopyWith<$Res> {
  _$LocalAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_value.copyWith(
      localAuthDTO: null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ) as $Val);
  }

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO {
    return $LocalAuthDTOCopyWith<$Res>(_value.localAuthDTO, (value) {
      return _then(_value.copyWith(localAuthDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_$InitialImpl(
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.initial(localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.initial'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
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
    return initial(localAuthDTO);
  }

  @override
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
    return initial?.call(localAuthDTO);
  }

  @override
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
    if (initial != null) {
      return initial(localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return initial(this);
  }

  @override
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
    return initial?.call(this);
  }

  @override
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
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocalAuthState {
  const factory _Initial(final LocalAuthDTO localAuthDTO) = _$InitialImpl;

  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_$LoadingImpl(
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.loading(localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.loading'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
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
    return loading(localAuthDTO);
  }

  @override
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
    return loading?.call(localAuthDTO);
  }

  @override
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
    if (loading != null) {
      return loading(localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return loading(this);
  }

  @override
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
    return loading?.call(this);
  }

  @override
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
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LocalAuthState {
  const factory _Loading(final LocalAuthDTO localAuthDTO) = _$LoadingImpl;

  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_$LoadedImpl(
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.loaded(localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.loaded'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
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
    return loaded(localAuthDTO);
  }

  @override
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
    return loaded?.call(localAuthDTO);
  }

  @override
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
    if (loaded != null) {
      return loaded(localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return loaded(this);
  }

  @override
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
    return loaded?.call(this);
  }

  @override
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
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements LocalAuthState {
  const factory _Loaded(final LocalAuthDTO localAuthDTO) = _$LoadedImpl;

  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NeedAuthenticationImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$NeedAuthenticationImplCopyWith(_$NeedAuthenticationImpl value,
          $Res Function(_$NeedAuthenticationImpl) then) =
      __$$NeedAuthenticationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$NeedAuthenticationImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$NeedAuthenticationImpl>
    implements _$$NeedAuthenticationImplCopyWith<$Res> {
  __$$NeedAuthenticationImplCopyWithImpl(_$NeedAuthenticationImpl _value,
      $Res Function(_$NeedAuthenticationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_$NeedAuthenticationImpl(
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$NeedAuthenticationImpl
    with DiagnosticableTreeMixin
    implements _NeedAuthentication {
  const _$NeedAuthenticationImpl(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.needAuthentication(localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.needAuthentication'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeedAuthenticationImpl &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NeedAuthenticationImplCopyWith<_$NeedAuthenticationImpl> get copyWith =>
      __$$NeedAuthenticationImplCopyWithImpl<_$NeedAuthenticationImpl>(
          this, _$identity);

  @override
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
    return needAuthentication(localAuthDTO);
  }

  @override
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
    return needAuthentication?.call(localAuthDTO);
  }

  @override
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
    if (needAuthentication != null) {
      return needAuthentication(localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return needAuthentication(this);
  }

  @override
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
    return needAuthentication?.call(this);
  }

  @override
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
    if (needAuthentication != null) {
      return needAuthentication(this);
    }
    return orElse();
  }
}

abstract class _NeedAuthentication implements LocalAuthState {
  const factory _NeedAuthentication(final LocalAuthDTO localAuthDTO) =
      _$NeedAuthenticationImpl;

  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NeedAuthenticationImplCopyWith<_$NeedAuthenticationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CredentialsNotAvailableImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$CredentialsNotAvailableImplCopyWith(
          _$CredentialsNotAvailableImpl value,
          $Res Function(_$CredentialsNotAvailableImpl) then) =
      __$$CredentialsNotAvailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$CredentialsNotAvailableImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$CredentialsNotAvailableImpl>
    implements _$$CredentialsNotAvailableImplCopyWith<$Res> {
  __$$CredentialsNotAvailableImplCopyWithImpl(
      _$CredentialsNotAvailableImpl _value,
      $Res Function(_$CredentialsNotAvailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_$CredentialsNotAvailableImpl(
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$CredentialsNotAvailableImpl
    with DiagnosticableTreeMixin
    implements _CredentialsNotAvailable {
  const _$CredentialsNotAvailableImpl(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.credentialsNotAvailable(localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'LocalAuthState.credentialsNotAvailable'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialsNotAvailableImpl &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialsNotAvailableImplCopyWith<_$CredentialsNotAvailableImpl>
      get copyWith => __$$CredentialsNotAvailableImplCopyWithImpl<
          _$CredentialsNotAvailableImpl>(this, _$identity);

  @override
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
    return credentialsNotAvailable(localAuthDTO);
  }

  @override
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
    return credentialsNotAvailable?.call(localAuthDTO);
  }

  @override
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
    if (credentialsNotAvailable != null) {
      return credentialsNotAvailable(localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return credentialsNotAvailable(this);
  }

  @override
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
    return credentialsNotAvailable?.call(this);
  }

  @override
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
    if (credentialsNotAvailable != null) {
      return credentialsNotAvailable(this);
    }
    return orElse();
  }
}

abstract class _CredentialsNotAvailable implements LocalAuthState {
  const factory _CredentialsNotAvailable(final LocalAuthDTO localAuthDTO) =
      _$CredentialsNotAvailableImpl;

  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CredentialsNotAvailableImplCopyWith<_$CredentialsNotAvailableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localAuthDTO = null,
  }) {
    return _then(_$AuthenticatedImpl(
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl
    with DiagnosticableTreeMixin
    implements _Authenticated {
  const _$AuthenticatedImpl(this.localAuthDTO);

  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.authenticated(localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.authenticated'))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
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
    return authenticated(localAuthDTO);
  }

  @override
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
    return authenticated?.call(localAuthDTO);
  }

  @override
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
    if (authenticated != null) {
      return authenticated(localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return authenticated(this);
  }

  @override
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
    return authenticated?.call(this);
  }

  @override
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
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements LocalAuthState {
  const factory _Authenticated(final LocalAuthDTO localAuthDTO) =
      _$AuthenticatedImpl;

  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $LocalAuthStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg, LocalAuthDTO localAuthDTO});

  @override
  $LocalAuthDTOCopyWith<$Res> get localAuthDTO;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LocalAuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? localAuthDTO = null,
  }) {
    return _then(_$ErrorImpl(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      null == localAuthDTO
          ? _value.localAuthDTO
          : localAuthDTO // ignore: cast_nullable_to_non_nullable
              as LocalAuthDTO,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.msg, this.localAuthDTO);

  @override
  final String msg;
  @override
  final LocalAuthDTO localAuthDTO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalAuthState.error(msg: $msg, localAuthDTO: $localAuthDTO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalAuthState.error'))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('localAuthDTO', localAuthDTO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.localAuthDTO, localAuthDTO) ||
                other.localAuthDTO == localAuthDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg, localAuthDTO);

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
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
    return error(msg, localAuthDTO);
  }

  @override
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
    return error?.call(msg, localAuthDTO);
  }

  @override
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
    if (error != null) {
      return error(msg, localAuthDTO);
    }
    return orElse();
  }

  @override
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
    return error(this);
  }

  @override
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
    return error?.call(this);
  }

  @override
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
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LocalAuthState {
  const factory _Error(final String msg, final LocalAuthDTO localAuthDTO) =
      _$ErrorImpl;

  String get msg;
  @override
  LocalAuthDTO get localAuthDTO;

  /// Create a copy of LocalAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
