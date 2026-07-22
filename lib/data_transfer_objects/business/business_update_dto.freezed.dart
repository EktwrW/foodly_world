// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessUpdateDTO {
  @JsonKey(name: 'business_name')
  String? get businessName;
  @JsonKey(name: 'business_about_us')
  String? get businessAboutUs;
  @JsonKey(name: 'business_additional_info')
  String? get businessAdditionalInfo;
  @JsonKey(name: 'business_services')
  List<BusinessServices>? get businessServices;
  @JsonKey(name: 'business_email')
  String? get businessEmail;
  @JsonKey(name: 'business_phone')
  String? get businessPhone;
  @JsonKey(name: 'business_address')
  String? get businessAddress;
  @JsonKey(name: 'business_zipcode')
  String? get businessZipcode;
  @JsonKey(name: 'business_city')
  String? get businessCity;
  @JsonKey(name: 'business_country')
  FoodlyCountries? get businessCountry;
  @JsonKey(name: 'business_website')
  String? get businessWebsite;
  @JsonKey(name: 'business_latitude')
  double? get businessLatitude;
  @JsonKey(name: 'business_longitude')
  double? get businessLongitude;
  @JsonKey(name: 'category_id')
  FoodlyCategories? get category;
  @JsonKey(name: 'business_opening_hours')
  BusinessDays? get businessDays;
  @JsonKey(name: 'allow_reservations')
  bool? get allowReservations;
  @JsonKey(name: 'reservation_size_limit')
  int? get reservationSizeLimit;
  @JsonKey(name: 'menu_enabled')
  bool? get menuEnabled;
  @JsonKey(name: 'combos_label')
  String? get combosLabel;

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessUpdateDTOCopyWith<BusinessUpdateDTO> get copyWith =>
      _$BusinessUpdateDTOCopyWithImpl<BusinessUpdateDTO>(
          this as BusinessUpdateDTO, _$identity);

  /// Serializes this BusinessUpdateDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessUpdateDTO &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessAboutUs, businessAboutUs) ||
                other.businessAboutUs == businessAboutUs) &&
            (identical(other.businessAdditionalInfo, businessAdditionalInfo) ||
                other.businessAdditionalInfo == businessAdditionalInfo) &&
            const DeepCollectionEquality()
                .equals(other.businessServices, businessServices) &&
            (identical(other.businessEmail, businessEmail) ||
                other.businessEmail == businessEmail) &&
            (identical(other.businessPhone, businessPhone) ||
                other.businessPhone == businessPhone) &&
            (identical(other.businessAddress, businessAddress) ||
                other.businessAddress == businessAddress) &&
            (identical(other.businessZipcode, businessZipcode) ||
                other.businessZipcode == businessZipcode) &&
            (identical(other.businessCity, businessCity) ||
                other.businessCity == businessCity) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.businessWebsite, businessWebsite) ||
                other.businessWebsite == businessWebsite) &&
            (identical(other.businessLatitude, businessLatitude) ||
                other.businessLatitude == businessLatitude) &&
            (identical(other.businessLongitude, businessLongitude) ||
                other.businessLongitude == businessLongitude) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.businessDays, businessDays) ||
                other.businessDays == businessDays) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations) &&
            (identical(other.reservationSizeLimit, reservationSizeLimit) ||
                other.reservationSizeLimit == reservationSizeLimit) &&
            (identical(other.menuEnabled, menuEnabled) ||
                other.menuEnabled == menuEnabled) &&
            (identical(other.combosLabel, combosLabel) ||
                other.combosLabel == combosLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        businessName,
        businessAboutUs,
        businessAdditionalInfo,
        const DeepCollectionEquality().hash(businessServices),
        businessEmail,
        businessPhone,
        businessAddress,
        businessZipcode,
        businessCity,
        businessCountry,
        businessWebsite,
        businessLatitude,
        businessLongitude,
        category,
        businessDays,
        allowReservations,
        reservationSizeLimit,
        menuEnabled,
        combosLabel
      ]);

  @override
  String toString() {
    return 'BusinessUpdateDTO(businessName: $businessName, businessAboutUs: $businessAboutUs, businessAdditionalInfo: $businessAdditionalInfo, businessServices: $businessServices, businessEmail: $businessEmail, businessPhone: $businessPhone, businessAddress: $businessAddress, businessZipcode: $businessZipcode, businessCity: $businessCity, businessCountry: $businessCountry, businessWebsite: $businessWebsite, businessLatitude: $businessLatitude, businessLongitude: $businessLongitude, category: $category, businessDays: $businessDays, allowReservations: $allowReservations, reservationSizeLimit: $reservationSizeLimit, menuEnabled: $menuEnabled, combosLabel: $combosLabel)';
  }
}

