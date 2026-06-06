import 'package:animate_do/animate_do.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/welcome_dialog.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:foodly_world/ui/views/starting/widgets/app_login_widgets.dart';
import 'package:foodly_world/ui/views/starting/widgets/social_consent_dialog.dart';
//import 'package:foodly_world/ui/views/starting/widgets/social_media_buttons.dart';
import 'package:go_router/go_router.dart';

enum StartingPageView {
  initial,
  login,
  register,
  completeRegister;

  bool get isLogin => this == StartingPageView.login;
}

class StartingPage369 extends StatelessWidget {
  final StartingPageView? currentView;

  const StartingPage369({super.key, this.currentView = StartingPageView.initial});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartingCubit, StartingState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) => di<DialogService>().showLoading(),
          welcome: (vm) {
            di<AuthSessionService>().updateForceToLogin(false);
            di<DialogService>().hideLoading();
          },
          userAuthenticated: (vm) {
            di<AuthSessionService>().updateForceToLogin(false);
            context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: vm.userSessionDM));
            final user = vm.userSessionDM.user;
            di<DialogService>().hideLoading();

            void goHome() => context.goNamed(
                  AppRoutes.foodlyMainPage.name,
                  pathParameters: {AppRoutes.routeIdParam: user.uuid ?? ''},
                );

            if (user.isManager && user.business.isEmpty) {
              context.goNamed(AppRoutes.signUpBusiness.name);
            } else if (vm.justSocialRegistered) {
              // Alta social recién concretada: mostramos el WelcomeDialog con la
              // guía de "migrar a cuenta empresarial" antes de entrar al home.
              di<DialogService>().showCustomDialog(
                const WelcomeDialog(isSocialSignUp: true),
                2,
                onDialogClose: goHome,
              );
            } else {
              goHome();
            }
          },
          isNewUser: (vm) async {
            di<DialogService>().hideLoading();
            // Usuario social NUEVO: ya no lo mandamos al form. Pedimos
            // consentimiento de T&C en un diálogo; si acepta, se concreta el
            // alta (registerSocialUser) y entra al home; si cancela, se aborta.
            final cubit = context.read<StartingCubit>();
            final accepted = await showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (_) => const SocialConsentDialog(),
            );
            if (accepted == true) {
              cubit.registerSocialUser();
            } else {
              cubit.cancelSocialSignUp();
            }
          },
          error: (msg, vm) {
            di<DialogService>().hideLoading();
            FoodlySnackbars.errorGeneric(context, msg);
          },
        );
      },
      builder: (context, state) {
        return DecoratedBox(
          decoration: UIDecorations.BACKGROUND_GRADIENT_1,
          child: state.maybeWhen(
            loading: (vm) => _buildContent(context, vm),
            welcome: (vm) => _buildContent(context, vm),
            error: (e, vm) => _buildContent(context, vm),
            orElse: () => const SizedBox.expand(),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, StartingVM vm) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: context.screenHeight * .12,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: vm.currentView.isLogin,
                  replacement: _topTextWidget(S.current.welcomeTo),
                  child: _topTextWidget(S.current.loginTo),
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: vm.currentView.isLogin ? context.screenHeight * .19 : context.screenHeight * .30,
              child: Center(
                child: AnimatedPadding(
                    padding: EdgeInsets.symmetric(horizontal: vm.currentView.isLogin ? 80 : 50),
                    duration: Durations.medium4,
                    child: const Asset(FoodlyAssets.logo)),
              ),
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
          ),
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: vm.currentView.isLogin ? context.screenHeight * .38 : context.screenHeight * .33,
              child: const AppLoginWidgets(),
            ),
          ),
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: vm.currentView.isLogin ? context.screenHeight * .19 : context.screenHeight * .13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (!vm.currentView.isLogin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: FoodlyThemes.primaryFoodly, borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: CustomNeumorphicButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              // Modo invitado (App Store 5.1.1.v): entra al home
                              // sin sesión. Ver StartingCubit.enterAsGuest().
                              context.read<StartingCubit>().enterAsGuest();
                            },
                            type: CustomNeumorphicBtnType.outlined,
                            disabled: false,
                            leading: const Asset(FoodlyAssets.isoFoodly, height: 14.3),
                            text: S.current.exploreAsGuest,
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.all(6),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: FoodlyThemes.primaryFoodly, borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox.shrink(),
                ],
              ),
            ).paddingAll(UIDimens.SCREEN_PADDING_MOB),
          ),
          SizedBox(
            height: context.screenHeight * .09,
            child: Column(
              spacing: 3,
              children: [
                Text(S.current.copyrightText(DateTime.now().year), style: FoodlyTextStyles.copyrightText),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 9,
                    children: [
                      InkWell(
                        onTap: () => di<AppRouter>().appRouter.goNamed(AppRoutes.termsConditions.name),
                        child: Text(S.current.termsConditionsShort, style: FoodlyTextStyles.captionPurpleBold),
                      ),
                      const Text('-', style: FoodlyTextStyles.captionPurpleBold),
                      InkWell(
                        onTap: () => di<AppRouter>().appRouter.goNamed(AppRoutes.privacyPolicy.name),
                        child: Text(S.current.termsPrivacyTextSpan4, style: FoodlyTextStyles.captionPurpleBold),
                      ),
                    ],
                  ).paddingBottom(16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topTextWidget(String text) {
    return FadeIn(
      child: Text(text, style: FoodlyTextStyles.secondaryTitle),
    );
  }
}
