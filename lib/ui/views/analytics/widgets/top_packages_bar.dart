import 'package:flutter/material.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show AuthSessionService, di;
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Catering & chefs replacement for [TopEventsBar].
///
/// Renders the `top_packages` breakdown from /analytics/service-overview.
/// Each row is a richer entry than the generic event-type bars: package
/// title, formatted price (with the manager's business currency), and
/// the booking count rendered as both a number and a proportional bar.
///
/// Currency comes from `di<AuthSessionService>().currency` — the manager
/// is always viewing their OWN business's analytics, so the auth-session
/// currency is the right symbol (no need for a per-row override).
class TopPackagesBar extends StatelessWidget {
  final List<TopServicePackageDM> items;

  const TopPackagesBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final maxBookings = items.map((p) => p.bookingsCount).reduce((a, b) => a > b ? a : b);
    final currency = di<AuthSessionService>().currency;

    return Container(
      margin: const EdgeInsets.only(top: 3, bottom: 60),
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
          Text(S.current.analyticsTopPackagesTitle, style: FoodlyTextStyles.actionsBodyBold),
          const SizedBox(height: 12),
          ...items.map((pkg) {
            final widthFraction = maxBookings == 0 ? 0.0 : pkg.bookingsCount / maxBookings;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title takes the lion's share — package names can be
                      // long ("Cena privada para 6-8 personas con maridaje").
                      Expanded(
                        child: Text(
                          pkg.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FoodlyTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        // Show formatted price only when the package has a
                        // numeric price. `on_quote` packages legitimately
                        // ship `price = 0` from the BE — for those we hide
                        // the price column entirely so it doesn't read as
                        // "free".
                        pkg.priceType == 'on_quote' || pkg.price <= 0
                            ? S.current.onQuote
                            : '$currency${pkg.price.toStringAsFixed(2)}',
                        style: FoodlyTextStyles.caption.copyWith(
                          color: FoodlyThemes.primaryFoodly,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: [
                              Container(height: 8, color: Colors.grey.shade100),
                              FractionallySizedBox(
                                widthFactor: widthFraction.clamp(0.0, 1.0),
                                child: Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FoodlyThemes.primaryFoodly,
                                        FoodlyThemes.primaryFoodly.withValues(alpha: 0.6),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Bookings count + label inline. The label is plural-
                      // agnostic because the BE numbers can be 0..N, and
                      // pluralising via i18n would just add an .arb plural
                      // rule for very little visual gain on a compact row.
                      Text(
                        '${pkg.bookingsCount} · ${S.current.analyticsBookings.toLowerCase()}',
                        style: FoodlyTextStyles.caption.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: 11,
                        ),
                      ),
                    ],
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
