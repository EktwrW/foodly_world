import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Indicador del estado de pago de un participante. Verde con check = pagado;
/// spinner = procesando; naranja undo = reembolsado; gris hueco = pendiente.
/// Compartido por ParticipantProgressRow y ParticipantExpansibleTile.
class GroupOrderPaymentStatusBadge extends StatelessWidget {
  final GroupPaymentStatus status;

  const GroupOrderPaymentStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case GroupPaymentStatus.paid:
        return const Icon(Icons.check_circle_rounded, size: 22, color: FoodlyThemes.tertiaryFoodly);
      case GroupPaymentStatus.processing:
        return const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2, color: FoodlyThemes.primaryFoodly),
        );
      case GroupPaymentStatus.refunded:
        return const Icon(Icons.undo_rounded, size: 22, color: FoodlyThemes.warning);
      case GroupPaymentStatus.pending:
        return Icon(Icons.circle_outlined, size: 22, color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.6));
    }
  }
}
