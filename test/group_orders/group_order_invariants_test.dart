import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// INVARIANTES del dominio Group Orders — reglas que deben cumplirse para
/// TODA combinación de (fulfillment × enviado × entregado × anulado), no
/// solo para los estados que se nos ocurrieron al escribir la feature.
///
/// Origen (e2e F4b 2026-08-05): tres bugs pasaron una suite verde porque
/// probábamos ESTADOS aislados y caminos felices. Estos tests recorren el
/// producto cartesiano de las dimensiones y afirman reglas absolutas.
///
/// Regla al agregar dimensiones al dominio: se agregan acá primero.

void main() {
  final t0 = DateTime(2026, 8, 5, 20);

  GroupOrderItemDM buildItem({
    required String uuid,
    required bool sent,
    required bool delivered,
    required bool voided,
    double price = 10,
  }) =>
      GroupOrderItemDM(
        uuid: uuid,
        name: 'Item $uuid',
        unitPricePreview: price,
        sentAt: sent ? t0 : null,
        batchNo: sent ? 1 : null,
        deliveredAt: delivered ? t0.add(const Duration(minutes: 30)) : null,
        voidedAt: voided ? t0.add(const Duration(minutes: 45)) : null,
      );

  /// Combinaciones VÁLIDAS de un ítem (entregado implica enviado).
  final itemShapes = <String, GroupOrderItemDM Function(String)>{
    'carrito': (u) => buildItem(uuid: u, sent: false, delivered: false, voided: false),
    'carrito-anulado': (u) => buildItem(uuid: u, sent: false, delivered: false, voided: true),
    'enviado': (u) => buildItem(uuid: u, sent: true, delivered: false, voided: false),
    'enviado-anulado': (u) => buildItem(uuid: u, sent: true, delivered: false, voided: true),
    'entregado': (u) => buildItem(uuid: u, sent: true, delivered: true, voided: false),
    'entregado-anulado': (u) => buildItem(uuid: u, sent: true, delivered: true, voided: true),
  };

  final fulfillments = <GroupFulfillmentStatus?>[
    null,
    GroupFulfillmentStatus.preparing,
    GroupFulfillmentStatus.ready,
    GroupFulfillmentStatus.delivered,
  ];

  final statuses = <GroupOrderStatus>[
    GroupOrderStatus.open,
    GroupOrderStatus.confirmed,
    GroupOrderStatus.locked,
  ];

  /// Todas las órdenes posibles con 2 ítems (36 formas) × estados.
  Iterable<GroupOrderDM> allOrders({required GroupPaymentMode mode}) sync* {
    for (final a in itemShapes.entries) {
      for (final b in itemShapes.entries) {
        for (final status in statuses) {
          for (final f in fulfillments) {
            yield GroupOrderDM(
              uuid: 'o-${a.key}-${b.key}-${status.name}-${f?.name}',
              status: status,
              paymentMode: mode,
              fulfillmentStatus: f,
              confirmedAt: status == GroupOrderStatus.open ? null : t0,
              items: [a.value('a'), b.value('b')],
            );
          }
        }
      }
    }
  }

  group('invariantes de ítems anulados', () {
    test('un ítem anulado NUNCA cuenta como vigente, pendiente ni enviado', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        for (final i in o.items.where((i) => i.isVoided)) {
          expect(o.liveItems.contains(i), isFalse, reason: o.uuid);
          expect(o.pendingItems.contains(i), isFalse, reason: o.uuid);
          expect(o.sentItems.contains(i), isFalse, reason: o.uuid);
        }
      }
    });

    test('los totales de la mesa nunca incluyen anulados', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        final expectedSent = o.items
            .where((i) => i.isSent && !i.isVoided)
            .fold<double>(0, (acc, i) => acc + i.lineTotal);
        expect(o.sentTotal, expectedSent, reason: o.uuid);
        expect(o.pendingTotal, greaterThanOrEqualTo(0), reason: o.uuid);
      }
    });

    test('deliveredItemsCount nunca supera a liveItemsCount', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        expect(o.deliveredItemsCount, lessThanOrEqualTo(o.liveItemsCount), reason: o.uuid);
      }
    });

    test('con TODOS los ítems anulados no hay nada que servir ni cobrar', () {
      final o = GroupOrderDM(
        uuid: 'todo-anulado',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        fulfillmentStatus: GroupFulfillmentStatus.preparing,
        confirmedAt: t0,
        items: [
          itemShapes['enviado-anulado']!('a'),
          itemShapes['entregado-anulado']!('b'),
        ],
      );
      expect(o.liveItemsCount, 0);
      expect(o.sentTotal, 0);
      // Sin ítems vigentes NO se considera "todo entregado" (no hay orden
      // que entregar) — el manager decide, no el sistema.
      expect(o.allItemsDelivered, isFalse);
    });
  });

  group('invariantes del CTA de cuenta abierta', () {
    test('JAMÁS ofrece pagar si queda algo sin enviar', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        if (o.pendingItems.isEmpty) continue;
        if (o.openTabCtaState == OpenTabCtaState.billed) continue; // cuenta ya pedida
        expect(o.openTabCtaState, OpenTabCtaState.send, reason: o.uuid);
      }
    });

    test('JAMÁS ofrece pagar si algo enviado sigue sin entregar', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        final faltaServir = o.sentItems.any((i) => i.deliveredAt == null);
        if (!faltaServir) continue;
        expect(o.openTabCtaState, isNot(OpenTabCtaState.pay), reason: o.uuid);
      }
    });

    test('el estado del CTA es total: siempre resuelve a un valor', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        expect(OpenTabCtaState.values.contains(o.openTabCtaState), isTrue, reason: o.uuid);
      }
    });

    test('locked/cuenta pedida SIEMPRE es billed (el checkout manda)', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        if (o.status != GroupOrderStatus.locked) continue;
        expect(o.openTabCtaState, OpenTabCtaState.billed, reason: o.uuid);
      }
    });
  });

  group('invariantes del panel del manager', () {
    test('si queda algo por servir, la orden NUNCA está "terminada" '
        '(bug e2e: tarjeta opaca con chip ENTREGADA y 2/3 ítems)', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        final faltaServir = o.liveItems.any((i) => i.deliveredAt == null);
        if (!faltaServir) continue;
        // allItemsDelivered es la fuente de verdad de la UI del panel.
        expect(o.allItemsDelivered, isFalse, reason: o.uuid);
      }
    });

    test('allItemsDelivered ⇒ el contador muestra N/N', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        if (!o.allItemsDelivered) continue;
        expect(o.deliveredItemsCount, o.liveItemsCount, reason: o.uuid);
        expect(o.liveItemsCount, greaterThan(0), reason: o.uuid);
      }
    });
  });

  group('invariantes del tracking del cliente', () {
    test('per_round: entregada cierra el tracking; open_tab: sigue hasta pagar', () {
      for (final mode in GroupPaymentMode.values) {
        final o = GroupOrderDM(
          uuid: 'track-${mode.name}',
          status: GroupOrderStatus.confirmed,
          paymentMode: mode,
          fulfillmentStatus: GroupFulfillmentStatus.delivered,
          confirmedAt: DateTime.now().subtract(const Duration(minutes: 5)),
          items: [itemShapes['entregado']!('a')],
        );
        expect(o.isTracking, mode == GroupPaymentMode.openTab, reason: mode.name);
      }
    });

    test('el TTL de 12h corta el tracking en CUALQUIER combinación', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        final viejo = o.copyWith(
          confirmedAt: DateTime.now().subtract(const Duration(hours: 13)),
        );
        expect(viejo.isTracking, isFalse, reason: o.uuid);
      }
    });

    test('una orden ABIERTA nunca está en tracking (todavía es carrito)', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        if (o.status != GroupOrderStatus.open) continue;
        expect(o.isTracking, isFalse, reason: o.uuid);
      }
    });
  });

  group('invariantes de per_round (regresión F4a)', () {
    test('per_round NUNCA usa el CTA de cuenta abierta', () {
      for (final o in allOrders(mode: GroupPaymentMode.perRound)) {
        expect(o.isOpenTab, isFalse, reason: o.uuid);
      }
    });

    test('los helpers de tandas son inocuos en per_round (todo sin enviar)', () {
      final o = GroupOrderDM(
        uuid: 'per-round',
        status: GroupOrderStatus.confirmed,
        confirmedAt: t0,
        items: [
          buildItem(uuid: 'a', sent: false, delivered: true, voided: false),
          buildItem(uuid: 'b', sent: false, delivered: false, voided: false),
        ],
      );
      expect(o.lastBatchNo, 0);
      expect(o.sentTotal, 0);
      // El checklist del manager sigue funcionando igual que en F4a.
      expect(o.deliveredItemsCount, 1);
      expect(o.liveItemsCount, 2);
      expect(o.allItemsDelivered, isFalse);
    });
  });
}
