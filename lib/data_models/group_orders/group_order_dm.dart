import 'package:foodly_world/core/enums/foodly_countries.dart';
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

/// F4a: fulfillment del negocio — eje independiente del pago, opcional y
/// saltable hacia adelante. null = el negocio aún no lo tocó.
enum GroupFulfillmentStatus {
  @JsonValue('preparing')
  preparing,
  @JsonValue('ready')
  ready,
  @JsonValue('delivered')
  delivered,
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

/// F4b — modo de cobro del negocio (elección explícita del dueño).
enum GroupPaymentMode {
  /// Prepago por ronda: pedir → pagar → entregar (bares, food trucks).
  @JsonValue('per_round')
  perRound,

  /// Cuenta abierta: pedir → comer → pagar (restaurante de mesa).
  @JsonValue('open_tab')
  openTab,
}

/// F4b — estado del CTA del cliente en cuenta abierta (maqueta A1-A4).
enum OpenTabCtaState {
  /// Hay ítems sin enviar → "Enviar orden".
  send,

  /// Tanda en cocina sin entregar → pago bloqueado con explicación.
  waiting,

  /// Todo enviado y entregado → "Pagar la cuenta · €total".
  pay,

  /// Cuenta ya pedida (orden lockeada) → checkout/split en curso.
  billed,

