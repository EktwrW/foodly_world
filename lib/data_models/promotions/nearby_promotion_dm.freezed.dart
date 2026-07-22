// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_promotion_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyPromotionDM {
  String get uuid;
  String get title;
  @JsonKey(name: 'sub_title')
  String get subTitle;
  @JsonKey(name: 'media_link')
  String? get mediaLink;
  @JsonKey(name: 'promo_media')
  PromoMediaLiteDM?
      get promoMedia; // Defensivo: business_name es nullable en la tabla businesses (BE) y
// business_uuid podría faltar en datos de borde. Con @Default('') una sola
// promo con esos campos vacíos no aborta el parse de toda la lista
// (json_serializable mapea la List entera; si un item tira, caen todos).
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @JsonKey(name: 'business_name')
  String get businessName;
  @JsonKey(name: 'business_logo')
  String? get businessLogo;
  @JsonKey(name: 'rating_avg')
  double get ratingAvg;
  @JsonKey(name: 'is_favorited')
  bool get isFavorited;
  @JsonKey(name: 'distance_km')
  double? get distanceKm;
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @JsonKey(name: 'expire_date')
  DateTime? get expireDate;

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyPromotionDMCopyWith<NearbyPromotionDM> get copyWith =>
      _$NearbyPromotionDMCopyWithImpl<NearbyPromotionDM>(
          this as NearbyPromotionDM, _$identity);

  /// Serializes this NearbyPromotionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyPromotionDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink) &&
            (identical(other.promoMedia, promoMedia) ||
                other.promoMedia == promoMedia) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessLogo, businessLogo) ||
                other.businessLogo == businessLogo) &&
            (identical(other.ratingAvg, ratingAvg) ||
                other.ratingAvg == ratingAvg) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      subTitle,
      mediaLink,
      promoMedia,
      businessUuid,
      businessName,
      businessLogo,
      ratingAvg,
      isFavorited,
      distanceKm,
      startDate,
      expireDate);

  @override
  String toString() {
    return 'NearbyPromotionDM(uuid: $uuid, title: $title, subTitle: $subTitle, mediaLink: $mediaLink, promoMedia: $promoMedia, businessUuid: $businessUuid, businessName: $businessName, businessLogo: $businessLogo, ratingAvg: $ratingAvg, isFavorited: $isFavorited, distanceKm: $distanceKm, startDate: $startDate, expireDate: $expireDate)';
  }
}

/// @nodoc
abstract mixin class $NearbyPromotionDMCopyWith<$Res> {
  factory $NearbyPromotionDMCopyWith(
          NearbyPromotionDM value, $Res Function(NearbyPromotionDM) _then) =
      _$NearbyPromotionDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String title,
      @JsonKey(name: 'sub_title') String subTitle,
      @JsonKey(name: 'media_link') String? mediaLink,
      @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_logo') String? businessLogo,
      @JsonKey(name: 'rating_avg') double ratingAvg,
      @JsonKey(name: 'is_favorited') bool isFavorited,
      @JsonKey(name: 'distance_km') double? distanceKm,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'expire_date') DateTime? expireDate});

  $PromoMediaLiteDMCopyWith<$Res>? get promoMedia;
}

