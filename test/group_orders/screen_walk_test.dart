import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_order_detail_page.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:logger/logger.dart';

import 'fixtures/group_order_fixtures.dart';

/// WALK DE PANTALLA — qué VEN el manager y el comensal en cada paso de la
/// visita, por modo de cobro.
///
/// Por qué existe (2026-08-08). Ya había dos capas: el walk del ciclo por la
/// API en el backend (`GroupOrderLifecycleWalkTest`) y los tests de
/// predicados del DM (`canVoidItems` espeja al backend, etc.). Faltaba la del
/// medio: **pintar la pantalla en cada estado y leer lo que dice**. Los
/// últimos cuatro bugs de la jornada vivían exactamente ahí, y ninguna de las
/// otras dos capas podía verlos porque nadie dibujaba la pantalla:
///
///  · el badge decía "POR PAGAR" para siempre sobre cuentas cobradas en caja;
///  · el cartel invitaba a tocar los platos cuando el tap ya no hacía nada;
///  · la tarjeta no distinguía una cuenta cerrada de una mesa viva;
///  · el cartel verde afirmaba ENTREGADA mientras el checklist decía 0/2.
///
/// La regla: un predicado correcto no garantiza una pantalla correcta. Cada
/// estado que el panel puede listar se pinta acá y se asevera lo que muestra.
///
/// Los estados listables son `confirmed`, `completed`, y `locked` de cuenta
/// abierta con la cuenta pedida (ver `ManagerGroupOrderController::index`).

class _FakeRepo implements GroupOrderRepo {
  ApiResult<ManagerOrdersResponseDM>? listOutcome;

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async =>
      listOutcome!;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  const host = GroupOrderParticipantDM(
    uuid: 'p1',
    displayName: 'Hector',
    role: GroupParticipantRole.host,
  );

  /// Toda orden que llega al panel tiene comensales y nombre de negocio.
  GroupOrderDM listable(GroupOrderDM o) =>
      o.copyWith(participants: const [host], businessName: 'The Bar Restaurant');

