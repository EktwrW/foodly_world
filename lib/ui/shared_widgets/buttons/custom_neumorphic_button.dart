import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;

enum CustomNeumorphicBtnType { primary, secondary, outlined }

class CustomNeumorphicButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? verticalMargin;
  final bool disabled;
  final CustomNeumorphicBtnType? type;
  final ui.NeumorphicShape? shape;
  final double? fontSize;
  final double? bosShapeRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? depth;
  final Widget? leading;

  const CustomNeumorphicButton({
    super.key,
    this.onPressed,
    required this.text,
    this.padding,
    this.margin,
    required this.disabled,
    this.type = CustomNeumorphicBtnType.primary,
    this.verticalMargin,
    this.shape,
    this.fontSize,
    this.bosShapeRadius,
    this.textStyle,
    this.backgroundColor,
    this.depth,
    this.leading,
    this.foregroundColor,
  });

  ui.NeumorphicShape get getShape => shape ?? ui.NeumorphicShape.convex;
  TextStyle get getBaseTextStyle => textStyle ?? FoodlyTextStyles.loginPrimaryCTA.copyWith(fontSize: fontSize ?? 18);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CustomNeumorphicBtnType.secondary:
        return ui.NeumorphicButton(
          onPressed: !disabled ? onPressed : null,
          margin:
              margin ?? EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: verticalMargin ?? 18),
          style: ui.NeumorphicStyle(
            shape: getShape,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(bosShapeRadius ?? 12)),
            depth: depth ?? 3,
            intensity: 1.2,
            surfaceIntensity: .3,
            color: !disabled ? ui.NeumorphicColors.embossMaxWhiteColor : Colors.grey[200],
          ),
          padding: padding ?? const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayText(
                text,
                color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
                spread: 0.5,
                style: getBaseTextStyle,
              ),
            ],
          ),
        );

      case CustomNeumorphicBtnType.outlined:
        return ui.NeumorphicButton(
          onPressed: !disabled ? onPressed : null,
          margin: margin ?? EdgeInsets.zero,
          style: ui.NeumorphicStyle(
            shape: shape ?? ui.NeumorphicShape.flat,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(bosShapeRadius ?? 12)),
            depth: depth ?? 0,
            border: ui.NeumorphicBorder(
              color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
              width: 1.5,
            ),
            color: backgroundColor ?? Colors.transparent,
          ),
          padding: padding ?? const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) leading!.paddingRight(12),
              Text(
                text,
                style: getBaseTextStyle.copyWith(
                  color: !disabled ? (foregroundColor ?? FoodlyThemes.primaryFoodly) : Colors.grey,
                ),
              ),
            ],
          ),
        );

      case CustomNeumorphicBtnType.primary:
      default:
        return ui.NeumorphicButton(
          margin: margin ?? const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
          onPressed: !disabled ? onPressed : null,
          style: ui.NeumorphicStyle(
            shape: getShape,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: depth ?? 3,
            intensity: 1.2,
            color: FoodlyThemes.primaryFoodly,
            surfaceIntensity: .8,
          ),
          padding: padding ?? const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayText(
                text,
                color: foregroundColor ?? ui.NeumorphicColors.decorationMaxWhiteColor,
                spread: 0.5,
                style: getBaseTextStyle,
              ),
            ],
          ),
        );
    }
  }
}
