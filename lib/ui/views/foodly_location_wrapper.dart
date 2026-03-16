import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:geolocator/geolocator.dart' show Geolocator;

class FoodlyLocationWrapper extends StatefulWidget {
  final Widget childWidget;

  const FoodlyLocationWrapper({super.key, required this.childWidget});

  @override
  State<FoodlyLocationWrapper> createState() => _FoodlyLocationWrapperState();
}

class _FoodlyLocationWrapperState extends State<FoodlyLocationWrapper> with WidgetsBindingObserver {
  late final LocationService _locationService;
  late final DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _locationService = di<LocationService>();
    _dialogService = di<DialogService>();
    WidgetsBinding.instance.addObserver(this);

    if (_locationService.mustFetchLocation) {
      context.read<LocationBloc>().add(const LocationEvent.checkLocation());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // When the user returns from system settings after granting location,
    // re-run the location check so the button and feeds update automatically.
    if (state == AppLifecycleState.resumed && !_locationService.hasLocationData) {
      context.read<LocationBloc>().add(const LocationEvent.checkLocation());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        state.whenOrNull(
          checkingLocation: () => mounted ? _dialogService.showLoading() : null,
          locationChecked: (locationDM) {
            // updateLocation also fires the locationChanged stream, which
            // CategoriesPage subscribes to for its own refresh.
            _locationService.updateLocation(locationDM);

            final favsState = context.read<FavoritesCubit>().state;

            if (favsState == FavoritesState.loaded(favsState.vm)) {
              if (mounted) _dialogService.hideLoading();
              FlutterNativeSplash.remove();
            }

            // Reload location-based home feeds (handles both initial startup
            // and the case where permission was granted after denial).
            di<NearbyPromotionsCubit>().load();
            di<NewReleasesCubit>().load();
          },
          serviceDisabled: (message) {
            if (mounted) _dialogService.hideLoading();
            FlutterNativeSplash.remove();
            if (mounted) FoodlySnackbars.errorGeneric(context, message);
          },
          permissionDenied: (message) {
            if (mounted) _dialogService.hideLoading();
            FlutterNativeSplash.remove();
            if (mounted) _showLocationPermissionDialog(context, message);
          },
          permissionPermanentlyDenied: (message) {
            if (mounted) _dialogService.hideLoading();
            FlutterNativeSplash.remove();
            if (mounted) _showLocationPermissionDialog(context, message);
          },
        );
      },
      builder: (context, state) => _buildContent(),
    );
  }

  void _showLocationPermissionDialog(BuildContext context, String message) {
    final savedUser = di<AuthSessionService>().userSessionDM?.user;
    final hasSavedAddress = savedUser?.principalAddress?.latitude != null;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(S.current.locationRationaleTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 12),
            Text(
              S.current.locationRationaleBody,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          if (hasSavedAddress)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _locationService.updateLocationUserDM(savedUser!);
                di<NearbyPromotionsCubit>().load();
                di<NewReleasesCubit>().load();
              },
              child: Text(S.current.useSavedLocation),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Geolocator.openAppSettings();
            },
            child: Text(S.current.openSettings),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() => BlocListener<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (vm) async {
              if (!_locationService.mustFetchLocation) {
                if (mounted) _dialogService.hideLoading();
                FlutterNativeSplash.remove();
              } else {
                await Future.delayed(const Duration(seconds: 10), () {
                  if (mounted) _dialogService.hideLoading();
                  FlutterNativeSplash.remove();
                });
              }
            },
          );
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
            child: widget.childWidget,
          ),
        ),
      );
}
