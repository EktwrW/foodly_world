import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/data_models/group_orders/stripe_connect_dm.dart';
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

  /// F2c §B.1: el host elige el modo de división al cerrar
  /// (by_items | equal_split; default backend: by_items).
  @PATCH('/group-orders/{uuid}/lock')
  Future<GroupOrderResponseDM> lockGroupOrder(
    @Path('uuid') String uuid, {
    @Field('split_mode') String? splitMode,
  });

  /// Reabre una orden cerrada SIN pagos (F2b §C.1, solo host).
  @PATCH('/group-orders/{uuid}/unlock')
  Future<GroupOrderResponseDM> unlockGroupOrder(@Path('uuid') String uuid);

  @PATCH('/group-orders/{uuid}/cancel')
  Future<GroupOrderResponseDM> cancelGroupOrder(@Path('uuid') String uuid);

  /// e2e r4: el host elimina DEFINITIVAMENTE una orden vacía (OPEN, sin
  /// ítems ni pagos). Con actividad, el camino es cancelGroupOrder.
  @DELETE('/group-orders/{uuid}')
  Future<void> deleteGroupOrder(@Path('uuid') String uuid);

  /// Transfiere la titularidad a otro participante (F2b §A.1, solo host).
  @POST('/group-orders/{uuid}/transfer-host')
  Future<GroupOrderResponseDM> transferHost(
    @Path('uuid') String uuid, {
    @Field('participant_uuid') required String participantUuid,
  });

  // ── Participantes ──────────────────────────────────────────────

  @POST('/group-orders/{uuid}/participants')
  Future<GroupOrderResponseDM> joinGroupOrder(@Path('uuid') String uuid);

  /// F3a: unirse con el código corto de invitación de la mesa.
  @POST('/group-orders/join')
  Future<GroupOrderResponseDM> joinByCode({@Field('code') required String code});

  /// e2e r4: un miembro SIN ítems propios abandona una orden OPEN.
  @POST('/group-orders/{uuid}/leave')
  Future<void> leaveGroupOrder(@Path('uuid') String uuid);

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
    @Field('shared') bool? shared, // F2c: compartido con la mesa
  });

  @PATCH('/group-orders/{uuid}/items/{itemUuid}')
  Future<GroupOrderResponseDM> updateItem(
    @Path('uuid') String uuid,
    @Path('itemUuid') String itemUuid, {
    @Field('quantity') int? quantity,
    @Field('notes') String? notes,
    @Field('shared') bool? shared,
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
  // ── F4a-6: onboarding de pagos del negocio (Stripe Connect) ────

  @GET('/businesses/{businessUuid}/stripe/status')
  Future<StripeConnectStatusDM> stripeStatus(@Path('businessUuid') String businessUuid);

  @POST('/businesses/{businessUuid}/stripe/onboard')
  Future<StripeOnboardResponseDM> stripeOnboard(@Path('businessUuid') String businessUuid);

  // ── F4a: panel "Órdenes en vivo" del negocio (solo dueño) ──────

  /// F4b (cuenta abierta): manda la tanda actual a cocina, SIN pago.
  @POST('/group-orders/{uuid}/send')
  Future<GroupOrderResponseDM> sendBatch(@Path('uuid') String uuid);

  /// F4b: pide la cuenta — congela el agregado y habilita el checkout.
  @POST('/group-orders/{uuid}/request-bill')
  Future<GroupOrderResponseDM> requestBill(
    @Path('uuid') String uuid, {
    @Field('split_mode') String? splitMode,
  });

  /// F4b: modo de cobro del negocio (solo dueño).
  @PATCH('/manager/businesses/{businessUuid}/payment-mode')
  Future<PaymentModeResponseDM> updatePaymentMode(
    @Path('businessUuid') String businessUuid, {
    @Field('mode') required String mode,
  });

  @GET('/manager/businesses/{businessUuid}/group-orders')
  Future<ManagerOrdersResponseDM> managerOrders(
    @Path('businessUuid') String businessUuid, {
    @Query('bucket') String? bucket,
    @Query('page') int? page,
  });

  /// F4a.1: historial (días anteriores), keyset por confirmed_at.
  @GET('/manager/businesses/{businessUuid}/group-orders/history')
  Future<ManagerHistoryResponseDM> managerOrderHistory(
    @Path('businessUuid') String businessUuid, {
    @Query('before') String? before,
    @Query('limit') int? limit,
  });

  /// F4b.1: anula/restaura un ítem (plato devuelto — no se cobra).
  @PATCH('/manager/group-orders/{uuid}/items/{itemUuid}/void')
  Future<GroupOrderResponseDM> managerSetItemVoided(
    @Path('uuid') String uuid,
    @Path('itemUuid') String itemUuid, {
    @Field('voided') required bool voided,
    @Field('reason') String? reason,
  });

  @PATCH('/manager/group-orders/{uuid}/fulfillment')
  Future<GroupOrderResponseDM> managerSetFulfillment(
    @Path('uuid') String uuid, {
    @Field('status') required String status,
  });

  @PATCH('/manager/group-orders/{uuid}/items/{itemUuid}/delivery')
  Future<GroupOrderResponseDM> managerSetItemDelivered(
    @Path('uuid') String uuid,
    @Path('itemUuid') String itemUuid, {
    @Field('delivered') required bool delivered,
  });

  @POST('/manager/group-orders/{uuid}/items/deliver-all')
  Future<GroupOrderResponseDM> managerDeliverAll(@Path('uuid') String uuid);

  @PATCH('/manager/group-orders/{uuid}/table')
  Future<GroupOrderResponseDM> managerSetTable(
    @Path('uuid') String uuid, {
    @Field('table_label') String? tableLabel,
  });

  /// F4b: cerrar una cuenta abierta que NO se cobró por Foodly.
  /// `reason`: paid_offline (cobrada en caja) | unpaid (se fueron sin pagar).
  @POST('/manager/group-orders/{uuid}/close')
  Future<GroupOrderResponseDM> managerCloseTab(
    @Path('uuid') String uuid, {
    @Field('reason') required String reason,
  });

  /// F4a (caso bar): siguiente ronda de la mesa (lado cliente).
  @POST('/group-orders/{uuid}/next-round')
  Future<GroupOrderResponseDM> nextRound(@Path('uuid') String uuid);

  @POST('/group-orders/{uuid}/pay-intent')
  Future<PayIntentResponseDM> createPayIntent(
    @Path('uuid') String uuid, {
    @Field('cover_participant_uuids') List<String>? coverParticipantUuids,
    @Field('tip_amount') double? tipAmount, // F2c §B.2
  });
}
