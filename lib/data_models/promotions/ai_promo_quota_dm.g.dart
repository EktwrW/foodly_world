// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_promo_quota_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiPromoQuotaResponseImpl _$$AiPromoQuotaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AiPromoQuotaResponseImpl(
      granted: json['granted'] as bool? ?? false,
      aiPromoMonthlyLimit:
          (json['ai_promo_monthly_limit'] as num?)?.toInt() ?? 6,
      aiPromosUsedThisMonth:
          (json['ai_promos_used_this_month'] as num?)?.toInt() ?? 0,
      remaining: (json['remaining'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AiPromoQuotaResponseImplToJson(
        _$AiPromoQuotaResponseImpl instance) =>
    <String, dynamic>{
      'granted': instance.granted,
      'ai_promo_monthly_limit': instance.aiPromoMonthlyLimit,
      'ai_promos_used_this_month': instance.aiPromosUsedThisMonth,
      'remaining': instance.remaining,
      if (instance.message case final value?) 'message': value,
    };
