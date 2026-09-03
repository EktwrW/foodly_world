import 'dart:async' show StreamSubscription, Timer;

import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_state.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_state.dart';
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

  /// Watchdog del path "esperando a `LocalAuthCubit`". Ver
  /// `_scheduleBiometricSafetyCheck` para el racional completo.
  Timer? _biometricSafetyTimer;

  /// Flag de idempotencia para `_fireLocationCheckAfterAuth`. El método
  /// puede ser invocado por dos rutas concurrentes (el listener del
  /// `LocalAuthCubit` y el `_biometricSafetyTimer`); sin esta guard,
  /// `LocationBloc` podría recibir el mismo evento `checkLocation` dos
  /// veces y disparar dos prompts de permiso (o re-arrancar el flow a
  /// mitad de camino). El bool queda en `true` para todo el ciclo de
  /// vida del wrapper porque `checkLocation` solo se dispara una vez
  /// post-login; re-checks posteriores van por `didChangeAppLifecycleState`,
  /// que no usa este path.
  bool _locationCheckDispatched = false;

  @override
  void initState() {
    super.initState();
    _locationService = di<LocationService>();
    _dialogService = di<DialogService>();
    WidgetsBinding.instance.addObserver(this);

    // Defer location check until after BOTH permission flows that precede
    // it have resolved:
    //   1. Push notification permission (Android 13+ POST_NOTIFICATIONS +
    //      iOS authorizationStatus). Fired fire-and-forget from main.dart
    //      at startup. Android does not queue permission dialogs — asking
    //      for location while the push dialog is still on screen is
    //      silently denied without ever showing the location dialog.
    //      Saw this live on fresh installs during the 2026-04-20 smoke
    //      tests: "pide permiso de notificaciones, apruebo, y luego no
    //      me pide permiso de localizacion".
    //   2. Biometric auth. LocalAuthCubit sets isBiometricLoginInProgress
    //      synchronously in its constructor for logged-in users, so the
    //      flag is visible by the time the postFrameCallback fires
    //      (~16ms / frame 1). Without this deferral the OS would show the
    //      location-permission dialog on top of the biometric dialog,
    //      cancelling the fingerprint/Face ID prompt.
    if (_locationService.mustFetchLocation) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        // Esperamos a que el flujo de permiso de notificaciones TERMINE
        // realmente (usuario tocó Permitir/Denegar, o el plugin no tenía
        // nada que preguntar). SIN timeout arbitrario: Android no encola
        // diálogos de permiso, y un timeout corto hacía fall-through antes
        // de que el usuario respondiera, disparando el diálogo de
        // localización en paralelo → Android silenciaba el segundo y el
        // usuario nunca veía el prompt de ubicación. El safety-net contra
        // cuelgue del plugin vive dentro del service (timer de 120 s), así
        // que acá no necesitamos defensa adicional. El try/catch solo cubre
        // que el servicio exista en DI.
        try {
          await di<PushNotificationService>().permissionFlowComplete;
        } catch (_) {
          // Service missing — fall through.
        }
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
          _locationCheckDispatched = true;
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

          // Safety net contra cuelgue eterno del wrapper. Ver docblock de
          // `_scheduleBiometricSafetyCheck` para el racional. TL;DR: si el
          // user ignora el botón de biometría y se loguea por otro path
          // (email+password, Google, Apple), `LocalAuthCubit` se queda en
          // `needAuthentication` para siempre y el listener de arriba nunca
          // dispara — sin este timer el `LocationBloc` jamás recibe
          // `checkLocation` y la home queda en "Checking location..." eterno.
          _scheduleBiometricSafetyCheck();
        }
      });
    }

    // Safety net: force-remove splash after 8 seconds regardless of state.
    // Also calls hideLoading() directly in case _splashRemoved was already set
    // (e.g. FavoritesCubit.loaded fired before checkingLocation), which makes
    // _tryRemoveSplash() a no-op but leaves the spinner stuck on web.
    _safetyTimer = Timer(const Duration(seconds: 16), () {
      _tryRemoveSplash();
      if (mounted) _dialogService.hideLoading();
    });
  }

  @override
  void dispose() {
    _safetyTimer?.cancel();
    _biometricSafetyTimer?.cancel();
    _localAuthSub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _fireLocationCheckAfterAuth() {
    // Idempotente: el listener del `LocalAuthCubit` y el
    // `_biometricSafetyTimer` pueden llegar acá concurrentemente
    // (ej. el user toca biometric a los 7.9 s, justo antes del tick
    // del timer a los 8 s). Sin la flag, el `LocationBloc` recibiría
    // dos eventos `checkLocation` consecutivos y podría disparar dos
    // prompts de permiso o re-arrancar el flow a mitad del primero.
    if (_locationCheckDispatched) return;
    _locationCheckDispatched = true;

    _localAuthSub?.cancel();
    _localAuthSub = null;
    _biometricSafetyTimer?.cancel();
    _biometricSafetyTimer = null;

    if (!mounted) return;
    context.read<LocationBloc>().add(const LocationEvent.checkLocation());
  }

  /// Watchdog para destrabar el wrapper cuando el user se loguea por un
  /// path que NO involucra `LocalAuthCubit.authenticate()`.
  ///
  /// **Por qué existe (bug 2026-05-18 — reproducido en Razr 50 Ultra):**
  /// `LocalAuthCubit.initializeLocalAuth()` emite `_NeedAuthentication`
  /// cuando detecta sesión guardada + biometría disponible, esperando
  /// que el user toque el botón de huella. Si en lugar de eso el user
  /// elige otro path de login (email+password, Google Sign-In, Apple
  /// Sign-In), `StartingCubit` procesa el login y llama
  /// `AuthSessionService.setSession(...)` — pero el `LocalAuthCubit`
  /// **no escucha al service** y queda eterno en `_NeedAuthentication`.
  /// El listener de arriba (`loaded`/`authenticated`) nunca dispara,
  /// `LocationBloc` jamás recibe `checkLocation`, el `LocationService`
  /// queda virgen, los cubits downstream emiten "Location not available"
  /// vía su poll de 3s, y la home queda colgada en "Checking location..."
  /// porque el `_safetyTimer` (16s) lo cancela `FavoritesCubit.loaded`
  /// vía `_tryRemoveSplash`, pero `_dialogService.hideLoading()` jamás
  /// se invoca.
  ///
  /// **Cómo se destraba:** cada 8 s revisamos `LocalAuthCubit.isAuthInProgress`
  /// (proxy de `_dto.isAuthenticating`, ver getter en `local_auth_cubit.dart`).
  /// Este flag se setea SÍNCRONAMENTE en `authenticate()` línea 114, o sea
  /// apenas el user toca el botón biométrico. Es el único discriminador real
  /// entre "user va a usar biometría" y "user la ignoró".
  ///
  ///   - `true`  → hay un `authenticate()` real corriendo (user tocó el botón
  ///              y el OS está mostrando el prompt / esperando huella).
  ///              Reagendamos otros 8 s para dar margen — el prompt puede
  ///              tardar si el user tiene huella sucia, varios intentos
  ///              fallidos, etc. El listener del `LocalAuthCubit` disparará
  ///              `_fireLocationCheckAfterAuth` cuando termine.
  ///   - `false` → el cubit lleva 8 s en `_NeedAuthentication` sin que el
  ///              user haya tocado el botón. Asumimos que eligió otro path
  ///              de login y disparamos `_fireLocationCheckAfterAuth()`.
  ///
  /// **Por qué NO usar `_authSessionService.isBiometricLoginInProgress`:**
  /// ese flag se setea síncronamente en `initializeLocalAuth` cuando hay
  /// sesión guardada, ANTES de que el user toque nada. Permanece `true`
  /// mientras el cubit está en `_NeedAuthentication`, así que en el caso
  /// del bug (user nunca toca el botón) la flag está `true` y un timer
  /// que la mire reagendaría para siempre sin destrabar. `isAuthInProgress`
  /// es el discriminador correcto porque solo cambia con `authenticate()`.
  ///
  /// **8 segundos** es un compromiso: largo para no interferir con un user
  /// que SÍ va a usar biometría (después de `isAuthInProgress=true` damos
  /// otros 8 s, que es de sobra para un prompt biométrico normal — y el
  /// listener dispara antes que el timer si todo va bien), y corto para
  /// que la home no se sienta colgada. Si fuera más corto arriesgaríamos
  /// disparar `checkLocation` mientras el user piensa qué hacer, mostrando
  /// el dialog de location encima del welcome screen — UX confusa.
  void _scheduleBiometricSafetyCheck() {
    _biometricSafetyTimer?.cancel();
    _biometricSafetyTimer = Timer(const Duration(seconds: 8), () {
      if (!mounted || _locationCheckDispatched) return;

      // `context.read` puede fallar si el widget está en proceso de
      // unmount entre el `mounted` check y este acceso. Defensivo.
      if (!context.mounted) return;
      final cubit = context.read<LocalAuthCubit>();

      if (cubit.isAuthInProgress) {
        // `authenticate()` real corriendo — reagendar.
        _scheduleBiometricSafetyCheck();
        return;
      }

      // 8 s sin que el user tocara el botón biométrico → eligió otro path
      // (email+password / Google / Apple) → destrabar.
      _fireLocationCheckAfterAuth();
    });
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
            .timeout(const Duration(seconds: 9)),
        di<NewReleasesCubit>()
            .stream
            .firstWhere((s) => s.maybeWhen(loading: (_) => false, orElse: () => true))
            .timeout(const Duration(seconds: 9)),
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
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        state.whenOrNull(
          // initial: () => _dialogService.isDialogShown ? null : _dialogService.showLoading(),
          // checkingLocation: () => _dialogService.isDialogShown ? null : _dialogService.showLoading(),
          locationChecked: (locationDM) async {
            // El bloc emite dos veces por arranque: la última posición conocida
            // (al instante) y el fix preciso (segundos después). Se recarga
            // con la primera; la segunda solo si movió el mapa de verdad.
            final before = _locationService.hasLocationData ? _locationService.currentLocation.position : null;
            final reload = !_locationService.hasLocationData ||
                LocationService.movedSignificantly(before, locationDM.position);
            _locationService.updateLocation(locationDM);
            if (!reload) {
              _tryRemoveSplash();
              return;
            }
            // Subscribe to cubit streams BEFORE calling load() so we don't miss
            // the loading→loaded transition. The spinner stays visible until both
            // cubits finish, preventing the 1-second home-page flash.
            _hideLoadingAfterCubits();
            await Future.wait([
              di<NearbyPromotionsCubit>().load(),
              di<NewReleasesCubit>().load(),
            ]);
            _tryRemoveSplash();
          },
          serviceDisabled: (message) {
            _tryRemoveSplash();
            if (_dialogService.isDialogShown) _dialogService.hideLoading();
            if (mounted) FoodlySnackbars.errorGeneric(context, message);
          },
          permissionDenied: (message) {
            _locationService.markInitialized();
            _tryRemoveSplash();
            if (_dialogService.isDialogShown) _dialogService.hideLoading();
            if (mounted) _showLocationPermissionDialog(context, message);
          },
          permissionPermanentlyDenied: (message) {
            _locationService.markInitialized();
            _tryRemoveSplash();
            if (_dialogService.isDialogShown) _dialogService.hideLoading();
            if (mounted) _showLocationPermissionDialog(context, message);
          },
        );
      },
      builder: (context, state) => _buildContent(),
    );
  }

  void _showLocationPermissionDialog(BuildContext context, String message) {
    if (_dialogShowing) return;
    setState(() => _dialogShowing = true);

    final navContext = rootNavigatorKey.currentContext;
    if (navContext == null) {
      setState(() => _dialogShowing = false);
      return;
    }

    final savedUser = di<AuthSessionService>().userSessionDM?.user;
    final hasSavedAddress = savedUser?.principalAddress?.latitude != null;

    showDialog(
      context: navContext,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: .69),
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
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
              Navigator.of(navContext).pop();
              if (kIsWeb) {
                // Web doesn't have a native "settings" deep link. The
                // geolocator_web plugin throws `UnsupportedError` if we
                // call `openAppSettings()`. Instead we tell the user how
                // to grant the permission themselves — the lock icon in
                // the address bar is the universal entry point across
                // Chrome / Safari / Firefox / Edge.
                FoodlySnackbars.infoGeneric(
                  navContext,
                  S.current.locationPermissionWebInstructions,
                );
              } else {
                _locationService.awaitingSettingsReturn = true;
                Geolocator.openAppSettings();
              }
            },
            child: Text(S.current.openSettings),
          ),
        ],
      ),
    ).whenComplete(() {
      setState(() => _dialogShowing = false);
    });
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
