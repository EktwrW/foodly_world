import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_order_vm.freezed.dart';

/// ViewModel de la pantalla de detalle de una orden grupal.
@freezed
abstract class GroupOrderVM with _$GroupOrderVM {
  const GroupOrderVM._();

  const factory GroupOrderVM({
    GroupOrderDM? order,
    @Default(0) double myShare,
    String? myParticipantUuid,
    @Default(false) bool isPaying,
    String? errorMessage,
  }) = _GroupOrderVM;

  bool get hasOrder => order != null;

  /// ¿El usuario actual ya pagó su parte?
  bool get iHavePaid {
    final o = order;
    final me = myParticipantUuid;
    if (o == null || me == null) return false;
    return o.participants.any((p) => p.uuid == me && p.hasPaid);
  }

  /// ¿Se puede mostrar el CTA de pago?
  bool get canPay => (order?.isPayable ?? false) && myShare > 0 && !isPaying && !iHavePaid;
}
