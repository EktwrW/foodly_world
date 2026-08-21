// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessDM {
  @JsonKey(name: 'id')
  int? get intId;
  @JsonKey(name: 'business_logo')
  String get logo;
  @JsonKey(name: 'cover_images')
  List<BusinessCoverImageDM> get coverImages;
  @JsonKey(name: 'branches')
  List<BusinessDM> get branches;
  @JsonKey(name: 'business_uuid')
  String get uuid;
  @JsonKey(name: 'business_name')
  String? get name;
  @JsonKey(name: 'business_about_us')
  String? get aboutUs;
  @JsonKey(name: 'business_services')
  List<BusinessServicesDM>? get services;
  @JsonKey(name: 'business_promotions')
  List<PromotionDM>? get promotions;
  @JsonKey(name: 'business_additional_info')
  String? get additionalInfo;
  @JsonKey(name: 'business_email')
  String? get email;
  @JsonKey(name: 'business_phone')
  String? get phoneNumber;
  @JsonKey(name: 'business_address')
  String? get address;
  @JsonKey(name: 'business_zipcode')
  String? get zipCode;
  @JsonKey(name: 'business_city')
  String? get city;
  @JsonKey(name: 'business_country')
  FoodlyCountries? get country;
  @JsonKey(name: 'business_menus')
  List<MenuDM> get menus;
  @JsonKey(name: 'business_latitude')
  double? get latitude;
  @JsonKey(name: 'business_longitude')
  double? get longitude;
  @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson)
  FoodlyCategories? get categoryId;
  @JsonKey(name: 'category')
  CategoryDM? get category;
  @JsonKey(name: 'rating_avg')
  double? get rating;
  @JsonKey(name: 'ratings_count')
  int? get ratingsCount;
  @JsonKey(name: 'business_opening_hours')
  BusinessDays
      get businessDays; // Server-computed open/closed status using the BUSINESS's local
// timezone (derived from `business_country` in `BusinessStatusHelper`
// on the BE). The FE no longer computes this — see [currentStatus]
// getter below for the parsed enum, and `BusinessStatusHelper.php` for
// the rationale (single source of truth, correct for cross-timezone
// viewers, kills the "My Pizzeria looks closed" bug).
// Values: 'open' | 'closed' | 'opening_soon'. Null only on payloads
// from controllers that haven't been updated yet (defensive).
  @JsonKey(name: 'status')
  String?
      get status; // Human-readable hours for TODAY in the business's local time, e.g.
// "09:00 – 22:00" or "09:00 – 14:00 / 18:00 – 23:00" for split shifts.
// Server-side string ready to render. Null when no hours configured
// for today.
  @JsonKey(name: 'hours_display')
  String? get hoursDisplay;
  @JsonKey(name: 'followers_length')
  int get followersLength;
  @JsonKey(name: 'intro_message')
  String? get introMessage;
  @JsonKey(name: 'allow_reservations')
  bool get allowReservations;

  /// Mínimo para pagar en la app, en céntimos. null = sin mínimo.
  /// Llega al comensal a propósito: la ASAE exige informarlo de forma clara
  /// ANTES de que arme la cuenta, no como un bloqueo sorpresa al pagar.
  @JsonKey(name: 'card_min_amount_minor')
  int? get cardMinAmountMinor;
  @JsonKey(name: 'reservations_count')
  int get reservationsSizeLimit; // Catering & Chefs vertical — opt-in digital menu. Other verticals always
// show their menu; catering shows it only when the manager enables it.
  @JsonKey(name: 'menu_enabled')
  bool get menuEnabled;
  @JsonKey(name: 'combos_label')
  String? get combosLabel;
  @JsonKey(name: 'ai_promo_monthly_limit')
  int get aiPromoMonthlyLimit;
  @JsonKey(name: 'ai_promos_used_this_month')
  int get aiPromosUsedThisMonth; // Catering & Chefs vertical — MIN price across ACTIVE service_packages
