import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_order_detail_page.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_orders_page.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:logger/logger.dart';

/// F4a-5 — widget tests del panel "Órdenes en vivo": chips con contadores,
/// tarjeta con ronda/mesa/badge, y detalle con checklist + CTA gateado.

class _FakeRepo implements GroupOrderRepo {
  ApiResult<ManagerOrdersResponseDM>? listOutcome;
  ApiResult<GroupOrderResponseDM>? actionOutcome;
  String? lastBucket;
  bool? lastDelivered;

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    lastBucket = bucket;
    return listOutcome!;
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
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  const host = GroupOrderParticipantDM(
      uuid: 'p1', displayName: 'Hector', role: GroupParticipantRole.host);

  const order = GroupOrderDM(
    uuid: 'o1',
    status: GroupOrderStatus.confirmed,
    businessName: 'Best Sushi Lounge',
    totalAmount: 64.50,
    roundNumber: 2,
    tableLabel: 'Mesa 7',
    participants: [host],
    items: [GroupOrderItemDM(uuid: 'i1', name: 'Sashimi', unitPricePreview: 12, quantity: 2, participantUuid: 'p1')],
  );

  Widget app(Widget child, ManagerOrdersCubit cubit) => MaterialApp(
        home: BlocProvider.value(value: cubit, child: child),
      );

  ManagerOrdersCubit buildCubit(_FakeRepo repo) => ManagerOrdersCubit(
        repo: repo,
        logger: Logger(level: Level.off),
        businessUuid: 'biz-1',
      );

  group('ManagerOrdersPage', () {
    testWidgets('chips con contadores + tarjeta con ronda, mesa, total y badge',
        (tester) async {
      final repo = _FakeRepo()
        ..listOutcome = const ApiResult.success(ManagerOrdersResponseDM(
          orders: [order],
          counts: ManagerOrderCountsDM(pending: 3, ready: 1),
        ));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);

      await tester.pumpWidget(app(const ManagerOrdersPage(), cubit));
      await cubit.load();
      await tester.pumpAndSettle();

      // Chips: contador de Activas=3 y Listas=1 visibles.
      expect(find.text(S.current.managerBucketPending), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);

      // Tarjeta: negocio, RONDA 2, MESA 7, total y badge CONFIRMADA.
      expect(find.text('Best Sushi Lounge'), findsOneWidget);
      expect(find.text(S.current.managerRound(2)), findsOneWidget);
      expect(find.text('MESA 7'), findsOneWidget);
      expect(find.text('€64.50'), findsOneWidget);
      expect(find.text(S.current.managerBadgeConfirmed), findsOneWidget);
      expect(find.text(S.current.managerItemsDelivered(0, 1)), findsOneWidget);
    });

    testWidgets('tap en un chip manda el bucket al repo', (tester) async {
      final repo = _FakeRepo()
        ..listOutcome = const ApiResult.success(ManagerOrdersResponseDM(orders: [order]));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);

      await tester.pumpWidget(app(const ManagerOrdersPage(), cubit));
      await cubit.load();
      await tester.pumpAndSettle();

      await tester.tap(find.text(S.current.managerBucketReady));
      await tester.pumpAndSettle();

      expect(repo.lastBucket, 'ready');
    });

    testWidgets('sin órdenes muestra el empty state', (tester) async {
      final repo = _FakeRepo()
        ..listOutcome = const ApiResult.success(ManagerOrdersResponseDM());
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);

      await tester.pumpWidget(app(const ManagerOrdersPage(), cubit));
      await cubit.load();
      await tester.pumpAndSettle();

      expect(find.text(S.current.managerNoOrders), findsOneWidget);
    });
  });

  group('ManagerOrderDetailPage', () {
    testWidgets('stepper + checklist; tildar un ítem llama al repo', (tester) async {
      final repo = _FakeRepo()
        ..listOutcome = const ApiResult.success(ManagerOrdersResponseDM(orders: [order]))
        ..actionOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: order));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      expect(find.byType(ManagerFulfillmentStepper), findsOneWidget);
      expect(find.text('Hector'), findsOneWidget);
      expect(find.text('Sashimi'), findsOneWidget);
      // CTA del siguiente paso (sin fulfillment → PREPARANDO).
      expect(find.text(S.current.managerMarkPreparing), findsOneWidget);

      // Tap en la línea del ítem → toggle de entrega hacia true.
      await tester.tap(find.text('Sashimi'));
      await tester.pumpAndSettle();
      expect(repo.lastDelivered, isTrue);
    });

    testWidgets('con estado LISTA e ítems sin tildar, ENTREGADA queda '
        'deshabilitada con la nota del checklist', (tester) async {
      final ready = order.copyWith(fulfillmentStatus: GroupFulfillmentStatus.ready);
      final repo = _FakeRepo()
        ..listOutcome = ApiResult.success(ManagerOrdersResponseDM(orders: [ready]));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      expect(find.text(S.current.managerMarkDelivered), findsOneWidget);
      expect(find.text(S.current.managerDeliveredNeedsChecklist), findsOneWidget);
      // El atajo "entregar todo de una" NO aparece en LISTA (solo queda un paso).
      expect(find.text(S.current.managerDeliverAllAndClose), findsNothing);
    });

    testWidgets('orden ENTREGADA: sin CTA, estado final visible', (tester) async {
      final done = order.copyWith(
        fulfillmentStatus: GroupFulfillmentStatus.delivered,
        items: [
          GroupOrderItemDM(
            uuid: 'i1',
            name: 'Sashimi',
            unitPricePreview: 12,
            participantUuid: 'p1',
            deliveredAt: DateTime(2026, 8, 2),
          ),
        ],
      );
      final repo = _FakeRepo()
        ..listOutcome = ApiResult.success(ManagerOrdersResponseDM(orders: [done]));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      expect(find.text(S.current.managerMarkPreparing), findsNothing);
      expect(find.text(S.current.managerMarkReady), findsNothing);
      expect(find.text(S.current.managerMarkDelivered), findsNothing);
      expect(find.text(S.current.managerBadgeDelivered), findsWidgets);
    });
  });
}
