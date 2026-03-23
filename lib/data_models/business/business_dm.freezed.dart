// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessDM _$BusinessDMFromJson(Map<String, dynamic> json) {
  return _BusinessDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessDM {
  @JsonKey(name: 'id')
  int? get intId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_logo')
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_images')
  List<BusinessCoverImageDM> get coverImages =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'branches')
  List<BusinessDM> get branches => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_about_us')
  String? get aboutUs => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_services')
  List<BusinessServicesDM>? get services => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_promotions')
  List<PromotionDM>? get promotions => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_additional_info')
  String? get additionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_zipcode')
  String? get zipCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_country')
  FoodlyCountries? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_menus')
  List<MenuDM> get menus => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
  FoodlyCategories? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  CategoryDM? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_avg')
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'ratings_count')
  int? get ratingsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_opening_hours')
  BusinessDays get businessDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_length')
  int get followersLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'intro_message')
  String? get introMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_reservations')
  bool get allowReservations => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservations_count')
  int get reservationsSizeLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'combos_label')
  String? get combosLabel =>
      throw _privateConstructorUsedError; // This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
  List<ReviewDM> get reviews => throw _privateConstructorUsedError;

  /// Serializes this BusinessDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessDMCopyWith<BusinessDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDMCopyWith<$Res> {
  factory $BusinessDMCopyWith(
          BusinessDM value, $Res Function(BusinessDM) then) =
      _$BusinessDMCopyWithImpl<$Res, BusinessDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? intId,
      @JsonKey(name: 'business_logo') String logo,
      @JsonKey(name: 'cover_images') List<BusinessCoverImageDM> coverImages,
      @JsonKey(name: 'branches') List<BusinessDM> branches,
      @JsonKey(name: 'business_uuid') String uuid,
      @JsonKey(name: 'business_name') String? name,
      @JsonKey(name: 'business_about_us') String? aboutUs,
      @JsonKey(name: 'business_services') List<BusinessServicesDM>? services,
      @JsonKey(name: 'business_promotions') List<PromotionDM>? promotions,
      @JsonKey(name: 'business_additional_info') String? additionalInfo,
      @JsonKey(name: 'business_email') String? email,
      @JsonKey(name: 'business_phone') String? phoneNumber,
      @JsonKey(name: 'business_address') String? address,
      @JsonKey(name: 'business_zipcode') String? zipCode,
      @JsonKey(name: 'business_city') String? city,
      @JsonKey(name: 'business_country') FoodlyCountries? country,
      @JsonKey(name: 'business_menus') List<MenuDM> menus,
      @JsonKey(name: 'business_latitude') double? latitude,
      @JsonKey(name: 'business_longitude') double? longitude,
      @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
      FoodlyCategories? categoryId,
      @JsonKey(name: 'category') CategoryDM? category,
      @JsonKey(name: 'rating_avg') double? rating,
      @JsonKey(name: 'ratings_count') int? ratingsCount,
      @JsonKey(name: 'business_opening_hours') BusinessDays businessDays,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'intro_message') String? introMessage,
      @JsonKey(name: 'allow_reservations') bool allowReservations,
      @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
      @JsonKey(name: 'combos_label') String? combosLabel,
      List<ReviewDM> reviews});

  $CategoryDMCopyWith<$Res>? get category;
  $BusinessDaysCopyWith<$Res> get businessDays;
}

