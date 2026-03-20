// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RootEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserSessionDM userSessionDM) cacheAuthSession,
    required TResult Function() userLogout,
    required TResult Function() expireSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult? Function()? userLogout,
    TResult? Function()? expireSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult Function()? userLogout,
    TResult Function()? expireSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CacheAuthSession value) cacheAuthSession,
    required TResult Function(_UserLogout value) userLogout,
    required TResult Function(_ExpireSession value) expireSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CacheAuthSession value)? cacheAuthSession,
    TResult? Function(_UserLogout value)? userLogout,
    TResult? Function(_ExpireSession value)? expireSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CacheAuthSession value)? cacheAuthSession,
    TResult Function(_UserLogout value)? userLogout,
    TResult Function(_ExpireSession value)? expireSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootEventCopyWith<$Res> {
  factory $RootEventCopyWith(RootEvent value, $Res Function(RootEvent) then) =
      _$RootEventCopyWithImpl<$Res, RootEvent>;
}

/// @nodoc
class _$RootEventCopyWithImpl<$Res, $Val extends RootEvent>
    implements $RootEventCopyWith<$Res> {
  _$RootEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CacheAuthSessionImplCopyWith<$Res> {
  factory _$$CacheAuthSessionImplCopyWith(_$CacheAuthSessionImpl value,
          $Res Function(_$CacheAuthSessionImpl) then) =
      __$$CacheAuthSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSessionDM userSessionDM});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$$CacheAuthSessionImplCopyWithImpl<$Res>
    extends _$RootEventCopyWithImpl<$Res, _$CacheAuthSessionImpl>
    implements _$$CacheAuthSessionImplCopyWith<$Res> {
  __$$CacheAuthSessionImplCopyWithImpl(_$CacheAuthSessionImpl _value,
      $Res Function(_$CacheAuthSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSessionDM = null,
  }) {
    return _then(_$CacheAuthSessionImpl(
      userSessionDM: null == userSessionDM
          ? _value.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_value.userSessionDM, (value) {
      return _then(_value.copyWith(userSessionDM: value));
    });
  }
}

/// @nodoc

class _$CacheAuthSessionImpl implements _CacheAuthSession {
  const _$CacheAuthSessionImpl({required this.userSessionDM});

  @override
  final UserSessionDM userSessionDM;

  @override
  String toString() {
    return 'RootEvent.cacheAuthSession(userSessionDM: $userSessionDM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheAuthSessionImpl &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSessionDM);

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheAuthSessionImplCopyWith<_$CacheAuthSessionImpl> get copyWith =>
      __$$CacheAuthSessionImplCopyWithImpl<_$CacheAuthSessionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserSessionDM userSessionDM) cacheAuthSession,
    required TResult Function() userLogout,
    required TResult Function() expireSession,
  }) {
    return cacheAuthSession(userSessionDM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult? Function()? userLogout,
    TResult? Function()? expireSession,
  }) {
    return cacheAuthSession?.call(userSessionDM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult Function()? userLogout,
    TResult Function()? expireSession,
    required TResult orElse(),
  }) {
    if (cacheAuthSession != null) {
      return cacheAuthSession(userSessionDM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CacheAuthSession value) cacheAuthSession,
    required TResult Function(_UserLogout value) userLogout,
    required TResult Function(_ExpireSession value) expireSession,
  }) {
    return cacheAuthSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CacheAuthSession value)? cacheAuthSession,
    TResult? Function(_UserLogout value)? userLogout,
    TResult? Function(_ExpireSession value)? expireSession,
  }) {
    return cacheAuthSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CacheAuthSession value)? cacheAuthSession,
    TResult Function(_UserLogout value)? userLogout,
    TResult Function(_ExpireSession value)? expireSession,
    required TResult orElse(),
  }) {
    if (cacheAuthSession != null) {
      return cacheAuthSession(this);
    }
    return orElse();
  }
}

