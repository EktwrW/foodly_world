import 'dart:async' show StreamSubscription, Timer;

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
  StreamSubscription<LocalAuthState>? _localAuthSub;

  @override
  void initState() {
    super.initState();
    _locationService = di<LocationService>();
    _dialogService = di<DialogService>();
    WidgetsBinding.instance.addObserver(this);

    // Defer location check until after biometric auth resolves.
    // LocalAuthCubit sets isBiometricLoginInProgress=true synchronously in its
    // constructor for logged-in users, so the flag is visible by the time this
    // postFrameCallback fires (~16ms / frame 1). Without this deferral the OS
    // would show the location-permission dialog on top of the biometric dialog,
    // cancelling the fingerprint/Face ID prompt.
    if (_locationService.mustFetchLocation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        // Guard: defer location check if biometric auth is active OR if
        // LocalAuthCubit is still mid-initialization (loading/needAuthentication).
        // Checking BOTH the service flag AND the cubit state handles the edge
        // case where isBiometricLoginInProgress was not yet set (e.g. the
        // async detection chain is still running when this callback fires).
        final localAuthCubit = context.read<LocalAuthCubit>();
        final biometricActive = di<AuthSessionService>().isBiometricLoginInProgress ||
            (localAuthCubit.state.whenOrNull(
                  loading: (_) => true,
                  needAuthentication: (_) => true,
                ) ??
                false);

        if (!biometricActive) {
          context.read<LocationBloc>().add(const LocationEvent.checkLocation());
        } else {
          // Subscribe to LocalAuthCubit and fire the location check once auth
          // resolves. This covers both outcomes:
          //   • loaded        — biometrics not available; guard already cleared.
          //   • authenticated — biometric succeeded; safe to request location.
          // error state is intentionally omitted: FoodlyWrapper handles it by
          // navigating to login, so a location dialog would be wrong UX there.
          _localAuthSub = localAuthCubit.stream.listen((state) {
            state.whenOrNull(
              loaded: (_) => _fireLocationCheckAfterAuth(),
              authenticated: (_) => _fireLocationCheckAfterAuth(),
            );
          });
        }
      });
    }

    // Safety net: force-remove splash after 8 seconds regardless of state.
    // Also calls hideLoading() directly in case _splashRemoved was already set
    // (e.g. FavoritesCubit.loaded fired before checkingLocation), which makes
    // _tryRemoveSplash() a no-op but leaves the spinner stuck on web.
    _safetyTimer = Timer(const Duration(seconds: 8), () {
      _tryRemoveSplash();
      if (mounted) _dialogService.hideLoading();
    });
  }

  @override
  void dispose() {
    _safetyTimer?.cancel();
    _localAuthSub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _fireLocationCheckAfterAuth() {
    _localAuthSub?.cancel();
    _localAuthSub = null;
    if (!mounted) return;
    context.read<LocationBloc>().add(const LocationEvent.checkLocation());
  }

  /// Hides the loading overlay once both home cubits have finished their
  /// initial load (or after a 5-second safety timeout). Must be called
  /// BEFORE [NearbyPromotionsCubit.load] / [NewReleasesCubit.load] so the
  /// stream subscriptions are set up before the loading states are emitted.
  Future<void> _hideLoadingAfterCubits() async {
    try {
      await Future.wait([
        di<NearbyPromotionsCubit>()
            .stream
            .firstWhere((s) => s.maybeWhen(loading: (_) => false, orElse: () => true))
            .timeout(const Duration(seconds: 5)),
        di<NewReleasesCubit>()
            .stream
            .firstWhere((s) => s.maybeWhen(loading: (_) => false, orElse: () => true))
            .timeout(const Duration(seconds: 5)),
      ]);
    } catch (_) {}
    if (mounted) _dialogService.hideLoading();
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
            // Subscribe to cubit streams BEFORE calling load() so we don't miss
            // the loading→loaded transition. The spinner stays visible until both
            // cubits finish, preventing the 1-second home-page flash.
            _hideLoadingAfterCubits();
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
