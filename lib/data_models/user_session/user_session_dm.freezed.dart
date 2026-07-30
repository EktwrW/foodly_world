// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSessionDM {
  @JsonKey(name: 'user')
  UserDM get user;
  @JsonKey(name: 'message')
  String? get welcomeMessage;
  @JsonKey(name: 'token_created_at')
  String? get tokedCreatedAt;
  @JsonKey(name: 'token')
  String? get token;
  @JsonKey(name: 'token_type')
  String? get tokenType;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @JsonKey(name: 'access_token')
  String? get accessToken;

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<UserSessionDM> get copyWith =>
      _$UserSessionDMCopyWithImpl<UserSessionDM>(
          this as UserSessionDM, _$identity);

  /// Serializes this UserSessionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserSessionDM &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.welcomeMessage, welcomeMessage) ||
                other.welcomeMessage == welcomeMessage) &&
            (identical(other.tokedCreatedAt, tokedCreatedAt) ||
                other.tokedCreatedAt == tokedCreatedAt) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, welcomeMessage,
      tokedCreatedAt, token, tokenType, refreshToken, accessToken);

  @override
  String toString() {
    return 'UserSessionDM(user: $user, welcomeMessage: $welcomeMessage, tokedCreatedAt: $tokedCreatedAt, token: $token, tokenType: $tokenType, refreshToken: $refreshToken, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class $UserSessionDMCopyWith<$Res> {
  factory $UserSessionDMCopyWith(
          UserSessionDM value, $Res Function(UserSessionDM) _then) =
      _$UserSessionDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user') UserDM user,
      @JsonKey(name: 'message') String? welcomeMessage,
      @JsonKey(name: 'token_created_at') String? tokedCreatedAt,
      @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'token_type') String? tokenType,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      @JsonKey(name: 'access_token') String? accessToken});

  $UserDMCopyWith<$Res> get user;
}

