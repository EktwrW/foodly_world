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
    // Ajustes de cobro, que viajan en este mismo payload porque es el que el
    // banner del panel ya pollea: así el selector de "¿cómo cobra tu negocio?"
    // abre con los valores puestos en vez de en blanco.
    @JsonKey(name: 'group_payment_mode') String? groupPaymentMode,
    // Mínimo para pagar en la app, en CÉNTIMOS. null = sin mínimo.
    @JsonKey(name: 'card_min_amount_minor') int? cardMinAmountMinor,
    /// F4c: ¿el negocio sirve EN MESA? Abre el selector con el valor real.
    @JsonKey(name: 'table_service') @Default(false) bool tableService,
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
