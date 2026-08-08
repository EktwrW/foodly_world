import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_history_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:intl/intl.dart';

/// F4a.1 — historial del negocio (días anteriores a hoy): scroll infinito
/// con keyset, headers por día con resumen (N órdenes · €total), tarjetas
/// reutilizadas y detalle de SOLO LECTURA en sheet (las órdenes pasadas no
/// se operan — un stepper acá sería ruido).
class ManagerOrderHistoryPage extends StatefulWidget {
  const ManagerOrderHistoryPage({super.key});

  @override
  State<ManagerOrderHistoryPage> createState() => _ManagerOrderHistoryPageState();
}

class _ManagerOrderHistoryPageState extends State<ManagerOrderHistoryPage> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      // Infinite scroll: pide la siguiente página al 80% del recorrido.
      if (_scroll.position.pixels > _scroll.position.maxScrollExtent * 0.8) {
        context.read<ManagerHistoryCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  String _dayLabel(DateTime day) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));
    if (day == yesterday) return S.current.managerHistoryYesterday;
    // "vie, 31 jul" en el locale activo.
    return DateFormat.MMMEd(Intl.getCurrentLocale()).format(day);
  }

  void _showOrderSheet(BuildContext context, GroupOrderDM order) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.85,
        builder: (ctx, scrollCtrl) => ListView(
          controller: scrollCtrl,
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${(order.tableLabel ?? '').isNotEmpty ? '${order.tableLabel} · ' : ''}'
                    '${formatMoney(order.totalAmount, order.currency)}',
                    style: FoodlyTextStyles.sectionsTitle,
                  ),
                ),
                ManagerFulfillmentBadge(status: order.fulfillmentStatus),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              [
                if (order.confirmedAt != null)
                  DateFormat.yMMMd(Intl.getCurrentLocale())
                      .add_Hm()
                      .format(order.confirmedAt!.toLocal()),
                if (order.roundNumber > 1) S.current.managerRound(order.roundNumber),
              ].join(' · '),
              style: FoodlyTextStyles.caption,
            ),
            const SizedBox(height: 14),
            for (final p in order.participants) ...[
              Text(p.displayName, style: FoodlyTextStyles.labelBold),
              const SizedBox(height: 2),
              for (final item in order.kitchenItemsFor(p.uuid))
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 2),
                  child: Row(
                    children: [
                      Text('${item.quantity}×', style: FoodlyTextStyles.captionPurpleBold),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(item.name,
                            style: FoodlyTextStyles.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(formatMoney(item.lineTotal, order.currency),
                          style: FoodlyTextStyles.caption),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          S.current.managerHistoryTitle,
          style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<ManagerHistoryCubit, ManagerHistoryState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                  child: CircularProgressIndicator(color: FoodlyThemes.primaryFoodly));
            }
            if (state.orders.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.history_rounded,
                        size: 42, color: FoodlyThemes.secondaryFoodly),
                    const SizedBox(height: 8),
                    Text(S.current.managerHistoryEmpty, style: FoodlyTextStyles.caption),
                  ],
                ),
              );
            }

            final groups = groupOrdersByDay(state.orders);

            return ListView(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 20),
              children: [
                for (final g in groups) ...[
                  // Header del día: etiqueta + resumen (N órdenes · €total).
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 10, 2, 8),
                    child: Row(
                      children: [
                        Text(
                          _dayLabel(g.day).toUpperCase(),
                          style: FoodlyTextStyles.captionPurpleBold
                              .copyWith(letterSpacing: 0.5),
                        ),
                        const Expanded(child: Divider(indent: 10, endIndent: 10)),
                        Text(
                          S.current.managerHistoryDaySummary(
                            g.orders.length,
                            formatMoney(g.dayTotal, g.orders.first.currency),
                          ),
                          style: FoodlyTextStyles.captionBold
                              .copyWith(color: const Color(0xFF0B8A40), fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  for (final order in g.orders)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ManagerOrderCard(
                        order: order,
                        onTap: () => _showOrderSheet(context, order),
                      ),
                    ),
                ],
                if (state.loadingMore)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Center(
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: FoodlyThemes.primaryFoodly),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
