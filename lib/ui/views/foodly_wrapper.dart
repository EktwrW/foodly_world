import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/views/foodly_location_wrapper.dart';

/// Wrapper class to handler local auth (biometric) & location management + incoming (next) global handlers
class FoodlyWrapper extends StatelessWidget {
  final Widget child;

  const FoodlyWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => false,
      child: Scaffold(
        body: BlocConsumer<LocalAuthCubit, LocalAuthState>(
          listener: (context, state) {
            final authSessionService = di<AuthSessionService>();
            final dialogService = di<DialogService>();

            state.whenOrNull(
              loading: (_) => dialogService.showLoading(),
              needAuthentication: (localAuthDTO) async {
                dialogService.showLoading();
                await context.read<LocalAuthCubit>().authenticate().then((value) => dialogService.hideLoading());
              },
              loaded: (localAuthDTO) async {
                if (!localAuthDTO.authenticated) {
                  await authSessionService.updateForceToLogin(true);
                  if (context.mounted) {
                    authSessionService.exit(context);
                  }
                  dialogService.hideLoading();
                }
              },
              authenticated: (localAuthDTO) async {
                await authSessionService.updateForceToLogin(false);
                if (context.mounted) {
                  context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: localAuthDTO.userSessionDM));
                }
                di<Logger>().t('User authenticated: ${localAuthDTO.userSessionDM.user.uuid}', time: DateTime.now());
              },
              error: (msg, localAuthDTO) async {
                await authSessionService.updateForceToLogin(true);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  try {
                    if (context.mounted) {
                      authSessionService.exit(context);
                    }
                  } catch (e) {
                    di<Logger>().e('Error handling auth state in Foodly Wrapper: $e');
                  }
                });
              },
            );
          },
          builder: (context, state) => FoodlyLocationWrapper(childWidget: child),
        ),
      ),
    );
  }
}
