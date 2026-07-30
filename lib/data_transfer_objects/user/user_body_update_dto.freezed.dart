// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_body_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBodyUpdateDTO {
  @JsonKey(name: 'username')
  String? get userName;
  @JsonKey(name: 'name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  @JsonKey(name: 'email')
  String? get email;
  @JsonKey(name: 'current_password')
  String? get password;
  @JsonKey(name: 'new_password')
  String? get newPassword;
  @JsonKey(name: 'phone')
  String? get phone;
  @JsonKey(name: 'phone_country_code')
  String? get phoneCountryCode;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @JsonKey(name: 'zip_code')
  String? get zipCode;
  @JsonKey(name: 'address')
  String? get address;
  @JsonKey(name: 'city')
  String? get city;
  @JsonKey(name: 'country')
  FoodlyCountries? get country;
  @JsonKey(name: 'gender')
  String? get gender;
  @JsonKey(name: 'role_id')
  UserRole? get roleId;
  @JsonKey(name: 'latitude')
  double? get latitude;
  @JsonKey(name: 'longitude')
  double? get longitude;

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBodyUpdateDTOCopyWith<UserBodyUpdateDTO> get copyWith =>
      _$UserBodyUpdateDTOCopyWithImpl<UserBodyUpdateDTO>(
          this as UserBodyUpdateDTO, _$identity);

  /// Serializes this UserBodyUpdateDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBodyUpdateDTO &&
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
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
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
      phoneCountryCode,
      dateOfBirth,
      zipCode,
      address,
      city,
      country,
      gender,
      roleId,
      latitude,
      longitude);

  @override
  String toString() {
    return 'UserBodyUpdateDTO(userName: $userName, firstName: $firstName, lastName: $lastName, email: $email, password: $password, newPassword: $newPassword, phone: $phone, phoneCountryCode: $phoneCountryCode, dateOfBirth: $dateOfBirth, zipCode: $zipCode, address: $address, city: $city, country: $country, gender: $gender, roleId: $roleId, latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $UserBodyUpdateDTOCopyWith<$Res> {
  factory $UserBodyUpdateDTOCopyWith(
          UserBodyUpdateDTO value, $Res Function(UserBodyUpdateDTO) _then) =
      _$UserBodyUpdateDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? userName,
      @JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'current_password') String? password,
      @JsonKey(name: 'new_password') String? newPassword,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
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
class _$UserBodyUpdateDTOCopyWithImpl<$Res>
    implements $UserBodyUpdateDTOCopyWith<$Res> {
  _$UserBodyUpdateDTOCopyWithImpl(this._self, this._then);

  final UserBodyUpdateDTO _self;
  final $Res Function(UserBodyUpdateDTO) _then;

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
    Object? phoneCountryCode = freezed,
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
    return _then(_self.copyWith(
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserBodyUpdateDTO].
extension UserBodyUpdateDTOPatterns on UserBodyUpdateDTO {
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
    TResult Function(_UserBodyUpdateDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBodyUpdateDTO() when $default != null:
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
    TResult Function(_UserBodyUpdateDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodyUpdateDTO():
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
    TResult? Function(_UserBodyUpdateDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodyUpdateDTO() when $default != null:
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
            @JsonKey(name: 'username') String? userName,
            @JsonKey(name: 'name') String? firstName,
            @JsonKey(name: 'last_name') String? lastName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'current_password') String? password,
            @JsonKey(name: 'new_password') String? newPassword,
            @JsonKey(name: 'phone') String? phone,
            @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
            @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
            @JsonKey(name: 'zip_code') String? zipCode,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'city') String? city,
            @JsonKey(name: 'country') FoodlyCountries? country,
            @JsonKey(name: 'gender') String? gender,
            @JsonKey(name: 'role_id') UserRole? roleId,
            @JsonKey(name: 'latitude') double? latitude,
            @JsonKey(name: 'longitude') double? longitude)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBodyUpdateDTO() when $default != null:
        return $default(
            _that.userName,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.password,
            _that.newPassword,
            _that.phone,
            _that.phoneCountryCode,
            _that.dateOfBirth,
            _that.zipCode,
            _that.address,
            _that.city,
            _that.country,
            _that.gender,
            _that.roleId,
            _that.latitude,
            _that.longitude);
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
            @JsonKey(name: 'username') String? userName,
            @JsonKey(name: 'name') String? firstName,
            @JsonKey(name: 'last_name') String? lastName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'current_password') String? password,
            @JsonKey(name: 'new_password') String? newPassword,
            @JsonKey(name: 'phone') String? phone,
            @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
            @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
            @JsonKey(name: 'zip_code') String? zipCode,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'city') String? city,
            @JsonKey(name: 'country') FoodlyCountries? country,
            @JsonKey(name: 'gender') String? gender,
            @JsonKey(name: 'role_id') UserRole? roleId,
            @JsonKey(name: 'latitude') double? latitude,
            @JsonKey(name: 'longitude') double? longitude)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodyUpdateDTO():
        return $default(
            _that.userName,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.password,
            _that.newPassword,
            _that.phone,
            _that.phoneCountryCode,
            _that.dateOfBirth,
            _that.zipCode,
            _that.address,
            _that.city,
            _that.country,
            _that.gender,
            _that.roleId,
            _that.latitude,
            _that.longitude);
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
            @JsonKey(name: 'username') String? userName,
            @JsonKey(name: 'name') String? firstName,
            @JsonKey(name: 'last_name') String? lastName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'current_password') String? password,
            @JsonKey(name: 'new_password') String? newPassword,
            @JsonKey(name: 'phone') String? phone,
            @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
            @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
            @JsonKey(name: 'zip_code') String? zipCode,
            @JsonKey(name: 'address') String? address,
            @JsonKey(name: 'city') String? city,
            @JsonKey(name: 'country') FoodlyCountries? country,
            @JsonKey(name: 'gender') String? gender,
            @JsonKey(name: 'role_id') UserRole? roleId,
            @JsonKey(name: 'latitude') double? latitude,
            @JsonKey(name: 'longitude') double? longitude)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodyUpdateDTO() when $default != null:
        return $default(
            _that.userName,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.password,
            _that.newPassword,
            _that.phone,
            _that.phoneCountryCode,
            _that.dateOfBirth,
            _that.zipCode,
            _that.address,
            _that.city,
            _that.country,
            _that.gender,
            _that.roleId,
            _that.latitude,
            _that.longitude);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserBodyUpdateDTO implements UserBodyUpdateDTO {
  const _UserBodyUpdateDTO(
      {@JsonKey(name: 'username') this.userName,
      @JsonKey(name: 'name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'current_password') this.password,
      @JsonKey(name: 'new_password') this.newPassword,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'phone_country_code') this.phoneCountryCode,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      @JsonKey(name: 'zip_code') this.zipCode,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'role_id') this.roleId,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude});
  factory _UserBodyUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$UserBodyUpdateDTOFromJson(json);

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
  @JsonKey(name: 'phone_country_code')
  final String? phoneCountryCode;
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

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBodyUpdateDTOCopyWith<_UserBodyUpdateDTO> get copyWith =>
      __$UserBodyUpdateDTOCopyWithImpl<_UserBodyUpdateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBodyUpdateDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBodyUpdateDTO &&
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
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
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
      phoneCountryCode,
      dateOfBirth,
      zipCode,
      address,
      city,
      country,
      gender,
      roleId,
      latitude,
      longitude);

  @override
  String toString() {
    return 'UserBodyUpdateDTO(userName: $userName, firstName: $firstName, lastName: $lastName, email: $email, password: $password, newPassword: $newPassword, phone: $phone, phoneCountryCode: $phoneCountryCode, dateOfBirth: $dateOfBirth, zipCode: $zipCode, address: $address, city: $city, country: $country, gender: $gender, roleId: $roleId, latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$UserBodyUpdateDTOCopyWith<$Res>
    implements $UserBodyUpdateDTOCopyWith<$Res> {
  factory _$UserBodyUpdateDTOCopyWith(
          _UserBodyUpdateDTO value, $Res Function(_UserBodyUpdateDTO) _then) =
      __$UserBodyUpdateDTOCopyWithImpl;
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
      @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
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
class __$UserBodyUpdateDTOCopyWithImpl<$Res>
    implements _$UserBodyUpdateDTOCopyWith<$Res> {
  __$UserBodyUpdateDTOCopyWithImpl(this._self, this._then);

  final _UserBodyUpdateDTO _self;
  final $Res Function(_UserBodyUpdateDTO) _then;

  /// Create a copy of UserBodyUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? newPassword = freezed,
    Object? phone = freezed,
    Object? phoneCountryCode = freezed,
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
    return _then(_UserBodyUpdateDTO(
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
