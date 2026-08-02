import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_connect_dm.freezed.dart';
part 'stripe_connect_dm.g.dart';

/// F4a-6 — estado de la cuenta Stripe Connect del negocio (espejo de
/// StripeConnectController::status). `chargesEnabled` es LA señal: sin ella
/// el negocio no puede cobrar órdenes.
@freezed
abstract class StripeConnectStatusDM with _$StripeConnectStatusDM {
  const factory StripeConnectStatusDM({
    @Default(true) bool success,
    @Default(false) bool connected,
    @JsonKey(name: 'charges_enabled') @Default(false) bool chargesEnabled,
    @JsonKey(name: 'payouts_enabled') @Default(false) bool payoutsEnabled,
    @JsonKey(name: 'details_submitted') @Default(false) bool detailsSubmitted,
  }) = _StripeConnectStatusDM;

  factory StripeConnectStatusDM.fromJson(Map<String, dynamic> json) =>
      _$StripeConnectStatusDMFromJson(json);
}

/// Respuesta del onboarding: la URL del AccountLink de Stripe (hosted).
@freezed
abstract class StripeOnboardResponseDM with _$StripeOnboardResponseDM {
  const factory StripeOnboardResponseDM({
    @Default(true) bool success,
    @JsonKey(name: 'onboarding_url') String? onboardingUrl,
    @JsonKey(name: 'charges_enabled') @Default(false) bool chargesEnabled,
  }) = _StripeOnboardResponseDM;

  factory StripeOnboardResponseDM.fromJson(Map<String, dynamic> json) =>
      _$StripeOnboardResponseDMFromJson(json);
}
