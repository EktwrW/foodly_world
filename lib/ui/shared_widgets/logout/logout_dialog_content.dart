import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/starting/widgets/login_buttons.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  TextSpan getBoldTextSpan(String text) =>
      TextSpan(text: text, style: FoodlyTextStyles.primaryBodyBold);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 350),
      child: Stack(
        children: [
          Container(
            height: 650,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
                horizontal: UIDimens.SCREEN_PADDING_MOB),
            padding: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: FoodlyThemes.primaryFoodly,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    S.current.cancel,
                    style: FoodlyTextStyles.dialogCloseText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 600,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ui.NeumorphicColors.background,
            ),
            margin: const EdgeInsets.only(
              bottom: 50,
              right: UIDimens.SCREEN_PADDING_MOB,
              left: UIDimens.SCREEN_PADDING_MOB,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElasticIn(child: const Asset(FoodlyAssets.exit, height: 90)),
                Text(
                  S.current.logoutDialogTitle,
                  textAlign: TextAlign.center,
                  style: FoodlyTextStyles.confirmationTextPrimary,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: S.current.logoutDialogTextSpan1),
                      TextSpan(text: S.current.logoutDialogTextSpan2),
                      getBoldTextSpan(S.current.logoutDialogTextSpan3),
                      TextSpan(text: S.current.logoutDialogTextSpan4),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 48,
                      child: FoodlyLoginButton(
                          text: S.current.saveAndClose,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          disabled: false,
                          fontSize: 14.5,
                          onPressed: () =>
                              di<AuthSessionService>().exit(context)),
                    ),
                    SizedBox(
                      height: 78,
                      child: FoodlyLoginButton(
                          text: S.current.endSession,
                          shape: ui.NeumorphicShape.concave,
                          verticalMargin: 15,
                          fontSize: 14.5,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          disabled: false,
                          onPressed: () =>
                              di<AuthSessionService>().endSession(context),
                          type: LoginButtonType.secondary),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