/// @nodoc
class _$NearbyPromotionDMCopyWithImpl<$Res>
    implements $NearbyPromotionDMCopyWith<$Res> {
  _$NearbyPromotionDMCopyWithImpl(this._self, this._then);

  final NearbyPromotionDM _self;
  final $Res Function(NearbyPromotionDM) _then;

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? subTitle = null,
    Object? mediaLink = freezed,
    Object? promoMedia = freezed,
    Object? businessUuid = null,
    Object? businessName = null,
    Object? businessLogo = freezed,
    Object? ratingAvg = null,
    Object? isFavorited = null,
    Object? distanceKm = freezed,
    Object? startDate = freezed,
    Object? expireDate = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      mediaLink: freezed == mediaLink
          ? _self.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: freezed == promoMedia
          ? _self.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as PromoMediaLiteDM?,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _self.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingAvg: null == ratingAvg
          ? _self.ratingAvg
          : ratingAvg // ignore: cast_nullable_to_non_nullable
              as double,
      isFavorited: null == isFavorited
          ? _self.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceKm: freezed == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: freezed == expireDate
          ? _self.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoMediaLiteDMCopyWith<$Res>? get promoMedia {
    if (_self.promoMedia == null) {
      return null;
    }

    return $PromoMediaLiteDMCopyWith<$Res>(_self.promoMedia!, (value) {
      return _then(_self.copyWith(promoMedia: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NearbyPromotionDM].
extension NearbyPromotionDMPatterns on NearbyPromotionDM {
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
    TResult Function(_NearbyPromotionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionDM() when $default != null:
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
    TResult Function(_NearbyPromotionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionDM():
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
    TResult? Function(_NearbyPromotionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionDM() when $default != null:
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
            String uuid,
            String title,
            @JsonKey(name: 'sub_title') String subTitle,
            @JsonKey(name: 'media_link') String? mediaLink,
            @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            @JsonKey(name: 'rating_avg') double ratingAvg,
            @JsonKey(name: 'is_favorited') bool isFavorited,
            @JsonKey(name: 'distance_km') double? distanceKm,
            @JsonKey(name: 'start_date') DateTime? startDate,
            @JsonKey(name: 'expire_date') DateTime? expireDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionDM() when $default != null:
        return $default(
            _that.uuid,
            _that.title,
            _that.subTitle,
            _that.mediaLink,
            _that.promoMedia,
            _that.businessUuid,
            _that.businessName,
            _that.businessLogo,
            _that.ratingAvg,
            _that.isFavorited,
            _that.distanceKm,
            _that.startDate,
            _that.expireDate);
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
            String uuid,
            String title,
            @JsonKey(name: 'sub_title') String subTitle,
            @JsonKey(name: 'media_link') String? mediaLink,
            @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            @JsonKey(name: 'rating_avg') double ratingAvg,
            @JsonKey(name: 'is_favorited') bool isFavorited,
            @JsonKey(name: 'distance_km') double? distanceKm,
            @JsonKey(name: 'start_date') DateTime? startDate,
            @JsonKey(name: 'expire_date') DateTime? expireDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionDM():
        return $default(
            _that.uuid,
            _that.title,
            _that.subTitle,
            _that.mediaLink,
            _that.promoMedia,
            _that.businessUuid,
            _that.businessName,
            _that.businessLogo,
            _that.ratingAvg,
            _that.isFavorited,
            _that.distanceKm,
            _that.startDate,
            _that.expireDate);
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
            String uuid,
            String title,
            @JsonKey(name: 'sub_title') String subTitle,
            @JsonKey(name: 'media_link') String? mediaLink,
            @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            @JsonKey(name: 'rating_avg') double ratingAvg,
            @JsonKey(name: 'is_favorited') bool isFavorited,
            @JsonKey(name: 'distance_km') double? distanceKm,
            @JsonKey(name: 'start_date') DateTime? startDate,
            @JsonKey(name: 'expire_date') DateTime? expireDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionDM() when $default != null:
        return $default(
            _that.uuid,
            _that.title,
            _that.subTitle,
            _that.mediaLink,
            _that.promoMedia,
            _that.businessUuid,
            _that.businessName,
            _that.businessLogo,
            _that.ratingAvg,
            _that.isFavorited,
            _that.distanceKm,
            _that.startDate,
            _that.expireDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyPromotionDM extends NearbyPromotionDM {
  const _NearbyPromotionDM(
      {required this.uuid,
      required this.title,
      @JsonKey(name: 'sub_title') this.subTitle = '',
      @JsonKey(name: 'media_link') this.mediaLink,
      @JsonKey(name: 'promo_media') this.promoMedia,
      @JsonKey(name: 'business_uuid') this.businessUuid = '',
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_logo') this.businessLogo,
      @JsonKey(name: 'rating_avg') this.ratingAvg = 0.0,
      @JsonKey(name: 'is_favorited') this.isFavorited = false,
      @JsonKey(name: 'distance_km') this.distanceKm,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'expire_date') this.expireDate})
      : super._();
  factory _NearbyPromotionDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyPromotionDMFromJson(json);

  @override
  final String uuid;
  @override
  final String title;
  @override
  @JsonKey(name: 'sub_title')
  final String subTitle;
  @override
  @JsonKey(name: 'media_link')
  final String? mediaLink;
  @override
  @JsonKey(name: 'promo_media')
  final PromoMediaLiteDM? promoMedia;
// Defensivo: business_name es nullable en la tabla businesses (BE) y
// business_uuid podría faltar en datos de borde. Con @Default('') una sola
// promo con esos campos vacíos no aborta el parse de toda la lista
// (json_serializable mapea la List entera; si un item tira, caen todos).
  @override
  @JsonKey(name: 'business_uuid')
  final String businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_logo')
  final String? businessLogo;
  @override
  @JsonKey(name: 'rating_avg')
  final double ratingAvg;
  @override
  @JsonKey(name: 'is_favorited')
  final bool isFavorited;
  @override
  @JsonKey(name: 'distance_km')
  final double? distanceKm;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'expire_date')
  final DateTime? expireDate;

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyPromotionDMCopyWith<_NearbyPromotionDM> get copyWith =>
      __$NearbyPromotionDMCopyWithImpl<_NearbyPromotionDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyPromotionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyPromotionDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink) &&
            (identical(other.promoMedia, promoMedia) ||
                other.promoMedia == promoMedia) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessLogo, businessLogo) ||
                other.businessLogo == businessLogo) &&
            (identical(other.ratingAvg, ratingAvg) ||
                other.ratingAvg == ratingAvg) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      subTitle,
      mediaLink,
      promoMedia,
      businessUuid,
      businessName,
      businessLogo,
      ratingAvg,
      isFavorited,
      distanceKm,
      startDate,
      expireDate);

  @override
  String toString() {
    return 'NearbyPromotionDM(uuid: $uuid, title: $title, subTitle: $subTitle, mediaLink: $mediaLink, promoMedia: $promoMedia, businessUuid: $businessUuid, businessName: $businessName, businessLogo: $businessLogo, ratingAvg: $ratingAvg, isFavorited: $isFavorited, distanceKm: $distanceKm, startDate: $startDate, expireDate: $expireDate)';
  }
}

/// @nodoc
abstract mixin class _$NearbyPromotionDMCopyWith<$Res>
    implements $NearbyPromotionDMCopyWith<$Res> {
  factory _$NearbyPromotionDMCopyWith(
          _NearbyPromotionDM value, $Res Function(_NearbyPromotionDM) _then) =
      __$NearbyPromotionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      @JsonKey(name: 'sub_title') String subTitle,
      @JsonKey(name: 'media_link') String? mediaLink,
      @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_logo') String? businessLogo,
      @JsonKey(name: 'rating_avg') double ratingAvg,
      @JsonKey(name: 'is_favorited') bool isFavorited,
      @JsonKey(name: 'distance_km') double? distanceKm,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'expire_date') DateTime? expireDate});

  @override
  $PromoMediaLiteDMCopyWith<$Res>? get promoMedia;
}

/// @nodoc
class __$NearbyPromotionDMCopyWithImpl<$Res>
    implements _$NearbyPromotionDMCopyWith<$Res> {
  __$NearbyPromotionDMCopyWithImpl(this._self, this._then);

  final _NearbyPromotionDM _self;
  final $Res Function(_NearbyPromotionDM) _then;

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? subTitle = null,
    Object? mediaLink = freezed,
    Object? promoMedia = freezed,
    Object? businessUuid = null,
    Object? businessName = null,
    Object? businessLogo = freezed,
    Object? ratingAvg = null,
    Object? isFavorited = null,
    Object? distanceKm = freezed,
    Object? startDate = freezed,
    Object? expireDate = freezed,
  }) {
    return _then(_NearbyPromotionDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      mediaLink: freezed == mediaLink
          ? _self.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: freezed == promoMedia
          ? _self.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as PromoMediaLiteDM?,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _self.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingAvg: null == ratingAvg
          ? _self.ratingAvg
          : ratingAvg // ignore: cast_nullable_to_non_nullable
              as double,
      isFavorited: null == isFavorited
          ? _self.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceKm: freezed == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: freezed == expireDate
          ? _self.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoMediaLiteDMCopyWith<$Res>? get promoMedia {
    if (_self.promoMedia == null) {
      return null;
    }

    return $PromoMediaLiteDMCopyWith<$Res>(_self.promoMedia!, (value) {
      return _then(_self.copyWith(promoMedia: value));
    });
  }
}

/// @nodoc
mixin _$PromoMediaLiteDM {
  String get uuid;
  @JsonKey(name: 'business_promo_media_url')
  String get mediaUrl;
  @JsonKey(name: 'media_type')
  String get mediaType;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromoMediaLiteDMCopyWith<PromoMediaLiteDM> get copyWith =>
      _$PromoMediaLiteDMCopyWithImpl<PromoMediaLiteDM>(
          this as PromoMediaLiteDM, _$identity);

  /// Serializes this PromoMediaLiteDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromoMediaLiteDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, mediaUrl, mediaType);

  @override
  String toString() {
    return 'PromoMediaLiteDM(uuid: $uuid, mediaUrl: $mediaUrl, mediaType: $mediaType)';
  }
}

/// @nodoc
abstract mixin class $PromoMediaLiteDMCopyWith<$Res> {
  factory $PromoMediaLiteDMCopyWith(
          PromoMediaLiteDM value, $Res Function(PromoMediaLiteDM) _then) =
      _$PromoMediaLiteDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'media_type') String mediaType});
}

