import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/data_models/reservations/reservation_message_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_client.g.dart';

@RestApi()
abstract class ReservationClient {
  factory ReservationClient(Dio dio) = _ReservationClient;

  @GET('/reservations/show/{uuid}')
  Future<ReservationShowResponseDM> getReservation(@Path('uuid') String uuid);

  @GET('/reservations/pending-count')
  Future<PendingReservationsCountDM> getPendingCount();

  // ── Table reservations ─────────────────────────────────────────

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
    @Query('booking_type') String? bookingType,
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
    @Query('booking_type') String? bookingType,
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

  // ── Service bookings (Catering & Chefs) ────────────────────────

  @POST('/reservations/store-service')
  Future<ReservationCreateResponseDM> createServiceBooking({
    @Field('business_uuid') required String businessUuid,
    @Field('service_package_uuid') required String servicePackageUuid,
    @Field('reservation_date') required String reservationDate,
    @Field('reservation_time') String? reservationTime,
    @Field('event_address') String? eventAddress,
    @Field('event_city') String? eventCity,
    @Field('event_latitude') double? eventLatitude,
    @Field('event_longitude') double? eventLongitude,
    @Field('event_type') String? eventType,
    @Field('guest_count') required int guestCount,
    @Field('dietary_notes') String? dietaryNotes,
    @Field('budget_estimate') double? budgetEstimate,
    @Field('special_requests') String? specialRequests,
  });

  @POST('/reservations/{uuid}/quote')
  Future<ReservationActionResponseDM> sendQuote(
    @Path('uuid') String uuid, {
    @Field('quoted_amount') required double quotedAmount,
    @Field('manager_notes') String? managerNotes,
  });

  @POST('/reservations/{uuid}/approve-quote')
  Future<ReservationActionResponseDM> approveQuote(@Path('uuid') String uuid);

  // ── Reservation messages ───────────────────────────────────────

  @GET('/reservations/{reservationUuid}/messages')
  Future<ReservationMessagesResponseDM> getMessages(
    @Path('reservationUuid') String reservationUuid,
  );

  @POST('/reservations/{reservationUuid}/messages')
  Future<ReservationMessageCreateResponseDM> sendMessage(
    @Path('reservationUuid') String reservationUuid, {
    @Field('body') required String body,
  });
}
