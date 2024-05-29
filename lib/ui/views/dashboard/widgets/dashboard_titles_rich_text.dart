import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class DashboardSectionsTitle extends StatelessWidget {
  final String firstText;
  final String secondText;

  const DashboardSectionsTitle({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: firstText, style: FoodlyTextStyles.profileSectionTitle),
          TextSpan(text: secondText, style: FoodlyTextStyles.profileSectionTitlePurple),
        ],
      ),
    );
  }
}
