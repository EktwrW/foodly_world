import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SegmentedButton<int>(
        showSelectedIcon: false,
        segments: _options
            .map((d) => ButtonSegment<int>(
                  value: d,
                  label: Text('${d}d', style: const TextStyle(fontSize: 12)),
                ))
            .toList(),
        selected: {selectedDays},
        onSelectionChanged: (s) => onChanged(s.first),
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: FoodlyThemes.primaryFoodly,
          selectedForegroundColor: Colors.white,
          foregroundColor: FoodlyThemes.primaryFoodly,
          side: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3)),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
