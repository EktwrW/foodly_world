import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// e2e r4 — predicados puros de ciclo de vida sobre el DM:
/// canBeDeletedBy (host, orden OPEN y VACÍA) y canBeLeftBy (miembro, OPEN,
/// sin ítems propios). Espejan los guards del backend; la UI muestra las
/// acciones solo cuando estos devuelven true.
void main() {
  const host = GroupOrderParticipantDM(
    uuid: 'h',
    displayName: 'Host',
    role: GroupParticipantRole.host,
  );
  const member = GroupOrderParticipantDM(uuid: 'm', displayName: 'Member');

  const emptyOpen = GroupOrderDM(uuid: 'o1', participants: [host, member]);

  final memberItem =
      const GroupOrderItemDM(uuid: 'i1', participantUuid: 'm', name: 'Nachos', unitPricePreview: 5);
  final hostItem =
      const GroupOrderItemDM(uuid: 'i2', participantUuid: 'h', name: 'Agua', unitPricePreview: 2);

  group('canBeDeletedBy (eliminar orden vacía — solo host)', () {
    test('host + OPEN + sin ítems → true', () {
      expect(emptyOpen.canBeDeletedBy('h'), isTrue);
    });

    test('miembro nunca puede eliminar', () {
      expect(emptyOpen.canBeDeletedBy('m'), isFalse);
    });

    test('con CUALQUIER ítem (de quien sea) → false', () {
      expect(emptyOpen.copyWith(items: [memberItem]).canBeDeletedBy('h'), isFalse);
      expect(emptyOpen.copyWith(items: [hostItem]).canBeDeletedBy('h'), isFalse);
    });

    test('fuera de OPEN → false en todos los estados', () {
      for (final s in GroupOrderStatus.values.where((s) => s != GroupOrderStatus.open)) {
        expect(emptyOpen.copyWith(status: s).canBeDeletedBy('h'), isFalse, reason: '$s');
      }
    });

    test('uuid nulo o ajeno a la orden → false', () {
      expect(emptyOpen.canBeDeletedBy(null), isFalse);
      expect(emptyOpen.canBeDeletedBy('extranjero'), isFalse);
    });
  });

  group('canBeLeftBy (abandonar — solo miembro sin ítems)', () {
    test('miembro + OPEN + sin ítems propios → true', () {
      expect(emptyOpen.canBeLeftBy('m'), isTrue);
    });

    test('el host jamás abandona (transfiere o elimina)', () {
      expect(emptyOpen.canBeLeftBy('h'), isFalse);
    });

    test('con ítems PROPIOS → false; ítems ajenos no bloquean', () {
      expect(emptyOpen.copyWith(items: [memberItem]).canBeLeftBy('m'), isFalse);
      expect(emptyOpen.copyWith(items: [hostItem]).canBeLeftBy('m'), isTrue);
    });

    test('fuera de OPEN → false en todos los estados', () {
      for (final s in GroupOrderStatus.values.where((s) => s != GroupOrderStatus.open)) {
        expect(emptyOpen.copyWith(status: s).canBeLeftBy('m'), isFalse, reason: '$s');
      }
    });

    test('uuid nulo o ajeno a la orden → false', () {
      expect(emptyOpen.canBeLeftBy(null), isFalse);
      expect(emptyOpen.canBeLeftBy('extranjero'), isFalse);
    });

    test('delete y leave son exclusivos por rol sobre la misma orden', () {
      // El host ve "eliminar", el miembro ve "abandonar" — nunca ambos.
      expect(emptyOpen.canBeDeletedBy('h') && emptyOpen.canBeLeftBy('h'), isFalse);
      expect(emptyOpen.canBeDeletedBy('m') && emptyOpen.canBeLeftBy('m'), isFalse);
    });
  });
}