  /// Pinta el DETALLE tal como lo abre el manager desde la lista.
  Future<void> pumpDetail(WidgetTester tester, GroupOrderDM order) async {
    final repo = _FakeRepo()
      ..listOutcome = ApiResult.success(ManagerOrdersResponseDM(orders: [order]));
    final cubit = ManagerOrdersCubit(
      repo: repo,
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
    addTearDown(cubit.close);
    await cubit.load();

    final stripeCubit = StripeOnboardingCubit(
      repo: _FakeRepo(),
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
    addTearDown(stripeCubit.close);

    await tester.pumpWidget(MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: cubit),
          BlocProvider.value(value: stripeCubit),
        ],
        child: ManagerOrderDetailPage(orderUuid: order.uuid),
      ),
    ));
    await tester.pumpAndSettle();
  }

  /// Pinta SOLO la tarjeta de la lista.
  Future<void> pumpCard(WidgetTester tester, GroupOrderDM order) => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ManagerOrderCard(order: order, onTap: () {})),
        ),
      );

  /// "ENTREGADA" lo dibuja SIEMPRE el stepper como uno de sus cuatro pasos.
  /// Una segunda aparición es una AFIRMACIÓN sobre el estado de la orden.
  void expectNoDeliveredClaim(String reason) => expect(
        find.text(S.current.managerBadgeDelivered),
        findsOneWidget,
        reason: 'Solo el paso del stepper, sin afirmarlo: $reason',
      );

  // ══════════════════════════════════════════════════════════════════
  //  CUENTA ABIERTA — la visita completa, paso a paso
  // ══════════════════════════════════════════════════════════════════

  group('walk de pantalla · CUENTA ABIERTA', () {
    GroupOrderDM tab({GroupFulfillmentStatus? ff}) => listable(GroupOrders.openTab(
          items: [GroupOrders.sentItem(uuid: 'i1', price: 12, participantUuid: 'p1')],
          fulfillment: ff,
        ));

    testWidgets('1· primera tanda en cocina: invita a tildar y ofrece avanzar',
        (tester) async {
      await pumpDetail(tester, tab(ff: GroupFulfillmentStatus.preparing));

      expect(find.text(S.current.managerItemsDelivered(0, 1)), findsOneWidget);
      expect(find.text(S.current.managerChecklistHint), findsOneWidget,
          reason: 'El cartel invita a tildar porque tildar SÍ hace algo.');
      expect(find.text(S.current.managerMarkReady), findsOneWidget);
    });

    testWidgets('2· un plato en el carrito NO entra en la comanda', (tester) async {
      final conCarrito = listable(GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.preparing,
        items: [
          GroupOrders.sentItem(uuid: 'i1', price: 12, participantUuid: 'p1'),
          GroupOrders.pendingItem(uuid: 'c1', price: 6, participantUuid: 'p1'),
        ],
      ));

      await pumpDetail(tester, conCarrito);

      expect(find.text(S.current.managerItemsDelivered(0, 1)), findsOneWidget,
          reason: 'El postre que el comensal todavía no envió: 0/1, no 0/2.');
    });

    testWidgets('3· servida y sin cobrar: POR PAGAR en la tarjeta, cerrable en '
        'el detalle', (tester) async {
      final servida = tab(ff: GroupFulfillmentStatus.delivered);

      await pumpCard(tester, servida);
      expect(find.text(S.current.managerUnpaidBadge), findsOneWidget);

      await pumpDetail(tester, servida);
      expect(find.text(S.current.managerCloseTab), findsOneWidget,
          reason: 'Cobrar en caja es el desenlace más común del restaurante.');
      expect(find.text(S.current.managerChecklistHint), findsNothing,
          reason: 'Ya está todo entregado: no queda nada que tildar.');
    });

    testWidgets('4· cuenta pedida mientras la cocina trabaja: sin acciones de '
        'cocina, pero cerrable y SIN afirmar que está entregada', (tester) async {
      // `locked` + cuenta pedida es el único estado no-confirmado que el panel
      // lista, justo para que el mesero pueda cobrarla en efectivo. El BE
      // exige `confirmed` para toda acción de cocina, así que la zona de CTA
      // cae al cartel de cierre — que afirmaba ENTREGADA en verde mientras el
      // checklist, dos centímetros más arriba, decía 0/1.
      final pedida = tab(ff: GroupFulfillmentStatus.preparing).copyWith(
        status: GroupOrderStatus.locked,
        billRequestedAt: DateTime(2026, 8, 8, 22),
      );

      await pumpDetail(tester, pedida);

      expect(find.text(S.current.managerItemsDelivered(0, 1)), findsOneWidget);
      expect(find.text(S.current.managerChecklistHint), findsNothing);
      expect(find.text(S.current.managerMarkReady), findsNothing);
      expectNoDeliveredClaim('la comida sigue en la cocina');
      expect(find.text(S.current.managerTabClosedTitle), findsNothing,
          reason: 'Tampoco terminó: solo pidió la cuenta.');
      expect(find.text(S.current.managerCloseTab), findsOneWidget,
          reason: 'Sin esto, la mesa que paga en efectivo no tiene dónde cerrarse.');
    });

    testWidgets('5· cobrada EN CAJA: la tarjeta lo dice y deja de pedir plata',
        (tester) async {
      final enCaja = tab(ff: GroupFulfillmentStatus.delivered).copyWith(
        status: GroupOrderStatus.completed,
        closedReason: 'paid_offline',
        closedAt: DateTime(2026, 8, 8, 22),
      );

      await pumpCard(tester, enCaja);

      expect(find.text(S.current.managerClosedPaidOffline), findsOneWidget);
      expect(find.text(S.current.managerUnpaidBadge), findsNothing,
          reason: 'Decía POR PAGAR para siempre sobre mesas ya cobradas.');
    });

    testWidgets('6· se fueron sin pagar con el checklist a medias: se dice CÓMO '
        'terminó y no se ofrece nada', (tester) async {
      final impaga = tab(ff: GroupFulfillmentStatus.preparing).copyWith(
        status: GroupOrderStatus.completed,
        closedReason: 'unpaid',
        closedAt: DateTime(2026, 8, 8, 22),
      );

      await pumpDetail(tester, impaga);

      expect(find.text(S.current.managerClosedUnpaid), findsOneWidget);
      expect(find.text(S.current.managerChecklistHint), findsNothing,
          reason: 'Invitaba a tocar los platos y el tap era silencio.');
      expect(find.text(S.current.managerMarkReady), findsNothing);
      expect(find.text(S.current.managerDeliverAllAndClose), findsNothing);
      expect(find.text(S.current.managerCloseTab), findsNothing,
          reason: 'Ya está cerrada: cerrarla de nuevo daría 409.');
    });

    testWidgets('7· pagada POR LA APP con la última tanda en el horno: se dice '
        'que la cuenta cerró, no que está entregada', (tester) async {
      // Sin `closed_reason` porque el cobro fue por Foodly: el ciclo normal.
      // Es el mismo cartel del caso 4, y la razón por la que no puede afirmar
      // nada sobre la cocina.
      final pagadaEnApp = tab(ff: GroupFulfillmentStatus.preparing).copyWith(
        status: GroupOrderStatus.completed,
        totalPaid: 12,
      );

      await pumpDetail(tester, pagadaEnApp);

      expect(find.text(S.current.managerTabClosedTitle), findsOneWidget);
      expectNoDeliveredClaim('la comida sigue en la cocina');
      expect(find.text(S.current.managerCloseTab), findsNothing,
          reason: 'Ya entró el dinero: cerrarla en caja la cobraría dos veces.');
    });
  });

  // ══════════════════════════════════════════════════════════════════
  //  PREPAGO POR RONDA — el otro modo, las mismas pantallas
  // ══════════════════════════════════════════════════════════════════

  group('walk de pantalla · PREPAGO', () {
    GroupOrderDM round({GroupFulfillmentStatus? ff}) => listable(GroupOrders.perRound(
          items: [GroupOrders.pendingItem(uuid: 'i1', price: 17, participantUuid: 'p1')],
          fulfillment: ff,
        ));

    testWidgets('1· la comanda es la orden ENTERA: acá no hay tandas',
        (tester) async {
      await pumpDetail(tester, round(ff: GroupFulfillmentStatus.preparing));

      // `sent_at` es SIEMPRE null en prepago. Filtrar la comanda por él dejó
      // el checklist vacío y rompió el modo entero (13 tests en rojo,
      // 2026-08-06): el mismo filtro correcto para cuenta abierta.
      expect(find.text(S.current.managerItemsDelivered(0, 1)), findsOneWidget);
      expect(find.text(S.current.managerChecklistHint), findsOneWidget);
      expect(find.text(S.current.managerMarkReady), findsOneWidget);
    });

    testWidgets('2· llega PAGADA y nunca ofrece cerrarse en caja', (tester) async {
      final o = round(ff: GroupFulfillmentStatus.preparing);

      await pumpCard(tester, o);
      expect(find.text(S.current.managerPaidComplete), findsOneWidget);
      expect(find.text(S.current.managerUnpaidBadge), findsNothing);

      await pumpDetail(tester, o);
      expect(find.text(S.current.managerCloseTab), findsNothing,
          reason: 'Marcar "cobrada en caja" algo ya cobrado por la app dejaría '
              'al comensal pagando dos veces.');
    });

    testWidgets('3· servida: cierra el ciclo sin CTA pendiente', (tester) async {
      await pumpDetail(tester, round(ff: GroupFulfillmentStatus.delivered));

      expect(find.text(S.current.managerItemsDelivered(1, 1)), findsOneWidget);
      expect(find.text(S.current.managerChecklistHint), findsNothing);
      expect(find.text(S.current.managerMarkReady), findsNothing);
      expect(find.text(S.current.managerBadgeDelivered), findsNWidgets(2),
          reason: 'El paso del stepper MÁS la afirmación: acá sí está servida.');
    });
  });

  // ══════════════════════════════════════════════════════════════════
  //  EL COMENSAL — el pie de la orden, que es donde ocurre el dinero
  // ══════════════════════════════════════════════════════════════════
  //
  // `openTabCtaState` ya está testeado como lógica pura (A1→A4 + billed).
  // Esto es lo otro: que el pie DIBUJE ese estado — etiqueta, subtítulo,
  // botón habilitado o no, y la salida a "Pedir más".

  group('walk de pantalla · COMENSAL (pie de la orden)', () {
    Future<void> pumpFooter(
      WidgetTester tester,
      GroupOrderDM order, {
      double myShare = 0,
      VoidCallback? onSend,
      VoidCallback? onRequestBill,
      VoidCallback? onOrderMore,
      VoidCallback? onPay,
      VoidCallback? onLock,
    }) =>
        tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: GroupOrderTotalsFooter(
              order: order,
              myShare: myShare,
              onSend: onSend,
              onRequestBill: onRequestBill,
              onOrderMore: onOrderMore,
              onPay: onPay,
              onLock: onLock,
            ),
          ),
        ));

    bool ctaEnabled(WidgetTester tester, String label) =>
        !tester.widget<CustomNeumorphicButton>(find.widgetWithText(CustomNeumorphicButton, label)).disabled;

    GroupOrderDM conHost(GroupOrderDM o) => o.copyWith(participants: const [host]);

    testWidgets('A1 · con platos en el carrito: "Enviar orden", sin salida a '
        'pedir más', (tester) async {
      final carrito = conHost(GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [
          GroupOrders.sentItem(uuid: 'i1', price: 12, delivered: true, participantUuid: 'p1'),
          GroupOrders.pendingItem(uuid: 'c1', price: 6, participantUuid: 'p1'),
        ],
      ));

      await pumpFooter(tester, carrito, onSend: () {}, onOrderMore: () {});

      expect(find.text(S.current.groupOrderSendCta), findsOneWidget);
      expect(find.text(S.current.groupOrderSendHint), findsOneWidget);
      expect(ctaEnabled(tester, S.current.groupOrderSendCta), isTrue);
      expect(find.text(S.current.groupOrderOrderMore), findsNothing,
          reason: 'Ya está pidiendo más: el atajo sería ruido.');
    });

    testWidgets('A2 · comida en la cocina: el pago está BLOQUEADO y se dice '
        'por qué', (tester) async {
      final esperando = conHost(GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.preparing,
        items: [GroupOrders.sentItem(uuid: 'i1', price: 12, participantUuid: 'p1')],
      ));

      await pumpFooter(tester, esperando, onRequestBill: () {}, onOrderMore: () {});

      final label = S.current.groupOrderPayBillCta('€12.00');
      expect(find.text(label), findsOneWidget);
      expect(ctaEnabled(tester, label), isFalse,
          reason: 'Pagar antes de que sirvan deja al comensal sin recurso.');
      expect(find.text(S.current.groupOrderPayBlockedHint), findsOneWidget);
      expect(find.text(S.current.groupOrderOrderMore), findsOneWidget,
          reason: 'Mientras espera es justo cuando quiere sumar otra cosa.');
    });

    testWidgets('A3 · todo servido: se habilita pagar la cuenta', (tester) async {
      var pidioLaCuenta = false;
      final servida = conHost(GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [GroupOrders.sentItem(uuid: 'i1', price: 12, participantUuid: 'p1')],
      ));

      await pumpFooter(tester, servida,
          onRequestBill: () => pidioLaCuenta = true, onOrderMore: () {});

      final label = S.current.groupOrderPayBillCta('€12.00');
      expect(find.text(S.current.groupOrderPayBillHint), findsOneWidget);
      expect(ctaEnabled(tester, label), isTrue);

      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
      expect(pidioLaCuenta, isTrue);
    });

    testWidgets('A4 · cuenta pedida: cae al bloque de pago de siempre',
        (tester) async {
      final pedida = conHost(GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [GroupOrders.sentItem(uuid: 'i1', price: 12, participantUuid: 'p1')],
        billRequestedAt: DateTime(2026, 8, 8, 22),
      )).copyWith(status: GroupOrderStatus.locked);

      await pumpFooter(tester, pedida, myShare: 12, onPay: () {});

      // El CTA muestra el TOTAL real: la parte MÁS la tarifa fija del
      // comensal — nunca un monto menor al que verá en el PaymentSheet.
      expect(find.text(S.current.groupOrderPayFullOrder('€12.25')), findsOneWidget);
      expect(find.text(S.current.groupOrderSendCta), findsNothing);
      expect(find.text(S.current.groupOrderPayBlockedHint), findsNothing);
    });

    testWidgets('PREPAGO · el pie NUNCA ofrece el CTA de cuenta abierta',
        (tester) async {
      // Con prepago la orden se cierra y se paga: no hay tandas ni cuenta que
      // pedir. Que asomara cualquiera de esos textos sería ceguera de modo.
      final enCarrito = conHost(GroupOrders.openCart(mode: GroupPaymentMode.perRound));

      await pumpFooter(tester, enCarrito, onLock: () {}, onSend: () {}, onRequestBill: () {});

      expect(find.text(S.current.groupOrderLockCta), findsOneWidget);
      expect(find.text(S.current.groupOrderSendCta), findsNothing);
      expect(find.text(S.current.groupOrderSendHint), findsNothing);
      expect(find.text(S.current.groupOrderPayBlockedHint), findsNothing);
    });
  });
}