abstract class _CacheAuthSession implements RootEvent {
  const factory _CacheAuthSession(
      {required final UserSessionDM userSessionDM}) = _$CacheAuthSessionImpl;

  UserSessionDM get userSessionDM;

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheAuthSessionImplCopyWith<_$CacheAuthSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLogoutImplCopyWith<$Res> {
  factory _$$UserLogoutImplCopyWith(
          _$UserLogoutImpl value, $Res Function(_$UserLogoutImpl) then) =
      __$$UserLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLogoutImplCopyWithImpl<$Res>
    extends _$RootEventCopyWithImpl<$Res, _$UserLogoutImpl>
    implements _$$UserLogoutImplCopyWith<$Res> {
  __$$UserLogoutImplCopyWithImpl(
      _$UserLogoutImpl _value, $Res Function(_$UserLogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserLogoutImpl implements _UserLogout {
  const _$UserLogoutImpl();

  @override
  String toString() {
    return 'RootEvent.userLogout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserSessionDM userSessionDM) cacheAuthSession,
    required TResult Function() userLogout,
    required TResult Function() expireSession,
  }) {
    return userLogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult? Function()? userLogout,
    TResult? Function()? expireSession,
  }) {
    return userLogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult Function()? userLogout,
    TResult Function()? expireSession,
    required TResult orElse(),
  }) {
    if (userLogout != null) {
      return userLogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CacheAuthSession value) cacheAuthSession,
    required TResult Function(_UserLogout value) userLogout,
    required TResult Function(_ExpireSession value) expireSession,
  }) {
    return userLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CacheAuthSession value)? cacheAuthSession,
    TResult? Function(_UserLogout value)? userLogout,
    TResult? Function(_ExpireSession value)? expireSession,
  }) {
    return userLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CacheAuthSession value)? cacheAuthSession,
    TResult Function(_UserLogout value)? userLogout,
    TResult Function(_ExpireSession value)? expireSession,
    required TResult orElse(),
  }) {
    if (userLogout != null) {
      return userLogout(this);
    }
    return orElse();
  }
}

abstract class _UserLogout implements RootEvent {
  const factory _UserLogout() = _$UserLogoutImpl;
}

/// @nodoc
abstract class _$$ExpireSessionImplCopyWith<$Res> {
  factory _$$ExpireSessionImplCopyWith(
          _$ExpireSessionImpl value, $Res Function(_$ExpireSessionImpl) then) =
      __$$ExpireSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpireSessionImplCopyWithImpl<$Res>
    extends _$RootEventCopyWithImpl<$Res, _$ExpireSessionImpl>
    implements _$$ExpireSessionImplCopyWith<$Res> {
  __$$ExpireSessionImplCopyWithImpl(
      _$ExpireSessionImpl _value, $Res Function(_$ExpireSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExpireSessionImpl implements _ExpireSession {
  const _$ExpireSessionImpl();

  @override
  String toString() {
    return 'RootEvent.expireSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpireSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserSessionDM userSessionDM) cacheAuthSession,
    required TResult Function() userLogout,
    required TResult Function() expireSession,
  }) {
    return expireSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult? Function()? userLogout,
    TResult? Function()? expireSession,
  }) {
    return expireSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult Function()? userLogout,
    TResult Function()? expireSession,
    required TResult orElse(),
  }) {
    if (expireSession != null) {
      return expireSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CacheAuthSession value) cacheAuthSession,
    required TResult Function(_UserLogout value) userLogout,
    required TResult Function(_ExpireSession value) expireSession,
  }) {
    return expireSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CacheAuthSession value)? cacheAuthSession,
    TResult? Function(_UserLogout value)? userLogout,
    TResult? Function(_ExpireSession value)? expireSession,
  }) {
    return expireSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CacheAuthSession value)? cacheAuthSession,
    TResult Function(_UserLogout value)? userLogout,
    TResult Function(_ExpireSession value)? expireSession,
    required TResult orElse(),
  }) {
    if (expireSession != null) {
      return expireSession(this);
    }
    return orElse();
  }
}

