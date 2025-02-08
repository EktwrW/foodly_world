part of '../user_profile_page.dart';

class ProfileNameWdg extends StatelessWidget {
  final UserProfileVM vm;
  final UserDM userDM;

  const ProfileNameWdg({
    super.key,
    required this.vm,
    required this.userDM,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return Visibility(
      visible: vm.edition.isEditingName,
      replacement: InkWell(
        onTap: vm.loggedUserCanEdit
            ? () {
                vm.firstNameController?.controller?.text = userDM.firstName ?? '';
                vm.lastNameController?.controller?.text = userDM.lastName ?? '';
                cubit.updateEditMode(ProfileEditing.userName);
              }
            : null,
        focusNode: vm.firstNameController?.focusNode,
        child: FittedBox(
          child: FadeIn(
            child: ui.NeumoText(
              vm.userSessionDM.loggedUserFullName,
              style: const ui.NeumoStyle(color: FoodlyThemes.primaryFoodly),
              textStyle: ui.NeumoTextStyle(
                fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
                fontSize: FoodlyTextStyles.sectionsTitle.fontSize,
                fontWeight: FoodlyTextStyles.sectionsTitle.fontWeight,
              ),
            ),
          ),
        ).paddingSymmetric(vertical: 14, horizontal: 12),
      ),
      child: Row(
        children: [
          Expanded(
            child: FadeIn(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: FadeInLeft(
                          duration: Durations.long2,
                          child: FoodlyPrimaryInputText(
                            key: ValueKey(vm.userSessionDM.user.firstName),
                            controller: vm.firstNameController?.controller,
                            focusNode: vm.firstNameController?.focusNode,
                            inputTextType: FoodlyInputType.firstName,
                            autovalidateMode: vm.autovalidateMode,
                            autofocus: true,
                            maxLength: 15,
                            enabled: vm.edition.isEditingName,
                            hintText: vm.userSessionDM.user.firstName,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: FadeInRight(
                          duration: Durations.long2,
                          child: FoodlyPrimaryInputText(
                            key: ValueKey(vm.userSessionDM.user.lastName),
                            controller: vm.lastNameController?.controller,
                            focusNode: vm.lastNameController?.focusNode,
                            inputTextType: FoodlyInputType.lastName,
                            autovalidateMode: vm.autovalidateMode,
                            maxLength: 18,
                            enabled: vm.edition.isEditingName,
                            hintText: vm.userSessionDM.user.lastName,
                          ),
                        ),
                      ),
                    ],
                  ).paddingHorizontal(12),
                  FadeInRight(
                    duration: Durations.long2,
                    child: SaveAndCancelButtons(
                      onSavePressed: () => cubit.callToUpdateProfile(),
                      onCancelPressed: () {
                        vm.firstNameController?.controller?.clear();
                        vm.lastNameController?.controller?.clear();
                        cubit.updateEditMode(ProfileEditing.none);
                      },
                      recordControllers: [
                        (
                          vm.firstNameController?.controller ?? TextEditingController(),
                          vm.userSessionDM.user.firstName ?? '',
                        ),
                        (
                          vm.lastNameController?.controller ?? TextEditingController(),
                          vm.userSessionDM.user.lastName ?? '',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).paddingBottom(6),
    );
  }
}
