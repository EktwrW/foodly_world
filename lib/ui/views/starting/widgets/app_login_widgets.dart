import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:foodly_world/ui/views/starting/widgets/login_buttons.dart';
import 'package:foodly_world/ui/views/starting/widgets/password_recover/password_recover_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class AppLoginWidgets extends StatefulWidget {
  const AppLoginWidgets({
    super.key,
  });

  @override
  State<AppLoginWidgets> createState() => _AppLoginWidgetsState();
}

class _AppLoginWidgetsState extends State<AppLoginWidgets> {
  late StartingCubit cubit;
  final _formKey = GlobalKey<FormState>();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    cubit = context.read<StartingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartingCubit, StartingState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (vm) => buildLoginWidgets(vm),
          welcome: (vm) => buildLoginWidgets(vm),
          error: (e, vm) => buildLoginWidgets(vm),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget buildLoginWidgets(StartingVM vm) =>
      vm.currentView == StartingPageView.initial ? buildLogicAndGetStartedButtons() : buildLoginForm(vm);

  Widget buildLoginForm(StartingVM vm) {
    return FadeIn(
      duration: const Duration(milliseconds: 450),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            FoodlyPrimaryInputText(
              enabled: true,
              controller: vm.emailController!,
              focusNode: _emailNode,
              secondaryFocusNode: _passwordNode,
              inputTextType: FoodlyInputType.email,
              autovalidateMode: vm.autovalidateMode,
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
            FoodlyPrimaryInputText(
              enabled: true,
              controller: vm.passwordController!,
              focusNode: _passwordNode,
              inputTextType: FoodlyInputType.password,
              autovalidateMode: vm.autovalidateMode,
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
            const Spacer(),
            FoodlyLoginButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  cubit.login();
                } else {
                  cubit.setAutovalidateMode(AutovalidateMode.always);
                }
              },
              text: S.current.submit,
              disabled: false,
            ),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => cubit.setView(StartingPageView.initial),
                    child: Text(
                      S.current.back,
                      style: FoodlyTextStyles.loginCTATextButton,
                    )),
                InkWell(
                    onTap: () => di<DialogService>().showCustomDialog(
                          const PasswordRecoverDialog(),
                          2,
                          onDialogClose: () => cubit.resetPasswordController(),
                        ),
                    child: Text(S.current.forgotPassword, style: FoodlyTextStyles.loginCTATextButton)),
              ],
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
          ],
        ),
      ),
    );
  }

  Widget buildLogicAndGetStartedButtons() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeIn(
            delay: const Duration(milliseconds: 250),
            child: FoodlyLoginButton(
              onPressed: () => cubit.setView(StartingPageView.login),
              text: S.current.login,
              disabled: false,
            ),
          ),
          FadeIn(
            delay: const Duration(milliseconds: 250),
            child: FoodlyLoginButton(
              onPressed: () => context.goNamed(AppRoutes.signUp.name),
              text: S.current.getStarted,
              type: LoginButtonType.secondary,
              disabled: false,
            ),
          ),
        ],
      );
}
