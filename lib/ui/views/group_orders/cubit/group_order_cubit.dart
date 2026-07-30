import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'group_order_cubit.freezed.dart';
part 'group_order_state.dart';

/// Cubit de la pantalla de detalle de una orden grupal (split payments).
/// Patrón de MyReservationsCubit. Real-time (Pusher) se integra en F1-D.
class GroupOrderCubit extends Cubit<GroupOrderState> {
  final GroupOrderRepo _repo;
  final Logger _logger;
  GroupOrderVM _vm;

  GroupOrderCubit({required GroupOrderRepo repo, required Logger logger})
      : _repo = repo,
        _logger = logger,
        _vm = const GroupOrderVM(),
        super(const GroupOrderState.initial(GroupOrderVM()));

  GroupOrderVM get vm => _vm;

  /// Carga (o recarga) el detalle de una orden por su uuid.
  Future<void> load(String uuid) async {
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.getGroupOrder(uuid);
    result.when(
      success: _applyResponse,
      failure: _onError,
    );
  }

  /// Host: cierra la orden (congela precios y habilita el pago).
  Future<void> lock() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.lockGroupOrder(uuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Host: reabre una orden cerrada SIN pagos (F2b §C.1).
  Future<void> unlock() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.unlockGroupOrder(uuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Host: transfiere la titularidad a otro participante (F2b §A.1).
  Future<void> transferHost(String participantUuid) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.transferHost(uuid, participantUuid: participantUuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Agrega un ítem (solo cuando la orden está OPEN).
  Future<void> addItem({
    required String itemableType,
    required String itemableUuid,
    int quantity = 1,
    String? notes,
  }) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    final result = await _repo.addItem(
      uuid,
      itemableType: itemableType,
      itemableUuid: itemableUuid,
      quantity: quantity,
      notes: notes,
    );
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Elimina un ítem (solo OPEN, dueño del ítem o host).
  Future<void> removeItem(String itemUuid) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    final result = await _repo.removeItem(uuid, itemUuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Unirse a la orden (invitado autenticado).
  Future<void> join(String uuid) async {
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.joinGroupOrder(uuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Genera el PaymentIntent de la parte del usuario actual. Devuelve la
  /// respuesta (con client_secret) para que la página confirme el pago con
  /// el Stripe PaymentSheet. El estado `paid` se sella vía webhook + refetch.
  ///
  /// F2b "yo invito": con [coverParticipantUuids] el pago cubre la parte de
  /// esos participantes (el monto lo calcula el backend: Σ remaining_due).
  Future<PayIntentResponseDM?> createPayIntent({
    List<String>? coverParticipantUuids,
  }) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return null;

    _vm = _vm.copyWith(isPaying: true, errorMessage: null);
    emit(GroupOrderState.loaded(_vm));

    final result = await _repo.createPayIntent(
      uuid,
      coverParticipantUuids: coverParticipantUuids,
    );
    return result.when(
      success: (r) {
        _vm = _vm.copyWith(isPaying: false);
        emit(GroupOrderState.loaded(_vm));
        return r;
      },
      failure: (e) {
        _logger.e(e);
        _vm = _vm.copyWith(isPaying: false, errorMessage: e.toString());
        emit(GroupOrderState.error(_vm, e.toString()));
        return null;
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────

  void _applyResponse(GroupOrderResponseDM r) {
    _vm = _vm.copyWith(
      order: r.groupOrder,
      myShare: r.myShare,
      myParticipantUuid: r.myParticipantUuid ?? _vm.myParticipantUuid,
      errorMessage: null,
    );
    emit(GroupOrderState.loaded(_vm));
  }

  void _onError(Object e) {
    _logger.e(e);
    _vm = _vm.copyWith(errorMessage: e.toString());
    emit(GroupOrderState.error(_vm, e.toString()));
  }
}
