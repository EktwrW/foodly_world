import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_order_dm.freezed.dart';
part 'group_order_dm.g.dart';

/// Modelos de "Group Orders & Split Payments".
/// Espejo de la API de be-foodly (ver docs/group-orders-design-spec.md §3).
///
/// Los montos llegan como decimal(10,2): Laravel los serializa como String
/// ("12.00") o número según el cast — `_money` normaliza ambos a double.

double _money(Object? v) => v == null
    ? 0
    : v is num
        ? v.toDouble()
        : double.tryParse(v.toString()) ?? 0;

// ─────────────────────────────────────────────────────────────────────────
// Enums
// ─────────────────────────────────────────────────────────────────────────

enum GroupOrderStatus {
  @JsonValue('open')
  open,
  @JsonValue('locked')
  locked,
  @JsonValue('paying')
  paying,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('completed')
  completed,
  @JsonValue('expired')
  expired,
  @JsonValue('cancelled')
  cancelled,
}

/// Modo de división elegido por el host al cerrar la orden (F2c §B.1).
enum GroupSplitMode {
  @JsonValue('by_items')
  byItems,
  @JsonValue('equal_split')
  equalSplit,
}

enum GroupParticipantRole {
  @JsonValue('host')
  host,
  @JsonValue('member')
  member,
}

enum GroupPaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('processing')
  processing,
  @JsonValue('paid')
  paid,
  @JsonValue('refunded')
  refunded,
}

// ─────────────────────────────────────────────────────────────────────────
// Item de la orden grupal
// ─────────────────────────────────────────────────────────────────────────

@freezed
abstract class GroupOrderItemDM with _$GroupOrderItemDM {
  const GroupOrderItemDM._();

  const factory GroupOrderItemDM({
    required String uuid,
    @JsonKey(name: 'participant_uuid') String? participantUuid,
    @JsonKey(name: 'name_snapshot') @Default('') String name,
    // Precio congelado en el lock; antes del lock se usa el preview.
    @JsonKey(name: 'unit_price_at_lock', fromJson: _money) @Default(0) double unitPriceAtLock,
    @JsonKey(name: 'unit_price_preview', fromJson: _money) @Default(0) double unitPricePreview,
    @Default(1) int quantity,
    // Compartido (F2c): su importe se reparte entre todos en by_items.
    @Default(false) bool shared,
    String? notes,
  }) = _GroupOrderItemDM;

  factory GroupOrderItemDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderItemDMFromJson(json);

  /// Precio unitario efectivo (congelado si existe, si no el preview).
  double get effectiveUnitPrice => unitPriceAtLock > 0 ? unitPriceAtLock : unitPricePreview;

  /// Total de línea (precio efectivo × cantidad).
  double get lineTotal => effectiveUnitPrice * quantity;
}

// ─────────────────────────────────────────────────────────────────────────
// Participante de la orden grupal
// ─────────────────────────────────────────────────────────────────────────

@freezed
abstract class GroupOrderParticipantDM with _$GroupOrderParticipantDM {
  const GroupOrderParticipantDM._();

  const factory GroupOrderParticipantDM({
    required String uuid,
    @JsonKey(name: 'display_name') @Default('') String displayName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @Default(GroupParticipantRole.member) GroupParticipantRole role,
    @JsonKey(name: 'payment_status') @Default(GroupPaymentStatus.pending) GroupPaymentStatus paymentStatus,
    @JsonKey(name: 'amount_due', fromJson: _money) @Default(0) double amountDue,
    @JsonKey(name: 'amount_paid', fromJson: _money) @Default(0) double amountPaid,
    // "Yo invito" (F2b): uuid del participante que cubrió su pago; null = pagó él mismo.
    @JsonKey(name: 'paid_by_participant_uuid') String? paidByParticipantUuid,
  }) = _GroupOrderParticipantDM;

  factory GroupOrderParticipantDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderParticipantDMFromJson(json);

  bool get isHost => role == GroupParticipantRole.host;
  bool get hasPaid => paymentStatus == GroupPaymentStatus.paid;
  bool get isProcessing => paymentStatus == GroupPaymentStatus.processing;

  /// Su parte la pagó otro participante ("yo invito").
  bool get wasCoveredByOther => hasPaid && paidByParticipantUuid != null;

  /// Saldo pendiente del participante.
  double get remainingDue => (amountDue - amountPaid).clamp(0, double.infinity);
}

// ─────────────────────────────────────────────────────────────────────────
// Orden grupal
// ─────────────────────────────────────────────────────────────────────────

@freezed
abstract class GroupOrderDM with _$GroupOrderDM {
  const GroupOrderDM._();

  const factory GroupOrderDM({
    required String uuid,
    @Default(GroupOrderStatus.open) GroupOrderStatus status,
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_logo') String? businessLogo,
    @Default('EUR') String currency,
    @JsonKey(name: 'split_mode') @Default(GroupSplitMode.byItems) GroupSplitMode splitMode,
    // Tarifa fija por transacción a cargo del comensal (plataforma de pagos).
    // La UI SIEMPRE la muestra en el desglose antes de pagar.
    @JsonKey(name: 'payer_fixed_fee', fromJson: _money) @Default(0.25) double payerFixedFee,
    @JsonKey(fromJson: _money) @Default(0) double subtotal,
    @JsonKey(name: 'total_amount', fromJson: _money) @Default(0) double totalAmount,
    @JsonKey(name: 'total_paid', fromJson: _money) @Default(0) double totalPaid,
    @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
    // Ventana de gracia tras vencer el deadline (F2b §A.2); null = sin gracia.
    @JsonKey(name: 'grace_ends_at') DateTime? graceEndsAt,
    @Default(<GroupOrderParticipantDM>[]) List<GroupOrderParticipantDM> participants,
    @Default(<GroupOrderItemDM>[]) List<GroupOrderItemDM> items,
  }) = _GroupOrderDM;

