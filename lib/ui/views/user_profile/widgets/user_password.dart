part of '../user_profile_page.dart';

class _PasswordPlaceholder extends StatelessWidget {
  final UserProfileVM vm;

  const _PasswordPlaceholder(this.vm);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: TextButton(
        onPressed: vm.loggedUserCanEdit
            ? () {
                vm.passwordController?.controller?.clear();
                vm.newPasswordController?.controller?.clear();
                cubit.updateEditMode(ProfileEditing.password);
              }
            : null,
        child: Row(
          children: [
            const Icon(LineAwesome.user_lock_solid, color: FoodlyThemes.primaryFoodly),
            const Text('* * * * * * * *', style: FoodlyTextStyles.primaryBodySemiBold).paddingLeft(12),
          ],
        ).paddingLeft(14),
      ),
    );
  }
}

class _EditUsersPassword extends StatelessWidget {
  final UserProfileVM vm;

  const _EditUsersPassword({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return Column(
      children: [
        FoodlyPrimaryInputText(
          controller: vm.passwordController?.controller,
          focusNode: vm.passwordController?.focusNode,
          secondaryFocusNode: vm.newPasswordController?.focusNode,
          inputTextType: FoodlyInputType.password,
          autovalidateMode: vm.autovalidateMode,
          obscureText: true,
          enabled: true,
          showLeading: false,
        ),
        FoodlyPrimaryInputText(
          controller: vm.newPasswordController?.controller,
          focusNode: vm.newPasswordController?.focusNode,
          inputTextType: FoodlyInputType.newPassword,
          autovalidateMode: vm.autovalidateMode,
          obscureText: true,
          enabled: true,
          showLeading: false,
        ),
        if (vm.newPasswordController?.controller != null)
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: vm.newPasswordController!.controller!,
            builder: (context, newPasswordValue, child) {
              return SaveAndCancelButtons(
                showSaveButton:
                    (newPasswordValue.text.length > 7) && (newPasswordValue.text != vm.passwordController?.text),
                onSavePressed: () => cubit.callToUpdateProfile(),
                onCancelPressed: () {
                  vm.passwordController?.controller?.clear();
                  vm.newPasswordController?.controller?.clear();
                  cubit.updateEditMode(ProfileEditing.none);
                },
              );
            },
          )
      ],
    );
  }
}
