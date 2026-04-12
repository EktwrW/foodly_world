import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

class FunnelChart extends StatelessWidget {
  final FunnelDM funnel;

  const FunnelChart({super.key, required this.funnel});

  @override
  Widget build(BuildContext context) {
    final steps = funnel.steps;
    if (steps.isEmpty) return const SizedBox.shrink();

    final maxValue = steps.map((s) => s.value).reduce((a, b) => a > b ? a : b);
    if (maxValue == 0) return const SizedBox.shrink();

    final colors = [
      FoodlyThemes.primaryFoodly,
      FoodlyThemes.secondaryFoodly,
      FoodlyThemes.tertiaryFoodly,
      Colors.amber.shade700,
      Colors.blueGrey,
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Text(S.current.conversionFunnel, style: FoodlyTextStyles.actionsBodyBold),
          if (funnel.conversion != null)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 12),
              child: Text(
                '${S.current.viewToInteract}: ${funnel.conversion!.viewToInteract.toStringAsFixed(1)}%  •  '
                '${S.current.interactToReserve}: ${funnel.conversion!.interactToReserve.toStringAsFixed(1)}%  •  '
                '${S.current.reserveToComplete}: ${funnel.conversion!.reserveToComplete.toStringAsFixed(1)}%',
                style: FoodlyTextStyles.caption.copyWith(fontSize: 10),
              ),
            )
          else
            const SizedBox(height: 12),
          ...steps.asMap().entries.map((entry) {
            final i = entry.key;
            final step = entry.value;
            final widthFraction = step.value / maxValue;
            final color = colors[i % colors.length];

            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          step.label,
                          style: FoodlyTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${step.value}',
                        style: FoodlyTextStyles.caption.copyWith(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  FractionallySizedBox(
                    widthFactor: widthFraction.clamp(0.05, 1.0),
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color, color.withValues(alpha: 0.6)],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
