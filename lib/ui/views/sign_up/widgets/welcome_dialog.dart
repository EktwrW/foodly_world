import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class WelcomeDialog extends StatelessWidget {
  /// True cuando la bienvenida es de un alta por login social (Apple/Google),
  /// que entra como customer y NO pasó por el form. En ese caso agregamos una
  /// guía explicando que para dar de alta un negocio debe migrar a cuenta
  /// empresarial desde su perfil (no hay opción de negocio en el alta social).
  final bool isSocialSignUp;

  const WelcomeDialog({super.key, this.isSocialSignUp = false});

  TextSpan getBoldTextSpan(String text) => TextSpan(text: text, style: FoodlyTextStyles.primaryBodyBold);

  UserDM? get user => di<AuthSessionService>().userSessionDM?.user;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 350),
      child: Stack(
        children: [
          Container(
            height: 650,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
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
                  child: Text(S.current.okGo, style: FoodlyTextStyles.dialogCloseText),
                ),
              ],
            ),
          ),
          Container(
            height: 600,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ZoomOut(
                      from: 1.3,
                      child: const Asset(FoodlyAssets.wellDone, height: 80),
                    ),
                    ElasticIn(child: const Asset(FoodlyAssets.wellDone, height: 80)),
                  ],
                ),
                Text(
                  S.current.userSuccessfullyCreated,
                  textAlign: TextAlign.center,
                  style: FoodlyTextStyles.confirmationTextPrimary,
                ),
                Text.rich(
                  (user?.isManager ?? false)
                      ? TextSpan(
                          children: [
                            TextSpan(text: '${S.current.welcomeDialogTextSpan1} '),
                            const WidgetSpan(
                                child: Asset(FoodlyAssets.logo, height: 14), alignment: PlaceholderAlignment.middle),
                            TextSpan(text: ' ${S.current.welcomeDialogTextSpan2}'),
                            if (user != null) getBoldTextSpan(' ${user?.fullName} ') else const TextSpan(text: ', '),
                            TextSpan(text: '${S.current.welcomeDialogTextSpan3} '),
                            getBoldTextSpan(S.current.owner),
                            const TextSpan(text: '. '),
                            TextSpan(text: '${S.current.welcomeDialogTextSpanOwner}.'),
                          ],
                        )
                      : TextSpan(
                          children: [
                            TextSpan(text: '${S.current.welcomeDialogTextSpan1} '),
                            const WidgetSpan(
                                child: Asset(FoodlyAssets.logo, height: 14), alignment: PlaceholderAlignment.middle),
                            TextSpan(text: ' ${S.current.welcomeDialogTextSpan2}'),
                            if (user != null) getBoldTextSpan(' ${user?.fullName} ') else const TextSpan(text: ', '),
                            TextSpan(text: '${S.current.welcomeDialogTextSpan3} '),
                            getBoldTextSpan(S.current.customer),
                            const TextSpan(text: '. '),
                            TextSpan(text: S.current.welcomeDialogTextSpanClient1),
                            getBoldTextSpan(' ${S.current.welcomeDialogTextSpanClient2}'),
                            TextSpan(text: ', ${S.current.welcomeDialogTextSpanClient3}.'),
                          ],
                        ),
                  textAlign: TextAlign.center,
                  style: TextStyle(height: (user?.isManager ?? false) ? 1.8 : 1.5),
                ),
                // Guía solo para altas sociales: cómo crear un negocio (migrar a
                // cuenta empresarial desde el perfil), ya que el alta social no
                // ofrece la opción de negocio.
                if (isSocialSignUp)
                  Text(
                    S.current.welcomeDialogSocialBusiness,
                    textAlign: TextAlign.center,
                    style: const TextStyle(height: 1.4),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
