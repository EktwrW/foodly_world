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
  Future<StripePaymentResult> presentPaymentSheet({
    required String clientSecret,
    String merchantName = 'Foodly',
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: merchantName,
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
