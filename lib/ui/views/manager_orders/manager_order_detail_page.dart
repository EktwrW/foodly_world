import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart' show PaddingExtension;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/foodly_group_dialogs.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// F4a — detalle de una orden en el panel (maqueta 2): stepper saltable,
/// checklist de ítems por comensal, mesa asignable y UN CTA que avanza al
/// siguiente estado. Lee la orden del MISMO cubit de la lista (los updates
/// del realtime la refrescan solos).
///
/// Audit F4a: si la orden sale de la LISTA FILTRADA (p. ej. estás en el
/// bucket "Activas" y la marcás PREPARANDO), el detalle NO se cierra en tu
/// cara — conserva la última copia vista y seguís operando.
class ManagerOrderDetailPage extends StatefulWidget {
  final String orderUuid;

  const ManagerOrderDetailPage({super.key, required this.orderUuid});

  @override
  State<ManagerOrderDetailPage> createState() => _ManagerOrderDetailPageState();
}

class _ManagerOrderDetailPageState extends State<ManagerOrderDetailPage> {
  GroupOrderDM? _lastSeen;

  String get orderUuid => widget.orderUuid;

  (String, GroupFulfillmentStatus)? _nextStep(GroupOrderDM order) => switch (order.fulfillmentStatus) {
        null => (S.current.managerMarkPreparing, GroupFulfillmentStatus.preparing),
        GroupFulfillmentStatus.preparing => (S.current.managerMarkReady, GroupFulfillmentStatus.ready),
        GroupFulfillmentStatus.ready => (S.current.managerMarkDelivered, GroupFulfillmentStatus.delivered),
        GroupFulfillmentStatus.delivered => null,
      };

