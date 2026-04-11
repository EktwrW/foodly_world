import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_promo_quota_dm.freezed.dart';
part 'ai_promo_quota_dm.g.dart';

@freezed
class AiPromoQuotaResponse with _$AiPromoQuotaResponse {
  const AiPromoQuotaResponse._();

  const factory AiPromoQuotaResponse({
    @Default(false) bool granted,
    @JsonKey(name: 'ai_promo_monthly_limit') @Default(6) int aiPromoMonthlyLimit,
    @JsonKey(name: 'ai_promos_used_this_month') @Default(0) int aiPromosUsedThisMonth,
    @Default(0) int remaining,
    String? message,
  }) = _AiPromoQuotaResponse;

  factory AiPromoQuotaResponse.fromJson(Map<String, dynamic> json) =>
      _$AiPromoQuotaResponseFromJson(json);

  bool get quotaExhausted => !granted && remaining <= 0;
}
