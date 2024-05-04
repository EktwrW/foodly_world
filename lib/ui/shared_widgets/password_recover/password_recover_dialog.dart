import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:foodly_world/ui/views/starting/widgets/login_buttons.dart';
import 'package:foodly_world/ui/views/starting/widgets/login_input_text.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class PasswordRecoverDialog extends StatelessWidget {
  const PasswordRecoverDialog({super.key});

  Widget _getTextCloseDialog(String text, void Function()? onTap) => InkWell(
        onTap: onTap,
        child: Text(text, style: FoodlyTextStyles.dialogCloseText),
      );

  TextSpan getBoldTextSpan(String text) =>
      TextSpan(text: text, style: FoodlyTextStyles.primaryBodyBold);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartingCubit, StartingState>(
      builder: (context, state) {
        return FadeIn(
          duration: const Duration(milliseconds: 350),
          child: Stack(
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: UIDimens.SCREEN_PADDING_MOB),
                padding: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: FoodlyThemes.primaryFoodly,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state.whenOrNull(
                          welcome: (vm) {
                            var text = vm.passwordSuccessfullySent
                                ? S.current.close
                                : S.current.cancel;
                            var onTap = vm.isRequestingPassword
                                ? null
                                : () => Navigator.of(context).pop();

                            return _getTextCloseDialog(text, onTap);
                          },
                        ) ??
                        _getTextCloseDialog(S.current.cancel,
                            () => Navigator.of(context).pop()),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ui.NeumorphicColors.background,
                ),
                margin: const EdgeInsets.only(
                  bottom: 50,
                  right: UIDimens.SCREEN_PADDING_MOB,
                  left: UIDimens.SCREEN_PADDING_MOB,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElasticIn(
                        child: const Asset(FoodlyAssets.password, height: 90)),
                    state.maybeWhen(
                      welcome: (vm) => _stateContent(vm, context),
                      // error: (msg, vm) => _stateContent(vm, context, errorMsg: msg), //TODO: check if this msg should be rendered
                      error: (msg, vm) => _stateContent(vm, context),
                      orElse: () => const CircularProgressIndicator.adaptive(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _stateContent(StartingVM vm, BuildContext context,
      {String? errorMsg}) {
    return FadeIn(
      duration: Durations.extralong4,
      child: vm.recoverPasswordView == RecoverPasswordView.sendingRequest
          ? const CircularProgressIndicator.adaptive()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  vm.errorRequestingPassword
                      ? S.current.somethingWentWrong
                      : vm.passwordSuccessfullySent
                          ? S.current.passwordSent
                          : S.current.recoverPassword,
                  textAlign: TextAlign.center,
                  style: FoodlyTextStyles.confirmationTextPrimary,
                ).paddingBottom(30),
                if (vm.willRequestPassword)
                  SizedBox(
                    height: 90,
                    child: LoginInputText(
                      enabled: true,
                      autofocus: true,
                      focusNode: FocusNode(),
                      controller: vm.emailController!,
                      inputTextType: FoodlyInputType.email,
                      autovalidateMode: vm.autovalidateMode,
                    ),
                  ),
                if (vm.passwordSuccessfullySent)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: S.current.recoverPasswordTextSpan1),
                        getBoldTextSpan(S.current.recoverPasswordTextSpan2),
                        TextSpan(text: S.current.recoverPasswordTextSpan3),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                if (vm.errorRequestingPassword)
                  Text(
                    errorMsg ?? S.current.recoverPasswordErrorMsg,
                    textAlign: TextAlign.center,
                  ).paddingBottom(30),
                if (!vm.passwordSuccessfullySent)
                  SizedBox(
                    height: 48,
                    child: FoodlyLoginButton(
                      text: vm.errorRequestingPassword
                          ? S.current.tryAgain
                          : S.current.send,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      disabled: false,
                      fontSize: 14.5,
                      onPressed: () => vm.errorRequestingPassword
                          ? context
                              .read<StartingCubit>()
                              .restartRecoverPassword()
                          : context.read<StartingCubit>().recoverPassword(),
                      shape: ui.NeumorphicShape.concave,
                    ),
                  ).paddingBottom(6),
              ],
            ),
    );
  }
}
