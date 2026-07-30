import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:go_router/go_router.dart';

/// Chip persistente "Ver pedido · €X" (spec v2 §D.1). Visible siempre que
/// exista una orden grupal activa para [businessUuid]; tap → GroupOrderPage.
/// Pensado para anclarse sobre el FAB de la pantalla de menú.
class ActiveGroupOrderChip extends StatelessWidget {
  final String businessUuid;

  const ActiveGroupOrderChip({super.key, required this.businessUuid});

  @override
  Widget build(BuildContext context) {
    final cubit = di<ActiveGroupOrderCubit>();
    return BlocBuilder<ActiveGroupOrderCubit, GroupOrderDM?>(
      bloc: cubit,
      builder: (context, order) {
        final active = order != null && order.businessUuid == businessUuid;
        if (!active) return const SizedBox.shrink();

        return Material(
          color: FoodlyThemes.primaryFoodly,
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => context.pushNamed(
              AppRoutes.groupOrder.name,
              pathParameters: {AppRoutes.routeIdParam: order.uuid},
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    '${S.current.groupOrderViewOrder} · ${formatMoney(order.subtotal, order.currency)}',
                    style: FoodlyTextStyles.captionBold.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
