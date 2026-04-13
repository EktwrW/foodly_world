import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart' show AppRoutes;
import 'package:foodly_world/core/services/dependency_injection_service.dart' show AppRouter, di;
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';

class TermsAndPrivacyPolicyWdg extends StatelessWidget {
  const TermsAndPrivacyPolicyWdg({
    super.key,
    required this.enabled,
    required this.vm,
  });

  final bool enabled;
  final UserProfileVM vm;

  @override
  Widget build(BuildContext context) {
    final appRouter = di<AppRouter>();

    return AnimatedOpacity(
      duration: Durations.medium2,
      opacity: enabled ? 1.0 : .3,
      child: Row(
        children: [
          Checkbox(
            value: vm.termsAndContiditionsAccepted,
            onChanged: enabled ? (value) => context.read<SignUpCubit>().setTermsAndContiditions(value!) : null,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '${S.current.termsPrivacyTextSpan1} '),
                  TextSpan(
                    text: S.current.termsPrivacyTextSpan2,
                    style: FoodlyTextStyles.primaryBodyBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => appRouter.appRouter.goNamed(AppRoutes.termsConditions.name),
                  ),
                  TextSpan(text: ', ${S.current.termsPrivacyTextSpan3} '),
                  TextSpan(
                    text: S.current.termsPrivacyTextSpan4,
                    style: FoodlyTextStyles.primaryBodyBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => appRouter.appRouter.goNamed(AppRoutes.privacyPolicy.name),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          )
        ],
      ).paddingOnly(top: 30),
    );
  }
}

class TermsAndPrivacyPolicyBusinessWdg extends StatelessWidget {
  const TermsAndPrivacyPolicyBusinessWdg({
    super.key,
    required this.enabled,
    required this.vm,
  });

  final bool enabled;
  final UserProfileVM vm;

  @override
  Widget build(BuildContext context) {
    final appRouter = di<AppRouter>();

    return AnimatedOpacity(
      duration: Durations.medium2,
      opacity: enabled ? 1.0 : .3,
      child: Row(
        children: [
          Checkbox(
            value: vm.businessTermsAndContiditionsAccepted,
            onChanged: enabled ? (value) => context.read<SignUpCubit>().setBusinessTermsAndContiditions(value!) : null,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '${S.current.termsPrivacyTextSpan1forBusiness} '),
                  TextSpan(
                    text: S.current.termsPrivacyTextSpan2,
                    style: FoodlyTextStyles.primaryBodyBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => appRouter.appRouter.goNamed(AppRoutes.termsConditions.name),
                  ),
                  TextSpan(text: ', ${S.current.termsPrivacyTextSpan3} '),
                  TextSpan(
                    text: S.current.termsPrivacyTextSpan4,
                    style: FoodlyTextStyles.primaryBodyBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => appRouter.appRouter.goNamed(AppRoutes.privacyPolicy.name),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          )
        ],
      ).paddingOnly(top: 30),
    );
  }
}
