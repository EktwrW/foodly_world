import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/form_validations.dart';
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
    // Número internacional para mostrar y llamar: si la reserva trae snapshot,
    // `userPhone` ya es E.164; si no, lo componemos con el ISO del usuario.
    final userPhoneIntl =
        FormValidations.composeInternationalPhone(reservation.userPhone, reservation.userPhoneCountryCode);

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
                    if (userPhoneIntl != null && userPhoneIntl.isNotEmpty)
                      _ContactIconButton(
                        icon: Bootstrap.telephone_fill,
                        tooltip: userPhoneIntl,
                        onPressed: () => launchUrl(Uri(scheme: 'tel', path: userPhoneIntl)),
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
      color: Colors.white,
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
        return _ResponsiveActionRow(
          actions: [
            if (onReject != null)
              _ReservationAction(
                label: S.current.reject,
                icon: Bootstrap.x_circle,
                color: Colors.red.shade700,
                onPressed: onReject!,
              ),
            if (onSendQuote != null)
              _ReservationAction(
                label: S.current.sendQuote,
                icon: Bootstrap.cash_coin,
                color: Colors.deepPurple,
                onPressed: onSendQuote!,
              ),
          ],
        );
      }

      // Table bookings: Confirm / Reject
      return _ResponsiveActionRow(
        actions: [
          if (onReject != null)
            _ReservationAction(
              label: S.current.reject,
              icon: Bootstrap.x_circle,
              color: Colors.red.shade700,
              onPressed: onReject!,
            ),
          if (onConfirm != null)
            _ReservationAction(
              label: S.current.confirm,
              icon: Bootstrap.check_circle,
              color: FoodlyThemes.tertiaryFoodly,
              onPressed: onConfirm!,
            ),
        ],
      );
    }

    // Quoted: waiting for customer approval, manager can cancel.
    // This row mixes an action with an info chip (not a pure action row),
    // so we keep it as a Flexible-guarded Row rather than the responsive
    // collapser — the chip carries text that must stay readable, and there
    // are at most 2 children so it never reached the overflow threshold.
    if (reservation.isQuoted) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          if (onCancel != null)
            Flexible(
              child: _ActionButton(
                label: S.current.cancel,
                icon: Bootstrap.x_circle,
                color: Colors.orange,
                onPressed: onCancel!,
              ),
            ),
          Flexible(
            child: _InfoChip(
              icon: Bootstrap.hourglass_split,
              label: S.current.awaitingQuote,
            ),
          ),
        ],
      );
    }

    // Confirmed: Cancel / No-show / Complete. This is the densest row
    // (3 labelled actions) and the one that overflowed on narrow devices
    // like the iPhone 16e — hence the responsive collapser.
    if (reservation.isConfirmed) {
      return _ResponsiveActionRow(
        alignment: MainAxisAlignment.center,
        actions: [
          if (onCancel != null)
            _ReservationAction(
              label: S.current.cancel,
              icon: Bootstrap.x_circle,
              color: Colors.orange,
              onPressed: onCancel!,
            ),
          if (onNoShow != null)
            _ReservationAction(
              label: S.current.noShow,
              icon: Bootstrap.person_x,
              color: Colors.blueGrey,
              onPressed: onNoShow!,
            ),
          if (onComplete != null)
            _ReservationAction(
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

/// Lightweight descriptor for a manager action so [_ResponsiveActionRow]
/// can decide how to render it (labelled vs. icon-only) without the call
/// sites needing to know about the responsive logic.
class _ReservationAction {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ReservationAction({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });
}

/// Renders a row of manager actions that adapts to the available width.
///
/// On comfortable widths it shows the familiar icon + text buttons. When the
/// labels would no longer fit (e.g. the 3-action "Confirmed" row on an
/// iPhone 16e, or longer PT-PT strings), the whole row collapses — as a unit,
/// so it never looks half-broken — to evenly spaced icon-only buttons with
/// tooltips that preserve the meaning and a 40dp tap target for accessibility.
///
/// Why measure instead of just using Expanded + FittedBox: shrinking the text
/// produces tiny, inconsistent labels that read as a bug. An all-or-nothing
/// collapse is the intentional, professional behaviour we want here.
class _ResponsiveActionRow extends StatelessWidget {
  final List<_ReservationAction> actions;
  final MainAxisAlignment alignment;

  const _ResponsiveActionRow({
    required this.actions,
    this.alignment = MainAxisAlignment.end,
  });

  // Geometry of a single labelled [_ActionButton], kept in sync with its
  // TextButton.icon styling below. Used to estimate the inline width budget.
  static const double _spacing = 8;
  static const double _labelFontSize = 12;
  static const double _iconSize = 14;
  static const double _iconLabelGap = 8; // TextButton.icon default gap
  static const double _horizontalPadding = 20; // 10 left + 10 right
  static const double _safetyBuffer = 6; // err on the side of collapsing

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final textScaler = MediaQuery.textScalerOf(context);

        // Width required to show every label inline, measured against the
        // real text + scaler so it stays correct under large-font settings.
        var required = _spacing * (actions.length - 1);
        for (final a in actions) {
          final painter = TextPainter(
            text: TextSpan(
              text: a.label,
              style: const TextStyle(fontSize: _labelFontSize),
            ),
            textDirection: Directionality.of(context),
            textScaler: textScaler,
            maxLines: 1,
          )..layout();
          required += painter.width + _iconSize + _iconLabelGap + _horizontalPadding + _safetyBuffer;
        }

        final showLabels = required <= constraints.maxWidth;

        if (showLabels) {
          return Row(
            mainAxisAlignment: alignment,
            spacing: _spacing,
            children: [
              for (final a in actions)
                Flexible(
                  child: _ActionButton(
                    label: a.label,
                    icon: a.icon,
                    color: a.color,
                    onPressed: a.onPressed,
                  ),
                ),
            ],
          );
        }

        // Collapsed: icon-only, evenly distributed, meaning preserved via tooltip.
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (final a in actions) _CompactActionButton(action: a),
          ],
        );
      },
    );
  }
}

/// Icon-only fallback used by [_ResponsiveActionRow] on narrow screens.
/// Wraps the icon in a Tooltip (so the label is still discoverable) and an
/// IconButton with a 40dp minimum tap target for accessibility.
class _CompactActionButton extends StatelessWidget {
  final _ReservationAction action;

  const _CompactActionButton({required this.action});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: action.label,
      child: IconButton(
        onPressed: action.onPressed,
        icon: Icon(action.icon, size: 20),
        color: action.color,
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        splashRadius: 22,
      ),
    );
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
      // maxLines + ellipsis is a guard: the responsive parent only shows
      // labels when they fit, but if this button is used standalone (quoted
      // row) the label still degrades gracefully instead of overflowing.
      label: Text(
        label,
        style: const TextStyle(fontSize: 11),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
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
