import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:foodly_world/ui/views/starting/widgets/password_recover/password_recover_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

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
          loading: (vm) => _buildLoginWidgets(vm),
          welcome: (vm) => _buildLoginWidgets(vm),
          error: (e, vm) => _buildLoginWidgets(vm),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildLoginWidgets(StartingVM vm) =>
      vm.currentView == StartingPageView.initial ? _buildLogicAndGetStartedButtons() : _buildLoginForm(vm);

  Widget _buildLoginForm(StartingVM vm) {
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
              showLeading: false,
              autovalidateMode: vm.autovalidateMode,
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
            FoodlyPrimaryInputText(
              enabled: true,
              controller: vm.passwordController!,
              focusNode: _passwordNode,
              inputTextType: FoodlyInputType.password,
              autovalidateMode: vm.autovalidateMode,
              validator: (value) => (value == null || value.isEmpty) ? S.current.pleaseEnterPassword : null,
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
            const Spacer(),
            CustomNeumorphicButton(
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

  Widget _buildLogicAndGetStartedButtons() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeIn(
            delay: Durations.short3,
            child: CustomNeumorphicButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                cubit.setView(StartingPageView.login);
              },
              text: S.current.login,
              disabled: false,
            ),
          ),
          FadeIn(
            delay: Durations.medium2,
            child: CustomNeumorphicButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                context.goNamed(AppRoutes.signUp.name);
              },
              margin: const EdgeInsets.fromLTRB(
                  UIDimens.SCREEN_PADDING_MOB, UIDimens.SCREEN_PADDING_MOB, UIDimens.SCREEN_PADDING_MOB, 0),
              text: S.current.signup,
              type: CustomNeumorphicBtnType.tertiary,
              disabled: false,
            ),
          ),
          FadeIn(
            delay: Durations.long3,
            child: CustomNeumorphicButton(
              key: const Key('google-sign-in-btn'),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                cubit.googleSignIn();
              },
              padding: const EdgeInsets.all(12),
              leading: const Icon(Bootstrap.google, color: FoodlyThemes.primaryFoodly),
              text: S.current.signInWithGoogle,
              shape: ui.NeumorphicShape.convex,
              disabled: false,
              type: CustomNeumorphicBtnType.outlined,
              margin: const EdgeInsets.all(UIDimens.SCREEN_PADDING_MOB),
            ),
          ),
        ],
      );
}