/// @nodoc
class _$UserSessionDMCopyWithImpl<$Res>
    implements $UserSessionDMCopyWith<$Res> {
  _$UserSessionDMCopyWithImpl(this._self, this._then);

  final UserSessionDM _self;
  final $Res Function(UserSessionDM) _then;

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? welcomeMessage = freezed,
    Object? tokedCreatedAt = freezed,
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? refreshToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_self.copyWith(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDM,
      welcomeMessage: freezed == welcomeMessage
          ? _self.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      tokedCreatedAt: freezed == tokedCreatedAt
          ? _self.tokedCreatedAt
          : tokedCreatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDMCopyWith<$Res> get user {
    return $UserDMCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserSessionDM].
extension UserSessionDMPatterns on UserSessionDM {
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
    TResult Function(_UserSessionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSessionDM() when $default != null:
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
    TResult Function(_UserSessionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSessionDM():
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
    TResult? Function(_UserSessionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSessionDM() when $default != null:
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
            @JsonKey(name: 'user') UserDM user,
            @JsonKey(name: 'message') String? welcomeMessage,
            @JsonKey(name: 'token_created_at') String? tokedCreatedAt,
            @JsonKey(name: 'token') String? token,
            @JsonKey(name: 'token_type') String? tokenType,
            @JsonKey(name: 'refresh_token') String? refreshToken,
            @JsonKey(name: 'access_token') String? accessToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSessionDM() when $default != null:
        return $default(
            _that.user,
            _that.welcomeMessage,
            _that.tokedCreatedAt,
            _that.token,
            _that.tokenType,
            _that.refreshToken,
            _that.accessToken);
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
            @JsonKey(name: 'user') UserDM user,
            @JsonKey(name: 'message') String? welcomeMessage,
            @JsonKey(name: 'token_created_at') String? tokedCreatedAt,
            @JsonKey(name: 'token') String? token,
            @JsonKey(name: 'token_type') String? tokenType,
            @JsonKey(name: 'refresh_token') String? refreshToken,
            @JsonKey(name: 'access_token') String? accessToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSessionDM():
        return $default(
            _that.user,
            _that.welcomeMessage,
            _that.tokedCreatedAt,
            _that.token,
            _that.tokenType,
            _that.refreshToken,
            _that.accessToken);
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
            @JsonKey(name: 'user') UserDM user,
            @JsonKey(name: 'message') String? welcomeMessage,
            @JsonKey(name: 'token_created_at') String? tokedCreatedAt,
            @JsonKey(name: 'token') String? token,
            @JsonKey(name: 'token_type') String? tokenType,
            @JsonKey(name: 'refresh_token') String? refreshToken,
            @JsonKey(name: 'access_token') String? accessToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSessionDM() when $default != null:
        return $default(
            _that.user,
            _that.welcomeMessage,
            _that.tokedCreatedAt,
            _that.token,
            _that.tokenType,
            _that.refreshToken,
            _that.accessToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserSessionDM extends UserSessionDM {
  const _UserSessionDM(
      {@JsonKey(name: 'user') required this.user,
      @JsonKey(name: 'message') this.welcomeMessage,
      @JsonKey(name: 'token_created_at') this.tokedCreatedAt,
      @JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'token_type') this.tokenType,
      @JsonKey(name: 'refresh_token') this.refreshToken,
      @JsonKey(name: 'access_token') this.accessToken})
      : super._();
  factory _UserSessionDM.fromJson(Map<String, dynamic> json) =>
      _$UserSessionDMFromJson(json);

  @override
  @JsonKey(name: 'user')
  final UserDM user;
  @override
  @JsonKey(name: 'message')
  final String? welcomeMessage;
  @override
  @JsonKey(name: 'token_created_at')
  final String? tokedCreatedAt;
  @override
  @JsonKey(name: 'token')
  final String? token;
  @override
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserSessionDMCopyWith<_UserSessionDM> get copyWith =>
      __$UserSessionDMCopyWithImpl<_UserSessionDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserSessionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSessionDM &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.welcomeMessage, welcomeMessage) ||
                other.welcomeMessage == welcomeMessage) &&
            (identical(other.tokedCreatedAt, tokedCreatedAt) ||
                other.tokedCreatedAt == tokedCreatedAt) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, welcomeMessage,
      tokedCreatedAt, token, tokenType, refreshToken, accessToken);

  @override
  String toString() {
    return 'UserSessionDM(user: $user, welcomeMessage: $welcomeMessage, tokedCreatedAt: $tokedCreatedAt, token: $token, tokenType: $tokenType, refreshToken: $refreshToken, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class _$UserSessionDMCopyWith<$Res>
    implements $UserSessionDMCopyWith<$Res> {
  factory _$UserSessionDMCopyWith(
          _UserSessionDM value, $Res Function(_UserSessionDM) _then) =
      __$UserSessionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user') UserDM user,
      @JsonKey(name: 'message') String? welcomeMessage,
      @JsonKey(name: 'token_created_at') String? tokedCreatedAt,
      @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'token_type') String? tokenType,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      @JsonKey(name: 'access_token') String? accessToken});

  @override
  $UserDMCopyWith<$Res> get user;
}

/// @nodoc
class __$UserSessionDMCopyWithImpl<$Res>
    implements _$UserSessionDMCopyWith<$Res> {
  __$UserSessionDMCopyWithImpl(this._self, this._then);

  final _UserSessionDM _self;
  final $Res Function(_UserSessionDM) _then;

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? welcomeMessage = freezed,
    Object? tokedCreatedAt = freezed,
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? refreshToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_UserSessionDM(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDM,
      welcomeMessage: freezed == welcomeMessage
          ? _self.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      tokedCreatedAt: freezed == tokedCreatedAt
          ? _self.tokedCreatedAt
          : tokedCreatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDMCopyWith<$Res> get user {
    return $UserDMCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