/// @nodoc
abstract mixin class $BusinessUpdateDTOCopyWith<$Res> {
  factory $BusinessUpdateDTOCopyWith(
          BusinessUpdateDTO value, $Res Function(BusinessUpdateDTO) _then) =
      _$BusinessUpdateDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_about_us') String? businessAboutUs,
      @JsonKey(name: 'business_additional_info') String? businessAdditionalInfo,
      @JsonKey(name: 'business_services')
      List<BusinessServices>? businessServices,
      @JsonKey(name: 'business_email') String? businessEmail,
      @JsonKey(name: 'business_phone') String? businessPhone,
      @JsonKey(name: 'business_address') String? businessAddress,
      @JsonKey(name: 'business_zipcode') String? businessZipcode,
      @JsonKey(name: 'business_city') String? businessCity,
      @JsonKey(name: 'business_country') FoodlyCountries? businessCountry,
      @JsonKey(name: 'business_website') String? businessWebsite,
      @JsonKey(name: 'business_latitude') double? businessLatitude,
      @JsonKey(name: 'business_longitude') double? businessLongitude,
      @JsonKey(name: 'category_id') FoodlyCategories? category,
      @JsonKey(name: 'business_opening_hours') BusinessDays? businessDays,
      @JsonKey(name: 'allow_reservations') bool? allowReservations,
      @JsonKey(name: 'reservation_size_limit') int? reservationSizeLimit,
      @JsonKey(name: 'menu_enabled') bool? menuEnabled,
      @JsonKey(name: 'combos_label') String? combosLabel});

  $BusinessDaysCopyWith<$Res>? get businessDays;
}

