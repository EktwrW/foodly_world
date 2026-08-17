import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:logger/logger.dart';

/// F4a-4 — cubit del panel "Órdenes en vivo": carga con buckets/contadores,
/// filtro, acciones que actualizan la lista en el acto, y errores visibles.
/// Fake manual del repo (convención del proyecto, sin mocktail).

class _FakeRepo implements GroupOrderRepo {
  ApiResult<ManagerOrdersResponseDM>? managerOrdersOutcome;
  ApiResult<GroupOrderResponseDM>? actionOutcome;

  String? lastBucket;
  String? lastFulfillmentStatus;
  bool? lastDelivered;
  String? lastTableLabel;
  int managerOrdersCalls = 0;

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    managerOrdersCalls++;
    lastBucket = bucket;
    return managerOrdersOutcome!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async {
    lastFulfillmentStatus = status;
    return actionOutcome!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetItemDelivered(
    String uuid,
    String itemUuid, {
    required bool delivered,
  }) async {
    lastDelivered = delivered;
    return actionOutcome!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerDeliverAll(String uuid) async => actionOutcome!;

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetTable(
    String uuid, {
    String? tableLabel,
  }) async {
    lastTableLabel = tableLabel;
    return actionOutcome!;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late _FakeRepo repo;
  late ManagerOrdersCubit cubit;

  const orderA = GroupOrderDM(
    uuid: 'a',
    status: GroupOrderStatus.confirmed,
    tableLabel: 'Mesa 7',
    items: [GroupOrderItemDM(uuid: 'i1', name: 'Sushi', unitPricePreview: 8)],
  );
  const orderB = GroupOrderDM(uuid: 'b', status: GroupOrderStatus.confirmed);
  const counts = ManagerOrderCountsDM(pending: 2, ready: 1);

  ApiResult<ManagerOrdersResponseDM> okList({List<GroupOrderDM> orders = const [orderA, orderB]}) =>
      ApiResult.success(ManagerOrdersResponseDM(orders: orders, counts: counts));

  setUp(() {
    repo = _FakeRepo();
    cubit = ManagerOrdersCubit(
      repo: repo,
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
  });

  tearDown(() => cubit.close());

  test('load: trae órdenes y contadores; loading se apaga', () async {
    repo.managerOrdersOutcome = okList();

    await cubit.load();

    expect(cubit.state.loading, isFalse);
    expect(cubit.state.orders.map((o) => o.uuid), ['a', 'b']);
    expect(cubit.state.counts.pending, 2);
    expect(cubit.state.counts.ready, 1);
    expect(cubit.state.error, isNull);
  });

  test('selectBucket: manda el bucket al repo y actualiza la lista', () async {
    repo.managerOrdersOutcome = okList(orders: [orderA]);

    await cubit.selectBucket('ready');

    expect(repo.lastBucket, 'ready');
    expect(cubit.state.bucket, 'ready');
    expect(cubit.state.orders.single.uuid, 'a');

    // Volver a "todas": bucket null viaja como null.
    repo.managerOrdersOutcome = okList();
    await cubit.selectBucket(null);
    expect(repo.lastBucket, isNull);
    expect(cubit.state.bucket, isNull);
  });

  test('advanceFulfillment: la orden devuelta reemplaza a la suya en la '
      'lista al instante y luego re-sincroniza contadores', () async {
    repo.managerOrdersOutcome = okList();
    await cubit.load();

    final updated = orderA.copyWith(fulfillmentStatus: GroupFulfillmentStatus.ready);
    repo.actionOutcome = ApiResult.success(GroupOrderResponseDM(groupOrder: updated));
    repo.managerOrdersOutcome = okList(orders: [updated, orderB]);

    final ok = await cubit.advanceFulfillment('a', 'ready');

    expect(ok, isTrue);
    expect(repo.lastFulfillmentStatus, 'ready');
    expect(
      cubit.state.orders.firstWhere((o) => o.uuid == 'a').fulfillmentStatus,
      GroupFulfillmentStatus.ready,
    );
    // load + refetch post-acción.
    expect(repo.managerOrdersCalls, 2);
  });

  test('setItemDelivered y setTableLabel plumbean sus argumentos', () async {
    repo.managerOrdersOutcome = okList();
    await cubit.load();
    repo.actionOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: orderA));

    await cubit.setItemDelivered('a', 'i1', true);
    expect(repo.lastDelivered, isTrue);

    await cubit.setTableLabel('a', 'Barra 2');
    expect(repo.lastTableLabel, 'Barra 2');
  });

  test('fallo de acción: false + error con el mensaje del backend', () async {
    repo.managerOrdersOutcome = okList();
    await cubit.load();
    repo.actionOutcome = const ApiResult.failure(AppRequestException(error: 'boom'));

    final ok = await cubit.advanceFulfillment('a', 'delivered');

    expect(ok, isFalse);
    expect(cubit.state.error, isNotNull);
    // La lista NO se corrompe por el fallo.
    expect(cubit.state.orders.length, 2);
  });

  /// EL BUG DEL 2026-08-17. Con la pantalla apagada el polling seguía vivo y
  /// cada tick que fallaba emitía `error`, que la página convierte en snackbar
  /// (manager_orders_page.dart). Se encolaban: el manager encendía el teléfono
  /// y veía diez modales de "No pudimos completar la acción" en fila.
  ///
  /// La regla es la que dice el nombre del método: un refetch SILENCIOSO no
  /// interrumpe. Los datos buenos siguen en pantalla y el próximo tick corrige.
  test('refetchSilently que falla no levanta error ni tira los datos', () async {
    repo.managerOrdersOutcome = okList();
    await cubit.load();

    repo.managerOrdersOutcome = const ApiResult.failure(AppRequestException(error: 'red caída'));
    await cubit.refetchSilently();

    expect(cubit.state.error, isNull, reason: 'un tick de fondo no se le cuenta al manager');
    expect(cubit.state.orders.map((o) => o.uuid), ['a', 'b'], reason: 'se conserva lo último bueno');
    expect(cubit.state.counts.pending, 2);
  });

  /// Y el contrapeso: silenciar el fondo no puede silenciar lo que el manager
  /// provocó. Un fallo tras una acción suya sí tiene que verse.
  test('el silencio es SOLO del fondo: load y acciones siguen mostrando error', () async {
    repo.managerOrdersOutcome = okList();
    await cubit.load();

    repo.actionOutcome = const ApiResult.failure(AppRequestException(error: 'boom'));
    final ok = await cubit.setItemDelivered('a', 'i1', true);

    expect(ok, isFalse);
    expect(cubit.state.error, isNotNull);
  });

  test('fallo de load: error visible y loading apagado', () async {
    repo.managerOrdersOutcome = const ApiResult.failure(AppRequestException(error: 'red caída'));

    await cubit.load();

    expect(cubit.state.loading, isFalse);
    expect(cubit.state.error, isNotNull);
    expect(cubit.state.orders, isEmpty);
  });

  test('parsing F4a: fulfillment desconocido degrada a null (forward-compat) '
      'y los campos nuevos viajan', () {
    final order = GroupOrderDM.fromJson(const {
      'uuid': 'x',
      'status': 'confirmed',
      'fulfillment_status': 'preparing',
      'round_number': 3,
      'table_label': 'Mesa 9',
      'items': [
        {'uuid': 'i1', 'name_snapshot': 'Sushi', 'unit_price_preview': 8, 'delivered_at': '2026-08-02T12:00:00Z'},
      ],
    });
    expect(order.fulfillmentStatus, GroupFulfillmentStatus.preparing);
    expect(order.roundNumber, 3);
    expect(order.tableLabel, 'Mesa 9');
    expect(order.items.single.deliveredAt, isNotNull);

    // Un estado que este build no conoce (BE más nuevo) NO rompe el parseo.
    final unknown = GroupOrderDM.fromJson(const {'uuid': 'y', 'fulfillment_status': 'plated'});
    expect(unknown.fulfillmentStatus, isNull);
  });

  test('helpers F4a del DM: deliveredItemsCount / allItemsDelivered', () {
    const item = GroupOrderItemDM(uuid: 'i1', name: 'Sushi', unitPricePreview: 8);
    final delivered = item.copyWith(deliveredAt: DateTime(2026, 8, 2));

    final none = orderA.copyWith(items: [item, item.copyWith(uuid: 'i2')]);
    final partial = orderA.copyWith(items: [delivered, item.copyWith(uuid: 'i2')]);
    final all = orderA.copyWith(items: [delivered, delivered.copyWith(uuid: 'i2')]);

    expect(none.deliveredItemsCount, 0);
    expect(none.allItemsDelivered, isFalse);
    expect(partial.deliveredItemsCount, 1);
    expect(partial.allItemsDelivered, isFalse);
    expect(all.allItemsDelivered, isTrue);
    // Sin ítems jamás cuenta como "todo entregado".
    expect(orderA.copyWith(items: []).allItemsDelivered, isFalse);
  });
}
