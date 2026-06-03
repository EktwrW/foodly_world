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
    // Snapshot de contacto que el usuario provee al reservar (opcional: solo
    // se envía cuando le falta en el perfil o tiene email privaterelay).
    @Field('contact_phone') String? contactPhone,
    @Field('contact_email') String? contactEmail,
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
    // `event_type` removed: server derives it from service_package.service_type.
    @Field('guest_count') required int guestCount,
    @Field('dietary_notes') String? dietaryNotes,
    @Field('budget_estimate') double? budgetEstimate,
    @Field('special_requests') String? specialRequests,
    // Snapshot de contacto del solicitante (ver createReservation).
    @Field('contact_phone') String? contactPhone,
    @Field('contact_email') String? contactEmail,
  });

  @POST('/reservations/{uuid}/quote')
  Future<ReservationActionResponseDM> sendQuote(
    @Path('uuid') String uuid, {
    @Field('quoted_amount') required double quotedAmount,
    @Field('manager_notes') String? managerNotes,
  });

  @POST('/reservations/{uuid}/approve-quote')
  Future<ReservationActionResponseDM> approveQuote(@Path('uuid') String uuid);

  @POST('/reservations/{uuid}/reject-quote')
  Future<ReservationActionResponseDM> rejectQuote(
    @Path('uuid') String uuid, {
    @Field('rejection_reason') String? rejectionReason,
  });

  // ── Reservation messages ───────────────────────────────────────

  /// Fetch the message thread.
  ///
  /// When [since] is null the server returns the full thread (initial load).
  /// When [since] is an ISO8601 string, the server returns only messages with
  /// `created_at > since` (poll delta). Use the `server_now` field from the
  /// previous response as the next [since] — never the client clock.
  @GET('/reservations/{reservationUuid}/messages')
  Future<ReservationMessagesResponseDM> getMessages(
    @Path('reservationUuid') String reservationUuid, {
    @Query('since') String? since,
  });

  @POST('/reservations/{reservationUuid}/messages')
  Future<ReservationMessageCreateResponseDM> sendMessage(
    @Path('reservationUuid') String reservationUuid, {
    @Field('body') required String body,
  });
}