  Future<void> _onAssignTable(BuildContext context, ManagerOrdersCubit cubit, GroupOrderDM order) async {
    final controller = TextEditingController(text: order.tableLabel ?? '');
    final label = await showDialog<String>(
      context: context,
      builder: (ctx) => FoodlyDialogShell(
        title: S.current.managerAssignTable,
        actions: [
          CustomNeumorphicButton(
            text: S.current.confirm,
            disabled: false,
            margin: const EdgeInsets.symmetric(vertical: 6),
            onPressed: () => Navigator.pop(ctx, controller.text),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
          ),
        ],
        child: TextField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.center,
          maxLength: 30,
          style: FoodlyTextStyles.sectionsTitle,
          decoration: InputDecoration(
            hintText: S.current.managerTableHint,
            hintStyle: FoodlyTextStyles.caption,
            counterText: '',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.primaryFoodly, width: 2),
            ),
          ),
        ),
      ),
    );
    if (label != null) await cubit.setTableLabel(order.uuid, label.trim().isEmpty ? null : label.trim());
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManagerOrdersCubit>();

    return BlocBuilder<ManagerOrdersCubit, ManagerOrdersState>(
      builder: (context, state) {
        final fromList = state.orders.where((o) => o.uuid == orderUuid).firstOrNull;
        if (fromList != null) _lastSeen = fromList;
        final order = fromList ?? _lastSeen;
        if (order == null) {
          // Jamás la vimos (deep link raro): salida segura.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && Navigator.of(context).canPop()) Navigator.of(context).pop();
          });
          return const Scaffold(body: SizedBox.shrink());
        }

        final next = _nextStep(order);

        // Misma regla que el checklist (_ParticipantChecklist): el cartel no
        // puede invitar a tocar los platos si tocarlos no hace nada. Sobre una
        // cuenta cerrada con el checklist a medias seguía diciéndolo y el tap
        // era silencio (e2e 2026-08-08).
        final canCheck = order.isConfirmed &&
            (!order.allItemsDelivered || order.fulfillmentStatus != GroupFulfillmentStatus.delivered);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 60,
            leadingWidth: 60,
            leading: CustomRoundedNeumorphicButton(
              iconSize: 26,
              diameter: 32,
              iconData: Bootstrap.caret_left_fill,
              onPressed: () => Navigator.of(context).pop(),
            ).paddingSymmetric(vertical: 8, horizontal: 8),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            title: Text(
              '${(order.tableLabel ?? '').isNotEmpty ? '${order.tableLabel} · ' : ''}'
              '${formatMoney(order.totalAmount, order.currency)}',
              style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 18),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_location_alt_outlined, color: Colors.white),
                tooltip: S.current.managerAssignTable,
                onPressed: () => _onAssignTable(context, cubit, order),
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                ManagerFulfillmentStepper(status: order.fulfillmentStatus),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 6),
                  child: Row(
                    children: [
                      Text(S.current.groupOrderParticipants, style: FoodlyTextStyles.sectionsTitle),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          S.current.managerItemsDelivered(order.deliveredItemsCount, order.liveItemsCount),
                          style: FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFF0B8A40), fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                // Affordance del checklist (e2e F4a): antes NADA indicaba que
                // los ítems se tocaban para marcar entrega.
                if (canCheck)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                    child: Row(
                      children: [
                        const Icon(Icons.touch_app_rounded, size: 13, color: FoodlyThemes.secondaryFoodly),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            S.current.managerChecklistHint,
                            style:
                                FoodlyTextStyles.caption.copyWith(fontSize: 10.5, color: FoodlyThemes.secondaryFoodly),
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    children: [
                      for (final p in order.participants)
                        // Con key: ahora la fila guarda estado propio (el ítem
                        // en vuelo) y sin ella un reordenamiento de la lista se
                        // lo pasaría al comensal de al lado.
                        _ParticipantChecklist(
                          key: ValueKey(p.uuid),
                          order: order,
                          participant: p,
                          cubit: cubit,
                        ),
                    ],
                  ),
                ),
                // CTA zone (maqueta 2): un CTA principal + atajos.
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Color(0x141B1015), blurRadius: 18, offset: Offset(0, -6))],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // e2e 2026-08-08: el BE exige `confirmed` para TODA
                      // acción de cocina (advance, setItemDelivered,
                      // markAllDelivered). No alcanza con "no terminal":
                      // `locked` también entra al panel y tampoco la acepta.
                      if (!order.isConfirmed)
                        _ClosedTabNotice(order: order)
                      else if (next != null) ...[
                        // Sin fricción (decisión Hector e2e F4a): ENTREGADA
                        // siempre habilitada — el BE auto-tilda el checklist.
                        CustomNeumorphicButton(
                          text: next.$1,
                          disabled: false,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          onPressed: () => cubit.advanceFulfillment(order.uuid, next.$2.name),
                        ),
                        // Saltable (decisión de producto): entregar TODO de una,
                        // sin pasar por los estados intermedios.
                        if (order.fulfillmentStatus != GroupFulfillmentStatus.ready)
                          TextButton(
                            // e2e F4b: SOLO deliverAll — el BE ya auto-entrega
                            // la orden al completarse el checklist. El advance
                            // que había acá daba 409 (delivered→delivered) y
                            // mostraba un modal de error tras una acción OK.
                            onPressed: () => cubit.deliverAll(order.uuid),
                            child: Text(
                              S.current.managerDeliverAllAndClose,
                              style: FoodlyTextStyles.captionPurpleBold,
                            ),
                          ).paddingTop(12),
                      ] else
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle_rounded, color: Color(0xFF0B8A40), size: 18),
                              const SizedBox(width: 6),
                              Text(
                                S.current.managerBadgeDelivered,
                                style: FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFF0B8A40)),
                              ),
                            ],
                          ),
                        ),
                      // F4b: cerrar la cuenta cobrada FUERA de Foodly. En un
                      // restaurante tradicional es el desenlace más común, y
                      // sin esto la orden quedaba viva para siempre en el
                      // panel. Solo con cuenta abierta y sin un pago en vuelo;
                      // el MOTIVO lo decide la hoja según lo ya cobrado —
                      // `partially_paid` cuando entró dinero por la app, que
                      // es lo único que el BE acepta ahí.
                      // F4b: la mesa avisó que paga en el mostrador. El aviso
                      // va junto al botón de cerrar porque son la misma
                      // acción vista desde los dos lados — el mesero cobra y
                      // confirma acá mismo.
                      if (order.isAwaitingCashPayment) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.storefront_rounded, size: 16, color: kManagerAmber),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                S.current.managerAwaitingCashNotice,
                                style: FoodlyTextStyles.caption.copyWith(fontSize: 10.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (order.canBeClosedByBusiness) ...[
                        const SizedBox(height: 4),
                        TextButton.icon(
                          icon: const Icon(Icons.receipt_long_rounded, size: 18),
                          label: Text(S.current.managerCloseTab),
                          style: TextButton.styleFrom(
                            foregroundColor: FoodlyThemes.primaryFoodly,
                          ),
                          onPressed: () => _onCloseTab(context, cubit, order),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Hoja de cierre: dos desenlaces, nombrados sin eufemismos. El negocio
  /// tiene que poder distinguir después "cobré en caja" de "comieron gratis".
  Future<void> _onCloseTab(
    BuildContext context,
    ManagerOrdersCubit cubit,
    GroupOrderDM order,
  ) async {
    final reason = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.current.managerCloseTabTitle,
              style: FoodlyTextStyles.sectionsTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              S.current.managerCloseTabBody(
                formatMoney(order.totalAmount, order.currency),
              ),
              style: FoodlyTextStyles.caption,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            // Con dinero cobrado por la app, el ÚNICO cierre válido es
            // `partially_paid` — el backend rechaza los otros dos, y con
            // razón: marcar "cobrada en caja" algo que ya se cobró por Foodly
            // deja al comensal pagando dos veces. En vez de ofrecer opciones
            // que van a devolver 409, la hoja se adapta a lo que de verdad
            // pasó y dice cuánto entró ya (2026-08-12).
            if (order.totalPaid > 0) ...[
              Text(
                S.current.managerCloseTabAlreadyPaid(
                  formatMoney(order.totalPaid, order.currency),
                  formatMoney(order.totalRemaining, order.currency),
                ),
                style: FoodlyTextStyles.caption,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              CustomNeumorphicButton(
                text: S.current.managerCloseTabPartiallyPaid,
                disabled: false,
                margin: EdgeInsets.zero,
                onPressed: () => Navigator.pop(ctx, 'partially_paid'),
              ),
            ] else ...[
              CustomNeumorphicButton(
                text: S.current.managerCloseTabPaidOffline,
                disabled: false,
                margin: const EdgeInsets.symmetric(vertical: 12),
                onPressed: () => Navigator.pop(ctx, 'paid_offline'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, 'unpaid'),
                child: Text(
                  S.current.managerCloseTabUnpaid,
                  style: FoodlyTextStyles.caption.copyWith(color: const Color(0xFFB3261E)),
                ),
              ),
              const SizedBox(height: 26),
            ],
          ],
        ),
      ),
    );

    if (reason == null || !context.mounted) return;
    final ok = await cubit.closeTab(order.uuid, reason);
    if (ok && context.mounted) Navigator.of(context).pop(); // vuelve a la lista
  }
}

