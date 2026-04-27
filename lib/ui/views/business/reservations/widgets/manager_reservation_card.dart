import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ManagerReservationCard extends StatelessWidget {
  final ReservationDM reservation;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;
  final VoidCallback? onCancel;
  final VoidCallback? onNoShow;
  final VoidCallback? onComplete;
  final VoidCallback? onSendQuote;
  final VoidCallback? onOpenMessages;
  final bool returnOnlyContent;

  const ManagerReservationCard({
    super.key,
    required this.reservation,
    this.onConfirm,
    this.onReject,
    this.onCancel,
    this.onNoShow,
    this.onComplete,
    this.onSendQuote,
    this.onOpenMessages,
    this.returnOnlyContent = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 6,
              children: [
                _StatusBadge(status: reservation.status),
                Row(
                  spacing: 3,
                  children: [
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
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Details: date+time next to guests + status badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (reservation.reservationDate != null)
              _InfoChip(
                icon: Bootstrap.calendar_event,
                label:
                    '${DateFormat.MMMd().format(reservation.reservationDate!)} ${S.current.at} ${reservation.reservationTime ?? '--:--'}',
              ),
            const SizedBox(width: 16),
            _InfoChip(
              icon: FontAwesome.people_group_solid,
              label: '${reservation.partySize} ${S.current.guests}',
            ),
          ],
        ).paddingHorizontal(6),

        // Service booking details
        if (reservation.isServiceBooking) ...[
          const SizedBox(height: 10),
          _ServiceBookingDetails(reservation: reservation),
        ],

        // Special requests
        if (reservation.hasSpecialRequests) ...[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 13),
            padding: const EdgeInsets.all(9),
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

        // Messages shortcut
        if (reservation.isServiceBooking && onOpenMessages != null) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onOpenMessages,
              icon: const Icon(Bootstrap.chat_left_text, size: 14),
              label: Text(
                '${S.current.bookingMessages}${reservation.hasMessages ? ' (${reservation.messagesCount})' : ''}',
                style: const TextStyle(fontSize: 12),
              ),
              style: TextButton.styleFrom(
                foregroundColor: FoodlyThemes.secondaryFoodly,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],

        // Action buttons
        if (reservation.canBeActedOnByManager || reservation.isConfirmed || reservation.isQuoted) ...[
          const SizedBox(height: 12),
          _buildActionButtons(),
        ],
      ],
    );

    if (returnOnlyContent) {
      return content;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: reservation.isConfirmed ? Colors.white : null,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: content,
      ),
    );
  }

  Widget _buildActionButtons() {
    if (reservation.isPending) {
      // Service bookings: show Send Quote + Reject
      if (reservation.isServiceBooking) {
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
            if (onSendQuote != null)
              _ActionButton(
                label: S.current.sendQuote,
                icon: Bootstrap.cash_coin,
                color: Colors.deepPurple,
                onPressed: onSendQuote!,
              ),
          ],
        );
      }

      // Table bookings: Confirm / Reject
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

    // Quoted: waiting for customer approval, manager can cancel
    if (reservation.isQuoted) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          if (onCancel != null)
            _ActionButton(
              label: S.current.cancel,
              icon: Bootstrap.x_circle,
              color: Colors.orange,
              onPressed: onCancel!,
            ),
          _InfoChip(
            icon: Bootstrap.hourglass_split,
            label: S.current.awaitingQuote,
          ),
        ],
      );
    }

    if (reservation.isConfirmed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
      ReservationStatus.quoted => (Colors.deepPurple, S.current.quoted),
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
      spacing: 6,
      children: [
        Icon(icon, size: 14, color: FoodlyThemes.secondaryFoodly),
        Text(label, style: FoodlyTextStyles.caption),
      ],
    );
  }
}

class _ServiceBookingDetails extends StatelessWidget {
  final ReservationDM reservation;

  const _ServiceBookingDetails({required this.reservation});

  @override
  Widget build(BuildContext context) {
    // Manager-side card → currency comes from the manager's own business
    // (the only one shown in this dashboard). Same source as quote_send_sheet
    // and the rest of the manager-side surfaces. Defaults to '$' so we never
    // crash on a half-loaded session, mirroring the pattern in
    // AuthSessionService.currency.
    final currency = di<AuthSessionService>().currency;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.deepPurple.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          // Package title
          if (reservation.servicePackageTitle != null)
            Row(
              children: [
                const Icon(Bootstrap.box_seam, size: 14, color: Colors.deepPurple),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    reservation.servicePackageTitle!,
                    style: FoodlyTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),

          // Guest count
          if (reservation.guestCount != null)
            _ServiceDetailRow(
              icon: FontAwesome.people_group_solid,
              label: '${S.current.guestCount}: ${reservation.guestCount}',
            ),

          // Event type
          if (reservation.eventType != null)
            _ServiceDetailRow(
              icon: Bootstrap.calendar_event,
              label: '${S.current.eventType}: ${reservation.eventType!.name}',
            ),

          // Event location
          if (reservation.hasEventLocation)
            _ServiceDetailRow(
              icon: Bootstrap.geo_alt,
              label: '${reservation.eventAddress}${reservation.eventCity != null ? ', ${reservation.eventCity}' : ''}',
            ),

          // Budget estimate
          if (reservation.budgetEstimate != null)
            _ServiceDetailRow(
              icon: Bootstrap.cash_coin,
              label: '${S.current.budgetEstimate}: $currency${reservation.budgetEstimate!.toStringAsFixed(2)}',
            ),

          // Dietary notes
          if (reservation.hasDietaryNotes)
            _ServiceDetailRow(
              icon: Bootstrap.egg,
              label: '${S.current.dietaryNotes}: ${reservation.dietaryNotes}',
            ),

          // Quoted amount (if already quoted). Replaced the earlier
          // Bootstrap.currency_euro icon with cash_coin (neutral "money"
          // glyph already used by the budget row above) so the card no
          // longer hardcodes €. The currency symbol itself moves into the
          // label text — derived from the manager's business country —
          // which is the canonical pattern across the rest of the app.
          if (reservation.hasQuote)
            Row(
              children: [
                const Icon(Bootstrap.cash_coin, size: 14, color: Colors.deepPurple),
                const SizedBox(width: 6),
                Text(
                  '${S.current.quotedAmount}: $currency${reservation.quotedAmount!.toStringAsFixed(2)}',
                  style: FoodlyTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _ServiceDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceDetailRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: FoodlyThemes.secondaryFoodly),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: FoodlyTextStyles.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
