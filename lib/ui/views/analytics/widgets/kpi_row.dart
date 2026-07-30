import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/analytics/widgets/kpi_card.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show FontAwesome;

class KpiRow extends StatelessWidget {
  final KpisDM kpis;

  const KpiRow({super.key, required this.kpis});

  @override
  Widget build(BuildContext context) {
    final items = [
      KpiCard(
        icon: Icons.table_restaurant_outlined,
        label: S.current.reservations,
        value: '${kpis.reservationsTotal}',
        accentColor: FoodlyThemes.primaryFoodly,
      ),
      KpiCard(
        icon: Icons.check_circle_outline,
        label: S.current.successRate,
        value: '${kpis.reservationSuccessRate.toStringAsFixed(1)}%',
        accentColor: FoodlyThemes.tertiaryFoodly,
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
