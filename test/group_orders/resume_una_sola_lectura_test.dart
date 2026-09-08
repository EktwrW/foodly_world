import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_floating_chip_host.dart';

/// Volver del background pedía la orden DOS veces (hallazgo de la revisión).
///
/// Hay dos `WidgetsBindingObserver` que reaccionan a `resumed`:
///
///   · `GroupOrderRealtimeService`, con su `_notifyAll()` -> refetch por evento
///   · `GroupOrderFloatingChipHost`, con su propio `cubit.refresh()`
///
/// y el binding los recorre en un bucle SÍNCRONO
/// (flutter/lib/src/widgets/binding.dart:1332), así que caen en el mismo
/// turno. Sin `coalesce: true` en el segundo salían dos peticiones idénticas
/// **en cada vuelta del background** — el momento más frecuente del día, y se
/// quedó fuera de la primera versión de la PR.
///
/// Aquí se comprueba el cableado, que es lo que se pierde en un refactor sin
/// dar ningún error: `coalesce` tiene default `false`.
void main() {
  late _RepoEspia repo;

  setUp(() async {
    repo = _RepoEspia();
    await di.reset();
    di.registerSingleton<GroupOrderRepo>(repo);
    di.registerSingleton<Logger>(Logger(level: Level.off));
    di.registerSingleton<GroupOrderRealtimeService>(_RealtimeMudo());
    di.registerSingleton<ActiveGroupOrderCubit>(
      ActiveGroupOrderCubit(repo: repo, logger: Logger(level: Level.off)),
    );
    await S.load(const Locale('es'));
  });

  tearDown(() => di.reset());

  testWidgets('al volver del background el chip coalesce su lectura', (tester) async {
    // El host solo entra por esta rama cuando NO le pasan `ordersSource`.
    await tester.pumpWidget(
      MaterialApp(
        home: GroupOrderFloatingChipHost(
          routeListenable: ValueNotifier<String>('/'),
          locationOf: () => '/',
          onOpenOrder: (_) {},
          child: const Scaffold(body: SizedBox.expand()),
        ),
      ),
    );

    // Con orden en memoria: sin ella el host llama a `syncAnyActive()`, que es
    // otro camino y no el que se está probando.
    await di<ActiveGroupOrderCubit>().joinWithCode('ABC123');
    repo.coalescePorLlamada.clear();

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();

    expect(repo.coalescePorLlamada, [true],
        reason: 'el refresh del resume tiene que poder colapsar con el del evento');
  });
}

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

  /// El `initState` del host llama a `syncAnyActive()`, que pasa por aquí.
  /// Sin orden activa, para que el estado lo ponga el `joinByCode` del test.
  @override
  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async =>
      const ApiResult.success(GroupOrdersListResponseDM());

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

class _RealtimeMudo implements GroupOrderRealtimeService {
  @override
  Future<RealtimeSubscription> watch(String orderUuid, {required VoidCallback onTouched}) =>
      Completer<RealtimeSubscription>().future;

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
