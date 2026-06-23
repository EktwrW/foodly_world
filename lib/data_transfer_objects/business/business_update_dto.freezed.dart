// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessUpdateDTO _$BusinessUpdateDTOFromJson(Map<String, dynamic> json) {
  return _BusinessUpdateDTO.fromJson(json);
}

/// @nodoc
mixin _$BusinessUpdateDTO {
  @JsonKey(name: 'business_name')
  String? get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_about_us')
  String? get businessAboutUs => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_additional_info')
  String? get businessAdditionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_services')
  List<BusinessServices>? get businessServices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'business_email')
  String? get businessEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_phone')
  String? get businessPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_address')
  String? get businessAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_zipcode')
  String? get businessZipcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_city')
  String? get businessCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_country')
  FoodlyCountries? get businessCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_website')
  String? get businessWebsite => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_latitude')
  double? get businessLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_longitude')
  double? get businessLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  FoodlyCategories? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_opening_hours')
  BusinessDays? get businessDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_reservations')
  bool? get allowReservations => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_size_limit')
  int? get reservationSizeLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_enabled')
  bool? get menuEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'combos_label')
  String? get combosLabel => throw _privateConstructorUsedError;

  /// Serializes this BusinessUpdateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessUpdateDTOCopyWith<BusinessUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessUpdateDTOCopyWith<$Res> {
  factory $BusinessUpdateDTOCopyWith(
          BusinessUpdateDTO value, $Res Function(BusinessUpdateDTO) then) =
      _$BusinessUpdateDTOCopyWithImpl<$Res, BusinessUpdateDTO>;
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
class _$BusinessUpdateDTOCopyWithImpl<$Res, $Val extends BusinessUpdateDTO>
    implements $BusinessUpdateDTOCopyWith<$Res> {
  _$BusinessUpdateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAboutUs: freezed == businessAboutUs
          ? _value.businessAboutUs
          : businessAboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAdditionalInfo: freezed == businessAdditionalInfo
          ? _value.businessAdditionalInfo
          : businessAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessServices: freezed == businessServices
          ? _value.businessServices
          : businessServices // ignore: cast_nullable_to_non_nullable
              as List<BusinessServices>?,
      businessEmail: freezed == businessEmail
          ? _value.businessEmail
          : businessEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhone: freezed == businessPhone
          ? _value.businessPhone
          : businessPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: freezed == businessAddress
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      businessZipcode: freezed == businessZipcode
          ? _value.businessZipcode
          : businessZipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCity: freezed == businessCity
          ? _value.businessCity
          : businessCity // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _value.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      businessWebsite: freezed == businessWebsite
          ? _value.businessWebsite
          : businessWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLatitude: freezed == businessLatitude
          ? _value.businessLatitude
          : businessLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessLongitude: freezed == businessLongitude
          ? _value.businessLongitude
          : businessLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      businessDays: freezed == businessDays
          ? _value.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays?,
      allowReservations: freezed == allowReservations
          ? _value.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool?,
      reservationSizeLimit: freezed == reservationSizeLimit
          ? _value.reservationSizeLimit
          : reservationSizeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      menuEnabled: freezed == menuEnabled
          ? _value.menuEnabled
          : menuEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      combosLabel: freezed == combosLabel
          ? _value.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res>? get businessDays {
    if (_value.businessDays == null) {
      return null;
    }

    return $BusinessDaysCopyWith<$Res>(_value.businessDays!, (value) {
      return _then(_value.copyWith(businessDays: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessUpdateDTOImplCopyWith<$Res>
    implements $BusinessUpdateDTOCopyWith<$Res> {
  factory _$$BusinessUpdateDTOImplCopyWith(_$BusinessUpdateDTOImpl value,
          $Res Function(_$BusinessUpdateDTOImpl) then) =
      __$$BusinessUpdateDTOImplCopyWithImpl<$Res>;
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
class __$$BusinessUpdateDTOImplCopyWithImpl<$Res>
    extends _$BusinessUpdateDTOCopyWithImpl<$Res, _$BusinessUpdateDTOImpl>
    implements _$$BusinessUpdateDTOImplCopyWith<$Res> {
  __$$BusinessUpdateDTOImplCopyWithImpl(_$BusinessUpdateDTOImpl _value,
      $Res Function(_$BusinessUpdateDTOImpl) _then)
      : super(_value, _then);

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
    return _then(_$BusinessUpdateDTOImpl(
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAboutUs: freezed == businessAboutUs
          ? _value.businessAboutUs
          : businessAboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAdditionalInfo: freezed == businessAdditionalInfo
          ? _value.businessAdditionalInfo
          : businessAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessServices: freezed == businessServices
          ? _value._businessServices
          : businessServices // ignore: cast_nullable_to_non_nullable
              as List<BusinessServices>?,
      businessEmail: freezed == businessEmail
          ? _value.businessEmail
          : businessEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhone: freezed == businessPhone
          ? _value.businessPhone
          : businessPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: freezed == businessAddress
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      businessZipcode: freezed == businessZipcode
          ? _value.businessZipcode
          : businessZipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCity: freezed == businessCity
          ? _value.businessCity
          : businessCity // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _value.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      businessWebsite: freezed == businessWebsite
          ? _value.businessWebsite
          : businessWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLatitude: freezed == businessLatitude
          ? _value.businessLatitude
          : businessLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessLongitude: freezed == businessLongitude
          ? _value.businessLongitude
          : businessLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      businessDays: freezed == businessDays
          ? _value.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays?,
      allowReservations: freezed == allowReservations
          ? _value.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool?,
      reservationSizeLimit: freezed == reservationSizeLimit
          ? _value.reservationSizeLimit
          : reservationSizeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      menuEnabled: freezed == menuEnabled
          ? _value.menuEnabled
          : menuEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      combosLabel: freezed == combosLabel
          ? _value.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessUpdateDTOImpl implements _BusinessUpdateDTO {
  const _$BusinessUpdateDTOImpl(
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

  factory _$BusinessUpdateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessUpdateDTOImplFromJson(json);

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

  @override
  String toString() {
    return 'BusinessUpdateDTO(businessName: $businessName, businessAboutUs: $businessAboutUs, businessAdditionalInfo: $businessAdditionalInfo, businessServices: $businessServices, businessEmail: $businessEmail, businessPhone: $businessPhone, businessAddress: $businessAddress, businessZipcode: $businessZipcode, businessCity: $businessCity, businessCountry: $businessCountry, businessWebsite: $businessWebsite, businessLatitude: $businessLatitude, businessLongitude: $businessLongitude, category: $category, businessDays: $businessDays, allowReservations: $allowReservations, reservationSizeLimit: $reservationSizeLimit, menuEnabled: $menuEnabled, combosLabel: $combosLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessUpdateDTOImpl &&
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

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessUpdateDTOImplCopyWith<_$BusinessUpdateDTOImpl> get copyWith =>
      __$$BusinessUpdateDTOImplCopyWithImpl<_$BusinessUpdateDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessUpdateDTOImplToJson(
      this,
    );
  }
}

abstract class _BusinessUpdateDTO implements BusinessUpdateDTO {
  const factory _BusinessUpdateDTO(
      {@JsonKey(name: 'business_name') final String? businessName,
      @JsonKey(name: 'business_about_us') final String? businessAboutUs,
      @JsonKey(name: 'business_additional_info')
      final String? businessAdditionalInfo,
      @JsonKey(name: 'business_services')
      final List<BusinessServices>? businessServices,
      @JsonKey(name: 'business_email') final String? businessEmail,
      @JsonKey(name: 'business_phone') final String? businessPhone,
      @JsonKey(name: 'business_address') final String? businessAddress,
      @JsonKey(name: 'business_zipcode') final String? businessZipcode,
      @JsonKey(name: 'business_city') final String? businessCity,
      @JsonKey(name: 'business_country') final FoodlyCountries? businessCountry,
      @JsonKey(name: 'business_website') final String? businessWebsite,
      @JsonKey(name: 'business_latitude') final double? businessLatitude,
      @JsonKey(name: 'business_longitude') final double? businessLongitude,
      @JsonKey(name: 'category_id') final FoodlyCategories? category,
      @JsonKey(name: 'business_opening_hours') final BusinessDays? businessDays,
      @JsonKey(name: 'allow_reservations') final bool? allowReservations,
      @JsonKey(name: 'reservation_size_limit') final int? reservationSizeLimit,
      @JsonKey(name: 'menu_enabled') final bool? menuEnabled,
      @JsonKey(name: 'combos_label')
      final String? combosLabel}) = _$BusinessUpdateDTOImpl;

  factory _BusinessUpdateDTO.fromJson(Map<String, dynamic> json) =
      _$BusinessUpdateDTOImpl.fromJson;

  @override
  @JsonKey(name: 'business_name')
  String? get businessName;
  @override
  @JsonKey(name: 'business_about_us')
  String? get businessAboutUs;
  @override
  @JsonKey(name: 'business_additional_info')
  String? get businessAdditionalInfo;
  @override
  @JsonKey(name: 'business_services')
  List<BusinessServices>? get businessServices;
  @override
  @JsonKey(name: 'business_email')
  String? get businessEmail;
  @override
  @JsonKey(name: 'business_phone')
  String? get businessPhone;
  @override
  @JsonKey(name: 'business_address')
  String? get businessAddress;
  @override
  @JsonKey(name: 'business_zipcode')
  String? get businessZipcode;
  @override
  @JsonKey(name: 'business_city')
  String? get businessCity;
  @override
  @JsonKey(name: 'business_country')
  FoodlyCountries? get businessCountry;
  @override
  @JsonKey(name: 'business_website')
  String? get businessWebsite;
  @override
  @JsonKey(name: 'business_latitude')
  double? get businessLatitude;
  @override
  @JsonKey(name: 'business_longitude')
  double? get businessLongitude;
  @override
  @JsonKey(name: 'category_id')
  FoodlyCategories? get category;
  @override
  @JsonKey(name: 'business_opening_hours')
  BusinessDays? get businessDays;
  @override
  @JsonKey(name: 'allow_reservations')
  bool? get allowReservations;
  @override
  @JsonKey(name: 'reservation_size_limit')
  int? get reservationSizeLimit;
  @override
  @JsonKey(name: 'menu_enabled')
  bool? get menuEnabled;
  @override
  @JsonKey(name: 'combos_label')
  String? get combosLabel;

  /// Create a copy of BusinessUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessUpdateDTOImplCopyWith<_$BusinessUpdateDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