  factory GroupOrderDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderDMFromJson(json);

  bool get isOpen => status == GroupOrderStatus.open;
  bool get isLocked => status == GroupOrderStatus.locked;
  bool get isPayable => status == GroupOrderStatus.locked || status == GroupOrderStatus.paying;
  bool get isConfirmed => status == GroupOrderStatus.confirmed;

  /// Cuántos participantes ya pagaron.
  int get paidCount => participants.where((p) => p.hasPaid).length;

  /// Participantes con saldo pendiente y sin pago en curso — los "cubribles"
  /// del flujo "yo invito" (F2b §A.2).
  List<GroupOrderParticipantDM> get coverableParticipants =>
      participants.where((p) => p.remainingDue > 0 && !p.isProcessing).toList();

  /// Total pendiente de pago de toda la orden.
  double get totalRemaining => (totalAmount - totalPaid).clamp(0, double.infinity);

  /// En ventana de gracia (deadline vencido, aún no expirada).
  bool get isInGracePeriod =>
      isPayable && graceEndsAt != null && graceEndsAt!.isAfter(DateTime.now());

  /// Progreso de pago [0, 1].
  double get paymentProgress =>
      totalAmount <= 0 ? 0 : (totalPaid / totalAmount).clamp(0, 1);

  /// Items pedidos por un participante dado.
  List<GroupOrderItemDM> itemsFor(String participantUuid) =>
      items.where((i) => i.participantUuid == participantUuid).toList();

  /// Subtotal "vivo" de un participante: antes del lock suma sus líneas al
  /// precio preview; tras el lock devuelve su amount_due congelado.
  double liveSubtotalFor(GroupOrderParticipantDM p) {
    if (!isOpen) return p.amountDue;
    return itemsFor(p.uuid).fold<double>(0, (acc, i) => acc + i.lineTotal);
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Response DMs (envoltorios de la API)
// ─────────────────────────────────────────────────────────────────────────

/// Detalle de una orden grupal + la parte del usuario actual.
@freezed
abstract class GroupOrderResponseDM with _$GroupOrderResponseDM {
  const factory GroupOrderResponseDM({
    @Default(true) bool success,
    @JsonKey(name: 'group_order') required GroupOrderDM groupOrder,
    @JsonKey(name: 'my_share', fromJson: _money) @Default(0) double myShare,
    @JsonKey(name: 'my_participant_uuid') String? myParticipantUuid,
  }) = _GroupOrderResponseDM;

  factory GroupOrderResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderResponseDMFromJson(json);
}

/// Lista de órdenes grupales del usuario.
@freezed
abstract class GroupOrdersListResponseDM with _$GroupOrdersListResponseDM {
  const factory GroupOrdersListResponseDM({
    @Default(true) bool success,
    @JsonKey(name: 'group_orders') @Default(<GroupOrderDM>[]) List<GroupOrderDM> groupOrders,
  }) = _GroupOrdersListResponseDM;

  factory GroupOrdersListResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrdersListResponseDMFromJson(json);
}

/// Respuesta de `pay-intent`: el client_secret para confirmar el pago en Stripe.
@freezed
abstract class PayIntentResponseDM with _$PayIntentResponseDM {
  const factory PayIntentResponseDM({
    @JsonKey(name: 'client_secret') String? clientSecret,
    @JsonKey(name: 'transaction_uuid') String? transactionUuid,
    @JsonKey(fromJson: _money) @Default(0) double amount,
    // Propina (F2c §B.2), tarifa del comensal y total cobrado (base+tip+fee).
    @JsonKey(name: 'tip_amount', fromJson: _money) @Default(0) double tipAmount,
    @JsonKey(name: 'service_fee_amount', fromJson: _money) @Default(0) double serviceFeeAmount,
    @JsonKey(name: 'total_charged', fromJson: _money) @Default(0) double totalCharged,
    @Default('EUR') String currency,
    // Participantes que este pago cubre ("yo invito", F2b).
    @JsonKey(name: 'covered_participant_uuids') @Default(<String>[]) List<String> coveredParticipantUuids,
  }) = _PayIntentResponseDM;

  factory PayIntentResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PayIntentResponseDMFromJson(json);
}

/// Respuesta al generar una invitación por link universal.
@freezed
abstract class GroupInviteResponseDM with _$GroupInviteResponseDM {
  const factory GroupInviteResponseDM({
    @Default(true) bool success,
    @JsonKey(name: 'invite_token') String? inviteToken,
    @JsonKey(name: 'invite_url') String? inviteUrl,
  }) = _GroupInviteResponseDM;

  factory GroupInviteResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteResponseDMFromJson(json);
}
