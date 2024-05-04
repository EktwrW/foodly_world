import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/view_model/sign_up_vm.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_user_form.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_user_sliver_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/terms_privacy_wdg.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/welcome_dialog.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/starting/widgets/login_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class SignUpUserPage extends StatelessWidget {
  const SignUpUserPage({super.key});

  static bool _isSnackBarVisible = false;
  static final _controller = ScrollController();

  TextSpan getBoldTextSpan(String text) =>
      TextSpan(text: text, style: FoodlyTextStyles.actionsBodyBold);

  void showEnableFormSnackBar(BuildContext context) {
    if (_isSnackBarVisible) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = false;
      return;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = true;
    }

    final snackBar = SnackBarWdg(
      onPressed: () => _isSnackBarVisible = false,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            TextSpan(text: '${S.current.userTypeSnackbarTextSpan1} '),
            getBoldTextSpan(S.current.userTypeSnackbarTextSpan2),
            TextSpan(text: ' ${S.current.userTypeSnackbarTextSpan3}.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar.getSnackBar(context))
        .closed
        .then((reason) => _isSnackBarVisible = false);
  }

  void showUserRoleSnackBar(BuildContext context) {
    if (_isSnackBarVisible) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = false;
      return;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = true;
    }

    final snackBar = SnackBarWdg(
      onPressed: () => _isSnackBarVisible = false,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            getBoldTextSpan(S.current.owner),
            TextSpan(
                text: ' ${S.current.usersHaveTheAbilityToCreateAndManage} '),
            getBoldTextSpan(S.current.businesses),
            const TextSpan(text: ', '),
            getBoldTextSpan(S.current.brands),
            const TextSpan(text: ', '),
            getBoldTextSpan(S.current.startups),
            TextSpan(text: ', ${S.current.andCreateContentToThese}.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar.getSnackBar(context))
        .closed
        .then((reason) => _isSnackBarVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (signUpVM) => di<DialogService>().showLoading(),
            loaded: (signUpVM) => di<DialogService>().hideLoading(),
            userCreated: (vm) {
              di<AuthSessionService>().updateForceToLogin(false);
              context.read<RootBloc>().add(
                  RootEvent.cacheAuthSession(userSessionDM: vm.userSessionDM));
              di<DialogService>().hideLoading();
              final user = vm.userSessionDM.user;
              di<DialogService>().showCustomDialog(
                const WelcomeDialog(),
                2,
                onDialogClose: () => user.isManager
                    ? context.goNamed(AppRoutes.signUpBusiness.name)
                    : context.goNamed(AppRoutes.foodlyMainPage.name,
                        pathParameters: {
                            AppRoutes.routeIdParam: user.userId ?? ''
                          }),
              );
            },
            error: (e, vm) {
              di<DialogService>().hideLoading();
              //TODO: hw - handle error / show snackbar
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: (signUpVM) => _buildSignUpScreen(signUpVM, context),
            loaded: (signUpVM) => _buildSignUpScreen(signUpVM, context),
            userCreated: (signUpVM) => _buildSignUpScreen(signUpVM, context),
            error: (e, signUpVM) => _buildSignUpScreen(signUpVM, context),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildSignUpScreen(SignUpVM vm, BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SignUpUserSliverAppBar(
          onLeadingPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            context.goNamed(AppRoutes.start.name);
            context.read<StartingCubit>().setView(StartingPageView.initial);
          },
          onPressedDisabled: () => showEnableFormSnackBar(context),
          onPressed: () async => await pickImage(context).then(
              (value) => context.read<SignUpCubit>().processImagePath(value)),
          onTap: () => showUserRoleSnackBar(context),
          enabled: vm.roleId != null,
          imagePath: vm.imagePath,
        ),
        SliverToBoxAdapter(child: _buildSignUpContent(vm, context)),
      ],
    );
  }

  Widget _buildSignUpContent(SignUpVM vm, BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final enabled = vm.roleId != null;

    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
      child: Form(
        key: vm.formKey,
        autovalidateMode: vm.autovalidateMode,
        child: Column(
          children: [
            GestureDetector(
              onTap: !enabled ? () => showEnableFormSnackBar(context) : null,
              child: const SignUpUserForm(),
            ),
            TermsAndPrivacyPolicyWdg(enabled: enabled),
            FoodlyLoginButton(
              type: LoginButtonType.secondary,
              margin: EdgeInsets.zero,
              onPressed: enabled
                  ? () async => await cubit.onSignUpUserPressed()
                  : null,
              shape:
                  enabled ? ui.NeumorphicShape.convex : ui.NeumorphicShape.flat,
              text: S.current.createUser,
              disabled: !enabled,
            ).paddingOnly(top: 30, bottom: 32),
          ],
        ),
      ),
    );
  }
}
