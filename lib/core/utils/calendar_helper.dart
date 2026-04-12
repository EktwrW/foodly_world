import 'package:add_2_calendar_new/add_2_calendar_new.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';

class CalendarHelper {
  const CalendarHelper._();

  /// Adds a confirmed reservation to the device calendar.
  static void addReservationToCalendar(ReservationDM reservation) {
    final date = reservation.reservationDate;
    if (date == null) return;

    // Parse time (HH:mm) or default to noon.
    final timeParts = reservation.reservationTime?.split(':');
    final hour = int.tryParse(timeParts?.first ?? '') ?? 12;
    final minute = int.tryParse(timeParts?.last ?? '') ?? 0;

    final startDate = DateTime(date.year, date.month, date.day, hour, minute);
    final endDate = startDate.add(const Duration(hours: 2));

    final event = Event(
      title: '${reservation.businessName ?? 'Reservation'} — Foodly',
      description: [
        if (reservation.partySize > 1) 'Party size: ${reservation.partySize}',
        if (reservation.specialRequests != null && reservation.specialRequests!.isNotEmpty)
          'Special requests: ${reservation.specialRequests}',
        if (reservation.managerNotes != null && reservation.managerNotes!.isNotEmpty)
          'Notes: ${reservation.managerNotes}',
      ].join('\n'),
      location: reservation.businessAddress ?? '',
      startDate: startDate,
      endDate: endDate,
    );

    Add2Calendar.addEvent2Cal(event);
  }
}