abstract class _ExpireSession implements RootEvent {
  const factory _ExpireSession() = _$ExpireSessionImpl;
}

RootState _$RootStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return _Initial.fromJson(json);
    case 'cachedState':
      return _CachedState.fromJson(json);
    case 'userLoggedOut':
      return _UserLoggedOut.fromJson(json);
    case 'sessionExpired':
      return _SessionExpired.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RootState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RootState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserSessionDM userSessionDM) cachedState,
    required TResult Function() userLoggedOut,
    required TResult Function() sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserSessionDM userSessionDM)? cachedState,
    TResult? Function()? userLoggedOut,
    TResult? Function()? sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserSessionDM userSessionDM)? cachedState,
    TResult Function()? userLoggedOut,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CachedState value) cachedState,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CachedState value)? cachedState,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CachedState value)? cachedState,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RootState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootStateCopyWith<$Res> {
  factory $RootStateCopyWith(RootState value, $Res Function(RootState) then) =
      _$RootStateCopyWithImpl<$Res, RootState>;
}

/// @nodoc
class _$RootStateCopyWithImpl<$Res, $Val extends RootState>
    implements $RootStateCopyWith<$Res> {
  _$RootStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RootState
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
    extends _$RootStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$InitialImpl extends _Initial {
  const _$InitialImpl({final String? $type})
      : $type = $type ?? 'initial',
        super._();

  factory _$InitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitialImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RootState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserSessionDM userSessionDM) cachedState,
    required TResult Function() userLoggedOut,
    required TResult Function() sessionExpired,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserSessionDM userSessionDM)? cachedState,
    TResult? Function()? userLoggedOut,
    TResult? Function()? sessionExpired,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserSessionDM userSessionDM)? cachedState,
    TResult Function()? userLoggedOut,
    TResult Function()? sessionExpired,
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
    required TResult Function(_CachedState value) cachedState,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CachedState value)? cachedState,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CachedState value)? cachedState,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InitialImplToJson(
      this,
    );
  }
}

abstract class _Initial extends RootState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();

  factory _Initial.fromJson(Map<String, dynamic> json) = _$InitialImpl.fromJson;
}

