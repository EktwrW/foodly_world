import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:logger/logger.dart';

/// F4a — estado del panel "Órdenes en vivo" (maquetas v3).
///
/// Sin freezed a propósito: es un estado plano de lista (orders + counts +
/// bucket + flags) sin variantes — copyWith manual alcanza y el cubit queda
/// 100% testeable con un fake del repo, como el resto del feature.
class ManagerOrdersState {
  final bool loading;
  final List<GroupOrderDM> orders;
  final ManagerOrderCountsDM counts;

  /// Bucket activo del chip: null = todas (pending|preparing|ready|delivered).
  final String? bucket;
  final String? error;

  const ManagerOrdersState({
    this.loading = false,
    this.orders = const [],
    this.counts = const ManagerOrderCountsDM(),
    this.bucket,
    this.error,
  });

  ManagerOrdersState copyWith({
    bool? loading,
    List<GroupOrderDM>? orders,
    ManagerOrderCountsDM? counts,
    Object? bucket = _sentinel,
    Object? error = _sentinel,
  }) =>
      ManagerOrdersState(
        loading: loading ?? this.loading,
        orders: orders ?? this.orders,
        counts: counts ?? this.counts,
        bucket: bucket == _sentinel ? this.bucket : bucket as String?,
        error: error == _sentinel ? this.error : error as String?,
      );

  static const _sentinel = Object();
}

/// Cubit del panel del negocio: lista live por buckets + acciones de
/// fulfillment/checklist/mesa. Realtime vía canal `business-orders.{uuid}`
/// (opcional: null en tests) con las mismas garantías del cliente
/// (fallback polling, lifecycle-aware).
class ManagerOrdersCubit extends Cubit<ManagerOrdersState> {
  final GroupOrderRepo _repo;
  final Logger _logger;
  final GroupOrderRealtimeService? _realtime;
  final String businessUuid;

  ManagerOrdersCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    required this.businessUuid,
    GroupOrderRealtimeService? realtime,
  })  : _repo = repo,
        _logger = logger,
        _realtime = realtime,
        super(const ManagerOrdersState());

  Future<void> load() async {
    emit(state.copyWith(loading: true, error: null));
    await _fetch();
    // Canal live del panel: cualquier evento → refetch silencioso.
    await _realtime?.watchBusiness(businessUuid, onTouched: refetchSilently);
  }

  Future<void> selectBucket(String? bucket) async {
    emit(state.copyWith(bucket: bucket, loading: true, error: null));
    await _fetch();
  }

  /// Refetch sin loading (realtime/polling): la lista no parpadea.
  Future<void> refetchSilently() => _fetch();

  Future<void> _fetch() async {
    final res = await _repo.managerOrders(businessUuid, bucket: state.bucket);
    res.when(
      success: (r) => emit(state.copyWith(
        loading: false,
        orders: r.orders,
        counts: r.counts,
        error: null,
      )),
      failure: (e) {
        _logger.e(e);
        // '' = error sin detalle (la UI muestra el genérico i18n). Nunca
        // e.toString(): resuelve DI por dentro y explota fuera de la app.
        emit(state.copyWith(loading: false, error: e.serverMessage ?? ''));
      },
    );
  }

  // ── Acciones del detalle (aplican la orden devuelta sobre la lista) ──

  Future<bool> advanceFulfillment(String orderUuid, String status) => _applyAction(
        () => _repo.managerSetFulfillment(orderUuid, status: status),
      );

  Future<bool> setItemDelivered(String orderUuid, String itemUuid, bool delivered) =>
      _applyAction(
        () => _repo.managerSetItemDelivered(orderUuid, itemUuid, delivered: delivered),
      );

  Future<bool> deliverAll(String orderUuid) =>
      _applyAction(() => _repo.managerDeliverAll(orderUuid));

  /// F4b.1: anula/restaura un ítem (plato devuelto) — deja de cobrarse.
  Future<bool> setItemVoided(String orderUuid, String itemUuid, bool voided, {String? reason}) =>
      _applyAction(
        () => _repo.managerSetItemVoided(orderUuid, itemUuid, voided: voided, reason: reason),
      );

  Future<bool> setTableLabel(String orderUuid, String? label) =>
      _applyAction(() => _repo.managerSetTable(orderUuid, tableLabel: label));

  Future<bool> _applyAction(
    Future<ApiResult<GroupOrderResponseDM>> Function() call,
  ) async {
    final res = await call();
    return res.when(
      success: (r) {
        final updated = r.groupOrder;
        // La orden actualizada reemplaza a su versión en la lista; los
        // contadores se re-sincronizan con un refetch silencioso (los mueve
        // el cambio de bucket de esa orden).
        emit(state.copyWith(
          orders: [
            for (final o in state.orders) o.uuid == updated.uuid ? updated : o,
          ],
          error: null,
        ));
        refetchSilently();
        return true;
      },
      failure: (e) {
        _logger.e(e);
        emit(state.copyWith(error: e.serverMessage ?? ''));
        return false;
      },
    );
  }

  @override
  Future<void> close() async {
    await _realtime?.unwatch();
    return super.close();
  }
}
