// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalAuthDTO {
  bool get deviceIsSupported => throw _privateConstructorUsedError;
  bool get isAuthenticating => throw _privateConstructorUsedError;
  bool get canCheckBiometrics => throw _privateConstructorUsedError;
  List<BiometricType> get availableBiometrics =>
      throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;
  UserSessionDM get userSessionDM => throw _privateConstructorUsedError;

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalAuthDTOCopyWith<LocalAuthDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAuthDTOCopyWith<$Res> {
  factory $LocalAuthDTOCopyWith(
          LocalAuthDTO value, $Res Function(LocalAuthDTO) then) =
      _$LocalAuthDTOCopyWithImpl<$Res, LocalAuthDTO>;
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
class _$LocalAuthDTOCopyWithImpl<$Res, $Val extends LocalAuthDTO>
    implements $LocalAuthDTOCopyWith<$Res> {
  _$LocalAuthDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      deviceIsSupported: null == deviceIsSupported
          ? _value.deviceIsSupported
          : deviceIsSupported // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      canCheckBiometrics: null == canCheckBiometrics
          ? _value.canCheckBiometrics
          : canCheckBiometrics // ignore: cast_nullable_to_non_nullable
              as bool,
      availableBiometrics: null == availableBiometrics
          ? _value.availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userSessionDM: null == userSessionDM
          ? _value.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ) as $Val);
  }

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_value.userSessionDM, (value) {
      return _then(_value.copyWith(userSessionDM: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalAuthDTOImplCopyWith<$Res>
    implements $LocalAuthDTOCopyWith<$Res> {
  factory _$$LocalAuthDTOImplCopyWith(
          _$LocalAuthDTOImpl value, $Res Function(_$LocalAuthDTOImpl) then) =
      __$$LocalAuthDTOImplCopyWithImpl<$Res>;
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
class __$$LocalAuthDTOImplCopyWithImpl<$Res>
    extends _$LocalAuthDTOCopyWithImpl<$Res, _$LocalAuthDTOImpl>
    implements _$$LocalAuthDTOImplCopyWith<$Res> {
  __$$LocalAuthDTOImplCopyWithImpl(
      _$LocalAuthDTOImpl _value, $Res Function(_$LocalAuthDTOImpl) _then)
      : super(_value, _then);

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
    return _then(_$LocalAuthDTOImpl(
      deviceIsSupported: null == deviceIsSupported
          ? _value.deviceIsSupported
          : deviceIsSupported // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      canCheckBiometrics: null == canCheckBiometrics
          ? _value.canCheckBiometrics
          : canCheckBiometrics // ignore: cast_nullable_to_non_nullable
              as bool,
      availableBiometrics: null == availableBiometrics
          ? _value._availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userSessionDM: null == userSessionDM
          ? _value.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
    ));
  }
}

/// @nodoc

class _$LocalAuthDTOImpl implements _LocalAuthDTO {
  const _$LocalAuthDTOImpl(
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

  @override
  String toString() {
    return 'LocalAuthDTO(deviceIsSupported: $deviceIsSupported, isAuthenticating: $isAuthenticating, canCheckBiometrics: $canCheckBiometrics, availableBiometrics: $availableBiometrics, authenticated: $authenticated, userSessionDM: $userSessionDM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAuthDTOImpl &&
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

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAuthDTOImplCopyWith<_$LocalAuthDTOImpl> get copyWith =>
      __$$LocalAuthDTOImplCopyWithImpl<_$LocalAuthDTOImpl>(this, _$identity);
}

abstract class _LocalAuthDTO implements LocalAuthDTO {
  const factory _LocalAuthDTO(
      {final bool deviceIsSupported,
      final bool isAuthenticating,
      final bool canCheckBiometrics,
      final List<BiometricType> availableBiometrics,
      final bool authenticated,
      final UserSessionDM userSessionDM}) = _$LocalAuthDTOImpl;

  @override
  bool get deviceIsSupported;
  @override
  bool get isAuthenticating;
  @override
  bool get canCheckBiometrics;
  @override
  List<BiometricType> get availableBiometrics;
  @override
  bool get authenticated;
  @override
  UserSessionDM get userSessionDM;

  /// Create a copy of LocalAuthDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalAuthDTOImplCopyWith<_$LocalAuthDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
