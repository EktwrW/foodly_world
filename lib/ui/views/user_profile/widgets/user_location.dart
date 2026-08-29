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
                if (vm.currentUser?.principalAddress?.country != null) {
                  cubit.setUserCountry(vm.currentUser?.principalAddress?.country);
                }
                vm.addressController?.controller?.text = vm.currentUserAddress ?? '';
                vm.cityController?.controller?.text = vm.currentUserCity ?? '';
                vm.zipCodeController?.controller?.text = vm.currentUserZipCode ?? '';
                cubit.updateEditMode(ProfileEditing.location);
              }
            : null,
        child: Row(
          spacing: 10,
          children: [
            const Icon(Clarity.map_marker_line, color: FoodlyThemes.primaryFoodly),
            Flexible(
              // Placeholder atenuado (la etiqueta "Dirección") cuando no hay
              // dirección cargada, típico en altas sociales o email sin dirección.
              child: Builder(builder: (_) {
                final hasAddress = vm.currentUserFullAddress.trim().isNotEmpty;
                return Text(
                  hasAddress ? vm.currentUserFullAddress : (vm.loggedUserCanEdit ? S.current.address : ''),
                  style: hasAddress ? FoodlyTextStyles.primaryBodySemiBold : FoodlyTextStyles.hintText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                );
              }),
            ),
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
          PlacesAutocompleteWdg(
            key: const Key('find-user-location'),
            language: cubit.lang,
            focusNode: vm.placesFocusNode,
            components: FoodlyCountries.USA.apiComponents,
            onPickedPlaceDetail: (place) {
              cubit.updateUserLocationFromPlacesAPI(place);
            },
            hintText: S.current.findAndCompleteAddress,
          ).paddingOnly(top: 12, bottom: 20),
          FoodlyDropdownButtonFormField(
            value: vm.country,
            focusNode: vm.countryNode,
            decoration: InputDecoration(
              prefixIcon: vm.country?.flag?.paddingAll(10) ?? FoodlyInputType.country.icon,
              prefixIconColor: Colors.black87,
              hintText: S.current.country,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              hintStyle: const TextStyle(color: FoodlyThemes.secondaryFoodlyText),
            ),
            enabled: true,
            onChanged: (FoodlyCountries? newValue) {
              cubit.setUserCountry(newValue);
              cubit.setAutovalidateMode(AutovalidateMode.always);
              vm.addressController?.focusNode?.requestFocus();
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
            controller: vm.addressController?.controller,
            focusNode: vm.addressController?.focusNode,
            secondaryFocusNode: vm.cityController?.focusNode,
            inputTextType: FoodlyInputType.address,
            autovalidateMode: vm.autovalidateMode,
            enabled: true,
            maxLines: 1,
            showLeading: false,
          ),
          FoodlyPrimaryInputText(
            controller: vm.cityController?.controller,
            focusNode: vm.cityController?.focusNode,
            secondaryFocusNode: vm.zipCodeController?.focusNode,
            inputTextType: FoodlyInputType.city,
            autovalidateMode: vm.autovalidateMode,
            enabled: true,
            showLeading: false,
          ),
          FoodlyPrimaryInputText(
            controller: vm.zipCodeController?.controller,
            focusNode: vm.zipCodeController?.focusNode,
            secondaryFocusNode: vm.genderNode,
            inputTextType: FoodlyInputType.zipCode,
            autovalidateMode: vm.autovalidateMode,
            enabled: true,
            countryCode: cubit.currentCountryCode,
            showLeading: false,
          ),
          SaveAndCancelButtons(
            onSavePressed: () => cubit.callToUpdateProfile(),
            onCancelPressed: () {
              cubit.cancelEditLocation();
              cubit.updateEditMode(ProfileEditing.none);
            },
            showSaveButton: vm.currentUserHasNewLocation,
            recordControllers: ProfileHelpers.addressFieldControllers(vm),
          ),
        ],
      ).paddingTop(12),
    );
  }
}
