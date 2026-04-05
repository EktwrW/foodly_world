import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/reservations/reservation_client.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';

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

  Future<ApiResult<ReservationsResponseDM>> getMyReservations({int? page, int? perPage, String? status}) async {
    try {
      return ApiResult.success(
        await _reservationClient.getMyReservations(page: page, perPage: perPage, status: status),
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
  }) async {
    try {
      return ApiResult.success(
        await _reservationClient.getBusinessReservations(businessUuid,
            page: page, perPage: perPage, status: status, date: date),
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
}
