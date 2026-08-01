import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/routing/route_hierarchy.dart';

/// Regresión del bug e2e r4 "back atascado orden↔menú": el historial trataba
/// a /group-order como hermana de /visit-menu → ping-pong infinito. La
/// jerarquía real: home → visit-business → visit-menu → group-order.
void main() {
  group('isEphemeral', () {
    test('orden grupal y join son flujos efímeros', () {
      expect(RouteHierarchy.isEphemeral('/group-order/abc'), isTrue);
      expect(RouteHierarchy.isEphemeral('/join/ABC123'), isTrue);
    });

    test('rutas de destino NO son efímeras', () {
      for (final p in ['/', '/login', '/visit-menu/m1', '/main/u1/visit-business', '/manage-menu/b1']) {
        expect(RouteHierarchy.isEphemeral(p), isFalse, reason: p);
      }
    });
  });

  group('shouldPersistAsLastPath (restauración post-boot)', () {
    test('nunca se restaura hacia una orden o un join (e2e r4: cold-start '
        'dentro de una orden vieja = usuario atascado)', () {
      expect(RouteHierarchy.shouldPersistAsLastPath('/group-order/abc'), isFalse);
      expect(RouteHierarchy.shouldPersistAsLastPath('/join/ABC123'), isFalse);
    });

    test('tampoco start ni login', () {
      expect(RouteHierarchy.shouldPersistAsLastPath('/'), isFalse);
      expect(RouteHierarchy.shouldPersistAsLastPath('/login'), isFalse);
    });

    test('las rutas de contenido sí se persisten', () {
      for (final p in ['/visit-menu/m1', '/main/u1/visit-business', '/main/u1/foodly-main-page']) {
        expect(RouteHierarchy.shouldPersistAsLastPath(p), isTrue, reason: p);
      }
    });

    test('REGRESIÓN e2e r5: storage viciado por builds viejos — un LAST_PATH '
        'efímero ya guardado debe ser descartado también al LEER (el guard '
        'de restauración usa isEphemeral)', () {
      // Builds previos persistieron '/join/...' y '/group-order/...'; el
      // redirect de restauración debe ignorarlos o el usuario arranca
      // atascado en el error de join / una orden muerta.
      for (final stale in ['/join/ABC123', '/group-order/o1']) {
        expect(RouteHierarchy.isEphemeral(stale), isTrue, reason: stale);
      }
    });
  });

  group('deriveParentRoute', () {
    test('hijos anidados de my-business / visit-business', () {
      expect(
        RouteHierarchy.deriveParentRoute('/main/u1/my-business/analytics'),
        '/main/u1/my-business',
      );
      expect(
        RouteHierarchy.deriveParentRoute('/main/u1/visit-business/visit-promotions'),
        '/main/u1/visit-business',
      );
    });

    test('manage-menu → my-business del usuario', () {
      expect(
        RouteHierarchy.deriveParentRoute('/manage-menu/b1', userUuid: 'u1'),
        '/main/u1/my-business',
      );
      // Sin uuid de usuario no se puede derivar.
      expect(RouteHierarchy.deriveParentRoute('/manage-menu/b1'), isNull);
    });

    test('visit-menu y group-order se resuelven async (null acá)', () {
      expect(RouteHierarchy.deriveParentRoute('/visit-menu/m1'), isNull);
      expect(RouteHierarchy.deriveParentRoute('/group-order/o1'), isNull);
    });

    test('rutas sin padre específico → null (main page)', () {
      for (final p in ['/main/u1/my-business', '/main/u1/visit-business', '/privacy', '/']) {
        expect(RouteHierarchy.deriveParentRoute(p), isNull, reason: p);
      }
    });
  });

  group('isNavigationChildOf (guard anti ping-pong del back)', () {
    test('BUG e2e r4: la orden grupal ES hija del menú — el back del menú '
        'jamás debe "volver" a la orden', () {
      expect(
        RouteHierarchy.isNavigationChildOf('/group-order/o1', '/visit-menu/m1'),
        isTrue,
      );
    });

    test('el menú es hijo del perfil del negocio', () {
      expect(
        RouteHierarchy.isNavigationChildOf('/visit-menu/m1', '/main/u1/visit-business'),
        isTrue,
      );
    });

    test('hijos sincrónicos: analytics es hija de my-business', () {
      expect(
        RouteHierarchy.isNavigationChildOf('/main/u1/my-business/analytics', '/main/u1/my-business'),
        isTrue,
      );
      expect(
        RouteHierarchy.isNavigationChildOf('/main/u1/my-business/analytics', '/main/OTRO/my-business'),
        isFalse,
      );
    });

    test('las relaciones NO son simétricas ni inventadas', () {
      // El menú NO es hijo de la orden (es su padre).
      expect(RouteHierarchy.isNavigationChildOf('/visit-menu/m1', '/group-order/o1'), isFalse);
      // La orden no es hija del perfil del negocio (hay un menú en medio).
      expect(
        RouteHierarchy.isNavigationChildOf('/group-order/o1', '/main/u1/visit-business'),
        isFalse,
      );
      // Rutas sin relación.
      expect(RouteHierarchy.isNavigationChildOf('/privacy', '/visit-menu/m1'), isFalse);
    });
  });

  group('secuencia del bug (historial simulado del back)', () {
    test('menú→orden→back(menú)→back: el candidato del historial es la orden '
        '(efímera) → se salta; el guard además la reconoce como hija', () {
      final history = [
        '/main/u1/visit-business',
        '/visit-menu/m1',
        '/group-order/o1',
        '/visit-menu/m1',
      ];
      const current = '/visit-menu/m1';

      // Emula la búsqueda de goBackToLastRoute: desde el final, salta
      // efímeras y la ubicación actual.
      var idx = history.length - 2;
      while (idx >= 0 && (RouteHierarchy.isEphemeral(history[idx]) || history[idx] == current)) {
        idx--;
      }

      // El destino correcto del back es el PERFIL del negocio — no la orden.
      expect(history[idx], '/main/u1/visit-business');

      // Y aunque el salto no existiera, el guard anti ping-pong bloquea a la
      // orden como destino de back desde el menú.
      expect(RouteHierarchy.isNavigationChildOf('/group-order/o1', current), isTrue);
    });
  });
}
