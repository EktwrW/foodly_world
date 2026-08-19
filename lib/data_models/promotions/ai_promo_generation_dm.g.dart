// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_promo_generation_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiPromoImageOption _$AiPromoImageOptionFromJson(Map<String, dynamic> json) =>
    _AiPromoImageOption(
      look: json['look'] as String? ?? '',
      imageBase64: json['image_base64'] as String? ?? '',
      seed: (json['seed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AiPromoImageOptionToJson(_AiPromoImageOption instance) =>
    <String, dynamic>{
      'look': instance.look,
      'image_base64': instance.imageBase64,
      if (instance.seed case final value?) 'seed': value,
    };

_AiPromoGenerationResponse _$AiPromoGenerationResponseFromJson(
        Map<String, dynamic> json) =>
    _AiPromoGenerationResponse(
      granted: json['granted'] as bool? ?? false,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map(
                  (e) => AiPromoImageOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      aiPromoMonthlyLimit:
          (json['ai_promo_monthly_limit'] as num?)?.toInt() ?? 3,
      aiPromosUsedThisMonth:
          (json['ai_promos_used_this_month'] as num?)?.toInt() ?? 0,
      remaining: (json['remaining'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AiPromoGenerationResponseToJson(
        _AiPromoGenerationResponse instance) =>
    <String, dynamic>{
      'granted': instance.granted,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'ai_promo_monthly_limit': instance.aiPromoMonthlyLimit,
      'ai_promos_used_this_month': instance.aiPromosUsedThisMonth,
      'remaining': instance.remaining,
      if (instance.message case final value?) 'message': value,
    };
