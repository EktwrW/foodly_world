import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/analytics/widgets/kpi_card.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

/// Catering & chefs flavour of [KpiRow].
///
/// Same horizontal-scroll list of [KpiCard]s and identical visual rhythm —
/// only the metric set changes:
///
///  - Bookings total / success rate / avg response hours / availability checks
///    (the four service-specific cards that justify a separate vertical).
///  - Reviews + favorites: kept verbatim from the restaurant row because
///    catering businesses still earn reviews and favorites — Mateo's BE
///    ships the same fields under both endpoints.
///  - Total events.
///
/// Card icons borrow from the reservations dashboard where possible
/// (favourites = heart, etc.) so a manager who toggles between businesses
/// of different verticals doesn't have to re-learn the visual language.
class ServiceKpiRow extends StatelessWidget {
  final ServiceKpisDM kpis;

  const ServiceKpiRow({super.key, required this.kpis});

  @override
  Widget build(BuildContext context) {
    final items = [
      KpiCard(
        icon: Icons.event_available_outlined,
        label: S.current.analyticsBookingsTotal,
        value: '${kpis.bookingsTotal}',
        accentColor: FoodlyThemes.primaryFoodly,
      ),
      KpiCard(
        icon: Icons.check_circle_outline,
        label: S.current.analyticsBookingSuccessRate,
        value: '${kpis.bookingSuccessRate.toStringAsFixed(1)}%',
        accentColor: FoodlyThemes.tertiaryFoodly,
      ),
      KpiCard(
        icon: Icons.schedule_outlined,
        label: S.current.analyticsAvgResponseHours,
        // Show as integer when the BE happens to return a clean hour count
        // (e.g. 24.0 → "24 h"); decimal when it's a meaningful fraction
        // (23.36 → "23.4 h"). Keeps the card from showing "23.4 h" when
        // the underlying value is exactly 24 hours.
        value:
            '${kpis.avgResponseHours.truncateToDouble() == kpis.avgResponseHours ? kpis.avgResponseHours.toInt() : kpis.avgResponseHours.toStringAsFixed(1)} h',
        accentColor: Colors.indigo,
      ),
      KpiCard(
        icon: Icons.calendar_month_outlined,
        label: S.current.analyticsAvailabilityChecks,
        value: '${kpis.availabilityChecks}',
        accentColor: FoodlyThemes.secondaryFoodly,
      ),
      KpiCard(
        icon: Icons.star_outline_rounded,
        label: S.current.reviews,
        value: '${kpis.reviewsTotal}',
        accentColor: Colors.amber.shade700,
      ),
      KpiCard(
        icon: Icons.star_half_rounded,
        label: S.current.avgRating,
        value: kpis.reviewsAvgRating.toStringAsFixed(1),
        accentColor: Colors.amber.shade700,
      ),
      KpiCard(
        icon: FontAwesome.heart_solid,
        label: S.current.favorites,
        value: '${kpis.favoritesTotal}',
        accentColor: Colors.redAccent,
      ),
      KpiCard(
        icon: Icons.people_outline,
        label: S.current.uniqueUsers,
        value: '${kpis.favoritesUniqueUsers}',
        accentColor: FoodlyThemes.secondaryFoodly,
      ),
      KpiCard(
        icon: Icons.touch_app_outlined,
        label: S.current.totalEvents,
        value: '${kpis.eventsTotal}',
        accentColor: Colors.blueGrey,
      ),
    ];

    return SizedBox(
      height: 126,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) => items[i],
      ),
    );
  }
}
