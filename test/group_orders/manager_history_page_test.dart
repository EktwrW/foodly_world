import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_history_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_order_history_page.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

/// F4a.1 — widget tests del historial: headers por día con resumen,
/// sheet de solo lectura, scroll infinito y empty state.

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

void main() {
  setUpAll(() async {
    await S.load(const Locale('es'));
    // El header de día usa DateFormat con el locale activo; en tests hay que
    // cargar los símbolos (en la app lo hace flutter_localizations).
    await initializeDateFormatting('es');
  });

  // Días relativos REALES: la página etiqueta "Ayer" contra DateTime.now().
  final now = DateTime.now();
  final today0 = DateTime(now.year, now.month, now.day);
  final yesterday = today0.subtract(const Duration(days: 1)).add(const Duration(hours: 21));
  final older = today0.subtract(const Duration(days: 3)).add(const Duration(hours: 13));

  const host = GroupOrderParticipantDM(
      uuid: 'p1', displayName: 'Hector', role: GroupParticipantRole.host);

  GroupOrderDM order(String uuid, DateTime confirmedAt, {double total = 20}) => GroupOrderDM(
        uuid: uuid,
        status: GroupOrderStatus.completed,
        businessName: 'Best Sushi Lounge',
        totalAmount: total,
        tableLabel: 'Mesa 7',
        confirmedAt: confirmedAt,
        participants: const [host],
        items: const [
          GroupOrderItemDM(
              uuid: 'i1', name: 'Sashimi', unitPricePreview: 10, quantity: 2, participantUuid: 'p1'),
        ],
      );

  Widget app(ManagerHistoryCubit cubit) => MaterialApp(
        home: BlocProvider.value(value: cubit, child: const ManagerOrderHistoryPage()),
      );

  ManagerHistoryCubit buildCubit(_FakeRepo repo) => ManagerHistoryCubit(
        repo: repo,
        logger: Logger(level: Level.off),
        businessUuid: 'biz-1',
      );

  testWidgets('headers por día: "AYER" + fecha formateada, con resumen '
      'N órdenes · total; tarjetas debajo', (tester) async {
    final repo = _FakeRepo()
      ..outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [
          order('a1', yesterday, total: 30),
          order('a2', yesterday.subtract(const Duration(hours: 2)), total: 12.5),
          order('b1', older, total: 40),
        ],
      )));
    final cubit = buildCubit(repo);
    addTearDown(cubit.close);

    await tester.pumpWidget(app(cubit));
    await cubit.load();
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerHistoryTitle), findsOneWidget);
    expect(find.text(S.current.managerHistoryYesterday.toUpperCase()), findsOneWidget);
    // El día viejo usa la fecha formateada en el locale activo.
    final olderLabel = DateFormat.MMMEd(Intl.getCurrentLocale())
        .format(DateTime(older.year, older.month, older.day))
        .toUpperCase();
    expect(find.text(olderLabel), findsOneWidget);

    // Resumen de cada día: 2 órdenes · €42.50 y 1 órdenes · €40.00.
    expect(find.text(S.current.managerHistoryDaySummary(2, '€42.50')), findsOneWidget);
    expect(find.text(S.current.managerHistoryDaySummary(1, '€40.00')), findsOneWidget);

    expect(find.byType(ManagerOrderCard), findsNWidgets(3));
  });

  testWidgets('tap en una tarjeta abre el sheet de SOLO LECTURA con '
      'comensales, ítems y total', (tester) async {
    final repo = _FakeRepo()
      ..outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('a1', yesterday)],
      )));
    final cubit = buildCubit(repo);
    addTearDown(cubit.close);

    await tester.pumpWidget(app(cubit));
    await cubit.load();
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ManagerOrderCard));
    await tester.pumpAndSettle();

    // Contenido read-only: nombre, ítem con cantidad y total de línea.
    expect(find.text('Hector'), findsOneWidget);
    expect(find.text('Sashimi'), findsWidgets);
    expect(find.text('2×'), findsOneWidget);
    // Sin controles operativos (es historia, no operación).
    expect(find.byType(ManagerFulfillmentStepper), findsNothing);
  });

  testWidgets('scroll cerca del fondo dispara loadMore con el cursor', (tester) async {
    final repo = _FakeRepo()
      ..outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [
          for (var i = 0; i < 12; i++)
            order('o$i', yesterday.subtract(Duration(minutes: i * 10))),
        ],
        hasMore: true,
        nextBefore: 'cursor-1',
      )))
      ..outcomes.add(ApiResult.success(ManagerHistoryResponseDM(
        orders: [order('viejo', older)],
      )));
    final cubit = buildCubit(repo);
    addTearDown(cubit.close);

    await tester.pumpWidget(app(cubit));
    await cubit.load();
    await tester.pumpAndSettle();

    await tester.drag(find.byType(ListView), const Offset(0, -3000));
    await tester.pumpAndSettle();

    expect(repo.beforeArgs, [null, 'cursor-1']);
    // La página nueva quedó acumulada (12 + 1).
    expect(cubit.state.orders.length, 13);
    expect(cubit.state.hasMore, isFalse);
  });

  testWidgets('sin órdenes pasadas muestra el empty state', (tester) async {
    final repo = _FakeRepo()
      ..outcomes.add(const ApiResult.success(ManagerHistoryResponseDM()));
    final cubit = buildCubit(repo);
    addTearDown(cubit.close);

    await tester.pumpWidget(app(cubit));
    await cubit.load();
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerHistoryEmpty), findsOneWidget);
  });
}
