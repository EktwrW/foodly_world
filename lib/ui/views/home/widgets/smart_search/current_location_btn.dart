part of '../main_search_widget.dart';

/// Clasifica el caso "sin ubicación" para que el botón elija **mensaje +
/// acción correctos** según el estado real del LocationBloc.
///
/// El bug previo: abríamos siempre `Geolocator.openAppSettings()`, que te deja
/// en los ajustes de la app aunque el problema sea el GPS del SO apagado o un
/// simple timeout del fix. Desde 2026-04-21 ramificamos en tres casos reales:
///
/// - [serviceDisabled]  → el switch de ubicación del SO está apagado
///                        → abrir "Location Settings" del SO.
/// - [permanentlyDenied] → el usuario marcó "No volver a preguntar" o bloqueó
///                        el permiso para siempre → abrir "App Settings".
/// - [retry]             → denegación simple, error transitorio, timeout de
///                        `getCurrentPosition` o `lastKnownPosition == null`
///                        → volver a disparar `LocationEvent.checkLocation()`.
enum _NoLocationCase { serviceDisabled, permanentlyDenied, retry }

class CurrentLocationButton extends StatelessWidget {
  final bool isSocialFeature;

  const CurrentLocationButton({super.key, this.isSocialFeature = false});

  @override
  Widget build(BuildContext context) {
    // Outer builder: rebuild when LocationBloc emits (e.g., locationChecked
    // after GPS resolves), so the imperatively-read hasLocationData is current.
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        final isChecking = locationState.maybeWhen(
          initial: () => true,
          checkingLocation: () => true,
          orElse: () => false,
        );

        // Ramificación por estado del bloc SOLO para el caso "no tengo ubicación".
        // Mantener `orElse → retry` a propósito: cubre permissionDenied (soft),
        // locationError, locationChecked-con-position-null (timeout del fix en
        // físico) y cualquier estado futuro que no sea bloqueo duro del SO.
        final noLocCase = locationState.maybeWhen(
          serviceDisabled: (_) => _NoLocationCase.serviceDisabled,
          permissionPermanentlyDenied: (_) => _NoLocationCase.permanentlyDenied,
          orElse: () => _NoLocationCase.retry,
        );

        return BlocBuilder<SmartSearchCubit, SmartSearchState>(
          builder: (context, state) {
            final locationService = di<LocationService>();
            final hasLocation = locationService.hasLocationData;

            // Precomputo de label/tooltip/icon del "no location" para no
            // duplicar switches entre Tooltip y Row.
            final String noLocLabel;
            final String noLocTooltip;
            final IconData noLocIcon;
            switch (noLocCase) {
              case _NoLocationCase.serviceDisabled:
                noLocLabel = S.current.enableLocation;
                noLocTooltip = S.current.enableLocationDescription;
                noLocIcon = Icons.location_disabled;
                break;
              case _NoLocationCase.permanentlyDenied:
                noLocLabel = S.current.allowLocationInSettings;
                noLocTooltip = S.current.allowLocationInSettingsDescription;
                noLocIcon = Icons.settings_outlined;
                break;
              case _NoLocationCase.retry:
                noLocLabel = S.current.retryLocation;
                noLocTooltip = S.current.retryLocationDescription;
                noLocIcon = Icons.refresh_rounded;
                break;
            }

            return Tooltip(
              message: isChecking
                  ? S.current.checkingLocation
                  : hasLocation
                      ? locationService.currentAddress.isNotEmpty == true
                          ? '${locationService.currentAddress}, ${locationService.currentCity}, ${locationService.currentZipCode}, ${locationService.currentCountry}.'
                          : '${locationService.currentCity}, ${locationService.currentZipCode}, ${locationService.currentCountry}.'
                      : noLocTooltip,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isChecking
                      ? null
                      : () async {
                          if (!hasLocation) {
                            // Acción específica por caso — NO caemos a App
                            // Settings para todo. Ver docstring de _NoLocationCase.
                            switch (noLocCase) {
                              case _NoLocationCase.serviceDisabled:
                                // GPS del SO apagado: abrir SWITCH de ubicación,
                                // no ajustes de la app (ahí no está el toggle).
                                locationService.awaitingSettingsReturn = true;
                                await Geolocator.openLocationSettings();
                                return;
                              case _NoLocationCase.permanentlyDenied:
                                // "No volver a preguntar": el único camino es
                                // que el usuario habilite el permiso manualmente.
                                locationService.awaitingSettingsReturn = true;
                                await Geolocator.openAppSettings();
                                return;
                              case _NoLocationCase.retry:
                                // Denegación suave, timeout del fix o estado
                                // transitorio: dispara el flujo de nuevo.
                                context.read<LocationBloc>().add(const LocationEvent.checkLocation());
                                return;
                            }
                          }

                          // Check if user is outside Foodly coverage and it matches their principal address
                          final outsideCoverage = !FoodlyCountries.hasCoverage(locationService.currentCountryCode);
                          final principalCountry =
                              di<AuthSessionService>().userSessionDM?.user.principalAddress?.country?.countryCode;
                          if (outsideCoverage &&
                              principalCountry != null &&
                              principalCountry.toUpperCase() == locationService.currentCountryCode.toUpperCase()) {
                            showFoodlyCoverageBottomSheet();
                            return;
                          }

                          if (!state.vm.smartSearchMode.isOff) {
                            if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            await Future.delayed(Durations.short2);
                          }

                          di<DialogService>().showCustomDialog(
                            ChangeLocationDialog(isSocialFeature: isSocialFeature),
                            2,
                            onDialogClose: () => context.read<SmartSearchCubit>().resetToInitial(),
                          );
                        },
                  borderRadius: BorderRadius.circular(10),
                  splashColor: FoodlyThemes.primaryFoodly.withValues(alpha: .5),
                  highlightColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ui.NeumorphicColors.embossMaxWhiteColor.withValues(alpha: .39),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                    child: isChecking
                        ? Row(
                            spacing: 9,
                            children: [
                              const SizedBox.square(
                                dimension: 19,
                                child: CircularProgressIndicator.adaptive(strokeWidth: 1.5),
                              ),
                              Expanded(
                                child: Text(
                                  S.current.checkingLocation,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: FoodlyTextStyles.captionBold,
                                ),
                              ),
                            ],
                          )
                        : hasLocation
                            ? Builder(builder: (_) {
                                final isOutsideCoverage =
                                    !FoodlyCountries.hasCoverage(locationService.currentCountryCode);
                                final userCountryCode =
                                    di<AuthSessionService>().userSessionDM?.user.principalAddress?.country?.countryCode;
                                final matchesPrincipal = userCountryCode != null &&
                                    userCountryCode.toUpperCase() == locationService.currentCountryCode.toUpperCase();
                                final showCoverageInfo = isOutsideCoverage && matchesPrincipal;

                                return Row(
                                  spacing: 9,
                                  children: [
                                    Icon(
                                      showCoverageInfo ? Bootstrap.info_circle : Icons.edit_location_outlined,
                                      color: showCoverageInfo ? FoodlyThemes.error : FoodlyThemes.primaryFoodly,
                                      size: 23,
                                    ),
                                    Expanded(
                                      child: Text(
                                        showCoverageInfo
                                            ? S.current.outsideCoverage
                                            : locationService.currentAddress.isNotEmpty == true
                                                ? '${locationService.currentAddress}, ${locationService.currentCity}.'
                                                : '${locationService.currentCity} ${locationService.currentZipCode}.',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: FoodlyTextStyles.captionBold.copyWith(
                                          fontSize: 11.3,
                                          color: showCoverageInfo ? FoodlyThemes.error : null,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              })
                            : Row(
                                spacing: 9,
                                children: [
                                  Icon(
                                    noLocIcon,
                                    color: FoodlyThemes.error,
                                    size: 23,
                                  ),
                                  Expanded(
                                    child: Text(
                                      noLocLabel,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: FoodlyTextStyles.captionBold.copyWith(color: FoodlyThemes.error),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ).paddingRight(6),
              ),
            );
          },
        );
      },
    );
  }
}

class ChangeLocationDialog extends StatefulWidget {
  final bool isSocialFeature;

  const ChangeLocationDialog({super.key, this.isSocialFeature = false});

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
    Future.delayed(Durations.short2, () {
      di<NearbyPromotionsCubit>().load();
      di<NewReleasesCubit>().load();
      if (widget.isSocialFeature) {
        di<SocialCubit>()
          ..loadPosts()
          ..loadBuzz()
          ..loadNearbyUsers();
      }
    });
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
                                Future.delayed(Durations.short2, () {
                                  di<NearbyPromotionsCubit>().load();
                                  di<NewReleasesCubit>().load();
                                });
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
                                          '${locationDM.address ?? ''}, ${locationDM.city ?? ''} ${locationDM.zipCode != null ? ', ${locationDM.zipCode}' : ''}',
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
                                Future.delayed(Durations.short2, () {
                                  di<NearbyPromotionsCubit>().load();
                                  di<NewReleasesCubit>().load();
                                });
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
                                    '${authSessionService.userSessionDM?.user.principalAddress?.address ?? '-'}, ${authSessionService.userSessionDM?.user.principalAddress?.city ?? '-'} ${authSessionService.userSessionDM?.user.principalAddress?.zipCode != null ? ', ${authSessionService.userSessionDM?.user.principalAddress?.zipCode}' : ''}',
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
