import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:foodly_world/ui/views/starting/widgets/app_login_widgets.dart';
import 'package:foodly_world/ui/views/starting/widgets/fingerprint_button_login.dart';
import 'package:foodly_world/ui/views/starting/widgets/social_media_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

enum StartingPageView { initial, login, register, completeRegister }

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

            if (user.isManager && user.business.isEmpty) {
              context.goNamed(AppRoutes.signUpBusiness.name);
            } else {
              context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: user.uuid ?? ''});
            }
          },
          isNewUser: (vm) {
            di<DialogService>().hideLoading();
            context.goNamed(AppRoutes.signUp.name, extra: vm.importedAvatar);
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
            loading: (vm) => buildContent(context, vm),
            welcome: (vm) => buildContent(context, vm),
            error: (e, vm) => buildContent(context, vm),
            orElse: () => const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  Widget buildContent(BuildContext context, StartingVM vm) {
    final isLogin = vm.currentView == StartingPageView.login;

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
                  visible: isLogin,
                  replacement: topTextWidget(S.current.welcomeTo),
                  child: topTextWidget(S.current.loginTo),
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: isLogin ? context.screenHeight * .19 : context.screenHeight * .31,
              child: Center(
                child: AnimatedPadding(
                    padding: EdgeInsets.symmetric(horizontal: isLogin ? 80 : 50),
                    duration: Durations.medium4,
                    child: const Asset(FoodlyAssets.logo)),
              ),
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
          ),
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: isLogin ? context.screenHeight * .36 : context.screenHeight * .22,
              child: const AppLoginWidgets(),
            ),
          ),
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: isLogin ? context.screenHeight * .30 : context.screenHeight * .32,
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
                Text(S.current.copyrightText, style: FoodlyTextStyles.copyrightText),
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
