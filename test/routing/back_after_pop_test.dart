import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/routing/route_hierarchy.dart';
import 'package:go_router/go_router.dart';

/// El back del menú, después de volver de la orden con un `pop`.
///
/// EL BUG (device, 2026-08-28). Del menú a la orden y atrás; el back del menú
/// necesitaba DOS toques para subir al perfil del negocio:
///
///     going to /visit-menu/8cf979a6…             <- primer toque: nada
///     going to /main/8b2f0a4c…/visit-business    <- segundo: el que se ve
///
/// La causa no estaba en `RouteHierarchy` —que decide bien— sino en QUÉ
/// ubicación se le pasaba. `AppRouter.currentLocation` devolvía la última
/// ubicación que había pasado por el redirect global, y **el redirect no corre
/// en un `pop`**: al volver de la orden seguía siendo `/group-order/...`. El
/// back calculaba el destino "desde la orden" y elegía el menú, o sea la
/// pantalla en la que ya estabas. Ese `go` sí pasaba por el redirect, refrescaba
/// el valor, y por eso el segundo toque acertaba.
///
/// Estos tests fijan los dos hechos de los que depende el arreglo: que un `pop`
/// no dispara el redirect (así que recordar la ubicación es recordarla mal), y
/// que la ubicación viva del router sí lleva al destino correcto de un tirón.
void main() {
  const home = '/main/u1/foodly-main-page';
  const negocio = '/main/b1/visit-business';
  const menu = '/visit-menu/m1';
  const orden = '/group-order/o1';

  /// Reproduce el recorrido real: al negocio y al menú con `go` (así navega
  /// `visit_business_footer_buttons`), a la orden con `push` (así lo hacen los
  /// tres puntos de entrada), y de vuelta con `pop` (así sale `_leaveScreen`).
  Future<({GoRouter router, List<String> historial, String ultimaDelRedirect})> recorrido(
    WidgetTester tester,
  ) async {
    final historial = <String>[];
    var ultima = '';

    final router = GoRouter(
      initialLocation: home,
      redirect: (context, state) {
        // Espejo de `AppRouter.updateCurrentRoute`.
        ultima = state.uri.toString();
        historial.add(ultima);

        return null;
      },
      routes: [
        GoRoute(path: '/main/:id/foodly-main-page', builder: (_, __) => const Text('HOME')),
        GoRoute(path: '/main/:id/visit-business', builder: (_, __) => const Text('BIZ')),
        GoRoute(path: '/visit-menu/:id', builder: (_, __) => const Text('MENU')),
        GoRoute(path: '/group-order/:id', builder: (_, __) => const Text('ORDER')),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();
    router.go(negocio);
    await tester.pumpAndSettle();
    router.go(menu);
    await tester.pumpAndSettle();
    router.push(orden);
    await tester.pumpAndSettle();
    router.pop();
    await tester.pumpAndSettle();

    return (router: router, historial: historial, ultimaDelRedirect: ultima);
  }

  testWidgets('un pop no pasa por el redirect: la ubicación recordada queda rancia', (tester) async {
    final r = await recorrido(tester);

    expect(r.ultimaDelRedirect, orden,
        reason: 'si esto cambia, el redirect empezó a correr en los pop y el bug ya no puede pasar');
    expect(r.router.routerDelegate.currentConfiguration.uri.toString(), menu,
        reason: 'la pantalla que se está viendo es el menú');
  });

  testWidgets('con la ubicación viva, el back sube al negocio de un tirón', (tester) async {
    final r = await recorrido(tester);
    final viva = r.router.routerDelegate.currentConfiguration.uri.toString();

    final paso = RouteHierarchy.backStep(r.historial, viva, userUuid: 'u1');

    expect(paso.destino, isNotNull);
    expect(r.historial[paso.destino!], negocio);
  });

  /// La otra mitad: con la recordada, el back elegía el menú — donde ya estabas.
  /// Es el toque que no hacía nada.
  testWidgets('con la ubicación recordada, el back se queda donde ya estás', (tester) async {
    final r = await recorrido(tester);

    final paso = RouteHierarchy.backStep(r.historial, r.ultimaDelRedirect, userUuid: 'u1');

    expect(paso.destino, isNotNull);
    expect(r.historial[paso.destino!], menu, reason: 'este era el primer toque desperdiciado');
  });
}
