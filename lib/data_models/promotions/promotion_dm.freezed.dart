// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromotionsResponse _$PromotionsResponseFromJson(Map<String, dynamic> json) {
  return _PromotionsResponse.fromJson(json);
}

/// @nodoc
mixin _$PromotionsResponse {
  @JsonKey(name: 'business_promotions')
  List<PromotionDM> get promotions => throw _privateConstructorUsedError;

  /// Serializes this PromotionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionsResponseCopyWith<PromotionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionsResponseCopyWith<$Res> {
  factory $PromotionsResponseCopyWith(
          PromotionsResponse value, $Res Function(PromotionsResponse) then) =
      _$PromotionsResponseCopyWithImpl<$Res, PromotionsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promotions') List<PromotionDM> promotions});
}

/// @nodoc
class _$PromotionsResponseCopyWithImpl<$Res, $Val extends PromotionsResponse>
    implements $PromotionsResponseCopyWith<$Res> {
  _$PromotionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_value.copyWith(
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotionsResponseImplCopyWith<$Res>
    implements $PromotionsResponseCopyWith<$Res> {
  factory _$$PromotionsResponseImplCopyWith(_$PromotionsResponseImpl value,
          $Res Function(_$PromotionsResponseImpl) then) =
      __$$PromotionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promotions') List<PromotionDM> promotions});
}

/// @nodoc
class __$$PromotionsResponseImplCopyWithImpl<$Res>
    extends _$PromotionsResponseCopyWithImpl<$Res, _$PromotionsResponseImpl>
    implements _$$PromotionsResponseImplCopyWith<$Res> {
  __$$PromotionsResponseImplCopyWithImpl(_$PromotionsResponseImpl _value,
      $Res Function(_$PromotionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_$PromotionsResponseImpl(
      promotions: null == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionsResponseImpl implements _PromotionsResponse {
  const _$PromotionsResponseImpl(
      {@JsonKey(name: 'business_promotions')
      required final List<PromotionDM> promotions})
      : _promotions = promotions;

  factory _$PromotionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionsResponseImplFromJson(json);

  final List<PromotionDM> _promotions;
  @override
  @JsonKey(name: 'business_promotions')
  List<PromotionDM> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  @override
  String toString() {
    return 'PromotionsResponse(promotions: $promotions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_promotions));

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionsResponseImplCopyWith<_$PromotionsResponseImpl> get copyWith =>
      __$$PromotionsResponseImplCopyWithImpl<_$PromotionsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionsResponseImplToJson(
      this,
    );
  }
}

abstract class _PromotionsResponse implements PromotionsResponse {
  const factory _PromotionsResponse(
      {@JsonKey(name: 'business_promotions')
      required final List<PromotionDM> promotions}) = _$PromotionsResponseImpl;

  factory _PromotionsResponse.fromJson(Map<String, dynamic> json) =
      _$PromotionsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'business_promotions')
  List<PromotionDM> get promotions;

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionsResponseImplCopyWith<_$PromotionsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromotionDM _$PromotionDMFromJson(Map<String, dynamic> json) {
  return _PromotionDM.fromJson(json);
}

/// @nodoc
mixin _$PromotionDM {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_title')
  String get subTitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire_date')
  DateTime get expireDate => throw _privateConstructorUsedError;
  BusinessDM? get business => throw _privateConstructorUsedError;
  List<Version> get versions => throw _privateConstructorUsedError;
  Prices? get prices => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorites_count')
  int get favoritesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_link')
  String? get mediaLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_active_days')
  PromoDaysDM get promoDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_length')
  int get followersLength => throw _privateConstructorUsedError;

  /// Serializes this PromotionDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionDMCopyWith<PromotionDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionDMCopyWith<$Res> {
  factory $PromotionDMCopyWith(
          PromotionDM value, $Res Function(PromotionDM) then) =
      _$PromotionDMCopyWithImpl<$Res, PromotionDM>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String title,
      @JsonKey(name: 'sub_title') String subTitle,
      String description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'expire_date') DateTime expireDate,
      BusinessDM? business,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'favorites_count') int favoritesCount,
      @JsonKey(name: 'media_link') String? mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia,
      @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
      @JsonKey(name: 'followers_length') int followersLength});

  $BusinessDMCopyWith<$Res>? get business;
  $PricesCopyWith<$Res>? get prices;
  $PromoDaysDMCopyWith<$Res> get promoDays;
}

/// @nodoc
class _$PromotionDMCopyWithImpl<$Res, $Val extends PromotionDM>
    implements $PromotionDMCopyWith<$Res> {
  _$PromotionDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDate = null,
    Object? expireDate = null,
    Object? business = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? favoritesCount = null,
    Object? mediaLink = freezed,
    Object? promoMedia = null,
    Object? promoDays = null,
    Object? followersLength = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireDate: null == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      favoritesCount: null == favoritesCount
          ? _value.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      mediaLink: freezed == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: null == promoMedia
          ? _value.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
      promoDays: null == promoDays
          ? _value.promoDays
          : promoDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_value.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_value.business!, (value) {
      return _then(_value.copyWith(business: value) as $Val);
    });
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricesCopyWith<$Res>? get prices {
    if (_value.prices == null) {
      return null;
    }

    return $PricesCopyWith<$Res>(_value.prices!, (value) {
      return _then(_value.copyWith(prices: value) as $Val);
    });
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<$Res> get promoDays {
    return $PromoDaysDMCopyWith<$Res>(_value.promoDays, (value) {
      return _then(_value.copyWith(promoDays: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromotionDMImplCopyWith<$Res>
    implements $PromotionDMCopyWith<$Res> {
  factory _$$PromotionDMImplCopyWith(
          _$PromotionDMImpl value, $Res Function(_$PromotionDMImpl) then) =
      __$$PromotionDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String title,
      @JsonKey(name: 'sub_title') String subTitle,
      String description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'expire_date') DateTime expireDate,
      BusinessDM? business,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'favorites_count') int favoritesCount,
      @JsonKey(name: 'media_link') String? mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia,
      @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
      @JsonKey(name: 'followers_length') int followersLength});

  @override
  $BusinessDMCopyWith<$Res>? get business;
  @override
  $PricesCopyWith<$Res>? get prices;
  @override
  $PromoDaysDMCopyWith<$Res> get promoDays;
}

/// @nodoc
class __$$PromotionDMImplCopyWithImpl<$Res>
    extends _$PromotionDMCopyWithImpl<$Res, _$PromotionDMImpl>
    implements _$$PromotionDMImplCopyWith<$Res> {
  __$$PromotionDMImplCopyWithImpl(
      _$PromotionDMImpl _value, $Res Function(_$PromotionDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDate = null,
    Object? expireDate = null,
    Object? business = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? favoritesCount = null,
    Object? mediaLink = freezed,
    Object? promoMedia = null,
    Object? promoDays = null,
    Object? followersLength = null,
  }) {
    return _then(_$PromotionDMImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireDate: null == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      favoritesCount: null == favoritesCount
          ? _value.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      mediaLink: freezed == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: null == promoMedia
          ? _value._promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
      promoDays: null == promoDays
          ? _value.promoDays
          : promoDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionDMImpl extends _PromotionDM {
  _$PromotionDMImpl(
      {required this.id,
      required this.uuid,
      required this.title,
      @JsonKey(name: 'sub_title') this.subTitle = '',
      required this.description,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'expire_date') required this.expireDate,
      required this.business,
      final List<Version> versions = const [Version.regular],
      this.prices,
      @JsonKey(name: 'favorites_count') this.favoritesCount = 0,
      @JsonKey(name: 'media_link') this.mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      final List<PromoMediaDM> promoMedia = const [],
      @JsonKey(name: 'promo_active_days') required this.promoDays,
      @JsonKey(name: 'followers_length') this.followersLength = 0})
      : _versions = versions,
        _promoMedia = promoMedia,
        super._();

  factory _$PromotionDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionDMImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String title;
  @override
  @JsonKey(name: 'sub_title')
  final String subTitle;
  @override
  final String description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'expire_date')
  final DateTime expireDate;
  @override
  final BusinessDM? business;
  final List<Version> _versions;
  @override
  @JsonKey()
  List<Version> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  @override
  final Prices? prices;
  @override
  @JsonKey(name: 'favorites_count')
  final int favoritesCount;
  @override
  @JsonKey(name: 'media_link')
  final String? mediaLink;
  final List<PromoMediaDM> _promoMedia;
  @override
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia {
    if (_promoMedia is EqualUnmodifiableListView) return _promoMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promoMedia);
  }

  @override
  @JsonKey(name: 'promo_active_days')
  final PromoDaysDM promoDays;
  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;

  @override
  String toString() {
    return 'PromotionDM(id: $id, uuid: $uuid, title: $title, subTitle: $subTitle, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, expireDate: $expireDate, business: $business, versions: $versions, prices: $prices, favoritesCount: $favoritesCount, mediaLink: $mediaLink, promoMedia: $promoMedia, promoDays: $promoDays, followersLength: $followersLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.business, business) ||
                other.business == business) &&
            const DeepCollectionEquality().equals(other._versions, _versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink) &&
            const DeepCollectionEquality()
                .equals(other._promoMedia, _promoMedia) &&
            (identical(other.promoDays, promoDays) ||
                other.promoDays == promoDays) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      title,
      subTitle,
      description,
      createdAt,
      updatedAt,
      startDate,
      expireDate,
      business,
      const DeepCollectionEquality().hash(_versions),
      prices,
      favoritesCount,
      mediaLink,
      const DeepCollectionEquality().hash(_promoMedia),
      promoDays,
      followersLength);

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionDMImplCopyWith<_$PromotionDMImpl> get copyWith =>
      __$$PromotionDMImplCopyWithImpl<_$PromotionDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionDMImplToJson(
      this,
    );
  }
}

abstract class _PromotionDM extends PromotionDM {
  factory _PromotionDM(
      {required final int id,
      required final String uuid,
      required final String title,
      @JsonKey(name: 'sub_title') final String subTitle,
      required final String description,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'start_date') required final DateTime startDate,
      @JsonKey(name: 'expire_date') required final DateTime expireDate,
      required final BusinessDM? business,
      final List<Version> versions,
      final Prices? prices,
      @JsonKey(name: 'favorites_count') final int favoritesCount,
      @JsonKey(name: 'media_link') final String? mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      final List<PromoMediaDM> promoMedia,
      @JsonKey(name: 'promo_active_days') required final PromoDaysDM promoDays,
      @JsonKey(name: 'followers_length')
      final int followersLength}) = _$PromotionDMImpl;
  _PromotionDM._() : super._();

  factory _PromotionDM.fromJson(Map<String, dynamic> json) =
      _$PromotionDMImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get title;
  @override
  @JsonKey(name: 'sub_title')
  String get subTitle;
  @override
  String get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'expire_date')
  DateTime get expireDate;
  @override
  BusinessDM? get business;
  @override
  List<Version> get versions;
  @override
  Prices? get prices;
  @override
  @JsonKey(name: 'favorites_count')
  int get favoritesCount;
  @override
  @JsonKey(name: 'media_link')
  String? get mediaLink;
  @override
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia;
  @override
  @JsonKey(name: 'promo_active_days')
  PromoDaysDM get promoDays;
  @override
  @JsonKey(name: 'followers_length')
  int get followersLength;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionDMImplCopyWith<_$PromotionDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromoMediaDM _$PromoMediaDMFromJson(Map<String, dynamic> json) {
  return _PromoMediaDM.fromJson(json);
}

/// @nodoc
mixin _$PromoMediaDM {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_promo_media_url')
  String get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_promo_item_id')
  int get promoItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  MediaType get mediaType => throw _privateConstructorUsedError;

  /// Serializes this PromoMediaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoMediaDMCopyWith<PromoMediaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoMediaDMCopyWith<$Res> {
  factory $PromoMediaDMCopyWith(
          PromoMediaDM value, $Res Function(PromoMediaDM) then) =
      _$PromoMediaDMCopyWithImpl<$Res, PromoMediaDM>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'business_promo_item_id') int promoItemId,
      @JsonKey(name: 'media_type') MediaType mediaType});
}

