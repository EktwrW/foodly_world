import 'dart:io';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class EditableAvatarWdg extends StatefulWidget {
  final Size size;
  final double? buttonDiameter;
  final double? iconSize;
  final double paddingAll;
  final String? imagePath;
  final String? imageUrl;
  final void Function()? onPressed;
  final bool enabled;
  final void Function()? onPressedDisabled;
  final AvatarType? avatarType;

  const EditableAvatarWdg({
    super.key,
    required this.size,
    this.buttonDiameter,
    this.iconSize,
    required this.paddingAll,
    this.imagePath,
    this.onPressed,
    this.imageUrl,
    this.enabled = true,
    this.onPressedDisabled,
    this.avatarType,
  });

  @override
  State<EditableAvatarWdg> createState() => _EditableAvatarWdgState();
}

class _EditableAvatarWdgState extends State<EditableAvatarWdg> {
  double get height => widget.size.height;
  double get width => widget.size.width;
  bool get isBusiness => widget.avatarType == AvatarType.business;
  bool get isUser => widget.avatarType == AvatarType.user;

  Widget get userPlaceholder => Center(
        child: Stack(
          children: [
            ui.NeumorphicIcon(
              Bootstrap.person_circle,
              style: ui.NeumorphicStyle(
                shape: ui.NeumorphicShape.concave,
                color: !widget.enabled ? ui.NeumorphicColors.disabled : FoodlyThemes.accentColor,
                depth: widget.enabled ? 2 : 0,
              ),
              size: widget.size.longestSide,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ui.NeumorphicIcon(
                Bootstrap.camera,
                style: ui.NeumorphicStyle(
                  shape: ui.NeumorphicShape.concave,
                  color: !widget.enabled
                      ? ui.NeumorphicColors.embossMaxWhiteColor
                      : ui.NeumorphicColors.decorationMaxWhiteColor,
                  depth: widget.enabled ? 2 : 0,
                ),
                size: widget.size.longestSide / 3.5,
              ).paddingOnly(bottom: 4),
            ),
          ],
        ),
      );

  Widget get businessPlaceholder => DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
        child: SizedBox.square(
          dimension: height,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ui.NeumorphicIcon(
                  Icons.image_search_rounded,
                  style: ui.NeumorphicStyle(
                    shape: ui.NeumorphicShape.concave,
                    color: !widget.enabled ? ui.NeumorphicColors.disabled : FoodlyThemes.accentColor,
                    depth: widget.enabled ? 2 : 0,
                  ),
                  size: 50,
                ),
                Text(
                  S.current.loadLogo,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: FoodlyTextStyles.editableAvatarText,
                ).paddingSymmetric(horizontal: 10, vertical: 4),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: height + 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height + 14,
            width: width + 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height),
                color: widget.enabled ? FoodlyThemes.accentColor : ui.NeumorphicColors.disabled),
          ),
          ClayContainer(
            surfaceColor: ui.NeumorphicColors.embossMaxWhiteColor,
            depth: 2,
            spread: 0,
            borderRadius: 200,
            curveType: CurveType.concave,
            height: height + 10,
            width: width + 10,
          ),
          InkWell(
            onTap: ((widget.buttonDiameter ?? 1) != 0 && widget.enabled) ? widget.onPressed : widget.onPressedDisabled,
            customBorder: const CircleBorder(),
            child: SizedBox.fromSize(
              size: widget.size,
              child: Builder(
                builder: (_) {
                  if (widget.imageUrl?.isNotEmpty ?? false) {
                    return AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      child: AvatarWidget(
                        avatarUrl: widget.imageUrl,
                        enabled: widget.enabled,
                        width: width,
                        height: height,
                        avatarType: widget.avatarType,
                      ),
                    );
                  }

                  if (widget.imagePath?.isNotEmpty ?? false) {
                    final imageWidget = kIsWeb
                        ? Image.network(
                            widget.imagePath!,
                            fit: BoxFit.cover,
                            width: width,
                            height: height,
                          )
                        : Image.file(
                            File(widget.imagePath!),
                            fit: BoxFit.cover,
                            width: width,
                            height: height,
                          );

                    return ClipOval(child: imageWidget);
                  }

                  return isUser ? userPlaceholder : businessPlaceholder;
                },
              ),
            ).paddingAll(widget.paddingAll),
          ),
        ],
      ),
    );
  }
}
