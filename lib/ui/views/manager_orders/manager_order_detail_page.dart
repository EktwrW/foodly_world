import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/foodly_group_dialogs.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';

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
            margin: EdgeInsets.zero,
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

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 60,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
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
                          S.current.managerItemsDelivered(
                              order.deliveredItemsCount, order.liveItemsCount),
                          style: FoodlyTextStyles.captionBold
                              .copyWith(color: const Color(0xFF0B8A40), fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                // Affordance del checklist (e2e F4a): antes NADA indicaba que
                // los ítems se tocaban para marcar entrega.
                if (order.fulfillmentStatus != GroupFulfillmentStatus.delivered)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                    child: Row(
                      children: [
                        const Icon(Icons.touch_app_rounded,
                            size: 13, color: FoodlyThemes.secondaryFoodly),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            S.current.managerChecklistHint,
                            style: FoodlyTextStyles.caption
                                .copyWith(fontSize: 10.5, color: FoodlyThemes.secondaryFoodly),
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
                        _ParticipantChecklist(order: order, participant: p, cubit: cubit),
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
                      if (next != null) ...[
                        // Sin fricción (decisión Hector e2e F4a): ENTREGADA
                        // siempre habilitada — el BE auto-tilda el checklist.
                        CustomNeumorphicButton(
                          text: next.$1,
                          disabled: false,
                          margin: EdgeInsets.zero,
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
                          ),
                      ] else
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle_rounded,
                                  color: Color(0xFF0B8A40), size: 18),
                              const SizedBox(width: 6),
                              Text(
                                S.current.managerBadgeDelivered,
                                style: FoodlyTextStyles.captionBold
                                    .copyWith(color: const Color(0xFF0B8A40)),
                              ),
                            ],
                          ),
                        ),
                      // F4b: cerrar la cuenta cobrada FUERA de Foodly. En un
                      // restaurante tradicional es el desenlace más común, y
                      // sin esto la orden quedaba viva para siempre en el
                      // panel. Solo con cuenta abierta y sin pagos por la app:
                      // marcar "cobrada en caja" algo ya cobrado dejaría al
                      // comensal pagando dos veces (el BE también lo rechaza).
                      if (order.canBeClosedByBusiness) ...[
                        const SizedBox(height: 4),
                        TextButton.icon(
                          icon: const Icon(Icons.receipt_long_rounded, size: 18),
                          label: Text(S.current.managerCloseTab),
                          style: TextButton.styleFrom(
                            foregroundColor: FoodlyThemes.secondaryFoodly,
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
            CustomNeumorphicButton(
              text: S.current.managerCloseTabPaidOffline,
              disabled: false,
              margin: EdgeInsets.zero,
              onPressed: () => Navigator.pop(ctx, 'paid_offline'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pop(ctx, 'unpaid'),
              child: Text(
                S.current.managerCloseTabUnpaid,
                style: FoodlyTextStyles.caption.copyWith(color: const Color(0xFFB3261E)),
              ),
            ),
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
class _ParticipantChecklist extends StatelessWidget {
  final GroupOrderDM order;
  final GroupOrderParticipantDM participant;
  final ManagerOrdersCubit cubit;

  const _ParticipantChecklist({
    required this.order,
    required this.participant,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    // Solo lo que la cocina RECIBIÓ: en cuenta abierta el comensal puede
    // tener platos en el carrito sin enviar, y aparecían en la comanda del
    // manager como si los hubieran pedido (e2e 2026-08-06).
    final items = order.kitchenItemsFor(participant.uuid);
    if (items.isEmpty) return const SizedBox.shrink();

    // e2e F4b: el checklist se opera mientras QUEDE algo por servir — no
    // según el estado de la orden. Con tandas, una orden "entregada" recibe
    // ítems nuevos y su checklist quedaba muerto (tap sin efecto).
    final canCheck = !order.allItemsDelivered ||
        order.fulfillmentStatus != GroupFulfillmentStatus.delivered;

    // Sin fricción (decisión Hector e2e F4a): tildar el último ítem entrega
    // la orden SOLA, sin confirmaciones — checklist y CTA son dos caminos al
    // mismo estado.
    Future<void> toggle(GroupOrderItemDM item) async =>
        cubit.setItemDelivered(order.uuid, item.uuid, item.deliveredAt == null);

    /// F4b.1 — anular/restaurar un ítem (plato devuelto o mal preparado):
    /// deja de cobrarse pero sigue visible para el comensal.
    Future<void> toggleVoid(GroupOrderItemDM item) async {
      if (item.isVoided) {
        await cubit.setItemVoided(order.uuid, item.uuid, false);
        return;
      }
      final ok = await showFoodlyConfirm(
        context,
        message: S.current.managerVoidItemConfirm(item.name),
        confirmText: S.current.managerVoidItemCta,
      );
      if (!ok) return;
      await cubit.setItemVoided(order.uuid, item.uuid, true);
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
              if (order.isOpenTab &&
                  item.batchNo != null &&
                  item.batchNo != _batchNoBefore(items, item))
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 2),
                  child: Text(
                    S.current.managerBatchLabel(item.batchNo!),
                    style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 9.5),
                  ),
                ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (canCheck && !item.isVoided) ? () => toggle(item) : null,
                // F4b.1: mantener presionado = anular/restaurar el ítem.
                onLongPress: () => toggleVoid(item),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      // Affordance explícito (e2e F4a): checkbox cuadrado con
                      // borde marcado — "esto se tilda", no un icono decorativo.
                      Icon(
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
                                  ? FoodlyTextStyles.caption
                                      .copyWith(decoration: TextDecoration.lineThrough)
                                  : FoodlyTextStyles.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (item.isVoided)
                              Text(
                                S.current.managerVoidedItemTag,
                                style: FoodlyTextStyles.captionBold
                                    .copyWith(color: const Color(0xFFB3261E), fontSize: 9),
                              ),
                          ],
                        ),
                      ),
                      if (item.shared && !item.isVoided)
                        Text(S.current.groupOrderSharedBadge,
                            style: FoodlyTextStyles.captionBold
                                .copyWith(color: const Color(0xFF0B8A40), fontSize: 9)),
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
