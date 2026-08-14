import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_notification_enums.dart';
import 'package:foodly_world/data_models/notifications/notifications_dm.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';

/// Cuándo un aviso de reserva merece INTERRUMPIR con un modal.
///
/// El bug (2026-08-13): borrar una cuenta de prueba cancelaba sus reservas
/// —incluidas las de fecha ya pasada— y generaba un aviso al negocio por cada
/// una. Al entrar, el comerciante recibía un modal bloqueante por cada reserva
/// cancelada, de una en una y sesión tras sesión, sobre fechas de hace dos meses
/// y de usuarios ya borrados. Nada que decidir, todo fricción.
///
/// La regla: **un modal es para lo que exige una decisión AHORA, sobre algo que
/// todavía puede cambiar, y que acaba de ocurrir.** Lo demás sigue en la campana
/// con su badge — no se pierde nada, se deja de interrumpir.
///
/// El filtro va en dos mitades a propósito: la del aviso se resuelve SIN RED, así
/// que un aviso viejo ni siquiera se pide al servidor. Solo lo que la pasa llega
/// a consultar la reserva.
void main() {
  final ahora = DateTime(2026, 8, 13, 21);

  NotificationDM aviso({
    required FoodlyNotificationSubType subType,
    DateTime? createdAt,
    String? reservationUuid = 'res-1',
  }) =>
      NotificationDM(
        id: 1,
        uuid: 'notif-1',
        title: 'x',
        message: 'x',
        type: FoodlyNotificationType.business,
        subType: subType,
        createdAt: createdAt ?? ahora.subtract(const Duration(minutes: 2)),
        data: NotificationDataDM(reservationUuid: reservationUuid),
      );

  ReservationDM reserva({
    required DateTime? fecha,
    required ReservationStatus estado,
  }) =>
      ReservationDM(
        reservationUuid: 'res-1',
        reservationDate: fecha,
        status: estado,
      );

  group('el aviso — se decide sin red', () {
    test('una petición nueva de reserva sí interrumpe', () {
      expect(
        aviso(subType: FoodlyNotificationSubType.newReservationRequest)
            .deservesProactiveDialog(now: ahora),
        isTrue,
      );
    });

    test('una confirmación sí interrumpe: es la buena noticia que se espera', () {
      expect(
        aviso(subType: FoodlyNotificationSubType.reservationConfirmed)
            .deservesProactiveDialog(now: ahora),
        isTrue,
      );
    });

    test('las cancelaciones y los rechazos NO interrumpen', () {
      // Son informativos: no hay nada que hacer con ellos. Van a la campana.
      for (final sub in [
        FoodlyNotificationSubType.reservationCancelled,
        FoodlyNotificationSubType.reservationCancelledByBusiness,
        FoodlyNotificationSubType.reservationRejected,
      ]) {
        expect(
          aviso(subType: sub).deservesProactiveDialog(now: ahora),
          isFalse,
          reason: sub.toString(),
        );
      }
    });

    test('un aviso de hace más de 24 h no interrumpe', () {
      // El caso exacto del bug: avisos generados sobre reservas de junio.
      expect(
        aviso(
          subType: FoodlyNotificationSubType.newReservationRequest,
          createdAt: ahora.subtract(const Duration(days: 60)),
        ).deservesProactiveDialog(now: ahora),
        isFalse,
      );
    });

    test('el corte está en las 24 h', () {
      final justoDentro = aviso(
        subType: FoodlyNotificationSubType.newReservationRequest,
        createdAt: ahora.subtract(const Duration(hours: 23, minutes: 59)),
      );
      final justoFuera = aviso(
        subType: FoodlyNotificationSubType.newReservationRequest,
        createdAt: ahora.subtract(const Duration(hours: 24, minutes: 1)),
      );

      expect(justoDentro.deservesProactiveDialog(now: ahora), isTrue);
      expect(justoFuera.deservesProactiveDialog(now: ahora), isFalse);
    });

    test('sin fecha de creación no se interrumpe', () {
      // Se construye a mano: el helper rellena `createdAt` por defecto, así que
      // pasarle null no expresaría el caso.
      const sinFecha = NotificationDM(
        id: 1,
        uuid: 'notif-1',
        type: FoodlyNotificationType.business,
        subType: FoodlyNotificationSubType.newReservationRequest,
        data: NotificationDataDM(reservationUuid: 'res-1'),
      );

      expect(sinFecha.deservesProactiveDialog(now: ahora), isFalse);
    });

    test('sin uuid de reserva no hay nada que abrir', () {
      expect(
        aviso(
          subType: FoodlyNotificationSubType.newReservationRequest,
          reservationUuid: null,
        ).deservesProactiveDialog(now: ahora),
        isFalse,
      );
    });

    test('un aviso con fecha futura (reloj torcido) se trata como reciente', () {
      expect(
        aviso(
          subType: FoodlyNotificationSubType.newReservationRequest,
          createdAt: ahora.add(const Duration(hours: 3)),
        ).deservesProactiveDialog(now: ahora),
        isTrue,
      );
    });
  });

  group('la reserva — se decide ya cargada', () {
    test('futura y viva sí interrumpe', () {
      for (final estado in [
        ReservationStatus.pending,
        ReservationStatus.quoted,
        ReservationStatus.confirmed,
      ]) {
        expect(
          reserva(fecha: ahora.add(const Duration(days: 3)), estado: estado)
              .deservesProactiveDialog(now: ahora),
          isTrue,
          reason: estado.toString(),
        );
      }
    });

    test('cancelada, rechazada o cumplida NO interrumpe, aunque sea futura', () {
      for (final estado in [
        ReservationStatus.cancelled,
        ReservationStatus.rejected,
        ReservationStatus.completed,
        ReservationStatus.noShow,
      ]) {
        expect(
          reserva(fecha: ahora.add(const Duration(days: 3)), estado: estado)
              .deservesProactiveDialog(now: ahora),
          isFalse,
          reason: estado.toString(),
        );
      }
    });

    test('una fecha ya pasada no interrumpe, aunque el estado esté vivo', () {
      expect(
        reserva(
          fecha: ahora.subtract(const Duration(days: 60)),
          estado: ReservationStatus.pending,
        ).deservesProactiveDialog(now: ahora),
        isFalse,
      );
    });

    test('una reserva de HOY sigue contando, aunque la hora ya pasara', () {
      // El límite es el día, no la hora: a las 21:00 una mesa de las 19:00 de
      // hoy todavía le interesa al comerciante.
      expect(
        reserva(
          fecha: DateTime(2026, 8, 13, 19),
          estado: ReservationStatus.confirmed,
        ).deservesProactiveDialog(now: ahora),
        isTrue,
      );
    });

    test('sin fecha no se interrumpe', () {
      expect(
        reserva(fecha: null, estado: ReservationStatus.pending)
            .deservesProactiveDialog(now: ahora),
        isFalse,
      );
    });
  });

  group('la combinación que provocó el bug', () {
    test('aviso viejo de una reserva pasada y cancelada: ninguna mitad lo deja pasar', () {
      final n = aviso(
        subType: FoodlyNotificationSubType.reservationCancelled,
        createdAt: ahora.subtract(const Duration(days: 60)),
      );
      final r = reserva(
        fecha: DateTime(2026, 6, 5),
        estado: ReservationStatus.cancelled,
      );

      expect(n.deservesProactiveDialog(now: ahora), isFalse);
      expect(r.deservesProactiveDialog(now: ahora), isFalse);
    });
  });
}