/// @nodoc
class _$BusinessUpdateDTOCopyWithImpl<$Res>
    implements $BusinessUpdateDTOCopyWith<$Res> {
  _$BusinessUpdateDTOCopyWithImpl(this._self, this._then);

  final BusinessUpdateDTO _self;
  final $Res Function(BusinessUpdateDTO) _then;

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessName = freezed,
    Object? businessAboutUs = freezed,
    Object? businessAdditionalInfo = freezed,
    Object? businessServices = freezed,
    Object? businessEmail = freezed,
    Object? businessPhone = freezed,
    Object? businessAddress = freezed,
    Object? businessZipcode = freezed,
    Object? businessCity = freezed,
    Object? businessCountry = freezed,
    Object? businessWebsite = freezed,
    Object? businessLatitude = freezed,
    Object? businessLongitude = freezed,
    Object? category = freezed,
    Object? businessDays = freezed,
    Object? allowReservations = freezed,
    Object? reservationSizeLimit = freezed,
    Object? menuEnabled = freezed,
    Object? combosLabel = freezed,
  }) {
    return _then(_self.copyWith(
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAboutUs: freezed == businessAboutUs
          ? _self.businessAboutUs
          : businessAboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAdditionalInfo: freezed == businessAdditionalInfo
          ? _self.businessAdditionalInfo
          : businessAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessServices: freezed == businessServices
          ? _self.businessServices
          : businessServices // ignore: cast_nullable_to_non_nullable
              as List<BusinessServices>?,
      businessEmail: freezed == businessEmail
          ? _self.businessEmail
          : businessEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhone: freezed == businessPhone
          ? _self.businessPhone
          : businessPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: freezed == businessAddress
          ? _self.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      businessZipcode: freezed == businessZipcode
          ? _self.businessZipcode
          : businessZipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCity: freezed == businessCity
          ? _self.businessCity
          : businessCity // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      businessWebsite: freezed == businessWebsite
          ? _self.businessWebsite
          : businessWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLatitude: freezed == businessLatitude
          ? _self.businessLatitude
          : businessLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessLongitude: freezed == businessLongitude
          ? _self.businessLongitude
          : businessLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      businessDays: freezed == businessDays
          ? _self.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays?,
      allowReservations: freezed == allowReservations
          ? _self.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool?,
      reservationSizeLimit: freezed == reservationSizeLimit
          ? _self.reservationSizeLimit
          : reservationSizeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      menuEnabled: freezed == menuEnabled
          ? _self.menuEnabled
          : menuEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      combosLabel: freezed == combosLabel
          ? _self.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res>? get businessDays {
    if (_self.businessDays == null) {
      return null;
    }

    return $BusinessDaysCopyWith<$Res>(_self.businessDays!, (value) {
      return _then(_self.copyWith(businessDays: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessUpdateDTO].
extension BusinessUpdateDTOPatterns on BusinessUpdateDTO {
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
    TResult Function(_BusinessUpdateDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessUpdateDTO() when $default != null:
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
    TResult Function(_BusinessUpdateDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessUpdateDTO():
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
    TResult? Function(_BusinessUpdateDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessUpdateDTO() when $default != null:
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
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'business_about_us') String? businessAboutUs,
            @JsonKey(name: 'business_additional_info')
            String? businessAdditionalInfo,
            @JsonKey(name: 'business_services')
            List<BusinessServices>? businessServices,
            @JsonKey(name: 'business_email') String? businessEmail,
            @JsonKey(name: 'business_phone') String? businessPhone,
            @JsonKey(name: 'business_address') String? businessAddress,
            @JsonKey(name: 'business_zipcode') String? businessZipcode,
            @JsonKey(name: 'business_city') String? businessCity,
            @JsonKey(name: 'business_country') FoodlyCountries? businessCountry,
            @JsonKey(name: 'business_website') String? businessWebsite,
            @JsonKey(name: 'business_latitude') double? businessLatitude,
            @JsonKey(name: 'business_longitude') double? businessLongitude,
            @JsonKey(name: 'category_id') FoodlyCategories? category,
            @JsonKey(name: 'business_opening_hours') BusinessDays? businessDays,
            @JsonKey(name: 'allow_reservations') bool? allowReservations,
            @JsonKey(name: 'reservation_size_limit') int? reservationSizeLimit,
            @JsonKey(name: 'menu_enabled') bool? menuEnabled,
            @JsonKey(name: 'combos_label') String? combosLabel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessUpdateDTO() when $default != null:
        return $default(
            _that.businessName,
            _that.businessAboutUs,
            _that.businessAdditionalInfo,
            _that.businessServices,
            _that.businessEmail,
            _that.businessPhone,
            _that.businessAddress,
            _that.businessZipcode,
            _that.businessCity,
            _that.businessCountry,
            _that.businessWebsite,
            _that.businessLatitude,
            _that.businessLongitude,
            _that.category,
            _that.businessDays,
            _that.allowReservations,
            _that.reservationSizeLimit,
            _that.menuEnabled,
            _that.combosLabel);
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
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'business_about_us') String? businessAboutUs,
            @JsonKey(name: 'business_additional_info')
            String? businessAdditionalInfo,
            @JsonKey(name: 'business_services')
            List<BusinessServices>? businessServices,
            @JsonKey(name: 'business_email') String? businessEmail,
            @JsonKey(name: 'business_phone') String? businessPhone,
            @JsonKey(name: 'business_address') String? businessAddress,
            @JsonKey(name: 'business_zipcode') String? businessZipcode,
            @JsonKey(name: 'business_city') String? businessCity,
            @JsonKey(name: 'business_country') FoodlyCountries? businessCountry,
            @JsonKey(name: 'business_website') String? businessWebsite,
            @JsonKey(name: 'business_latitude') double? businessLatitude,
            @JsonKey(name: 'business_longitude') double? businessLongitude,
            @JsonKey(name: 'category_id') FoodlyCategories? category,
            @JsonKey(name: 'business_opening_hours') BusinessDays? businessDays,
            @JsonKey(name: 'allow_reservations') bool? allowReservations,
            @JsonKey(name: 'reservation_size_limit') int? reservationSizeLimit,
            @JsonKey(name: 'menu_enabled') bool? menuEnabled,
            @JsonKey(name: 'combos_label') String? combosLabel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessUpdateDTO():
        return $default(
            _that.businessName,
            _that.businessAboutUs,
            _that.businessAdditionalInfo,
            _that.businessServices,
            _that.businessEmail,
            _that.businessPhone,
            _that.businessAddress,
            _that.businessZipcode,
            _that.businessCity,
            _that.businessCountry,
            _that.businessWebsite,
            _that.businessLatitude,
            _that.businessLongitude,
            _that.category,
            _that.businessDays,
            _that.allowReservations,
            _that.reservationSizeLimit,
            _that.menuEnabled,
            _that.combosLabel);
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
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'business_about_us') String? businessAboutUs,
            @JsonKey(name: 'business_additional_info')
            String? businessAdditionalInfo,
            @JsonKey(name: 'business_services')
            List<BusinessServices>? businessServices,
            @JsonKey(name: 'business_email') String? businessEmail,
            @JsonKey(name: 'business_phone') String? businessPhone,
            @JsonKey(name: 'business_address') String? businessAddress,
            @JsonKey(name: 'business_zipcode') String? businessZipcode,
            @JsonKey(name: 'business_city') String? businessCity,
            @JsonKey(name: 'business_country') FoodlyCountries? businessCountry,
            @JsonKey(name: 'business_website') String? businessWebsite,
            @JsonKey(name: 'business_latitude') double? businessLatitude,
            @JsonKey(name: 'business_longitude') double? businessLongitude,
            @JsonKey(name: 'category_id') FoodlyCategories? category,
            @JsonKey(name: 'business_opening_hours') BusinessDays? businessDays,
            @JsonKey(name: 'allow_reservations') bool? allowReservations,
            @JsonKey(name: 'reservation_size_limit') int? reservationSizeLimit,
            @JsonKey(name: 'menu_enabled') bool? menuEnabled,
            @JsonKey(name: 'combos_label') String? combosLabel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessUpdateDTO() when $default != null:
        return $default(
            _that.businessName,
            _that.businessAboutUs,
            _that.businessAdditionalInfo,
            _that.businessServices,
            _that.businessEmail,
            _that.businessPhone,
            _that.businessAddress,
            _that.businessZipcode,
            _that.businessCity,
            _that.businessCountry,
            _that.businessWebsite,
            _that.businessLatitude,
            _that.businessLongitude,
            _that.category,
            _that.businessDays,
            _that.allowReservations,
            _that.reservationSizeLimit,
            _that.menuEnabled,
            _that.combosLabel);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessUpdateDTO implements BusinessUpdateDTO {
  const _BusinessUpdateDTO(
      {@JsonKey(name: 'business_name') this.businessName,
      @JsonKey(name: 'business_about_us') this.businessAboutUs,
      @JsonKey(name: 'business_additional_info') this.businessAdditionalInfo,
      @JsonKey(name: 'business_services')
      final List<BusinessServices>? businessServices,
      @JsonKey(name: 'business_email') this.businessEmail,
      @JsonKey(name: 'business_phone') this.businessPhone,
      @JsonKey(name: 'business_address') this.businessAddress,
      @JsonKey(name: 'business_zipcode') this.businessZipcode,
      @JsonKey(name: 'business_city') this.businessCity,
      @JsonKey(name: 'business_country') this.businessCountry,
      @JsonKey(name: 'business_website') this.businessWebsite,
      @JsonKey(name: 'business_latitude') this.businessLatitude,
      @JsonKey(name: 'business_longitude') this.businessLongitude,
      @JsonKey(name: 'category_id') this.category,
      @JsonKey(name: 'business_opening_hours') this.businessDays,
      @JsonKey(name: 'allow_reservations') this.allowReservations,
      @JsonKey(name: 'reservation_size_limit') this.reservationSizeLimit,
      @JsonKey(name: 'menu_enabled') this.menuEnabled,
      @JsonKey(name: 'combos_label') this.combosLabel})
      : _businessServices = businessServices;
  factory _BusinessUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$BusinessUpdateDTOFromJson(json);

  @override
  @JsonKey(name: 'business_name')
  final String? businessName;
  @override
  @JsonKey(name: 'business_about_us')
  final String? businessAboutUs;
  @override
  @JsonKey(name: 'business_additional_info')
  final String? businessAdditionalInfo;
  final List<BusinessServices>? _businessServices;
  @override
  @JsonKey(name: 'business_services')
  List<BusinessServices>? get businessServices {
    final value = _businessServices;
    if (value == null) return null;
    if (_businessServices is EqualUnmodifiableListView)
      return _businessServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'business_email')
  final String? businessEmail;
  @override
  @JsonKey(name: 'business_phone')
  final String? businessPhone;
  @override
  @JsonKey(name: 'business_address')
  final String? businessAddress;
  @override
  @JsonKey(name: 'business_zipcode')
  final String? businessZipcode;
  @override
  @JsonKey(name: 'business_city')
  final String? businessCity;
  @override
  @JsonKey(name: 'business_country')
  final FoodlyCountries? businessCountry;
  @override
  @JsonKey(name: 'business_website')
  final String? businessWebsite;
  @override
  @JsonKey(name: 'business_latitude')
  final double? businessLatitude;
  @override
  @JsonKey(name: 'business_longitude')
  final double? businessLongitude;
  @override
  @JsonKey(name: 'category_id')
  final FoodlyCategories? category;
  @override
  @JsonKey(name: 'business_opening_hours')
  final BusinessDays? businessDays;
  @override
  @JsonKey(name: 'allow_reservations')
  final bool? allowReservations;
  @override
  @JsonKey(name: 'reservation_size_limit')
  final int? reservationSizeLimit;
  @override
  @JsonKey(name: 'menu_enabled')
  final bool? menuEnabled;
  @override
  @JsonKey(name: 'combos_label')
  final String? combosLabel;

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessUpdateDTOCopyWith<_BusinessUpdateDTO> get copyWith =>
      __$BusinessUpdateDTOCopyWithImpl<_BusinessUpdateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessUpdateDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessUpdateDTO &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessAboutUs, businessAboutUs) ||
                other.businessAboutUs == businessAboutUs) &&
            (identical(other.businessAdditionalInfo, businessAdditionalInfo) ||
                other.businessAdditionalInfo == businessAdditionalInfo) &&
            const DeepCollectionEquality()
                .equals(other._businessServices, _businessServices) &&
            (identical(other.businessEmail, businessEmail) ||
                other.businessEmail == businessEmail) &&
            (identical(other.businessPhone, businessPhone) ||
                other.businessPhone == businessPhone) &&
            (identical(other.businessAddress, businessAddress) ||
                other.businessAddress == businessAddress) &&
            (identical(other.businessZipcode, businessZipcode) ||
                other.businessZipcode == businessZipcode) &&
            (identical(other.businessCity, businessCity) ||
                other.businessCity == businessCity) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.businessWebsite, businessWebsite) ||
                other.businessWebsite == businessWebsite) &&
            (identical(other.businessLatitude, businessLatitude) ||
                other.businessLatitude == businessLatitude) &&
            (identical(other.businessLongitude, businessLongitude) ||
                other.businessLongitude == businessLongitude) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.businessDays, businessDays) ||
                other.businessDays == businessDays) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations) &&
            (identical(other.reservationSizeLimit, reservationSizeLimit) ||
                other.reservationSizeLimit == reservationSizeLimit) &&
            (identical(other.menuEnabled, menuEnabled) ||
                other.menuEnabled == menuEnabled) &&
            (identical(other.combosLabel, combosLabel) ||
                other.combosLabel == combosLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        businessName,
        businessAboutUs,
        businessAdditionalInfo,
        const DeepCollectionEquality().hash(_businessServices),
        businessEmail,
        businessPhone,
        businessAddress,
        businessZipcode,
        businessCity,
        businessCountry,
        businessWebsite,
        businessLatitude,
        businessLongitude,
        category,
        businessDays,
        allowReservations,
        reservationSizeLimit,
        menuEnabled,
        combosLabel
      ]);

  @override
  String toString() {
    return 'BusinessUpdateDTO(businessName: $businessName, businessAboutUs: $businessAboutUs, businessAdditionalInfo: $businessAdditionalInfo, businessServices: $businessServices, businessEmail: $businessEmail, businessPhone: $businessPhone, businessAddress: $businessAddress, businessZipcode: $businessZipcode, businessCity: $businessCity, businessCountry: $businessCountry, businessWebsite: $businessWebsite, businessLatitude: $businessLatitude, businessLongitude: $businessLongitude, category: $category, businessDays: $businessDays, allowReservations: $allowReservations, reservationSizeLimit: $reservationSizeLimit, menuEnabled: $menuEnabled, combosLabel: $combosLabel)';
  }
}

