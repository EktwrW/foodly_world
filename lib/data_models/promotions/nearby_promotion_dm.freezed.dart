// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_promotion_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbyPromotionDM _$NearbyPromotionDMFromJson(Map<String, dynamic> json) {
  return _NearbyPromotionDM.fromJson(json);
}

/// @nodoc
mixin _$NearbyPromotionDM {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_title')
  String get subTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_link')
  String? get mediaLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_media')
  PromoMediaLiteDM? get promoMedia => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_logo')
  String? get businessLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_avg')
  double get ratingAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorited')
  bool get isFavorited => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_km')
  double? get distanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire_date')
  DateTime? get expireDate => throw _privateConstructorUsedError;

  /// Serializes this NearbyPromotionDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyPromotionDMCopyWith<NearbyPromotionDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyPromotionDMCopyWith<$Res> {
  factory $NearbyPromotionDMCopyWith(
          NearbyPromotionDM value, $Res Function(NearbyPromotionDM) then) =
      _$NearbyPromotionDMCopyWithImpl<$Res, NearbyPromotionDM>;
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
class _$NearbyPromotionDMCopyWithImpl<$Res, $Val extends NearbyPromotionDM>
    implements $NearbyPromotionDMCopyWith<$Res> {
  _$NearbyPromotionDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      mediaLink: freezed == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: freezed == promoMedia
          ? _value.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as PromoMediaLiteDM?,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _value.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingAvg: null == ratingAvg
          ? _value.ratingAvg
          : ratingAvg // ignore: cast_nullable_to_non_nullable
              as double,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoMediaLiteDMCopyWith<$Res>? get promoMedia {
    if (_value.promoMedia == null) {
      return null;
    }

    return $PromoMediaLiteDMCopyWith<$Res>(_value.promoMedia!, (value) {
      return _then(_value.copyWith(promoMedia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearbyPromotionDMImplCopyWith<$Res>
    implements $NearbyPromotionDMCopyWith<$Res> {
  factory _$$NearbyPromotionDMImplCopyWith(_$NearbyPromotionDMImpl value,
          $Res Function(_$NearbyPromotionDMImpl) then) =
      __$$NearbyPromotionDMImplCopyWithImpl<$Res>;
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
class __$$NearbyPromotionDMImplCopyWithImpl<$Res>
    extends _$NearbyPromotionDMCopyWithImpl<$Res, _$NearbyPromotionDMImpl>
    implements _$$NearbyPromotionDMImplCopyWith<$Res> {
  __$$NearbyPromotionDMImplCopyWithImpl(_$NearbyPromotionDMImpl _value,
      $Res Function(_$NearbyPromotionDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$NearbyPromotionDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      mediaLink: freezed == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: freezed == promoMedia
          ? _value.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as PromoMediaLiteDM?,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _value.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingAvg: null == ratingAvg
          ? _value.ratingAvg
          : ratingAvg // ignore: cast_nullable_to_non_nullable
              as double,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyPromotionDMImpl extends _NearbyPromotionDM {
  const _$NearbyPromotionDMImpl(
      {required this.uuid,
      required this.title,
      @JsonKey(name: 'sub_title') this.subTitle = '',
      @JsonKey(name: 'media_link') this.mediaLink,
      @JsonKey(name: 'promo_media') this.promoMedia,
      @JsonKey(name: 'business_uuid') required this.businessUuid,
      @JsonKey(name: 'business_name') required this.businessName,
      @JsonKey(name: 'business_logo') this.businessLogo,
      @JsonKey(name: 'rating_avg') this.ratingAvg = 0.0,
      @JsonKey(name: 'is_favorited') this.isFavorited = false,
      @JsonKey(name: 'distance_km') this.distanceKm,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'expire_date') this.expireDate})
      : super._();

  factory _$NearbyPromotionDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyPromotionDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NearbyPromotionDM(uuid: $uuid, title: $title, subTitle: $subTitle, mediaLink: $mediaLink, promoMedia: $promoMedia, businessUuid: $businessUuid, businessName: $businessName, businessLogo: $businessLogo, ratingAvg: $ratingAvg, isFavorited: $isFavorited, distanceKm: $distanceKm, startDate: $startDate, expireDate: $expireDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyPromotionDMImpl &&
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

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyPromotionDMImplCopyWith<_$NearbyPromotionDMImpl> get copyWith =>
      __$$NearbyPromotionDMImplCopyWithImpl<_$NearbyPromotionDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyPromotionDMImplToJson(
      this,
    );
  }
}

abstract class _NearbyPromotionDM extends NearbyPromotionDM {
  const factory _NearbyPromotionDM(
          {required final String uuid,
          required final String title,
          @JsonKey(name: 'sub_title') final String subTitle,
          @JsonKey(name: 'media_link') final String? mediaLink,
          @JsonKey(name: 'promo_media') final PromoMediaLiteDM? promoMedia,
          @JsonKey(name: 'business_uuid') required final String businessUuid,
          @JsonKey(name: 'business_name') required final String businessName,
          @JsonKey(name: 'business_logo') final String? businessLogo,
          @JsonKey(name: 'rating_avg') final double ratingAvg,
          @JsonKey(name: 'is_favorited') final bool isFavorited,
          @JsonKey(name: 'distance_km') final double? distanceKm,
          @JsonKey(name: 'start_date') final DateTime? startDate,
          @JsonKey(name: 'expire_date') final DateTime? expireDate}) =
      _$NearbyPromotionDMImpl;
  const _NearbyPromotionDM._() : super._();

  factory _NearbyPromotionDM.fromJson(Map<String, dynamic> json) =
      _$NearbyPromotionDMImpl.fromJson;

  @override
  String get uuid;
  @override
  String get title;
  @override
  @JsonKey(name: 'sub_title')
  String get subTitle;
  @override
  @JsonKey(name: 'media_link')
  String? get mediaLink;
  @override
  @JsonKey(name: 'promo_media')
  PromoMediaLiteDM? get promoMedia;
  @override
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @override
  @JsonKey(name: 'business_name')
  String get businessName;
  @override
  @JsonKey(name: 'business_logo')
  String? get businessLogo;
  @override
  @JsonKey(name: 'rating_avg')
  double get ratingAvg;
  @override
  @JsonKey(name: 'is_favorited')
  bool get isFavorited;
  @override
  @JsonKey(name: 'distance_km')
  double? get distanceKm;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'expire_date')
  DateTime? get expireDate;

  /// Create a copy of NearbyPromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyPromotionDMImplCopyWith<_$NearbyPromotionDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromoMediaLiteDM _$PromoMediaLiteDMFromJson(Map<String, dynamic> json) {
  return _PromoMediaLiteDM.fromJson(json);
}

/// @nodoc
mixin _$PromoMediaLiteDM {
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_promo_media_url')
  String get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String get mediaType => throw _privateConstructorUsedError;

  /// Serializes this PromoMediaLiteDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoMediaLiteDMCopyWith<PromoMediaLiteDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoMediaLiteDMCopyWith<$Res> {
  factory $PromoMediaLiteDMCopyWith(
          PromoMediaLiteDM value, $Res Function(PromoMediaLiteDM) then) =
      _$PromoMediaLiteDMCopyWithImpl<$Res, PromoMediaLiteDM>;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'media_type') String mediaType});
}

/// @nodoc
class _$PromoMediaLiteDMCopyWithImpl<$Res, $Val extends PromoMediaLiteDM>
    implements $PromoMediaLiteDMCopyWith<$Res> {
  _$PromoMediaLiteDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoMediaLiteDMImplCopyWith<$Res>
    implements $PromoMediaLiteDMCopyWith<$Res> {
  factory _$$PromoMediaLiteDMImplCopyWith(_$PromoMediaLiteDMImpl value,
          $Res Function(_$PromoMediaLiteDMImpl) then) =
      __$$PromoMediaLiteDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'media_type') String mediaType});
}

/// @nodoc
class __$$PromoMediaLiteDMImplCopyWithImpl<$Res>
    extends _$PromoMediaLiteDMCopyWithImpl<$Res, _$PromoMediaLiteDMImpl>
    implements _$$PromoMediaLiteDMImplCopyWith<$Res> {
  __$$PromoMediaLiteDMImplCopyWithImpl(_$PromoMediaLiteDMImpl _value,
      $Res Function(_$PromoMediaLiteDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_$PromoMediaLiteDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoMediaLiteDMImpl extends _PromoMediaLiteDM {
  const _$PromoMediaLiteDMImpl(
      {required this.uuid,
      @JsonKey(name: 'business_promo_media_url') required this.mediaUrl,
      @JsonKey(name: 'media_type') this.mediaType = 'Image'})
      : super._();

  factory _$PromoMediaLiteDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoMediaLiteDMImplFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey(name: 'business_promo_media_url')
  final String mediaUrl;
  @override
  @JsonKey(name: 'media_type')
  final String mediaType;

  @override
  String toString() {
    return 'PromoMediaLiteDM(uuid: $uuid, mediaUrl: $mediaUrl, mediaType: $mediaType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoMediaLiteDMImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, mediaUrl, mediaType);

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoMediaLiteDMImplCopyWith<_$PromoMediaLiteDMImpl> get copyWith =>
      __$$PromoMediaLiteDMImplCopyWithImpl<_$PromoMediaLiteDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoMediaLiteDMImplToJson(
      this,
    );
  }
}

abstract class _PromoMediaLiteDM extends PromoMediaLiteDM {
  const factory _PromoMediaLiteDM(
      {required final String uuid,
      @JsonKey(name: 'business_promo_media_url') required final String mediaUrl,
      @JsonKey(name: 'media_type')
      final String mediaType}) = _$PromoMediaLiteDMImpl;
  const _PromoMediaLiteDM._() : super._();

  factory _PromoMediaLiteDM.fromJson(Map<String, dynamic> json) =
      _$PromoMediaLiteDMImpl.fromJson;

  @override
  String get uuid;
  @override
  @JsonKey(name: 'business_promo_media_url')
  String get mediaUrl;
  @override
  @JsonKey(name: 'media_type')
  String get mediaType;

  /// Create a copy of PromoMediaLiteDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoMediaLiteDMImplCopyWith<_$PromoMediaLiteDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearbyPromotionsResponseDM _$NearbyPromotionsResponseDMFromJson(
    Map<String, dynamic> json) {
  return _NearbyPromotionsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$NearbyPromotionsResponseDM {
  List<NearbyPromotionDM> get data => throw _privateConstructorUsedError;
  NearbyPromotionsMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this NearbyPromotionsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyPromotionsResponseDMCopyWith<NearbyPromotionsResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyPromotionsResponseDMCopyWith<$Res> {
  factory $NearbyPromotionsResponseDMCopyWith(NearbyPromotionsResponseDM value,
          $Res Function(NearbyPromotionsResponseDM) then) =
      _$NearbyPromotionsResponseDMCopyWithImpl<$Res,
          NearbyPromotionsResponseDM>;
  @useResult
  $Res call({List<NearbyPromotionDM> data, NearbyPromotionsMeta meta});

  $NearbyPromotionsMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$NearbyPromotionsResponseDMCopyWithImpl<$Res,
        $Val extends NearbyPromotionsResponseDM>
    implements $NearbyPromotionsResponseDMCopyWith<$Res> {
  _$NearbyPromotionsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyPromotionsMeta,
    ) as $Val);
  }

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyPromotionsMetaCopyWith<$Res> get meta {
    return $NearbyPromotionsMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearbyPromotionsResponseDMImplCopyWith<$Res>
    implements $NearbyPromotionsResponseDMCopyWith<$Res> {
  factory _$$NearbyPromotionsResponseDMImplCopyWith(
          _$NearbyPromotionsResponseDMImpl value,
          $Res Function(_$NearbyPromotionsResponseDMImpl) then) =
      __$$NearbyPromotionsResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NearbyPromotionDM> data, NearbyPromotionsMeta meta});

  @override
  $NearbyPromotionsMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$NearbyPromotionsResponseDMImplCopyWithImpl<$Res>
    extends _$NearbyPromotionsResponseDMCopyWithImpl<$Res,
        _$NearbyPromotionsResponseDMImpl>
    implements _$$NearbyPromotionsResponseDMImplCopyWith<$Res> {
  __$$NearbyPromotionsResponseDMImplCopyWithImpl(
      _$NearbyPromotionsResponseDMImpl _value,
      $Res Function(_$NearbyPromotionsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$NearbyPromotionsResponseDMImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyPromotionsMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyPromotionsResponseDMImpl implements _NearbyPromotionsResponseDM {
  const _$NearbyPromotionsResponseDMImpl(
      {required final List<NearbyPromotionDM> data, required this.meta})
      : _data = data;

  factory _$NearbyPromotionsResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NearbyPromotionsResponseDMImplFromJson(json);

  final List<NearbyPromotionDM> _data;
  @override
  List<NearbyPromotionDM> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final NearbyPromotionsMeta meta;

  @override
  String toString() {
    return 'NearbyPromotionsResponseDM(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyPromotionsResponseDMImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyPromotionsResponseDMImplCopyWith<_$NearbyPromotionsResponseDMImpl>
      get copyWith => __$$NearbyPromotionsResponseDMImplCopyWithImpl<
          _$NearbyPromotionsResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyPromotionsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _NearbyPromotionsResponseDM
    implements NearbyPromotionsResponseDM {
  const factory _NearbyPromotionsResponseDM(
          {required final List<NearbyPromotionDM> data,
          required final NearbyPromotionsMeta meta}) =
      _$NearbyPromotionsResponseDMImpl;

  factory _NearbyPromotionsResponseDM.fromJson(Map<String, dynamic> json) =
      _$NearbyPromotionsResponseDMImpl.fromJson;

  @override
  List<NearbyPromotionDM> get data;
  @override
  NearbyPromotionsMeta get meta;

  /// Create a copy of NearbyPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyPromotionsResponseDMImplCopyWith<_$NearbyPromotionsResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NearbyPromotionsMeta _$NearbyPromotionsMetaFromJson(Map<String, dynamic> json) {
  return _NearbyPromotionsMeta.fromJson(json);
}

/// @nodoc
mixin _$NearbyPromotionsMeta {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more')
  bool get hasMore => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_total')
  int get maxTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'radius_km')
  double get radiusKm => throw _privateConstructorUsedError;

  /// Serializes this NearbyPromotionsMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyPromotionsMetaCopyWith<NearbyPromotionsMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyPromotionsMetaCopyWith<$Res> {
  factory $NearbyPromotionsMetaCopyWith(NearbyPromotionsMeta value,
          $Res Function(NearbyPromotionsMeta) then) =
      _$NearbyPromotionsMetaCopyWithImpl<$Res, NearbyPromotionsMeta>;
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
class _$NearbyPromotionsMetaCopyWithImpl<$Res,
        $Val extends NearbyPromotionsMeta>
    implements $NearbyPromotionsMetaCopyWith<$Res> {
  _$NearbyPromotionsMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      maxTotal: null == maxTotal
          ? _value.maxTotal
          : maxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      radiusKm: null == radiusKm
          ? _value.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyPromotionsMetaImplCopyWith<$Res>
    implements $NearbyPromotionsMetaCopyWith<$Res> {
  factory _$$NearbyPromotionsMetaImplCopyWith(_$NearbyPromotionsMetaImpl value,
          $Res Function(_$NearbyPromotionsMetaImpl) then) =
      __$$NearbyPromotionsMetaImplCopyWithImpl<$Res>;
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
class __$$NearbyPromotionsMetaImplCopyWithImpl<$Res>
    extends _$NearbyPromotionsMetaCopyWithImpl<$Res, _$NearbyPromotionsMetaImpl>
    implements _$$NearbyPromotionsMetaImplCopyWith<$Res> {
  __$$NearbyPromotionsMetaImplCopyWithImpl(_$NearbyPromotionsMetaImpl _value,
      $Res Function(_$NearbyPromotionsMetaImpl) _then)
      : super(_value, _then);

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
    return _then(_$NearbyPromotionsMetaImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      maxTotal: null == maxTotal
          ? _value.maxTotal
          : maxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      radiusKm: null == radiusKm
          ? _value.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyPromotionsMetaImpl implements _NearbyPromotionsMeta {
  const _$NearbyPromotionsMetaImpl(
      {required this.total,
      required this.page,
      @JsonKey(name: 'per_page') required this.perPage,
      @JsonKey(name: 'has_more') required this.hasMore,
      @JsonKey(name: 'max_total') this.maxTotal = 50,
      @JsonKey(name: 'radius_km') this.radiusKm = 10.0});

  factory _$NearbyPromotionsMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyPromotionsMetaImplFromJson(json);

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

  @override
  String toString() {
    return 'NearbyPromotionsMeta(total: $total, page: $page, perPage: $perPage, hasMore: $hasMore, maxTotal: $maxTotal, radiusKm: $radiusKm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyPromotionsMetaImpl &&
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

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyPromotionsMetaImplCopyWith<_$NearbyPromotionsMetaImpl>
      get copyWith =>
          __$$NearbyPromotionsMetaImplCopyWithImpl<_$NearbyPromotionsMetaImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyPromotionsMetaImplToJson(
      this,
    );
  }
}

abstract class _NearbyPromotionsMeta implements NearbyPromotionsMeta {
  const factory _NearbyPromotionsMeta(
          {required final int total,
          required final int page,
          @JsonKey(name: 'per_page') required final int perPage,
          @JsonKey(name: 'has_more') required final bool hasMore,
          @JsonKey(name: 'max_total') final int maxTotal,
          @JsonKey(name: 'radius_km') final double radiusKm}) =
      _$NearbyPromotionsMetaImpl;

  factory _NearbyPromotionsMeta.fromJson(Map<String, dynamic> json) =
      _$NearbyPromotionsMetaImpl.fromJson;

  @override
  int get total;
  @override
  int get page;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'has_more')
  bool get hasMore;
  @override
  @JsonKey(name: 'max_total')
  int get maxTotal;
  @override
  @JsonKey(name: 'radius_km')
  double get radiusKm;

  /// Create a copy of NearbyPromotionsMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyPromotionsMetaImplCopyWith<_$NearbyPromotionsMetaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
