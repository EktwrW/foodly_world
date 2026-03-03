import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/views/foodly_location_wrapper.dart';

/// Wrapper class to handle local auth (biometric), location management,
/// app lifecycle (notification polling), and incoming global handlers.
class FoodlyWrapper extends StatefulWidget {
  final Widget child;

  const FoodlyWrapper({super.key, required this.child});

  @override
  State<FoodlyWrapper> createState() => _FoodlyWrapperState();
}

class _FoodlyWrapperState extends State<FoodlyWrapper> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notificationsCubit = di<NotificationsCubit>();

    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        notificationsCubit.pausePolling();
      case AppLifecycleState.resumed:
        // Don't resume polling during biometric login — the backend is rotating
        // the token and any poll with the old token would get 401.
        if (!di<AuthSessionService>().isBiometricLoginInProgress) {
          notificationsCubit.resumePolling();
        }
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final router = di<AppRouter>();

        // Shell routes are blocked by their own PopScope(canPop: false).
        // For other routes (categories, visit-business, etc.), navigate back.
        if (!router.isOnShellRoute) {
          router.goBackToLastRoute();
        }
      },
      child: Scaffold(
        body: BlocConsumer<LocalAuthCubit, LocalAuthState>(
          listener: (context, state) {
            final authSessionService = di<AuthSessionService>();
            final dialogService = di<DialogService>();

            state.whenOrNull(
              needAuthentication: (localAuthDTO) async {
                // Set the flag BEFORE the biometric dialog opens so that the
                // lifecycle observer (resumed) won't resume notification polling
                // while the backend is about to rotate the token.
                authSessionService.setBiometricLoginInProgress(true);
                dialogService.showLoading();
                await context.read<LocalAuthCubit>().authenticate();
                // Hide loading AFTER the next frame so the router has time
                // to rebuild with the destination page (home). Without this,
                // the login page flashes briefly between overlay removal and
                // the GoRouter navigation triggered by FingerprintButtonLogin.
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  dialogService.hideLoading();
                });
              },
              loaded: (localAuthDTO) async {
                dialogService.hideLoading();
                if (!localAuthDTO.authenticated) {
                  await authSessionService.updateForceToLogin(true);
                  if (context.mounted) authSessionService.exit(context);
                  FlutterNativeSplash.remove();
                }
              },
              authenticated: (localAuthDTO) async {
                // Don't hideLoading() here — the needAuthentication handler
                // defers it to the next frame so the loading overlay stays
                // visible until GoRouter has rebuilt with the destination page.
                await authSessionService.updateForceToLogin(false);
                if (context.mounted) {
                  context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: localAuthDTO.userSessionDM));
                }
                di<Logger>().t('User authenticated: ${localAuthDTO.userSessionDM.user.uuid}', time: DateTime.now());
              },
              error: (msg, localAuthDTO) async {
                dialogService.hideLoading();
                await authSessionService.updateForceToLogin(true);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  try {
                    if (context.mounted) authSessionService.exit(context);
                  } catch (e) {
                    di<Logger>().e('Error handling auth state in Foodly Wrapper: $e');
                  }
                });
              },
            );
          },
          builder: (context, state) => FoodlyLocationWrapper(childWidget: widget.child),
        ),
      ),
    );
  }
}
