part of '../main_search_widget.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmartSearchCubit, SmartSearchState>(
      builder: (context, state) {
        final locationService = di<LocationService>();

        return Tooltip(
          message: di<AuthSessionService>().userSessionDM?.user.fullAddress,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                if (!state.vm.smartSearchMode.isOff) {
                  if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  await Future.delayed(Durations.short2);
                }

                di<DialogService>().showCustomDialog(
                  const ChangeLocationDialog(),
                  2,
                  onDialogClose: () => context.read<SmartSearchCubit>().resetToInitial(),
                );
              },
              borderRadius: BorderRadius.circular(10),
              splashColor: FoodlyThemes.primaryFoodly.withValues(alpha: .5),
              highlightColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.2),
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: ui.NeumorphicColors.embossMaxWhiteColor, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  spacing: 8,
                  children: [
                    const Icon(Clarity.map_marker_solid, color: FoodlyThemes.primaryFoodly, size: 22),
                    Expanded(
                      child: Text(
                        '${locationService.currentCity}, ${locationService.currentZipCode}.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FoodlyTextStyles.labelBold,
                      ),
                    ),
                  ],
                ).paddingAll(8),
              ),
            ).paddingRight(6),
          ),
        );
      },
    );
  }
}

class ChangeLocationDialog extends StatefulWidget {
  const ChangeLocationDialog({super.key});

  @override
  State<ChangeLocationDialog> createState() => _ChangeLocationDialogState();
}

class _ChangeLocationDialogState extends State<ChangeLocationDialog> {
  Place? _selectedPlace;
  late final LocationService locationService;
  late final AuthSessionService authSessionService;
  late final SmartSearchCubit voiceSearchCubit;
  late final UserDM? loggedUser;

  @override
  void initState() {
    super.initState();
    locationService = di<LocationService>();
    voiceSearchCubit = context.read<SmartSearchCubit>();
    authSessionService = di<AuthSessionService>();
    loggedUser = authSessionService.userSessionDM?.user;
  }

  void _handlePlaceSelected(Place place) {
    setState(() => _selectedPlace = place);
    locationService.updateLocationFromPlace(place);
    voiceSearchCubit.resetToInitial();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: FadeIn(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
              padding: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: FoodlyThemes.primaryFoodly,
              ),
              child: SaveAndCancelButtons(
                onCancelPressed: () => Navigator.of(context).pop(),
                btnType: SaveAndCancelBtnType.dialog,
              ),
            ),
            Container(
              height: 450,
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
              child: AnimatedSize(
                duration: Durations.medium3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 20,
                  children: [
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Asset(FoodlyAssets.editLocation, width: 40),
                        Text(
                          S.current.changeLocation,
                          style: FoodlyTextStyles.confirmationTextPrimary,
                        ),
                      ],
                    ).paddingOnly(top: 24, bottom: 20),
                    ui.NeumorphicRadio(
                      style: const ui.NeumorphicRadioStyle(
                        unselectedDepth: 2,
                        unselectedColor: FoodlyThemes.alternativeUnselectedLightColor,
                      ),
                      child: PlacesAutocompleteWdg(
                        hintText: S.current.changeSearchPoint,
                        language: authSessionService.lang,
                        components: loggedUser?.principalAddress?.country?.apiComponents,
                        onPickedPlaceDetail: _handlePlaceSelected,
                      ),
                    ),
                    if (_selectedPlace != null)
                      FadeInRight(
                        duration: Durations.medium4,
                        child: Column(
                          spacing: 4,
                          children: [
                            Text(
                              '${S.current.selectedPlace}:',
                              style: FoodlyTextStyles.captionPurpleBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              _selectedPlace?.formattedAddress ?? _selectedPlace?.name ?? '-',
                              style: FoodlyTextStyles.caption,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    Flexible(
                      child: BlocBuilder<LocationBloc, LocationState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            locationChecked: (locationDM) => ui.NeumorphicButton(
                              onPressed: () {
                                locationService.updateLocation(locationDM);
                                voiceSearchCubit.resetToInitial();
                                setState(
                                  () => _selectedPlace = Place(
                                    formattedAddress:
                                        '${locationDM.address ?? '-'}, ${locationDM.city ?? '-'}, ${locationDM.zipCode ?? '-'}',
                                  ),
                                );
                              },
                              style: ui.NeumorphicStyle(
                                color: FoodlyThemes.primaryLighten73,
                                depth: 2,
                              ),
                              child: SizedBox(
                                height: 66,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 8,
                                  children: [
                                    Row(
                                      spacing: 8,
                                      children: [
                                        const Icon(Icons.my_location, size: 18),
                                        Expanded(
                                          child: Text(
                                            S.current.useDeviceLocation,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: FoodlyTextStyles.captionPurpleBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${locationDM.address ?? ''}, ${locationDM.city ?? ''}',
                                          style: FoodlyTextStyles.addressSmallText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            orElse: () => const Text('-'),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: ui.NeumorphicButton(
                        onPressed: loggedUser != null
                            ? () {
                                locationService.updateLocationUserDM(loggedUser!);
                                voiceSearchCubit.resetToInitial();
                                setState(
                                  () => _selectedPlace = Place(
                                    formattedAddress:
                                        '${loggedUser?.principalAddress?.address ?? '-'}, ${loggedUser?.principalAddress?.city ?? '-'}, ${loggedUser?.principalAddress?.zipCode ?? '-'}',
                                  ),
                                );
                              }
                            : null,
                        style: ui.NeumorphicStyle(
                          color: FoodlyThemes.primaryLighten73,
                          depth: 2,
                        ),
                        child: SizedBox(
                          height: 66,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Row(
                                spacing: 8,
                                children: [
                                  const Icon(Icons.location_history_rounded, size: 18),
                                  Expanded(
                                    child: Text(
                                      S.current.useSavedLocation,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FoodlyTextStyles.captionPurpleBold,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${authSessionService.userSessionDM?.user.principalAddress?.city ?? '-'}, ${authSessionService.userSessionDM?.user.principalAddress?.zipCode}',
                                    style: FoodlyTextStyles.addressSmallText,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
