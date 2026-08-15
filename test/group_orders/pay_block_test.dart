import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// Por qué no se puede pagar, dicho con precisión.
///
/// EL BUG (e2e 2026-08-14). El pie de la orden tenía UN solo texto para todos
/// los motivos:
///
///     text: _canPay ? "Pagar la orden · €X" : S.current.groupOrderNoBalanceDue
///
/// Una orden de prepago llevaba horas abierta mientras depurábamos otra cosa.
/// Se le venció el plazo de pago, el barrido la EXPIRÓ y canceló su
/// PaymentIntent (confirmado en Stripe: cancelado a las 18:31 UTC, sin un
/// céntimo cobrado). El comensal volvió a la pantalla y la app le dijo **"Sin
/// saldo pendiente"** sobre una cena que no había pagado — con el botón
/// apagado, sin explicación y sin salida.
///
/// "Sin saldo pendiente" es cierto en UN caso de los seis. Estos tests fijan
/// los otros cinco.
void main() {
  GroupOrderDM orden({
    required GroupOrderStatus estado,
    List<GroupOrderParticipantDM> participantes = const [],
  }) =>
      GroupOrderDM(
        uuid: 'o-1',
        status: estado,
        participants: participantes,
      );

  GroupOrderParticipantDM comensal({
    required String uuid,
    GroupPaymentStatus pago = GroupPaymentStatus.pending,
  }) =>
      GroupOrderParticipantDM(uuid: uuid, displayName: 'Yo', paymentStatus: pago);

  group('la orden terminó', () {
    test('expirada lo dice, y no dice "sin saldo pendiente"', () {
      final o = orden(estado: GroupOrderStatus.expired);

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 68.50),
        GroupOrderPayBlock.expired,
      );
    });

    test('cancelada lo dice', () {
      expect(
        orden(estado: GroupOrderStatus.cancelled)
            .payBlockFor(myParticipantUuid: 'p-1', myShare: 68.50),
        GroupOrderPayBlock.cancelled,
      );
    });

    test('cerrada lo dice', () {
      expect(
        orden(estado: GroupOrderStatus.completed)
            .payBlockFor(myParticipantUuid: 'p-1', myShare: 0),
        GroupOrderPayBlock.completed,
      );
    });

    test('el estado terminal manda aunque quede saldo', () {
      // Este es EXACTAMENTE el caso del e2e: expirada con €68,50 sin pagar.
      // Si el saldo se mirara primero, volvería a decir que se puede pagar
      // una orden que ya no existe.
      final o = orden(estado: GroupOrderStatus.expired);

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 68.50),
        isNot(GroupOrderPayBlock.none),
      );
      expect(o.isTerminal, isTrue, reason: 'y por eso la pantalla ofrece salida');
    });
  });

  group('la orden sigue viva', () {
    test('un pago MÍO en curso no es "sin saldo pendiente"', () {
      // Lo sella el webhook, no la app. Decirle que no debe nada es prometer
      // un desenlace que todavía no ocurrió.
      final o = orden(
        estado: GroupOrderStatus.paying,
        participantes: [comensal(uuid: 'p-1', pago: GroupPaymentStatus.processing)],
      );

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 68.50),
        GroupOrderPayBlock.confirming,
      );
    });

    test('el pago en curso de OTRO no me bloquea a mí', () {
      final o = orden(
        estado: GroupOrderStatus.locked,
        participantes: [
          comensal(uuid: 'p-1'),
          comensal(uuid: 'p-2', pago: GroupPaymentStatus.processing),
        ],
      );

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 20),
        GroupOrderPayBlock.none,
      );
    });

    test('sin saldo a mi nombre SÍ es "sin saldo pendiente"', () {
      // El único caso en que el mensaje viejo decía la verdad. Se conserva.
      final o = orden(
        estado: GroupOrderStatus.locked,
        participantes: [comensal(uuid: 'p-1')],
      );

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 0),
        GroupOrderPayBlock.settled,
      );
    });

    test('todavía no toca pagar', () {
      final o = orden(
        estado: GroupOrderStatus.confirmed,
        participantes: [comensal(uuid: 'p-1')],
      );

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 30),
        GroupOrderPayBlock.notPayableYet,
      );
    });

    test('con saldo y en fase de cobro, se paga', () {
      final o = orden(
        estado: GroupOrderStatus.locked,
        participantes: [comensal(uuid: 'p-1')],
      );

      expect(
        o.payBlockFor(myParticipantUuid: 'p-1', myShare: 68.50),
        GroupOrderPayBlock.none,
      );
    });
  });
}
