import 'dart:developer';

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
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: merchantName,

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
          applePay: merchantCountryCode == null
              ? null
              : PaymentSheetApplePay(merchantCountryCode: merchantCountryCode),
          googlePay: merchantCountryCode == null
              ? null
              : PaymentSheetGooglePay(
                  merchantCountryCode: merchantCountryCode,
                  testEnv: _isStripeTestMode,
                ),
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
}
