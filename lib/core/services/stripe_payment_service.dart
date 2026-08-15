import 'dart:developer';

import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, visibleForTesting;
import 'package:flutter_stripe/flutter_stripe.dart';

enum StripePaymentResult { completed, canceled, failed }

/// Envoltorio del PaymentSheet de Stripe. Aislado en su propio archivo porque
/// `flutter_stripe` exporta un `Card` que choca con el `Card` de Material —
/// las pantallas importan ESTE servicio, no `flutter_stripe`.
///
/// Group Orders usa destination charges: el PaymentIntent vive en la cuenta
/// plataforma (con transfer_data[destination]), así que el cliente confirma
/// contra la plataforma — no hace falta `stripeAccountId` aquí.
class StripePaymentService {
  /// El entorno de Google Pay tiene que coincidir con el MODO DE STRIPE, no
  /// con el modo de compilación de Flutter. Son ejes distintos y se cruzan:
  /// el APK de e2e se buildea `--release` con una `pk_test_`, así que atarlo
  /// a `kDebugMode` lo mandaba a PRODUCTION contra una cuenta en test —
  /// Google devuelve un token real que Stripe test no puede cobrar, y encima
  /// PRODUCTION exige el production access aprobado por Google.
  ///
  /// Misma constante que consume `main.dart` para `Stripe.publishableKey`.
  /// `final` y no `const`: `startsWith` no es evaluable en tiempo de
  /// compilación (Dart solo admite `+`, `length` y `==` sobre String const).
  static const _publishableKey = String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
  static final _isStripeTestMode = _publishableKey.startsWith('pk_test_');

  Future<StripePaymentResult> presentPaymentSheet({
    required String clientSecret,
    String merchantName = 'Foodly',
    String? merchantCountryCode,
    String? billingCountryCode,
    String? payerEmail,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: sheetParameters(
          clientSecret: clientSecret,
          merchantName: merchantName,
          merchantCountryCode: merchantCountryCode,
          billingCountryCode: billingCountryCode,
          payerEmail: payerEmail,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      return StripePaymentResult.completed;
    } on StripeException catch (e, st) {
      if (e.error.code == FailureCode.Canceled) {
        return StripePaymentResult.canceled;
      }
      log(
        'PaymentSheet StripeException — code: ${e.error.code}, '
        'message: ${e.error.message}, localized: ${e.error.localizedMessage}',
        name: 'StripePaymentService',
        error: e,
        stackTrace: st,
      );
      return StripePaymentResult.failed;
    } catch (e, st) {
      log('PaymentSheet error inesperado', name: 'StripePaymentService', error: e, stackTrace: st);
      return StripePaymentResult.failed;
    }
  }

  /// Separado de `presentPaymentSheet` para poder probarlo: el parser nativo
  /// descarta en silencio lo que no le cuadra (ver [_DatosDeFacturacion]).
  @visibleForTesting
  static SetupPaymentSheetParameters sheetParameters({
    required String clientSecret,
    String merchantName = 'Foodly',
    String? merchantCountryCode,
    String? billingCountryCode,
    String? payerEmail,
    TargetPlatform? platform,
  }) =>
      SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: merchantName,

        // Pre-relleno: el país arregla el "Estados Unidos" del formulario de
        // tarjeta y el email le ahorra un paso a Link. Nombre y teléfono no,
        // a propósito (apodos, y alta en Link sin pedirla).
        billingDetails: _prefill(billingCountryCode, payerEmail),

        // Apple Pay y Google Pay (2026-08-10).
        //
        // Cuestan EXACTAMENTE lo mismo que una tarjeta —son la misma vía,
        // solo cambia cómo se autoriza— así que no mejoran el margen. Lo
        // que mejoran es la conversión, y en una mesa eso pesa: tipear 16
        // dígitos con el camarero esperando es donde se abandona un pago.
        //
        // El backend ya venía preparado: el PaymentIntent se crea con
        // `automatic_payment_methods: enabled`, así que Stripe las ofrece
        // en cuanto el cliente las declara. Faltaba solo esta declaración.
        //
        // `merchantCountryCode` es el país del COMERCIO, no el del que paga:
        // un alemán pagando en Lisboa es una transacción portuguesa. Y el
        // comercio es el RESTAURANTE —los destination charges van con
        // `on_behalf_of`, que lo vuelve merchant of record—, así que el dato
        // viaja en la orden y no en la sesión: quien ve esta hoja es el
        // comensal, que no es dueño del local.
        //
        // Sin país no se declaran las carteras. Apple exige que coincida con
        // el del adquirente y Google valida el mercado; mandar uno inventado
        // hace fallar la autorización DESPUÉS de que el usuario aprobó con
        // Face ID. Que no aparezca el botón es el modo de fallo barato: la
        // tarjeta sigue estando.
        // Cada cartera en su plataforma: `flutter_stripe` tiene un assert que
        // exige `merchantIdentifier` en cuanto `applePay != null`, sin mirar
        // dónde corre, y tumbaba el pago en debug/profile.
        applePay: merchantCountryCode == null || (platform ?? defaultTargetPlatform) != TargetPlatform.iOS
            ? null
            : PaymentSheetApplePay(merchantCountryCode: merchantCountryCode),
        googlePay: merchantCountryCode == null || (platform ?? defaultTargetPlatform) != TargetPlatform.android
            ? null
            : PaymentSheetGooglePay(
                merchantCountryCode: merchantCountryCode,
                testEnv: _isStripeTestMode,
              ),
      );

