// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_promotions_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedPromoBusinessDMImpl _$$SavedPromoBusinessDMImplFromJson(
        Map<String, dynamic> json) =>
    _$SavedPromoBusinessDMImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      categoryImagePath: json['category_image_path'] as String?,
      status: json['status'] as String? ?? 'closed',
      hoursDisplay: json['hours_display'] as String?,
    );

Map<String, dynamic> _$$SavedPromoBusinessDMImplToJson(
        _$SavedPromoBusinessDMImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      if (instance.logo case final value?) 'logo': value,
      if (instance.categoryId case final value?) 'category_id': value,
      if (instance.categoryName case final value?) 'category_name': value,
      if (instance.categoryImagePath case final value?)
        'category_image_path': value,
      'status': instance.status,
      if (instance.hoursDisplay case final value?) 'hours_display': value,
    };

_$SavedPromotionsResponseDMImpl _$$SavedPromotionsResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$SavedPromotionsResponseDMImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => NearbyPromotionDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      businesses: (json['businesses'] as List<dynamic>?)
              ?.map((e) =>
                  SavedPromoBusinessDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : SavedPromosMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SavedPromotionsResponseDMImplToJson(
        _$SavedPromotionsResponseDMImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'businesses': instance.businesses.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_$SavedPromosMetaImpl _$$SavedPromosMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$SavedPromosMetaImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SavedPromosMetaImplToJson(
        _$SavedPromosMetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
    };
