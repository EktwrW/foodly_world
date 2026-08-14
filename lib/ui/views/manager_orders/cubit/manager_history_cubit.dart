import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:logger/logger.dart';

/// F4a.1 — grupo de un día del historial: fecha + órdenes + resumen.
class HistoryDayGroup {
  final DateTime day;
  final List<GroupOrderDM> orders;

  const HistoryDayGroup({required this.day, required this.orders});

  double get dayTotal => orders.fold(0, (acc, o) => acc + o.totalAmount);
}

/// Agrupa órdenes (ya ordenadas desc por confirmed_at) en días. PURA para
/// testear sin UI: preserva el orden, suma totales por día.
List<HistoryDayGroup> groupOrdersByDay(List<GroupOrderDM> orders) {
  final groups = <DateTime, List<GroupOrderDM>>{};
  for (final o in orders) {
    final ts = o.confirmedAt;
    if (ts == null) continue;
    final local = ts.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    groups.putIfAbsent(day, () => []).add(o);
  }
  final days = groups.keys.toList()..sort((a, b) => b.compareTo(a));
  return [for (final d in days) HistoryDayGroup(day: d, orders: groups[d]!)];
}

class ManagerHistoryState {
  final bool loading;
  final bool loadingMore;
  final List<GroupOrderDM> orders;
  final bool hasMore;
  final String? nextBefore;
  final String? error;

  const ManagerHistoryState({
    this.loading = false,
    this.loadingMore = false,
    this.orders = const [],
    this.hasMore = false,
    this.nextBefore,
    this.error,
  });

  ManagerHistoryState copyWith({
    bool? loading,
    bool? loadingMore,
    List<GroupOrderDM>? orders,
    bool? hasMore,
    Object? nextBefore = _sentinel,
    Object? error = _sentinel,
  }) =>
      ManagerHistoryState(
        loading: loading ?? this.loading,
        loadingMore: loadingMore ?? this.loadingMore,
        orders: orders ?? this.orders,
        hasMore: hasMore ?? this.hasMore,
        nextBefore: nextBefore == _sentinel ? this.nextBefore : nextBefore as String?,
        error: error == _sentinel ? this.error : error as String?,
      );

  static const _sentinel = Object();
}

/// Historial del negocio con scroll infinito (keyset por confirmed_at).
class ManagerHistoryCubit extends Cubit<ManagerHistoryState> {
  final GroupOrderRepo _repo;
  final Logger _logger;
  final String businessUuid;

  ManagerHistoryCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    required this.businessUuid,
  })  : _repo = repo,
        _logger = logger,
        super(const ManagerHistoryState());

  Future<void> load() async {
    emit(const ManagerHistoryState(loading: true));
    final res = await _repo.managerOrderHistory(businessUuid);
    res.when(
      success: (r) => emit(ManagerHistoryState(
        orders: r.orders,
        hasMore: r.hasMore,
        nextBefore: r.nextBefore,
      )),
      failure: (e) {
        _logger.e(e);
        emit(ManagerHistoryState(error: e.serverMessage ?? ''));
      },
    );
  }

  /// Página siguiente (scroll infinito). No-op sin cursor o ya cargando.
  Future<void> loadMore() async {
    if (!state.hasMore || state.loadingMore || state.nextBefore == null) return;
    emit(state.copyWith(loadingMore: true, error: null));

    final res = await _repo.managerOrderHistory(businessUuid, before: state.nextBefore);
    res.when(
      success: (r) => emit(state.copyWith(
        loadingMore: false,
        orders: [...state.orders, ...r.orders],
        hasMore: r.hasMore,
        nextBefore: r.nextBefore,
      )),
      failure: (e) {
        _logger.e(e);
        emit(state.copyWith(loadingMore: false, error: e.serverMessage ?? ''));
      },
    );
  }

  /// Corrige el motivo de una orden ya cerrada (impagada ↔ cobrada en caja) y
  /// sustituye SU fila en la lista.
  ///
  /// No se recarga el historial entero a propósito: son páginas acumuladas por
  /// scroll y volver a pedir la primera dejaría al manager arriba del todo,
  /// perdiendo lo que había bajado a buscar.
  Future<bool> amendClosure(String orderUuid, String reason) async {
    final res = await _repo.managerAmendClosure(orderUuid, reason: reason);

    return res.when(
      success: (r) {
        final actualizada = r.groupOrder;
        emit(state.copyWith(
          orders: [
            for (final o in state.orders) o.uuid == actualizada.uuid ? actualizada : o,
          ],
          error: null,
        ));

        return true;
      },
      failure: (e) {
        _logger.e(e);
        emit(state.copyWith(error: e.serverMessage ?? ''));

        return false;
      },
    );
  }
}
