import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_history_cubit.dart';
import 'package:logger/logger.dart';

/// F4a.1 — historial del manager: keyset pagination (load/loadMore con
/// acumulación y guards) + agrupado puro por día con totales.
/// Fake manual del repo (convención del proyecto, sin mocktail).

class _FakeRepo implements GroupOrderRepo {
  final List<ApiResult<ManagerHistoryResponseDM>> outcomes = [];
  final List<String?> beforeArgs = [];
  int calls = 0;

  @override
  Future<ApiResult<ManagerHistoryResponseDM>> managerOrderHistory(
    String businessUuid, {
    String? before,
    int? limit,
  }) async {
    beforeArgs.add(before);
    return outcomes[calls++];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

GroupOrderDM order(String uuid, {DateTime? confirmedAt, double total = 0}) => GroupOrderDM(
      uuid: uuid,
      status: GroupOrderStatus.completed,
      confirmedAt: confirmedAt,
      totalAmount: total,
    );

void main() {
  late _FakeRepo repo;
  late ManagerHistoryCubit cubit;

  final yesterday = DateTime(2026, 8, 1, 21, 30);
  final dayBefore = DateTime(2026, 7, 31, 13);

  setUp(() {
    repo = _FakeRepo();
    cubit = ManagerHistoryCubit(
      repo: repo,
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
  });

  tearDown(() => cubit.close());

  group('ManagerHistoryCubit', () {
    test('load: página 1 sin cursor; hasMore y nextBefore del backend', () async {
      repo.outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('a', confirmedAt: yesterday)],
        hasMore: true,
        nextBefore: '2026-08-01T21:30:00+00:00',
      )));

      await cubit.load();

      expect(repo.beforeArgs, [null]);
      expect(cubit.state.loading, isFalse);
      expect(cubit.state.orders.single.uuid, 'a');
      expect(cubit.state.hasMore, isTrue);
      expect(cubit.state.nextBefore, '2026-08-01T21:30:00+00:00');
      expect(cubit.state.error, isNull);
    });

    test('loadMore: manda el cursor, ACUMULA y actualiza hasMore/nextBefore', () async {
      repo.outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('a', confirmedAt: yesterday)],
        hasMore: true,
        nextBefore: 'cursor-1',
      )));
      repo.outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('b', confirmedAt: dayBefore)],
      )));

      await cubit.load();
      await cubit.loadMore();

      expect(repo.beforeArgs, [null, 'cursor-1']);
      expect(cubit.state.orders.map((o) => o.uuid), ['a', 'b']);
      expect(cubit.state.hasMore, isFalse);
      expect(cubit.state.nextBefore, isNull);
      expect(cubit.state.loadingMore, isFalse);
    });

    test('loadMore guard: hasMore=false → no llama al repo', () async {
      repo.outcomes.add(const ApiResult.success(ManagerHistoryResponseDM()));
      await cubit.load();

      await cubit.loadMore();

      expect(repo.calls, 1);
    });

    test('loadMore guard: hasMore=true pero sin cursor (backend '
        'inconsistente) → no-op', () async {
      repo.outcomes.add(const ApiResult.success(ManagerHistoryResponseDM(hasMore: true)));
      await cubit.load();

      await cubit.loadMore();

      expect(repo.calls, 1);
    });

    test('loadMore guard: doble scroll rápido → una sola página en vuelo', () async {
      repo.outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('a', confirmedAt: yesterday)],
        hasMore: true,
        nextBefore: 'cursor-1',
      )));
      repo.outcomes.add(const ApiResult.success(ManagerHistoryResponseDM()));
      await cubit.load();

      // La segunda invocación entra mientras la primera sigue en vuelo:
      // el guard loadingMore la descarta (emit es síncrono pre-await).
      final f1 = cubit.loadMore();
      final f2 = cubit.loadMore();
      await Future.wait([f1, f2]);

      expect(repo.calls, 2); // load + UNA página, no dos.
    });

    test('load falla: error visible, loading apagado, lista vacía', () async {
      repo.outcomes.add(const ApiResult.failure(AppRequestException(error: 'red caída')));

      await cubit.load();

      expect(cubit.state.loading, isFalse);
      expect(cubit.state.error, isNotNull);
      expect(cubit.state.orders, isEmpty);
    });

    test('loadMore falla: conserva lo acumulado y apaga loadingMore', () async {
      repo.outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('a', confirmedAt: yesterday)],
        hasMore: true,
        nextBefore: 'cursor-1',
      )));
      repo.outcomes.add(const ApiResult.failure(AppRequestException(error: 'boom')));

      await cubit.load();
      await cubit.loadMore();

      expect(cubit.state.orders.single.uuid, 'a');
      expect(cubit.state.loadingMore, isFalse);
      expect(cubit.state.error, isNotNull);
      // El cursor sobrevive: un retry de loadMore sigue siendo posible.
      expect(cubit.state.nextBefore, 'cursor-1');
      expect(cubit.state.hasMore, isTrue);
    });
  });

  group('groupOrdersByDay (pura)', () {
    test('agrupa por día local, orden desc, y suma totales por día', () {
      final groups = groupOrdersByDay([
        order('a1', confirmedAt: DateTime(2026, 8, 1, 22), total: 30),
        order('a2', confirmedAt: DateTime(2026, 8, 1, 13), total: 12.5),
        order('b1', confirmedAt: DateTime(2026, 7, 31, 20), total: 40),
      ]);

      expect(groups.length, 2);
      expect(groups[0].day, DateTime(2026, 8));
      expect(groups[0].orders.map((o) => o.uuid), ['a1', 'a2']);
      expect(groups[0].dayTotal, closeTo(42.5, 0.001));
      expect(groups[1].day, DateTime(2026, 7, 31));
      expect(groups[1].dayTotal, closeTo(40, 0.001));
    });

    test('ignora órdenes sin confirmedAt (defensivo) y lista vacía → []', () {
      final groups = groupOrdersByDay([
        order('sin-fecha'),
        order('ok', confirmedAt: DateTime(2026, 8, 1, 10), total: 5),
      ]);
      expect(groups.single.orders.single.uuid, 'ok');

      expect(groupOrdersByDay(const []), isEmpty);
    });

    test('preserva el orden intra-día que trae el backend (desc)', () {
      final groups = groupOrdersByDay([
        order('tarde', confirmedAt: DateTime(2026, 8, 1, 23)),
        order('mediodia', confirmedAt: DateTime(2026, 8, 1, 12)),
        order('maniana', confirmedAt: DateTime(2026, 8, 1, 9)),
      ]);
      expect(groups.single.orders.map((o) => o.uuid), ['tarde', 'mediodia', 'maniana']);
    });

    test('parsing: confirmed_at ISO viaja al DM (necesario para agrupar)', () {
      final o = GroupOrderDM.fromJson(const {
        'uuid': 'x',
        'status': 'completed',
        'confirmed_at': '2026-08-01T21:30:00+00:00',
      });
      expect(o.confirmedAt, isNotNull);
      expect(o.confirmedAt!.toUtc(), DateTime.utc(2026, 8, 1, 21, 30));
    });

    test('parsing ManagerHistoryResponseDM: has_more/next_before', () {
      final r = ManagerHistoryResponseDM.fromJson(const {
        'orders': [
          {'uuid': 'a', 'status': 'completed'},
        ],
        'has_more': true,
        'next_before': '2026-08-01T21:30:00+00:00',
      });
      expect(r.orders.single.uuid, 'a');
      expect(r.hasMore, isTrue);
      expect(r.nextBefore, '2026-08-01T21:30:00+00:00');
    });
  });
}
