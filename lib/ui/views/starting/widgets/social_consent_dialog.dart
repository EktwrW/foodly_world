import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicColors, NeumorphicShape;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart' show AppRoutes;
import 'package:foodly_world/core/services/dependency_injection_service.dart' show AppRouter, di;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Diálogo de consentimiento de Términos y Política de Privacidad para el alta
/// social (Apple/Google), que ya no pasa por el form donde se aceptaban. Es
/// autocontenido: se abre con `showDialog<bool>` y devuelve `true` si el
/// usuario acepta o `false`/`null` si cancela. No depende del cubit, así el
/// flujo de auth queda desacoplado.
class SocialConsentDialog extends StatefulWidget {
  const SocialConsentDialog({super.key});

  @override
  State<SocialConsentDialog> createState() => _SocialConsentDialogState();
}

class _SocialConsentDialogState extends State<SocialConsentDialog> {
  bool _accepted = false;

  TextSpan _link(String text, String routeName) => TextSpan(
        text: text,
        style: FoodlyTextStyles.primaryBodyBold.copyWith(color: FoodlyThemes.primaryFoodly),
        recognizer: TapGestureRecognizer()..onTap = () => di<AppRouter>().appRouter.goNamed(routeName),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ui.NeumorphicColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.socialConsentTitle,
              textAlign: TextAlign.center,
              style: FoodlyTextStyles.confirmationTextPrimary,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => setState(() => _accepted = !_accepted),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _accepted,
                    onChanged: (value) => setState(() => _accepted = value ?? false),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '${S.current.termsPrivacyTextSpan1} '),
                          _link(S.current.termsPrivacyTextSpan2, AppRoutes.termsConditions.name),
                          TextSpan(text: ', ${S.current.termsPrivacyTextSpan3} '),
                          _link(S.current.termsPrivacyTextSpan4, AppRoutes.privacyPolicy.name),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ).paddingOnly(top: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomNeumorphicButton(
              onPressed: () => Navigator.of(context).pop(true),
              text: S.current.acceptAndContinue,
              shape: ui.NeumorphicShape.convex,
              disabled: !_accepted,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => Navigator.of(context).pop(false),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(S.current.cancel, style: FoodlyTextStyles.loginCTATextButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
