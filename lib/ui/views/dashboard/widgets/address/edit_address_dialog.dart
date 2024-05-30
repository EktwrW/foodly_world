part of 'address.dart';

class EditAddressDialog extends StatelessWidget {
  const EditAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final bloc = context.read<DashboardBloc>();
        final vm = state.vm;

        return Stack(
          children: [
            Container(
              height: 650,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
              padding: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: FoodlyThemes.primaryFoodly,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
                    },
                    child: Text(S.current.close, style: FoodlyTextStyles.dialogCloseText),
                  ),
                ],
              ),
            ),
            Container(
              height: 600,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ui.NeumorphicColors.background,
              ),
              margin: const EdgeInsets.only(
                bottom: 50,
                right: UIDimens.SCREEN_PADDING_MOB,
                left: UIDimens.SCREEN_PADDING_MOB,
              ),
              child: Form(
                key: vm.formKey,
                autovalidateMode: vm.autovalidateMode,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      NovaPlacesAutocomplete(
                        apiKey: di<BaseConfig>().googleDefaultApiKey,
                        onPicked: (prediction) => di<Logger>().i('$prediction'),
                        prefixIcon: const Icon(Icons.manage_search_sharp),
                        cancelIcon: const Icon(Bootstrap.eraser_fill, size: 22),
                        autocompleteOnTrailingWhitespace: true,
                      ).paddingBottom(20),
                      FoodlyPrimaryInputText(
                        controller: vm.businessCountryCtrl?.controller,
                        focusNode: vm.businessCountryCtrl?.focusNode,
                        secondaryFocusNode: vm.businessCityCtrl?.focusNode,
                        inputTextType: FoodlyInputType.businessCountry,
                        autovalidateMode: vm.autovalidateMode,
                        enabled: true,
                      ),
                      FoodlyPrimaryInputText(
                        controller: vm.businessCityCtrl?.controller,
                        focusNode: vm.businessCityCtrl?.focusNode,
                        secondaryFocusNode: vm.businessAddressCtrl?.focusNode,
                        inputTextType: FoodlyInputType.businessCity,
                        autovalidateMode: vm.autovalidateMode,
                        enabled: true,
                      ),
                      FoodlyPrimaryInputText(
                        controller: vm.businessAddressCtrl?.controller,
                        focusNode: vm.businessAddressCtrl?.focusNode,
                        secondaryFocusNode: vm.businessZipCodeCtrl?.focusNode,
                        inputTextType: FoodlyInputType.businessAddress,
                        autovalidateMode: vm.autovalidateMode,
                        enabled: true,
                      ),
                      FoodlyPrimaryInputText(
                        controller: vm.businessZipCodeCtrl?.controller,
                        focusNode: vm.businessZipCodeCtrl?.focusNode,
                        inputTextType: FoodlyInputType.businessZipCode,
                        autovalidateMode: vm.autovalidateMode,
                        enabled: true,
                        countryCode: vm.businessCountryCode ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
