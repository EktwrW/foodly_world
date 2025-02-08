part of '../user_profile_page.dart';

class UserLocation extends StatelessWidget {
  final UserProfileVM vm;

  const UserLocation({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: TextButton(
        onPressed: vm.loggedUserCanEdit
            ? () {
                if (vm.currentUser?.country != null) cubit.setUserCountry(vm.currentUser?.country);
                vm.cityController?.controller?.text = vm.currentUserCity ?? '';
                vm.zipCodeController?.controller?.text = vm.currentUserZipCode ?? '';
                cubit.updateEditMode(ProfileEditing.location);
              }
            : null,
        child: Row(
          children: [
            const Icon(Clarity.map_marker_line, color: FoodlyThemes.primaryFoodly),
            Text(vm.currentUserFullAddress, style: FoodlyTextStyles.primaryBodySemiBold).paddingLeft(12),
          ],
        ).paddingLeft(14),
      ).paddingTop(8),
    );
  }
}

class EditUsersLocationWidgets extends StatelessWidget {
  final UserProfileVM vm;

  const EditUsersLocationWidgets({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: Column(
        children: [
          FoodlyDropdownButtonFormField(
            value: vm.country,
            focusNode: vm.countryNode,
            decoration: InputDecoration(
              prefixIcon: vm.country?.flag?.paddingAll(10) ?? FoodlyInputType.country.icon,
              prefixIconColor: Colors.black87,
              hintText: S.current.country,
              contentPadding: const EdgeInsets.only(top: 10),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 0.75, color: Colors.black87),
              ),
              hintStyle: const TextStyle(color: FoodlyThemes.secondaryFoodly),
            ),
            enabled: true,
            onChanged: (FoodlyCountries? newValue) {
              cubit.setUserCountry(newValue);
              cubit.setAutovalidateMode(AutovalidateMode.always);
              vm.cityController?.focusNode?.requestFocus();
            },
            items: FoodlyCountries.values
                .map<DropdownMenuItem<FoodlyCountries>>(
                  (FoodlyCountries country) => DropdownMenuItem<FoodlyCountries>(
                    value: country,
                    child: Text(country.value),
                  ),
                )
                .toList(),
          ),
          FoodlyPrimaryInputText(
            controller: vm.cityController!.controller!,
            focusNode: vm.cityController?.focusNode,
            secondaryFocusNode: vm.zipCodeController?.focusNode,
            inputTextType: FoodlyInputType.city,
            autovalidateMode: vm.autovalidateMode,
            enabled: true,
          ),
          FoodlyPrimaryInputText(
            controller: vm.zipCodeController!.controller!,
            focusNode: vm.zipCodeController?.focusNode,
            secondaryFocusNode: vm.genderNode,
            inputTextType: FoodlyInputType.zipCode,
            autovalidateMode: vm.autovalidateMode,
            enabled: true,
            countryCode: cubit.currentCountryCode,
          ),
          SaveAndCancelButtons(
            onSavePressed: () => cubit.callToUpdateProfile(),
            onCancelPressed: () {
              vm.cityController?.controller?.clear();
              vm.zipCodeController?.controller?.clear();
              cubit.updateEditMode(ProfileEditing.none);
            },
            recordControllers: ProfileHelpers.addressFieldControllers(vm),
          ),
        ],
      ).paddingTop(12),
    );
  }
}
