import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/routing/route_hierarchy.dart';

/// El "atrás" recorrido ENTERO, no predicado a predicado.
///
/// `RouteHierarchy` tenía sus funciones cubiertas una por una, pero el recorrido
/// del historial vivía dentro de `AppRouter` —con DI, GoRouter y storage
/// alrededor— y no tenía un solo test. Por eso el loop del e2e 2026-08-15
/// (orden vencida → "Volver al menú" → dos backs → otra vez la orden) pasó por
/// una suite en verde: cada pieza estaba bien y la secuencia no.
///
/// Acá se simula lo que hace la app de verdad: `push`/`go` apilan en el
/// historial (`AppRouter.updateCurrentRoute`) y cada back consulta
/// `backTargetIndex` y trunca. Los recorridos se leen como los cuenta un
/// tester.
class _Sesion {
  _Sesion(String inicial)
      : historial = [inicial],
        actual = inicial;

  final List<String> historial;
  String actual;

  /// Navegar — da igual `push` o `go`: los dos apilan una entrada.
  void ir(String ruta) {
    actual = ruta;
    historial.add(ruta);
  }

  /// Una pulsación de "atrás". Devuelve dónde aterrizó.
  ///
  /// Replica `AppRouter.goBackToLastRoute` ENTERO, incluido el fallback con los
  /// padres async que resuelve desde storage — modelarlo de menos era el
  /// defecto de la primera versión de este archivo, y es justo la rama por la
  /// que pasa un arranque en frío.
  ///
  /// El truncado lo decide `backStep`, no este harness: si lo simulara, una
  /// regresión en producción no rompería ningún test.
  String atras({String userUuid = 'u1'}) {
    // La MISMA función que usa `AppRouter`, truncado incluido. Simular la
    // regla acá en vez de llamarla dejaba el test ciego a una regresión en
    // producción — pasó con la primera versión de este archivo.
    final paso = RouteHierarchy.backStep(historial, actual, userUuid: userUuid);
    final destino = paso.destino == null ? null : historial[paso.destino!];
    historial.removeRange(paso.truncarDesde, historial.length);

    if (destino != null) {
      actual = destino;
    } else {
      String? padre;
      if (actual.startsWith('/visit-menu/')) padre = _negocio; // LAST_VISITED_BUSINESS_UUID
      if (padre == null && actual.startsWith('/group-order/')) {
        padre = _menu; // LAST_VISITED_MENU_UUID
      }
      padre ??= RouteHierarchy.deriveParentRoute(actual, userUuid: userUuid);
      actual = padre ?? _home;
    }
    historial.add(actual);

    return actual;
  }

  /// Aprieta "atrás" [veces] y devuelve cada aterrizaje.
  List<String> atrasVarias(int veces) => List.generate(veces, (_) => atras());
}

const _home = '/main/u1/foodly-main-page';
const _negocio = '/main/b1/visit-business';
const _menu = '/visit-menu/m1';
const _orden = '/group-order/o1';

