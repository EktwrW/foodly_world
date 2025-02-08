import 'package:animate_do/animate_do.dart';
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
  final double topBtnPadding;
  final Widget Function(VoidCallback handleDismiss)? buttonBuilder;
  final VoidCallback? onDismiss;

  const SnackBarWdg({
    required this.content,
    this.onPressed,
    this.type = SnackBarType.info,
    this.buttonText,
    this.duration,
    this.topBtnPadding = 10,
    this.buttonBuilder,
    this.onDismiss,
  });

  Color get _getColor => switch (type) {
        SnackBarType.success => FoodlyThemes.tertiaryFoodly,
        SnackBarType.error => FoodlyThemes.error,
        SnackBarType.warning => FoodlyThemes.warning,
        _ => FoodlyThemes.primaryFoodly,
      };

  IconData get _getIcon => switch (type) {
        SnackBarType.success => FontAwesome.circle_check_solid,
        SnackBarType.error => Clarity.error_line,
        SnackBarType.warning => Clarity.warning_standard_solid,
        _ => Bootstrap.info_circle_fill,
      };

  String get _buttonText => buttonText ?? S.current.close;

  SnackBar getSnackBar(BuildContext context) {
    late AnimationController fadeOutController;

    void handleDismiss() async {
      await fadeOutController.forward();
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        onDismiss?.call();
      }
    }

    return SnackBar(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      shape: UIDecorations.SNACKBAR_ROUNDED_BORDER,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: FadeInUp(
        duration: Durations.long4,
        curve: Curves.easeOutCubic,
        child: FadeOutDown(
          controller: (controller) => fadeOutController = controller,
          manualTrigger: true,
          duration: Durations.long1,
          curve: Curves.easeOutCubic,
          child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: UIDecorations.SNACKBAR_ROUNDED_BORDER.borderRadius,
                  color: _getColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: .5,
                      blurRadius: 6,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: UIDecorations.SNACKBAR_ROUNDED_BORDER.borderRadius,
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
                      (buttonBuilder?.call(handleDismiss) ??
                              SizedBox(
                                height: 46,
                                child: ui.NeumorphicButton(
                                  onPressed: () {
                                    if (onPressed != null) onPressed!();
                                    handleDismiss();
                                  },
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
                                        spread: 0,
                                        style: FoodlyTextStyles.snackBarPrimaryButton,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .paddingOnly(bottom: 5, top: topBtnPadding),
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
        ),
      ),
      duration: duration ?? const Duration(days: 1),
    );
  }
}
