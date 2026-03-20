// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_promotion_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyPromotionDMImpl _$$NearbyPromotionDMImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyPromotionDMImpl(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      subTitle: json['sub_title'] as String? ?? '',
      mediaLink: json['media_link'] as String?,
      promoMedia: json['promo_media'] == null
          ? null
          : PromoMediaLiteDM.fromJson(
              json['promo_media'] as Map<String, dynamic>),
      businessUuid: json['business_uuid'] as String,
      businessName: json['business_name'] as String,
      businessLogo: json['business_logo'] as String?,
      ratingAvg: (json['rating_avg'] as num?)?.toDouble() ?? 0.0,
      isFavorited: json['is_favorited'] as bool? ?? false,
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      expireDate: json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String),
    );

Map<String, dynamic> _$$NearbyPromotionDMImplToJson(
        _$NearbyPromotionDMImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'sub_title': instance.subTitle,
      if (instance.mediaLink case final value?) 'media_link': value,
      if (instance.promoMedia?.toJson() case final value?) 'promo_media': value,
      'business_uuid': instance.businessUuid,
      'business_name': instance.businessName,
      if (instance.businessLogo case final value?) 'business_logo': value,
      'rating_avg': instance.ratingAvg,
      'is_favorited': instance.isFavorited,
      if (instance.distanceKm case final value?) 'distance_km': value,
      if (instance.startDate?.toIso8601String() case final value?)
        'start_date': value,
      if (instance.expireDate?.toIso8601String() case final value?)
        'expire_date': value,
    };

_$PromoMediaLiteDMImpl _$$PromoMediaLiteDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PromoMediaLiteDMImpl(
      uuid: json['uuid'] as String,
      mediaUrl: json['business_promo_media_url'] as String,
      mediaType: json['media_type'] as String? ?? 'Image',
    );

Map<String, dynamic> _$$PromoMediaLiteDMImplToJson(
        _$PromoMediaLiteDMImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'business_promo_media_url': instance.mediaUrl,
      'media_type': instance.mediaType,
    };

_$NearbyPromotionsResponseDMImpl _$$NearbyPromotionsResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyPromotionsResponseDMImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => NearbyPromotionDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: NearbyPromotionsMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NearbyPromotionsResponseDMImplToJson(
        _$NearbyPromotionsResponseDMImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_$NearbyPromotionsMetaImpl _$$NearbyPromotionsMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyPromotionsMetaImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      hasMore: json['has_more'] as bool,
      maxTotal: (json['max_total'] as num?)?.toInt() ?? 50,
      radiusKm: (json['radius_km'] as num?)?.toDouble() ?? 10.0,
    );

Map<String, dynamic> _$$NearbyPromotionsMetaImplToJson(
        _$NearbyPromotionsMetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'per_page': instance.perPage,
      'has_more': instance.hasMore,
      'max_total': instance.maxTotal,
      'radius_km': instance.radiusKm,
    };
