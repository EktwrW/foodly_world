import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';

/// Qué método local le corresponde al comensal, según de dónde sea.
///
/// EL ERROR QUE ESTO FIJA (2026-08-14). La primera versión de la regla miraba
/// el país del RESTAURANTE. Con eso, en una mesa de Lisboa el turista español
/// veía "Pagar con MB WAY" —un método que no tiene, atado a un teléfono
/// portugués— y el portugués que cenaba en España no veía nada. Stripe muestra
/// estos métodos por "customer location": Portugal para MB WAY, España para
/// Bizum. Lo que decide es quién paga.
///
/// Esta función es el ESPEJO de `HostedRail::methodForCountry` en el backend.
/// Si se separan, el botón promete un método y el navegador ofrece la página
/// dinámica — feo, pero se paga. Por eso el mismo juego de casos vive en los
/// dos lados.
void main() {
  _offeredTests();
  group('el país del comensal elige el método', () {
    test('portugués → MB WAY', () {
      expect(hostedRailFor('PT'), HostedRail.mbWay);
    });

    test('español → Bizum', () {
      expect(hostedRailFor('ES'), HostedRail.bizum);
    });

    test('un portugués NO ve Bizum, y un español NO ve MB WAY', () {
      // Dicho al revés porque es el error que se cometió: los dos métodos se
      // parecen —teléfono, app del banco— y es fácil tratarlos como uno solo.
      expect(hostedRailFor('PT'), isNot(HostedRail.bizum));
      expect(hostedRailFor('ES'), isNot(HostedRail.mbWay));
    });
  });

  group('el resto del mundo se queda con un solo CTA', () {
    for (final pais in ['FR', 'DE', 'GB', 'IT', 'AR', 'US', 'BR']) {
      test('$pais → sin método local', () {
        expect(hostedRailFor(pais), HostedRail.none);
      });
    }

    test('sin país declarado → sin método local', () {
      // Es lo normal en un invitado o en quien se registró sin teléfono. El
      // modo de fallo tiene que ser el de siempre: un CTA y nada más.
      expect(hostedRailFor(null), HostedRail.none);
      expect(hostedRailFor(''), HostedRail.none);
      expect(hostedRailFor('   '), HostedRail.none);
    });

    test('basura en el campo → sin método local, no una excepción', () {
      expect(hostedRailFor('no-es-un-país'), HostedRail.none);
      expect(hostedRailFor('PTX'), HostedRail.none);
    });
  });

  group('cómo llega escrito el país', () {
    // `user.phoneCountryCode` es ISO ('PT'); el país de la dirección principal
    // viaja como nombre ('Portugal'). Los dos acaban en esta función.
    test('ISO en cualquier caja', () {
      expect(hostedRailFor('pt'), HostedRail.mbWay);
      expect(hostedRailFor('Pt'), HostedRail.mbWay);
      expect(hostedRailFor('es'), HostedRail.bizum);
    });

    test('nombre largo, en inglés o en castellano', () {
      expect(hostedRailFor('Portugal'), HostedRail.mbWay);
      expect(hostedRailFor('PORTUGAL'), HostedRail.mbWay);
      expect(hostedRailFor('Spain'), HostedRail.bizum);
      expect(hostedRailFor('España'), HostedRail.bizum);
      expect(hostedRailFor('Espana'), HostedRail.bizum);
    });

    test('con espacios de sobra', () {
      // Viene de un formulario y de una dirección tecleada a mano.
      expect(hostedRailFor('  Portugal  '), HostedRail.mbWay);
      expect(hostedRailFor(' ES '), HostedRail.bizum);
    });
  });
}

/// El rail que de verdad se puede OFRECER: país del comensal Y capability del
/// restaurante.
///
/// EL BUG (producción, 2026-08-31): solo se miraba el país. Cualquier portugués
/// veía "Pagar con MB WAY" aunque el restaurante no tuviera la capability
/// activa, y al pulsarlo aterrizaba en una página hosteada con tarjeta y nada
/// más. El backend ya lo sabía y ya restringía la sesión de Checkout; lo que
/// faltaba era decírselo a quien dibuja el botón.
void _offeredTests() {
  group('hostedRailOffered', () {
    test('el país manda sobre CUÁL, el negocio sobre SI', () {
      expect(
        hostedRailOffered(payerCountry: 'PT', businessOffersMbWay: true, businessOffersBizum: false),
        HostedRail.mbWay,
      );
      expect(
        hostedRailOffered(payerCountry: 'ES', businessOffersMbWay: false, businessOffersBizum: true),
        HostedRail.bizum,
      );
    });

    test('sin la capability no hay botón, aunque el país la pida', () {
      // Es el bug exacto. El comensal es portugués y el restaurante cobra con
      // tarjeta: antes se le ofrecía MB WAY igual.
      expect(
        hostedRailOffered(payerCountry: 'PT', businessOffersMbWay: false, businessOffersBizum: true),
        HostedRail.none,
      );
      expect(
        hostedRailOffered(payerCountry: 'ES', businessOffersMbWay: true, businessOffersBizum: false),
        HostedRail.none,
      );
    });

    test('no cruza los métodos: la capability del OTRO no habilita el propio', () {
      expect(
        hostedRailOffered(payerCountry: 'PT', businessOffersMbWay: false, businessOffersBizum: false),
        HostedRail.none,
      );
    });

    test('un comensal de fuera sigue sin botón local aunque el negocio acepte todo', () {
      for (final pais in ['FR', 'US', 'BR', null, '']) {
        expect(
          hostedRailOffered(payerCountry: pais, businessOffersMbWay: true, businessOffersBizum: true),
          HostedRail.none,
          reason: 'país = $pais',
        );
      }
    });
  });
}