/// @nodoc
abstract mixin class _$BusinessUpdateDTOCopyWith<$Res>
    implements $BusinessUpdateDTOCopyWith<$Res> {
  factory _$BusinessUpdateDTOCopyWith(
          _BusinessUpdateDTO value, $Res Function(_BusinessUpdateDTO) _then) =
      __$BusinessUpdateDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_about_us') String? businessAboutUs,
      @JsonKey(name: 'business_additional_info') String? businessAdditionalInfo,
      @JsonKey(name: 'business_services')
      List<BusinessServices>? businessServices,
      @JsonKey(name: 'business_email') String? businessEmail,
      @JsonKey(name: 'business_phone') String? businessPhone,
      @JsonKey(name: 'business_address') String? businessAddress,
      @JsonKey(name: 'business_zipcode') String? businessZipcode,
      @JsonKey(name: 'business_city') String? businessCity,
      @JsonKey(name: 'business_country') FoodlyCountries? businessCountry,
      @JsonKey(name: 'business_website') String? businessWebsite,
      @JsonKey(name: 'business_latitude') double? businessLatitude,
      @JsonKey(name: 'business_longitude') double? businessLongitude,
      @JsonKey(name: 'category_id') FoodlyCategories? category,
      @JsonKey(name: 'business_opening_hours') BusinessDays? businessDays,
      @JsonKey(name: 'allow_reservations') bool? allowReservations,
      @JsonKey(name: 'reservation_size_limit') int? reservationSizeLimit,
      @JsonKey(name: 'menu_enabled') bool? menuEnabled,
      @JsonKey(name: 'combos_label') String? combosLabel});

  @override
  $BusinessDaysCopyWith<$Res>? get businessDays;
}

