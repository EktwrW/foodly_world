import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_client.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:logger/logger.dart';

/// UNA lectura por evento, no una por oyente.
///
/// EL PROBLEMA (auditoría de escalabilidad, 2026-09-05). Dos cubits del MISMO
/// cliente observan el MISMO canal `private-group-order.{uuid}`:
///
///   group_order_cubit.dart:51        -> _refetchSilently(uuid)
///   active_group_order_cubit.dart:354 -> refresh()   (el chip flotante)
///
/// y los dos terminan en `_repo.getGroupOrder(uuid)`: **la misma petición, dos
/// veces, por evento**. En una mesa de 8 con la página y el chip vivos, una
/// sola mutación —alguien agrega un plato— dispara 8 eventos que se convierten
/// en 16 lecturas de la orden completa. Cada una son ~20 consultas a Neon a
/// 35 ms de ida y vuelta.
///
/// Y el backend emite UN evento por petición (comprobado: los 34 sitios que
/// llaman a `GroupOrderTouched::safe` lo hacen una vez; `maybeAutoDeliver` no
/// emite el suyo). O sea que el ×2 no viene del servidor: es del cliente.
void main() {
  group('coalescer: dos oyentes del mismo evento, una sola petición', () {
    late _ClienteFalso cliente;
    late GroupOrderRepo repo;

    setUp(() {
      cliente = _ClienteFalso();
      repo = GroupOrderRepo(client: cliente);
    });

    test('la página y el chip piden a la vez y sale UNA petición', () async {
      // Las dos lecturas nacen del mismo evento, así que arrancan juntas.
      final pagina = repo.getGroupOrder('o1', coalesce: true);
      final chip = repo.getGroupOrder('o1', coalesce: true);

      cliente.responder('o1');
      await Future.wait([pagina, chip]);

      expect(cliente.peticiones, 1, reason: 'una por evento, no una por oyente');
    });

    test('y las dos reciben la MISMA orden, no una a medias', () async {
      final pagina = repo.getGroupOrder('o1', coalesce: true);
      final chip = repo.getGroupOrder('o1', coalesce: true);

      cliente.responder('o1');
      final resultados = await Future.wait([pagina, chip]);

      for (final r in resultados) {
        expect(r.when(success: (d) => d.groupOrder.uuid, failure: (_) => null), 'o1');
      }
    });

    test('ordenes distintas no se pisan', () async {
      final a = repo.getGroupOrder('o1', coalesce: true);
      final b = repo.getGroupOrder('o2', coalesce: true);

      cliente.responder('o1');
      cliente.responder('o2');
      await Future.wait([a, b]);

      expect(cliente.peticiones, 2);
    });

    test('terminada la petición, la siguiente vuelve a pedir de verdad', () async {
      final primera = repo.getGroupOrder('o1', coalesce: true);
      cliente.responder('o1');
      await primera;

      final segunda = repo.getGroupOrder('o1', coalesce: true);
      cliente.responder('o1');
      await segunda;

      expect(cliente.peticiones, 2, reason: 'no es una caché, es un coalescer');
    });

    /// El fallo silencioso que hace peligroso un coalescer mal hecho.
    test('una lectura TRAS UNA MUTACION nunca reusa la petición en vuelo', () async {
      // Hay un refetch de evento en vuelo, salido ANTES de la mutación.
      final porEvento = repo.getGroupOrder('o1', coalesce: true);

      // Y ahora el comensal cancela su pago y re-lee: si esta lectura se
      // colgara de la de arriba, recibiría el estado ANTERIOR a su propia
      // cancelación y la pantalla se quedaría diciendo "confirmando".
      final trasMutar = repo.getGroupOrder('o1');

      cliente.responder('o1');
      cliente.responder('o1');
      await Future.wait([porEvento, trasMutar]);

      expect(cliente.peticiones, 2);
    });

    test('si la petición en vuelo falla, la siguiente vuelve a pedir', () async {
      final primera = repo.getGroupOrder('o1', coalesce: true);
      cliente.fallar();
      final r = await primera;
      expect(
        r.when(success: (_) => false, failure: (_) => true),
        isTrue,
        reason: 'el fallo se propaga, no se traga',
      );

      final segunda = repo.getGroupOrder('o1', coalesce: true);
      cliente.responder('o1');
      await segunda;

      expect(cliente.peticiones, 2, reason: 'un fallo no puede dejar el uuid envenenado');
    });
  });

  /// El coalescer no sirve de nada si nadie lo pide, y el cableado es
  /// exactamente lo que se rompe en silencio: `coalesce` tiene default
  /// `false`, así que un refactor que pierda el argumento no da ningún error
  /// —solo vuelve el ×2 y nadie se entera—.
  group('cableado: quién pide coalescer y quién no', () {
    late _RepoEspia repo;

    setUp(() => repo = _RepoEspia());

    test('la página coalesce el refetch DEL EVENTO', () async {
      final realtime = _RealtimeEspia();
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
      await cubit.load('o1');

      expect(realtime.capturado, isTrue, reason: 'la página ni siquiera se suscribió');
      realtime.tocar(); // llega un `group-order.touched`
      await Future<void>.delayed(Duration.zero);

      expect(repo.coalescePorLlamada, [false, true],
          reason: 'la carga inicial no coalesce; el refetch del evento sí');
      await cubit.close();
    });

    test('pero el pull-to-refresh NO coalesce', () async {
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo);
      await cubit.load('o1');
      await cubit.refetch();

      expect(repo.coalescePorLlamada, [false, false]);
      await cubit.close();
    });

    /// El caso que rompería de verdad: re-leer tras cancelar el pago. Si esto
    /// coalesciera, el comensal recibiría el estado ANTERIOR a su cancelación
    /// y el pie se quedaría diciendo "confirmando".
    test('y la re-lectura tras cancelar el pago tampoco', () async {
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo);
      await cubit.load('o1');
      await cubit.cancelPayment(orderUuid: 'o1');

      expect(repo.coalescePorLlamada.every((c) => c == false), isTrue);
      await cubit.close();
    });

    test('el chip coalesce el refresh DEL EVENTO', () async {
      final realtime = _RealtimeEspia();
      final cubit = ActiveGroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
      await cubit.joinWithCode('ABC123');

      // `watchActive()` cuelga de `onChange` y se suscribe en un microtask:
      // sin esta espera el `tocar()` de abajo no encuentra callback y el test
      // pasaría por no hacer nada.
      await Future<void>.delayed(Duration.zero);
      expect(realtime.capturado, isTrue, reason: 'el chip ni siquiera se suscribió');

      realtime.tocar();
      await Future<void>.delayed(Duration.zero);

      expect(repo.coalescePorLlamada, contains(true));
      await cubit.close();
    });

    test('pero el refresh que sigue a una mutación del comensal NO', () async {
      final cubit = ActiveGroupOrderCubit(repo: repo, logger: _mudo);
      await cubit.joinWithCode('ABC123');
      repo.coalescePorLlamada.clear();

      await cubit.refresh(); // como lo llama group_order_page.dart

      expect(repo.coalescePorLlamada, [false]);
      await cubit.close();
    });
  });

  group('ChannelListeners sigue avisando a todos', () {
    test('un evento llega a los dos oyentes, que es lo que NO hay que romper', () {
      final canal = ChannelListeners(eventName: 'group-order.touched');
      var pagina = 0;
      var chip = 0;
      canal.add(1, () => pagina++);
      canal.add(2, () => chip++);

      canal.notificar();

      expect([pagina, chip], [1, 1]);
    });
  });
}

