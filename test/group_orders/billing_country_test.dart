import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/billing_country.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';

/// Qué país trae puesto el formulario de tarjeta.
///
/// Nace de un e2e (2026-08-15): venía **Estados Unidos**, porque sin dato la
/// hoja cae al idioma del dispositivo. La regla es corta —comensal, si no
/// restaurante, si no nada— pero cada peldaño existe por un motivo distinto y
/// se rompe por su cuenta, así que cada uno tiene su test.
void main() {
  group('billingCountryFor', () {
    // ── El orden de preferencia ─────────────────────────────────────

    test('manda el país del comensal: es el dueño de la tarjeta', () {
      expect(
        billingCountryFor(payerCountry: 'ES', businessCountry: 'PT'),
        'ES',
      );
    });

    /// El caso que más se equivocaría una regla que mirase al restaurante: el
    /// turista. Se afirma en LAS DOS DIRECCIONES a propósito — con una sola,
    /// una regla invertida seguiría pasando la mitad de las veces.
    test('el turista factura en su país, vaya en la dirección que vaya', () {
      expect(billingCountryFor(payerCountry: 'ES', businessCountry: 'PT'), 'ES');
      expect(billingCountryFor(payerCountry: 'PT', businessCountry: 'ES'), 'PT');
    });

    test('sin país del comensal cae al del restaurante', () {
      // Se registró sin teléfono ni dirección. Quien está sentado en esa mesa
      // es, lo más probable, del país donde está la mesa.
      expect(billingCountryFor(businessCountry: 'PT'), 'PT');
    });

    /// Sin nada NO se inventa. Devolver null deja la hoja como estaba, que es
    /// una degradación; devolver un país al azar sería un dato falso metido en
    /// el formulario de otra persona.
    test('sin ningún dato no se inventa un país', () {
      expect(billingCountryFor(), isNull);
      expect(billingCountryFor(payerCountry: '', businessCountry: '  '), isNull);
    });

    // ── El dato llega sucio ─────────────────────────────────────────

    test('acepta el nombre largo y no solo el ISO', () {
      expect(billingCountryFor(payerCountry: 'Portugal'), 'PT');
      expect(billingCountryFor(payerCountry: 'España'), 'ES');
    });

    test('sobrevive a la caja y a los espacios', () {
      expect(billingCountryFor(payerCountry: '  pt  '), 'PT');
      expect(billingCountryFor(payerCountry: 'espana'), 'ES');
    });

    /// UN PAÍS DEL COMENSAL QUE NO SE ENTIENDE NO BLOQUEA EL SIGUIENTE PELDAÑO.
    ///
    /// Es el punto que se rompe solo: si el primer nivel devolviera '' o el
    /// texto crudo en vez de null, el `??` lo daría por bueno y el restaurante
    /// no llegaría a mirarse nunca — y el formulario acabaría con un país
    /// inexistente, que es peor que Estados Unidos.
    test('un país ilegible del comensal deja pasar al del restaurante', () {
      expect(billingCountryFor(payerCountry: 'Freedonia', businessCountry: 'PT'), 'PT');
      expect(billingCountryFor(payerCountry: '???', businessCountry: 'PT'), 'PT');
      expect(billingCountryFor(payerCountry: 'PRT', businessCountry: 'PT'), 'PT');
    });

    test('si tampoco se entiende el del restaurante, null', () {
      expect(billingCountryFor(payerCountry: 'Freedonia', businessCountry: 'Sylvania'), isNull);
    });

    // ── El resto del mundo ──────────────────────────────────────────

    /// Esto NO es el gate de MB WAY/Bizum: cualquier ISO vale, porque cualquier
    /// comensal tiene una dirección de facturación. Un francés paga con tarjeta
    /// y merece su país puesto igual que un portugués.
    test('no se limita a los dos países que tienen método local', () {
      expect(billingCountryFor(payerCountry: 'FR'), 'FR');
      expect(billingCountryFor(payerCountry: 'br'), 'BR');
      expect(hostedRailFor('FR'), HostedRail.none, reason: 'y aun así no tiene botón local');
    });
  });

  group('countryIsoOrNull', () {
    test('devuelve el ISO cuando puede afirmarlo', () {
      expect(countryIsoOrNull('de'), 'DE');
      expect(countryIsoOrNull(' Spain '), 'ES');
    });

    /// Recortar 'PRT' a 'PR' daría Puerto Rico. Prefiere no contestar.
    test('no recorta ni adivina', () {
      expect(countryIsoOrNull('PRT'), isNull);
      expect(countryIsoOrNull('Deutschland'), isNull);
      expect(countryIsoOrNull('E5'), isNull);
      expect(countryIsoOrNull('ÑÑ'), isNull);
      expect(countryIsoOrNull('P T'), isNull);
      expect(countryIsoOrNull(''), isNull);
      expect(countryIsoOrNull('   '), isNull);
      expect(countryIsoOrNull(null), isNull);
    });

    /// VALIDA LA FORMA, NO QUE EL PAÍS EXISTA — y está bien que sea así, pero
    /// que quede escrito: quien lea `countryIsoOrNull` y asuma que le devuelve
    /// un ISO 3166 real se va a llevar una sorpresa.
    ///
    /// No duele: el rail busca en un mapa cerrado de PT/ES, y a Stripe un país
    /// inexistente le hace ignorar el pre-relleno, no rechazar el cobro.
    test('dos letras cualesquiera pasan, aunque no sean un país', () {
      expect(countryIsoOrNull('XX'), 'XX');
      expect(countryIsoOrNull('UK'), 'UK', reason: 'el ISO de Reino Unido es GB, no UK');
      expect(hostedRailFor('XX'), HostedRail.none, reason: 'y el rail no se inmuta');
    });
  });
}
