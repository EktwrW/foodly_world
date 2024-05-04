import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:foodly_world/ui/views/starting/widgets/app_login_widgets.dart';
import 'package:foodly_world/ui/views/starting/widgets/fingerprint_button_login.dart';
import 'package:foodly_world/ui/views/starting/widgets/social_media_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

enum StartingPageView { initial, login, register, completeRegister }

class StartingPage369 extends StatelessWidget {
  final StartingPageView? currentView;

  const StartingPage369(
      {super.key, this.currentView = StartingPageView.initial});

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: BlocConsumer<StartingCubit, StartingState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (vm) => di<DialogService>().showLoading(),
            welcome: (vm) {
              di<AuthSessionService>().updateForceToLogin(false);
              di<DialogService>().hideLoading();
            },
            userAuthenticated: (vm) {
              di<AuthSessionService>().updateForceToLogin(false);
              context.read<RootBloc>().add(
                  RootEvent.cacheAuthSession(userSessionDM: vm.userSessionDM));
              final user = vm.userSessionDM.user;
              di<DialogService>().hideLoading();

              if (user.isManager && user.business.isEmpty) {
                context.goNamed(AppRoutes.signUpBusiness.name);
              } else {
                context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {
                  AppRoutes.routeIdParam: user.userId ?? ''
                });
              }
            },
            isNewUser: (vm) {
              di<DialogService>().hideLoading();
              context.goNamed(AppRoutes.signUp.name);
            },
            error: (msg, vm) {
              di<DialogService>().hideLoading();
              // TODO: hw - place here a snackbar with error msg
            },
          );
        },
        builder: (context, state) {
          return DecoratedBox(
            decoration: UIDecorations.BACKGROUND_GRADIENT_1,
            child: state.maybeWhen(
              loading: (vm) => buildContent(context, vm),
              welcome: (vm) => buildContent(context, vm),
              error: (e, vm) => buildContent(context, vm),
              orElse: () => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }

  Widget buildContent(BuildContext context, StartingVM vm) {
    final isLogin = vm.currentView == StartingPageView.login;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              height: context.screenHeight * .12,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: isLogin,
                  replacement: topTextWidget(S.current.welcomeTo),
                  child: topTextWidget(S.current.loginTo),
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              height: isLogin
                  ? context.screenHeight * .19
                  : context.screenHeight * .31,
              child: Center(
                child: AnimatedPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isLogin ? 80 : 50),
                    duration: const Duration(milliseconds: 400),
                    child: const Asset(FoodlyAssets.logo)),
              ),
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              height: isLogin
                  ? context.screenHeight * .36
                  : context.screenHeight * .22,
              child: const AppLoginWidgets(),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              height: isLogin
                  ? context.screenHeight * .30
                  : context.screenHeight * .32,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaButtonsRow(),
                  FingerprintButtonLogin(),
                ],
              ),
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
          ),
          SizedBox(
            height: context.screenHeight * .03,
            child: Column(
              children: [
                Text(S.current.copyrightText,
                    style: FoodlyTextStyles.copyrightText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topTextWidget(String text) {
    return FadeIn(
      child: Text(text, style: FoodlyTextStyles.secondaryTitle),
    );
  }
}
