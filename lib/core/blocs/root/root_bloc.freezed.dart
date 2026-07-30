// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RootEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RootEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootEvent()';
  }
}

/// @nodoc
class $RootEventCopyWith<$Res> {
  $RootEventCopyWith(RootEvent _, $Res Function(RootEvent) __);
}

/// Adds pattern-matching-related methods to [RootEvent].
extension RootEventPatterns on RootEvent {
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
    TResult Function(_CacheAuthSession value)? cacheAuthSession,
    TResult Function(_UserLogout value)? userLogout,
    TResult Function(_ExpireSession value)? expireSession,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CacheAuthSession() when cacheAuthSession != null:
        return cacheAuthSession(_that);
      case _UserLogout() when userLogout != null:
        return userLogout(_that);
      case _ExpireSession() when expireSession != null:
        return expireSession(_that);
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
    required TResult Function(_CacheAuthSession value) cacheAuthSession,
    required TResult Function(_UserLogout value) userLogout,
    required TResult Function(_ExpireSession value) expireSession,
  }) {
    final _that = this;
    switch (_that) {
      case _CacheAuthSession():
        return cacheAuthSession(_that);
      case _UserLogout():
        return userLogout(_that);
      case _ExpireSession():
        return expireSession(_that);
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
    TResult? Function(_CacheAuthSession value)? cacheAuthSession,
    TResult? Function(_UserLogout value)? userLogout,
    TResult? Function(_ExpireSession value)? expireSession,
  }) {
    final _that = this;
    switch (_that) {
      case _CacheAuthSession() when cacheAuthSession != null:
        return cacheAuthSession(_that);
      case _UserLogout() when userLogout != null:
        return userLogout(_that);
      case _ExpireSession() when expireSession != null:
        return expireSession(_that);
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
    TResult Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult Function()? userLogout,
    TResult Function()? expireSession,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CacheAuthSession() when cacheAuthSession != null:
        return cacheAuthSession(_that.userSessionDM);
      case _UserLogout() when userLogout != null:
        return userLogout();
      case _ExpireSession() when expireSession != null:
        return expireSession();
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
    required TResult Function(UserSessionDM userSessionDM) cacheAuthSession,
    required TResult Function() userLogout,
    required TResult Function() expireSession,
  }) {
    final _that = this;
    switch (_that) {
      case _CacheAuthSession():
        return cacheAuthSession(_that.userSessionDM);
      case _UserLogout():
        return userLogout();
      case _ExpireSession():
        return expireSession();
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
    TResult? Function(UserSessionDM userSessionDM)? cacheAuthSession,
    TResult? Function()? userLogout,
    TResult? Function()? expireSession,
  }) {
    final _that = this;
    switch (_that) {
      case _CacheAuthSession() when cacheAuthSession != null:
        return cacheAuthSession(_that.userSessionDM);
      case _UserLogout() when userLogout != null:
        return userLogout();
      case _ExpireSession() when expireSession != null:
        return expireSession();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CacheAuthSession implements RootEvent {
  const _CacheAuthSession({required this.userSessionDM});

  final UserSessionDM userSessionDM;

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CacheAuthSessionCopyWith<_CacheAuthSession> get copyWith =>
      __$CacheAuthSessionCopyWithImpl<_CacheAuthSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CacheAuthSession &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSessionDM);

  @override
  String toString() {
    return 'RootEvent.cacheAuthSession(userSessionDM: $userSessionDM)';
  }
}

/// @nodoc
abstract mixin class _$CacheAuthSessionCopyWith<$Res>
    implements $RootEventCopyWith<$Res> {
  factory _$CacheAuthSessionCopyWith(
          _CacheAuthSession value, $Res Function(_CacheAuthSession) _then) =
      __$CacheAuthSessionCopyWithImpl;
  @useResult
  $Res call({UserSessionDM userSessionDM});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$CacheAuthSessionCopyWithImpl<$Res>
    implements _$CacheAuthSessionCopyWith<$Res> {
  __$CacheAuthSessionCopyWithImpl(this._self, this._then);

  final _CacheAuthSession _self;
  final $Res Function(_CacheAuthSession) _then;

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userSessionDM = null,
  }) {
    return _then(_CacheAuthSession(
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }

  /// Create a copy of RootEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }
}

/// @nodoc

class _UserLogout implements RootEvent {
  const _UserLogout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UserLogout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootEvent.userLogout()';
  }
}

/// @nodoc

class _ExpireSession implements RootEvent {
  const _ExpireSession();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ExpireSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootEvent.expireSession()';
  }
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
  /// Serializes this RootState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RootState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootState()';
  }
}

