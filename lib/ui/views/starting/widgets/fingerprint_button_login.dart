import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

class FingerprintButtonLogin extends StatelessWidget {
  const FingerprintButtonLogin({
    super.key,
  });

  void _showBiometricSnackBar(BuildContext context) {
    final snackBar = SnackBarWdg(
      type: SnackBarType.warning,
      duration: const Duration(seconds: 6),
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

  /// Snackbar de feedback para un estado `_Error` del [LocalAuthCubit].
  /// El [message] ya viene localizado y presentable desde el cubit (sesión
  /// expirada, biometría cancelada, etc.) — nunca una excepción cruda.
  void _showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBarWdg(
      type: SnackBarType.warning,
      duration: const Duration(seconds: 6),
      content: Text(
        message,
        style: FoodlyTextStyles.snackBarLightBody,
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
          authenticated: (localAuthDTO) async {
            context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: localAuthDTO.userSessionDM));
            final user = localAuthDTO.userSessionDM.user;

            if (user.isManager && user.business.isEmpty) {
              context.goNamed(AppRoutes.signUpBusiness.name);
              WidgetsBinding.instance.addPostFrameCallback((_) => di<DialogService>().hideLoading());
              return;
            }

            // Restore the last route the user was on before session close.
            // Falls back to home if no valid saved route exists.
            final savedRoute = await di<LocalStorageService>().getString(FoodlyStrings.LAST_PATH);
            if (!context.mounted) {
              di<DialogService>().hideLoading();
              return;
            }

            if (savedRoute != null &&
                savedRoute.isNotEmpty &&
                savedRoute != '/' &&
                savedRoute != AppRoutes.login.path) {
              context.go(savedRoute);
            } else {
              context.goNamed(
                AppRoutes.foodlyMainPage.name,
                pathParameters: {AppRoutes.routeIdParam: user.uuid ?? ''},
              );
            }
            // Defer hideLoading so the overlay stays visible until GoRouter
            // has rebuilt with the destination page (prevents login flash).
            WidgetsBinding.instance.addPostFrameCallback((_) => di<DialogService>().hideLoading());
          },
          error: (msg, localAuthDTO) {
            // Sin esto el usuario tocaba la huella, el login fallaba y se
            // quedaba en la starting page sin ningún feedback. Mostramos el
            // mensaje (ya localizado) que emitió el cubit.
            di<DialogService>().hideLoading();
            _showErrorSnackBar(context, msg);
          },
        );
      },
      builder: (context, state) {
        return CustomRoundedNeumorphicButton(
          diameter: 56,
          iconSize: 43,
          onPressed: () {
            switch (context.read<LocalAuthCubit>().biometricAuthEnabled) {
              case true:
                if (di<AuthSessionService>().isLoggedIn) {
                  context.read<LocalAuthCubit>().authenticate();
                } else {
                  _showBiometricSnackBar(context);
                }
                break;

              case false:
                _showBiometricSnackBar(context);
                break;
            }
          },
          depth: 1,
          padding: const EdgeInsets.fromLTRB(10, 9, 6, 7),
          iconData: Bootstrap.fingerprint,
          tooltip: S.current.resumeSessionWithSecurity,
        );
      },
    );
  }
}