/// @nodoc
class __$BusinessUpdateDTOCopyWithImpl<$Res>
    implements _$BusinessUpdateDTOCopyWith<$Res> {
  __$BusinessUpdateDTOCopyWithImpl(this._self, this._then);

  final _BusinessUpdateDTO _self;
  final $Res Function(_BusinessUpdateDTO) _then;

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businessName = freezed,
    Object? businessAboutUs = freezed,
    Object? businessAdditionalInfo = freezed,
    Object? businessServices = freezed,
    Object? businessEmail = freezed,
    Object? businessPhone = freezed,
    Object? businessAddress = freezed,
    Object? businessZipcode = freezed,
    Object? businessCity = freezed,
    Object? businessCountry = freezed,
    Object? businessWebsite = freezed,
    Object? businessLatitude = freezed,
    Object? businessLongitude = freezed,
    Object? category = freezed,
    Object? businessDays = freezed,
    Object? allowReservations = freezed,
    Object? reservationSizeLimit = freezed,
    Object? menuEnabled = freezed,
    Object? combosLabel = freezed,
  }) {
    return _then(_BusinessUpdateDTO(
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAboutUs: freezed == businessAboutUs
          ? _self.businessAboutUs
          : businessAboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAdditionalInfo: freezed == businessAdditionalInfo
          ? _self.businessAdditionalInfo
          : businessAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessServices: freezed == businessServices
          ? _self._businessServices
          : businessServices // ignore: cast_nullable_to_non_nullable
              as List<BusinessServices>?,
      businessEmail: freezed == businessEmail
          ? _self.businessEmail
          : businessEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhone: freezed == businessPhone
          ? _self.businessPhone
          : businessPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: freezed == businessAddress
          ? _self.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      businessZipcode: freezed == businessZipcode
          ? _self.businessZipcode
          : businessZipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCity: freezed == businessCity
          ? _self.businessCity
          : businessCity // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      businessWebsite: freezed == businessWebsite
          ? _self.businessWebsite
          : businessWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLatitude: freezed == businessLatitude
          ? _self.businessLatitude
          : businessLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessLongitude: freezed == businessLongitude
          ? _self.businessLongitude
          : businessLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      businessDays: freezed == businessDays
          ? _self.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays?,
      allowReservations: freezed == allowReservations
          ? _self.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool?,
      reservationSizeLimit: freezed == reservationSizeLimit
          ? _self.reservationSizeLimit
          : reservationSizeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      menuEnabled: freezed == menuEnabled
          ? _self.menuEnabled
          : menuEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      combosLabel: freezed == combosLabel
          ? _self.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res>? get businessDays {
    if (_self.businessDays == null) {
      return null;
    }

    return $BusinessDaysCopyWith<$Res>(_self.businessDays!, (value) {
      return _then(_self.copyWith(businessDays: value));
    });
  }
}

// dart format on
