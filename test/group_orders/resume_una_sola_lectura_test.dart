import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_chip_logic.dart';
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

  tearDown(() {
    GroupOrderPageVisibility.reset();
    return di.reset();
  });

  /// El host sólo entra por las ramas que interesan cuando NO le pasan
  /// `ordersSource`: así usa el `ActiveGroupOrderCubit` de DI.
  Future<void> montar(WidgetTester tester) => tester.pumpWidget(
        MaterialApp(
          home: GroupOrderFloatingChipHost(
            routeListenable: ValueNotifier<String>('/'),
            locationOf: () => '/',
            onOpenOrder: (_) {},
            child: const Scaffold(body: SizedBox.expand()),
          ),
        ),
      );

  /// Y al CERRAR la página de la orden, el chip NO coalesce.
  ///
  /// Es la dirección contraria a la del resume, y la que el autor no había
  /// blindado: cerrar la página puede venir justo detrás de una mutación del
  /// comensal (agregó platos y salió), así que colgarse de una petición
  /// anterior le devolvería el carrito de antes. Lo señaló la segunda
  /// revisión: añadir `coalesce: true` ahí no lo notaba ningún test.
  testWidgets('al cerrar la página de la orden el chip NO coalesce', (tester) async {
    await montar(tester);
    await di<ActiveGroupOrderCubit>().joinWithCode('ABC123');
    repo.coalescePorLlamada.clear();

    // Abrir y cerrar la página: el host escucha `openCount`.
    GroupOrderPageVisibility.markOpened();
    await tester.pump();
    repo.coalescePorLlamada.clear();
    GroupOrderPageVisibility.markClosed();
    await tester.pump();

    expect(
      repo.coalescePorLlamada,
      everyElement(isFalse),
      reason: 'cerrar la página puede seguir a una mutación del comensal: ahí no se coalesce',
    );
  });

  testWidgets('al volver del background el chip coalesce su lectura', (tester) async {
    await montar(tester);

    // Con orden en memoria: sin ella el host llama a `syncAnyActive()`, que es
    // otro camino y no el que se está probando.
    await di<ActiveGroupOrderCubit>().joinWithCode('ABC123');
    repo.coalescePorLlamada.clear();

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();

    expect(repo.coalescePorLlamada, [true], reason: 'el refresh del resume tiene que poder colapsar con el del evento');
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
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async => ApiResult.success(_respuesta('o1'));

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