/// Cliente con respuestas a mano: cada llamada queda pendiente hasta que el
/// test la responde, que es lo único que permite tener dos peticiones "a la
/// vez" de forma determinista.
class _ClienteFalso implements GroupOrderClient {
  final List<Completer<GroupOrderResponseDM>> _pendientes = [];
  int peticiones = 0;

  @override
  Future<GroupOrderResponseDM> getGroupOrder(String uuid) {
    peticiones++;
    final c = Completer<GroupOrderResponseDM>();
    _pendientes.add(c);
    return c.future;
  }

  void responder(String uuid) {
    if (_pendientes.isEmpty) return;
    _pendientes.removeAt(0).complete(
          GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: uuid, businessUuid: 'b1')),
        );
  }

  void fallar() {
    if (_pendientes.isEmpty) return;
    _pendientes.removeAt(0).completeError(StateError('sin red'));
  }

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}


final _mudo = Logger(level: Level.off);

/// Repo que anota con qué valor de `coalesce` lo llamaron cada vez.
class _RepoEspia implements GroupOrderRepo {
  final List<bool> coalescePorLlamada = [];

  GroupOrderResponseDM _respuesta(String uuid) =>
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: uuid, businessUuid: 'b1'));

  @override
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid, {bool coalesce = false}) async {
    coalescePorLlamada.add(coalesce);
    return ApiResult.success(_respuesta(uuid));
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async =>
      ApiResult.success(_respuesta('o1'));

  @override
  Future<ApiResult<GroupOrderResponseDM>> cancelPayment(String uuid) async =>
      ApiResult.failure(AppRequestException(error: StateError('x'), stackTrace: StackTrace.current));

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

/// Realtime que captura el `onTouched` para poder dispararlo a mano.
class _RealtimeEspia implements GroupOrderRealtimeService {
  VoidCallback? _onTouched;

  bool get capturado => _onTouched != null;

  void tocar() => _onTouched?.call();

  @override
  Future<RealtimeSubscription> watch(String orderUuid, {required VoidCallback onTouched}) {
    _onTouched = onTouched;
    // `RealtimeSubscription` tiene constructor privado: no se puede fabricar
    // uno, y el cubit solo lo guarda para cancelarlo al cerrarse.
    return Completer<RealtimeSubscription>().future;
  }

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
