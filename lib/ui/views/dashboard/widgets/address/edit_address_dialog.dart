part of 'dashboard_address.dart';

class EditAddressDialog extends StatelessWidget {
  const EditAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final bloc = context.read<DashboardBloc>();
        final vm = state.vm;

        return Form(
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
                DashboardSaveAndCancelButtons(
                  onCancelPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
