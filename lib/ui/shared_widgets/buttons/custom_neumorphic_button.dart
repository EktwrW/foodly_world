import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

enum CustomNeumorphicBtnType { primary, secondary, tertiary, outlined }

class CustomNeumorphicButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? verticalMargin;
  final bool disabled;
  final CustomNeumorphicBtnType? type;
  final ui.NeumorphicShape? shape;
  final double? fontSize;
  final double bosShapeRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? depth;
  final Widget? leading;
  final String? tooltip;

  const CustomNeumorphicButton({
    super.key,
    this.onPressed,
    required this.text,
    this.padding = const EdgeInsets.all(13),
    this.margin = const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
    required this.disabled,
    this.type = CustomNeumorphicBtnType.primary,
    this.verticalMargin,
    this.shape,
    this.fontSize,
    this.bosShapeRadius = 9,
    this.textStyle,
    this.backgroundColor,
    this.depth = 3,
    this.leading,
    this.foregroundColor,
    this.tooltip,
  });

  TextStyle get getBaseTextStyle => textStyle ?? FoodlyTextStyles.loginPrimaryCTA.copyWith(fontSize: fontSize ?? 16);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CustomNeumorphicBtnType.secondary:
        return ui.NeumorphicButton(
          onPressed: !disabled ? onPressed : null,
          margin: margin,
          tooltip: tooltip,
          style: ui.NeumorphicStyle(
            shape: shape ?? ui.NeumorphicShape.convex,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(bosShapeRadius)),
            depth: depth,
            intensity: 1.2,
            color: !disabled ? FoodlyThemes.primaryLighten73 : Colors.grey[200],
          ),
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: ClayText(
                    text,
                    color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
                    spread: 0.16,
                    style: getBaseTextStyle,
                  ),
                ),
              ),
            ],
          ),
        );

      case CustomNeumorphicBtnType.tertiary:
        return ui.NeumorphicButton(
          onPressed: !disabled ? onPressed : null,
          margin: margin,
          tooltip: tooltip,
          style: ui.NeumorphicStyle(
            shape: ui.NeumorphicShape.convex,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(bosShapeRadius)),
            depth: 3,
            intensity: 1.2,
            surfaceIntensity: .3,
            color: !disabled ? ui.NeumorphicColors.embossMaxWhiteColor : Colors.grey[200],
          ),
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leading != null) leading!.paddingRight(12),
                    ClayText(
                      text,
                      color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
                      spread: 0.16,
                      style: getBaseTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      case CustomNeumorphicBtnType.outlined:
        return ui.NeumorphicButton(
          onPressed: !disabled ? onPressed : null,
          margin: margin,
          tooltip: tooltip,
          style: ui.NeumorphicStyle(
            shape: shape ?? ui.NeumorphicShape.flat,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(bosShapeRadius)),
            depth: depth,
            border: ui.NeumorphicBorder(
              color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
              width: 1.5,
            ),
            color: backgroundColor ?? Colors.transparent,
          ),
          padding: padding,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leading != null) leading!.paddingRight(12),
                    ClayText(
                      text,
                      spread: 0.2,
                      color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
                      style: getBaseTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      default:
        return ui.NeumorphicButton(
          margin: margin,
          onPressed: !disabled ? onPressed : null,
          tooltip: tooltip,
          style: ui.NeumorphicStyle(
            shape: shape ?? ui.NeumorphicShape.convex,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(bosShapeRadius)),
            depth: depth,
            intensity: 1.2,
            color: !disabled ? FoodlyThemes.primaryFoodly : Colors.grey[400],
            surfaceIntensity: .8,
          ),
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: ClayText(
                    text,
                    color: foregroundColor ?? ui.NeumorphicColors.decorationMaxWhiteColor,
                    spread: 0.2,
                    style: getBaseTextStyle,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
