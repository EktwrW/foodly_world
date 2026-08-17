import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_history_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, Iconsax;
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

  /// Detalle de una orden pasada. Solo lectura salvo UNA acción: corregir el
  /// motivo del cierre. El resto no se opera — un stepper de cocina sobre una
  /// mesa de hace tres días es ruido.
  ///
  /// El cubit va por parámetro y no por `context.read` dentro del sheet: el
  /// `showModalBottomSheet` construye en un contexto de ruta distinto, que no
  /// tiene el BlocProvider encima.
  void _showOrderSheet(BuildContext context, GroupOrderDM order) {
    final cubit = context.read<ManagerHistoryCubit>();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _HistoryOrderSheet(orderUuid: order.uuid),
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
              return const Center(child: CircularProgressIndicator(color: FoodlyThemes.primaryFoodly));
            }
            if (state.orders.isEmpty) {
              return Center(
                child: Column(
                  spacing: 12,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.receipt_minus_outline, color: FoodlyThemes.primaryFoodly),
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
                    padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
                    child: Row(
                      children: [
                        Text(
                          _dayLabel(g.day).toUpperCase(),
                          style: FoodlyTextStyles.captionPurpleBold.copyWith(letterSpacing: 0.5),
                        ),
                        const Expanded(child: Divider(indent: 10, endIndent: 10)),
                        Text(
                          S.current.managerHistoryDaySummary(
                            g.orders.length,
                            formatMoney(g.dayTotal, g.orders.first.currency),
                          ),
                          style: FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFF0B8A40), fontSize: 10),
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
                        child: CircularProgressIndicator(strokeWidth: 2, color: FoodlyThemes.primaryFoodly),
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

/// Hoja de detalle de una orden del historial, en el lenguaje visual de la app
/// (cabecera con el gradiente del panel, radius 24, badges propios).
///
/// Antes era un `showModalBottomSheet` pelado con un `ListView` sin estilo, y
/// mostraba el badge de COCINA en vez del de cierre: en una orden cerrada como
/// impagada, el dato que importa es justo ése.
///
/// Se lee del cubit por uuid en vez de recibir la orden congelada: al corregir
/// el cierre el estado cambia, y así la hoja se repinta sola con el motivo
/// nuevo sin cerrarse ni volver a abrirse.
class _HistoryOrderSheet extends StatelessWidget {
  final String orderUuid;

  const _HistoryOrderSheet({required this.orderUuid});

  Future<void> _corregir(BuildContext context, GroupOrderDM order) async {
    // Se ofrece SIEMPRE el motivo contrario al actual: la acción es "esto que
    // dice acá está mal", no un menú de opciones.
    final destino = order.closedReason == 'unpaid' ? 'paid_offline' : 'unpaid';

    final ok = await context.read<ManagerHistoryCubit>().amendClosure(order.uuid, destino);
    if (!context.mounted) return;

    if (ok) {
      FoodlySnackbars.successGeneric(context, S.current.managerAmendDone);
    } else {
      FoodlySnackbars.errorGeneric(context, S.current.managerGenericError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.62,
      maxChildSize: 0.9,
      builder: (_, scrollCtrl) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: BlocBuilder<ManagerHistoryCubit, ManagerHistoryState>(
            builder: (context, state) {
              final order = state.orders.where((o) => o.uuid == orderUuid).firstOrNull;
              if (order == null) return const SizedBox.shrink();

              return ListView(
                controller: scrollCtrl,
                padding: EdgeInsets.zero,
                children: [
                  _Cabecera(order: order),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ManagerPaymentBadge(order: order),
                            const SizedBox(width: 8),
                            ManagerFulfillmentBadge(status: order.fulfillmentStatus),
                          ],
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
                                        style: FoodlyTextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(formatMoney(item.lineTotal, order.currency), style: FoodlyTextStyles.caption),
                                ],
                              ),
                            ),
                          const SizedBox(height: 8),
                        ],
                        const Divider(height: 26),
                        if (order.closureIsAmendable)
                          _CorregirCierre(
                            order: order,
                            onCorregir: () => _corregir(context, order),
                          )
                        else
                          Center(
                            child: Text(
                              S.current.managerHistoryReadOnly,
                              style: FoodlyTextStyles.caption,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Cabecera con el gradiente del panel: mesa · total, y debajo la fecha.
class _Cabecera extends StatelessWidget {
  final GroupOrderDM order;

  const _Cabecera({required this.order});

  @override
  Widget build(BuildContext context) {
    final mesa = (order.tableLabel ?? '').isNotEmpty ? '${order.tableLabel} · ' : '';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 38,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            '$mesa${formatMoney(order.totalAmount, order.currency)}',
            style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 2),
          Text(
            [
              if (order.confirmedAt != null)
                DateFormat.yMMMd(Intl.getCurrentLocale()).add_Hm().format(order.confirmedAt!.toLocal()),
              if (order.roundNumber > 1) S.current.managerRound(order.roundNumber),
            ].join(' · '),
            style: FoodlyTextStyles.caption.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

/// La única acción de una orden pasada: decir que el cierre está mal.
class _CorregirCierre extends StatelessWidget {
  final GroupOrderDM order;
  final VoidCallback onCorregir;

  const _CorregirCierre({required this.order, required this.onCorregir});

  @override
  Widget build(BuildContext context) {
    final aCaja = order.closedReason == 'unpaid';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(S.current.managerAmendTitle, style: FoodlyTextStyles.labelBold),
        const SizedBox(height: 4),
        Text(S.current.managerAmendHint, style: FoodlyTextStyles.caption),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: onCorregir,
          icon: Icon(
            aCaja ? Icons.payments_rounded : Icons.report_gmailerrorred_rounded,
            size: 18,
            color: aCaja ? const Color(0xFF0B8A40) : const Color(0xFFB3261E),
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            side: BorderSide(
              color: (aCaja ? const Color(0xFF0B8A40) : const Color(0xFFB3261E)).withValues(alpha: .5),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          label: Text(
            aCaja ? S.current.managerAmendToPaidOffline : S.current.managerAmendToUnpaid,
            style: FoodlyTextStyles.labelBold.copyWith(
              color: aCaja ? const Color(0xFF0B8A40) : const Color(0xFFB3261E),
            ),
          ),
        ),
      ],
    );
  }
}