// for this business (EUR). Only populated by endpoints that join the
// subselect (currently: GET /business/nearby). Null when the business has
// no priced active package (restaurants without packages, or catering
// providers that only offer on-quote packages).
  @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
  double?
      get minServicePrice; // This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
  List<ReviewDM> get reviews;

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<BusinessDM> get copyWith =>
      _$BusinessDMCopyWithImpl<BusinessDM>(this as BusinessDM, _$identity);

  /// Serializes this BusinessDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessDM &&
            (identical(other.intId, intId) || other.intId == intId) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            const DeepCollectionEquality()
                .equals(other.coverImages, coverImages) &&
            const DeepCollectionEquality().equals(other.branches, branches) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.aboutUs, aboutUs) || other.aboutUs == aboutUs) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality().equals(other.menus, menus) &&
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hoursDisplay, hoursDisplay) ||
                other.hoursDisplay == hoursDisplay) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            (identical(other.introMessage, introMessage) ||
                other.introMessage == introMessage) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations) &&
            (identical(other.cardMinAmountMinor, cardMinAmountMinor) ||
                other.cardMinAmountMinor == cardMinAmountMinor) &&
            (identical(other.reservationsSizeLimit, reservationsSizeLimit) ||
                other.reservationsSizeLimit == reservationsSizeLimit) &&
            (identical(other.menuEnabled, menuEnabled) ||
                other.menuEnabled == menuEnabled) &&
            (identical(other.combosLabel, combosLabel) ||
                other.combosLabel == combosLabel) &&
            (identical(other.aiPromoMonthlyLimit, aiPromoMonthlyLimit) ||
                other.aiPromoMonthlyLimit == aiPromoMonthlyLimit) &&
            (identical(other.aiPromosUsedThisMonth, aiPromosUsedThisMonth) ||
                other.aiPromosUsedThisMonth == aiPromosUsedThisMonth) &&
            (identical(other.minServicePrice, minServicePrice) ||
                other.minServicePrice == minServicePrice) &&
            const DeepCollectionEquality().equals(other.reviews, reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        intId,
        logo,
        const DeepCollectionEquality().hash(coverImages),
        const DeepCollectionEquality().hash(branches),
        uuid,
        name,
        aboutUs,
        const DeepCollectionEquality().hash(services),
        const DeepCollectionEquality().hash(promotions),
        additionalInfo,
        email,
        phoneNumber,
        address,
        zipCode,
        city,
        country,
        const DeepCollectionEquality().hash(menus),
        latitude,
        longitude,
        categoryId,
        category,
        rating,
        ratingsCount,
        businessDays,
        status,
        hoursDisplay,
        followersLength,
        introMessage,
        allowReservations,
        cardMinAmountMinor,
        reservationsSizeLimit,
        menuEnabled,
        combosLabel,
        aiPromoMonthlyLimit,
        aiPromosUsedThisMonth,
        minServicePrice,
        const DeepCollectionEquality().hash(reviews)
      ]);

  @override
  String toString() {
    return 'BusinessDM(intId: $intId, logo: $logo, coverImages: $coverImages, branches: $branches, uuid: $uuid, name: $name, aboutUs: $aboutUs, services: $services, promotions: $promotions, additionalInfo: $additionalInfo, email: $email, phoneNumber: $phoneNumber, address: $address, zipCode: $zipCode, city: $city, country: $country, menus: $menus, latitude: $latitude, longitude: $longitude, categoryId: $categoryId, category: $category, rating: $rating, ratingsCount: $ratingsCount, businessDays: $businessDays, status: $status, hoursDisplay: $hoursDisplay, followersLength: $followersLength, introMessage: $introMessage, allowReservations: $allowReservations, cardMinAmountMinor: $cardMinAmountMinor, reservationsSizeLimit: $reservationsSizeLimit, menuEnabled: $menuEnabled, combosLabel: $combosLabel, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, minServicePrice: $minServicePrice, reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class $BusinessDMCopyWith<$Res> {
  factory $BusinessDMCopyWith(
          BusinessDM value, $Res Function(BusinessDM) _then) =
      _$BusinessDMCopyWithImpl;
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
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'hours_display') String? hoursDisplay,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'intro_message') String? introMessage,
      @JsonKey(name: 'allow_reservations') bool allowReservations,
      @JsonKey(name: 'card_min_amount_minor') int? cardMinAmountMinor,
      @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
      @JsonKey(name: 'menu_enabled') bool menuEnabled,
      @JsonKey(name: 'combos_label') String? combosLabel,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
      double? minServicePrice,
      List<ReviewDM> reviews});

  $CategoryDMCopyWith<$Res>? get category;
  $BusinessDaysCopyWith<$Res> get businessDays;
}

/// @nodoc
class _$BusinessDMCopyWithImpl<$Res> implements $BusinessDMCopyWith<$Res> {
  _$BusinessDMCopyWithImpl(this._self, this._then);

