import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:logger/logger.dart';

/// Una acción del manager NO lee la lista. Nunca.
///
/// EL CAMINO HASTA AQUÍ, porque explica por qué el test dice lo que dice:
///
///  1. El panel leía la lista entera después de cada acción, sólo para mover
///     un cubo de los chips. Y la misma mutación emite `BusinessOrdersTouched`,
///     que llega por Pusher y lee otra vez: DOS lecturas por acción, medidas
///     en producción el 2026-09-12 (cuatro pares limpios, mismo tamaño de
///     respuesta y mismo PoP de Cloudflare).
///  2. Se quitó la lectura local y se dejó una red de seguridad de 2 s. Una
///     lectura menos, pero la fila se quedaba a la vista hasta que llegara el
///     evento: al cerrar una cuenta, o al mover una orden de cubo con un chip
///     filtrando, hasta 2 s mostrando algo que el backend ya no incluye.
///  3. Ahora la respuesta de la mutación trae los contadores y si la orden
///     sigue en el panel (be-foodly #148). No hay nada que releer, y la red
///     de seguridad —con su temporizador, sus reintentos y su constante—
///     desaparece.
///
/// `stillInPanel` lo decide el BACKEND a propósito: el predicado de "está en
/// el panel" se corrigió tres veces en agosto de 2026, y replicarlo en Dart
/// sería mantener dos copias de algo que ya costó caro con una.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RepoEspia repo;
  late _RealtimeEspia realtime;
  late ManagerOrdersCubit cubit;

  setUp(() {
    repo = _RepoEspia();
    realtime = _RealtimeEspia();
    cubit = ManagerOrdersCubit(
      businessUuid: 'b1',
      repo: repo,
      logger: Logger(level: Level.off),
      realtime: realtime,
    );
  });

  tearDown(() async {
    await cubit.close();
    await realtime.unwatchAll(); // el fallback a polling deja timers vivos
  });

  test('una acción del manager no lee la lista', () async {
    await cubit.load();
    expect(repo.lecturas, 1, reason: 'la carga inicial');

    await cubit.advanceFulfillment('a', 'ready');

    expect(repo.lecturas, 1, reason: 'la acción no puede leer la lista');
  });

  /// Y no la lee NUNCA: ni al instante ni diferida. La versión anterior armaba
  /// un temporizador de 2 s, así que esperar no bastaba para distinguirlas.
  test('ni la lee más tarde', () async {
    await cubit.load();
    await cubit.advanceFulfillment('a', 'ready');

    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(repo.lecturas, 1, reason: 'quedó un refetch diferido');
  });

  test('los contadores salen de la respuesta de la mutación', () async {
    await cubit.load();
    repo.contadores = const ManagerOrderCountsDM(preparing: 3, ready: 1);

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.counts.preparing, 3);
    expect(cubit.state.counts.ready, 1);
  });

  test('y el total también, sin que el cliente sume los cubos', () async {
    await cubit.load();
    // El total es MAYOR que la suma de los cubos: el backend cuenta también
    // los `fulfillment_status` que el cliente no conoce.
    repo.contadores = const ManagerOrderCountsDM(pending: 1);
    repo.total = 4;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.total, 4, reason: 'sumar los cuatro cubos se queda corto');
  });

  test('la fila se actualiza en el acto', () async {
    await cubit.load();

    await cubit.advanceFulfillment('a', 'ready');

    expect(
      cubit.state.orders.firstWhere((o) => o.uuid == 'a').fulfillmentStatus,
      GroupFulfillmentStatus.ready,
    );
  });

  /// EL CASO QUE MOTIVÓ TODO ESTO: una cuenta que se cierra sale del panel en
  /// vivo en el acto, no "cuando llegue el evento".
  test('una orden que deja el panel desaparece de la lista al instante', () async {
    await cubit.load();
    repo.sigueEnElPanel = false;

    await cubit.advanceFulfillment('a', 'ready');

    expect(
      cubit.state.orders.where((o) => o.uuid == 'a'),
      isEmpty,
      reason: 'el panel de "en vivo" sigue mostrando una orden que el backend ya excluye',
    );
  });

  /// Y una respuesta vieja —de un backend sin desplegar— no puede vaciar la
  /// lista: sin el campo, la orden se queda.
  test('sin el campo, la orden se queda en la lista', () async {
    await cubit.load();
    repo.sigueEnElPanel = null;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.orders.map((o) => o.uuid), contains('a'));
  });

  /// Lo mismo con los contadores: sin ellos se conservan los que había, no se
  /// ponen a cero.
  test('sin contadores en la respuesta, se conservan los de antes', () async {
    repo.contadores = const ManagerOrderCountsDM(pending: 7);
    await cubit.load();
    repo.contadores = null;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.counts.pending, 7);
  });

  test('el evento de realtime sigue leyendo, que es lo que NO hay que romper', () async {
    await cubit.load();

    realtime.tocar();
    await Future<void>.delayed(Duration.zero);

    expect(repo.lecturas, 2, reason: 'el panel dejó de escuchar el canal del negocio');
  });
}

class _RepoEspia implements GroupOrderRepo {
  int lecturas = 0;
  ManagerOrderCountsDM? contadores = const ManagerOrderCountsDM();
  int? total;
  bool? sigueEnElPanel = true;

  static const _orden = GroupOrderDM(uuid: 'a', businessUuid: 'b1');

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    lecturas++;
    return ApiResult.success(ManagerOrdersResponseDM(
      orders: const [_orden],
      counts: contadores ?? const ManagerOrderCountsDM(),
    ));
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async =>
      ApiResult.success(GroupOrderResponseDM(
        groupOrder: _orden.copyWith(
          fulfillmentStatus: GroupFulfillmentStatus.values.byName(status),
        ),
        panelCounts: contadores,
        panelTotal: total,
        stillInPanel: sigueEnElPanel,
      ));

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

/// Extiende el servicio REAL: `load()` hace
/// `_sub = await _realtime?.watchBusiness(...)`, así que un fake que devuelva
/// un `Future` sin completar cuelga el cubit, y `RealtimeSubscription` tiene
/// constructor privado.
class _RealtimeEspia extends GroupOrderRealtimeService {
  _RealtimeEspia() : super(authSession: _AuthFalso());

  VoidCallback? _onTouched;

  void tocar() => _onTouched?.call();

  @override
  Future<RealtimeSubscription> watchBusiness(
    String businessUuid, {
    required VoidCallback onTouched,
  }) {
    _onTouched = onTouched;
    return super.watchBusiness(businessUuid, onTouched: onTouched);
  }
}

class _AuthFalso implements AuthSessionService {
  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
