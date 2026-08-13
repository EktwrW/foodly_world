import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/core_exports.dart' show AppRoutes, GoRouterRedirector;

/// Vuelta del Checkout hosteado (App Link F4b).
///
/// El comensal paga con MB WAY en el navegador y vuelve a
/// `foodly.solutions/checkout/return/{success|cancel}?order={uuid}`.
///
/// **Hasta el 2026-08-12 el router no tenía NINGUNA ruta para ese path**, así
/// que caía en `errorPageBuilder` → `NotFoundPage`: la pantalla de "no
/// encontrado" justo después de pagar. Es el segundo tiempo del mismo bug que
/// arregló el App Link — primero la app ni se abría, y una vez abierta no sabía
/// a dónde ir.
///
/// La forma de la URL no es libre: el `:result` va en el PATH porque el AASA de
/// iOS y el `pathPrefix` de Android matchean por path, y el uuid va en QUERY
/// para no alterarlo. Si alguien mueve el uuid al path, los tres matchers
/// (AASA, Android y el rewrite de la landing) dejan de coincidir.
void main() {
  const uuid = 'ord-123';

  group('checkoutReturnLandingPath (decisión pura)', () {
    test('con orden y sesión → la orden, tanto en éxito como en cancelación', () {
      // El destino no depende del resultado: es la pantalla que el comensal
      // quiere ver en los dos casos, y ya refleja el estado real. Quien sella
      // el cobro es el webhook firmado, no esta URL — que es adivinable.
      expect(
        GoRouterRedirector.checkoutReturnLandingPath(orderUuid: uuid, hasSession: true),
        '/group-order/$uuid',
      );
    });

    test('sin sesión → start, que decide el redirect global', () {
      expect(
        GoRouterRedirector.checkoutReturnLandingPath(orderUuid: uuid, hasSession: false),
        AppRoutes.start.path,
      );
    });

    test('sin uuid (URL vieja o manipulada) → start, nunca a NotFound', () {
      for (final vacio in <String?>[null, '']) {
        expect(
          GoRouterRedirector.checkoutReturnLandingPath(orderUuid: vacio, hasSession: true),
          AppRoutes.start.path,
          reason: 'uuid = ${vacio == null ? 'null' : '""'}',
        );
      }
    });
  });

  group('la forma de la ruta', () {
    test('el resultado va en el path y el uuid NO', () {
      // Lo que matchean el AASA, el pathPrefix de Android y el rewrite de la
      // landing es `/checkout/return/...`. Mover el uuid ahí los rompe a los
      // tres a la vez.
      expect(AppRoutes.checkoutReturn.path, '/checkout/return/:result');
      expect(AppRoutes.checkoutReturn.path.contains(':id'), isFalse);
    });

    test('el path que genera el backend cae dentro de esta ruta', () {
      // Espeja `GroupOrderPaymentController::checkoutReturnUrl` de be-foodly.
      final uri = Uri.parse('https://foodly.solutions/checkout/return/success?order=$uuid');

      expect(uri.path, '/checkout/return/success');
      expect(uri.queryParameters['order'], uuid);
      expect(
        AppRoutes.checkoutReturn.path.replaceFirst(':result', 'success'),
        uri.path,
      );
    });
  });
}
