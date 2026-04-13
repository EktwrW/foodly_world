import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/analytics/helpers/analytics_label_helper.dart';

class ReservationsDonut extends StatelessWidget {
  final List<BreakdownItemDM> items;

  const ReservationsDonut({super.key, required this.items});

  static const _statusColors = {
    'confirmed': FoodlyThemes.tertiaryFoodly,
    'completed': FoodlyThemes.primaryFoodly,
    'pending': Colors.orange,
    'cancelled': Colors.grey,
    'rejected': Colors.redAccent,
    'no_show': Colors.blueGrey,
  };

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final total = items.fold<int>(0, (sum, e) => sum + e.value);
    if (total == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.reservations, style: FoodlyTextStyles.actionsBodyBold),
          const SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 30,
                sections: items.map((item) {
                  final color = _statusColors[item.label.toLowerCase()] ?? Colors.grey;
                  return PieChartSectionData(
                    value: item.value.toDouble(),
                    color: color,
                    radius: 35,
                    title: '${(item.value / total * 100).round()}%',
                    titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: items.map((item) {
              final color = _statusColors[item.label.toLowerCase()] ?? Colors.grey;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Text('${AnalyticsLabelHelper.reservationStatus(item.label)} (${item.value})', style: FoodlyTextStyles.caption.copyWith(fontSize: 10)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
