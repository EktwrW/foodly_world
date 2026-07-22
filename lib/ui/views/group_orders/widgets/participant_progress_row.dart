import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_status_badge.dart';

/// Fila de progreso de un participante en una orden grupal: avatar, nombre,
/// badge de "host", estado de pago (pagado / procesando / pendiente) y su
/// parte. Es el corazón visual del split. Estilo Foodly.
class ParticipantProgressRow extends StatelessWidget {
  final GroupOrderParticipantDM participant;
  final String currency;

  const ParticipantProgressRow({
    super.key,
    required this.participant,
    this.currency = 'EUR',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          AvatarWidget(
            avatarUrl: participant.avatarUrl,
            width: 40,
            height: 40,
            avatarType: AvatarType.user,
          ),
          const SizedBox(width: 12),
          // Nombre + badge host
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    participant.displayName,
                    style: FoodlyTextStyles.labelBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (participant.isHost) ...[
                  const SizedBox(width: 6),
                  const _HostBadge(),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Monto del participante
          Text(
            formatMoney(participant.amountDue, currency),
            style: FoodlyTextStyles.itemPricePurpleBold,
          ),
          const SizedBox(width: 10),
          GroupOrderPaymentStatusBadge(status: participant.paymentStatus),
        ],
      ),
    );
  }
}

class _HostBadge extends StatelessWidget {
  const _HostBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(S.current.groupOrderHostBadge, style: FoodlyTextStyles.captionPurpleBold),
    );
  }
}
