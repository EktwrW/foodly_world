part of '../user_profile_page.dart';

// ============================================================================
// EMAIL SECTION — its own section with re-auth guard for changes
// ============================================================================
//
// Email is an account-recovery vector: whoever controls the email can reset
// the password via forgot-password. A silent session-hijack + email change =
// full takeover.  Therefore changing email requires re-authentication:
//   - Users with a password → PasswordConfirmationDialog on save
//   - Google-only users (no password) → rejected with a CTA to set password
//
// This is deliberately split from the phone section because changing phone
// does NOT have the same risk profile and shouldn't impose the same friction.
// ============================================================================

class _EmailWdg extends StatelessWidget {
  final UserProfileVM vm;
  const _EmailWdg({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        vm.emailController?.controller?.text = vm.currentUserEmail ?? '';
        context.read<UserProfileCubit>().updateEditMode(ProfileEditing.email);
      },
      child: SizedBox(
        width: context.screenWidth,
        child: Row(
          children: [
            const Icon(Bootstrap.envelope, color: FoodlyThemes.primaryFoodly),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                vm.currentUserEmail ?? '',
                style: FoodlyTextStyles.primaryBodySemiBold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ).paddingLeft(14),
      ),
    );
  }
}

class _EmailEditingWdg extends StatelessWidget {
  final UserProfileVM vm;
  const _EmailEditingWdg({super.key, required this.vm});

  Future<void> _onSave(BuildContext context) async {
    final cubit = context.read<UserProfileCubit>();
    final newEmail = vm.emailController?.controller?.text.trim() ?? '';
    final oldEmail = vm.currentUserEmail ?? '';

    // No actual change — just exit edit mode silently.
    if (newEmail.isEmpty || newEmail == oldEmail) {
      cubit.updateEditMode(ProfileEditing.none);
      return;
    }

    // Google-only users without a password cannot change email. We don't have
    // a current_password to verify against, and we won't re-OAuth inline here.
    // Direct them to set a password first.
    final hasPassword = vm.userSessionDM.user.hasPassword == true;
    if (!hasPassword) {
      FoodlySnackbars.errorGeneric(context, S.current.emailChangeBlockedForSocialUser);
      cubit.updateEditMode(ProfileEditing.none);
      return;
    }

    // Re-auth: ask for current password via the reusable sudo-mode dialog.
    final currentPassword = await PasswordConfirmationDialog.show(
      context,
      reason: S.current.confirmPasswordForEmailChange,
    );
    if (currentPassword == null) return; // cancelled
    if (!context.mounted) return;

    cubit.callToUpdateEmail(newEmail: newEmail, currentPassword: currentPassword);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: Column(
        children: [
          FoodlyPrimaryInputText(
            controller: vm.emailController?.controller,
            hintText: vm.currentUserEmail,
            focusNode: vm.emailController?.focusNode,
            inputTextType: FoodlyInputType.email,
            autovalidateMode: vm.autovalidateMode,
            enabled: vm.edition.isEditingEmail,
            showLeading: false,
          ),
          SaveAndCancelButtons(
            onSavePressed: () => _onSave(context),
            onCancelPressed: () {
              vm.emailController?.controller?.clear();
              cubit.updateEditMode(ProfileEditing.none);
            },
            recordControllers: ProfileHelpers.emailFieldControllers(vm),
          ),
        ],
      ).paddingTop(8),
    );
  }
}

// ============================================================================
// PHONE SECTION — no re-auth guard, unchanged behavior aside from isolation
// ============================================================================

class _PhoneWdg extends StatelessWidget {
  final UserProfileVM vm;
  const _PhoneWdg({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        vm.phoneNumberController?.controller?.text = vm.currentUserPhoneNumber ?? '';
        context.read<UserProfileCubit>().updateEditMode(ProfileEditing.phone);
      },
      child: SizedBox(
        width: context.screenWidth,
        child: Row(
          children: [
            const Icon(Bootstrap.telephone, color: FoodlyThemes.primaryFoodly),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                vm.currentUserPhoneNumber ?? '',
                style: FoodlyTextStyles.primaryBodySemiBold,
              ),
            ),
          ],
        ).paddingLeft(14),
      ),
    );
  }
}

class _PhoneEditingWdg extends StatelessWidget {
  final UserProfileVM vm;
  const _PhoneEditingWdg({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: Column(
        children: [
          FoodlyPhoneInputText(
            controller: vm.phoneNumberController?.controller,
            hintText: vm.currentUserPhoneNumber,
            focusNode: vm.phoneNumberController?.focusNode,
            onSubmitted: (_) => cubit,
            autovalidateMode: vm.autovalidateMode,
            enabled: vm.edition.isEditingPhone,
            initialCountryCode: cubit.currentCountryCode,
          ),
          SaveAndCancelButtons(
            onSavePressed: () => cubit.callToUpdateProfile(),
            onCancelPressed: () {
              vm.phoneNumberController?.controller?.clear();
              cubit.updateEditMode(ProfileEditing.none);
            },
            recordControllers: ProfileHelpers.phoneFieldControllers(vm),
          ),
        ],
      ).paddingTop(8),
    );
  }
}
