import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/reservations/reservation_client.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/data_models/reservations/reservation_message_dm.dart';

class ReservationRepo {
  final ReservationClient _reservationClient;

  const ReservationRepo({required ReservationClient reservationClient})
      : _reservationClient = reservationClient;

  Future<ApiResult<PendingReservationsCountDM>> getPendingCount() async {
    try {
      return ApiResult.success(await _reservationClient.getPendingCount());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationShowResponseDM>> getReservation(String uuid) async {
    try {
      return ApiResult.success(await _reservationClient.getReservation(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationCreateResponseDM>> createReservation({
    required String businessUuid,
    required String reservationDate,
    required String reservationTime,
    required int partySize,
    String? specialRequests,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.createReservation(
          businessUuid: businessUuid,
          reservationDate: reservationDate,
          reservationTime: reservationTime,
          partySize: partySize,
          specialRequests: specialRequests,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationsResponseDM>> getMyReservations({
    int? page,
    int? perPage,
    String? status,
    String? bookingType,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.getMyReservations(
          page: page,
          perPage: perPage,
          status: status,
          bookingType: bookingType,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> cancelReservation(String uuid) async {
    try {
      return ApiResult.success(await _reservationClient.cancelReservation(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationsResponseDM>> getBusinessReservations(
    String businessUuid, {
    int? page,
    int? perPage,
    String? status,
    String? date,
    String? bookingType,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.getBusinessReservations(
          businessUuid,
          page: page,
          perPage: perPage,
          status: status,
          date: date,
          bookingType: bookingType,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> confirmReservation(String uuid) async {
    try {
      return ApiResult.success(await _reservationClient.confirmReservation(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> rejectReservation(String uuid, {String? managerNotes}) async {
    try {
      return ApiResult.success(await _reservationClient.rejectReservation(uuid, managerNotes: managerNotes));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> managerCancelReservation(String uuid,
      {String? managerNotes}) async {
    try {
      return ApiResult.success(
          await _reservationClient.managerCancelReservation(uuid, managerNotes: managerNotes));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> markNoShow(String uuid) async {
    try {
      return ApiResult.success(await _reservationClient.markNoShow(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> markComplete(String uuid) async {
    try {
      return ApiResult.success(await _reservationClient.markComplete(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── Service bookings (Catering & Chefs) ────────────────────────

  Future<ApiResult<ReservationCreateResponseDM>> createServiceBooking({
    required String businessUuid,
    required String servicePackageUuid,
    required String reservationDate,
    String? reservationTime,
    String? eventAddress,
    String? eventCity,
    double? eventLatitude,
    double? eventLongitude,
    // `eventType` removed: BE derives it from service_package.service_type
    // so the reservation's event_type can never drift from the package's
    // declared service_type.
    required int guestCount,
    String? dietaryNotes,
    double? budgetEstimate,
    String? specialRequests,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.createServiceBooking(
          businessUuid: businessUuid,
          servicePackageUuid: servicePackageUuid,
          reservationDate: reservationDate,
          reservationTime: reservationTime,
          eventAddress: eventAddress,
          eventCity: eventCity,
          eventLatitude: eventLatitude,
          eventLongitude: eventLongitude,
          guestCount: guestCount,
          dietaryNotes: dietaryNotes,
          budgetEstimate: budgetEstimate,
          specialRequests: specialRequests,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> sendQuote(
    String uuid, {
    required double quotedAmount,
    String? managerNotes,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.sendQuote(uuid, quotedAmount: quotedAmount, managerNotes: managerNotes),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> approveQuote(String uuid) async {
    try {
      return ApiResult.success(await _reservationClient.approveQuote(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationActionResponseDM>> rejectQuote(
    String uuid, {
    String? rejectionReason,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.rejectQuote(uuid, rejectionReason: rejectionReason),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── Reservation messages ───────────────────────────────────────

  /// Fetch the reservation message thread.
  ///
  /// [since] — when non-null, requests only messages created AFTER that
  /// timestamp. Pass the `serverNow` from the previous response here so the
  /// server clock is the source of truth (see ReservationMessagesResponseDM).
  Future<ApiResult<ReservationMessagesResponseDM>> getMessages(
    String reservationUuid, {
    DateTime? since,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.getMessages(
          reservationUuid,
          since: since?.toIso8601String(),
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReservationMessageCreateResponseDM>> sendMessage(
    String reservationUuid, {
    required String body,
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.sendMessage(reservationUuid, body: body),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
