import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_client.g.dart';

@RestApi()
abstract class ReservationClient {
  factory ReservationClient(Dio dio) = _ReservationClient;

  @GET('/reservations/show/{uuid}')
  Future<ReservationShowResponseDM> getReservation(@Path('uuid') String uuid);

  @GET('/reservations/pending-count')
  Future<PendingReservationsCountDM> getPendingCount();

  @POST('/reservations/store')
  Future<ReservationCreateResponseDM> createReservation({
    @Field('business_uuid') required String businessUuid,
    @Field('reservation_date') required String reservationDate,
    @Field('reservation_time') required String reservationTime,
    @Field('party_size') required int partySize,
    @Field('special_requests') String? specialRequests,
  });

  @GET('/reservations/my-reservations')
  Future<ReservationsResponseDM> getMyReservations({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('status') String? status,
  });

  @PATCH('/reservations/cancel/{uuid}')
  Future<ReservationActionResponseDM> cancelReservation(@Path('uuid') String uuid);

  @GET('/reservations/business/{businessUuid}')
  Future<ReservationsResponseDM> getBusinessReservations(
    @Path('businessUuid') String businessUuid, {
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('status') String? status,
    @Query('date') String? date,
  });

  @PATCH('/reservations/confirm/{uuid}')
  Future<ReservationActionResponseDM> confirmReservation(@Path('uuid') String uuid);

  @PATCH('/reservations/reject/{uuid}')
  Future<ReservationActionResponseDM> rejectReservation(
    @Path('uuid') String uuid, {
    @Field('manager_notes') String? managerNotes,
  });

  @PATCH('/reservations/manager-cancel/{uuid}')
  Future<ReservationActionResponseDM> managerCancelReservation(
    @Path('uuid') String uuid, {
    @Field('manager_notes') String? managerNotes,
  });

  @PATCH('/reservations/no-show/{uuid}')
  Future<ReservationActionResponseDM> markNoShow(@Path('uuid') String uuid);

  @PATCH('/reservations/complete/{uuid}')
  Future<ReservationActionResponseDM> markComplete(@Path('uuid') String uuid);
}
