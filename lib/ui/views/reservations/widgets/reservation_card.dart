import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/calendar_helper.dart';
import 'package:foodly_world/core/utils/url_launcher.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Brand, Brands, FontAwesome, Bootstrap;
import 'package:intl/intl.dart';

class ReservationCard extends StatelessWidget {
  final ReservationDM reservation;
  final VoidCallback? onCancel;
  final VoidCallback? onApproveQuote;
  final VoidCallback? onRejectQuote;
  final VoidCallback? onOpenMessages;
  final bool returnOnlyContent;

  const ReservationCard({
    super.key,
    required this.reservation,
    this.onCancel,
    this.onApproveQuote,
    this.onRejectQuote,
    this.onOpenMessages,
    this.returnOnlyContent = false,
  });

  _buildContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 16, 13, 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: business info + status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarWidget(
                avatarUrl: reservation.businessPhoto,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation.businessName ?? S.current.business,
                      style: FoodlyTextStyles.actionsBodyBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (reservation.reservationDate != null)
                      Text(
                        '${DateFormat.yMMMd().format(reservation.reservationDate!)} ${S.current.at} ${reservation.reservationTime ?? '--:--'}',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (reservation.createdAt != null)
                _InfoChip(
                  icon: FontAwesome.clock,
                  label: '${S.current.requested} ${DateFormat.MMMd().format(reservation.createdAt!)}',
                ),
              _InfoChip(icon: FontAwesome.people_group_solid, label: ' ${reservation.partySize}'),
            ],
          ).paddingVertical(3),

          // Special requests
          if (reservation.specialRequests != null && reservation.specialRequests!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              reservation.specialRequests!,
              style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).paddingAll(6),
          ],

          // Manager notes
          if (reservation.managerNotes != null && reservation.managerNotes!.isNotEmpty) ...[
            Text(
              '${S.current.note}: ${reservation.managerNotes!}',
              style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ).paddingAll(9),
          ],

          // Service booking details
          if (reservation.isServiceBooking) ...[
            const SizedBox(height: 10),
            _ServiceBookingDetails(reservation: reservation),
          ],

          // Quote actions (customer side, quoted status): Reject + Approve
          if (reservation.canApproveQuote && (onApproveQuote != null || onRejectQuote != null)) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                if (onRejectQuote != null)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onRejectQuote,
                      icon: const Icon(Bootstrap.x_circle, size: 15),
                      label: Text(S.current.rejectQuote),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red.shade700,
                        side: BorderSide(color: Colors.red.shade400),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                if (onRejectQuote != null && onApproveQuote != null) const SizedBox(width: 8),
                if (onApproveQuote != null)
                  Expanded(
                    flex: 2,
                    child: TextButton.icon(
                      onPressed: onApproveQuote,
                      icon: const Icon(Bootstrap.check_circle_fill, size: 16),
                      label: Text(S.current.approveQuote),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
              ],
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

          // Action row: Calendar + Waze + Google Maps (confirmed only)
          if (reservation.isConfirmed) ...[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => CalendarHelper.addReservationToCalendar(reservation),
                  tooltip: S.current.addToCalendar,
                  icon: const Icon(Bootstrap.calendar2_event, size: 20, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: FoodlyThemes.tertiaryFoodly,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minimumSize: const Size(36, 36),
                  ),
                ),
                if (reservation.businessLatitude != null && reservation.businessLongitude != null) ...[
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: () => UrlLauncher.launchWazeDirections(
                      reservation.businessLatitude!,
                      reservation.businessLongitude!,
                    ),
                    tooltip: 'Waze',
                    icon: Brand(Brands.waze, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(36, 36),
                    ),
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: () => UrlLauncher.launchGoogleMapsDirections(
                      reservation.businessLatitude!,
                      reservation.businessLongitude!,
                    ),
                    tooltip: 'Google Maps',
                    icon: Brand(Brands.google_maps_old, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(36, 36),
                    ),
                  ),
                ],
              ],
            ),
          ],

          // Cancel button
          if (reservation.canBeCancelledByCustomer && onCancel != null) ...[
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onCancel,
                icon: const Icon(FontAwesome.circle_xmark, size: 16),
                label: Text(S.current.cancel),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (returnOnlyContent) {
      return _buildContent();
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      color: reservation.isConfirmed ? Colors.white : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: _buildContent(),
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
      spacing: 4,
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

          // Quoted amount
          if (reservation.hasQuote)
            Row(
              children: [
                const Icon(Bootstrap.currency_euro, size: 14, color: Colors.deepPurple),
                const SizedBox(width: 6),
                Text(
                  '${S.current.quotedAmount}: €${reservation.quotedAmount!.toStringAsFixed(2)}',
                  style: FoodlyTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),

          // Awaiting quote indicator
          if (reservation.isPending && reservation.isServiceBooking)
            Row(
              children: [
                Icon(Bootstrap.hourglass_split, size: 13, color: Colors.orange.shade700),
                const SizedBox(width: 6),
                Text(
                  S.current.awaitingQuote,
                  style: FoodlyTextStyles.caption.copyWith(color: Colors.orange.shade700),
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
