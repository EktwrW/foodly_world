// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_details_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationDetailsDM {
  String? get countryCode;
  Position? get position;
  String? get country;
  String? get state;
  String? get city;
  String? get address;
  String? get zipCode;
  bool get serviceEnabled;
  LocationPermission get permission;

  /// Create a copy of LocationDetailsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationDetailsDMCopyWith<LocationDetailsDM> get copyWith =>
      _$LocationDetailsDMCopyWithImpl<LocationDetailsDM>(
          this as LocationDetailsDM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationDetailsDM &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.serviceEnabled, serviceEnabled) ||
                other.serviceEnabled == serviceEnabled) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCode, position, country,
      state, city, address, zipCode, serviceEnabled, permission);

  @override
  String toString() {
    return 'LocationDetailsDM(countryCode: $countryCode, position: $position, country: $country, state: $state, city: $city, address: $address, zipCode: $zipCode, serviceEnabled: $serviceEnabled, permission: $permission)';
  }
}

/// @nodoc
abstract mixin class $LocationDetailsDMCopyWith<$Res> {
  factory $LocationDetailsDMCopyWith(
          LocationDetailsDM value, $Res Function(LocationDetailsDM) _then) =
      _$LocationDetailsDMCopyWithImpl;
  @useResult
  $Res call(
      {String? countryCode,
      Position? position,
      String? country,
      String? state,
      String? city,
      String? address,
      String? zipCode,
      bool serviceEnabled,
      LocationPermission permission});
}

/// @nodoc
class _$LocationDetailsDMCopyWithImpl<$Res>
    implements $LocationDetailsDMCopyWith<$Res> {
  _$LocationDetailsDMCopyWithImpl(this._self, this._then);

  final LocationDetailsDM _self;
  final $Res Function(LocationDetailsDM) _then;

  /// Create a copy of LocationDetailsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? position = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? zipCode = freezed,
    Object? serviceEnabled = null,
    Object? permission = null,
  }) {
    return _then(_self.copyWith(
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceEnabled: null == serviceEnabled
          ? _self.serviceEnabled
          : serviceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as LocationPermission,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationDetailsDM].
extension LocationDetailsDMPatterns on LocationDetailsDM {
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
    TResult Function(_LocationDetailsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationDetailsDM() when $default != null:
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
    TResult Function(_LocationDetailsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDetailsDM():
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
    TResult? Function(_LocationDetailsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDetailsDM() when $default != null:
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
            String? countryCode,
            Position? position,
            String? country,
            String? state,
            String? city,
            String? address,
            String? zipCode,
            bool serviceEnabled,
            LocationPermission permission)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationDetailsDM() when $default != null:
        return $default(
            _that.countryCode,
            _that.position,
            _that.country,
            _that.state,
            _that.city,
            _that.address,
            _that.zipCode,
            _that.serviceEnabled,
            _that.permission);
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
            String? countryCode,
            Position? position,
            String? country,
            String? state,
            String? city,
            String? address,
            String? zipCode,
            bool serviceEnabled,
            LocationPermission permission)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDetailsDM():
        return $default(
            _that.countryCode,
            _that.position,
            _that.country,
            _that.state,
            _that.city,
            _that.address,
            _that.zipCode,
            _that.serviceEnabled,
            _that.permission);
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
            String? countryCode,
            Position? position,
            String? country,
            String? state,
            String? city,
            String? address,
            String? zipCode,
            bool serviceEnabled,
            LocationPermission permission)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationDetailsDM() when $default != null:
        return $default(
            _that.countryCode,
            _that.position,
            _that.country,
            _that.state,
            _that.city,
            _that.address,
            _that.zipCode,
            _that.serviceEnabled,
            _that.permission);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocationDetailsDM implements LocationDetailsDM {
  const _LocationDetailsDM(
      {this.countryCode,
      this.position,
      this.country,
      this.state,
      this.city,
      this.address,
      this.zipCode,
      this.serviceEnabled = false,
      this.permission = LocationPermission.unableToDetermine});

  @override
  final String? countryCode;
  @override
  final Position? position;
  @override
  final String? country;
  @override
  final String? state;
  @override
  final String? city;
  @override
  final String? address;
  @override
  final String? zipCode;
  @override
  @JsonKey()
  final bool serviceEnabled;
  @override
  @JsonKey()
  final LocationPermission permission;

  /// Create a copy of LocationDetailsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationDetailsDMCopyWith<_LocationDetailsDM> get copyWith =>
      __$LocationDetailsDMCopyWithImpl<_LocationDetailsDM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationDetailsDM &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.serviceEnabled, serviceEnabled) ||
                other.serviceEnabled == serviceEnabled) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCode, position, country,
      state, city, address, zipCode, serviceEnabled, permission);

  @override
  String toString() {
    return 'LocationDetailsDM(countryCode: $countryCode, position: $position, country: $country, state: $state, city: $city, address: $address, zipCode: $zipCode, serviceEnabled: $serviceEnabled, permission: $permission)';
  }
}

/// @nodoc
abstract mixin class _$LocationDetailsDMCopyWith<$Res>
    implements $LocationDetailsDMCopyWith<$Res> {
  factory _$LocationDetailsDMCopyWith(
          _LocationDetailsDM value, $Res Function(_LocationDetailsDM) _then) =
      __$LocationDetailsDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? countryCode,
      Position? position,
      String? country,
      String? state,
      String? city,
      String? address,
      String? zipCode,
      bool serviceEnabled,
      LocationPermission permission});
}

/// @nodoc
class __$LocationDetailsDMCopyWithImpl<$Res>
    implements _$LocationDetailsDMCopyWith<$Res> {
  __$LocationDetailsDMCopyWithImpl(this._self, this._then);

  final _LocationDetailsDM _self;
  final $Res Function(_LocationDetailsDM) _then;

  /// Create a copy of LocationDetailsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? countryCode = freezed,
    Object? position = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? zipCode = freezed,
    Object? serviceEnabled = null,
    Object? permission = null,
  }) {
    return _then(_LocationDetailsDM(
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceEnabled: null == serviceEnabled
          ? _self.serviceEnabled
          : serviceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as LocationPermission,
    ));
  }
}

// dart format on
