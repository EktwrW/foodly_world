// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_body_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBodyUpdateDTO _$UserBodyUpdateDTOFromJson(Map<String, dynamic> json) {
  return _UserBodyUpdateDTO.fromJson(json);
}

/// @nodoc
mixin _$UserBodyUpdateDTO {
  @JsonKey(name: 'username')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_password')
  String? get newPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_code')
  String? get zipCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  FoodlyCountries? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  UserRole? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this UserBodyUpdateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBodyUpdateDTOCopyWith<UserBodyUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBodyUpdateDTOCopyWith<$Res> {
  factory $UserBodyUpdateDTOCopyWith(
          UserBodyUpdateDTO value, $Res Function(UserBodyUpdateDTO) then) =
      _$UserBodyUpdateDTOCopyWithImpl<$Res, UserBodyUpdateDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? userName,
      @JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'current_password') String? password,
      @JsonKey(name: 'new_password') String? newPassword,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
      @JsonKey(name: 'zip_code') String? zipCode,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'country') FoodlyCountries? country,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'role_id') UserRole? roleId,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude});
}

/// @nodoc
class _$UserBodyUpdateDTOCopyWithImpl<$Res, $Val extends UserBodyUpdateDTO>
    implements $UserBodyUpdateDTOCopyWith<$Res> {
  _$UserBodyUpdateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? newPassword = freezed,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? zipCode = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? gender = freezed,
    Object? roleId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBodyUpdateDTOImplCopyWith<$Res>
    implements $UserBodyUpdateDTOCopyWith<$Res> {
  factory _$$UserBodyUpdateDTOImplCopyWith(_$UserBodyUpdateDTOImpl value,
          $Res Function(_$UserBodyUpdateDTOImpl) then) =
      __$$UserBodyUpdateDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? userName,
      @JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'current_password') String? password,
      @JsonKey(name: 'new_password') String? newPassword,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
      @JsonKey(name: 'zip_code') String? zipCode,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'country') FoodlyCountries? country,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'role_id') UserRole? roleId,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude});
}

/// @nodoc
class __$$UserBodyUpdateDTOImplCopyWithImpl<$Res>
    extends _$UserBodyUpdateDTOCopyWithImpl<$Res, _$UserBodyUpdateDTOImpl>
    implements _$$UserBodyUpdateDTOImplCopyWith<$Res> {
  __$$UserBodyUpdateDTOImplCopyWithImpl(_$UserBodyUpdateDTOImpl _value,
      $Res Function(_$UserBodyUpdateDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? newPassword = freezed,
    Object? phone = freezed,
    Object? dateOfBirth = freezed,
    Object? zipCode = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? gender = freezed,
    Object? roleId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$UserBodyUpdateDTOImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBodyUpdateDTOImpl implements _UserBodyUpdateDTO {
  const _$UserBodyUpdateDTOImpl(
      {@JsonKey(name: 'username') this.userName,
      @JsonKey(name: 'name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'current_password') this.password,
      @JsonKey(name: 'new_password') this.newPassword,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      @JsonKey(name: 'zip_code') this.zipCode,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'role_id') this.roleId,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude});

  factory _$UserBodyUpdateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBodyUpdateDTOImplFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String? userName;
  @override
  @JsonKey(name: 'name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'current_password')
  final String? password;
  @override
  @JsonKey(name: 'new_password')
  final String? newPassword;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: 'zip_code')
  final String? zipCode;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'country')
  final FoodlyCountries? country;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'role_id')
  final UserRole? roleId;
  @override
  @JsonKey(name: 'latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;

  @override
  String toString() {
    return 'UserBodyUpdateDTO(userName: $userName, firstName: $firstName, lastName: $lastName, email: $email, password: $password, newPassword: $newPassword, phone: $phone, dateOfBirth: $dateOfBirth, zipCode: $zipCode, address: $address, city: $city, country: $country, gender: $gender, roleId: $roleId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBodyUpdateDTOImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      firstName,
      lastName,
      email,
      password,
      newPassword,
      phone,
      dateOfBirth,
      zipCode,
      address,
      city,
      country,
      gender,
      roleId,
      latitude,
      longitude);

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBodyUpdateDTOImplCopyWith<_$UserBodyUpdateDTOImpl> get copyWith =>
      __$$UserBodyUpdateDTOImplCopyWithImpl<_$UserBodyUpdateDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBodyUpdateDTOImplToJson(
      this,
    );
  }
}

abstract class _UserBodyUpdateDTO implements UserBodyUpdateDTO {
  const factory _UserBodyUpdateDTO(
          {@JsonKey(name: 'username') final String? userName,
          @JsonKey(name: 'name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'current_password') final String? password,
          @JsonKey(name: 'new_password') final String? newPassword,
          @JsonKey(name: 'phone') final String? phone,
          @JsonKey(name: 'date_of_birth') final DateTime? dateOfBirth,
          @JsonKey(name: 'zip_code') final String? zipCode,
          @JsonKey(name: 'address') final String? address,
          @JsonKey(name: 'city') final String? city,
          @JsonKey(name: 'country') final FoodlyCountries? country,
          @JsonKey(name: 'gender') final String? gender,
          @JsonKey(name: 'role_id') final UserRole? roleId,
          @JsonKey(name: 'latitude') final double? latitude,
          @JsonKey(name: 'longitude') final double? longitude}) =
      _$UserBodyUpdateDTOImpl;

  factory _UserBodyUpdateDTO.fromJson(Map<String, dynamic> json) =
      _$UserBodyUpdateDTOImpl.fromJson;

  @override
  @JsonKey(name: 'username')
  String? get userName;
  @override
  @JsonKey(name: 'name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'current_password')
  String? get password;
  @override
  @JsonKey(name: 'new_password')
  String? get newPassword;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: 'zip_code')
  String? get zipCode;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'country')
  FoodlyCountries? get country;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'role_id')
  UserRole? get roleId;
  @override
  @JsonKey(name: 'latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBodyUpdateDTOImplCopyWith<_$UserBodyUpdateDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
