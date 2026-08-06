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
}