  /// Null y no un objeto vacío: sin datos, la hoja se comporta como antes.
  static BillingDetails? _prefill(String? countryCode, String? email) {
    final pais = (countryCode ?? '').trim();
    final correo = (email ?? '').trim();
    if (pais.isEmpty && correo.isEmpty) return null;

    return _DatosDeFacturacion(
      email: correo.isEmpty ? null : correo,
      address: pais.isEmpty
          ? null
          : Address(
              country: pais,
              city: null,
              line1: null,
              line2: null,
              postalCode: null,
              state: null,
            ),
    );
  }
}

/// `BillingDetails` que omite las claves nulas.
///
/// El `Address` generado serializa siempre sus seis claves, y iOS lee la
/// dirección con `as? [String: String]` (`StripeSdkImpl+PaymentSheet.swift:79`),
/// un cast que un solo `NSNull` tumba entero: la dirección se descartaba en
/// silencio y el país no se pre-rellenaba. Android filtra los nulos y no sufre.
///
/// No es por el `explicitToJson` que le falta al paquete: el canal usa
/// `JSONMethodCodec` y `json.encode` resuelve el anidado solo.
class _DatosDeFacturacion implements BillingDetails {
  const _DatosDeFacturacion({this.email, this.address});

  @override
  final String? email;

  @override
  final Address? address;

  @override
  String? get phone => null;

  @override
  String? get name => null;

  @override
  Map<String, dynamic> toJson() {
    final direccion = <String, dynamic>{
      if (address?.city != null) 'city': address!.city,
      if (address?.country != null) 'country': address!.country,
      if (address?.line1 != null) 'line1': address!.line1,
      if (address?.line2 != null) 'line2': address!.line2,
      if (address?.postalCode != null) 'postalCode': address!.postalCode,
      if (address?.state != null) 'state': address!.state,
    };

    return <String, dynamic>{
      if (email != null) 'email': email,
      // Vacío pasaría el cast de iOS y pisaría la dirección con nada.
      if (direccion.isNotEmpty) 'address': direccion,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
    };
  }

  /// `flutter_stripe` nunca lo llama; se delega en vez de lanzar.
  @override
  $BillingDetailsCopyWith<BillingDetails> get copyWith => BillingDetails(email: email, address: address).copyWith;
}