/// F4b: batchNo del ítem anterior en la lista (null si es el primero) —
/// sirve para dibujar el separador solo cuando CAMBIA la tanda.
int? _batchNoBefore(List<GroupOrderItemDM> items, GroupOrderItemDM item) {
  final idx = items.indexOf(item);
  return idx <= 0 ? null : items[idx - 1].batchNo;
}

/// Grupo de ítems de un comensal con checkbox de entrega por línea.
/// Cierre de la orden: en vez de botones que el backend rechazaría, se dice
/// CÓMO terminó. El desenlace importa para la contabilidad del negocio.
class _ClosedTabNotice extends StatelessWidget {
  final GroupOrderDM order;

  const _ClosedTabNotice({required this.order});

  (IconData, Color, String)? get _look => switch (order.closedReason) {
        'paid_offline' => (
            Icons.payments_rounded,
            const Color(0xFF0B8A40),
            S.current.managerClosedPaidOffline,
          ),
        'unpaid' => (
            Icons.report_gmailerrorred_rounded,
            const Color(0xFFB3261E),
            S.current.managerClosedUnpaid,
          ),
        'abandoned' => (
            Icons.schedule_rounded,
            FoodlyThemes.secondaryFoodly,
            S.current.managerClosedAbandoned,
          ),
        'partially_paid' => (
            Icons.call_split_rounded,
            const Color(0xFF0B8A40),
            S.current.managerClosedPartiallyPaid,
          ),
        // Sin motivo: se cobró por Foodly, el ciclo normal.
        //
        // Pero acá NO se puede afirmar ENTREGADA: en cuenta abierta la mesa
        // pide y paga la cuenta mientras la última tanda se cocina, y esa
        // orden entra a esta pantalla con ff=preparing. El cartel verde decía
        // "ENTREGADA" mientras el checklist, dos centímetros más arriba,
        // decía 0/2 (e2e 2026-08-08). Lo que sí es siempre cierto es que la
        // cuenta se cerró; el stepper de arriba cuenta el resto.
        _ when order.isTerminal => (
            Icons.check_circle_rounded,
            const Color(0xFF0B8A40),
            S.current.managerTabClosedTitle,
          ),
        // Cuenta pedida y todavía sin pagar (`locked`): no terminó nada
        // que se pueda anunciar. El stepper y el botón de cerrar alcanzan.
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final look = _look;
    if (look == null) return const SizedBox.shrink();

    final (icon, color, text) = look;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 6),
          Text(text, style: FoodlyTextStyles.captionBold.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _ParticipantChecklist extends StatefulWidget {
  final GroupOrderDM order;
  final GroupOrderParticipantDM participant;
  final ManagerOrdersCubit cubit;

  const _ParticipantChecklist({
    super.key,
    required this.order,
    required this.participant,
    required this.cubit,
  });

  @override
  State<_ParticipantChecklist> createState() => _ParticipantChecklistState();
}

class _ParticipantChecklistState extends State<_ParticipantChecklist> {
  /// Ítems con una llamada en vuelo. La comanda se opera con el local lleno y
  /// la respuesta tarda ~2s: sin esto el tap no acusa recibo y el manager
  /// vuelve a tildar, que además manda la acción contraria.
  final _enVuelo = <String>{};

  /// Corre la acción marcando el ítem mientras dura. Devuelve al `Set` el
  /// control de la doble pulsación: si ya está en vuelo, el tap se ignora.
  Future<void> _conSpinner(String itemUuid, Future<void> Function() accion) async {
    if (_enVuelo.contains(itemUuid)) return;
    setState(() => _enVuelo.add(itemUuid));
    try {
      await accion();
    } finally {
      if (mounted) setState(() => _enVuelo.remove(itemUuid));
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final participant = widget.participant;
    final cubit = widget.cubit;
    // Solo lo que la cocina RECIBIÓ: en cuenta abierta el comensal puede
    // tener platos en el carrito sin enviar, y aparecían en la comanda del
    // manager como si los hubieran pedido (e2e 2026-08-06).
    final items = order.kitchenItemsFor(participant.uuid);
    if (items.isEmpty) return const SizedBox.shrink();

    // e2e F4b: el checklist se opera mientras QUEDE algo por servir — no
    // según el estado de fulfillment. Con tandas, una orden "entregada"
    // recibe ítems nuevos y su checklist quedaba muerto (tap sin efecto).
    //
    // e2e 2026-08-08: pero SÍ importa el estado de la ORDEN. `close()` es la
    // única vía a `completed` y esas órdenes siguen listadas en el panel;
    // el backend rechaza todo fulfillment fuera de `confirmed`, así que
    // dejarlo habilitado era regalar 409s en cada tap.
    final canCheck =
        order.isConfirmed && (!order.allItemsDelivered || order.fulfillmentStatus != GroupFulfillmentStatus.delivered);

    // Sin fricción (decisión Hector e2e F4a): tildar el último ítem entrega
    // la orden SOLA, sin confirmaciones — checklist y CTA son dos caminos al
    // mismo estado.
    Future<void> toggle(GroupOrderItemDM item) => _conSpinner(
          item.uuid,
          () => cubit.setItemDelivered(order.uuid, item.uuid, item.deliveredAt == null),
        );

    /// F4b.1 — anular/restaurar un ítem (plato devuelto o mal preparado):
    /// deja de cobrarse pero sigue visible para el comensal.
    Future<void> toggleVoid(GroupOrderItemDM item) async {
      if (item.isVoided) {
        await _conSpinner(item.uuid, () => cubit.setItemVoided(order.uuid, item.uuid, false));
        return;
      }
      final ok = await showFoodlyConfirm(
        context,
        message: S.current.managerVoidItemConfirm(item.name),
        confirmText: S.current.managerVoidItemCta,
      );
      if (!ok) return;
      await _conSpinner(item.uuid, () => cubit.setItemVoided(order.uuid, item.uuid, true));
    }

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(participant.displayName, style: FoodlyTextStyles.labelBold),
            const SizedBox(height: 4),
            for (final item in items) ...[
              // F4b: separador de tanda cuando la mesa pidió en varias
              // vueltas — la cocina necesita saber qué entró después.
              if (order.isOpenTab && item.batchNo != null && item.batchNo != _batchNoBefore(items, item))
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 2),
                  child: Text(
                    S.current.managerBatchLabel(item.batchNo!),
                    style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 9.5),
                  ),
                ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (canCheck && !item.isVoided && !_enVuelo.contains(item.uuid)) ? () => toggle(item) : null,
                // F4b.1: mantener presionado = anular/restaurar el ítem.
                // Solo si el backend lo aceptaría: en prepago la orden llega
                // al panel PORQUE se pagó, así que ofrecerlo siempre hacía
                // que el manager confirmara "¿Anular X?" y recibiera un 409
                // (e2e 2026-08-08).
                onLongPress: order.canVoidItems ? () => toggleVoid(item) : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      // Affordance explícito (e2e F4a): checkbox cuadrado con
                      // borde marcado — "esto se tilda", no un icono decorativo.
                      // Mismo cuadro de 20 mientras carga: la fila no salta.
                      SizedBox.square(
                        dimension: 20,
                        child: _enVuelo.contains(item.uuid)
                            ? const Padding(
                                padding: EdgeInsets.all(2),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: FoodlyThemes.primaryFoodly,
                                ),
                              )
                            : Icon(
                                item.isVoided
                                    ? Icons.block_rounded
                                    : (item.deliveredAt != null
                                        ? Icons.check_box_rounded
                                        : Icons.check_box_outline_blank_rounded),
                                size: 20,
                                color: item.isVoided
                                    ? const Color(0xFFB3261E)
                                    : (item.deliveredAt != null
                                        ? FoodlyThemes.tertiaryFoodly
                                        : FoodlyThemes.primaryFoodly.withValues(alpha: 0.45)),
                              ),
                      ),
                      const SizedBox(width: 8),
                      Text('${item.quantity}×', style: FoodlyTextStyles.captionPurpleBold),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: (item.deliveredAt != null || item.isVoided)
                                  ? FoodlyTextStyles.caption.copyWith(decoration: TextDecoration.lineThrough)
                                  : FoodlyTextStyles.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (item.isVoided)
                              Text(
                                S.current.managerVoidedItemTag,
                                style:
                                    FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFFB3261E), fontSize: 9),
                              ),
                          ],
                        ),
                      ),
                      if (item.shared && !item.isVoided)
                        Text(S.current.groupOrderSharedBadge,
                            style: FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFF0B8A40), fontSize: 9)),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
