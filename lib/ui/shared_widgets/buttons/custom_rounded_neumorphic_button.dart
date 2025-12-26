import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class CustomRoundedNeumorphicButton extends StatelessWidget {
  final void Function()? onPressed;
  final ui.NeumorphicStyle? style;
  final ui.NeumorphicShape shape;
  final ui.NeumorphicShape iconShape;
  final double? diameter;
  final double? iconSize;
  final IconData iconData;
  final Color? buttonColor;
  final Color? iconColor;
  final bool? disableDepth;
  final double? depth;
  final EdgeInsets? padding;
  final String tooltip;
  final Widget? child;

  const CustomRoundedNeumorphicButton({
    super.key,
    this.onPressed,
    this.style,
    this.shape = ui.NeumorphicShape.convex,
    this.iconShape = ui.NeumorphicShape.convex,
    this.diameter,
    this.iconSize,
    this.iconData = Bootstrap.menu_button_wide_fill,
    this.buttonColor,
    this.iconColor,
    this.disableDepth = false,
    this.depth = 2,
    this.padding,
    this.tooltip = '',
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ui.NeumorphicButton(
      onPressed: onPressed,
      tooltip: tooltip,
      style: style ??
          ui.NeumorphicStyle(
            shape: shape,
            boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
            color: buttonColor ?? const Color.fromARGB(255, 250, 250, 250),
            disableDepth: disableDepth,
            depth: depth,
          ),
      padding: padding ?? const EdgeInsets.all(8),
      child: SizedBox.square(
        dimension: diameter ?? 40,
        child: Center(
          child: child ??
              ui.NeumorphicIcon(
                style: ui.NeumorphicStyle(
                  shape: iconShape,
                  color: iconColor ?? FoodlyThemes.primaryFoodly,
                ),
                iconData,
                size: iconSize ?? 36,
              ),
        ),
      ),
    );
  }
}
