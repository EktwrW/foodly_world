import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_chip_logic.dart';

/// Lógica pura del chip flotante global (e2e r4): visibilidad por ruta y
/// estado de la orden, dock inicial a la IZQUIERDA (a la derecha tapaba los
/// botones del FAB), clamping del drag y snap a borde.
void main() {
  const open = GroupOrderDM(uuid: 'o1');
  const locked = GroupOrderDM(uuid: 'o1', status: GroupOrderStatus.locked);
  // Tracking = confirmada RECIENTE (TTL 12h) sin entregar.
  final tracking = GroupOrderDM(
    uuid: 'o1',
    status: GroupOrderStatus.confirmed,
    confirmedAt: DateTime.now().subtract(const Duration(minutes: 30)),
  );
  final trackingStale = GroupOrderDM(
    uuid: 'o1',
    status: GroupOrderStatus.confirmed,
    confirmedAt: DateTime.now().subtract(const Duration(hours: 13)),
  );
  final delivered = GroupOrderDM(
    uuid: 'o1',
    status: GroupOrderStatus.confirmed,
    fulfillmentStatus: GroupFulfillmentStatus.delivered,
    confirmedAt: DateTime.now().subtract(const Duration(minutes: 30)),
  );
  const cancelled = GroupOrderDM(uuid: 'o1', status: GroupOrderStatus.cancelled);

  const screen = Size(400, 800);
  const chip = Size(170, 36);
  const margin = GroupOrderChipLogic.edgeMargin;

  group('shouldShow', () {
    test('sin orden → oculto', () {
      expect(GroupOrderChipLogic.shouldShow(order: null, location: '/visit-menu/m1'), isFalse);
    });

    test('orden viva (open/locked) en rutas de contenido → visible', () {
      for (final loc in ['/visit-menu/m1', '/main/u1/foodly-main-page', '/main/u1/visit-business']) {
        expect(GroupOrderChipLogic.shouldShow(order: open, location: loc), isTrue, reason: loc);
        expect(GroupOrderChipLogic.shouldShow(order: locked, location: loc), isTrue, reason: loc);
      }
    });

    test('e2e F4a: confirmada RECIENTE sin entregar sigue visible (tracking); '
        'entregada, cancelada o confirmada VIEJA (TTL 12h) → oculto', () {
      expect(GroupOrderChipLogic.shouldShow(order: tracking, location: '/visit-menu/m1'), isTrue);
      expect(GroupOrderChipLogic.shouldShow(order: delivered, location: '/visit-menu/m1'), isFalse);
      expect(GroupOrderChipLogic.shouldShow(order: cancelled, location: '/visit-menu/m1'), isFalse);
      // El fantasma de €163: pagada hace días sin fulfillment NO es tracking.
      expect(
          GroupOrderChipLogic.shouldShow(order: trackingStale, location: '/visit-menu/m1'), isFalse);
    });

    test('e2e F4a: oculto en el módulo del MANAGER (el chip de cliente '
        'encima del panel de órdenes es ruido de otro rol)', () {
      expect(
        GroupOrderChipLogic.shouldShow(
            order: open, location: '/main/biz-1/my-business/live-orders'),
        isFalse,
      );
      expect(
        GroupOrderChipLogic.shouldShow(
            order: tracking, location: '/main/biz-1/my-business/live-orders'),
        isFalse,
      );
    });

    test('oculto DENTRO de la orden y del flujo de join (redundante)', () {
      expect(GroupOrderChipLogic.shouldShow(order: open, location: '/group-order/o1'), isFalse);
      expect(GroupOrderChipLogic.shouldShow(order: open, location: '/join/ABC123'), isFalse);
    });

    test('oculto en pantallas de arranque/auth', () {
      for (final loc in ['/', '/login', '/sign-up', '/sign-up-business', '/no-access']) {
        expect(GroupOrderChipLogic.shouldShow(order: open, location: loc), isFalse, reason: loc);
      }
    });

    test('la query string no afecta el matcheo de ruta', () {
      expect(GroupOrderChipLogic.shouldShow(order: open, location: '/visit-menu/m1?tab=2'), isTrue);
      expect(GroupOrderChipLogic.shouldShow(order: open, location: '/login?from=x'), isFalse);
    });

    test('e2e r6: con la PÁGINA de la orden abierta el chip se oculta '
        'SIEMPRE, sin importar la URI (los pushes imperativos no la mueven)', () {
      // Aunque la URI diga menú/home (push imperativo no reflejado), el
      // marcador de ciclo de vida manda.
      for (final loc in ['/visit-menu/m1', '/main/u1/foodly-main-page']) {
        expect(
          GroupOrderChipLogic.shouldShow(order: open, location: loc, orderPageOpen: true),
          isFalse,
          reason: loc,
        );
      }
      // Y al cerrarse la página, vuelve.
      expect(
        GroupOrderChipLogic.shouldShow(order: open, location: '/visit-menu/m1'),
        isTrue,
      );
    });
  });

  group('GroupOrderPageVisibility (marcador de ciclo de vida)', () {
    tearDown(GroupOrderPageVisibility.reset);

    test('abre/cierra con contador (soporta apilado) y nunca queda negativo',
        () async {
      expect(GroupOrderPageVisibility.isOpen, isFalse);
      GroupOrderPageVisibility.markOpened();
      expect(GroupOrderPageVisibility.isOpen, isTrue);
      GroupOrderPageVisibility.markOpened(); // dos páginas apiladas
      GroupOrderPageVisibility.markClosed();
      expect(GroupOrderPageVisibility.isOpen, isTrue); // queda una viva
      GroupOrderPageVisibility.markClosed();
      expect(GroupOrderPageVisibility.isOpen, isFalse);
      GroupOrderPageVisibility.markClosed(); // extra: no-op, no negativo

      // El notifier es el canal de aviso y viaja en microtask (ver _bump):
      // hay que dejarlo correr antes de leerlo, o se lee el valor anterior.
      await Future<void>.delayed(Duration.zero);
      expect(GroupOrderPageVisibility.openCount.value, 0);
    });

    test('el notifier ALCANZA al contador tras vaciar los microtasks', () async {
      GroupOrderPageVisibility.markOpened();
      expect(GroupOrderPageVisibility.isOpen, isTrue);

      await Future<void>.delayed(Duration.zero);
      expect(GroupOrderPageVisibility.openCount.value, 1,
          reason: 'Sin esto el host del chip nunca se entera y queda encima.');
    });
  });

  group('initialOffset', () {
    test('dock a la IZQUIERDA (no a la derecha: tapaba el FAB abierto)', () {
      final off = GroupOrderChipLogic.initialOffset(screen: screen, chip: chip);
      expect(off.dx, margin);
      expect(off.dy, screen.height - GroupOrderChipLogic.bottomDock - chip.height);
    });

    test('respeta las safe areas', () {
      const safe = EdgeInsets.only(left: 20, bottom: 30);
      final off = GroupOrderChipLogic.initialOffset(screen: screen, chip: chip, safeArea: safe);
      expect(off.dx, safe.left + margin);
      expect(off.dy, screen.height - safe.bottom - GroupOrderChipLogic.bottomDock - chip.height);
    });
  });

  group('clamp', () {
    test('dentro de límites no cambia', () {
      const desired = Offset(100, 300);
      expect(
        GroupOrderChipLogic.clamp(desired: desired, screen: screen, chip: chip),
        desired,
      );
    });

    test('el chip nunca sale de la pantalla por ningún borde', () {
      // Muy a la izquierda/arriba.
      expect(
        GroupOrderChipLogic.clamp(desired: const Offset(-500, -500), screen: screen, chip: chip),
        const Offset(margin, margin),
      );
      // Muy a la derecha/abajo.
      expect(
        GroupOrderChipLogic.clamp(desired: const Offset(999, 999), screen: screen, chip: chip),
        Offset(screen.width - margin - chip.width, screen.height - margin - chip.height),
      );
    });

    test('clampea también contra las safe areas', () {
      const safe = EdgeInsets.only(top: 40, right: 10);
      final off = GroupOrderChipLogic.clamp(
        desired: const Offset(999, -10),
        screen: screen,
        chip: chip,
        safeArea: safe,
      );
      expect(off.dx, screen.width - safe.right - margin - chip.width);
      expect(off.dy, safe.top + margin);
    });

    test('pantalla más chica que el chip: no explota (degrada al mínimo)', () {
      final off = GroupOrderChipLogic.clamp(
        desired: const Offset(50, 50),
        screen: const Size(100, 20),
        chip: chip,
      );
      expect(off.dx, margin);
      expect(off.dy, margin);
    });
  });

  group('snapToEdge', () {
    test('centro a la izquierda → imanta al borde izquierdo, conserva altura', () {
      final off = GroupOrderChipLogic.snapToEdge(
        current: const Offset(30, 400),
        screen: screen,
        chip: chip,
      );
      expect(off, const Offset(margin, 400));
    });

    test('centro a la derecha → imanta al borde derecho', () {
      final off = GroupOrderChipLogic.snapToEdge(
        current: const Offset(300, 400),
        screen: screen,
        chip: chip,
      );
      expect(off, Offset(screen.width - margin - chip.width, 400));
    });

    test('el snap también clampea la altura', () {
      final off = GroupOrderChipLogic.snapToEdge(
        current: const Offset(30, 9999),
        screen: screen,
        chip: chip,
      );
      expect(off.dy, screen.height - margin - chip.height);
    });
  });

  group('GroupOrderChipPositionStore', () {
    tearDown(GroupOrderChipPositionStore.reset);

    test('null por defecto (usa posición inicial); persiste y resetea', () {
      expect(GroupOrderChipPositionStore.offset.value, isNull);
      GroupOrderChipPositionStore.offset.value = const Offset(10, 20);
      expect(GroupOrderChipPositionStore.offset.value, const Offset(10, 20));
      GroupOrderChipPositionStore.reset();
      expect(GroupOrderChipPositionStore.offset.value, isNull);
    });
  });

  // e2e 2026-08-06 — la GroupOrderPage se monta DURANTE el build del árbol.
  // Si el contador solo existiera en el ValueNotifier, `isOpen` dependería de
  // una notificación que el host (ya construido en ese frame) se pierde, y el
  // chip quedaba pintado encima de la orden.
  group('GroupOrderPageVisibility — el valor no espera al frame', () {
    tearDown(GroupOrderPageVisibility.reset);

    test('funciona SIN binding de Flutter inicializado', () {
      // Es un contador: exigir WidgetsBinding.instance lo hacía reventar en
      // cualquier test() puro (e2e 2026-08-06). Que este test viva en un
      // fichero sin binding es justamente la garantía.
      expect(GroupOrderPageVisibility.markOpened, returnsNormally);
      expect(GroupOrderPageVisibility.markClosed, returnsNormally);
    });

    test('isOpen es correcto EN EL ACTO, sin depender del notifier', () {
      expect(GroupOrderPageVisibility.isOpen, isFalse);

      GroupOrderPageVisibility.markOpened();
      expect(GroupOrderPageVisibility.isOpen, isTrue,
          reason: 'Debe valer ya, aunque la notificación se difiera.');

      GroupOrderPageVisibility.markClosed();
      expect(GroupOrderPageVisibility.isOpen, isFalse);
    });

    test('anidar dos páginas requiere cerrar las dos', () {
      GroupOrderPageVisibility.markOpened();
      GroupOrderPageVisibility.markOpened();
      GroupOrderPageVisibility.markClosed();
      expect(GroupOrderPageVisibility.isOpen, isTrue);
      GroupOrderPageVisibility.markClosed();
      expect(GroupOrderPageVisibility.isOpen, isFalse);
    });

    test('cerrar de más no deja el contador en negativo', () {
      GroupOrderPageVisibility.markClosed();
      GroupOrderPageVisibility.markClosed();
      expect(GroupOrderPageVisibility.isOpen, isFalse);
      GroupOrderPageVisibility.markOpened();
      expect(GroupOrderPageVisibility.isOpen, isTrue,
          reason: 'Un contador hundido dejaría el chip visible para siempre.');
    });
  });
}