/// @nodoc
class _$PromoMediaDMCopyWithImpl<$Res, $Val extends PromoMediaDM>
    implements $PromoMediaDMCopyWith<$Res> {
  _$PromoMediaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? promoItemId = null,
    Object? mediaType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      promoItemId: null == promoItemId
          ? _value.promoItemId
          : promoItemId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoMediaDMImplCopyWith<$Res>
    implements $PromoMediaDMCopyWith<$Res> {
  factory _$$PromoMediaDMImplCopyWith(
          _$PromoMediaDMImpl value, $Res Function(_$PromoMediaDMImpl) then) =
      __$$PromoMediaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'business_promo_item_id') int promoItemId,
      @JsonKey(name: 'media_type') MediaType mediaType});
}

/// @nodoc
class __$$PromoMediaDMImplCopyWithImpl<$Res>
    extends _$PromoMediaDMCopyWithImpl<$Res, _$PromoMediaDMImpl>
    implements _$$PromoMediaDMImplCopyWith<$Res> {
  __$$PromoMediaDMImplCopyWithImpl(
      _$PromoMediaDMImpl _value, $Res Function(_$PromoMediaDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? promoItemId = null,
    Object? mediaType = null,
  }) {
    return _then(_$PromoMediaDMImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      promoItemId: null == promoItemId
          ? _value.promoItemId
          : promoItemId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoMediaDMImpl extends _PromoMediaDM {
  const _$PromoMediaDMImpl(
      {required this.id,
      required this.uuid,
      @JsonKey(name: 'business_promo_media_url') required this.mediaUrl,
      @JsonKey(name: 'business_promo_item_id') required this.promoItemId,
      @JsonKey(name: 'media_type') required this.mediaType})
      : super._();

  factory _$PromoMediaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoMediaDMImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  @JsonKey(name: 'business_promo_media_url')
  final String mediaUrl;
  @override
  @JsonKey(name: 'business_promo_item_id')
  final int promoItemId;
  @override
  @JsonKey(name: 'media_type')
  final MediaType mediaType;

  @override
  String toString() {
    return 'PromoMediaDM(id: $id, uuid: $uuid, mediaUrl: $mediaUrl, promoItemId: $promoItemId, mediaType: $mediaType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoMediaDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.promoItemId, promoItemId) ||
                other.promoItemId == promoItemId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, mediaUrl, promoItemId, mediaType);

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoMediaDMImplCopyWith<_$PromoMediaDMImpl> get copyWith =>
      __$$PromoMediaDMImplCopyWithImpl<_$PromoMediaDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoMediaDMImplToJson(
      this,
    );
  }
}

abstract class _PromoMediaDM extends PromoMediaDM {
  const factory _PromoMediaDM(
      {required final int id,
      required final String uuid,
      @JsonKey(name: 'business_promo_media_url') required final String mediaUrl,
      @JsonKey(name: 'business_promo_item_id') required final int promoItemId,
      @JsonKey(name: 'media_type')
      required final MediaType mediaType}) = _$PromoMediaDMImpl;
  const _PromoMediaDM._() : super._();

  factory _PromoMediaDM.fromJson(Map<String, dynamic> json) =
      _$PromoMediaDMImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  @JsonKey(name: 'business_promo_media_url')
  String get mediaUrl;
  @override
  @JsonKey(name: 'business_promo_item_id')
  int get promoItemId;
  @override
  @JsonKey(name: 'media_type')
  MediaType get mediaType;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoMediaDMImplCopyWith<_$PromoMediaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromoDaysDM _$PromoDaysDMFromJson(Map<String, dynamic> json) {
  return _PromoDaysDM.fromJson(json);
}

/// @nodoc
mixin _$PromoDaysDM {
  @JsonKey(name: 'day_0')
  bool get sunday => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_1')
  bool get monday => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_2')
  bool get tuesday => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_3')
  bool get wednesday => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_4')
  bool get thursday => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_5')
  bool get friday => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_6')
  bool get saturday => throw _privateConstructorUsedError;

  /// Serializes this PromoDaysDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoDaysDMCopyWith<PromoDaysDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoDaysDMCopyWith<$Res> {
  factory $PromoDaysDMCopyWith(
          PromoDaysDM value, $Res Function(PromoDaysDM) then) =
      _$PromoDaysDMCopyWithImpl<$Res, PromoDaysDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day_0') bool sunday,
      @JsonKey(name: 'day_1') bool monday,
      @JsonKey(name: 'day_2') bool tuesday,
      @JsonKey(name: 'day_3') bool wednesday,
      @JsonKey(name: 'day_4') bool thursday,
      @JsonKey(name: 'day_5') bool friday,
      @JsonKey(name: 'day_6') bool saturday});
}

/// @nodoc
class _$PromoDaysDMCopyWithImpl<$Res, $Val extends PromoDaysDM>
    implements $PromoDaysDMCopyWith<$Res> {
  _$PromoDaysDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunday = null,
    Object? monday = null,
    Object? tuesday = null,
    Object? wednesday = null,
    Object? thursday = null,
    Object? friday = null,
    Object? saturday = null,
  }) {
    return _then(_value.copyWith(
      sunday: null == sunday
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as bool,
      monday: null == monday
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as bool,
      tuesday: null == tuesday
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as bool,
      wednesday: null == wednesday
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as bool,
      thursday: null == thursday
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as bool,
      friday: null == friday
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as bool,
      saturday: null == saturday
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoDaysDMImplCopyWith<$Res>
    implements $PromoDaysDMCopyWith<$Res> {
  factory _$$PromoDaysDMImplCopyWith(
          _$PromoDaysDMImpl value, $Res Function(_$PromoDaysDMImpl) then) =
      __$$PromoDaysDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day_0') bool sunday,
      @JsonKey(name: 'day_1') bool monday,
      @JsonKey(name: 'day_2') bool tuesday,
      @JsonKey(name: 'day_3') bool wednesday,
      @JsonKey(name: 'day_4') bool thursday,
      @JsonKey(name: 'day_5') bool friday,
      @JsonKey(name: 'day_6') bool saturday});
}

/// @nodoc
class __$$PromoDaysDMImplCopyWithImpl<$Res>
    extends _$PromoDaysDMCopyWithImpl<$Res, _$PromoDaysDMImpl>
    implements _$$PromoDaysDMImplCopyWith<$Res> {
  __$$PromoDaysDMImplCopyWithImpl(
      _$PromoDaysDMImpl _value, $Res Function(_$PromoDaysDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunday = null,
    Object? monday = null,
    Object? tuesday = null,
    Object? wednesday = null,
    Object? thursday = null,
    Object? friday = null,
    Object? saturday = null,
  }) {
    return _then(_$PromoDaysDMImpl(
      sunday: null == sunday
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as bool,
      monday: null == monday
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as bool,
      tuesday: null == tuesday
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as bool,
      wednesday: null == wednesday
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as bool,
      thursday: null == thursday
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as bool,
      friday: null == friday
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as bool,
      saturday: null == saturday
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoDaysDMImpl extends _PromoDaysDM {
  const _$PromoDaysDMImpl(
      {@JsonKey(name: 'day_0') this.sunday = false,
      @JsonKey(name: 'day_1') this.monday = false,
      @JsonKey(name: 'day_2') this.tuesday = false,
      @JsonKey(name: 'day_3') this.wednesday = false,
      @JsonKey(name: 'day_4') this.thursday = false,
      @JsonKey(name: 'day_5') this.friday = false,
      @JsonKey(name: 'day_6') this.saturday = false})
      : super._();

  factory _$PromoDaysDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoDaysDMImplFromJson(json);

  @override
  @JsonKey(name: 'day_0')
  final bool sunday;
  @override
  @JsonKey(name: 'day_1')
  final bool monday;
  @override
  @JsonKey(name: 'day_2')
  final bool tuesday;
  @override
  @JsonKey(name: 'day_3')
  final bool wednesday;
  @override
  @JsonKey(name: 'day_4')
  final bool thursday;
  @override
  @JsonKey(name: 'day_5')
  final bool friday;
  @override
  @JsonKey(name: 'day_6')
  final bool saturday;

  @override
  String toString() {
    return 'PromoDaysDM(sunday: $sunday, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoDaysDMImpl &&
            (identical(other.sunday, sunday) || other.sunday == sunday) &&
            (identical(other.monday, monday) || other.monday == monday) &&
            (identical(other.tuesday, tuesday) || other.tuesday == tuesday) &&
            (identical(other.wednesday, wednesday) ||
                other.wednesday == wednesday) &&
            (identical(other.thursday, thursday) ||
                other.thursday == thursday) &&
            (identical(other.friday, friday) || other.friday == friday) &&
            (identical(other.saturday, saturday) ||
                other.saturday == saturday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sunday, monday, tuesday,
      wednesday, thursday, friday, saturday);

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoDaysDMImplCopyWith<_$PromoDaysDMImpl> get copyWith =>
      __$$PromoDaysDMImplCopyWithImpl<_$PromoDaysDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoDaysDMImplToJson(
      this,
    );
  }
}

abstract class _PromoDaysDM extends PromoDaysDM {
  const factory _PromoDaysDM(
      {@JsonKey(name: 'day_0') final bool sunday,
      @JsonKey(name: 'day_1') final bool monday,
      @JsonKey(name: 'day_2') final bool tuesday,
      @JsonKey(name: 'day_3') final bool wednesday,
      @JsonKey(name: 'day_4') final bool thursday,
      @JsonKey(name: 'day_5') final bool friday,
      @JsonKey(name: 'day_6') final bool saturday}) = _$PromoDaysDMImpl;
  const _PromoDaysDM._() : super._();

  factory _PromoDaysDM.fromJson(Map<String, dynamic> json) =
      _$PromoDaysDMImpl.fromJson;

  @override
  @JsonKey(name: 'day_0')
  bool get sunday;
  @override
  @JsonKey(name: 'day_1')
  bool get monday;
  @override
  @JsonKey(name: 'day_2')
  bool get tuesday;
  @override
  @JsonKey(name: 'day_3')
  bool get wednesday;
  @override
  @JsonKey(name: 'day_4')
  bool get thursday;
  @override
  @JsonKey(name: 'day_5')
  bool get friday;
  @override
  @JsonKey(name: 'day_6')
  bool get saturday;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoDaysDMImplCopyWith<_$PromoDaysDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromoGenerationResponse _$PromoGenerationResponseFromJson(
    Map<String, dynamic> json) {
  return _PromoGenerationResponse.fromJson(json);
}

/// @nodoc
mixin _$PromoGenerationResponse {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @Base64Converter()
  Uint8List? get imageBytes => throw _privateConstructorUsedError;

  /// Serializes this PromoGenerationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoGenerationResponseCopyWith<PromoGenerationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoGenerationResponseCopyWith<$Res> {
  factory $PromoGenerationResponseCopyWith(PromoGenerationResponse value,
          $Res Function(PromoGenerationResponse) then) =
      _$PromoGenerationResponseCopyWithImpl<$Res, PromoGenerationResponse>;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String description,
      @Base64Converter() Uint8List? imageBytes});
}

/// @nodoc
class _$PromoGenerationResponseCopyWithImpl<$Res,
        $Val extends PromoGenerationResponse>
    implements $PromoGenerationResponseCopyWith<$Res> {
  _$PromoGenerationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? imageBytes = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoGenerationResponseImplCopyWith<$Res>
    implements $PromoGenerationResponseCopyWith<$Res> {
  factory _$$PromoGenerationResponseImplCopyWith(
          _$PromoGenerationResponseImpl value,
          $Res Function(_$PromoGenerationResponseImpl) then) =
      __$$PromoGenerationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String description,
      @Base64Converter() Uint8List? imageBytes});
}

/// @nodoc
class __$$PromoGenerationResponseImplCopyWithImpl<$Res>
    extends _$PromoGenerationResponseCopyWithImpl<$Res,
        _$PromoGenerationResponseImpl>
    implements _$$PromoGenerationResponseImplCopyWith<$Res> {
  __$$PromoGenerationResponseImplCopyWithImpl(
      _$PromoGenerationResponseImpl _value,
      $Res Function(_$PromoGenerationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? imageBytes = freezed,
  }) {
    return _then(_$PromoGenerationResponseImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoGenerationResponseImpl implements _PromoGenerationResponse {
  const _$PromoGenerationResponseImpl(
      {required this.title,
      required this.subtitle,
      required this.description,
      @Base64Converter() this.imageBytes});

  factory _$PromoGenerationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoGenerationResponseImplFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String description;
  @override
  @Base64Converter()
  final Uint8List? imageBytes;

  @override
  String toString() {
    return 'PromoGenerationResponse(title: $title, subtitle: $subtitle, description: $description, imageBytes: $imageBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoGenerationResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, description,
      const DeepCollectionEquality().hash(imageBytes));

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoGenerationResponseImplCopyWith<_$PromoGenerationResponseImpl>
      get copyWith => __$$PromoGenerationResponseImplCopyWithImpl<
          _$PromoGenerationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoGenerationResponseImplToJson(
      this,
    );
  }
}

abstract class _PromoGenerationResponse implements PromoGenerationResponse {
  const factory _PromoGenerationResponse(
          {required final String title,
          required final String subtitle,
          required final String description,
          @Base64Converter() final Uint8List? imageBytes}) =
      _$PromoGenerationResponseImpl;

  factory _PromoGenerationResponse.fromJson(Map<String, dynamic> json) =
      _$PromoGenerationResponseImpl.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get description;
  @override
  @Base64Converter()
  Uint8List? get imageBytes;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoGenerationResponseImplCopyWith<_$PromoGenerationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PromoMediaResponse _$PromoMediaResponseFromJson(Map<String, dynamic> json) {
  return _PromoMediaResponse.fromJson(json);
}

/// @nodoc
mixin _$PromoMediaResponse {
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia => throw _privateConstructorUsedError;

  /// Serializes this PromoMediaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoMediaResponseCopyWith<PromoMediaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoMediaResponseCopyWith<$Res> {
  factory $PromoMediaResponseCopyWith(
          PromoMediaResponse value, $Res Function(PromoMediaResponse) then) =
      _$PromoMediaResponseCopyWithImpl<$Res, PromoMediaResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia});
}

/// @nodoc
class _$PromoMediaResponseCopyWithImpl<$Res, $Val extends PromoMediaResponse>
    implements $PromoMediaResponseCopyWith<$Res> {
  _$PromoMediaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoMedia = null,
  }) {
    return _then(_value.copyWith(
      promoMedia: null == promoMedia
          ? _value.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoMediaResponseImplCopyWith<$Res>
    implements $PromoMediaResponseCopyWith<$Res> {
  factory _$$PromoMediaResponseImplCopyWith(_$PromoMediaResponseImpl value,
          $Res Function(_$PromoMediaResponseImpl) then) =
      __$$PromoMediaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia});
}

/// @nodoc
class __$$PromoMediaResponseImplCopyWithImpl<$Res>
    extends _$PromoMediaResponseCopyWithImpl<$Res, _$PromoMediaResponseImpl>
    implements _$$PromoMediaResponseImplCopyWith<$Res> {
  __$$PromoMediaResponseImplCopyWithImpl(_$PromoMediaResponseImpl _value,
      $Res Function(_$PromoMediaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoMedia = null,
  }) {
    return _then(_$PromoMediaResponseImpl(
      promoMedia: null == promoMedia
          ? _value._promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoMediaResponseImpl implements _PromoMediaResponse {
  const _$PromoMediaResponseImpl(
      {@JsonKey(name: 'business_promo_reference_media')
      required final List<PromoMediaDM> promoMedia})
      : _promoMedia = promoMedia;

  factory _$PromoMediaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoMediaResponseImplFromJson(json);

  final List<PromoMediaDM> _promoMedia;
  @override
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia {
    if (_promoMedia is EqualUnmodifiableListView) return _promoMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promoMedia);
  }

  @override
  String toString() {
    return 'PromoMediaResponse(promoMedia: $promoMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoMediaResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._promoMedia, _promoMedia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_promoMedia));

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoMediaResponseImplCopyWith<_$PromoMediaResponseImpl> get copyWith =>
      __$$PromoMediaResponseImplCopyWithImpl<_$PromoMediaResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoMediaResponseImplToJson(
      this,
    );
  }
}

abstract class _PromoMediaResponse implements PromoMediaResponse {
  const factory _PromoMediaResponse(
      {@JsonKey(name: 'business_promo_reference_media')
      required final List<PromoMediaDM> promoMedia}) = _$PromoMediaResponseImpl;

  factory _PromoMediaResponse.fromJson(Map<String, dynamic> json) =
      _$PromoMediaResponseImpl.fromJson;

  @override
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia;

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoMediaResponseImplCopyWith<_$PromoMediaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
