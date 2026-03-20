// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromotionDTO _$PromotionDTOFromJson(Map<String, dynamic> json) {
  return _PromotionDTO.fromJson(json);
}

/// @nodoc
mixin _$PromotionDTO {
  @JsonKey(name: 'business_uuid')
  String? get businessUuid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_title')
  String? get subTitle => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire_date')
  String? get expireDate => throw _privateConstructorUsedError;
  List<Version> get versions => throw _privateConstructorUsedError;
  Prices? get prices => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_active_days')
  PromoDaysDM? get promoActiveDays => throw _privateConstructorUsedError;
  bool? get available => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_link')
  String? get mediaLink => throw _privateConstructorUsedError;

  /// Serializes this PromotionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionDTOCopyWith<PromotionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionDTOCopyWith<$Res> {
  factory $PromotionDTOCopyWith(
          PromotionDTO value, $Res Function(PromotionDTO) then) =
      _$PromotionDTOCopyWithImpl<$Res, PromotionDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String? businessUuid,
      String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      String? description,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'expire_date') String? expireDate,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
      bool? available,
      @JsonKey(name: 'media_link') String? mediaLink});

  $PricesCopyWith<$Res>? get prices;
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays;
}

/// @nodoc
class _$PromotionDTOCopyWithImpl<$Res, $Val extends PromotionDTO>
    implements $PromotionDTOCopyWith<$Res> {
  _$PromotionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = freezed,
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? expireDate = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? promoActiveDays = freezed,
    Object? available = freezed,
    Object? mediaLink = freezed,
  }) {
    return _then(_value.copyWith(
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      promoActiveDays: freezed == promoActiveDays
          ? _value.promoActiveDays
          : promoActiveDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaLink: freezed == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PromotionDTO
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

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays {
    if (_value.promoActiveDays == null) {
      return null;
    }

    return $PromoDaysDMCopyWith<$Res>(_value.promoActiveDays!, (value) {
      return _then(_value.copyWith(promoActiveDays: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromotionDTOImplCopyWith<$Res>
    implements $PromotionDTOCopyWith<$Res> {
  factory _$$PromotionDTOImplCopyWith(
          _$PromotionDTOImpl value, $Res Function(_$PromotionDTOImpl) then) =
      __$$PromotionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String? businessUuid,
      String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      String? description,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'expire_date') String? expireDate,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
      bool? available,
      @JsonKey(name: 'media_link') String? mediaLink});

  @override
  $PricesCopyWith<$Res>? get prices;
  @override
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays;
}

/// @nodoc
class __$$PromotionDTOImplCopyWithImpl<$Res>
    extends _$PromotionDTOCopyWithImpl<$Res, _$PromotionDTOImpl>
    implements _$$PromotionDTOImplCopyWith<$Res> {
  __$$PromotionDTOImplCopyWithImpl(
      _$PromotionDTOImpl _value, $Res Function(_$PromotionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = freezed,
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? expireDate = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? promoActiveDays = freezed,
    Object? available = freezed,
    Object? mediaLink = freezed,
  }) {
    return _then(_$PromotionDTOImpl(
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      promoActiveDays: freezed == promoActiveDays
          ? _value.promoActiveDays
          : promoActiveDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaLink: freezed == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionDTOImpl implements _PromotionDTO {
  const _$PromotionDTOImpl(
      {@JsonKey(name: 'business_uuid') this.businessUuid,
      this.title,
      @JsonKey(name: 'sub_title') this.subTitle,
      this.description,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'expire_date') this.expireDate,
      final List<Version> versions = const [Version.regular],
      this.prices,
      @JsonKey(name: 'promo_active_days') this.promoActiveDays,
      this.available,
      @JsonKey(name: 'media_link') this.mediaLink})
      : _versions = versions;

  factory _$PromotionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionDTOImplFromJson(json);

  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  final String? title;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  @override
  final String? description;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'expire_date')
  final String? expireDate;
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
  @JsonKey(name: 'promo_active_days')
  final PromoDaysDM? promoActiveDays;
  @override
  final bool? available;
  @override
  @JsonKey(name: 'media_link')
  final String? mediaLink;

  @override
  String toString() {
    return 'PromotionDTO(businessUuid: $businessUuid, title: $title, subTitle: $subTitle, description: $description, startDate: $startDate, expireDate: $expireDate, versions: $versions, prices: $prices, promoActiveDays: $promoActiveDays, available: $available, mediaLink: $mediaLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionDTOImpl &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            const DeepCollectionEquality().equals(other._versions, _versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.promoActiveDays, promoActiveDays) ||
                other.promoActiveDays == promoActiveDays) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessUuid,
      title,
      subTitle,
      description,
      startDate,
      expireDate,
      const DeepCollectionEquality().hash(_versions),
      prices,
      promoActiveDays,
      available,
      mediaLink);

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionDTOImplCopyWith<_$PromotionDTOImpl> get copyWith =>
      __$$PromotionDTOImplCopyWithImpl<_$PromotionDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionDTOImplToJson(
      this,
    );
  }
}

abstract class _PromotionDTO implements PromotionDTO {
  const factory _PromotionDTO(
      {@JsonKey(name: 'business_uuid') final String? businessUuid,
      final String? title,
      @JsonKey(name: 'sub_title') final String? subTitle,
      final String? description,
      @JsonKey(name: 'start_date') final String? startDate,
      @JsonKey(name: 'expire_date') final String? expireDate,
      final List<Version> versions,
      final Prices? prices,
      @JsonKey(name: 'promo_active_days') final PromoDaysDM? promoActiveDays,
      final bool? available,
      @JsonKey(name: 'media_link')
      final String? mediaLink}) = _$PromotionDTOImpl;

  factory _PromotionDTO.fromJson(Map<String, dynamic> json) =
      _$PromotionDTOImpl.fromJson;

  @override
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @override
  String? get title;
  @override
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  @override
  String? get description;
  @override
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'expire_date')
  String? get expireDate;
  @override
  List<Version> get versions;
  @override
  Prices? get prices;
  @override
  @JsonKey(name: 'promo_active_days')
  PromoDaysDM? get promoActiveDays;
  @override
  bool? get available;
  @override
  @JsonKey(name: 'media_link')
  String? get mediaLink;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionDTOImplCopyWith<_$PromotionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
