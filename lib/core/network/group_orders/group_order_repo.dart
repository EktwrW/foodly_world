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

  Future<ApiResult<GroupOrderResponseDM>> lockGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.lockGroupOrder(uuid));
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

  Future<ApiResult<PayIntentResponseDM>> createPayIntent(String uuid) async {
    try {
      return ApiResult.success(await _client.createPayIntent(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
