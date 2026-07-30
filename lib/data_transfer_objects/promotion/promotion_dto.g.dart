// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotionDTO _$PromotionDTOFromJson(Map<String, dynamic> json) =>
    _PromotionDTO(
      businessUuid: json['business_uuid'] as String?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] as String?,
      expireDate: json['expire_date'] as String?,
      versions: (json['versions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$VersionEnumMap, e))
              .toList() ??
          const [Version.regular],
      prices: json['prices'] == null
          ? null
          : Prices.fromJson(json['prices'] as Map<String, dynamic>),
      promoActiveDays: json['promo_active_days'] == null
          ? null
          : PromoDaysDM.fromJson(
              json['promo_active_days'] as Map<String, dynamic>),
      available: json['available'] as bool?,
      mediaLink: json['media_link'] as String?,
    );

Map<String, dynamic> _$PromotionDTOToJson(_PromotionDTO instance) =>
    <String, dynamic>{
      if (instance.businessUuid case final value?) 'business_uuid': value,
      if (instance.title case final value?) 'title': value,
      if (instance.subTitle case final value?) 'sub_title': value,
      if (instance.description case final value?) 'description': value,
      if (instance.startDate case final value?) 'start_date': value,
      if (instance.expireDate case final value?) 'expire_date': value,
      'versions': instance.versions.map((e) => _$VersionEnumMap[e]!).toList(),
      if (instance.prices?.toJson() case final value?) 'prices': value,
      if (instance.promoActiveDays?.toJson() case final value?)
        'promo_active_days': value,
      if (instance.available case final value?) 'available': value,
      if (instance.mediaLink case final value?) 'media_link': value,
    };

const _$VersionEnumMap = {
  Version.regular: 'regular',
  Version.medium: 'medium',
  Version.big: 'big',
};
