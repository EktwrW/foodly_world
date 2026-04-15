part of '../user_profile_page.dart';

class _PasswordPlaceholder extends StatelessWidget {
  final UserProfileVM vm;

  const _PasswordPlaceholder(this.vm);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();
    final hasPassword = vm.userSessionDM.user.hasPassword == true;

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
            // Social-login users (hasPassword == false) see an actionable label
            // prompting them to set one, since "* * * * * *" would be misleading.
            if (hasPassword)
              const Text('* * * * * * * *', style: FoodlyTextStyles.primaryBodySemiBold).paddingLeft(12)
            else
              Text(S.current.setPassword, style: FoodlyTextStyles.primaryBodySemiBold).paddingLeft(12),
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
    final hasPassword = vm.userSessionDM.user.hasPassword == true;

    // Social-login users whose password is NULL: offer a "Set password" form
    // with only the new-password field. No current_password to verify — the
    // user never had one. Routed to /set-password on submit.
    if (!hasPassword) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.current.setPasswordSubtitle,
            style: FoodlyTextStyles.primaryBodySemiBold,
            textAlign: TextAlign.center,
          ).paddingOnly(bottom: 12, left: 16, right: 16),
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
                  showSaveButton: newPasswordValue.text.length > 7,
                  onSavePressed: () => cubit.callToSetPassword(),
                  onCancelPressed: () {
                    vm.newPasswordController?.controller?.clear();
                    cubit.updateEditMode(ProfileEditing.none);
                  },
                );
              },
            ),
        ],
      ).paddingTop(9);
    }

    // Default: user has a password — classic change-password flow with
    // current + new fields. Routed to /update-password on submit.
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
    ).paddingTop(9);
  }
}
