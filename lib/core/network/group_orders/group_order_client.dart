import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'group_order_client.g.dart';

/// Cliente HTTP de Group Orders & Split Payments.
/// Endpoints según docs/group-orders-design-spec.md §5.
@RestApi()
abstract class GroupOrderClient {
  factory GroupOrderClient(Dio dio) = _GroupOrderClient;

  // ── Lectura ────────────────────────────────────────────────────

  @GET('/group-orders/mine')
  Future<GroupOrdersListResponseDM> getMyGroupOrders();

  @GET('/group-orders/{uuid}')
  Future<GroupOrderResponseDM> getGroupOrder(@Path('uuid') String uuid);

  // ── Ciclo de vida (host) ───────────────────────────────────────

  @POST('/group-orders')
  Future<GroupOrderResponseDM> createGroupOrder({
    @Field('business_uuid') required String businessUuid,
    @Field('branch_uuid') String? branchUuid,
    @Field('reservation_uuid') String? reservationUuid,
    @Field('origin') String? origin, // menu | qr | reservation
  });

  @PATCH('/group-orders/{uuid}/lock')
  Future<GroupOrderResponseDM> lockGroupOrder(@Path('uuid') String uuid);

  /// Reabre una orden cerrada SIN pagos (F2b §C.1, solo host).
  @PATCH('/group-orders/{uuid}/unlock')
  Future<GroupOrderResponseDM> unlockGroupOrder(@Path('uuid') String uuid);

  @PATCH('/group-orders/{uuid}/cancel')
  Future<GroupOrderResponseDM> cancelGroupOrder(@Path('uuid') String uuid);

  /// Transfiere la titularidad a otro participante (F2b §A.1, solo host).
  @POST('/group-orders/{uuid}/transfer-host')
  Future<GroupOrderResponseDM> transferHost(
    @Path('uuid') String uuid, {
    @Field('participant_uuid') required String participantUuid,
  });

  // ── Participantes ──────────────────────────────────────────────

  @POST('/group-orders/{uuid}/participants')
  Future<GroupOrderResponseDM> joinGroupOrder(@Path('uuid') String uuid);

  @DELETE('/group-orders/{uuid}/participants/{participantUuid}')
  Future<GroupOrderResponseDM> removeParticipant(
    @Path('uuid') String uuid,
    @Path('participantUuid') String participantUuid,
  );

  // ── Items ──────────────────────────────────────────────────────

  @POST('/group-orders/{uuid}/items')
  Future<GroupOrderResponseDM> addItem(
    @Path('uuid') String uuid, {
    @Field('itemable_type') required String itemableType, // food | drink | combo
    @Field('itemable_uuid') required String itemableUuid,
    @Field('quantity') required int quantity,
    @Field('notes') String? notes,
  });

  @PATCH('/group-orders/{uuid}/items/{itemUuid}')
  Future<GroupOrderResponseDM> updateItem(
    @Path('uuid') String uuid,
    @Path('itemUuid') String itemUuid, {
    @Field('quantity') int? quantity,
    @Field('notes') String? notes,
  });

  @DELETE('/group-orders/{uuid}/items/{itemUuid}')
  Future<GroupOrderResponseDM> removeItem(
    @Path('uuid') String uuid,
    @Path('itemUuid') String itemUuid,
  );

  // ── Invitaciones ───────────────────────────────────────────────

  @POST('/group-orders/{uuid}/invitations')
  Future<GroupInviteResponseDM> createInvitation(@Path('uuid') String uuid);

  // ── Pago (split) ───────────────────────────────────────────────

  /// Crea el PaymentIntent de la parte del usuario actual. El backend calcula
  /// el monto server-side; el cliente solo recibe el client_secret.
  ///
  /// F2b "yo invito": con [coverParticipantUuids] el pago cubre la parte de
  /// ESOS participantes (Σ remaining_due, calculado 100% server-side).
  @POST('/group-orders/{uuid}/pay-intent')
  Future<PayIntentResponseDM> createPayIntent(
    @Path('uuid') String uuid, {
    @Field('cover_participant_uuids') List<String>? coverParticipantUuids,
  });
}
