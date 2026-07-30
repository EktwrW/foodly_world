import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/guest/guest_gate_sheet.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:go_router/go_router.dart';

/// Punto de entrada al feature de orden grupal, anclado al pie del menú.
///
/// - Sin orden activa: CTA "Ordenar en grupo" que inicia la orden (requiere
///   sesión; en modo invitado abre el guest-gate).
/// - Con orden activa para ESTE negocio: barra "Ver pedido · N · €X" que
///   navega a la GroupOrderPage, donde el host cierra (lock) y todos pagan.
///
/// Reacciona al [ActiveGroupOrderCubit] (singleton DI), el "carrito de grupo"
/// que también alimenta el botón "+" de cada ítem del menú.
class GroupOrderEntryButton extends StatelessWidget {
  final String businessUuid;
  const GroupOrderEntryButton({super.key, required this.businessUuid});

  @override
  Widget build(BuildContext context) {
    final cubit = di<ActiveGroupOrderCubit>();
    return BlocBuilder<ActiveGroupOrderCubit, GroupOrderDM?>(
      bloc: cubit,
      builder: (context, order) {
        final active = order != null && order.businessUuid == businessUuid;

        if (!active) {
          return CustomNeumorphicButton(
            text: S.current.groupOrderEntryCta,
            disabled: false,
            leading: const Icon(Icons.groups_rounded, color: Colors.white, size: 20),
            onPressed: () {
              // Crear una orden grupal requiere cuenta (App Store 5.1.1.v).
              if (!GuestGuard.requireAuth(GuestGateAction.groupOrder)) return;
              cubit.startForBusiness(businessUuid);
            },
          );
        }

        final count = order.items.fold<int>(0, (acc, i) => acc + i.quantity);
        final label = count == 0
            ? S.current.groupOrderAddFromMenu
            : '${S.current.groupOrderViewOrder} · $count · ${formatMoney(order.subtotal, order.currency)}';

        return CustomNeumorphicButton(
          text: label,
          disabled: false,
          leading: const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 20),
          onPressed: () => context.pushNamed(
            AppRoutes.groupOrder.name,
            pathParameters: {AppRoutes.routeIdParam: order.uuid},
          ),
        );
      },
    );
  }
}
