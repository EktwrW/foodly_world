// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Base64Converter _$Base64ConverterFromJson(Map<String, dynamic> json) =>
    Base64Converter();

Map<String, dynamic> _$Base64ConverterToJson(Base64Converter instance) =>
    <String, dynamic>{};

_$PromotionsResponseImpl _$$PromotionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PromotionsResponseImpl(
      promotions: (json['business_promotions'] as List<dynamic>)
          .map((e) => PromotionDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PromotionsResponseImplToJson(
        _$PromotionsResponseImpl instance) =>
    <String, dynamic>{
      'business_promotions':
          instance.promotions.map((e) => e.toJson()).toList(),
    };

_$PromotionDMImpl _$$PromotionDMImplFromJson(Map<String, dynamic> json) =>
    _$PromotionDMImpl(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      subTitle: json['sub_title'] as String? ?? '',
      description: json['description'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      startDate: DateTime.parse(json['start_date'] as String),
      expireDate: DateTime.parse(json['expire_date'] as String),
      business: json['business'] == null
          ? null
          : BusinessDM.fromJson(json['business'] as Map<String, dynamic>),
      versions: (json['versions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$VersionEnumMap, e))
              .toList() ??
          const [Version.regular],
      prices: json['prices'] == null
          ? null
          : Prices.fromJson(json['prices'] as Map<String, dynamic>),
      favoritesCount: (json['favorites_count'] as num?)?.toInt() ?? 0,
      mediaLink: json['media_link'] as String?,
      promoMedia: (json['business_promo_reference_media'] as List<dynamic>?)
              ?.map((e) => PromoMediaDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoDays: PromoDaysDM.fromJson(
          json['promo_active_days'] as Map<String, dynamic>),
      followersLength: (json['followers_length'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PromotionDMImplToJson(_$PromotionDMImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'description': instance.description,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      'start_date': instance.startDate.toIso8601String(),
      'expire_date': instance.expireDate.toIso8601String(),
      if (instance.business?.toJson() case final value?) 'business': value,
      'versions': instance.versions.map((e) => _$VersionEnumMap[e]!).toList(),
      if (instance.prices?.toJson() case final value?) 'prices': value,
      'favorites_count': instance.favoritesCount,
      if (instance.mediaLink case final value?) 'media_link': value,
      'business_promo_reference_media':
          instance.promoMedia.map((e) => e.toJson()).toList(),
      'promo_active_days': instance.promoDays.toJson(),
      'followers_length': instance.followersLength,
    };

const _$VersionEnumMap = {
  Version.regular: 'regular',
  Version.medium: 'medium',
  Version.big: 'big',
};

_$PromoMediaDMImpl _$$PromoMediaDMImplFromJson(Map<String, dynamic> json) =>
    _$PromoMediaDMImpl(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      mediaUrl: json['business_promo_media_url'] as String,
      promoItemId: (json['business_promo_item_id'] as num).toInt(),
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['media_type']),
    );

Map<String, dynamic> _$$PromoMediaDMImplToJson(_$PromoMediaDMImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'business_promo_media_url': instance.mediaUrl,
      'business_promo_item_id': instance.promoItemId,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.unknown: 'Unknown',
  MediaType.image: 'Image',
  MediaType.video: 'Video',
};

_$PromoDaysDMImpl _$$PromoDaysDMImplFromJson(Map<String, dynamic> json) =>
    _$PromoDaysDMImpl(
      sunday: json['day_0'] as bool? ?? false,
      monday: json['day_1'] as bool? ?? false,
      tuesday: json['day_2'] as bool? ?? false,
      wednesday: json['day_3'] as bool? ?? false,
      thursday: json['day_4'] as bool? ?? false,
      friday: json['day_5'] as bool? ?? false,
      saturday: json['day_6'] as bool? ?? false,
    );

Map<String, dynamic> _$$PromoDaysDMImplToJson(_$PromoDaysDMImpl instance) =>
    <String, dynamic>{
      'day_0': instance.sunday,
      'day_1': instance.monday,
      'day_2': instance.tuesday,
      'day_3': instance.wednesday,
      'day_4': instance.thursday,
      'day_5': instance.friday,
      'day_6': instance.saturday,
    };

_$PromoGenerationResponseImpl _$$PromoGenerationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PromoGenerationResponseImpl(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      imageBytes:
          const Base64Converter().fromJson(json['imageBytes'] as String?),
    );

Map<String, dynamic> _$$PromoGenerationResponseImplToJson(
        _$PromoGenerationResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      if (const Base64Converter().toJson(instance.imageBytes) case final value?)
        'imageBytes': value,
    };

_$PromoMediaResponseImpl _$$PromoMediaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PromoMediaResponseImpl(
      promoMedia: (json['business_promo_reference_media'] as List<dynamic>)
          .map((e) => PromoMediaDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PromoMediaResponseImplToJson(
        _$PromoMediaResponseImpl instance) =>
    <String, dynamic>{
      'business_promo_reference_media':
          instance.promoMedia.map((e) => e.toJson()).toList(),
    };
