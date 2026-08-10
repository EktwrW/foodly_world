import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

import 'fixtures/group_order_fixtures.dart' show GroupOrders;

/// F4b — máquina de estados del CTA de cuenta abierta (maquetas A1-A4):
/// A1 hay ítems sin enviar        → send    ("Enviar orden")
/// A2 tanda en cocina sin entregar → waiting (pago BLOQUEADO)
/// A3 todo enviado y entregado     → pay     ("Pagar la cuenta")
/// A4 pidieron más tras entrega    → send    (el pago se re-bloquea)
/// Lógica PURA sobre el DM — la UI solo pinta lo que esto devuelve.

void main() {
  GroupOrderItemDM item({
    required String uuid,
    double price = 10,
    int qty = 1,
    DateTime? sentAt,
    int? batchNo,
    DateTime? deliveredAt,
  }) =>
      GroupOrderItemDM(
        uuid: uuid,
        name: 'Plato $uuid',
        unitPricePreview: price,
        quantity: qty,
        sentAt: sentAt,
        batchNo: batchNo,
        deliveredAt: deliveredAt,
      );

  GroupOrderDM order({
    GroupPaymentMode mode = GroupPaymentMode.openTab,
    GroupOrderStatus status = GroupOrderStatus.open,
    List<GroupOrderItemDM> items = const [],
    DateTime? billRequestedAt,
  }) =>
      GroupOrderDM(
        uuid: 'o1',
        status: status,
        paymentMode: mode,
        items: items,
        billRequestedAt: billRequestedAt,
      );

  final sent = DateTime(2026, 8, 4, 20);
  final delivered = DateTime(2026, 8, 4, 20, 30);

  group('openTabCtaState', () {
    test('A1 · ítems sin enviar → send', () {
      final o = order(items: [item(uuid: 'a'), item(uuid: 'b')]);
      expect(o.openTabCtaState, OpenTabCtaState.send);
      expect(o.pendingItems.length, 2);
      expect(o.sentTotal, 0);
    });

    test('A2 · todo enviado pero SIN entregar → waiting (pago bloqueado)', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [item(uuid: 'a', sentAt: sent, batchNo: 1)],
      );
      expect(o.openTabCtaState, OpenTabCtaState.waiting);
    });

    test('A2b · entrega PARCIAL de la tanda sigue bloqueando el pago', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', sentAt: sent, batchNo: 1, deliveredAt: delivered),
          item(uuid: 'b', sentAt: sent, batchNo: 1),
        ],
      );
      expect(o.openTabCtaState, OpenTabCtaState.waiting);
    });

    test('A3 · todo enviado y entregado → pay, con el total de lo enviado', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', price: 12, sentAt: sent, batchNo: 1, deliveredAt: delivered),
          item(uuid: 'b', price: 8, qty: 2, sentAt: sent, batchNo: 1, deliveredAt: delivered),
        ],
      );
      expect(o.openTabCtaState, OpenTabCtaState.pay);
      expect(o.sentTotal, 28);
      expect(o.lastBatchNo, 1);
    });

    test('A4 · ítems nuevos tras la entrega → vuelve a send (pago re-bloqueado)', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', price: 12, sentAt: sent, batchNo: 1, deliveredAt: delivered),
          item(uuid: 'postre', price: 6), // sin enviar
        ],
      );
      expect(o.openTabCtaState, OpenTabCtaState.send);
      expect(o.pendingTotal, 6);
      expect(o.sentTotal, 12, reason: 'la cuenta acumulada no cuenta lo no enviado');
    });

    test('cuenta pedida (bill_requested_at o locked) → billed', () {
      final withBill = order(
        status: GroupOrderStatus.confirmed,
        items: [item(uuid: 'a', sentAt: sent, batchNo: 1, deliveredAt: delivered)],
        billRequestedAt: DateTime(2026, 8, 4, 21),
      );
      expect(withBill.openTabCtaState, OpenTabCtaState.billed);

      final locked = order(
        status: GroupOrderStatus.locked,
        items: [item(uuid: 'a', sentAt: sent, batchNo: 1, deliveredAt: delivered)],
      );
      expect(locked.openTabCtaState, OpenTabCtaState.billed);
    });

    test('orden vacía → send (nada que pagar todavía)', () {
      expect(order().openTabCtaState, OpenTabCtaState.send);
    });

    test('tandas múltiples: lastBatchNo y totales acumulados', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', sentAt: sent, batchNo: 1, deliveredAt: delivered),
          item(uuid: 'b', price: 5, sentAt: sent, batchNo: 2, deliveredAt: delivered),
          item(uuid: 'c', price: 3, sentAt: sent, batchNo: 3),
        ],
      );
      expect(o.lastBatchNo, 3);
      expect(o.sentTotal, 18);
      expect(o.openTabCtaState, OpenTabCtaState.waiting, reason: 'la tanda 3 no llegó');
    });
  });

  group('F4b — la mesa avisa que paga en caja (2026-08-09)', () {
    GroupOrderDM tabAwaitingCash() => GroupOrders.openTab(
          fulfillment: GroupFulfillmentStatus.delivered,
          items: [GroupOrders.sentItem(price: 24, delivered: true)],
          cashRequestedAt: DateTime(2026, 8, 9, 22),
        );

    test('el CTA pasa a `cash`, no a `billed`', () {
      // `billed` cae al bloque de pago de la app, y acá justamente NO hay que
      // ofrecer pagar: el dinero se entrega en el mostrador.
      expect(tabAwaitingCash().openTabCtaState, OpenTabCtaState.cash);
    });

    test('el carrito queda congelado', () {
      // El total ya se lo llevaron a la caja: sumar un postre después dejaría
      // al negocio cobrando un importe distinto al que la mesa ve.
      expect(tabAwaitingCash().isEditableCart, isFalse);
    });

    test('sin aviso, todo servido sigue siendo `pay`', () {
      final servida = GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [GroupOrders.sentItem(price: 24, delivered: true)],
      );

      expect(servida.openTabCtaState, OpenTabCtaState.pay);
      expect(servida.isEditableCart, isTrue);
    });

    test('el cierre del negocio le gana al aviso', () {
      // Cobrada y cerrada, lo que manda es el cierre — no el aviso que lo
      // precedió. Si no, el comensal seguiría viendo "esperá al mesero"
      // después de haber pagado.
      final cerrada = tabAwaitingCash().copyWith(
        status: GroupOrderStatus.completed,
        closedReason: 'paid_offline',
        closedAt: DateTime(2026, 8, 9, 22, 30),
      );

      expect(cerrada.isAwaitingCashPayment, isFalse);
      expect(cerrada.openTabCtaState, OpenTabCtaState.billed);
    });
  });

  group('F4b.1 — ítems anulados por el negocio (plato devuelto)', () {
    GroupOrderItemDM voided(String uuid, {double price = 10}) => GroupOrderItemDM(
          uuid: uuid,
          name: 'Plato $uuid',
          unitPricePreview: price,
          sentAt: sent,
          batchNo: 1,
          voidedAt: DateTime(2026, 8, 5, 21),
          voidedReason: 'Plato devuelto',
        );

    test('no cuentan para el checklist ni bloquean la entrega', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', sentAt: sent, batchNo: 1, deliveredAt: delivered),
          voided('b'),
        ],
      );

      expect(o.liveItemsCount, 1);
      expect(o.deliveredItemsCount, 1);
      expect(o.allItemsDelivered, isTrue, reason: 'el anulado no puede dejar la orden colgada para siempre');
    });

    test('no suman a la cuenta y no bloquean el pago', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', price: 12, sentAt: sent, batchNo: 1, deliveredAt: delivered),
          voided('b', price: 30),
        ],
      );

      expect(o.sentTotal, 12, reason: 'el anulado no se cobra');
      expect(o.openTabCtaState, OpenTabCtaState.pay);
    });

    test('un anulado sin enviar tampoco cuenta como pendiente', () {
      final o = order(
        status: GroupOrderStatus.confirmed,
        items: [
          item(uuid: 'a', sentAt: sent, batchNo: 1, deliveredAt: delivered),
          GroupOrderItemDM(
            uuid: 'z',
            name: 'Cancelado antes de enviar',
            unitPricePreview: 8,
            voidedAt: DateTime(2026, 8, 5, 21),
          ),
        ],
      );

      expect(o.pendingItems, isEmpty);
      expect(o.openTabCtaState, OpenTabCtaState.pay);
    });
  });

  group('isTracking en cuenta abierta (el cliente no pierde su mesa)', () {
    GroupOrderDM tracking({
      required GroupPaymentMode mode,
      GroupFulfillmentStatus? fulfillment,
      Duration age = const Duration(minutes: 20),
    }) =>
        GroupOrderDM(
          uuid: 'o1',
          status: GroupOrderStatus.confirmed,
          paymentMode: mode,
          fulfillmentStatus: fulfillment,
          confirmedAt: DateTime.now().subtract(age),
          // Una cuenta abierta llega a `confirmed` ENVIANDO una tanda, y
          // `sendBatch` deja total_amount = subtotal. Un total de 0 describía
          // una orden que el backend no puede producir, y escondía que lo
          // que mantiene viva la orden es el dinero pendiente (2026-08-06).
          totalAmount: 40,
        );

    test('open_tab ENTREGADA sigue en tracking — falta pagar la cuenta', () {
      final o = tracking(
        mode: GroupPaymentMode.openTab,
        fulfillment: GroupFulfillmentStatus.delivered,
      );
      expect(o.isTracking, isTrue, reason: 'sin esto el chip desaparece justo antes de pagar');
    });

    test('per_round ENTREGADA cierra el tracking (ya estaba pagada)', () {
      final o = tracking(
        mode: GroupPaymentMode.perRound,
        fulfillment: GroupFulfillmentStatus.delivered,
      );
      expect(o.isTracking, isFalse);
    });

    test('el TTL de 12h aplica a ambos modos', () {
      expect(
        tracking(mode: GroupPaymentMode.openTab, age: const Duration(hours: 13)).isTracking,
        isFalse,
      );
      expect(
        tracking(mode: GroupPaymentMode.perRound, age: const Duration(hours: 13)).isTracking,
        isFalse,
      );
    });
  });

  group('modo de cobro', () {
    test('per_round (default) no es cuenta abierta', () {
      expect(order(mode: GroupPaymentMode.perRound).isOpenTab, isFalse);
      expect(const GroupOrderDM(uuid: 'x').isOpenTab, isFalse, reason: 'default seguro: per_round');
    });

    test('parsing: payment_mode desconocido degrada a per_round', () {
      final o = GroupOrderDM.fromJson(const {
        'uuid': 'x',
        'status': 'open',
        'payment_mode': 'algo_nuevo',
      });
      expect(o.paymentMode, GroupPaymentMode.perRound);
    });

    test('parsing: batch_no/sent_at viajan al ítem', () {
      final o = GroupOrderDM.fromJson(const {
        'uuid': 'x',
        'status': 'confirmed',
        'payment_mode': 'open_tab',
        'items': [
          {
            'uuid': 'i1',
            'name_snapshot': 'Sashimi',
            'unit_price_preview': 12,
            'batch_no': 2,
            'sent_at': '2026-08-04T20:00:00Z',
          },
        ],
      });
      expect(o.isOpenTab, isTrue);
      expect(o.items.single.batchNo, 2);
      expect(o.items.single.isSent, isTrue);
    });
  });
}