/// @nodoc
class _$BusinessDMCopyWithImpl<$Res, $Val extends BusinessDM>
    implements $BusinessDMCopyWith<$Res> {
  _$BusinessDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = freezed,
    Object? logo = null,
    Object? coverImages = null,
    Object? branches = null,
    Object? uuid = null,
    Object? name = freezed,
    Object? aboutUs = freezed,
    Object? services = freezed,
    Object? promotions = freezed,
    Object? additionalInfo = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? zipCode = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? menus = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? categoryId = freezed,
    Object? category = freezed,
    Object? rating = freezed,
    Object? ratingsCount = freezed,
    Object? businessDays = null,
    Object? followersLength = null,
    Object? introMessage = freezed,
    Object? allowReservations = null,
    Object? reservationsSizeLimit = null,
    Object? combosLabel = freezed,
    Object? reviews = null,
  }) {
    return _then(_value.copyWith(
      intId: freezed == intId
          ? _value.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      coverImages: null == coverImages
          ? _value.coverImages
          : coverImages // ignore: cast_nullable_to_non_nullable
              as List<BusinessCoverImageDM>,
      branches: null == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutUs: freezed == aboutUs
          ? _value.aboutUs
          : aboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BusinessServicesDM>?,
      promotions: freezed == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>?,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuDM>,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDM?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingsCount: freezed == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      businessDays: null == businessDays
          ? _value.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      introMessage: freezed == introMessage
          ? _value.introMessage
          : introMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowReservations: null == allowReservations
          ? _value.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationsSizeLimit: null == reservationsSizeLimit
          ? _value.reservationsSizeLimit
          : reservationsSizeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      combosLabel: freezed == combosLabel
          ? _value.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
    ) as $Val);
  }

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDMCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryDMCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res> get businessDays {
    return $BusinessDaysCopyWith<$Res>(_value.businessDays, (value) {
      return _then(_value.copyWith(businessDays: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessDMImplCopyWith<$Res>
    implements $BusinessDMCopyWith<$Res> {
  factory _$$BusinessDMImplCopyWith(
          _$BusinessDMImpl value, $Res Function(_$BusinessDMImpl) then) =
      __$$BusinessDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? intId,
      @JsonKey(name: 'business_logo') String logo,
      @JsonKey(name: 'cover_images') List<BusinessCoverImageDM> coverImages,
      @JsonKey(name: 'branches') List<BusinessDM> branches,
      @JsonKey(name: 'business_uuid') String uuid,
      @JsonKey(name: 'business_name') String? name,
      @JsonKey(name: 'business_about_us') String? aboutUs,
      @JsonKey(name: 'business_services') List<BusinessServicesDM>? services,
      @JsonKey(name: 'business_promotions') List<PromotionDM>? promotions,
      @JsonKey(name: 'business_additional_info') String? additionalInfo,
      @JsonKey(name: 'business_email') String? email,
      @JsonKey(name: 'business_phone') String? phoneNumber,
      @JsonKey(name: 'business_address') String? address,
      @JsonKey(name: 'business_zipcode') String? zipCode,
      @JsonKey(name: 'business_city') String? city,
      @JsonKey(name: 'business_country') FoodlyCountries? country,
      @JsonKey(name: 'business_menus') List<MenuDM> menus,
      @JsonKey(name: 'business_latitude') double? latitude,
      @JsonKey(name: 'business_longitude') double? longitude,
      @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
      FoodlyCategories? categoryId,
      @JsonKey(name: 'category') CategoryDM? category,
      @JsonKey(name: 'rating_avg') double? rating,
      @JsonKey(name: 'ratings_count') int? ratingsCount,
      @JsonKey(name: 'business_opening_hours') BusinessDays businessDays,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'intro_message') String? introMessage,
      @JsonKey(name: 'allow_reservations') bool allowReservations,
      @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
      @JsonKey(name: 'combos_label') String? combosLabel,
      List<ReviewDM> reviews});

  @override
  $CategoryDMCopyWith<$Res>? get category;
  @override
  $BusinessDaysCopyWith<$Res> get businessDays;
}

/// @nodoc
class __$$BusinessDMImplCopyWithImpl<$Res>
    extends _$BusinessDMCopyWithImpl<$Res, _$BusinessDMImpl>
    implements _$$BusinessDMImplCopyWith<$Res> {
  __$$BusinessDMImplCopyWithImpl(
      _$BusinessDMImpl _value, $Res Function(_$BusinessDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = freezed,
    Object? logo = null,
    Object? coverImages = null,
    Object? branches = null,
    Object? uuid = null,
    Object? name = freezed,
    Object? aboutUs = freezed,
    Object? services = freezed,
    Object? promotions = freezed,
    Object? additionalInfo = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? zipCode = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? menus = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? categoryId = freezed,
    Object? category = freezed,
    Object? rating = freezed,
    Object? ratingsCount = freezed,
    Object? businessDays = null,
    Object? followersLength = null,
    Object? introMessage = freezed,
    Object? allowReservations = null,
    Object? reservationsSizeLimit = null,
    Object? combosLabel = freezed,
    Object? reviews = null,
  }) {
    return _then(_$BusinessDMImpl(
      intId: freezed == intId
          ? _value.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      coverImages: null == coverImages
          ? _value._coverImages
          : coverImages // ignore: cast_nullable_to_non_nullable
              as List<BusinessCoverImageDM>,
      branches: null == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutUs: freezed == aboutUs
          ? _value.aboutUs
          : aboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BusinessServicesDM>?,
      promotions: freezed == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>?,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuDM>,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDM?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingsCount: freezed == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      businessDays: null == businessDays
          ? _value.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      introMessage: freezed == introMessage
          ? _value.introMessage
          : introMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowReservations: null == allowReservations
          ? _value.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationsSizeLimit: null == reservationsSizeLimit
          ? _value.reservationsSizeLimit
          : reservationsSizeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      combosLabel: freezed == combosLabel
          ? _value.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessDMImpl extends _BusinessDM {
  const _$BusinessDMImpl(
      {@JsonKey(name: 'id') this.intId,
      @JsonKey(name: 'business_logo')
      this.logo = FoodlyStrings.LOGO_PLACEHOLDER,
      @JsonKey(name: 'cover_images')
      final List<BusinessCoverImageDM> coverImages = const [],
      @JsonKey(name: 'branches') final List<BusinessDM> branches = const [],
      @JsonKey(name: 'business_uuid') this.uuid = '',
      @JsonKey(name: 'business_name') this.name,
      @JsonKey(name: 'business_about_us') this.aboutUs,
      @JsonKey(name: 'business_services')
      final List<BusinessServicesDM>? services,
      @JsonKey(name: 'business_promotions') final List<PromotionDM>? promotions,
      @JsonKey(name: 'business_additional_info') this.additionalInfo,
      @JsonKey(name: 'business_email') this.email,
      @JsonKey(name: 'business_phone') this.phoneNumber,
      @JsonKey(name: 'business_address') this.address,
      @JsonKey(name: 'business_zipcode') this.zipCode,
      @JsonKey(name: 'business_city') this.city,
      @JsonKey(name: 'business_country') this.country,
      @JsonKey(name: 'business_menus') final List<MenuDM> menus = const [],
      @JsonKey(name: 'business_latitude') this.latitude,
      @JsonKey(name: 'business_longitude') this.longitude,
      @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
      this.categoryId,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'rating_avg') this.rating,
      @JsonKey(name: 'ratings_count') this.ratingsCount,
      @JsonKey(name: 'business_opening_hours')
      this.businessDays = const BusinessDays(),
      @JsonKey(name: 'followers_length') this.followersLength = 0,
      @JsonKey(name: 'intro_message') this.introMessage,
      @JsonKey(name: 'allow_reservations') this.allowReservations = false,
      @JsonKey(name: 'reservations_count') this.reservationsSizeLimit = 6,
      @JsonKey(name: 'combos_label') this.combosLabel,
      final List<ReviewDM> reviews = const []})
      : _coverImages = coverImages,
        _branches = branches,
        _services = services,
        _promotions = promotions,
        _menus = menus,
        _reviews = reviews,
        super._();

  factory _$BusinessDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessDMImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? intId;
  @override
  @JsonKey(name: 'business_logo')
  final String logo;
  final List<BusinessCoverImageDM> _coverImages;
  @override
  @JsonKey(name: 'cover_images')
  List<BusinessCoverImageDM> get coverImages {
    if (_coverImages is EqualUnmodifiableListView) return _coverImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coverImages);
  }

  final List<BusinessDM> _branches;
  @override
  @JsonKey(name: 'branches')
  List<BusinessDM> get branches {
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branches);
  }

  @override
  @JsonKey(name: 'business_uuid')
  final String uuid;
  @override
  @JsonKey(name: 'business_name')
  final String? name;
  @override
  @JsonKey(name: 'business_about_us')
  final String? aboutUs;
  final List<BusinessServicesDM>? _services;
  @override
  @JsonKey(name: 'business_services')
  List<BusinessServicesDM>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PromotionDM>? _promotions;
  @override
  @JsonKey(name: 'business_promotions')
  List<PromotionDM>? get promotions {
    final value = _promotions;
    if (value == null) return null;
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'business_additional_info')
  final String? additionalInfo;
  @override
  @JsonKey(name: 'business_email')
  final String? email;
  @override
  @JsonKey(name: 'business_phone')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'business_address')
  final String? address;
  @override
  @JsonKey(name: 'business_zipcode')
  final String? zipCode;
  @override
  @JsonKey(name: 'business_city')
  final String? city;
  @override
  @JsonKey(name: 'business_country')
  final FoodlyCountries? country;
  final List<MenuDM> _menus;
  @override
  @JsonKey(name: 'business_menus')
  List<MenuDM> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  @JsonKey(name: 'business_latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'business_longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
  final FoodlyCategories? categoryId;
  @override
  @JsonKey(name: 'category')
  final CategoryDM? category;
  @override
  @JsonKey(name: 'rating_avg')
  final double? rating;
  @override
  @JsonKey(name: 'ratings_count')
  final int? ratingsCount;
  @override
  @JsonKey(name: 'business_opening_hours')
  final BusinessDays businessDays;
  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;
  @override
  @JsonKey(name: 'intro_message')
  final String? introMessage;
  @override
  @JsonKey(name: 'allow_reservations')
  final bool allowReservations;
  @override
  @JsonKey(name: 'reservations_count')
  final int reservationsSizeLimit;
  @override
  @JsonKey(name: 'combos_label')
  final String? combosLabel;
// This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
  final List<ReviewDM> _reviews;
// This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
  @override
  @JsonKey()
  List<ReviewDM> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'BusinessDM(intId: $intId, logo: $logo, coverImages: $coverImages, branches: $branches, uuid: $uuid, name: $name, aboutUs: $aboutUs, services: $services, promotions: $promotions, additionalInfo: $additionalInfo, email: $email, phoneNumber: $phoneNumber, address: $address, zipCode: $zipCode, city: $city, country: $country, menus: $menus, latitude: $latitude, longitude: $longitude, categoryId: $categoryId, category: $category, rating: $rating, ratingsCount: $ratingsCount, businessDays: $businessDays, followersLength: $followersLength, introMessage: $introMessage, allowReservations: $allowReservations, reservationsSizeLimit: $reservationsSizeLimit, combosLabel: $combosLabel, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessDMImpl &&
            (identical(other.intId, intId) || other.intId == intId) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            const DeepCollectionEquality()
                .equals(other._coverImages, _coverImages) &&
            const DeepCollectionEquality().equals(other._branches, _branches) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.aboutUs, aboutUs) || other.aboutUs == aboutUs) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingsCount, ratingsCount) ||
                other.ratingsCount == ratingsCount) &&
            (identical(other.businessDays, businessDays) ||
                other.businessDays == businessDays) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            (identical(other.introMessage, introMessage) ||
                other.introMessage == introMessage) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations) &&
            (identical(other.reservationsSizeLimit, reservationsSizeLimit) ||
                other.reservationsSizeLimit == reservationsSizeLimit) &&
            (identical(other.combosLabel, combosLabel) ||
                other.combosLabel == combosLabel) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        intId,
        logo,
        const DeepCollectionEquality().hash(_coverImages),
        const DeepCollectionEquality().hash(_branches),
        uuid,
        name,
        aboutUs,
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(_promotions),
        additionalInfo,
        email,
        phoneNumber,
        address,
        zipCode,
        city,
        country,
        const DeepCollectionEquality().hash(_menus),
        latitude,
        longitude,
        categoryId,
        category,
        rating,
        ratingsCount,
        businessDays,
        followersLength,
        introMessage,
        allowReservations,
        reservationsSizeLimit,
        combosLabel,
        const DeepCollectionEquality().hash(_reviews)
      ]);

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessDMImplCopyWith<_$BusinessDMImpl> get copyWith =>
      __$$BusinessDMImplCopyWithImpl<_$BusinessDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessDM extends BusinessDM {
  const factory _BusinessDM(
      {@JsonKey(name: 'id') final int? intId,
      @JsonKey(name: 'business_logo') final String logo,
      @JsonKey(name: 'cover_images')
      final List<BusinessCoverImageDM> coverImages,
      @JsonKey(name: 'branches') final List<BusinessDM> branches,
      @JsonKey(name: 'business_uuid') final String uuid,
      @JsonKey(name: 'business_name') final String? name,
      @JsonKey(name: 'business_about_us') final String? aboutUs,
      @JsonKey(name: 'business_services')
      final List<BusinessServicesDM>? services,
      @JsonKey(name: 'business_promotions') final List<PromotionDM>? promotions,
      @JsonKey(name: 'business_additional_info') final String? additionalInfo,
      @JsonKey(name: 'business_email') final String? email,
      @JsonKey(name: 'business_phone') final String? phoneNumber,
      @JsonKey(name: 'business_address') final String? address,
      @JsonKey(name: 'business_zipcode') final String? zipCode,
      @JsonKey(name: 'business_city') final String? city,
      @JsonKey(name: 'business_country') final FoodlyCountries? country,
      @JsonKey(name: 'business_menus') final List<MenuDM> menus,
      @JsonKey(name: 'business_latitude') final double? latitude,
      @JsonKey(name: 'business_longitude') final double? longitude,
      @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
      final FoodlyCategories? categoryId,
      @JsonKey(name: 'category') final CategoryDM? category,
      @JsonKey(name: 'rating_avg') final double? rating,
      @JsonKey(name: 'ratings_count') final int? ratingsCount,
      @JsonKey(name: 'business_opening_hours') final BusinessDays businessDays,
      @JsonKey(name: 'followers_length') final int followersLength,
      @JsonKey(name: 'intro_message') final String? introMessage,
      @JsonKey(name: 'allow_reservations') final bool allowReservations,
      @JsonKey(name: 'reservations_count') final int reservationsSizeLimit,
      @JsonKey(name: 'combos_label') final String? combosLabel,
      final List<ReviewDM> reviews}) = _$BusinessDMImpl;
  const _BusinessDM._() : super._();

  factory _BusinessDM.fromJson(Map<String, dynamic> json) =
      _$BusinessDMImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get intId;
  @override
  @JsonKey(name: 'business_logo')
  String get logo;
  @override
  @JsonKey(name: 'cover_images')
  List<BusinessCoverImageDM> get coverImages;
  @override
  @JsonKey(name: 'branches')
  List<BusinessDM> get branches;
  @override
  @JsonKey(name: 'business_uuid')
  String get uuid;
  @override
  @JsonKey(name: 'business_name')
  String? get name;
  @override
  @JsonKey(name: 'business_about_us')
  String? get aboutUs;
  @override
  @JsonKey(name: 'business_services')
  List<BusinessServicesDM>? get services;
  @override
  @JsonKey(name: 'business_promotions')
  List<PromotionDM>? get promotions;
  @override
  @JsonKey(name: 'business_additional_info')
  String? get additionalInfo;
  @override
  @JsonKey(name: 'business_email')
  String? get email;
  @override
  @JsonKey(name: 'business_phone')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'business_address')
  String? get address;
  @override
  @JsonKey(name: 'business_zipcode')
  String? get zipCode;
  @override
  @JsonKey(name: 'business_city')
  String? get city;
  @override
  @JsonKey(name: 'business_country')
  FoodlyCountries? get country;
  @override
  @JsonKey(name: 'business_menus')
  List<MenuDM> get menus;
  @override
  @JsonKey(name: 'business_latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'business_longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
  FoodlyCategories? get categoryId;
  @override
  @JsonKey(name: 'category')
  CategoryDM? get category;
  @override
  @JsonKey(name: 'rating_avg')
  double? get rating;
  @override
  @JsonKey(name: 'ratings_count')
  int? get ratingsCount;
  @override
  @JsonKey(name: 'business_opening_hours')
  BusinessDays get businessDays;
  @override
  @JsonKey(name: 'followers_length')
  int get followersLength;
  @override
  @JsonKey(name: 'intro_message')
  String? get introMessage;
  @override
  @JsonKey(name: 'allow_reservations')
  bool get allowReservations;
  @override
  @JsonKey(name: 'reservations_count')
  int get reservationsSizeLimit;
  @override
  @JsonKey(name: 'combos_label')
  String?
      get combosLabel; // This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
  @override
  List<ReviewDM> get reviews;

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessDMImplCopyWith<_$BusinessDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDM _$CategoryDMFromJson(Map<String, dynamic> json) {
  return _CategoryDM.fromJson(json);
}

/// @nodoc
mixin _$CategoryDM {
  @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
  FoodlyCategories? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_uuid')
  String? get categoryUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_image_path')
  String? get categoryImagePath => throw _privateConstructorUsedError;

  /// Serializes this CategoryDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDMCopyWith<CategoryDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDMCopyWith<$Res> {
  factory $CategoryDMCopyWith(
          CategoryDM value, $Res Function(CategoryDM) then) =
      _$CategoryDMCopyWithImpl<$Res, CategoryDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
      FoodlyCategories? id,
      @JsonKey(name: 'category_uuid') String? categoryUuid,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image_path') String? categoryImagePath});
}

/// @nodoc
class _$CategoryDMCopyWithImpl<$Res, $Val extends CategoryDM>
    implements $CategoryDMCopyWith<$Res> {
  _$CategoryDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryUuid = freezed,
    Object? categoryName = freezed,
    Object? categoryImagePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      categoryUuid: freezed == categoryUuid
          ? _value.categoryUuid
          : categoryUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _value.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDMImplCopyWith<$Res>
    implements $CategoryDMCopyWith<$Res> {
  factory _$$CategoryDMImplCopyWith(
          _$CategoryDMImpl value, $Res Function(_$CategoryDMImpl) then) =
      __$$CategoryDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
      FoodlyCategories? id,
      @JsonKey(name: 'category_uuid') String? categoryUuid,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image_path') String? categoryImagePath});
}

/// @nodoc
class __$$CategoryDMImplCopyWithImpl<$Res>
    extends _$CategoryDMCopyWithImpl<$Res, _$CategoryDMImpl>
    implements _$$CategoryDMImplCopyWith<$Res> {
  __$$CategoryDMImplCopyWithImpl(
      _$CategoryDMImpl _value, $Res Function(_$CategoryDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryUuid = freezed,
    Object? categoryName = freezed,
    Object? categoryImagePath = freezed,
  }) {
    return _then(_$CategoryDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      categoryUuid: freezed == categoryUuid
          ? _value.categoryUuid
          : categoryUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _value.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDMImpl implements _CategoryDM {
  const _$CategoryDMImpl(
      {@JsonKey(name: 'id', fromJson: _safeCategoryFromJson) this.id,
      @JsonKey(name: 'category_uuid') this.categoryUuid,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_image_path') this.categoryImagePath});

  factory _$CategoryDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDMImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
  final FoodlyCategories? id;
  @override
  @JsonKey(name: 'category_uuid')
  final String? categoryUuid;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_image_path')
  final String? categoryImagePath;

  @override
  String toString() {
    return 'CategoryDM(id: $id, categoryUuid: $categoryUuid, categoryName: $categoryName, categoryImagePath: $categoryImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryUuid, categoryUuid) ||
                other.categoryUuid == categoryUuid) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImagePath, categoryImagePath) ||
                other.categoryImagePath == categoryImagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, categoryUuid, categoryName, categoryImagePath);

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDMImplCopyWith<_$CategoryDMImpl> get copyWith =>
      __$$CategoryDMImplCopyWithImpl<_$CategoryDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDMImplToJson(
      this,
    );
  }
}

abstract class _CategoryDM implements CategoryDM {
  const factory _CategoryDM(
      {@JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
      final FoodlyCategories? id,
      @JsonKey(name: 'category_uuid') final String? categoryUuid,
      @JsonKey(name: 'category_name') final String? categoryName,
      @JsonKey(name: 'category_image_path')
      final String? categoryImagePath}) = _$CategoryDMImpl;

  factory _CategoryDM.fromJson(Map<String, dynamic> json) =
      _$CategoryDMImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
  FoodlyCategories? get id;
  @override
  @JsonKey(name: 'category_uuid')
  String? get categoryUuid;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_image_path')
  String? get categoryImagePath;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDMImplCopyWith<_$CategoryDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BusinessServicesDM _$BusinessServicesDMFromJson(Map<String, dynamic> json) {
  return _BusinessServiceDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessServicesDM {
  @JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  BusinessServices? get service => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_name')
  String? get serviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_description')
  String? get serviceDescriptio => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_image_path')
  String? get serviceImagePath => throw _privateConstructorUsedError;

  /// Serializes this BusinessServicesDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessServicesDMCopyWith<BusinessServicesDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessServicesDMCopyWith<$Res> {
  factory $BusinessServicesDMCopyWith(
          BusinessServicesDM value, $Res Function(BusinessServicesDM) then) =
      _$BusinessServicesDMCopyWithImpl<$Res, BusinessServicesDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      BusinessServices? service,
      @JsonKey(name: 'service_uuid') String? uuid,
      @JsonKey(name: 'service_name') String? serviceName,
      @JsonKey(name: 'service_description') String? serviceDescriptio,
      @JsonKey(name: 'service_image_path') String? serviceImagePath});
}

/// @nodoc
class _$BusinessServicesDMCopyWithImpl<$Res, $Val extends BusinessServicesDM>
    implements $BusinessServicesDMCopyWith<$Res> {
  _$BusinessServicesDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? uuid = freezed,
    Object? serviceName = freezed,
    Object? serviceDescriptio = freezed,
    Object? serviceImagePath = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as BusinessServices?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: freezed == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDescriptio: freezed == serviceDescriptio
          ? _value.serviceDescriptio
          : serviceDescriptio // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceImagePath: freezed == serviceImagePath
          ? _value.serviceImagePath
          : serviceImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessServiceDMImplCopyWith<$Res>
    implements $BusinessServicesDMCopyWith<$Res> {
  factory _$$BusinessServiceDMImplCopyWith(_$BusinessServiceDMImpl value,
          $Res Function(_$BusinessServiceDMImpl) then) =
      __$$BusinessServiceDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      BusinessServices? service,
      @JsonKey(name: 'service_uuid') String? uuid,
      @JsonKey(name: 'service_name') String? serviceName,
      @JsonKey(name: 'service_description') String? serviceDescriptio,
      @JsonKey(name: 'service_image_path') String? serviceImagePath});
}

/// @nodoc
class __$$BusinessServiceDMImplCopyWithImpl<$Res>
    extends _$BusinessServicesDMCopyWithImpl<$Res, _$BusinessServiceDMImpl>
    implements _$$BusinessServiceDMImplCopyWith<$Res> {
  __$$BusinessServiceDMImplCopyWithImpl(_$BusinessServiceDMImpl _value,
      $Res Function(_$BusinessServiceDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? uuid = freezed,
    Object? serviceName = freezed,
    Object? serviceDescriptio = freezed,
    Object? serviceImagePath = freezed,
  }) {
    return _then(_$BusinessServiceDMImpl(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as BusinessServices?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: freezed == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDescriptio: freezed == serviceDescriptio
          ? _value.serviceDescriptio
          : serviceDescriptio // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceImagePath: freezed == serviceImagePath
          ? _value.serviceImagePath
          : serviceImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessServiceDMImpl extends _BusinessServiceDM {
  const _$BusinessServiceDMImpl(
      {@JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.service,
      @JsonKey(name: 'service_uuid') this.uuid,
      @JsonKey(name: 'service_name') this.serviceName,
      @JsonKey(name: 'service_description') this.serviceDescriptio,
      @JsonKey(name: 'service_image_path') this.serviceImagePath})
      : super._();

  factory _$BusinessServiceDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessServiceDMImplFromJson(json);

  @override
  @JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final BusinessServices? service;
  @override
  @JsonKey(name: 'service_uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'service_name')
  final String? serviceName;
  @override
  @JsonKey(name: 'service_description')
  final String? serviceDescriptio;
  @override
  @JsonKey(name: 'service_image_path')
  final String? serviceImagePath;

  @override
  String toString() {
    return 'BusinessServicesDM(service: $service, uuid: $uuid, serviceName: $serviceName, serviceDescriptio: $serviceDescriptio, serviceImagePath: $serviceImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessServiceDMImpl &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.serviceDescriptio, serviceDescriptio) ||
                other.serviceDescriptio == serviceDescriptio) &&
            (identical(other.serviceImagePath, serviceImagePath) ||
                other.serviceImagePath == serviceImagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, uuid, serviceName,
      serviceDescriptio, serviceImagePath);

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessServiceDMImplCopyWith<_$BusinessServiceDMImpl> get copyWith =>
      __$$BusinessServiceDMImplCopyWithImpl<_$BusinessServiceDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessServiceDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessServiceDM extends BusinessServicesDM {
  const factory _BusinessServiceDM(
      {@JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final BusinessServices? service,
      @JsonKey(name: 'service_uuid') final String? uuid,
      @JsonKey(name: 'service_name') final String? serviceName,
      @JsonKey(name: 'service_description') final String? serviceDescriptio,
      @JsonKey(name: 'service_image_path')
      final String? serviceImagePath}) = _$BusinessServiceDMImpl;
  const _BusinessServiceDM._() : super._();

  factory _BusinessServiceDM.fromJson(Map<String, dynamic> json) =
      _$BusinessServiceDMImpl.fromJson;

  @override
  @JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  BusinessServices? get service;
  @override
  @JsonKey(name: 'service_uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'service_name')
  String? get serviceName;
  @override
  @JsonKey(name: 'service_description')
  String? get serviceDescriptio;
  @override
  @JsonKey(name: 'service_image_path')
  String? get serviceImagePath;

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessServiceDMImplCopyWith<_$BusinessServiceDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
