import 'dart:async' show Timer;

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
  bool _splashRemoved = false;
  bool _dialogShowing = false;
  Timer? _safetyTimer;

  @override
  void initState() {
    super.initState();
    _locationService = di<LocationService>();
    _dialogService = di<DialogService>();
    WidgetsBinding.instance.addObserver(this);

    // Delay location check to after the first frame so biometric auth
    // (which is initialized in LocalAuthCubit's constructor) has a chance to
    // set isBiometricLoginInProgress. On Android, two system dialogs can't
    // coexist — requesting location permission while biometric is showing
    // would dismiss the biometric dialog.
    if (_locationService.mustFetchLocation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (di<AuthSessionService>().isBiometricLoginInProgress) return;
        context.read<LocationBloc>().add(const LocationEvent.checkLocation());
      });
    }

    // Safety net: force-remove splash after 8 seconds regardless of state.
    _safetyTimer = Timer(const Duration(seconds: 8), _tryRemoveSplash);
  }

  @override
  void dispose() {
    _safetyTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-check location ONLY when the user explicitly tapped "Open Settings"
    // and returns. This prevents infinite loops caused by checkLocation()
    // opening a system dialog, which backgrounds the app, which triggers
    // resumed, which fires checkLocation() again.
    if (state == AppLifecycleState.resumed && _locationService.awaitingSettingsReturn) {
      _locationService.awaitingSettingsReturn = false;
      context.read<LocationBloc>().add(const LocationEvent.checkLocation());
    }
  }

  /// Single point of splash + loading dismissal. Idempotent — safe to call
  /// from multiple listeners. The 2 calls in foodly_wrapper.dart (LocalAuth
  /// error paths) remain independent since this widget may be unmounted.
  void _tryRemoveSplash() {
    if (_splashRemoved) return;
    _splashRemoved = true;
    _safetyTimer?.cancel();
    if (mounted) _dialogService.hideLoading();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        state.whenOrNull(
          checkingLocation: () => mounted ? _dialogService.showLoading() : null,
          locationChecked: (locationDM) {
            _locationService.updateLocation(locationDM);
            _tryRemoveSplash();
            // Always dismiss loading — showLoading() can fire multiple times
            // (e.g. after returning from settings) but _tryRemoveSplash() only
            // runs once.
            if (mounted) _dialogService.hideLoading();

            di<NearbyPromotionsCubit>().load();
            di<NewReleasesCubit>().load();
          },
          serviceDisabled: (message) {
            _tryRemoveSplash();
            if (mounted) _dialogService.hideLoading();
            if (mounted) FoodlySnackbars.errorGeneric(context, message);
          },
          permissionDenied: (message) {
            _locationService.markInitialized();
            _tryRemoveSplash();
            if (mounted) _dialogService.hideLoading();
            if (mounted) _showLocationPermissionDialog(context, message);
          },
          permissionPermanentlyDenied: (message) {
            _locationService.markInitialized();
            _tryRemoveSplash();
            if (mounted) _dialogService.hideLoading();
            if (mounted) _showLocationPermissionDialog(context, message);
          },
        );
      },
      builder: (context, state) => _buildContent(),
    );
  }

  void _showLocationPermissionDialog(BuildContext context, String message) {
    if (_dialogShowing) return;
    _dialogShowing = true;

    final navContext = rootNavigatorKey.currentContext;
    if (navContext == null) {
      _dialogShowing = false;
      return;
    }

    final savedUser = di<AuthSessionService>().userSessionDM?.user;
    final hasSavedAddress = savedUser?.principalAddress?.latitude != null;

    showDialog(
      context: navContext,
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
            onPressed: () => Navigator.of(navContext).pop(),
            child: Text(MaterialLocalizations.of(navContext).cancelButtonLabel),
          ),
          if (hasSavedAddress)
            TextButton(
              onPressed: () {
                Navigator.of(navContext).pop();
                _locationService.updateLocationUserDM(savedUser!);
                context.read<LocationBloc>().add(
                      LocationEvent.setManualLocation(_locationService.currentLocation),
                    );
                di<NearbyPromotionsCubit>().load();
                di<NewReleasesCubit>().load();
              },
              child: Text(S.current.useSavedLocation),
            ),
          TextButton(
            onPressed: () {
              _locationService.awaitingSettingsReturn = true;
              Navigator.of(navContext).pop();
              Geolocator.openAppSettings();
            },
            child: Text(S.current.openSettings),
          ),
        ],
      ),
    ).then((_) => _dialogShowing = false);
  }

  Widget _buildContent() => BlocListener<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (_) => _tryRemoveSplash(),
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
