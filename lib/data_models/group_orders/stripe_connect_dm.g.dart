// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_connect_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StripeConnectStatusDM _$StripeConnectStatusDMFromJson(
        Map<String, dynamic> json) =>
    _StripeConnectStatusDM(
      success: json['success'] as bool? ?? true,
      connected: json['connected'] as bool? ?? false,
      chargesEnabled: json['charges_enabled'] as bool? ?? false,
      payoutsEnabled: json['payouts_enabled'] as bool? ?? false,
      detailsSubmitted: json['details_submitted'] as bool? ?? false,
      groupPaymentMode: json['group_payment_mode'] as String?,
      cardMinAmountMinor: (json['card_min_amount_minor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StripeConnectStatusDMToJson(
        _StripeConnectStatusDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'connected': instance.connected,
      'charges_enabled': instance.chargesEnabled,
      'payouts_enabled': instance.payoutsEnabled,
      'details_submitted': instance.detailsSubmitted,
      if (instance.groupPaymentMode case final value?)
        'group_payment_mode': value,
      if (instance.cardMinAmountMinor case final value?)
        'card_min_amount_minor': value,
    };

_StripeOnboardResponseDM _$StripeOnboardResponseDMFromJson(
        Map<String, dynamic> json) =>
    _StripeOnboardResponseDM(
      success: json['success'] as bool? ?? true,
      onboardingUrl: json['onboarding_url'] as String?,
      chargesEnabled: json['charges_enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$StripeOnboardResponseDMToJson(
        _StripeOnboardResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      if (instance.onboardingUrl case final value?) 'onboarding_url': value,
      'charges_enabled': instance.chargesEnabled,
    };
