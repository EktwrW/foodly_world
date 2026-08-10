import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_client.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/data_models/group_orders/stripe_connect_dm.dart';

/// Repositorio de Group Orders. Cada método envuelve la llamada del cliente en
/// un `ApiResult<T>` (mismo patrón que ReservationRepo).
class GroupOrderRepo {
  final GroupOrderClient _client;

  const GroupOrderRepo({required GroupOrderClient client}) : _client = client;

  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async {
    try {
      return ApiResult.success(await _client.getMyGroupOrders());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.getGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> createGroupOrder({
    required String businessUuid,
    String? branchUuid,
    String? reservationUuid,
    String? origin,
  }) async {
    try {
      return ApiResult.success(await _client.createGroupOrder(
        businessUuid: businessUuid,
        branchUuid: branchUuid,
        reservationUuid: reservationUuid,
        origin: origin,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2c §B.1: [splitMode] = 'by_items' | 'equal_split' (null → default backend).
  Future<ApiResult<GroupOrderResponseDM>> lockGroupOrder(String uuid, {String? splitMode}) async {
    try {
      return ApiResult.success(await _client.lockGroupOrder(uuid, splitMode: splitMode));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2c: edita un ítem (cantidad/notas/compartido) mientras la orden está OPEN.
  Future<ApiResult<GroupOrderResponseDM>> updateItem(
    String uuid,
    String itemUuid, {
    int? quantity,
    String? notes,
    bool? shared,
  }) async {
    try {
      return ApiResult.success(await _client.updateItem(
        uuid,
        itemUuid,
        quantity: quantity,
        notes: notes,
        shared: shared,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2b §C.1 — reabre una orden cerrada sin pagos (solo host).
  Future<ApiResult<GroupOrderResponseDM>> unlockGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.unlockGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2b §A.1 — transfiere la titularidad a otro participante (solo host).
  Future<ApiResult<GroupOrderResponseDM>> transferHost(
    String uuid, {
    required String participantUuid,
  }) async {
    try {
      return ApiResult.success(
        await _client.transferHost(uuid, participantUuid: participantUuid),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> cancelGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.cancelGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── F4a-6: onboarding de pagos (Stripe Connect) ────────────────

  Future<ApiResult<StripeConnectStatusDM>> stripeStatus(String businessUuid) async {
    try {
      return ApiResult.success(await _client.stripeStatus(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<StripeOnboardResponseDM>> stripeOnboard(String businessUuid) async {
    try {
      return ApiResult.success(await _client.stripeOnboard(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── F4a: panel "Órdenes en vivo" (solo dueño) ──────────────────

  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerOrders(businessUuid, bucket: bucket, page: page),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4a.1: historial con keyset pagination.
  Future<ApiResult<ManagerHistoryResponseDM>> managerOrderHistory(
    String businessUuid, {
    String? before,
    int? limit,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerOrderHistory(businessUuid, before: before, limit: limit),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async {
    try {
      return ApiResult.success(await _client.managerSetFulfillment(uuid, status: status));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerSetItemDelivered(
    String uuid,
    String itemUuid, {
    required bool delivered,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerSetItemDelivered(uuid, itemUuid, delivered: delivered),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b.1: anula/restaura un ítem (plato devuelto — no se cobra).
  Future<ApiResult<GroupOrderResponseDM>> managerSetItemVoided(
    String uuid,
    String itemUuid, {
    required bool voided,
    String? reason,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerSetItemVoided(uuid, itemUuid, voided: voided, reason: reason),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerDeliverAll(String uuid) async {
    try {
      return ApiResult.success(await _client.managerDeliverAll(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerSetTable(
    String uuid, {
    String? tableLabel,
  }) async {
    try {
      return ApiResult.success(await _client.managerSetTable(uuid, tableLabel: tableLabel));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: el negocio cierra una cuenta cobrada en caja (o impagada). No cobra
  /// comisión — Foodly no procesó el dinero.
  Future<ApiResult<GroupOrderResponseDM>> managerCloseTab(
    String uuid, {
    required String reason,
  }) async {
    try {
      return ApiResult.success(await _client.managerCloseTab(uuid, reason: reason));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b (cuenta abierta): manda la tanda actual a cocina, sin pago.
  Future<ApiResult<GroupOrderResponseDM>> sendBatch(String uuid) async {
    try {
      return ApiResult.success(await _client.sendBatch(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: pide la cuenta (congela el agregado y habilita el checkout).
  Future<ApiResult<GroupOrderResponseDM>> requestBill(String uuid, {String? splitMode}) async {
    try {
      return ApiResult.success(await _client.requestBill(uuid, splitMode: splitMode));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: la mesa avisa que paga en caja (el negocio confirma al cobrar).
  Future<ApiResult<GroupOrderResponseDM>> requestCashPayment(String uuid) async {
    try {
      return ApiResult.success(await _client.requestCashPayment(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: deshace el aviso de pago en caja.
  Future<ApiResult<GroupOrderResponseDM>> cancelCashPayment(String uuid) async {
    try {
      return ApiResult.success(await _client.cancelCashPayment(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: modo de cobro del negocio (solo dueño).
  Future<ApiResult<PaymentModeResponseDM>> updatePaymentMode(
    String businessUuid, {
    required String mode,
  }) async {
    try {
      return ApiResult.success(await _client.updatePaymentMode(businessUuid, mode: mode));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4a (caso bar): siguiente ronda de la mesa.
  Future<ApiResult<GroupOrderResponseDM>> nextRound(String uuid) async {
    try {
      return ApiResult.success(await _client.nextRound(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// e2e r4: host elimina definitivamente una orden vacía.
  Future<ApiResult<bool>> deleteGroupOrder(String uuid) async {
    try {
      await _client.deleteGroupOrder(uuid);
      return const ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// e2e r4: miembro sin ítems propios abandona la orden.
  Future<ApiResult<bool>> leaveGroupOrder(String uuid) async {
    try {
      await _client.leaveGroupOrder(uuid);
      return const ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> joinGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.joinGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F3a: unirse con código corto de invitación.
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async {
    try {
      return ApiResult.success(await _client.joinByCode(code: code));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> removeParticipant(
    String uuid,
    String participantUuid,
  ) async {
    try {
      return ApiResult.success(await _client.removeParticipant(uuid, participantUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> addItem(
    String uuid, {
    required String itemableType,
    required String itemableUuid,
    required int quantity,
    String? notes,
  }) async {
    try {
      return ApiResult.success(await _client.addItem(
        uuid,
        itemableType: itemableType,
        itemableUuid: itemableUuid,
        quantity: quantity,
        notes: notes,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> removeItem(String uuid, String itemUuid) async {
    try {
      return ApiResult.success(await _client.removeItem(uuid, itemUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupInviteResponseDM>> createInvitation(String uuid) async {
    try {
      return ApiResult.success(await _client.createInvitation(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2b "yo invito": con [coverParticipantUuids] el pago cubre la parte de
  /// esos participantes (monto server-side).
  Future<ApiResult<PayIntentResponseDM>> createPayIntent(
    String uuid, {
    List<String>? coverParticipantUuids,
    double? tipAmount,
  }) async {
    try {
      return ApiResult.success(await _client.createPayIntent(
        uuid,
        coverParticipantUuids: coverParticipantUuids,
        tipAmount: tipAmount,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
