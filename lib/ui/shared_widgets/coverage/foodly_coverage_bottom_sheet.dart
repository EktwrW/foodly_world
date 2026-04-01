import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart' show rootNavigatorKey;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/contact/contact_bottom_sheet.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

void showFoodlyCoverageBottomSheet() {
  final context = rootNavigatorKey.currentContext;
  if (context == null) return;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _FoodlyCoverageBottomSheet(),
  );
}

class _FoodlyCoverageBottomSheet extends StatelessWidget {
  const _FoodlyCoverageBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ui.NeumorphicColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 60),
              child: FadeIn(
                duration: const Duration(milliseconds: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    Text(
                      S.current.foodlyCoverage,
                      style: FoodlyTextStyles.sectionsTitle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // Description
                    Text(
                      S.current.foodlyCoverageDescription,
                      style: FoodlyTextStyles.label,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Country list
                    ...FoodlyCountries.values.map((country) => _CountryTile(country: country)),
                    const SizedBox(height: 24),
                    // Not in your country section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            S.current.notInYourCountry,
                            style: FoodlyTextStyles.labelPurpleBold,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          CustomNeumorphicButton(
                            disabled: false,
                            onPressed: () {
                              Navigator.of(context).pop();
                              showContactBottomSheet(
                                context,
                                prefilledSubject: S.current.suggestFoodlySubject,
                              );
                            },
                            text: S.current.suggestFoodlyInYourCountry,
                            fontSize: 13,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountryTile extends StatelessWidget {
  final FoodlyCountries country;
  const _CountryTile({required this.country});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          if (country.flag != null) country.flag!,
          const SizedBox(width: 12),
          Text(country.name, style: FoodlyTextStyles.labelBold),
        ],
      ).paddingSymmetric(horizontal: 8),
    );
  }
}
