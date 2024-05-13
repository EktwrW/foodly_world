import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/user_type_title_wdg.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/user_type_toggle_switch_wdg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class SignUpUserSliverAppBar extends StatelessWidget {
  final VoidCallback onLeadingPressed;
  final VoidCallback onPressedDisabled;
  final Future<void> Function() onPressed;
  final VoidCallback onTap;
  final bool enabled;
  final String imagePath;

  const SignUpUserSliverAppBar({
    super.key,
    required this.onLeadingPressed,
    required this.onPressedDisabled,
    required this.onPressed,
    required this.onTap,
    required this.enabled,
    required this.imagePath,
  });

  static final user = di<AuthSessionService>().userSessionDM?.user;
  String? get imageUrl => user?.getAvatarForSignUp;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      toolbarHeight: 70,
      leadingWidth: 76,
      expandedHeight: 380,
      collapsedHeight: 140,
      pinned: true,
      floating: true,
      title: Text(
        S.current.signup,
        style: FoodlyTextStyles.secondaryTitle,
      ),
      leading: Row(
        children: [
          const SizedBox(width: 6),
          Flexible(
            child: RoundedButtonMobileFoodly(
              shape: ui.NeumorphicShape.concave,
              iconSize: 24,
              iconData: Bootstrap.caret_left_fill,
              onPressed: onLeadingPressed,
            ).paddingAll(12),
          ),
        ],
      ),
      actions: [
        SizedBox(
          height: 26,
          child: const Asset(FoodlyAssets.logo).paddingOnly(right: 16, top: 6),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        title: const SelectUserTypeToggleSwitchWdg(),
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: EditableAvatarWdg(
                    onPressedDisabled: onPressedDisabled,
                    onPressed: onPressed,
                    enabled: enabled,
                    size: UIDimens.AVATAR_BIG_SIZE_MOB,
                    paddingAll: 10,
                    imagePath: imagePath,
                    avatarType: AvatarType.user,
                    iconSize: 28,
                    buttonDiameter: 34,
                    imageUrl: imageUrl,
                  ),
                ),
              ],
            ).paddingOnly(top: 16, bottom: 12),
            SelectUserTitleWdg(onTap: onTap),
          ],
        ).paddingOnly(bottom: 12, top: 28),
      ),
    );
  }
}
