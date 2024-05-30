import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart';

enum SnackBarType { success, info, warning, error, action }

class SnackBarWdg {
  final VoidCallback? onPressed;
  final Widget content;
  final SnackBarType type;
  final String? buttonText;
  final Duration? duration;

  const SnackBarWdg({
    required this.content,
    this.onPressed,
    this.type = SnackBarType.info,
    this.buttonText,
    this.duration,
  });

  Color get _getColor {
    if (type == SnackBarType.success) return FoodlyThemes.tertiaryFoodly;
    if (type == SnackBarType.error) return FoodlyThemes.error;
    if (type == SnackBarType.warning) return FoodlyThemes.warning;

    return FoodlyThemes.primaryFoodly;
  }

  IconData get _getIcon {
    if (type == SnackBarType.success) return FontAwesome.circle_check_solid;
    if (type == SnackBarType.error) return Clarity.error_line;
    if (type == SnackBarType.warning) return Clarity.warning_standard_solid;

    return Bootstrap.info_circle_fill;
  }

  String get _buttonText => buttonText ?? S.current.close;

  SnackBar getSnackBar(BuildContext context) {
    return SnackBar(
      padding: EdgeInsets.zero,
      shape: UIDecorations.SNACKBAR_TOP_ROUNDED_BORDER,
      backgroundColor: ui.NeumorphicColors.background,
      content: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: UIDecorations.SNACKBAR_TOP_ROUNDED_BORDER.borderRadius,
              color: _getColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: UIDecorations.SNACKBAR_TOP_ROUNDED_BORDER.borderRadius,
                color: ui.NeumorphicColors.background,
              ),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: 20),
              child: Column(
                children: [
                  Visibility(
                    visible: type != SnackBarType.action,
                    child: Icon(_getIcon, size: 34, color: _getColor),
                  ),
                  content.paddingSymmetric(vertical: 20),
                  SizedBox(
                    height: 58,
                    child: ui.NeumorphicButton(
                      onPressed: () {
                        if (onPressed != null) onPressed!();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      margin: const EdgeInsets.only(top: 10),
                      style: ui.NeumorphicStyle(
                        shape: ui.NeumorphicShape.convex,
                        boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 3,
                        lightSource: ui.LightSource.topRight,
                        intensity: 1.2,
                        surfaceIntensity: .3,
                        color: ui.NeumorphicColors.embossMaxWhiteColor,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClayText(
                            _buttonText,
                            color: FoodlyThemes.primaryFoodly,
                            spread: 0.5,
                            style: FoodlyTextStyles.snackBarPrimaryButton,
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 5),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ui.NeumorphicColors.background,
              ),
              margin: const EdgeInsets.only(top: 8),
            ),
          ),
        ],
      ),
      duration: duration ?? const Duration(days: 1),
    );
  }
}
