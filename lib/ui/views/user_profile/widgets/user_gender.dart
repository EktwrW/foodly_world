part of '../user_profile_page.dart';

class _UsersGender extends StatelessWidget {
  final UserProfileVM vm;

  const _UsersGender({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: TextButton(
        onPressed: vm.loggedUserCanEdit ? () => cubit.updateEditMode(ProfileEditing.gender) : null,
        child: Row(
          children: [
            // Placeholder atenuado (la etiqueta "Género") cuando no hay valor,
            // típico en altas sociales sin perfil completo.
            Builder(builder: (_) {
              final hasGender = vm.currentUserGender?.text.isNotEmpty ?? false;
              return Text(
                hasGender ? vm.currentUserGender!.text : (vm.loggedUserCanEdit ? S.current.gender : ''),
                style: hasGender ? FoodlyTextStyles.primaryBodySemiBold : FoodlyTextStyles.hintText,
              );
            }),
          ],
        ).paddingLeft(14),
      ).paddingTop(8),
    );
  }
}

class _EditUserGenderWdg extends StatelessWidget {
  final UserProfileVM vm;

  const _EditUserGenderWdg({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return FadeIn(
      child: Column(
        children: [
          DropdownButtonFormField<UserGender>(
            initialValue: vm.gender,
            focusNode: vm.genderNode,
            decoration: InputDecoration(
              prefix: const SizedBox.shrink(),
              prefixIconColor: Colors.black87,
              hintText: S.current.gender,
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              hintStyle: const TextStyle(
                color: FoodlyThemes.secondaryFoodly,
              ),
            ),
            onChanged: (UserGender? newValue) => cubit.setUserGender(newValue),
            items: vm.userGenders.map<DropdownMenuItem<UserGender>>((UserGender gender) {
              return DropdownMenuItem<UserGender>(
                value: gender,
                child: Text(gender.text),
              );
            }).toList(),
            autovalidateMode: vm.autovalidateMode,
            validator: (value) => value == null ? S.current.pleaseSelectAnOption : null,
          ),
          SaveAndCancelButtons(
            showSaveButton: vm.currentUserGender != vm.gender,
            onSavePressed: () => cubit.callToUpdateProfile(),
            onCancelPressed: () {
              cubit.updateEditMode(ProfileEditing.none);
              cubit.setUserGender(vm.currentUserGender);
            },
          ),
        ],
      ).paddingTop(9),
    );
  }
}
