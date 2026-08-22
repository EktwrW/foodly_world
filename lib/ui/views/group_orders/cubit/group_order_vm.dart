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
  /// Mi pago está en vuelo: lo sella el webhook, no la app.
  ///
  /// Incluye el caso en que lo disparó OTRO: quien paga toda la cuenta deja
  /// a todos los cubiertos en `processing` dentro de su transacción. Sin
  /// esto el botón del resto de la mesa seguía encendido —`hasPaid` todavía
  /// es false y su parte sigue debiéndose— y el 409 del backend
  /// ("Ana está pagando") aparecía recién después de tocar.
  bool get iAmProcessing {
    final o = order;
    final me = myParticipantUuid;
    if (o == null || me == null) return false;
    return o.participants.any((p) => p.uuid == me && p.isProcessing);
  }

  bool get canPay =>
      (order?.isPayable ?? false) && myShare > 0 && !isPaying && !iHavePaid && !iAmProcessing;
}
