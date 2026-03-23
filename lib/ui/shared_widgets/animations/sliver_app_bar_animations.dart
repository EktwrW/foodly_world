import 'package:flutter/foundation.dart' show DiagnosticPropertiesBuilder, DiagnosticsProperty, StringProperty;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/main.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_opacity.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class SliverAppBarActionWidgets extends StatelessWidget {
  final String? imageUrl;
  final bool isExpanded;
  final Widget placeholder;

  const SliverAppBarActionWidgets({
    super.key,
    this.imageUrl,
    required this.isExpanded,
    required this.placeholder,
  });

  static const buttonDiameter = 48.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: (imageUrl?.isNotEmpty ?? false)
              ? Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomRoundedNeumorphicButton(
                      onPressed: () => FoodlyMainScaffold.toggleDrawer(),
                      diameter: buttonDiameter,
                      depth: 3,
                      padding: EdgeInsets.zero,
                      shape: ui.NeumorphicShape.concave,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          FoodlyAnimatedOpacity(
                            visible: !isExpanded,
                            child: AvatarWidget(avatarUrl: imageUrl, height: buttonDiameter, width: buttonDiameter),
                          ),
                          FoodlyAnimatedOpacity(
                            visible: isExpanded,
                            child: Center(child: placeholder),
                          ),
                        ],
                      ),
                    ).paddingAll(4),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                          child: const Icon(Bootstrap.menu_button_wide_fill, size: 12).paddingAll(3)),
                    )
                  ],
                )
              : placeholder,
        ),
      ],
    ).paddingRight(14);
  }
}

enum SliverTitleTextStyle { decorated, simple }

class SliverAppBarAnimatedTitleText extends StatelessWidget {
  const SliverAppBarAnimatedTitleText({
    required this.visible,
    required this.text,
    this.style = SliverTitleTextStyle.simple,
    super.key,
    this.onTitlePressed,
  });

  final bool visible;
  final String text;
  final SliverTitleTextStyle style;
  final void Function()? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return FoodlyAnimatedOpacity(
      visible: visible,
      key: ValueKey(text),
      child: switch (style) {
        SliverTitleTextStyle.decorated => ui.NeumorphicButton(
            onPressed: onTitlePressed,
            style: ui.NeumorphicStyle(
              shape: ui.NeumorphicShape.concave,
              boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              depth: 2,
              intensity: 1.2,
              surfaceIntensity: .3,
              color: FoodlyThemes.primaryFoodly,
            ),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FoodlyTextStyles.subTitleWhite,
            ),
          ),
        SliverTitleTextStyle.simple => Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: FoodlyTextStyles.secondaryTitle,
          ),
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isExpanded', visible));
    properties.add(StringProperty('text', text));
  }
}