  /// La mesa avisó que paga EN CAJA y espera al mesero.
  ///
  /// Estado propio y no `billed` a propósito: `billed` cae al bloque de pago
  /// de la app, y acá justamente NO hay que ofrecer pagar — el dinero se
  /// entrega en el mostrador. Lo único que corresponde es decir que el
  /// negocio ya fue avisado, y dejar deshacerlo.
  cash,
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
    // F4a: tilde de entrega del manager (checklist parcial).
    @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    // F4b (cuenta abierta): tanda enviada a cocina. sentAt null = sigue en
    // el carrito (editable) y es lo que habilita "Enviar orden".
    @JsonKey(name: 'batch_no') int? batchNo,
    @JsonKey(name: 'sent_at') DateTime? sentAt,
    // F4b.1: el negocio anuló el ítem (plato devuelto/mal preparado): sigue
    // visible con su motivo, pero NO se cobra.
    @JsonKey(name: 'voided_at') DateTime? voidedAt,
    @JsonKey(name: 'voided_reason') String? voidedReason,
  }) = _GroupOrderItemDM;

  factory GroupOrderItemDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderItemDMFromJson(json);

  /// Precio unitario efectivo (congelado si existe, si no el preview).
  double get effectiveUnitPrice => unitPriceAtLock > 0 ? unitPriceAtLock : unitPricePreview;

  /// Total de línea (precio efectivo × cantidad).
  double get lineTotal => effectiveUnitPrice * quantity;

  /// F4b: ya viajó a cocina (inmutable) vs. sigue en el carrito.
  bool get isSent => sentAt != null;

  /// F4b.1: anulado por el negocio — visible, pero fuera de la cuenta.
  bool get isVoided => voidedAt != null;
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
    // Uuid del MENÚ del negocio: /visit-menu/:id lo necesita para aterrizar
    // en el menú tras unirse (la ruta NO lleva el uuid del negocio).
    @JsonKey(name: 'business_menu_uuid') String? businessMenuUuid,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_logo') String? businessLogo,
    // País del NEGOCIO de la orden — lo piden Apple Pay y Google Pay como
    // `merchantCountryCode`. Viene en la orden y no de la sesión: quien paga
    // es el comensal, y el restaurante no es suyo.
    @JsonKey(name: 'business_country', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    FoodlyCountries? businessCountry,
    @Default('EUR') String currency,
    @JsonKey(name: 'split_mode') @Default(GroupSplitMode.byItems) GroupSplitMode splitMode,
    // Tarifa fija por transacción a cargo del comensal (plataforma de pagos).
    // La UI SIEMPRE la muestra en el desglose antes de pagar.
    @JsonKey(name: 'payer_fixed_fee', fromJson: _money) @Default(0.25) double payerFixedFee,
    @JsonKey(fromJson: _money) @Default(0) double subtotal,
    @JsonKey(name: 'total_amount', fromJson: _money) @Default(0) double totalAmount,
    @JsonKey(name: 'total_paid', fromJson: _money) @Default(0) double totalPaid,
    // F4a "Órdenes en vivo": fulfillment + rondas + mesa.
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    @JsonKey(name: 'fulfillment_status', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    GroupFulfillmentStatus? fulfillmentStatus,
    @JsonKey(name: 'round_number') @Default(1) int roundNumber,
    @JsonKey(name: 'table_label') String? tableLabel,
    // F4b: modo de cobro del NEGOCIO (per_round | open_tab) + marca de
    // "cuenta pedida" — de acá sale el CTA mutante del cliente.
    @JsonKey(name: 'payment_mode', unknownEnumValue: GroupPaymentMode.perRound)
    @Default(GroupPaymentMode.perRound)
    GroupPaymentMode paymentMode,
    @JsonKey(name: 'bill_requested_at') DateTime? billRequestedAt,
    // F4b: la mesa avisó que paga en el mostrador. Campo propio y no
    // `billRequestedAt` porque ese arrastra el lock, el reparto y el
    // checkout — pagar en caja no necesita nada de eso.
    @JsonKey(name: 'cash_requested_at') DateTime? cashRequestedAt,
    // F4b: cómo terminó una cuenta que NO se cobró por Foodly
    // (paid_offline | unpaid | abandoned). null = ciclo normal de pago.
    @JsonKey(name: 'closed_reason') String? closedReason,
    @JsonKey(name: 'closed_at') DateTime? closedAt,
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

  // ── F4b: cuenta abierta ───────────────────────────────────────────────

  /// El negocio cobra con cuenta abierta (una orden por mesa, tandas).
  bool get isOpenTab => paymentMode == GroupPaymentMode.openTab;

  /// Ítems VIGENTES (los anulados por el negocio no cuentan para nada).
  List<GroupOrderItemDM> get liveItems => items.where((i) => !i.isVoided).toList();

  /// Ítems aún en el carrito (no enviados a cocina).
  List<GroupOrderItemDM> get pendingItems =>
      items.where((i) => !i.isSent && !i.isVoided).toList();

  /// Ítems ya enviados a cocina (inmutables).
  List<GroupOrderItemDM> get sentItems =>
      items.where((i) => i.isSent && !i.isVoided).toList();

  /// Número de la última tanda enviada (0 = ninguna).
  int get lastBatchNo =>
      sentItems.fold<int>(0, (acc, i) => (i.batchNo ?? 0) > acc ? i.batchNo! : acc);

  /// Total de lo ENVIADO a cocina (la cuenta de la mesa hasta ahora).
  double get sentTotal => sentItems.fold<double>(0, (acc, i) => acc + i.lineTotal);

  /// Total de lo que está en el carrito sin enviar.
  double get pendingTotal => pendingItems.fold<double>(0, (acc, i) => acc + i.lineTotal);

  /// F4b: la mesa avisó que paga en el mostrador y espera al mesero.
  /// Espeja `GroupOrder::isAwaitingCashPayment()` del backend.
  bool get isAwaitingCashPayment =>
      cashRequestedAt != null && !isTerminal && status == GroupOrderStatus.confirmed;

  /// Máquina de estados del CTA en cuenta abierta (decisión Hector,
  /// maquetas A1-A4). PURA: la UI solo pinta lo que esto devuelve.
  ///  - hay ítems sin enviar          → send    ("Enviar orden")
  ///  - avisaron que pagan en caja    → cash    (esperando al mesero)
  ///  - cuenta ya pedida (locked/…)   → billed  (checkout en curso)
  ///  - falta entregar algo enviado   → waiting (pago BLOQUEADO)
  ///  - todo enviado y entregado      → pay     ("Pagar la cuenta")
  OpenTabCtaState get openTabCtaState {
    // Terminal: la cuenta se cerró (pagada, cobrada en caja o cancelada). Sin
    // esto el comensal seguía viendo "Pagar la cuenta" habilitado después de
    // que el mesero cerrara en efectivo, y el tap devolvía 409 sin decir por
    // qué (e2e 2026-08-08).
    if (isTerminal || billRequestedAt != null || isPayable) {
      return OpenTabCtaState.billed;
    }
    // Va DESPUÉS de terminal: una vez que el negocio cobró y cerró, lo que
    // manda es el cierre, no el aviso que lo precedió.
    if (isAwaitingCashPayment) return OpenTabCtaState.cash;
    if (pendingItems.isNotEmpty) return OpenTabCtaState.send;
    if (sentItems.isEmpty) return OpenTabCtaState.send;
    final allDelivered = sentItems.every((i) => i.deliveredAt != null);
    return allDelivered ? OpenTabCtaState.pay : OpenTabCtaState.waiting;
  }

  /// e2e F4a: pagada pero AÚN NO entregada — el cliente sigue "trackeando"
  /// (chip visible + página de la orden en modo estado de cocina).
  /// TTL 12h: una orden confirmada hace días sin fulfillment (negocios que
  /// no operan el panel) NO es tracking — es historia; sin el TTL, el chip
  /// resucitaba órdenes viejas para siempre (e2e: fantasma de €163).
  ///
  /// F4b: en cuenta abierta la orden sigue VIVA tras la entrega — falta
  /// pagar la cuenta. Sin esto el chip desaparecía justo cuando el cliente
  /// más lo necesita (su único camino de vuelta a "Pagar la cuenta").
  bool get isTracking {
    if (status != GroupOrderStatus.confirmed) return false;
    final at = confirmedAt;
    if (at == null) return false;
    if (DateTime.now().difference(at) >= const Duration(hours: 12)) return false;
    // F4b: en cuenta abierta la orden sigue viva tras la ENTREGA porque falta
    // pagar — pero muere con el pago. Antes devolvía `true` sin mirar el
    // dinero, así que una cuenta ya saldada seguía "en tracking" 12 horas:
    // syncAnyActive() la recuperaba en cada login y el chip la resucitaba
    // ofreciendo pagar algo ya pagado (e2e 2026-08-06).
    // En cuenta abierta la única razón para seguir la orden es que quede
    // DINERO por pagar. Un solo concepto cubre los tres casos y no depende de
    // que el array de ítems venga poblado (2026-08-06):
    //   · cuenta viva sin pagar        → resta > 0  → sigue
    //   · cuenta saldada               → resta = 0  → muere
    //   · todo anulado por el negocio  → total 0    → muere
    // El caso del importe cero era el que la dejaba "viva" 12 h: el chip
    // ofrecía enviar una orden sin nada y syncForBusiness la readoptaba,
    // bloqueando crear una nueva en ese negocio.
    if (isOpenTab) return totalRemaining > 0.005;
    return fulfillmentStatus != GroupFulfillmentStatus.delivered;
  }

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

  /// ¿La orden sigue admitiendo ediciones de carrito? (sumar comensales,
  /// quitar o editar los ítems NO enviados).
  ///
  /// Espeja `GroupOrder::isEditableCart()` del backend. El FE usaba `isOpen`,
  /// que en cuenta abierta es false desde la PRIMERA tanda: la app dejaba de
  /// ofrecer invitar y de permitir quitar ítems del carrito justo cuando la
  /// mesa más lo necesita — y `requestBill` responde "envialos o quitalos"
  /// sin que hubiera forma de quitarlos (e2e 2026-08-06).
  bool get isEditableCart {
    if (isOpen) return true;

    return isOpenTab &&
        status == GroupOrderStatus.confirmed &&
        billRequestedAt == null &&
        // Pedida la cuenta para pagar en caja, el total se lo llevaron al
        // mostrador: sumar un postre después dejaría al negocio cobrando un
        // importe distinto al que la mesa ve en la app.
        cashRequestedAt == null;
  }

  /// La orden terminó: ya no admite ninguna acción de mesa ni de cocina.
  bool get isTerminal =>
      status == GroupOrderStatus.completed ||
      status == GroupOrderStatus.cancelled ||
      status == GroupOrderStatus.expired;

  /// ¿Hay algún participante con un pago EN CURSO? Espeja el guard que el
  /// backend aplica antes de cerrar o reabrir.
  bool get hasProcessingPayment => participants.any((p) => p.isProcessing);

  /// ¿El manager puede anular ítems? Espeja `setItemVoided` del backend.
  ///
  /// e2e 2026-08-08: la UI ofrecía el long-press SIEMPRE. En prepago una
  /// orden llega al panel porque se pagó, así que `totalPaid > 0` es la
  /// norma: el manager confirmaba "¿Anular X?" y recibía un 409 después.
  bool get canVoidItems =>
      !isTerminal &&
      totalPaid <= 0 &&
      billRequestedAt == null &&
      (status == GroupOrderStatus.open || status == GroupOrderStatus.confirmed);

  /// ¿El negocio puede cerrar esta cuenta por fuera de Foodly?
  ///
  /// Espeja los guards del backend (`GroupOrderFulfillmentService::close`)
  /// para no ofrecer un botón que va a dar 409: solo cuenta abierta, viva, y
  /// sin un pago en vuelo.
  ///
  /// **Con dinero dentro TAMBIÉN se cierra** (2026-08-12). Antes exigía
  /// `totalPaid <= 0` y no aceptaba `paying`, que es el mismo razonamiento
  /// circular que ya se deshizo en el backend: el motivo `partially_paid`
  /// existe exactamente para la mesa donde tres pagaron por la app y el cuarto
  /// se fue, y esa orden pasa a `paying` con el primer pago — o sea que el gate
  /// la escondía dos veces, por importe y por estado, y el único desenlace
  /// posible quedaba sin botón. La hoja de cierre ya se adapta a lo cobrado y
  /// ofrece el único motivo que el backend acepta; lo que faltaba era dejarla
  /// abrir.
  ///
  /// Lo que NO cambia es la cuenta SALDADA: ahí no queda nada por cobrar en el
  /// local, y marcarla `partially_paid` sería mentir en el historial del
  /// negocio. Lo que abre esta puerta es el SALDO PENDIENTE, no el pago.
  bool get canBeClosedByBusiness =>
      isOpenTab &&
      closedAt == null &&
      (status == GroupOrderStatus.confirmed ||
          status == GroupOrderStatus.locked ||
          status == GroupOrderStatus.paying) &&
      !isFullyPaid &&
      // El backend también lo rechaza: cerrar mientras alguien tiene el
      // PaymentSheet abierto daría 409 tras elegir el motivo en la hoja.
      !hasProcessingPayment;

  /// El motivo de cierre se puede CORREGIR desde el historial.
  ///
  /// Solo entre "impagada" y "cobrada en caja", y solo sin un euro de Foodly
  /// dentro — espeja `GroupOrderFulfillmentService::amendClosureReason`, que
  /// es quien decide de verdad. `partially_paid` queda fuera porque describe
  /// un reparto de dinero real, y `abandoned` porque lo firmó el barrido
  /// automático, no una persona.
  ///
  /// Sin esto, "se fueron sin pagar" era permanente: la orden queda
  /// `completed`, que no tiene transición de salida, así que si la mesa volvía
  /// al día siguiente y pagaba, el historial del negocio seguía diciendo que
  /// lo habían estafado.
  bool get closureIsAmendable =>
      closedAt != null &&
      totalPaid <= 0 &&
      (closedReason == 'unpaid' || closedReason == 'paid_offline');

  /// La cuenta está SALDADA: entró todo el dinero.
  ///
  /// e2e 2026-08-06 — hace falta porque `confirmed` es ambiguo en cuenta
  /// abierta: significa "primera tanda enviada a cocina" (el principio) y
  /// también "pagada" (el final), porque el webhook reusa el mismo estado en
  /// ambos modos. El estado no distingue; el dinero sí. Epsilon de medio
  /// céntimo por el redondeo de los doubles.
  bool get isFullyPaid => totalAmount > 0 && totalRemaining <= 0.005;

  /// Items pedidos por un participante dado.
  List<GroupOrderItemDM> itemsFor(String participantUuid) =>
      items.where((i) => i.participantUuid == participantUuid).toList();

  /// Subtotal "vivo" de un participante: antes del lock suma sus líneas al
  /// precio preview; tras el lock devuelve su amount_due congelado.
  double liveSubtotalFor(GroupOrderParticipantDM p) {
    // `amount_due` NO existe hasta que se pide la cuenta: lo escribe `lock()`,
    // y `sendBatch` lo dice explícito ("el reparto se calcula al pedir la
    // cuenta"). Mirar `isOpen` hacía que en cuenta abierta —false desde la
    // primera tanda— cada comensal mostrara €0,00 durante TODA la comida,
    // con el footer enseñando el total correcto justo debajo: la pantalla se
    // contradecía sola (e2e 2026-08-08).
    if (billRequestedAt != null || isPayable || isTerminal) return p.amountDue;

    // Los anulados no se cobran, así que tampoco se muestran en su parte.
    return itemsFor(p.uuid)
        .where((i) => !i.isVoided)
        .fold<double>(0, (acc, i) => acc + i.lineTotal);
  }

  GroupOrderParticipantDM? participantByUuid(String? uuid) {
    if (uuid == null) return null;
    for (final p in participants) {
      if (p.uuid == uuid) return p;
    }
    return null;
  }

  /// e2e r4: ¿[participantUuid] puede ELIMINAR la orden (definitivo)?
  /// Solo el host, solo OPEN y solo VACÍA (sin ningún ítem de nadie).
  bool canBeDeletedBy(String? participantUuid) {
    if (!isOpen || items.isNotEmpty) return false;
    return participantByUuid(participantUuid)?.isHost ?? false;
  }

  /// e2e r4: ¿[participantUuid] puede ABANDONAR la orden?
  /// Solo miembros (el host transfiere o elimina), solo OPEN y solo sin
  /// ítems bajo su responsabilidad.
  bool canBeLeftBy(String? participantUuid) {
    // e2e 2026-08-08: usaba `isOpen`, igual que invitar. En cuenta abierta
    // eso es false desde la primera tanda, así que quien escaneó el QR de la
    // mesa equivocada quedaba atrapado — aunque el backend YA lo permite
    // (GroupOrderParticipantController::leave usa isEditableCart).
    if (!isEditableCart) return false;
    final p = participantByUuid(participantUuid);
    if (p == null || p.isHost) return false;
    return itemsFor(p.uuid).isEmpty;
  }

  // ── F4a: helpers del panel "Órdenes en vivo" ──

  /// Lo que la COCINA tiene que servir. Los anulados nunca cuentan.
  ///
  /// Depende del MODO, y confundirlo rompe uno u otro (e2e 2026-08-06):
  ///  · per_round: no existen las tandas — pagar ES la comanda, así que al
  ///    confirmarse la orden entera está en cocina y `sentAt` es SIEMPRE
  ///    null. Filtrar por él dejaba el checklist vacío y el contador en 0/0.
  ///  · open_tab: solo lo enviado. La mesa puede tener platos en el carrito
  ///    que la cocina no ha visto; contarlos hacía que el panel dijera
  ///    "2/5 entregados" incluyendo 3 que nadie pidió, y que un postre en el
  ///    carrito impidiera dar por servida una tanda completa.
  List<GroupOrderItemDM> get kitchenItems => isOpenTab
      ? items.where((i) => i.isSent && !i.isVoided).toList()
      : liveItems;

  /// Ítems de un participante que la cocina realmente recibió.
  List<GroupOrderItemDM> kitchenItemsFor(String participantUuid) =>
      kitchenItems.where((i) => i.participantUuid == participantUuid).toList();

  /// Ítems ya entregados (checklist del manager).
  int get deliveredItemsCount =>
      kitchenItems.where((i) => i.deliveredAt != null).length;

  /// Total de ítems que el manager debe servir.
  int get liveItemsCount => kitchenItems.length;

  /// ¿Checklist completo? (habilita el CTA de ENTREGADA). Exige que haya algo
  /// que entregar: una comanda vacía no se puede dar por servida.
  bool get allItemsDelivered =>
      kitchenItems.isNotEmpty && deliveredItemsCount == kitchenItems.length;

  /// ¿Queda algo esperando en cocina?
  ///
  /// Distinto de [allItemsDelivered]: acá una comanda VACÍA cuenta como "nada
  /// pendiente". La diferencia importa para decidir si una orden está
  /// terminada (2026-08-08): usar allItemsDelivered hacía que el panel
  /// degradara a PREPARANDO una orden que en la base estaba ENTREGADA y
  /// pagada, solo porque su checklist había quedado vacío. La UI no debe
  /// contradecir al backend cuando no tiene nada que objetar.
  bool get hasPendingKitchenItems =>
      kitchenItems.any((i) => i.deliveredAt == null);
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

/// Respuesta de las dos vías de cobro. Comparten todo salvo por dónde paga el
/// comensal: `client_secret` abre el PaymentSheet nativo, `checkout_url` abre
/// la página hosteada de Stripe. Nunca vienen las dos.
@freezed
abstract class PayIntentResponseDM with _$PayIntentResponseDM {
  const factory PayIntentResponseDM({
    @JsonKey(name: 'client_secret') String? clientSecret,
    /// Checkout hosteado: para MB WAY y demás métodos que el PaymentSheet
    /// nativo no soporta.
    @JsonKey(name: 'checkout_url') String? checkoutUrl,
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
    // Código corto tipeable (F3a): lo comparte el host con la mesa.
    @JsonKey(name: 'invite_code') String? inviteCode,
    @JsonKey(name: 'invite_url') String? inviteUrl,
  }) = _GroupInviteResponseDM;

  factory GroupInviteResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteResponseDMFromJson(json);
}
