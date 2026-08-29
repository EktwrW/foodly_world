import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/analytics/helpers/analytics_label_helper.dart';

class TopEventsBar extends StatelessWidget {
  final List<BreakdownItemDM> items;

  const TopEventsBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final maxVal = items.map((e) => e.value).reduce((a, b) => a > b ? a : b);

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
          Text(S.current.topEvents, style: FoodlyTextStyles.actionsBodyBold),
          const SizedBox(height: 8),
          SizedBox(
            height: 140 + (items.length > 5 ? 40 : 0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxVal * 1.2,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => Colors.white,
                    tooltipBorder: BorderSide(color: Colors.grey.shade300),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final rawLabel = groupIndex < items.length ? items[groupIndex].label : '';
                      return BarTooltipItem(
                        '${AnalyticsLabelHelper.eventType(rawLabel)}\n${rod.toY.toInt()}',
                        const TextStyle(fontSize: 11, color: Colors.black87),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, _) {
                        final idx = value.toInt();
                        if (idx < 0 || idx >= items.length) return const SizedBox.shrink();
                        final label = AnalyticsLabelHelper.eventType(items[idx].label);
                        // Shorten long labels
                        final short = label.length > 12 ? '${label.substring(0, 10)}…' : label;
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(short, style: const TextStyle(fontSize: 9, color: FoodlyThemes.neutralTextGrey)),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: items.asMap().entries.map((entry) {
                  final i = entry.key;
                  final item = entry.value;
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: item.value.toDouble(),
                        width: 18,
                        gradient: LinearGradient(
                          colors: [
                            FoodlyThemes.primaryFoodly,
                            FoodlyThemes.primaryFoodly.withValues(alpha: 0.7),
                            FoodlyThemes.primaryFoodly.withValues(alpha: 0.56),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
