import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/local_auth/local_auth_cubit.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart';

class FingerprintButtonLogin extends StatelessWidget {
  const FingerprintButtonLogin({
    super.key,
  });

  void showBiometricSnackBar(BuildContext context) {
    final snackBar = SnackBarWdg(
      type: SnackBarType.warning,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            TextSpan(
              text: context.read<LocalAuthCubit>().biometricAuthEnabled
                  ? S.current.biometricSnackbarTextSpanB
                  : S.current.biometricSnackbarTextSpanA,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalAuthCubit, LocalAuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (localAuthDTO) {
            context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: localAuthDTO.userSessionDM));
            final user = localAuthDTO.userSessionDM.user;
            di<DialogService>().hideLoading();

            if (user.isManager && user.business.isEmpty) {
              context.goNamed(AppRoutes.signUpBusiness.name);
            } else {
              context.goNamed(
                AppRoutes.foodlyMainPage.name,
                pathParameters: {AppRoutes.routeIdParam: user.userId ?? ''},
              );
            }
          },
          error: (msg, localAuthDTO) => di<DialogService>().hideLoading(),
        );
      },
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(color: FoodlyThemes.primaryFoodly, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            RoundedButtonMobileFoodly(
              diameter: 62,
              iconSize: 50,
              onPressed: () {
                switch (context.read<LocalAuthCubit>().biometricAuthEnabled) {
                  case true:
                    if (di<AuthSessionService>().isLoggedIn) {
                      context.read<LocalAuthCubit>().authenticate();
                    } else {
                      showBiometricSnackBar(context);
                    }
                    break;

                  case false:
                    showBiometricSnackBar(context);
                    break;
                }
              },
              iconData: Bootstrap.fingerprint,
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(color: FoodlyThemes.primaryFoodly, borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        );
      },
    );
  }
}
