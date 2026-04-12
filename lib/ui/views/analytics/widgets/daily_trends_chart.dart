import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:intl/intl.dart';

class DailyTrendsChart extends StatelessWidget {
  final List<DailyPointDM> eventsDaily;
  final List<DailyPointDM> reservationsDaily;

  const DailyTrendsChart({
    super.key,
    required this.eventsDaily,
    required this.reservationsDaily,
  });

  List<FlSpot> _toSpots(List<DailyPointDM> points) {
    return points.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.count.toDouble())).toList();
  }

  @override
  Widget build(BuildContext context) {
    final eventsSpots = _toSpots(eventsDaily);
    final reservationsSpots = _toSpots(reservationsDaily);

    final maxY = [
      ...eventsDaily.map((e) => e.count),
      ...reservationsDaily.map((e) => e.count),
      1, // avoid maxY = 0
    ].reduce((a, b) => a > b ? a : b).toDouble();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
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
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text(S.current.dailyTrends, style: FoodlyTextStyles.actionsBodyBold),
          ),
          // Legend
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 12),
            child: Row(
              children: [
                _LegendDot(color: FoodlyThemes.primaryFoodly, label: S.current.reservations),
                const SizedBox(width: 16),
                _LegendDot(color: Colors.blueGrey.shade300, label: S.current.totalEvents),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: maxY * 1.15,
                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: (maxY / 4).clamp(1, double.infinity),
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 0.8,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, _) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: (eventsDaily.length / 5).clamp(1, double.infinity).ceilToDouble(),
                      getTitlesWidget: (value, _) {
                        final idx = value.toInt();
                        if (idx < 0 || idx >= eventsDaily.length) return const SizedBox.shrink();
                        final raw = eventsDaily[idx].date;
                        final parsed = DateTime.tryParse(raw);
                        final label = parsed != null ? DateFormat.MMMd().format(parsed) : raw;
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(label, style: const TextStyle(fontSize: 9, color: Colors.grey)),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  _buildLine(reservationsSpots, FoodlyThemes.primaryFoodly),
                  _buildLine(eventsSpots, Colors.blueGrey.shade300),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => Colors.white,
                    tooltipBorder: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartBarData _buildLine(List<FlSpot> spots, Color color) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      preventCurveOverShooting: true,
      color: color,
      barWidth: 2.5,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: color.withValues(alpha: 0.08),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: FoodlyTextStyles.caption.copyWith(fontSize: 11)),
      ],
    );
  }
}
