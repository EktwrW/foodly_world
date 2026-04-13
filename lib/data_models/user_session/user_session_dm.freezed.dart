// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSessionDM _$UserSessionDMFromJson(Map<String, dynamic> json) {
  return _UserSessionDM.fromJson(json);
}

/// @nodoc
mixin _$UserSessionDM {
  @JsonKey(name: 'user')
  UserDM get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get welcomeMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_created_at')
  String? get tokedCreatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String? get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;

  /// Serializes this UserSessionDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSessionDMCopyWith<UserSessionDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSessionDMCopyWith<$Res> {
  factory $UserSessionDMCopyWith(
          UserSessionDM value, $Res Function(UserSessionDM) then) =
      _$UserSessionDMCopyWithImpl<$Res, UserSessionDM>;
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
class _$UserSessionDMCopyWithImpl<$Res, $Val extends UserSessionDM>
    implements $UserSessionDMCopyWith<$Res> {
  _$UserSessionDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDM,
      welcomeMessage: freezed == welcomeMessage
          ? _value.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      tokedCreatedAt: freezed == tokedCreatedAt
          ? _value.tokedCreatedAt
          : tokedCreatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDMCopyWith<$Res> get user {
    return $UserDMCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSessionDMImplCopyWith<$Res>
    implements $UserSessionDMCopyWith<$Res> {
  factory _$$UserSessionDMImplCopyWith(
          _$UserSessionDMImpl value, $Res Function(_$UserSessionDMImpl) then) =
      __$$UserSessionDMImplCopyWithImpl<$Res>;
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
class __$$UserSessionDMImplCopyWithImpl<$Res>
    extends _$UserSessionDMCopyWithImpl<$Res, _$UserSessionDMImpl>
    implements _$$UserSessionDMImplCopyWith<$Res> {
  __$$UserSessionDMImplCopyWithImpl(
      _$UserSessionDMImpl _value, $Res Function(_$UserSessionDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$UserSessionDMImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDM,
      welcomeMessage: freezed == welcomeMessage
          ? _value.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      tokedCreatedAt: freezed == tokedCreatedAt
          ? _value.tokedCreatedAt
          : tokedCreatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSessionDMImpl extends _UserSessionDM {
  const _$UserSessionDMImpl(
      {@JsonKey(name: 'user') required this.user,
      @JsonKey(name: 'message') this.welcomeMessage,
      @JsonKey(name: 'token_created_at') this.tokedCreatedAt,
      @JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'token_type') this.tokenType,
      @JsonKey(name: 'refresh_token') this.refreshToken,
      @JsonKey(name: 'access_token') this.accessToken})
      : super._();

  factory _$UserSessionDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSessionDMImplFromJson(json);

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

  @override
  String toString() {
    return 'UserSessionDM(user: $user, welcomeMessage: $welcomeMessage, tokedCreatedAt: $tokedCreatedAt, token: $token, tokenType: $tokenType, refreshToken: $refreshToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSessionDMImpl &&
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

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSessionDMImplCopyWith<_$UserSessionDMImpl> get copyWith =>
      __$$UserSessionDMImplCopyWithImpl<_$UserSessionDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSessionDMImplToJson(
      this,
    );
  }
}

abstract class _UserSessionDM extends UserSessionDM {
  const factory _UserSessionDM(
          {@JsonKey(name: 'user') required final UserDM user,
          @JsonKey(name: 'message') final String? welcomeMessage,
          @JsonKey(name: 'token_created_at') final String? tokedCreatedAt,
          @JsonKey(name: 'token') required final String? token,
          @JsonKey(name: 'token_type') final String? tokenType,
          @JsonKey(name: 'refresh_token') final String? refreshToken,
          @JsonKey(name: 'access_token') final String? accessToken}) =
      _$UserSessionDMImpl;
  const _UserSessionDM._() : super._();

  factory _UserSessionDM.fromJson(Map<String, dynamic> json) =
      _$UserSessionDMImpl.fromJson;

  @override
  @JsonKey(name: 'user')
  UserDM get user;
  @override
  @JsonKey(name: 'message')
  String? get welcomeMessage;
  @override
  @JsonKey(name: 'token_created_at')
  String? get tokedCreatedAt;
  @override
  @JsonKey(name: 'token')
  String? get token;
  @override
  @JsonKey(name: 'token_type')
  String? get tokenType;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;

  /// Create a copy of UserSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSessionDMImplCopyWith<_$UserSessionDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