  final BusinessDM _self;
  final $Res Function(BusinessDM) _then;

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
    Object? status = freezed,
    Object? hoursDisplay = freezed,
    Object? followersLength = null,
    Object? introMessage = freezed,
    Object? allowReservations = null,
    Object? cardMinAmountMinor = freezed,
    Object? reservationsSizeLimit = null,
    Object? menuEnabled = null,
    Object? combosLabel = freezed,
    Object? aiPromoMonthlyLimit = null,
    Object? aiPromosUsedThisMonth = null,
    Object? minServicePrice = freezed,
    Object? reviews = null,
  }) {
    return _then(_self.copyWith(
      intId: freezed == intId
          ? _self.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      logo: null == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      coverImages: null == coverImages
          ? _self.coverImages
          : coverImages // ignore: cast_nullable_to_non_nullable
              as List<BusinessCoverImageDM>,
      branches: null == branches
          ? _self.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutUs: freezed == aboutUs
          ? _self.aboutUs
          : aboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BusinessServicesDM>?,
      promotions: freezed == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>?,
      additionalInfo: freezed == additionalInfo
          ? _self.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      menus: null == menus
          ? _self.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuDM>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDM?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingsCount: freezed == ratingsCount
          ? _self.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      businessDays: null == businessDays
          ? _self.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursDisplay: freezed == hoursDisplay
          ? _self.hoursDisplay
          : hoursDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      introMessage: freezed == introMessage
          ? _self.introMessage
          : introMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowReservations: null == allowReservations
          ? _self.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool,
      cardMinAmountMinor: freezed == cardMinAmountMinor
          ? _self.cardMinAmountMinor
          : cardMinAmountMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationsSizeLimit: null == reservationsSizeLimit
          ? _self.reservationsSizeLimit
          : reservationsSizeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      menuEnabled: null == menuEnabled
          ? _self.menuEnabled
          : menuEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      combosLabel: freezed == combosLabel
          ? _self.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      aiPromoMonthlyLimit: null == aiPromoMonthlyLimit
          ? _self.aiPromoMonthlyLimit
          : aiPromoMonthlyLimit // ignore: cast_nullable_to_non_nullable
              as int,
      aiPromosUsedThisMonth: null == aiPromosUsedThisMonth
          ? _self.aiPromosUsedThisMonth
          : aiPromosUsedThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      minServicePrice: freezed == minServicePrice
          ? _self.minServicePrice
          : minServicePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
    ));
  }

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDMCopyWith<$Res>? get category {
    if (_self.category == null) {
      return null;
    }

    return $CategoryDMCopyWith<$Res>(_self.category!, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res> get businessDays {
    return $BusinessDaysCopyWith<$Res>(_self.businessDays, (value) {
      return _then(_self.copyWith(businessDays: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessDM].
extension BusinessDMPatterns on BusinessDM {
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
    TResult Function(_BusinessDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessDM() when $default != null:
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
    TResult Function(_BusinessDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessDM():
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
    TResult? Function(_BusinessDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessDM() when $default != null:
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
            @JsonKey(name: 'id') int? intId,
            @JsonKey(name: 'business_logo') String logo,
            @JsonKey(name: 'cover_images')
            List<BusinessCoverImageDM> coverImages,
            @JsonKey(name: 'branches') List<BusinessDM> branches,
            @JsonKey(name: 'business_uuid') String uuid,
            @JsonKey(name: 'business_name') String? name,
            @JsonKey(name: 'business_about_us') String? aboutUs,
            @JsonKey(name: 'business_services')
            List<BusinessServicesDM>? services,
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
            @JsonKey(name: 'status') String? status,
            @JsonKey(name: 'hours_display') String? hoursDisplay,
            @JsonKey(name: 'followers_length') int followersLength,
            @JsonKey(name: 'intro_message') String? introMessage,
            @JsonKey(name: 'allow_reservations') bool allowReservations,
            @JsonKey(name: 'card_min_amount_minor') int? cardMinAmountMinor,
            @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
            @JsonKey(name: 'menu_enabled') bool menuEnabled,
            @JsonKey(name: 'combos_label') String? combosLabel,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
            double? minServicePrice,
            List<ReviewDM> reviews)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessDM() when $default != null:
        return $default(
            _that.intId,
            _that.logo,
            _that.coverImages,
            _that.branches,
            _that.uuid,
            _that.name,
            _that.aboutUs,
            _that.services,
            _that.promotions,
            _that.additionalInfo,
            _that.email,
            _that.phoneNumber,
            _that.address,
            _that.zipCode,
            _that.city,
            _that.country,
            _that.menus,
            _that.latitude,
            _that.longitude,
            _that.categoryId,
            _that.category,
            _that.rating,
            _that.ratingsCount,
            _that.businessDays,
            _that.status,
            _that.hoursDisplay,
            _that.followersLength,
            _that.introMessage,
            _that.allowReservations,
            _that.cardMinAmountMinor,
            _that.reservationsSizeLimit,
            _that.menuEnabled,
            _that.combosLabel,
            _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth,
            _that.minServicePrice,
            _that.reviews);
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
            @JsonKey(name: 'id') int? intId,
            @JsonKey(name: 'business_logo') String logo,
            @JsonKey(name: 'cover_images')
            List<BusinessCoverImageDM> coverImages,
            @JsonKey(name: 'branches') List<BusinessDM> branches,
            @JsonKey(name: 'business_uuid') String uuid,
            @JsonKey(name: 'business_name') String? name,
            @JsonKey(name: 'business_about_us') String? aboutUs,
            @JsonKey(name: 'business_services')
            List<BusinessServicesDM>? services,
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
            @JsonKey(name: 'status') String? status,
            @JsonKey(name: 'hours_display') String? hoursDisplay,
            @JsonKey(name: 'followers_length') int followersLength,
            @JsonKey(name: 'intro_message') String? introMessage,
            @JsonKey(name: 'allow_reservations') bool allowReservations,
            @JsonKey(name: 'card_min_amount_minor') int? cardMinAmountMinor,
            @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
            @JsonKey(name: 'menu_enabled') bool menuEnabled,
            @JsonKey(name: 'combos_label') String? combosLabel,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
            double? minServicePrice,
            List<ReviewDM> reviews)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessDM():
        return $default(
            _that.intId,
            _that.logo,
            _that.coverImages,
            _that.branches,
            _that.uuid,
            _that.name,
            _that.aboutUs,
            _that.services,
            _that.promotions,
            _that.additionalInfo,
            _that.email,
            _that.phoneNumber,
            _that.address,
            _that.zipCode,
            _that.city,
            _that.country,
            _that.menus,
            _that.latitude,
            _that.longitude,
            _that.categoryId,
            _that.category,
            _that.rating,
            _that.ratingsCount,
            _that.businessDays,
            _that.status,
            _that.hoursDisplay,
            _that.followersLength,
            _that.introMessage,
            _that.allowReservations,
            _that.cardMinAmountMinor,
            _that.reservationsSizeLimit,
            _that.menuEnabled,
            _that.combosLabel,
            _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth,
            _that.minServicePrice,
            _that.reviews);
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
            @JsonKey(name: 'id') int? intId,
            @JsonKey(name: 'business_logo') String logo,
            @JsonKey(name: 'cover_images')
            List<BusinessCoverImageDM> coverImages,
            @JsonKey(name: 'branches') List<BusinessDM> branches,
            @JsonKey(name: 'business_uuid') String uuid,
            @JsonKey(name: 'business_name') String? name,
            @JsonKey(name: 'business_about_us') String? aboutUs,
            @JsonKey(name: 'business_services')
            List<BusinessServicesDM>? services,
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
            @JsonKey(name: 'status') String? status,
            @JsonKey(name: 'hours_display') String? hoursDisplay,
            @JsonKey(name: 'followers_length') int followersLength,
            @JsonKey(name: 'intro_message') String? introMessage,
            @JsonKey(name: 'allow_reservations') bool allowReservations,
            @JsonKey(name: 'card_min_amount_minor') int? cardMinAmountMinor,
            @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
            @JsonKey(name: 'menu_enabled') bool menuEnabled,
            @JsonKey(name: 'combos_label') String? combosLabel,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
            double? minServicePrice,
            List<ReviewDM> reviews)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessDM() when $default != null:
        return $default(
            _that.intId,
            _that.logo,
            _that.coverImages,
            _that.branches,
            _that.uuid,
            _that.name,
            _that.aboutUs,
            _that.services,
            _that.promotions,
            _that.additionalInfo,
            _that.email,
            _that.phoneNumber,
            _that.address,
            _that.zipCode,
            _that.city,
            _that.country,
            _that.menus,
            _that.latitude,
            _that.longitude,
            _that.categoryId,
            _that.category,
            _that.rating,
            _that.ratingsCount,
            _that.businessDays,
            _that.status,
            _that.hoursDisplay,
            _that.followersLength,
            _that.introMessage,
            _that.allowReservations,
            _that.cardMinAmountMinor,
            _that.reservationsSizeLimit,
            _that.menuEnabled,
            _that.combosLabel,
            _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth,
            _that.minServicePrice,
            _that.reviews);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessDM extends BusinessDM {
  const _BusinessDM(
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
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'hours_display') this.hoursDisplay,
      @JsonKey(name: 'followers_length') this.followersLength = 0,
      @JsonKey(name: 'intro_message') this.introMessage,
      @JsonKey(name: 'allow_reservations') this.allowReservations = false,
      @JsonKey(name: 'card_min_amount_minor') this.cardMinAmountMinor,
      @JsonKey(name: 'reservations_count') this.reservationsSizeLimit = 6,
      @JsonKey(name: 'menu_enabled') this.menuEnabled = false,
      @JsonKey(name: 'combos_label') this.combosLabel,
      @JsonKey(name: 'ai_promo_monthly_limit') this.aiPromoMonthlyLimit = 3,
      @JsonKey(name: 'ai_promos_used_this_month')
      this.aiPromosUsedThisMonth = 0,
      @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
      this.minServicePrice,
      final List<ReviewDM> reviews = const []})
      : _coverImages = coverImages,
        _branches = branches,
        _services = services,
        _promotions = promotions,
        _menus = menus,
        _reviews = reviews,
        super._();
  factory _BusinessDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessDMFromJson(json);

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
// Server-computed open/closed status using the BUSINESS's local
// timezone (derived from `business_country` in `BusinessStatusHelper`
// on the BE). The FE no longer computes this — see [currentStatus]
// getter below for the parsed enum, and `BusinessStatusHelper.php` for
// the rationale (single source of truth, correct for cross-timezone
// viewers, kills the "My Pizzeria looks closed" bug).
// Values: 'open' | 'closed' | 'opening_soon'. Null only on payloads
// from controllers that haven't been updated yet (defensive).
  @override
  @JsonKey(name: 'status')
  final String? status;
// Human-readable hours for TODAY in the business's local time, e.g.
// "09:00 – 22:00" or "09:00 – 14:00 / 18:00 – 23:00" for split shifts.
// Server-side string ready to render. Null when no hours configured
// for today.
  @override
  @JsonKey(name: 'hours_display')
  final String? hoursDisplay;
  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;
  @override
  @JsonKey(name: 'intro_message')
  final String? introMessage;
  @override
  @JsonKey(name: 'allow_reservations')
  final bool allowReservations;

  /// Mínimo para pagar en la app, en céntimos. null = sin mínimo.
  /// Llega al comensal a propósito: la ASAE exige informarlo de forma clara
  /// ANTES de que arme la cuenta, no como un bloqueo sorpresa al pagar.
  @override
  @JsonKey(name: 'card_min_amount_minor')
  final int? cardMinAmountMinor;
  @override
  @JsonKey(name: 'reservations_count')
  final int reservationsSizeLimit;
// Catering & Chefs vertical — opt-in digital menu. Other verticals always
// show their menu; catering shows it only when the manager enables it.
  @override
  @JsonKey(name: 'menu_enabled')
  final bool menuEnabled;
  @override
  @JsonKey(name: 'combos_label')
  final String? combosLabel;
  @override
  @JsonKey(name: 'ai_promo_monthly_limit')
  final int aiPromoMonthlyLimit;
  @override
  @JsonKey(name: 'ai_promos_used_this_month')
  final int aiPromosUsedThisMonth;
// Catering & Chefs vertical — MIN price across ACTIVE service_packages
// for this business (EUR). Only populated by endpoints that join the
// subselect (currently: GET /business/nearby). Null when the business has
// no priced active package (restaurants without packages, or catering
// providers that only offer on-quote packages).
  @override
  @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
  final double? minServicePrice;
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

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessDMCopyWith<_BusinessDM> get copyWith =>
      __$BusinessDMCopyWithImpl<_BusinessDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessDM &&
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hoursDisplay, hoursDisplay) ||
                other.hoursDisplay == hoursDisplay) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            (identical(other.introMessage, introMessage) ||
                other.introMessage == introMessage) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations) &&
            (identical(other.cardMinAmountMinor, cardMinAmountMinor) ||
                other.cardMinAmountMinor == cardMinAmountMinor) &&
            (identical(other.reservationsSizeLimit, reservationsSizeLimit) ||
                other.reservationsSizeLimit == reservationsSizeLimit) &&
            (identical(other.menuEnabled, menuEnabled) ||
                other.menuEnabled == menuEnabled) &&
            (identical(other.combosLabel, combosLabel) ||
                other.combosLabel == combosLabel) &&
            (identical(other.aiPromoMonthlyLimit, aiPromoMonthlyLimit) ||
                other.aiPromoMonthlyLimit == aiPromoMonthlyLimit) &&
            (identical(other.aiPromosUsedThisMonth, aiPromosUsedThisMonth) ||
                other.aiPromosUsedThisMonth == aiPromosUsedThisMonth) &&
            (identical(other.minServicePrice, minServicePrice) ||
                other.minServicePrice == minServicePrice) &&
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
        status,
        hoursDisplay,
        followersLength,
        introMessage,
        allowReservations,
        cardMinAmountMinor,
        reservationsSizeLimit,
        menuEnabled,
        combosLabel,
        aiPromoMonthlyLimit,
        aiPromosUsedThisMonth,
        minServicePrice,
        const DeepCollectionEquality().hash(_reviews)
      ]);

  @override
  String toString() {
    return 'BusinessDM(intId: $intId, logo: $logo, coverImages: $coverImages, branches: $branches, uuid: $uuid, name: $name, aboutUs: $aboutUs, services: $services, promotions: $promotions, additionalInfo: $additionalInfo, email: $email, phoneNumber: $phoneNumber, address: $address, zipCode: $zipCode, city: $city, country: $country, menus: $menus, latitude: $latitude, longitude: $longitude, categoryId: $categoryId, category: $category, rating: $rating, ratingsCount: $ratingsCount, businessDays: $businessDays, status: $status, hoursDisplay: $hoursDisplay, followersLength: $followersLength, introMessage: $introMessage, allowReservations: $allowReservations, cardMinAmountMinor: $cardMinAmountMinor, reservationsSizeLimit: $reservationsSizeLimit, menuEnabled: $menuEnabled, combosLabel: $combosLabel, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, minServicePrice: $minServicePrice, reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class _$BusinessDMCopyWith<$Res>
    implements $BusinessDMCopyWith<$Res> {
  factory _$BusinessDMCopyWith(
          _BusinessDM value, $Res Function(_BusinessDM) _then) =
      __$BusinessDMCopyWithImpl;
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
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'hours_display') String? hoursDisplay,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'intro_message') String? introMessage,
      @JsonKey(name: 'allow_reservations') bool allowReservations,
      @JsonKey(name: 'card_min_amount_minor') int? cardMinAmountMinor,
      @JsonKey(name: 'reservations_count') int reservationsSizeLimit,
      @JsonKey(name: 'menu_enabled') bool menuEnabled,
      @JsonKey(name: 'combos_label') String? combosLabel,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson)
      double? minServicePrice,
      List<ReviewDM> reviews});

  @override
  $CategoryDMCopyWith<$Res>? get category;
  @override
  $BusinessDaysCopyWith<$Res> get businessDays;
}

