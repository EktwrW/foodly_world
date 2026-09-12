
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

/// El panel del manager leía la lista DOS veces por cada acción.
///
/// MEDIDO EN PRODUCCIÓN el 2026-09-12, no deducido. Cuatro pares limpios, con
/// el mismo tamaño de respuesta y el mismo PoP de Cloudflare —o sea un solo
/// dispositivo pidiendo dos veces—:
///
///     17:23:06.606  y  17:23:06.806     (1178 bytes los dos)
///     17:23:18.427  y  17:23:18.505     (1186 / 1186)
///     17:23:32.475  y  17:23:33.546     (1179 / 1179)
///     17:23:51.646  y  17:23:52.145     (1181 / 1181)
///
/// Los dos disparadores:
///
///   1. `_applyAction` llamaba a `refetchSilently()` en la rama de éxito,
///      SOLO para re-sincronizar los contadores de los chips.
///   2. Esa misma mutación emite `BusinessOrdersTouched`, que llega por Pusher
///      entre 52 ms y 1 s después y vuelve a llamar a `refetchSilently()`.
///
/// No es el ×2 que arregló el coalescer de lecturas: ahí eran dos oyentes del
/// mismo evento en el mismo turno. Aquí son dos turnos distintos separados por
/// la latencia del socket, así que ningún coalescer por turno los junta.
///
/// El arreglo: la acción ya no lee. Pide una resincronización y deja que la
/// haga el evento, con una red de seguridad por si el socket está caído o el
/// evento se pierde. La fila del manager se actualiza igual de rápido, porque
/// eso lo hace el `emit` optimista con la respuesta de la propia mutación; lo
/// único que espera son los contadores.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RepoEspia repo;
  late _RealtimeEspia realtime;
  late ManagerOrdersCubit cubit;

  const espera = Duration(milliseconds: 60);

  setUp(() {
    repo = _RepoEspia();
    realtime = _RealtimeEspia();
    cubit = ManagerOrdersCubit(
      businessUuid: 'b1',
      repo: repo,
      logger: Logger(level: Level.off),
      realtime: realtime,
      esperaDeResincronizacion: espera,
    );
  });

  tearDown(() async {
    await cubit.close();
    await realtime.unwatchAll(); // el fallback a polling deja timers vivos
  });

  test('una acción del manager NO lee la lista al instante', () async {
    await cubit.load();
    expect(repo.lecturas, 1, reason: 'la carga inicial');

    await cubit.advanceFulfillment('a', 'ready');

    expect(repo.lecturas, 1, reason: 'la acción no puede disparar su propia lectura');
  });

  test('pero la fila SÍ se actualiza en el acto, sin esperar a nadie', () async {
    await cubit.load();

    await cubit.advanceFulfillment('a', 'ready');

    expect(
      cubit.state.orders.firstWhere((o) => o.uuid == 'a').fulfillmentStatus,
      GroupFulfillmentStatus.ready,
      reason: 'el emit optimista con la respuesta de la mutación es lo que da la sensación de rápido',
    );
  });

  test('el evento de esa mutación resincroniza, y UNA sola vez', () async {
    await cubit.load();
    await cubit.advanceFulfillment('a', 'ready');

    realtime.tocar(); // llega `BusinessOrdersTouched`
    await Future<void>.delayed(Duration.zero);

    expect(repo.lecturas, 2, reason: 'carga + la del evento: una por acción, no dos');

    // Y la red de seguridad ya no dispara: el evento la desarmó.
    await Future<void>.delayed(espera * 3);
    expect(repo.lecturas, 2, reason: 'la red de seguridad disparó además del evento');
  });

  test('si el evento NO llega, la red de seguridad resincroniza igual', () async {
    await cubit.load();
    await cubit.advanceFulfillment('a', 'ready');

    await Future<void>.delayed(espera * 3);

    expect(repo.lecturas, 2,
        reason: 'con el socket caído los contadores se quedarían desincronizados para siempre');
  });

  test('varias acciones seguidas arman UNA sola red, no una por acción', () async {
    await cubit.load();
    await cubit.advanceFulfillment('a', 'ready');
    await cubit.advanceFulfillment('a', 'delivered');
    await cubit.advanceFulfillment('a', 'ready');

    await Future<void>.delayed(espera * 3);

    expect(repo.lecturas, 2, reason: 'tres acciones no pueden dejar tres lecturas encoladas');
  });

  test('cerrar el panel cancela la red de seguridad', () async {
    await cubit.load();
    await cubit.advanceFulfillment('a', 'ready');
    await cubit.close();

    await Future<void>.delayed(espera * 3);

    expect(repo.lecturas, 1, reason: 'un cubit cerrado no puede seguir pidiendo');
  });
}

class _RepoEspia implements GroupOrderRepo {
  int lecturas = 0;

  static const _orden = GroupOrderDM(uuid: 'a', businessUuid: 'b1');

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    lecturas++;
    return const ApiResult.success(ManagerOrdersResponseDM(orders: [_orden]));
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
      ));

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

/// Extiende el servicio REAL en vez de implementarlo.
///
/// `load()` hace `_sub = await _realtime?.watchBusiness(...)`, así que un fake
/// que devuelva un `Future` sin completar cuelga el cubit entero — y
/// `RealtimeSubscription` tiene constructor privado, o sea que no se puede
/// fabricar uno. Delegando en el real sale una suscripción de verdad: el
/// `_connect()` falla sin plugin de Pusher y cae a polling, que el `tearDown`
/// limpia con `unwatchAll()`.
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
