import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:intl/intl.dart';

class ReservationCard extends StatelessWidget {
  final ReservationDM reservation;
  final VoidCallback? onCancel;

  const ReservationCard({
    super.key,
    required this.reservation,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: business info + status
            Row(
              children: [
                if (reservation.businessPhoto != null)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(reservation.businessPhoto!),
                  )
                else
                  const CircleAvatar(
                    radius: 20,
                    child: Icon(Bootstrap.shop, size: 20),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reservation.businessName ?? 'Business',
                        style: FoodlyTextStyles.actionsBodyBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (reservation.reservationDate != null)
                        Text(
                          '${DateFormat.yMMMd().format(reservation.reservationDate!)} at ${reservation.reservationTime ?? '--:--'}',
                          style: FoodlyTextStyles.caption,
                        ),
                    ],
                  ),
                ),
                _StatusBadge(status: reservation.status),
              ],
            ),
            const SizedBox(height: 10),

            // Details row
            Row(
              spacing: 16,
              children: [
                _InfoChip(icon: Bootstrap.people_fill, label: '${reservation.partySize}'),
                if (reservation.createdAt != null)
                  _InfoChip(
                    icon: Bootstrap.clock,
                    label: 'Requested ${DateFormat.MMMd().format(reservation.createdAt!)}',
                  ),
              ],
            ),

            // Special requests
            if (reservation.specialRequests != null && reservation.specialRequests!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                reservation.specialRequests!,
                style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            // Manager notes
            if (reservation.managerNotes != null && reservation.managerNotes!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                'Note: ${reservation.managerNotes!}',
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            // Cancel button
            if (reservation.canBeCancelledByCustomer && onCancel != null) ...[
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onCancel,
                  icon: const Icon(Bootstrap.x_circle, size: 16),
                  label: const Text('Cancel'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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

class _StatusBadge extends StatelessWidget {
  final ReservationStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      ReservationStatus.pending => (Colors.orange, 'Pending'),
      ReservationStatus.confirmed => (FoodlyThemes.tertiaryFoodly, 'Confirmed'),
      ReservationStatus.rejected => (Colors.red.shade700, 'Rejected'),
      ReservationStatus.cancelled => (Colors.grey, 'Cancelled'),
      ReservationStatus.completed => (FoodlyThemes.primaryFoodly, 'Completed'),
      ReservationStatus.noShow => (Colors.blueGrey, 'No Show'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 0.5),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Icon(icon, size: 14, color: FoodlyThemes.secondaryFoodly),
        Text(label, style: FoodlyTextStyles.caption),
      ],
    );
  }
}
