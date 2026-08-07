// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/active_group_order_chip.dart';

/// e2e F4b — el chip informa el ESTADO de cocina: "¡Listo!" es la señal que
/// hace valioso el feature en mostrador y debe verse sin entrar a la orden.

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  final t0 = DateTime(2026, 8, 5, 20);

  GroupOrderDM order({
    GroupOrderStatus status = GroupOrderStatus.open,
    GroupFulfillmentStatus? fulfillment,
    GroupPaymentMode mode = GroupPaymentMode.openTab,
  }) =>
      GroupOrderDM(
        uuid: 'o1',
        status: status,
        paymentMode: mode,
        fulfillmentStatus: fulfillment,
        confirmedAt: status == GroupOrderStatus.open ? null : t0,
        subtotal: 26,
        items: [
          GroupOrderItemDM(
            uuid: 'i1',
            name: 'Plato',
            unitPricePreview: 26,
            sentAt: status == GroupOrderStatus.open ? null : t0,
            batchNo: status == GroupOrderStatus.open ? null : 1,
            // Coherencia con el BE (e2e 2026-08-06): la orden solo llega a
            // ENTREGADA vía maybeAutoDeliver, que exige que TODOS los ítems
            // vivos estén entregados. Un agregado "delivered" con ítems sin
            // entregar es un estado que el backend no puede producir; el
            // fixture lo fabricaba y por eso el chip parecía correcto.
            deliveredAt: fulfillment == GroupFulfillmentStatus.delivered ? t0 : null,
          ),
        ],
      );

  Future<void> pump(WidgetTester tester, GroupOrderDM o) => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ActiveGroupOrderChip(order: o, onTap: () {})),
        ),
      );

  testWidgets('carrito abierto: "Ver pedido · €X" (comportamiento previo)',
      (tester) async {
    await pump(tester, order());
    expect(find.textContaining(S.current.groupOrderViewOrder), findsOneWidget);
    expect(find.textContaining('€26.00'), findsOneWidget);
  });

  testWidgets('preparando: el chip lo dice', (tester) async {
    await pump(tester, order(
      status: GroupOrderStatus.confirmed,
      fulfillment: GroupFulfillmentStatus.preparing,
    ));
    expect(find.text(S.current.groupOrderChipPreparing), findsOneWidget);
  });

  testWidgets('LISTA: el chip grita el estado (señal de mostrador)',
      (tester) async {
    await pump(tester, order(
      status: GroupOrderStatus.confirmed,
      fulfillment: GroupFulfillmentStatus.ready,
    ));
    expect(find.text(S.current.groupOrderChipReady), findsOneWidget);
  });

  testWidgets('cuenta abierta entregada: el chip invita a pagar', (tester) async {
    await pump(tester, order(
      status: GroupOrderStatus.confirmed,
      fulfillment: GroupFulfillmentStatus.delivered,
    ));
    expect(find.textContaining('€26.00'), findsOneWidget);
  });

  testWidgets('confirmada sin fulfillment: "Pedido enviado"', (tester) async {
    await pump(tester, order(status: GroupOrderStatus.confirmed));
    expect(find.text(S.current.groupOrderChipSent), findsOneWidget);
  });

  // ── Chip y footer, una sola verdad (e2e 2026-08-06) ────────────────
  //
  // El chip derivaba su etiqueta de fulfillmentStatus a secas mientras el
  // footer usaba openTabCtaState: con un plato en el carrito el footer decía
  // "Enviar orden" y el chip seguía diciendo "Pagar la cuenta".

  /// Cuenta abierta ya entregada + un ítem NUEVO sin enviar (el caso del
  /// comensal que repite plato).
  GroupOrderDM withPendingItem() => GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        fulfillmentStatus: GroupFulfillmentStatus.delivered,
        confirmedAt: t0,
        subtotal: 52,
        items: [
          GroupOrderItemDM(
            uuid: 'i1',
            name: 'Plato',
            unitPricePreview: 26,
            sentAt: t0,
            batchNo: 1,
            deliveredAt: t0,
          ),
          // Repetido: aún en el carrito.
          const GroupOrderItemDM(uuid: 'i2', name: 'Plato', unitPricePreview: 26),
        ],
      );

  testWidgets('con ítems sin enviar el chip dice "Enviar orden", no "Pagar"',
      (tester) async {
    final o = withPendingItem();
    expect(o.openTabCtaState, OpenTabCtaState.send, reason: 'Precondición de la máquina pura.');

    await pump(tester, o);

    expect(find.text(S.current.groupOrderSendCta), findsOneWidget);
    expect(
      find.textContaining(S.current.groupOrderChipToPay('')),
      findsNothing,
      reason: 'Prometer "pagar" oculta que la cocina todavía no vio el plato.',
    );
  });

  testWidgets('sin ítems pendientes vuelve a invitar a pagar', (tester) async {
    await pump(tester, order(
      status: GroupOrderStatus.confirmed,
      fulfillment: GroupFulfillmentStatus.delivered,
    ));
    expect(find.text(S.current.groupOrderSendCta), findsNothing);
  });

  // ── El agregado miente; los ítems no (e2e 2026-08-06) ──────────────
  //
  // `fulfillmentStatus` es UN enum a nivel de orden: un resumen con pérdida
  // de lo que pasa por tanda. Estos son los dos casos reales donde mentía.

  GroupOrderDM openTab({
    required GroupFulfillmentStatus fulfillment,
    required List<GroupOrderItemDM> items,
  }) =>
      GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        fulfillmentStatus: fulfillment,
        confirmedAt: t0,
        subtotal: 26,
        items: items,
      );

  GroupOrderItemDM sent(String uuid, {DateTime? delivered, DateTime? voided, int batch = 1}) =>
      GroupOrderItemDM(
        uuid: uuid,
        name: 'Plato',
        unitPricePreview: 26,
        sentAt: t0,
        batchNo: batch,
        deliveredAt: delivered,
        voidedAt: voided,
      );

  testWidgets('entregada y luego el negocio ANULA un plato: no dice "preparando"',
      (tester) async {
    // El BE revierte el agregado a preparing, pero lo único que quedaba vivo
    // ya estaba entregado: no hay nada en cocina.
    final o = openTab(
      fulfillment: GroupFulfillmentStatus.preparing,
      items: [
        sent('i1', delivered: t0),
        sent('i2', voided: t0),
      ],
    );
    expect(o.openTabCtaState, OpenTabCtaState.pay);

    await pump(tester, o);

    expect(find.text(S.current.groupOrderChipPreparing), findsNothing);
    expect(find.textContaining('€26.00'), findsOneWidget);
  });

  testWidgets('tanda 2 enviada Y entregada: no se queda en "preparando"',
      (tester) async {
    final o = openTab(
      fulfillment: GroupFulfillmentStatus.preparing, // agregado obsoleto
      items: [
        sent('i1', delivered: t0, batch: 1),
        sent('i2', delivered: t0, batch: 2),
      ],
    );
    expect(o.openTabCtaState, OpenTabCtaState.pay);

    await pump(tester, o);

    expect(find.text(S.current.groupOrderChipPreparing), findsNothing);
  });

  testWidgets('con algo REALMENTE en cocina sí muestra el estado', (tester) async {
    final enCocina = openTab(
      fulfillment: GroupFulfillmentStatus.preparing,
      items: [sent('i1', delivered: t0), sent('i2', batch: 2)], // i2 sin entregar
    );
    expect(enCocina.openTabCtaState, OpenTabCtaState.waiting);
    await pump(tester, enCocina);
    expect(find.text(S.current.groupOrderChipPreparing), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());

    final lista = openTab(
      fulfillment: GroupFulfillmentStatus.ready,
      items: [sent('i1', delivered: t0), sent('i2', batch: 2)],
    );
    await pump(tester, lista);
    expect(find.text(S.current.groupOrderChipReady), findsOneWidget);
  });

  // Invariante: el chip NUNCA puede hablar de cocina si no hay nada esperando.
  test('invariante: sin ítems enviados sin entregar, jamás estado de cocina', () {
    for (final f in GroupFulfillmentStatus.values) {
      final o = openTab(fulfillment: f, items: [sent('i1', delivered: t0)]);
      expect(
        o.openTabCtaState,
        OpenTabCtaState.pay,
        reason: 'Con todo entregado, "$f" en el agregado es irrelevante.',
      );
    }
  });
}
