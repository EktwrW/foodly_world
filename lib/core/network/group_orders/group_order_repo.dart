import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_client.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

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

  Future<ApiResult<GroupOrderResponseDM>> joinGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.joinGroupOrder(uuid));
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
