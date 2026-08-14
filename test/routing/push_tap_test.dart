import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/routing/redirectors.dart';

/// Tocar un push tiene que llevar a algún lado.
///
/// e2e 2026-08-14: llegó el push de "nueva orden" al negocio, se vio bien, y al
/// tocarlo no pasó nada. El handler solo enrutaba
/// `subType.startsWith('reservation_' | 'message_' | 'quote_')`; los avisos de
/// group order caían a un log de debug. Y de esas tres ramas, dos no
/// correspondían a NINGÚN subType que el backend mande.
///
/// La decisión es pura para que esto se pueda comprobar sin abrir la app —
/// que era, literalmente, la única forma de verlo antes.
void main() {
  const orden = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';
  const negocio = '11111111-2222-3333-4444-555555555555';

  group('avisos al NEGOCIO (panel de órdenes en vivo)', () {
    test('abre el panel del negocio con la orden concreta', () {
      final destino = GoRouterRedirector.pushTapPath(data: {
        'type': 'manager_group_order',
        'kind': 'new_order',
        'uuid': orden,
        'business_uuid': negocio,
      });

      expect(destino, '${AppRoutes.liveOrders.path.replaceFirst(':id', negocio)}?order=$orden');
    });

    test('sin business_uuid en el push, cae al negocio de la sesión', () {
      // FCM manda '' donde el backend puso null: por eso se comprueba vacío.
      final destino = GoRouterRedirector.pushTapPath(
        data: {'type': 'manager_group_order', 'uuid': orden, 'business_uuid': ''},
        ownerBusinessUuid: negocio,
      );

      expect(destino, contains('?order=$orden'));
      expect(destino, contains(negocio));
    });

    test('sin negocio por ningún lado no navega', () {
      expect(
        GoRouterRedirector.pushTapPath(data: {'type': 'manager_group_order', 'uuid': orden}),
        isNull,
      );
    });

    test('con el uuid de orden ilegible abre el panel igual, sin ?order', () {
      // Perder la orden concreta no puede costarle al manager la pantalla
      // entera: el panel lista todo lo vivo.
      final destino = GoRouterRedirector.pushTapPath(data: {
        'type': 'manager_group_order',
        'uuid': 'no-es-un-uuid',
        'business_uuid': negocio,
      });

      expect(destino, AppRoutes.liveOrders.path.replaceFirst(':id', negocio));
      expect(destino, isNot(contains('order=')));
    });

    test('un uuid con separadores no puede reescribir la ruta', () {
      // Mismo filtro que en la vuelta del Checkout, donde esto sí nos mordió.
      final destino = GoRouterRedirector.pushTapPath(data: {
        'type': 'manager_group_order',
        'uuid': '../join/ABC123',
        'business_uuid': negocio,
      });

      expect(destino, isNot(contains('join')));
    });
  });

  group('avisos al COMENSAL (su mesa)', () {
    test('el aviso de pago abre la orden', () {
      expect(
        GoRouterRedirector.pushTapPath(data: {'type': 'group_order', 'uuid': orden}),
        AppRoutes.groupOrder.path.replaceFirst(':id', orden),
      );
    });

    test('el aviso de cocina (lista/entregada) abre la orden', () {
      expect(
        GoRouterRedirector.pushTapPath(data: {
          'type': 'group_order_fulfillment',
          'uuid': orden,
          'fulfillment_status': 'ready',
        }),
        AppRoutes.groupOrder.path.replaceFirst(':id', orden),
      );
    });

    test('sin uuid válido no navega', () {
      expect(
        GoRouterRedirector.pushTapPath(data: {'type': 'group_order', 'uuid': ''}),
        isNull,
      );
    });
  });

  group('reservas y servicios', () {
    // Estos subTypes son los que manda el backend de verdad
    // (App\Models\Notification). Los cuatro primeros son los que la condición
    // vieja SÍ acertaba; el resto son los que se perdían.
    for (final subType in [
      'reservation_confirmed',
      'reservation_rejected',
      'reservation_cancelled',
      'reservation_cancelled_by_business',
      'new_reservation_request',
      'service_booking_requested',
      'service_quote_received',
      'service_quote_approved',
      'service_quote_rejected',
      'service_message_new',
    ]) {
      test('$subType lleva a mis reservas', () {
        expect(
          GoRouterRedirector.pushTapPath(data: {'subType': subType}),
          AppRoutes.myReservations.path,
        );
      });
    }

    test('un subType social no navega a reservas', () {
      expect(GoRouterRedirector.pushTapPath(data: {'subType': 'new_follower'}), isNull);
    });
  });

  group('payload roto', () {
    test('vacío no navega', () {
      expect(GoRouterRedirector.pushTapPath(data: const {}), isNull);
    });

    test('type desconocido no navega', () {
      expect(
        GoRouterRedirector.pushTapPath(data: {'type': 'algo_nuevo', 'uuid': orden}),
        isNull,
      );
    });

    test('la audiencia cruda ya no es un type de enrutado', () {
      // Este era el síntoma: el backend pisaba el type con 'business' y el FE
      // se quedaba sin saber qué hacer. Arreglado el backend, 'business' no
      // debe enrutar a ningún lado — si vuelve a aparecer, es que volvió el bug.
      expect(
        GoRouterRedirector.pushTapPath(data: {
          'type': 'business',
          'kind': 'new_order',
          'uuid': orden,
          'business_uuid': negocio,
        }),
        isNull,
      );
    });
  });
}
