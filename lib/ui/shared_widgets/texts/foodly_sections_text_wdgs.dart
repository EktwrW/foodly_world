import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart';

class FoodlySectionsTitle extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function()? onPressed;

  const FoodlySectionsTitle({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10, 4))),
      child: SizedBox.fromSize(
        size: Size(context.screenWidth - 36, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: firstText, style: FoodlyTextStyles.profileSectionTitle),
                  TextSpan(text: secondText, style: FoodlyTextStyles.profileSectionTitlePurple),
                ],
              ),
            ),
            if (onPressed != null)
              FadeInRight(
                  child: Icon(EvaIcons.edit_2, color: FoodlyThemes.primaryFoodly.withValues(alpha: .69), size: 18))
          ],
        ),
      ),
    );
  }
}

class FoodlySectionsFooterText extends StatelessWidget {
  final String footerText;

  const FoodlySectionsFooterText({
    super.key,
    required this.footerText,
  });

  @override
  Widget build(BuildContext context) =>
      Text.rich(TextSpan(style: FoodlyTextStyles.profileSectionPrivacyNotes, text: footerText));
}
