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
        final deliveredBlocked = next?.$2 == GroupFulfillmentStatus.delivered && !order.allItemsDelivered;

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
                          S.current.managerItemsDelivered(order.deliveredItemsCount, order.items.length),
                          style: FoodlyTextStyles.captionBold
                              .copyWith(color: const Color(0xFF0B8A40), fontSize: 10),
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
                        CustomNeumorphicButton(
                          text: next.$1,
                          disabled: deliveredBlocked,
                          margin: EdgeInsets.zero,
                          onPressed: deliveredBlocked
                              ? null
                              : () => cubit.advanceFulfillment(order.uuid, next.$2.name),
                        ),
                        if (deliveredBlocked)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              S.current.managerDeliveredNeedsChecklist,
                              style: FoodlyTextStyles.caption,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        // Saltable (decisión de producto): entregar TODO de una,
                        // sin pasar por los estados intermedios.
                        if (order.fulfillmentStatus != GroupFulfillmentStatus.ready)
                          TextButton(
                            onPressed: () async {
                              if (await cubit.deliverAll(order.uuid)) {
                                await cubit.advanceFulfillment(
                                    order.uuid, GroupFulfillmentStatus.delivered.name);
                              }
                            },
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
    final items = order.itemsFor(participant.uuid);
    if (items.isEmpty) return const SizedBox.shrink();

    final canCheck = order.fulfillmentStatus != GroupFulfillmentStatus.delivered;

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
            for (final item in items)
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: canCheck
                    ? () => cubit.setItemDelivered(order.uuid, item.uuid, item.deliveredAt == null)
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        item.deliveredAt != null
                            ? Icons.check_circle_rounded
                            : Icons.radio_button_off_rounded,
                        size: 18,
                        color: item.deliveredAt != null
                            ? FoodlyThemes.tertiaryFoodly
                            : FoodlyThemes.secondaryFoodly,
                      ),
                      const SizedBox(width: 8),
                      Text('${item.quantity}×', style: FoodlyTextStyles.captionPurpleBold),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.name,
                          style: item.deliveredAt != null
                              ? FoodlyTextStyles.caption
                                  .copyWith(decoration: TextDecoration.lineThrough)
                              : FoodlyTextStyles.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (item.shared)
                        Text(S.current.groupOrderSharedBadge,
                            style: FoodlyTextStyles.captionBold
                                .copyWith(color: const Color(0xFF0B8A40), fontSize: 9)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