/// @nodoc
abstract class _$$CachedStateImplCopyWith<$Res> {
  factory _$$CachedStateImplCopyWith(
          _$CachedStateImpl value, $Res Function(_$CachedStateImpl) then) =
      __$$CachedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSessionDM userSessionDM});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$$CachedStateImplCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$CachedStateImpl>
    implements _$$CachedStateImplCopyWith<$Res> {
  __$$CachedStateImplCopyWithImpl(
      _$CachedStateImpl _value, $Res Function(_$CachedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSessionDM = null,
  }) {
    return _then(_$CachedStateImpl(
      userSessionDM: null == userSessionDM
          ? _value.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_value.userSessionDM, (value) {
      return _then(_value.copyWith(userSessionDM: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CachedStateImpl extends _CachedState {
  const _$CachedStateImpl({required this.userSessionDM, final String? $type})
      : $type = $type ?? 'cachedState',
        super._();

  factory _$CachedStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CachedStateImplFromJson(json);

  @override
  final UserSessionDM userSessionDM;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RootState.cachedState(userSessionDM: $userSessionDM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CachedStateImpl &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userSessionDM);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CachedStateImplCopyWith<_$CachedStateImpl> get copyWith =>
      __$$CachedStateImplCopyWithImpl<_$CachedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserSessionDM userSessionDM) cachedState,
    required TResult Function() userLoggedOut,
    required TResult Function() sessionExpired,
  }) {
    return cachedState(userSessionDM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserSessionDM userSessionDM)? cachedState,
    TResult? Function()? userLoggedOut,
    TResult? Function()? sessionExpired,
  }) {
    return cachedState?.call(userSessionDM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserSessionDM userSessionDM)? cachedState,
    TResult Function()? userLoggedOut,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (cachedState != null) {
      return cachedState(userSessionDM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CachedState value) cachedState,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return cachedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CachedState value)? cachedState,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return cachedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CachedState value)? cachedState,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (cachedState != null) {
      return cachedState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CachedStateImplToJson(
      this,
    );
  }
}

abstract class _CachedState extends RootState {
  const factory _CachedState({required final UserSessionDM userSessionDM}) =
      _$CachedStateImpl;
  const _CachedState._() : super._();

  factory _CachedState.fromJson(Map<String, dynamic> json) =
      _$CachedStateImpl.fromJson;

  UserSessionDM get userSessionDM;

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CachedStateImplCopyWith<_$CachedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLoggedOutImplCopyWith<$Res> {
  factory _$$UserLoggedOutImplCopyWith(
          _$UserLoggedOutImpl value, $Res Function(_$UserLoggedOutImpl) then) =
      __$$UserLoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoggedOutImplCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$UserLoggedOutImpl>
    implements _$$UserLoggedOutImplCopyWith<$Res> {
  __$$UserLoggedOutImplCopyWithImpl(
      _$UserLoggedOutImpl _value, $Res Function(_$UserLoggedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UserLoggedOutImpl extends _UserLoggedOut {
  const _$UserLoggedOutImpl({final String? $type})
      : $type = $type ?? 'userLoggedOut',
        super._();

  factory _$UserLoggedOutImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoggedOutImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RootState.userLoggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoggedOutImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserSessionDM userSessionDM) cachedState,
    required TResult Function() userLoggedOut,
    required TResult Function() sessionExpired,
  }) {
    return userLoggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserSessionDM userSessionDM)? cachedState,
    TResult? Function()? userLoggedOut,
    TResult? Function()? sessionExpired,
  }) {
    return userLoggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserSessionDM userSessionDM)? cachedState,
    TResult Function()? userLoggedOut,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (userLoggedOut != null) {
      return userLoggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CachedState value) cachedState,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return userLoggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CachedState value)? cachedState,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return userLoggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CachedState value)? cachedState,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (userLoggedOut != null) {
      return userLoggedOut(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoggedOutImplToJson(
      this,
    );
  }
}

abstract class _UserLoggedOut extends RootState {
  const factory _UserLoggedOut() = _$UserLoggedOutImpl;
  const _UserLoggedOut._() : super._();

  factory _UserLoggedOut.fromJson(Map<String, dynamic> json) =
      _$UserLoggedOutImpl.fromJson;
}

/// @nodoc
abstract class _$$SessionExpiredImplCopyWith<$Res> {
  factory _$$SessionExpiredImplCopyWith(_$SessionExpiredImpl value,
          $Res Function(_$SessionExpiredImpl) then) =
      __$$SessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionExpiredImplCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$SessionExpiredImpl>
    implements _$$SessionExpiredImplCopyWith<$Res> {
  __$$SessionExpiredImplCopyWithImpl(
      _$SessionExpiredImpl _value, $Res Function(_$SessionExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SessionExpiredImpl extends _SessionExpired {
  const _$SessionExpiredImpl({final String? $type})
      : $type = $type ?? 'sessionExpired',
        super._();

  factory _$SessionExpiredImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionExpiredImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RootState.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionExpiredImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserSessionDM userSessionDM) cachedState,
    required TResult Function() userLoggedOut,
    required TResult Function() sessionExpired,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserSessionDM userSessionDM)? cachedState,
    TResult? Function()? userLoggedOut,
    TResult? Function()? sessionExpired,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserSessionDM userSessionDM)? cachedState,
    TResult Function()? userLoggedOut,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CachedState value) cachedState,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CachedState value)? cachedState,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CachedState value)? cachedState,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionExpiredImplToJson(
      this,
    );
  }
}

abstract class _SessionExpired extends RootState {
  const factory _SessionExpired() = _$SessionExpiredImpl;
  const _SessionExpired._() : super._();

  factory _SessionExpired.fromJson(Map<String, dynamic> json) =
      _$SessionExpiredImpl.fromJson;
}
