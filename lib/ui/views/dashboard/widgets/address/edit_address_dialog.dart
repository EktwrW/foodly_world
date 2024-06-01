part of 'address.dart';

class EditAddressDialog extends StatelessWidget {
  const EditAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final bloc = context.read<DashboardBloc>();
        final vm = state.vm;
        final devicePosition = di<LocationService>().currentLocation.position;

        return FadeIn(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 700,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: FoodlyThemes.primaryFoodly,
                  ),
                  child: DashboardSaveAndCancelButtons(
                    onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
                    onCancelPressed: () {
                      Navigator.of(context).pop();
                      bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
                    },
                    onCancelPressedSecondary: () => bloc.restartAddressControllers(),
                    btnType: SaveAndCancelBtnType.dialog,
                    recordControllers: DashboardHelpers.addressFieldControllers(vm),
                  ),
                ),
              ),
              Container(
                height: 650,
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
                  key: vm.locationFormKey,
                  autovalidateMode: vm.autovalidateMode,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Asset(FoodlyAssets.editLocation, width: 40),
                            Text(
                              S.current.editLocation,
                              style: FoodlyTextStyles.confirmationTextPrimary,
                            ).paddingLeft(20),
                          ],
                        ).paddingOnly(top: 25, bottom: 35),
                        NovaPlacesAutocomplete(
                          language: bloc.lang,
                          apiKey: di<BaseConfig>().googleDefaultApiKey,
                          onPicked: (prediction) => di<Logger>().i('$prediction'),
                          onSearchFailed: (error) {
                            di<Logger>().e(error);
                          },
                          components: vm.businessCountry?.apiComponents,
                          prefixIcon: const Icon(Icons.manage_search_sharp),
                          cancelIcon: const Icon(Bootstrap.eraser_fill, size: 22),
                          autocompleteOnTrailingWhitespace: true,
                          detailRequired: true,
                          onPickedPlaceDetail: (detail) {
                            bloc.add(DashboardEvent.setAddressFromPlacesAPI(detail));
                            if (detail.geometry != null) {
                              vm.mapController?.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(detail.geometry!.location.lat, detail.geometry!.location.lng),
                                    zoom: 16,
                                  ),
                                ),
                              );
                            }
                            di<Logger>().i('$detail');
                          },
                        ).paddingBottom(20),
                        FoodlyDropdownButtonFormField(
                          value: vm.businessCountry,
                          hintText: S.current.country,
                          enabled: true,
                          onChanged: (country) => country != null ? bloc.add(DashboardEvent.setCountry(country)) : null,
                          items: FoodlyCountries.values
                              .map<DropdownMenuItem<FoodlyCountries>>(
                                (country) => DropdownMenuItem<FoodlyCountries>(
                                  value: country,
                                  child: Row(
                                    children: [
                                      if (country.flag != null) country.flag!.paddingHorizontal(12),
                                      Text(country.value),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          prefixIcon: vm.businessCountry == null ? FoodlyInputType.businessCountry.icon : null,
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
                        FadeIn(
                          duration: Durations.long1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SizedBox(
                                  height: 140,
                                  width: context.screenWidth - 80,
                                  child: GoogleMap(
                                    onMapCreated: (controller) => bloc.add(DashboardEvent.setMapController(controller)),
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                        vm.currentBusiness?.latitude ?? devicePosition?.latitude ?? 0.0,
                                        vm.currentBusiness?.longitude ?? devicePosition?.longitude ?? 0.0,
                                      ),
                                      zoom: 16.0,
                                    ),
                                    markers: vm.markers,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingVertical(10),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