void main() {
  group('salir de una orden vencida', () {
    /// EL RECORRIDO DEL E2E. La orden vencida ofrece "Volver al menú", que
    /// navega con `go` al menú. A partir de ahí, ningún back puede devolver a
    /// la orden: está terminada y no hay nada que hacer en ella.
    test('entrando desde el menú, ningún back vuelve a la orden', () {
      final s = _Sesion(_home)
        ..ir(_negocio)
        ..ir(_menu)
        ..ir(_orden)
        ..ir(_menu); // "Volver al menú"

      expect(s.atrasVarias(4), isNot(contains(_orden)));
    });

    /// La orden también se abre desde el chip flotante, que está en la home y
    /// en el menú. Ese camino NO pasa por el menú, así que el historial es
    /// distinto — y es el que no supe reconstruir cuando apareció el bug.
    test('entrando desde el chip flotante en la home', () {
      final s = _Sesion(_home)
        ..ir(_orden)
        ..ir(_menu);

      expect(s.atrasVarias(4), isNot(contains(_orden)));
    });

    test('entrando desde el chip estando ya en el menú', () {
      final s = _Sesion(_home)
        ..ir(_negocio)
        ..ir(_menu)
        ..ir(_orden)
        ..ir(_menu);

      expect(s.atrasVarias(4), isNot(contains(_orden)));
    });

    /// Arranque en frío por deep link o notificación: la orden es lo PRIMERO
    /// que se ve, sin nada debajo.
    test('llegando por deep link, sin historial debajo', () {
      final s = _Sesion(_orden)..ir(_menu);

      expect(s.atrasVarias(4), isNot(contains(_orden)));
    });

    /// Por invitación: `/join/CODE` → orden. El join también es efímero.
    test('llegando por un link de invitación', () {
      final s = _Sesion(_home)
        ..ir('/join/ABC123')
        ..ir(_orden)
        ..ir(_menu);

      final visitados = s.atrasVarias(4);
      expect(visitados, isNot(contains(_orden)));
      expect(visitados, isNot(contains('/join/ABC123')));
    });

    /// Y la vuelta del Checkout hosteado, que aterriza en la orden.
    test('volviendo del checkout hosteado', () {
      final s = _Sesion(_home)
        ..ir(_negocio)
        ..ir(_menu)
        ..ir(_orden)
        ..ir('/checkout/return/success')
        ..ir(_orden)
        ..ir(_menu);

      expect(s.atrasVarias(4), isNot(contains(_orden)));
    });

    /// Dos órdenes seguidas en la misma sesión: pide, vence, vuelve al menú,
    /// pide otra vez. El historial acumula DOS órdenes.
    test('dos órdenes seguidas en la misma sesión', () {
      final s = _Sesion(_home)
        ..ir(_negocio)
        ..ir(_menu)
        ..ir(_orden)
        ..ir(_menu)
        ..ir('/group-order/o2')
        ..ir(_menu);

      final visitados = s.atrasVarias(5);
      expect(visitados, isNot(contains(_orden)));
      expect(visitados, isNot(contains('/group-order/o2')));
    });
  });

  group('arranque en frío DENTRO de la orden (e2e 2026-08-15)', () {
    /// Cómo entró de verdad: cerró la app estando en la orden y la reabrió.
    /// El historial arranca casi vacío, así que el primer back cae al fallback
    /// —que NO trunca— y deja la orden debajo para siempre.
    test('abriendo la app en la orden y saliendo por "Volver al menú"', () {
      final s = _Sesion(_orden)..ir(_menu);

      final visitados = s.atrasVarias(6);
      expect(visitados, isNot(contains(_orden)), reason: 'historial: ${s.historial}');
    });

    test('igual, pero con "/" debajo como deja el arranque', () {
      final s = _Sesion('/')
        ..ir(_orden)
        ..ir(_menu);

      final visitados = s.atrasVarias(6);
      expect(visitados, isNot(contains(_orden)), reason: 'historial: ${s.historial}');
    });

    /// BÚSQUEDA EXHAUSTIVA. En vez de adivinar el recorrido exacto del tester,
    /// se generan todos los de hasta 5 pasos sobre las pantallas que
    /// intervienen y se aprieta atrás hasta el fondo. Cualquiera que aterrice
    /// en la orden sale con su secuencia impresa.
    test('ningún recorrido de hasta 5 pasos termina de vuelta en la orden', () {
      const pantallas = [_home, _negocio, _menu, _orden, '/join/X', '/checkout/return/success'];
      final culpables = <String>[];

      void explorar(List<String> pasos) {
        if (pasos.isNotEmpty) {
          for (final arranque in [_home, _orden, '/']) {
            final s = _Sesion(arranque);
            for (final p in pasos) {
              s.ir(p);
            }
            final visitados = s.atrasVarias(8);
            if (visitados.any(RouteHierarchy.isEphemeral)) {
              culpables.add('desde $arranque → $pasos ⇒ $visitados');
            }
          }
        }
        if (pasos.length == 5) return;
        for (final p in pantallas) {
          explorar([...pasos, p]);
        }
      }

      explorar([]);

      expect(culpables, isEmpty, reason: culpables.take(5).join('\n'));
    });
  });

  group('el back sigue funcionando para lo que no es efímero', () {
    test('del menú se sube al negocio, y del negocio a la home', () {
      final s = _Sesion(_home)
        ..ir(_negocio)
        ..ir(_menu);

      expect(s.atras(), _negocio);
      expect(s.atras(), _home);
    });

    /// Anti ping-pong: si vengo de un HIJO, el back sigue hacia arriba.
    test('no rebota entre negocio y menú', () {
      final s = _Sesion(_home)
        ..ir(_negocio)
        ..ir(_menu);

      expect(s.atras(), _negocio);
      expect(s.atras(), isNot(_menu), reason: 'volver al menú sería el ping-pong del e2e r4');
    });
  });

  group('el historial nunca se queda sin salida', () {
    /// PROPIEDAD, no ejemplo: da igual el recorrido, apretar atrás muchas veces
    /// tiene que terminar fuera de los flujos efímeros y sin dar vueltas.
    test('desde cualquier recorrido se sale y se converge', () {
      final recorridos = <List<String>>[
        [_negocio, _menu, _orden, _menu],
        [_orden, _menu],
        [_menu, _orden, _menu, _orden, _menu],
        ['/join/X', _orden, _menu],
        [_negocio, _menu, _orden, '/checkout/return/cancel', _orden, _menu],
        [_menu, _orden],
        [_orden],
      ];

      for (final recorrido in recorridos) {
        final s = _Sesion(_home);
        for (final r in recorrido) {
          s.ir(r);
        }

        final visitados = s.atrasVarias(8);

        expect(
          visitados.where(RouteHierarchy.isEphemeral),
          isEmpty,
          reason: 'recorrido $recorrido aterrizó en un flujo efímero',
        );
        // Converge: las últimas pulsaciones ya no mueven. Un back que oscila
        // entre dos pantallas es un usuario que no puede salir.
        expect(
          visitados.last,
          visitados[visitados.length - 2],
          reason: 'recorrido $recorrido oscila en vez de converger: $visitados',
        );
      }
    });
  });

  group('entrando por el QR de la mesa', () {
    /// EL BUG (reportado en device). El comensal escanea el QR de SU mesa
    /// —que lleva `?t=`—, hace la orden, y al terminar `_exitOrder` lo
    /// devuelve al menú SIN la query. El historial guarda la URI completa, así
    /// que `/visit-menu/m1?t=Mesa%205` y `/visit-menu/m1` se comparaban como
    /// destinos DISTINTOS: el back "volvía" al mismo menú re-montando la mesa
    /// del QR en vez de subir al negocio.
    const qr = '$_menu?t=Mesa%205';

    test('atrás sube al negocio, no vuelve al menú con la mesa puesta', () {
      final s = _Sesion(qr)
        ..ir(_orden)
        ..ir(_menu); // _exitOrder al terminar la orden

      expect(s.atras(), _negocio);
    });

    test('dos backs seguidos no se quedan dando vueltas en el menú', () {
      final s = _Sesion(qr)
        ..ir(_orden)
        ..ir(_menu);

      // Ni uno solo de los aterrizajes puede ser el menú otra vez.
      expect(s.atrasVarias(2), isNot(contains(_menu)));
    });

    test('ningún back vuelve a la orden ya cerrada', () {
      final s = _Sesion(qr)
        ..ir(_orden)
        ..ir(_menu);

      expect(s.atrasVarias(3), isNot(contains(_orden)));
    });

    test('llegando por el QR sin pasar por el negocio, se termina en casa', () {
      // Cold start por deep link: no hay negocio en el historial, pero el
      // fallback resuelve el padre desde LAST_VISITED_BUSINESS_UUID.
      final s = _Sesion(qr)..ir(_orden)..ir(_menu);

      expect(s.atrasVarias(3).last, anyOf(_home, _negocio));
    });
  });
}
