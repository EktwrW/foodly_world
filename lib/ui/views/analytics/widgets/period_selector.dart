import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart' show AuthSessionService, di;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

class PeriodSelector extends StatelessWidget {
  final int selectedDays;
  final ValueChanged<int> onChanged;

  const PeriodSelector({
    super.key,
    required this.selectedDays,
    required this.onChanged,
  });

  static const _options = [7, 30, 90, 180];

  @override
  Widget build(BuildContext context) {
    final businessName = di<AuthSessionService>().userSessionDM?.user.business.first.name ?? '';
    final showBusinessName = businessName.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: showBusinessName ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
        children: [
          if (showBusinessName)
            Flexible(
              child: Text(
                businessName,
                maxLines: 2,
                style: FoodlyTextStyles.labelPurpleBold,
              ).paddingHorizontal(9),
            ),
          SegmentedButton<int>(
            showSelectedIcon: false,
            segments: _options
                .map((d) => ButtonSegment<int>(
                      value: d,
                      label: Text(
                        '${d}d',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
                      ),
                    ))
                .toList(),
            selected: {selectedDays},
            onSelectionChanged: (s) => onChanged(s.first),
            style: SegmentedButton.styleFrom(
              backgroundColor: Colors.white,
              selectedBackgroundColor: FoodlyThemes.primaryFoodly,
              selectedForegroundColor: Colors.white,
              foregroundColor: FoodlyThemes.primaryFoodly,
              side: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3)),
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    );
  }
}
