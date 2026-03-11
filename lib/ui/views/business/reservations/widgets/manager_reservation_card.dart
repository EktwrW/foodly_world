import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:foodly_world/generated/l10n.dart' show S;

class ManagerReservationCard extends StatelessWidget {
  final ReservationDM reservation;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;
  final VoidCallback? onCancel;
  final VoidCallback? onNoShow;
  final VoidCallback? onComplete;

  const ManagerReservationCard({
    super.key,
    required this.reservation,
    this.onConfirm,
    this.onReject,
    this.onCancel,
    this.onNoShow,
    this.onComplete,
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
            // Header: user info + status
            Row(
              children: [
                if (reservation.userPhoto != null)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(reservation.userPhoto!),
                  )
                else
                  const CircleAvatar(
                    radius: 20,
                    child: Icon(Bootstrap.person_fill, size: 20),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reservation.userName ?? S.current.customer,
                        style: FoodlyTextStyles.actionsBodyBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (reservation.createdAt != null)
                        Text(
                          '${S.current.requested} ${DateFormat.yMMMd().format(reservation.createdAt!)}',
                          style: FoodlyTextStyles.caption,
                        ),
                    ],
                  ),
                ),
                // Contact icon buttons
                if (reservation.userPhone != null && reservation.userPhone!.isNotEmpty)
                  _ContactIconButton(
                    icon: Bootstrap.telephone_fill,
                    tooltip: reservation.userPhone!,
                    onPressed: () => launchUrl(Uri(scheme: 'tel', path: reservation.userPhone)),
                  ),
                if (reservation.userEmail != null && reservation.userEmail!.isNotEmpty)
                  _ContactIconButton(
                    icon: Bootstrap.envelope_fill,
                    tooltip: reservation.userEmail!,
                    onPressed: () => launchUrl(Uri(scheme: 'mailto', path: reservation.userEmail)),
                  ),
              ],
            ),
            const SizedBox(height: 10),

            // Details: date+time next to guests + status badge
            Row(
              children: [
                if (reservation.reservationDate != null)
                  _InfoChip(
                    icon: Bootstrap.calendar_event,
                    label:
                        '${DateFormat.MMMd().format(reservation.reservationDate!)} ${S.current.at} ${reservation.reservationTime ?? '--:--'}',
                  ),
                const SizedBox(width: 16),
                _InfoChip(icon: Bootstrap.people_fill, label: '${reservation.partySize} ${S.current.guests}'),
                const Spacer(),
                _StatusBadge(status: reservation.status),
              ],
            ),

            // Special requests
            if (reservation.hasSpecialRequests) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  reservation.specialRequests!,
                  style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],

            // Action buttons
            if (reservation.canBeActedOnByManager || reservation.isConfirmed) ...[
              const SizedBox(height: 12),
              _buildActionButtons(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    if (reservation.isPending) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          if (onReject != null)
            _ActionButton(
              label: S.current.reject,
              icon: Bootstrap.x_circle,
              color: Colors.red.shade700,
              onPressed: onReject!,
            ),
          if (onConfirm != null)
            _ActionButton(
              label: S.current.confirm,
              icon: Bootstrap.check_circle,
              color: FoodlyThemes.tertiaryFoodly,
              onPressed: onConfirm!,
            ),
        ],
      );
    }

    if (reservation.isConfirmed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          if (onCancel != null)
            _ActionButton(
              label: S.current.cancel,
              icon: Bootstrap.x_circle,
              color: Colors.orange,
              onPressed: onCancel!,
            ),
          if (onNoShow != null)
            _ActionButton(
              label: S.current.noShow,
              icon: Bootstrap.person_x,
              color: Colors.blueGrey,
              onPressed: onNoShow!,
            ),
          if (onComplete != null)
            _ActionButton(
              label: S.current.complete,
              icon: Bootstrap.check_circle_fill,
              color: FoodlyThemes.primaryFoodly,
              onPressed: onComplete!,
            ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}

class _ContactIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _ContactIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 16, color: FoodlyThemes.primaryFoodly),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 14),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
      ReservationStatus.pending => (Colors.orange, S.current.pending),
      ReservationStatus.confirmed => (FoodlyThemes.tertiaryFoodly, S.current.confirmed),
      ReservationStatus.rejected => (Colors.red.shade700, S.current.rejected),
      ReservationStatus.cancelled => (Colors.grey, S.current.cancelled),
      ReservationStatus.completed => (FoodlyThemes.primaryFoodly, S.current.completed),
      ReservationStatus.noShow => (Colors.blueGrey, S.current.noShow),
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