/// @nodoc
class _$PromoMediaLiteDMCopyWithImpl<$Res>
    implements $PromoMediaLiteDMCopyWith<$Res> {
  _$PromoMediaLiteDMCopyWithImpl(this._self, this._then);

  final PromoMediaLiteDM _self;
  final $Res Function(PromoMediaLiteDM) _then;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromoMediaLiteDM].
extension PromoMediaLiteDMPatterns on PromoMediaLiteDM {
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
    TResult Function(_PromoMediaLiteDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoMediaLiteDM() when $default != null:
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
    TResult Function(_PromoMediaLiteDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaLiteDM():
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
    TResult? Function(_PromoMediaLiteDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaLiteDM() when $default != null:
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
            String uuid,
            @JsonKey(name: 'business_promo_media_url') String mediaUrl,
            @JsonKey(name: 'media_type') String mediaType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoMediaLiteDM() when $default != null:
        return $default(_that.uuid, _that.mediaUrl, _that.mediaType);
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
            String uuid,
            @JsonKey(name: 'business_promo_media_url') String mediaUrl,
            @JsonKey(name: 'media_type') String mediaType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaLiteDM():
        return $default(_that.uuid, _that.mediaUrl, _that.mediaType);
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
            String uuid,
            @JsonKey(name: 'business_promo_media_url') String mediaUrl,
            @JsonKey(name: 'media_type') String mediaType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaLiteDM() when $default != null:
        return $default(_that.uuid, _that.mediaUrl, _that.mediaType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromoMediaLiteDM extends PromoMediaLiteDM {
  const _PromoMediaLiteDM(
      {required this.uuid,
      @JsonKey(name: 'business_promo_media_url') required this.mediaUrl,
      @JsonKey(name: 'media_type') this.mediaType = 'Image'})
      : super._();
  factory _PromoMediaLiteDM.fromJson(Map<String, dynamic> json) =>
      _$PromoMediaLiteDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey(name: 'business_promo_media_url')
  final String mediaUrl;
  @override
  @JsonKey(name: 'media_type')
  final String mediaType;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromoMediaLiteDMCopyWith<_PromoMediaLiteDM> get copyWith =>
      __$PromoMediaLiteDMCopyWithImpl<_PromoMediaLiteDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromoMediaLiteDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromoMediaLiteDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, mediaUrl, mediaType);

  @override
  String toString() {
    return 'PromoMediaLiteDM(uuid: $uuid, mediaUrl: $mediaUrl, mediaType: $mediaType)';
  }
}

/// @nodoc
abstract mixin class _$PromoMediaLiteDMCopyWith<$Res>
    implements $PromoMediaLiteDMCopyWith<$Res> {
  factory _$PromoMediaLiteDMCopyWith(
          _PromoMediaLiteDM value, $Res Function(_PromoMediaLiteDM) _then) =
      __$PromoMediaLiteDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'media_type') String mediaType});
}

/// @nodoc
class __$PromoMediaLiteDMCopyWithImpl<$Res>
    implements _$PromoMediaLiteDMCopyWith<$Res> {
  __$PromoMediaLiteDMCopyWithImpl(this._self, this._then);

  final _PromoMediaLiteDM _self;
  final $Res Function(_PromoMediaLiteDM) _then;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_PromoMediaLiteDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$NearbyPromotionsResponseDM {
  List<NearbyPromotionDM> get data;
  NearbyPromotionsMeta get meta;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyPromotionsResponseDMCopyWith<NearbyPromotionsResponseDM>
      get copyWith =>
          _$NearbyPromotionsResponseDMCopyWithImpl<NearbyPromotionsResponseDM>(
              this as NearbyPromotionsResponseDM, _$identity);

  /// Serializes this NearbyPromotionsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyPromotionsResponseDM &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), meta);

  @override
  String toString() {
    return 'NearbyPromotionsResponseDM(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $NearbyPromotionsResponseDMCopyWith<$Res> {
  factory $NearbyPromotionsResponseDMCopyWith(NearbyPromotionsResponseDM value,
          $Res Function(NearbyPromotionsResponseDM) _then) =
      _$NearbyPromotionsResponseDMCopyWithImpl;
  @useResult
  $Res call({List<NearbyPromotionDM> data, NearbyPromotionsMeta meta});

  $NearbyPromotionsMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$NearbyPromotionsResponseDMCopyWithImpl<$Res>
    implements $NearbyPromotionsResponseDMCopyWith<$Res> {
  _$NearbyPromotionsResponseDMCopyWithImpl(this._self, this._then);

  final NearbyPromotionsResponseDM _self;
  final $Res Function(NearbyPromotionsResponseDM) _then;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyPromotionsMeta,
    ));
  }

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyPromotionsMetaCopyWith<$Res> get meta {
    return $NearbyPromotionsMetaCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NearbyPromotionsResponseDM].
extension NearbyPromotionsResponseDMPatterns on NearbyPromotionsResponseDM {
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
    TResult Function(_NearbyPromotionsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsResponseDM() when $default != null:
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
    TResult Function(_NearbyPromotionsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsResponseDM():
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
    TResult? Function(_NearbyPromotionsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsResponseDM() when $default != null:
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
    TResult Function(List<NearbyPromotionDM> data, NearbyPromotionsMeta meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsResponseDM() when $default != null:
        return $default(_that.data, _that.meta);
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
    TResult Function(List<NearbyPromotionDM> data, NearbyPromotionsMeta meta)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsResponseDM():
        return $default(_that.data, _that.meta);
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
    TResult? Function(List<NearbyPromotionDM> data, NearbyPromotionsMeta meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsResponseDM() when $default != null:
        return $default(_that.data, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyPromotionsResponseDM implements NearbyPromotionsResponseDM {
  const _NearbyPromotionsResponseDM(
      {required final List<NearbyPromotionDM> data, required this.meta})
      : _data = data;
  factory _NearbyPromotionsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyPromotionsResponseDMFromJson(json);

  final List<NearbyPromotionDM> _data;
  @override
  List<NearbyPromotionDM> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final NearbyPromotionsMeta meta;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyPromotionsResponseDMCopyWith<_NearbyPromotionsResponseDM>
      get copyWith => __$NearbyPromotionsResponseDMCopyWithImpl<
          _NearbyPromotionsResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyPromotionsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyPromotionsResponseDM &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @override
  String toString() {
    return 'NearbyPromotionsResponseDM(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$NearbyPromotionsResponseDMCopyWith<$Res>
    implements $NearbyPromotionsResponseDMCopyWith<$Res> {
  factory _$NearbyPromotionsResponseDMCopyWith(
          _NearbyPromotionsResponseDM value,
          $Res Function(_NearbyPromotionsResponseDM) _then) =
      __$NearbyPromotionsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<NearbyPromotionDM> data, NearbyPromotionsMeta meta});

  @override
  $NearbyPromotionsMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$NearbyPromotionsResponseDMCopyWithImpl<$Res>
    implements _$NearbyPromotionsResponseDMCopyWith<$Res> {
  __$NearbyPromotionsResponseDMCopyWithImpl(this._self, this._then);

  final _NearbyPromotionsResponseDM _self;
  final $Res Function(_NearbyPromotionsResponseDM) _then;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_NearbyPromotionsResponseDM(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyPromotionsMeta,
    ));
  }

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyPromotionsMetaCopyWith<$Res> get meta {
    return $NearbyPromotionsMetaCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$NearbyPromotionsMeta {
  int get total;
  int get page;
  @JsonKey(name: 'per_page')
  int get perPage;
  @JsonKey(name: 'has_more')
  bool get hasMore;
  @JsonKey(name: 'max_total')
  int get maxTotal;
  @JsonKey(name: 'radius_km')
  double get radiusKm;

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyPromotionsMetaCopyWith<NearbyPromotionsMeta> get copyWith =>
      _$NearbyPromotionsMetaCopyWithImpl<NearbyPromotionsMeta>(
          this as NearbyPromotionsMeta, _$identity);

  /// Serializes this NearbyPromotionsMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyPromotionsMeta &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.maxTotal, maxTotal) ||
                other.maxTotal == maxTotal) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, page, perPage, hasMore, maxTotal, radiusKm);

  @override
  String toString() {
    return 'NearbyPromotionsMeta(total: $total, page: $page, perPage: $perPage, hasMore: $hasMore, maxTotal: $maxTotal, radiusKm: $radiusKm)';
  }
}

/// @nodoc
abstract mixin class $NearbyPromotionsMetaCopyWith<$Res> {
  factory $NearbyPromotionsMetaCopyWith(NearbyPromotionsMeta value,
          $Res Function(NearbyPromotionsMeta) _then) =
      _$NearbyPromotionsMetaCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int page,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'has_more') bool hasMore,
      @JsonKey(name: 'max_total') int maxTotal,
      @JsonKey(name: 'radius_km') double radiusKm});
}

/// @nodoc
class _$NearbyPromotionsMetaCopyWithImpl<$Res>
    implements $NearbyPromotionsMetaCopyWith<$Res> {
  _$NearbyPromotionsMetaCopyWithImpl(this._self, this._then);

  final NearbyPromotionsMeta _self;
  final $Res Function(NearbyPromotionsMeta) _then;

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? perPage = null,
    Object? hasMore = null,
    Object? maxTotal = null,
    Object? radiusKm = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      maxTotal: null == maxTotal
          ? _self.maxTotal
          : maxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      radiusKm: null == radiusKm
          ? _self.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [NearbyPromotionsMeta].
extension NearbyPromotionsMetaPatterns on NearbyPromotionsMeta {
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
    TResult Function(_NearbyPromotionsMeta value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsMeta() when $default != null:
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
    TResult Function(_NearbyPromotionsMeta value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsMeta():
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
    TResult? Function(_NearbyPromotionsMeta value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsMeta() when $default != null:
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
            int total,
            int page,
            @JsonKey(name: 'per_page') int perPage,
            @JsonKey(name: 'has_more') bool hasMore,
            @JsonKey(name: 'max_total') int maxTotal,
            @JsonKey(name: 'radius_km') double radiusKm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsMeta() when $default != null:
        return $default(_that.total, _that.page, _that.perPage, _that.hasMore,
            _that.maxTotal, _that.radiusKm);
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
            int total,
            int page,
            @JsonKey(name: 'per_page') int perPage,
            @JsonKey(name: 'has_more') bool hasMore,
            @JsonKey(name: 'max_total') int maxTotal,
            @JsonKey(name: 'radius_km') double radiusKm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsMeta():
        return $default(_that.total, _that.page, _that.perPage, _that.hasMore,
            _that.maxTotal, _that.radiusKm);
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
            int total,
            int page,
            @JsonKey(name: 'per_page') int perPage,
            @JsonKey(name: 'has_more') bool hasMore,
            @JsonKey(name: 'max_total') int maxTotal,
            @JsonKey(name: 'radius_km') double radiusKm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsMeta() when $default != null:
        return $default(_that.total, _that.page, _that.perPage, _that.hasMore,
            _that.maxTotal, _that.radiusKm);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyPromotionsMeta implements NearbyPromotionsMeta {
  const _NearbyPromotionsMeta(
      {required this.total,
      required this.page,
      @JsonKey(name: 'per_page') required this.perPage,
      @JsonKey(name: 'has_more') required this.hasMore,
      @JsonKey(name: 'max_total') this.maxTotal = 50,
      @JsonKey(name: 'radius_km') this.radiusKm = 10.0});
  factory _NearbyPromotionsMeta.fromJson(Map<String, dynamic> json) =>
      _$NearbyPromotionsMetaFromJson(json);

  @override
  final int total;
  @override
  final int page;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'has_more')
  final bool hasMore;
  @override
  @JsonKey(name: 'max_total')
  final int maxTotal;
  @override
  @JsonKey(name: 'radius_km')
  final double radiusKm;

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyPromotionsMetaCopyWith<_NearbyPromotionsMeta> get copyWith =>
      __$NearbyPromotionsMetaCopyWithImpl<_NearbyPromotionsMeta>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyPromotionsMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyPromotionsMeta &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.maxTotal, maxTotal) ||
                other.maxTotal == maxTotal) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, page, perPage, hasMore, maxTotal, radiusKm);

  @override
  String toString() {
    return 'NearbyPromotionsMeta(total: $total, page: $page, perPage: $perPage, hasMore: $hasMore, maxTotal: $maxTotal, radiusKm: $radiusKm)';
  }
}

/// @nodoc
abstract mixin class _$NearbyPromotionsMetaCopyWith<$Res>
    implements $NearbyPromotionsMetaCopyWith<$Res> {
  factory _$NearbyPromotionsMetaCopyWith(_NearbyPromotionsMeta value,
          $Res Function(_NearbyPromotionsMeta) _then) =
      __$NearbyPromotionsMetaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int page,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'has_more') bool hasMore,
      @JsonKey(name: 'max_total') int maxTotal,
      @JsonKey(name: 'radius_km') double radiusKm});
}

/// @nodoc
class __$NearbyPromotionsMetaCopyWithImpl<$Res>
    implements _$NearbyPromotionsMetaCopyWith<$Res> {
  __$NearbyPromotionsMetaCopyWithImpl(this._self, this._then);

  final _NearbyPromotionsMeta _self;
  final $Res Function(_NearbyPromotionsMeta) _then;

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? perPage = null,
    Object? hasMore = null,
    Object? maxTotal = null,
    Object? radiusKm = null,
  }) {
    return _then(_NearbyPromotionsMeta(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      maxTotal: null == maxTotal
          ? _self.maxTotal
          : maxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      radiusKm: null == radiusKm
          ? _self.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
