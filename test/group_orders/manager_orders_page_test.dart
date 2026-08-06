import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
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
  String? lastFulfillmentStatus;

  /// Fake que puede FALLAR por método (e2e F4b: con fakes siempre-exitosos,
  /// un 409 del backend era inexpresable en los tests de UI — así se coló
  /// el modal de error tras una acción correcta).
  ApiResult<GroupOrderResponseDM>? fulfillmentOutcome;

  /// Conteo de llamadas por endpoint: detecta llamadas REDUNDANTES (el bug
  /// del 409 era exactamente una llamada de más).
  int fulfillmentCalls = 0;
  int deliverAllCalls = 0;

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async {
    fulfillmentCalls++;
    lastFulfillmentStatus = status;
    return fulfillmentOutcome ?? actionOutcome!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerDeliverAll(String uuid) async {
    deliverAllCalls++;
    return actionOutcome!;
  }

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

  Widget app(Widget child, ManagerOrdersCubit cubit) {
    // El banner de onboarding necesita su cubit en el árbol; sin load() su
    // estado queda "desconocido" y el banner no se muestra ni toca el repo.
    final stripeCubit = StripeOnboardingCubit(
      repo: _FakeRepo(),
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
    addTearDown(stripeCubit.close);

    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: cubit),
          BlocProvider.value(value: stripeCubit),
        ],
        child: child,
      ),
    );
  }

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

    testWidgets('fix e2e: chips centrados verticalmente en su franja, sin '
        'recorte (el tap-target de 48px + padding asimétrico los empujaba '
        'abajo)', (tester) async {
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

      final chips = find.byType(ChoiceChip);
      final n = tester.widgetList(chips).length;
      expect(n, greaterThan(1));

      // Todos comparten la MISMA línea media vertical…
      final firstDy = tester.getCenter(chips.at(0)).dy;
      for (var i = 1; i < n; i++) {
        expect(tester.getCenter(chips.at(i)).dy, moreOrLessEquals(firstDy, epsilon: 0.5));
      }
      // …y el pill cabe entero en la franja de 46px.
      expect(tester.getRect(chips.at(0)).height, lessThanOrEqualTo(46));
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

      // Tap en la línea del ítem → toggle directo, SIN confirmaciones
      // (decisión Hector e2e F4a: cero fricción en el checklist).
      await tester.tap(find.text('Sashimi'));
      await tester.pumpAndSettle();
      expect(repo.lastDelivered, isTrue);
    });

    testWidgets('con estado LISTA e ítems sin tildar, ENTREGADA está '
        'HABILITADA y auto-tilda (decisión Hector: cero fricción)', (tester) async {
      final ready = order.copyWith(fulfillmentStatus: GroupFulfillmentStatus.ready);
      final repo = _FakeRepo()
        ..listOutcome = ApiResult.success(ManagerOrdersResponseDM(orders: [ready]))
        ..actionOutcome = ApiResult.success(GroupOrderResponseDM(groupOrder: ready));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      await tester.tap(find.text(S.current.managerMarkDelivered));
      await tester.pumpAndSettle();
      expect(repo.lastFulfillmentStatus, 'delivered');

      // El atajo "entregar todo de una" NO aparece en LISTA (solo queda un paso).
      expect(find.text(S.current.managerDeliverAllAndClose), findsNothing);
    });

    testWidgets('Audit F4a: el detalle NO se cierra cuando la orden sale de '
        'la lista filtrada — conserva la última copia', (tester) async {
      final repo = _FakeRepo()
        ..listOutcome = const ApiResult.success(ManagerOrdersResponseDM(orders: [order]));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();
      expect(find.text('Hector'), findsOneWidget);

      // Refetch con la orden FUERA de la lista (cambió de bucket): el
      // detalle sigue operativo con la última copia vista.
      repo.listOutcome = const ApiResult.success(ManagerOrdersResponseDM());
      await cubit.refetchSilently();
      await tester.pumpAndSettle();

      expect(find.text('Hector'), findsOneWidget);
      expect(find.byType(ManagerOrderDetailPage), findsOneWidget);
    });

    testWidgets('e2e F4b: "entregar todo de una" hace UNA sola llamada — sin '
        'advance redundante (daba 409 y modal de error tras acción OK)',
        (tester) async {
      final repo = _FakeRepo()
        ..listOutcome = const ApiResult.success(ManagerOrdersResponseDM(orders: [order]))
        ..actionOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: order));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      await tester.tap(find.text(S.current.managerDeliverAllAndClose));
      await tester.pumpAndSettle();

      expect(repo.deliverAllCalls, 1);
      expect(repo.fulfillmentCalls, 0,
          reason: 'el BE ya auto-entrega: llamar advance después es redundante');
      // Y por lo tanto NO hay error en pantalla tras una acción exitosa.
      expect(find.text(S.current.managerGenericError), findsNothing);
    });

    testWidgets('acción FALLIDA sí muestra el error (el fake puede fallar)',
        (tester) async {
      final ready = order.copyWith(fulfillmentStatus: GroupFulfillmentStatus.ready);
      final repo = _FakeRepo()
        ..listOutcome = ApiResult.success(ManagerOrdersResponseDM(orders: [ready]))
        ..fulfillmentOutcome =
            const ApiResult.failure(AppRequestException(error: 'conflicto 409'));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      await tester.tap(find.text(S.current.managerMarkDelivered));
      await tester.pumpAndSettle();

      expect(repo.fulfillmentCalls, 1);
      expect(cubit.state.error, isNotNull, reason: 'el fallo debe llegar a la UI');
    });

    testWidgets('e2e F4b: con ítems de una tanda NUEVA sin servir, la orden '
        'no se ve terminada y el checklist responde', (tester) async {
      // Orden marcada ENTREGADA que recibió un ítem nuevo (tanda 2).
      final revivida = order.copyWith(
        fulfillmentStatus: GroupFulfillmentStatus.delivered,
        items: [
          GroupOrderItemDM(
            uuid: 'i1',
            name: 'Sashimi',
            unitPricePreview: 12,
            participantUuid: 'p1',
            sentAt: DateTime(2026, 8, 5, 20),
            batchNo: 1,
            deliveredAt: DateTime(2026, 8, 5, 20, 30),
          ),
          GroupOrderItemDM(
            uuid: 'i2',
            name: 'Postre',
            unitPricePreview: 6,
            participantUuid: 'p1',
            sentAt: DateTime(2026, 8, 5, 21),
            batchNo: 2,
          ),
        ],
      );
      final repo = _FakeRepo()
        ..listOutcome = ApiResult.success(ManagerOrdersResponseDM(orders: [revivida]))
        ..actionOutcome = ApiResult.success(GroupOrderResponseDM(groupOrder: revivida));
      final cubit = buildCubit(repo);
      addTearDown(cubit.close);
      await cubit.load();

      await tester.pumpWidget(app(const ManagerOrderDetailPage(orderUuid: 'o1'), cubit));
      await tester.pumpAndSettle();

      // El ítem de la tanda 2 DEBE responder al tap (checklist vivo).
      await tester.tap(find.text('Postre'));
      await tester.pumpAndSettle();
      expect(repo.lastDelivered, isTrue);
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
