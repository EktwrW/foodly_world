import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/analytics/helpers/analytics_label_helper.dart';

/// Catering & chefs flavour of [FunnelChart].
///
/// Visual is identical to the restaurant funnel (same card chrome, same
/// gradient bars, same step row layout). The differences are:
///
///   1. Strongly typed to [ServiceFunnelDM] instead of [FunnelDM] so the
///      conversion line can read the three service-specific rates
///      (`view_to_inquiry`, `inquiry_to_booking`, `view_to_booking`)
///      without any casts or null-checks downstream.
///   2. The conversion sub-headline reads the service-vertical labels —
///      rendered via the existing l10n keys
///      (`analyticsViewToInquiry`, `analyticsInquiryToBooking`,
///      `analyticsViewToBooking`).
///
/// Step labels themselves come from [AnalyticsLabelHelper.funnelStep],
/// which already knows how to map the six `service.*` keys to localised
/// strings — same helper the restaurant chart uses for its own keys.
class ServiceFunnelChart extends StatelessWidget {
  final ServiceFunnelDM funnel;

  const ServiceFunnelChart({super.key, required this.funnel});

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
      Colors.indigo,
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
                '${S.current.analyticsViewToInquiry}: ${funnel.conversion!.viewToInquiryRate.toStringAsFixed(1)}%  •  '
                '${S.current.analyticsInquiryToBooking}: ${funnel.conversion!.inquiryToBookingRate.toStringAsFixed(1)}%  •  '
                '${S.current.analyticsViewToBooking}: ${funnel.conversion!.viewToBookingRate.toStringAsFixed(1)}%',
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
                          AnalyticsLabelHelper.funnelStep(step.label),
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