/// @nodoc
class $RootStateCopyWith<$Res> {
  $RootStateCopyWith(RootState _, $Res Function(RootState) __);
}

/// Adds pattern-matching-related methods to [RootState].
extension RootStatePatterns on RootState {
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
    TResult Function(_CachedState value)? cachedState,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _CachedState() when cachedState != null:
        return cachedState(_that);
      case _UserLoggedOut() when userLoggedOut != null:
        return userLoggedOut(_that);
      case _SessionExpired() when sessionExpired != null:
        return sessionExpired(_that);
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
    required TResult Function(_CachedState value) cachedState,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _CachedState():
        return cachedState(_that);
      case _UserLoggedOut():
        return userLoggedOut(_that);
      case _SessionExpired():
        return sessionExpired(_that);
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
    TResult? Function(_CachedState value)? cachedState,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _CachedState() when cachedState != null:
        return cachedState(_that);
      case _UserLoggedOut() when userLoggedOut != null:
        return userLoggedOut(_that);
      case _SessionExpired() when sessionExpired != null:
        return sessionExpired(_that);
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
    TResult Function(UserSessionDM userSessionDM)? cachedState,
    TResult Function()? userLoggedOut,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _CachedState() when cachedState != null:
        return cachedState(_that.userSessionDM);
      case _UserLoggedOut() when userLoggedOut != null:
        return userLoggedOut();
      case _SessionExpired() when sessionExpired != null:
        return sessionExpired();
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
    required TResult Function(UserSessionDM userSessionDM) cachedState,
    required TResult Function() userLoggedOut,
    required TResult Function() sessionExpired,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _CachedState():
        return cachedState(_that.userSessionDM);
      case _UserLoggedOut():
        return userLoggedOut();
      case _SessionExpired():
        return sessionExpired();
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
    TResult? Function(UserSessionDM userSessionDM)? cachedState,
    TResult? Function()? userLoggedOut,
    TResult? Function()? sessionExpired,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _CachedState() when cachedState != null:
        return cachedState(_that.userSessionDM);
      case _UserLoggedOut() when userLoggedOut != null:
        return userLoggedOut();
      case _SessionExpired() when sessionExpired != null:
        return sessionExpired();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Initial extends RootState {
  const _Initial({final String? $type})
      : $type = $type ?? 'initial',
        super._();
  factory _Initial.fromJson(Map<String, dynamic> json) =>
      _$InitialFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$InitialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootState.initial()';
  }
}

/// @nodoc
@JsonSerializable()
class _CachedState extends RootState {
  const _CachedState({required this.userSessionDM, final String? $type})
      : $type = $type ?? 'cachedState',
        super._();
  factory _CachedState.fromJson(Map<String, dynamic> json) =>
      _$CachedStateFromJson(json);

  final UserSessionDM userSessionDM;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedStateCopyWith<_CachedState> get copyWith =>
      __$CachedStateCopyWithImpl<_CachedState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedState &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userSessionDM);

  @override
  String toString() {
    return 'RootState.cachedState(userSessionDM: $userSessionDM)';
  }
}

/// @nodoc
abstract mixin class _$CachedStateCopyWith<$Res>
    implements $RootStateCopyWith<$Res> {
  factory _$CachedStateCopyWith(
          _CachedState value, $Res Function(_CachedState) _then) =
      __$CachedStateCopyWithImpl;
  @useResult
  $Res call({UserSessionDM userSessionDM});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$CachedStateCopyWithImpl<$Res> implements _$CachedStateCopyWith<$Res> {
  __$CachedStateCopyWithImpl(this._self, this._then);

  final _CachedState _self;
  final $Res Function(_CachedState) _then;

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userSessionDM = null,
  }) {
    return _then(_CachedState(
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserLoggedOut extends RootState {
  const _UserLoggedOut({final String? $type})
      : $type = $type ?? 'userLoggedOut',
        super._();
  factory _UserLoggedOut.fromJson(Map<String, dynamic> json) =>
      _$UserLoggedOutFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$UserLoggedOutToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UserLoggedOut);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootState.userLoggedOut()';
  }
}

/// @nodoc
@JsonSerializable()
class _SessionExpired extends RootState {
  const _SessionExpired({final String? $type})
      : $type = $type ?? 'sessionExpired',
        super._();
  factory _SessionExpired.fromJson(Map<String, dynamic> json) =>
      _$SessionExpiredFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SessionExpiredToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SessionExpired);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RootState.sessionExpired()';
  }
}

// dart format on
