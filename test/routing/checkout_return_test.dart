import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/core_exports.dart' show AppRoutes, GoRouterRedirector;
import 'package:foodly_world/core/routing/route_hierarchy.dart';
import 'package:go_router/go_router.dart';

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
///
/// **La primera versión de esta ruta se testeó solo como función pura y por eso
/// se escapó el fallo grave** (auditoría del 2026-08-13): la decisión era
/// correcta y el árbol vivo no. De ahí el grupo "contra el router de verdad" de
/// más abajo — sin él, los dos bugs que arregla este archivo pasan en verde.
void main() {
  const uuid = '3f8c1d2e-9a4b-4c7d-8e10-5b6a7c8d9e0f';

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

    test('un order que no es un uuid NO se interpola en el path', () {
      // La URL es pública y cualquiera la fabrica; go_router además ya
      // percent-decodifica la query, y `Uri.parse` normaliza los `..`. Sin
      // validar la forma, `..%2Fjoin%2FABC123` aterrizaba en `/join/ABC123`
      // — o sea metía al comensal en la mesa de otro.
      const hostiles = <String>[
        '../join/ABC123',
        '/../../main/home',
        'a/b',
        'x?foo=bar',
        'x#frag',
        'no-soy-un-uuid',
        '3f8c1d2e9a4b4c7d8e105b6a7c8d9e0f', // uuid sin guiones
        '3f8c1d2e-9a4b-4c7d-8e10-5b6a7c8d9e0f/extra',
      ];

      for (final hostil in hostiles) {
        expect(
          GoRouterRedirector.checkoutReturnLandingPath(orderUuid: hostil, hasSession: true),
          AppRoutes.start.path,
          reason: hostil,
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

  group('la vuelta del pago jamás se restaura tras un reinicio', () {
    // Lo que se persiste como LAST_PATH es `matchedLocation`, que YA descartó
    // la query: el path guardado nunca lleva el `?order=`. Restaurarlo mandaba
    // al comensal a una vuelta de pago sin orden → redirige a `/` → restaura
    // otra vez → `redirect loop detected` → NotFoundPage. Y como se reescribía
    // en cada pasada, se quedaba pegado en TODOS los arranques siguientes.
    test('isEphemeral cubre las tres formas que pueden llegar a la app', () {
      for (final p in [
        '/checkout/return/success',
        '/checkout/return/cancel',
        // Android declara pathPrefix="/checkout/return", así que la forma de
        // dos segmentos también entra en la app.
        '/checkout/return',
      ]) {
        expect(RouteHierarchy.isEphemeral(p), isTrue, reason: p);
        expect(RouteHierarchy.shouldPersistAsLastPath(p), isFalse, reason: p);
      }
    });

    test('las rutas de contenido siguen persistiéndose', () {
      // Guard de la mutación fácil: ensanchar isEphemeral de más apaga la
      // restauración de rutas legítimas.
      expect(RouteHierarchy.shouldPersistAsLastPath('/visit-menu/m1'), isTrue);
      expect(RouteHierarchy.shouldPersistAsLastPath('/main/u1/visit-business'), isTrue);
    });
  });

  group('contra el router de verdad', () {
    // Los servicios que rodean a la ruta son stubs (sesión y almacenamiento),
    // pero lo que se testea NO lo es: el path es `AppRoutes.checkoutReturn`, el
    // redirect es la función de producción, y la decisión de persistir es
    // `RouteHierarchy.shouldPersistAsLastPath`. El redirect global espeja el de
    // `app_router.dart` (persistir → forzar login → restaurar LAST_PATH).
    late _Sess sess;
    late _Store store;

    GoRouter build({String? initialLocation}) => GoRouter(
          initialLocation: initialLocation ?? AppRoutes.start.path,
          redirect: (context, state) {
            final lastPath = store.lastPath; // se lee ANTES de sobrescribirlo

            if (RouteHierarchy.shouldPersistAsLastPath(
              state.matchedLocation,
              loginPath: AppRoutes.login.path,
            )) {
              store.lastPath = state.matchedLocation;
            }

            if (state.matchedLocation == AppRoutes.start.path &&
                sess.isLoggedIn &&
                lastPath != null &&
                lastPath != state.matchedLocation &&
                !RouteHierarchy.isEphemeral(lastPath)) {
              return lastPath;
            }
            return null;
          },
          routes: <RouteBase>[
            GoRoute(path: AppRoutes.start.path, builder: (_, __) => const _Probe('START')),
            GoRoute(path: AppRoutes.login.path, builder: (_, __) => const _Probe('LOGIN')),
            GoRoute(
              path: AppRoutes.joinGroupOrder.path,
              builder: (_, s) => _Probe('JOIN:${s.pathParameters['id']}'),
            ),
            GoRoute(
              path: AppRoutes.groupOrder.path,
              builder: (_, s) => _Probe('ORDER:${s.pathParameters['id']}'),
            ),
            // La ruta bajo prueba, igual que en app_router.dart.
            GoRoute(
              path: AppRoutes.checkoutReturn.path,
              redirect: (_, state) => GoRouterRedirector.checkoutReturnLandingPath(
                orderUuid: state.uri.queryParameters['order'],
                hasSession: sess.hasSessionOrPending,
              ),
            ),
          ],
          errorPageBuilder: (_, __) => const MaterialPage<void>(child: _Probe('NOT_FOUND')),
        );

    Future<GoRouter> pump(WidgetTester tester, {String? initialLocation}) async {
      final router = build(initialLocation: initialLocation);
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();
      return router;
    }

    String loc(GoRouter r) => r.routerDelegate.currentConfiguration.uri.toString();

    setUp(() {
      sess = _Sess()..isLoggedIn = true;
      store = _Store();
    });

    testWidgets('el camino feliz aterriza en la mesa', (tester) async {
      final router = await pump(tester);

      router.go('/checkout/return/success?order=$uuid');
      await tester.pumpAndSettle();

      expect(loc(router), '/group-order/$uuid');
      expect(find.text('ORDER:$uuid'), findsOneWidget);
    });

    testWidgets('y NO deja la vuelta del pago guardada para el próximo arranque',
        (tester) async {
      final router = await pump(tester);

      router.go('/checkout/return/success?order=$uuid');
      await tester.pumpAndSettle();

      expect(
        store.lastPath,
        isNot(contains('/checkout/return')),
        reason: 'con esto guardado, el arranque siguiente entra en bucle',
      );
    });

    testWidgets('sin ?order= aterriza en start, no en NotFound ni en bucle',
        (tester) async {
      // La forma que produce el bucle: Stripe o el navegador pierden la query,
      // o llega un link viejo de antes del cambio.
      final router = await pump(tester);

      router.go('/checkout/return/success');
      await tester.pumpAndSettle();

      expect(loc(router), AppRoutes.start.path);
      expect(find.text('NOT_FOUND'), findsNothing);
    });

    testWidgets('arrancar en frío sobre la vuelta del pago sin orden no se pega',
        (tester) async {
      // Cold start directo sobre el deep link: es la forma en que el LAST_PATH
      // envenenado reaparecía en cada booteo.
      final router = await pump(tester, initialLocation: '/checkout/return/success');

      expect(loc(router), AppRoutes.start.path);
      expect(find.text('NOT_FOUND'), findsNothing);
      expect(store.lastPath, isNot(contains('/checkout/return')));
    });

    testWidgets('un order manipulado no puede navegar a otra ruta', (tester) async {
      final router = await pump(tester);

      // `..%2Fjoin%2FABC123`: sin validar, `Uri.parse` normaliza los `..` y
      // esto aterrizaba en /join/ABC123 → auto-join a la mesa del atacante.
      router.go('/checkout/return/success?order=..%2Fjoin%2FABC123');
      await tester.pumpAndSettle();

      expect(loc(router), AppRoutes.start.path);
      expect(find.textContaining('JOIN:'), findsNothing);
    });
  });
}

/// Stub de las dos banderas de AuthSessionService que leen los redirects.
class _Sess {
  bool isLoggedIn = false;
  bool hasPendingSessionRestore = false;
  bool get hasSessionOrPending => isLoggedIn || hasPendingSessionRestore;
}

/// Stub de LocalStorageService, solo LAST_PATH.
class _Store {
  String? lastPath;
}

class _Probe extends StatelessWidget {
  const _Probe(this.label);
  final String label;

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Text(label, textDirection: TextDirection.ltr));
}
