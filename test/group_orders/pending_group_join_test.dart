import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/pending_group_join.dart';

/// Regresión del bug e2e r4 (App Links /join/{code}):
/// user2 sin sesión escaneaba el QR, la app abría el login, pero tras
/// loguearse aterrizaba en home y NUNCA en la orden — el canje (postFrame en
/// setSession) perdía la carrera contra la navegación final del bootstrap
/// del login. El fix mueve captura y desvío al redirect global de GoRouter;
/// estas son sus funciones puras.
void main() {
  setUp(() => PendingGroupJoin.code = null);
  tearDown(() => PendingGroupJoin.code = null);

  group('captureFromUri', () {
    test('estaciona el código de /join/{code} sin sesión, en MAYÚSCULAS', () {
      PendingGroupJoin.captureFromUri(Uri.parse('/join/abc123'), isLoggedIn: false);
      expect(PendingGroupJoin.code, 'ABC123');
    });

    test('con sesión NO estaciona (la ruta /join opera directo; evita loops)', () {
      PendingGroupJoin.captureFromUri(Uri.parse('/join/ABC123'), isLoggedIn: true);
      expect(PendingGroupJoin.code, isNull);
    });

    test('ignora paths que no son /join/', () {
      for (final path in ['/', '/home', '/login', '/joinx/ABC123', '/visit-menu/uuid']) {
        PendingGroupJoin.captureFromUri(Uri.parse(path), isLoggedIn: false);
        expect(PendingGroupJoin.code, isNull, reason: 'no debía capturar en $path');
      }
    });

    test('ignora códigos de largo inválido (basura en el deep link)', () {
      for (final bad in ['/join/ABC12', '/join/ABC1234', '/join/']) {
        PendingGroupJoin.captureFromUri(Uri.parse(bad), isLoggedIn: false);
        expect(PendingGroupJoin.code, isNull, reason: 'no debía capturar $bad');
      }
    });

    test('URL completa de App Link (host incluido) también captura', () {
      PendingGroupJoin.captureFromUri(
        Uri.parse('https://foodly.solutions/join/xy99zz'),
        isLoggedIn: false,
      );
      expect(PendingGroupJoin.code, 'XY99ZZ');
    });
  });

  group('divertPath', () {
    test('sin código estacionado nunca desvía', () {
      expect(PendingGroupJoin.divertPath(Uri.parse('/home'), isLoggedIn: true), isNull);
    });

    test('sin sesión NO desvía y el código queda intacto esperando el login', () {
      PendingGroupJoin.code = 'ABC123';
      expect(PendingGroupJoin.divertPath(Uri.parse('/login'), isLoggedIn: false), isNull);
      expect(PendingGroupJoin.code, 'ABC123');
    });

    test('código + sesión ⇒ desvía CUALQUIER navegación a /join/{code} y consume', () {
      PendingGroupJoin.code = 'ABC123';
      expect(PendingGroupJoin.divertPath(Uri.parse('/home'), isLoggedIn: true), '/join/ABC123');
      // Single-shot: consumido — la próxima navegación ya no desvía.
      expect(PendingGroupJoin.code, isNull);
      expect(PendingGroupJoin.divertPath(Uri.parse('/home'), isLoggedIn: true), isNull);
    });

    test('navegando ya hacia /join no desvía (evita loop redirect↔ruta)', () {
      PendingGroupJoin.code = 'ABC123';
      expect(PendingGroupJoin.divertPath(Uri.parse('/join/ABC123'), isLoggedIn: true), isNull);
      expect(PendingGroupJoin.code, 'ABC123');
    });
  });

  group('secuencia completa (simula el redirect en cada navegación)', () {
    /// Emula UNA pasada del redirect global de GoRouter tal como quedó
    /// cableado en app_router.dart: primero captura, después desvío.
    String? redirectPass(String location, {required bool isLoggedIn}) {
      final uri = Uri.parse(location);
      PendingGroupJoin.captureFromUri(uri, isLoggedIn: isLoggedIn);
      return PendingGroupJoin.divertPath(uri, isLoggedIn: isLoggedIn);
    }

    test('BUG e2e r4: cold-start sin sesión → login → bootstrap navega a home '
        '→ el router DESVÍA a /join (antes se quedaba en home)', () {
      // 1. App Link abre la app en /join/ABC123 sin sesión → captura, sin desvío.
      expect(redirectPass('/join/abc123', isLoggedIn: false), isNull);
      expect(PendingGroupJoin.code, 'ABC123');

      // 2. El redirector de auth manda a /login (código sigue estacionado).
      expect(redirectPass('/login', isLoggedIn: false), isNull);
      expect(PendingGroupJoin.code, 'ABC123');

      // 3. Login OK; el bootstrap navega a home — ESTA navegación (la última,
      //    la que antes ganaba la carrera y dejaba al usuario en home) ahora
      //    se desvía a la página de join.
      expect(redirectPass('/home', isLoggedIn: true), '/join/ABC123');

      // 4. La navegación desviada a /join NO re-captura (hay sesión) ni
      //    re-desvía: la página hace el join y navega al menú en paz.
      expect(redirectPass('/join/ABC123', isLoggedIn: true), isNull);
      expect(PendingGroupJoin.code, isNull);

      // 5. Navegación final al menú del negocio: limpio, sin desvíos.
      expect(redirectPass('/visit-menu/biz-uuid', isLoggedIn: true), isNull);
    });

    test('warm-start con sesión: /join directo, sin estacionar ni desviar', () {
      expect(redirectPass('/join/ABC123', isLoggedIn: true), isNull);
      expect(PendingGroupJoin.code, isNull);
      // La página opera directa; la navegación posterior al menú no se toca.
      expect(redirectPass('/visit-menu/biz-uuid', isLoggedIn: true), isNull);
    });

    test('bootstrap con DOBLE navegación post-login: la primera desvía, la '
        'segunda ya no arrastra al usuario a un join fantasma', () {
      redirectPass('/join/abc123', isLoggedIn: false);
      expect(redirectPass('/home', isLoggedIn: true), '/join/ABC123');
      // Una segunda navegación tardía del bootstrap no encuentra código.
      expect(redirectPass('/dashboard', isLoggedIn: true), isNull);
    });

    test('el usuario abandona el login (nunca se loguea): el código muere en '
        'memoria sin efectos colaterales', () {
      redirectPass('/join/abc123', isLoggedIn: false);
      expect(redirectPass('/login', isLoggedIn: false), isNull);
      expect(redirectPass('/', isLoggedIn: false), isNull);
      expect(PendingGroupJoin.code, 'ABC123'); // inofensivo: efímero en RAM
    });
  });
}
