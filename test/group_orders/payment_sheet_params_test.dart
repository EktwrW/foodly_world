import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/stripe_payment_service.dart';

/// Qué se le declara al PaymentSheet, y CON QUÉ FORMA exacta.
///
/// El contenido importa, pero lo que de verdad protege este archivo es la
/// forma. El payload cruza `MethodChannel('flutter.stripe/payments',
/// JSONMethodCodec())` hasta un parser nativo que, cuando algo no le cuadra,
/// **no falla: lo ignora**. Un pre-relleno que no llega no rompe ningún test de
/// integración ni deja un log — simplemente el comensal ve el formulario como si
/// no hubiéramos hecho nada.
///
/// El caso concreto y probado: iOS lee la dirección con
/// `defaultBillingDetails["address"] as? [String: String]`
/// (`stripe_ios/.../StripeSdkImpl+PaymentSheet.swift:79`), un cast todo-o-nada
/// que un solo `NSNull` tumba entero. Y el `Address` de `flutter_stripe`
/// serializa sus seis claves siempre, con cinco en null. De ahí que exista un
/// `toJson()` propio y de ahí que esto se afirme clave por clave.
void main() {
  /// Exactamente lo que hace el canal: `JSONMethodCodec` → `json.encode`.
  Map<String, dynamic> comoLlegaAlNativo(SetupPaymentSheetParameters params) {
    final mensaje = const JSONMethodCodec().encodeMethodCall(
      MethodCall('initPaymentSheet', {'params': params.toJson()}),
    );

    final decodificado = json.decode(utf8.decode(mensaje.buffer.asUint8List())) as Map<String, dynamic>;

    return decodificado['args']['params'] as Map<String, dynamic>;
  }

  SetupPaymentSheetParameters conPais(String? pais, {String? email}) => StripePaymentService.sheetParameters(
        clientSecret: 'pi_3U4_secret_abc',
        merchantCountryCode: 'PT',
        billingCountryCode: pais,
        payerEmail: email,
      );

  group('la forma que exige el parser nativo', () {
    /// EL TEST QUE JUSTIFICA TODO ESTE ARCHIVO. Si vuelve a haber un null
    /// dentro de `address`, en iPhone el país deja de pre-rellenarse y nadie se
    /// entera hasta que alguien mire una hoja de pago en un iPhone.
    test('la dirección no lleva ni un solo null', () {
      final address = comoLlegaAlNativo(conPais('ES'))['defaultBillingDetails']['address'] as Map;

      expect(address.values, isNot(contains(null)));
      expect(address, {'country': 'ES'}, reason: 'solo lo que sabemos, nada relleno con null');
    });

    /// El nivel de arriba iOS lo lee clave a clave y sí tolera null, pero se
    /// omite igual: una sola regla para el mapa entero.
    test('tampoco los lleva el nivel de arriba', () {
      final billing = comoLlegaAlNativo(
        conPais('ES', email: 'comensal@foodly.solutions'),
      )['defaultBillingDetails'] as Map;

      expect(billing.values, isNot(contains(null)));
      expect(billing.keys, unorderedEquals(['email', 'address']));
    });

    /// Sin país no se manda un `address` vacío: `{}` pasaría el cast de iOS y
    /// pisaría la dirección con nada, que es peor que no mandar la clave.
    test('sin país no se manda la clave address', () {
      final billing = comoLlegaAlNativo(
        conPais(null, email: 'comensal@foodly.solutions'),
      )['defaultBillingDetails'] as Map;

      expect(billing.containsKey('address'), isFalse);
      expect(billing['email'], 'comensal@foodly.solutions');
    });

    test('el payload entero sobrevive al codec real', () {
      expect(() => comoLlegaAlNativo(conPais('ES', email: 'a@b.com')), returnsNormally);
      expect(() => comoLlegaAlNativo(conPais(null)), returnsNormally);
    });
  });

  group('qué se pre-rellena', () {
    test('el país del comensal llega a defaultBillingDetails', () {
      expect(
        comoLlegaAlNativo(conPais('PT'))['defaultBillingDetails']['address']['country'],
        'PT',
      );
    });

    test('el email llega para que Link no lo pida', () {
      expect(
        comoLlegaAlNativo(conPais('ES', email: 'comensal@foodly.solutions'))['defaultBillingDetails']['email'],
        'comensal@foodly.solutions',
      );
    });

    /// Sin dato se manda `defaultBillingDetails: null` y no un objeto vacío.
    ///
    /// La clave sí viaja —eso lo decide el `toJson()` de `flutter_stripe`, no
    /// nosotros— pero con valor null el nativo se salta el bloque entero: iOS
    /// hace `params["defaultBillingDetails"] as? [String: Any?]`, que sobre un
    /// `NSNull` da nil. O sea: la hoja se comporta como antes de este cambio,
    /// que es justo lo que se quiere cuando no sabemos nada del comensal.
    test('sin país ni email no se declara nada', () {
      expect(comoLlegaAlNativo(conPais(null))['defaultBillingDetails'], isNull);
      expect(comoLlegaAlNativo(conPais('  ', email: '  '))['defaultBillingDetails'], isNull);
    });

    /// Nombre y teléfono se dejan fuera A PROPÓSITO: el nombre de la cuenta de
    /// Foodly puede ser un apodo y no el del titular de la tarjeta, y un
    /// teléfono pre-rellenado empuja a darse de alta en Link sin pedirlo.
    ///
    /// Se afirma sobre las CLAVES, no sobre `isNull`: `expect(x['name'], isNull)`
    /// pasaría también si el mapa fuera `{}` por cualquier otro motivo.
    test('el nombre y el teléfono ni siquiera viajan', () {
      final billing = comoLlegaAlNativo(
        conPais('ES', email: 'comensal@foodly.solutions'),
      )['defaultBillingDetails'] as Map;

      expect(billing.containsKey('name'), isFalse);
      expect(billing.containsKey('phone'), isFalse);
    });

    /// El país de FACTURACIÓN y el del COMERCIO son datos distintos que viajan
    /// juntos y se confunden fácil. Un español pagando en Lisboa: factura en ES,
    /// y las carteras se declaran en PT porque el merchant of record es el
    /// restaurante.
    test('el país de facturación no pisa el del comercio', () {
      final json = comoLlegaAlNativo(
        StripePaymentService.sheetParameters(
          clientSecret: 'pi_3U4_secret_abc',
          merchantCountryCode: 'PT',
          billingCountryCode: 'ES',
        ),
      );

      expect(json['defaultBillingDetails']['address']['country'], 'ES');
      expect(json['googlePay']['merchantCountryCode'], 'PT');
      expect(json['applePay']['merchantCountryCode'], 'PT');
    });
  });

  group('lo que no cambió', () {
    test('sin país del comercio no se declaran carteras', () {
      final json = comoLlegaAlNativo(
        StripePaymentService.sheetParameters(
          clientSecret: 'pi_3U4_secret_abc',
          billingCountryCode: 'ES',
        ),
      );

      expect(json['googlePay'], isNull);
      expect(json['applePay'], isNull);
      expect(
        json['defaultBillingDetails']['address']['country'],
        'ES',
        reason: 'y aun así el formulario de tarjeta sí sabe de dónde es',
      );
    });

    test('el client secret y el nombre del comercio siguen viajando', () {
      final json = comoLlegaAlNativo(conPais('ES'));

      expect(json['paymentIntentClientSecret'], 'pi_3U4_secret_abc');
      expect(json['merchantDisplayName'], 'Foodly');
    });
  });
}