/// @nodoc
class __$BusinessDMCopyWithImpl<$Res> implements _$BusinessDMCopyWith<$Res> {
  __$BusinessDMCopyWithImpl(this._self, this._then);

  final _BusinessDM _self;
  final $Res Function(_BusinessDM) _then;

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? status = freezed,
    Object? hoursDisplay = freezed,
    Object? followersLength = null,
    Object? introMessage = freezed,
    Object? allowReservations = null,
    Object? cardMinAmountMinor = freezed,
    Object? reservationsSizeLimit = null,
    Object? menuEnabled = null,
    Object? combosLabel = freezed,
    Object? aiPromoMonthlyLimit = null,
    Object? aiPromosUsedThisMonth = null,
    Object? minServicePrice = freezed,
    Object? reviews = null,
  }) {
    return _then(_BusinessDM(
      intId: freezed == intId
          ? _self.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      logo: null == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      coverImages: null == coverImages
          ? _self._coverImages
          : coverImages // ignore: cast_nullable_to_non_nullable
              as List<BusinessCoverImageDM>,
      branches: null == branches
          ? _self._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutUs: freezed == aboutUs
          ? _self.aboutUs
          : aboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BusinessServicesDM>?,
      promotions: freezed == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>?,
      additionalInfo: freezed == additionalInfo
          ? _self.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      menus: null == menus
          ? _self._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuDM>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDM?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingsCount: freezed == ratingsCount
          ? _self.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      businessDays: null == businessDays
          ? _self.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursDisplay: freezed == hoursDisplay
          ? _self.hoursDisplay
          : hoursDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      introMessage: freezed == introMessage
          ? _self.introMessage
          : introMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowReservations: null == allowReservations
          ? _self.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool,
      cardMinAmountMinor: freezed == cardMinAmountMinor
          ? _self.cardMinAmountMinor
          : cardMinAmountMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationsSizeLimit: null == reservationsSizeLimit
          ? _self.reservationsSizeLimit
          : reservationsSizeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      menuEnabled: null == menuEnabled
          ? _self.menuEnabled
          : menuEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      combosLabel: freezed == combosLabel
          ? _self.combosLabel
          : combosLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      aiPromoMonthlyLimit: null == aiPromoMonthlyLimit
          ? _self.aiPromoMonthlyLimit
          : aiPromoMonthlyLimit // ignore: cast_nullable_to_non_nullable
              as int,
      aiPromosUsedThisMonth: null == aiPromosUsedThisMonth
          ? _self.aiPromosUsedThisMonth
          : aiPromosUsedThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      minServicePrice: freezed == minServicePrice
          ? _self.minServicePrice
          : minServicePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
    ));
  }

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDMCopyWith<$Res>? get category {
    if (_self.category == null) {
      return null;
    }

    return $CategoryDMCopyWith<$Res>(_self.category!, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of BusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res> get businessDays {
    return $BusinessDaysCopyWith<$Res>(_self.businessDays, (value) {
      return _then(_self.copyWith(businessDays: value));
    });
  }
}

/// @nodoc
mixin _$CategoryDM {
  @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
  FoodlyCategories? get id;
  @JsonKey(name: 'category_uuid')
  String? get categoryUuid;
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @JsonKey(name: 'category_image_path')
  String? get categoryImagePath;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDMCopyWith<CategoryDM> get copyWith =>
      _$CategoryDMCopyWithImpl<CategoryDM>(this as CategoryDM, _$identity);

  /// Serializes this CategoryDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDM &&
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

  @override
  String toString() {
    return 'CategoryDM(id: $id, categoryUuid: $categoryUuid, categoryName: $categoryName, categoryImagePath: $categoryImagePath)';
  }
}

/// @nodoc
abstract mixin class $CategoryDMCopyWith<$Res> {
  factory $CategoryDMCopyWith(
          CategoryDM value, $Res Function(CategoryDM) _then) =
      _$CategoryDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
      FoodlyCategories? id,
      @JsonKey(name: 'category_uuid') String? categoryUuid,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image_path') String? categoryImagePath});
}

/// @nodoc
class _$CategoryDMCopyWithImpl<$Res> implements $CategoryDMCopyWith<$Res> {
  _$CategoryDMCopyWithImpl(this._self, this._then);

  final CategoryDM _self;
  final $Res Function(CategoryDM) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      categoryUuid: freezed == categoryUuid
          ? _self.categoryUuid
          : categoryUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _self.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoryDM].
extension CategoryDMPatterns on CategoryDM {
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
    TResult Function(_CategoryDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
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
    TResult Function(_CategoryDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM():
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
    TResult? Function(_CategoryDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
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
            @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
            FoodlyCategories? id,
            @JsonKey(name: 'category_uuid') String? categoryUuid,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_image_path') String? categoryImagePath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
        return $default(_that.id, _that.categoryUuid, _that.categoryName,
            _that.categoryImagePath);
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
            @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
            FoodlyCategories? id,
            @JsonKey(name: 'category_uuid') String? categoryUuid,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_image_path') String? categoryImagePath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM():
        return $default(_that.id, _that.categoryUuid, _that.categoryName,
            _that.categoryImagePath);
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
            @JsonKey(name: 'id', fromJson: _safeCategoryFromJson)
            FoodlyCategories? id,
            @JsonKey(name: 'category_uuid') String? categoryUuid,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_image_path') String? categoryImagePath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
        return $default(_that.id, _that.categoryUuid, _that.categoryName,
            _that.categoryImagePath);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryDM implements CategoryDM {
  const _CategoryDM(
      {@JsonKey(name: 'id', fromJson: _safeCategoryFromJson) this.id,
      @JsonKey(name: 'category_uuid') this.categoryUuid,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_image_path') this.categoryImagePath});
  factory _CategoryDM.fromJson(Map<String, dynamic> json) =>
      _$CategoryDMFromJson(json);

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

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDMCopyWith<_CategoryDM> get copyWith =>
      __$CategoryDMCopyWithImpl<_CategoryDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDM &&
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

  @override
  String toString() {
    return 'CategoryDM(id: $id, categoryUuid: $categoryUuid, categoryName: $categoryName, categoryImagePath: $categoryImagePath)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDMCopyWith<$Res>
    implements $CategoryDMCopyWith<$Res> {
  factory _$CategoryDMCopyWith(
          _CategoryDM value, $Res Function(_CategoryDM) _then) =
      __$CategoryDMCopyWithImpl;
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
class __$CategoryDMCopyWithImpl<$Res> implements _$CategoryDMCopyWith<$Res> {
  __$CategoryDMCopyWithImpl(this._self, this._then);

  final _CategoryDM _self;
  final $Res Function(_CategoryDM) _then;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? categoryUuid = freezed,
    Object? categoryName = freezed,
    Object? categoryImagePath = freezed,
  }) {
    return _then(_CategoryDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      categoryUuid: freezed == categoryUuid
          ? _self.categoryUuid
          : categoryUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _self.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

BusinessServicesDM _$BusinessServicesDMFromJson(Map<String, dynamic> json) {
  return _BusinessServiceDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessServicesDM {
  @JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  BusinessServices? get service;
  @JsonKey(name: 'service_uuid')
  String? get uuid;
  @JsonKey(name: 'service_name')
  String? get serviceName;
  @JsonKey(name: 'service_description')
  String? get serviceDescriptio;
  @JsonKey(name: 'service_image_path')
  String? get serviceImagePath;

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessServicesDMCopyWith<BusinessServicesDM> get copyWith =>
      _$BusinessServicesDMCopyWithImpl<BusinessServicesDM>(
          this as BusinessServicesDM, _$identity);

  /// Serializes this BusinessServicesDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessServicesDM &&
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

  @override
  String toString() {
    return 'BusinessServicesDM(service: $service, uuid: $uuid, serviceName: $serviceName, serviceDescriptio: $serviceDescriptio, serviceImagePath: $serviceImagePath)';
  }
}

/// @nodoc
abstract mixin class $BusinessServicesDMCopyWith<$Res> {
  factory $BusinessServicesDMCopyWith(
          BusinessServicesDM value, $Res Function(BusinessServicesDM) _then) =
      _$BusinessServicesDMCopyWithImpl;
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
class _$BusinessServicesDMCopyWithImpl<$Res>
    implements $BusinessServicesDMCopyWith<$Res> {
  _$BusinessServicesDMCopyWithImpl(this._self, this._then);

  final BusinessServicesDM _self;
  final $Res Function(BusinessServicesDM) _then;

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
    return _then(_self.copyWith(
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as BusinessServices?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: freezed == serviceName
          ? _self.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDescriptio: freezed == serviceDescriptio
          ? _self.serviceDescriptio
          : serviceDescriptio // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceImagePath: freezed == serviceImagePath
          ? _self.serviceImagePath
          : serviceImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessServicesDM].
extension BusinessServicesDMPatterns on BusinessServicesDM {
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
    TResult Function(_BusinessServiceDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessServiceDM() when $default != null:
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
    TResult Function(_BusinessServiceDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessServiceDM():
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
    TResult? Function(_BusinessServiceDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessServiceDM() when $default != null:
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
            @JsonKey(
                name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            BusinessServices? service,
            @JsonKey(name: 'service_uuid') String? uuid,
            @JsonKey(name: 'service_name') String? serviceName,
            @JsonKey(name: 'service_description') String? serviceDescriptio,
            @JsonKey(name: 'service_image_path') String? serviceImagePath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessServiceDM() when $default != null:
        return $default(_that.service, _that.uuid, _that.serviceName,
            _that.serviceDescriptio, _that.serviceImagePath);
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
            @JsonKey(
                name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            BusinessServices? service,
            @JsonKey(name: 'service_uuid') String? uuid,
            @JsonKey(name: 'service_name') String? serviceName,
            @JsonKey(name: 'service_description') String? serviceDescriptio,
            @JsonKey(name: 'service_image_path') String? serviceImagePath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessServiceDM():
        return $default(_that.service, _that.uuid, _that.serviceName,
            _that.serviceDescriptio, _that.serviceImagePath);
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
            @JsonKey(
                name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            BusinessServices? service,
            @JsonKey(name: 'service_uuid') String? uuid,
            @JsonKey(name: 'service_name') String? serviceName,
            @JsonKey(name: 'service_description') String? serviceDescriptio,
            @JsonKey(name: 'service_image_path') String? serviceImagePath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessServiceDM() when $default != null:
        return $default(_that.service, _that.uuid, _that.serviceName,
            _that.serviceDescriptio, _that.serviceImagePath);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessServiceDM extends BusinessServicesDM {
  const _BusinessServiceDM(
      {@JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.service,
      @JsonKey(name: 'service_uuid') this.uuid,
      @JsonKey(name: 'service_name') this.serviceName,
      @JsonKey(name: 'service_description') this.serviceDescriptio,
      @JsonKey(name: 'service_image_path') this.serviceImagePath})
      : super._();
  factory _BusinessServiceDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessServiceDMFromJson(json);

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

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessServiceDMCopyWith<_BusinessServiceDM> get copyWith =>
      __$BusinessServiceDMCopyWithImpl<_BusinessServiceDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessServiceDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessServiceDM &&
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

  @override
  String toString() {
    return 'BusinessServicesDM(service: $service, uuid: $uuid, serviceName: $serviceName, serviceDescriptio: $serviceDescriptio, serviceImagePath: $serviceImagePath)';
  }
}

/// @nodoc
abstract mixin class _$BusinessServiceDMCopyWith<$Res>
    implements $BusinessServicesDMCopyWith<$Res> {
  factory _$BusinessServiceDMCopyWith(
          _BusinessServiceDM value, $Res Function(_BusinessServiceDM) _then) =
      __$BusinessServiceDMCopyWithImpl;
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
class __$BusinessServiceDMCopyWithImpl<$Res>
    implements _$BusinessServiceDMCopyWith<$Res> {
  __$BusinessServiceDMCopyWithImpl(this._self, this._then);

  final _BusinessServiceDM _self;
  final $Res Function(_BusinessServiceDM) _then;

  /// Create a copy of BusinessServicesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = freezed,
    Object? uuid = freezed,
    Object? serviceName = freezed,
    Object? serviceDescriptio = freezed,
    Object? serviceImagePath = freezed,
  }) {
    return _then(_BusinessServiceDM(
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as BusinessServices?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: freezed == serviceName
          ? _self.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDescriptio: freezed == serviceDescriptio
          ? _self.serviceDescriptio
          : serviceDescriptio // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceImagePath: freezed == serviceImagePath
          ? _self.serviceImagePath
          : serviceImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
