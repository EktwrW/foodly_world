import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class DashboardTitleRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final double? paddingTop;

  const DashboardTitleRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.paddingTop,
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
    ).paddingTop(paddingTop ?? 24);
  }
}
