// ignore_for_file: avoid_redundant_argument_values

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

  // e2e 2026-08-08 — faltaban los terminales y `paying`. Todo el trabajo de
  // ese día (isTerminal, canVoidItems, el CTA en cuenta cerrada, y los
  // estados que el panel empezó a listar) caía FUERA del producto cartesiano,
  // así que los invariantes no podían cazarlo. El propio encabezado de este
  // archivo dice que al agregar una dimensión al dominio se agrega acá
  // primero; se agregó una y no se hizo.
  final statuses = <GroupOrderStatus>[
    GroupOrderStatus.open,
    GroupOrderStatus.confirmed,
    GroupOrderStatus.locked,
    GroupOrderStatus.paying,
    GroupOrderStatus.completed,
    GroupOrderStatus.cancelled,
    GroupOrderStatus.expired,
  ];

  /// Todas las órdenes posibles con 2 ítems (36 formas) × estados.
  ///
  /// `totalPaid` es dimensión desde el 2026-08-12 (R2) y por defecto sigue en
  /// 0, que es lo que asumían todos los invariantes anteriores. Sin ella, la
  /// mesa parcialmente pagada —tres pagan por la app, el cuarto se va— no
  /// existía en el producto cartesiano, y el gate de cierre que la escondía
  /// pasó una suite verde. Misma lección que la nota de los estados de arriba:
  /// la dimensión se agrega ACÁ primero.
  Iterable<GroupOrderDM> allOrders({
    required GroupPaymentMode mode,
    double totalPaid = 0,
  }) sync* {
    for (final a in itemShapes.entries) {
      for (final b in itemShapes.entries) {
        for (final status in statuses) {
          for (final f in fulfillments) {
            yield GroupOrderDM(
              uuid: 'o-${a.key}-${b.key}-${status.name}-${f?.name}-p$totalPaid',
              status: status,
              paymentMode: mode,
              fulfillmentStatus: f,
              confirmedAt: status == GroupOrderStatus.open ? null : t0,
              // Una orden confirmada SIEMPRE tiene importe (`sendBatch` deja
              // total_amount = subtotal). Sin esto, `isTracking` devolvía
              // false por importe cero y el test del TTL de 12h pasaba sin
              // llegar a evaluar el TTL (2026-08-06).
              totalAmount: status == GroupOrderStatus.open ? 0 : 40,
              totalPaid: totalPaid,
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
        // "Falta servir" se mide en términos de COCINA: un plato que sigue
        // en el carrito de la mesa no está pendiente de servir, porque el
        // negocio ni siquiera lo ha visto (e2e 2026-08-06). Antes esto usaba
        // liveItems y por eso un carrito bloqueaba una tanda ya completa.
        final faltaServir = o.kitchenItems.any((i) => i.deliveredAt == null);
        if (!faltaServir) continue;
        // allItemsDelivered es la fuente de verdad de la UI del panel.
        expect(o.allItemsDelivered, isFalse, reason: o.uuid);
      }
    });

    // e2e 2026-08-08 — la regla que la UI debe respetar en TODO estado: el
    // backend solo acepta acciones de cocina con la orden `confirmed`. Tres
    // widgets se arreglaron con "no terminal", que deja pasar `locked` y
    // `paying`; este invariante lo caza en cualquier combinación.
    test('fuera de CONFIRMED, ninguna acción de cocina es ofrecible', () {
      for (final mode in GroupPaymentMode.values) {
        for (final o in allOrders(mode: mode)) {
          if (o.status == GroupOrderStatus.confirmed) continue;
          expect(
            o.isConfirmed,
            isFalse,
            reason: '${o.uuid}: la UI debe gatear por isConfirmed, no por isTerminal',
          );
        }
      }
    });

    test('anular ítems espeja al backend en TODO estado', () {
      for (final mode in GroupPaymentMode.values) {
        for (final o in allOrders(mode: mode)) {
          if (!o.canVoidItems) continue;
          // Las cuatro cláusulas de setItemVoided.
          expect(o.isTerminal, isFalse, reason: o.uuid);
          expect(o.totalPaid <= 0, isTrue, reason: o.uuid);
          expect(o.billRequestedAt, isNull, reason: o.uuid);
          expect(
            o.status == GroupOrderStatus.open || o.status == GroupOrderStatus.confirmed,
            isTrue,
            reason: o.uuid,
          );
        }
      }
    });

    // R2 (2026-08-12) — el gate de cierre escondía el ÚNICO desenlace posible
    // de la mesa parcialmente pagada. Exigía `totalPaid <= 0` y no aceptaba
    // `paying`, así que la escondía dos veces: por importe y por estado. Es el
    // lado Flutter del mismo bloqueante que se cerró en el backend.
    test('cerrar la cuenta espeja a close() en TODO estado y con dinero dentro', () {
      for (final mode in GroupPaymentMode.values) {
        for (final paid in [0.0, 20.0, 40.0]) {
          for (final o in allOrders(mode: mode, totalPaid: paid)) {
            if (!o.canBeClosedByBusiness) continue;
            // Las cuatro cláusulas que el backend evalúa en `close()`.
            expect(o.isOpenTab, isTrue, reason: o.uuid);
            expect(o.closedAt, isNull, reason: o.uuid);
            expect(
              o.status == GroupOrderStatus.confirmed ||
                  o.status == GroupOrderStatus.locked ||
                  o.status == GroupOrderStatus.paying,
              isTrue,
              reason: o.uuid,
            );
            expect(o.hasProcessingPayment, isFalse, reason: o.uuid);
            // Lo que abre la puerta es el SALDO PENDIENTE, no el pago: sin
            // nada que cobrar en el local el motivo sería falso.
            expect(o.isFullyPaid, isFalse, reason: o.uuid);
          }
        }
      }
    });

    test('la mesa con pago parcial SÍ ofrece cerrar (R2)', () {
      // El caso exacto: cuatro comensales, dos pagaron por la app, los otros
      // se fueron. Con el primer pago la orden pasó a `paying`.
      final o = GroupOrderDM(
        uuid: 'mesa-a-medio-pagar',
        status: GroupOrderStatus.paying,
        paymentMode: GroupPaymentMode.openTab,
        fulfillmentStatus: GroupFulfillmentStatus.delivered,
        confirmedAt: t0,
        billRequestedAt: t0.add(const Duration(hours: 1)),
        totalAmount: 40,
        totalPaid: 20,
        items: [itemShapes['entregado']!('a'), itemShapes['entregado']!('b')],
      );

      expect(o.canBeClosedByBusiness, isTrue,
          reason: 'sin esto el negocio no tiene NINGÚN botón para esta mesa');
    });

    test('un pago en vuelo sigue bloqueando el cierre', () {
      // El contrapeso: abrir el gate no puede regalar 409s. El backend
      // rechaza cerrar mientras alguien tiene el PaymentSheet abierto.
      final o = GroupOrderDM(
        uuid: 'mesa-con-pago-en-vuelo',
        status: GroupOrderStatus.paying,
        paymentMode: GroupPaymentMode.openTab,
        confirmedAt: t0,
        totalAmount: 40,
        totalPaid: 20,
        participants: const [
          GroupOrderParticipantDM(
            uuid: 'p1',
            paymentStatus: GroupPaymentStatus.processing,
          ),
        ],
        items: [itemShapes['entregado']!('a'), itemShapes['entregado']!('b')],
      );

      expect(o.canBeClosedByBusiness, isFalse, reason: o.uuid);
    });

    test('en PREPAGO nunca se ofrece cerrar, con o sin dinero dentro', () {
      // El otro modo. En prepago la comanda no llega a cocina hasta estar
      // 100% cobrada, y el backend rechaza `partially_paid` fuera de cuenta
      // abierta: su desenlace es expirar y reembolsar, no cerrar.
      for (final paid in [0.0, 20.0, 40.0]) {
        for (final o in allOrders(mode: GroupPaymentMode.perRound, totalPaid: paid)) {
          expect(o.canBeClosedByBusiness, isFalse, reason: o.uuid);
        }
      }
    });

    test('una orden terminal nunca ofrece enviar ni pagar', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        if (!o.isTerminal) continue;
        expect(
          o.openTabCtaState,
          OpenTabCtaState.billed,
          reason: '${o.uuid}: tras cerrar la cuenta el CTA daba 409 mudo',
        );
        expect(o.isTracking, isFalse, reason: o.uuid);
      }
    });

    test('el carrito de la mesa NUNCA entra en la comanda del negocio', () {
      for (final o in allOrders(mode: GroupPaymentMode.openTab)) {
        expect(
          o.kitchenItems.every((i) => i.isSent && !i.isVoided),
          isTrue,
          reason: o.uuid,
        );
      }
    });

    test('en prepago la comanda es la orden ENTERA (no hay tandas)', () {
      for (final o in allOrders(mode: GroupPaymentMode.perRound)) {
        expect(
          o.kitchenItems.length,
          o.liveItems.length,
          reason: 'Pagar ES la comanda: filtrar por sent_at dejaba el '
              'checklist vacío y nada se entregaba (${o.uuid}).',
        );
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
          // Cuenta abierta entregada y SIN pagar: es el escenario que el test
          // describe. Sin el importe, el fixture modelaba una orden que el
          // backend no puede producir (`sendBatch` deja total_amount =
          // subtotal) y escondía que lo que la mantiene viva es el dinero.
          totalAmount: 40,
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

    // e2e 2026-08-06 — la cuenta abierta sigue viva tras la ENTREGA porque
    // falta pagar, pero MUERE con el pago. Antes `isTracking` devolvía true
    // sin mirar el dinero: una cuenta saldada seguía "viva" 12h, así que
    // syncAnyActive() la recuperaba en cada login y el chip la resucitaba
    // ofreciendo pagar algo ya pagado.
    test('cuenta abierta SALDADA deja de estar en tracking', () {
      final pagada = GroupOrderDM(
        uuid: 'saldada',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        fulfillmentStatus: GroupFulfillmentStatus.delivered,
        confirmedAt: DateTime.now().subtract(const Duration(minutes: 5)),
        totalAmount: 379.99,
        totalPaid: 379.99,
        items: [itemShapes['entregado']!('a')],
      );

      expect(pagada.isFullyPaid, isTrue);
      expect(pagada.isTracking, isFalse, reason: 'Pagada = terminada.');

      // Y con saldo pendiente sigue viva (no romper el caso que sí importa).
      expect(
        pagada.copyWith(totalPaid: 100.0).isTracking,
        isTrue,
        reason: 'Falta dinero: el cliente necesita el camino de vuelta.',
      );
    });

    test('una cuenta con TODO anulado deja de estar viva', () {
      // total_amount queda en 0, así que isFullyPaid (que exige > 0) es false.
      // Sin mirar los ítems vivos, la orden seguía en tracking 12h: el chip
      // ofrecía enviar una orden vacía y bloqueaba crear otra en el negocio.
      final anulada = GroupOrderDM(
        uuid: 'todo-anulado',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        fulfillmentStatus: GroupFulfillmentStatus.delivered,
        confirmedAt: DateTime.now().subtract(const Duration(minutes: 5)),
        totalAmount: 0,
        totalPaid: 0,
        items: [itemShapes['entregado-anulado']!('a')],
      );

      expect(anulada.liveItems, isEmpty);
      expect(anulada.isFullyPaid, isFalse, reason: 'Precondición: importe cero.');
      expect(anulada.totalRemaining, 0, reason: 'No queda nada que cobrar.');
      expect(anulada.isTracking, isFalse);
    });

    test('lo que mantiene viva la cuenta es el dinero pendiente, no el estado', () {
      GroupOrderDM tab({required double total, required double pagado}) => GroupOrderDM(
            uuid: 'tab',
            status: GroupOrderStatus.confirmed,
            paymentMode: GroupPaymentMode.openTab,
            fulfillmentStatus: GroupFulfillmentStatus.delivered,
            confirmedAt: DateTime.now().subtract(const Duration(minutes: 5)),
            totalAmount: total,
            totalPaid: pagado,
            items: [itemShapes['entregado']!('a')],
          );

      expect(tab(total: 40, pagado: 0).isTracking, isTrue, reason: 'Debe €40.');
      expect(tab(total: 40, pagado: 25).isTracking, isTrue, reason: 'Debe €15.');
      expect(tab(total: 40, pagado: 40).isTracking, isFalse, reason: 'Saldada.');
      expect(tab(total: 0, pagado: 0).isTracking, isFalse, reason: 'Nada que cobrar.');
    });

    test('el pago mata el tracking en CUALQUIER estado de cocina', () {
      for (final f in GroupFulfillmentStatus.values) {
        final o = GroupOrderDM(
          uuid: 'pagada-${f.name}',
          status: GroupOrderStatus.confirmed,
          paymentMode: GroupPaymentMode.openTab,
          fulfillmentStatus: f,
          confirmedAt: DateTime.now().subtract(const Duration(minutes: 5)),
          totalAmount: 50,
          totalPaid: 50,
          items: [itemShapes['entregado']!('a')],
        );
        expect(o.isTracking, isFalse, reason: f.name);
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
