import 'dart:developer';

import 'package:flutter/foundation.dart' show visibleForTesting;
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

  /// Todo lo que se le declara a la hoja, en un solo sitio y sin tocar Stripe.
  ///
  /// Está separado del `presentPaymentSheet` para poder PROBARLO. Este objeto
  /// se serializa y cruza un MethodChannel hasta un parser nativo que descarta
  /// EN SILENCIO lo que no le cuadra —ver [_DatosDeFacturacion]—, así que la
  /// forma exacta del JSON importa tanto como su contenido.
  /// `payment_sheet_params_test.dart` la fija.
  @visibleForTesting
  static SetupPaymentSheetParameters sheetParameters({
    required String clientSecret,
    String merchantName = 'Foodly',
    String? merchantCountryCode,
    String? billingCountryCode,
    String? payerEmail,
  }) =>
      SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: merchantName,

        // Con qué llega rellena la hoja (2026-08-15).
        //
        // El país arregla el "Estados Unidos" del formulario de tarjeta; el
        // email le ahorra un paso a quien paga con Link, que se autentica
        // justamente por email. Stripe lo recomienda explícito: "Stripe
        // recommends prefilling as much information as possible to streamline
        // the checkout process".
        //
        // Son PRE-RELLENOS, no datos del cobro: el comensal los puede cambiar
        // en la hoja, y no se adjuntan al PaymentMethod porque
        // `attachDefaultsToPaymentMethod` sigue en su default (false). Por eso
        // pasarlos no tiene riesgo de mandar a Stripe un dato equivocado.
        //
        // Nombre y teléfono NO se pasan a propósito: el nombre de la cuenta
        // de Foodly puede ser un apodo y no el del titular de la tarjeta, y un
        // teléfono pre-rellenado arrastra al comensal a darse de alta en Link
        // sin haberlo pedido.
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
        applePay: merchantCountryCode == null ? null : PaymentSheetApplePay(merchantCountryCode: merchantCountryCode),
        googlePay: merchantCountryCode == null
            ? null
            : PaymentSheetGooglePay(
                merchantCountryCode: merchantCountryCode,
                testEnv: _isStripeTestMode,
              ),
      );

  /// Lo que va pre-rellenado, o null si no hay nada que pre-rellenar.
  ///
  /// Null y no un objeto vacío: `defaultBillingDetails: {}` es una instrucción
  /// para la hoja, y prefiero que cuando no sabemos nada la llamada salga tal
  /// como salía antes de este cambio.
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

/// `BillingDetails` cuya dirección SÍ la entiende iOS.
///
/// EXISTE POR UN BUG DEL PAQUETE, y el bug es silencioso — que es lo que lo
/// vuelve peligroso. El `Address` generado serializa SIEMPRE sus seis claves,
/// aunque cinco vengan vacías:
///
/// ```json
/// "address":{"city":null,"country":"ES","line1":null,"line2":null,
///            "postalCode":null,"state":null}
/// ```
///
/// Y el lado iOS del paquete lo lee con un cast que es todo-o-nada:
///
/// ```swift
/// // stripe_ios/.../StripeSdkImpl+PaymentSheet.swift:79
/// if let address = defaultBillingDetails["address"] as? [String: String] {
/// ```
///
/// Un `NSNull` dentro del diccionario hace fallar el cast ENTERO, así que en
/// iPhone la dirección se descarta sin error, sin log y sin síntoma legible: el
/// email se pre-rellena y el país no. En Android no pasa, porque su parser
/// filtra las claves nulas con `hasKey()`. Por eso este `toJson()` OMITE lo que
/// no tiene valor en vez de mandarlo en null.
///
/// LO QUE ESTA CLASE **NO** ARREGLA, y conviene no volver a creérselo: al
/// `toJson()` generado le falta `explicitToJson` y mete el objeto `Address`
/// crudo en el mapa, pero eso da IGUAL — el canal es
/// `MethodChannel('flutter.stripe/payments', JSONMethodCodec())` y `json.encode`
/// llama solo al `toJson()` de lo anidado. Con `StandardMessageCodec` sí
/// reventaría; ese codec no interviene acá. Verificado el 2026-08-15 ejecutando
/// el codec real, después de haberme creído lo contrario.
class _DatosDeFacturacion implements BillingDetails {
  const _DatosDeFacturacion({this.email, this.address});

  @override
  final String? email;

  @override
  final Address? address;

  /// No se pre-rellenan; el porqué está en [StripePaymentService.sheetParameters].
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

    // Las de primer nivel iOS las lee una a una y sí toleran null; se omiten
    // igual para no tener dos reglas distintas en el mismo mapa.
    return <String, dynamic>{
      if (email != null) 'email': email,
      // Un mapa vacío pasaría el cast y pisaría la dirección con nada.
      if (direccion.isNotEmpty) 'address': direccion,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
    };
  }

  /// `flutter_stripe` nunca lo llama —verificado por grep sobre el paquete— y
  /// esta clase no sale de este archivo. Se delega en un `BillingDetails` de
  /// verdad en vez de lanzar: lo que devuelve serializa bien en este canal, solo
  /// pierde el filtrado de nulos que motiva toda esta clase.
  @override
  $BillingDetailsCopyWith<BillingDetails> get copyWith => BillingDetails(email: email, address: address).copyWith;
}
