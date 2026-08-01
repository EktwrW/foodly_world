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
  const confirmed = GroupOrderDM(uuid: 'o1', status: GroupOrderStatus.confirmed);
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

    test('orden muerta (confirmada/cancelada) → oculto', () {
      expect(GroupOrderChipLogic.shouldShow(order: confirmed, location: '/visit-menu/m1'), isFalse);
      expect(GroupOrderChipLogic.shouldShow(order: cancelled, location: '/visit-menu/m1'), isFalse);
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
}
