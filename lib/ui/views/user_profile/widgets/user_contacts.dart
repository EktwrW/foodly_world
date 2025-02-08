part of '../user_profile_page.dart';

class _ContactWdg extends StatelessWidget {
  final UserProfileVM vm;
  const _ContactWdg({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        vm.phoneNumberController?.controller?.text = vm.currentUserPhoneNumber ?? '';
        vm.emailController?.controller?.text = vm.currentUserEmail ?? '';
        context.read<UserProfileCubit>().updateEditMode(ProfileEditing.contact);
      },
      child: SizedBox(
          width: context.screenWidth,
          child:
              BusinessEmailAndPhoneWdg(email: vm.currentUserEmail ?? '', phoneNumber: vm.currentUserPhoneNumber ?? '')),
    );
  }
}

class _ContactEditingWdg extends StatelessWidget {
  final UserProfileVM vm;
  const _ContactEditingWdg({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: SizedBox(
        height: 196,
        width: context.screenWidth - 36,
        child: Column(
          children: [
            FoodlyPrimaryInputText(
              controller: vm.emailController?.controller,
              hintText: vm.currentUserEmail,
              focusNode: vm.emailController?.focusNode,
              secondaryFocusNode: vm.phoneNumberController?.focusNode,
              inputTextType: FoodlyInputType.email,
              autovalidateMode: vm.autovalidateMode,
              enabled: vm.edition.isEditingContact,
            ),
            FoodlyPhoneInputText(
              controller: vm.phoneNumberController?.controller,
              hintText: vm.currentUserPhoneNumber,
              focusNode: vm.phoneNumberController?.focusNode,
              onSubmitted: (_) => cubit,
              autovalidateMode: vm.autovalidateMode,
              enabled: vm.edition.isEditingContact,
              initialCountryCode: cubit.currentCountryCode,
            ),
            SaveAndCancelButtons(
              onSavePressed: () => cubit.callToUpdateProfile(),
              onCancelPressed: () {
                vm.emailController?.controller?.clear();
                vm.phoneNumberController?.controller?.clear();
                cubit.updateEditMode(ProfileEditing.none);
              },
              recordControllers: ProfileHelpers.contactChannelsFieldControllers(vm),
            ),
          ],
        ).paddingTop(8),
      ),
    );
  }
}
