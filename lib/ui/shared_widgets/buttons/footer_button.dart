import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class FooterButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;
  final String buttonText;
  final String? secondButtonText;
  final double? dimension;
  final double? iconSize;
  final TextStyle? textStyle;

  const FooterButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.buttonText,
    this.secondButtonText,
    this.dimension,
    this.iconSize,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ui.NeumorphicButton(
          margin: const EdgeInsets.all(6),
          onPressed: onPressed,
          style: const ui.NeumorphicStyle(
            shape: ui.NeumorphicShape.convex,
            intensity: .6,
            color: ui.NeumorphicColors.decorationMaxWhiteColor,
          ),
          child: SizedBox.square(
            dimension: dimension ?? 80,
            child: Icon(iconData, size: iconSize ?? 36, color: FoodlyThemes.primaryFoodly),
          ),
        ),
        Text(buttonText, style: textStyle ?? FoodlyTextStyles.footerButtonNormal),
        if (secondButtonText != null) Text(secondButtonText!, style: textStyle ?? FoodlyTextStyles.footerButtonNormal),
      ],
    );
  }
}
