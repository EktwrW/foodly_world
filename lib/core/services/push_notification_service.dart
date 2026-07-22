// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/device_tokens/device_token_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Top-level background-message handler. Required to be a static/top-level
/// function by firebase_messaging — Flutter spawns a background isolate for
/// this callback so we CANNOT access any state from the main isolate (no
/// GetIt, no BLoC, etc.).
///
/// For our case, the system shows the notification automatically (because we
/// populate `notification` on the server side), so we just let FCM do its
/// thing. We don't need to do any work here — this handler exists only to
/// satisfy the API contract and to give us a hook if we ever need it.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Intentionally empty. See comment above.
}

/// FE side of the FCM push pipeline.
///
/// Lifecycle:
///  1. [initialize] — called ONCE at app startup from main.dart, after
///     Firebase.initializeApp. Registers background handler, configures
///     foreground presentation, wires local notifications, and sets up
///     onMessage / onMessageOpenedApp / onTokenRefresh listeners.
///  2. [registerCurrentToken] — called after login / session restore.
///     Fetches current FCM token and POSTs it to the BE.
///  3. [unregisterCurrentToken] — called on logout. DELETEs token from BE
///     and calls [FirebaseMessaging.deleteToken] so the app stops receiving.
///
/// Silent-failure-by-design everywhere: if Firebase isn't available (e.g.
/// simulator without FCM support, missing APNs entitlement, revoked
/// notification permission), the service logs and moves on without ever
/// throwing to the caller.
class PushNotificationService with WidgetsBindingObserver {
  final DeviceTokenRepo _deviceTokenRepo;
  final Logger _logger;

  String? _currentToken;
  bool _initialized = false;
  StreamSubscription<String>? _onTokenRefreshSub;
  StreamSubscription<RemoteMessage>? _onMessageSub;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSub;

  /// Reentrancy guard for [registerCurrentToken].
  ///
  /// Two callers can invoke this simultaneously:
  ///   - [AuthSessionService.initializeNotifications] after a successful login.
  ///   - The [FirebaseMessaging.onTokenRefresh] listener wired below — FCM
  ///     can fire a rotation callback while the initial [getToken] is still
  ///     in flight on the very first login on a device.
  ///
  /// Before the BE moved to `ON CONFLICT DO UPDATE`, these concurrent calls
  /// raced on the unique index `device_tokens_fcm_token_unique` and one of
  /// the two requests returned 500 (the other succeeded, so the token WAS
  /// registered, but Cloud Run's error log filled with phantom 500s). The
  /// BE is now idempotent, so this guard is a belt-and-suspenders fix: even
  /// with an idempotent BE we save a network round-trip and avoid duplicated
  /// log entries by collapsing concurrent calls into a single in-flight
  /// request. Any caller arriving while a register is in flight simply
  /// awaits the same future.
  Future<void>? _inFlightRegister;

  /// Completes as soon as the OS-level notification permission dialog flow
  /// is finished (user approved, denied, or the platform had nothing to ask).
  /// Other parts of the app — specifically [FoodlyLocationWrapper] — MUST
  /// await this before requesting additional runtime permissions. Android
  /// does not queue permission dialogs: a second `requestPermission` call
  /// while the POST_NOTIFICATIONS dialog is still on screen is silently
  /// denied without ever showing the second dialog, which is what bricked
  /// the location flow on fresh installs during the 2026-04-20 smoke tests.
  final Completer<void> _permissionFlowCompleter = Completer<void>();
  Future<void> get permissionFlowComplete => _permissionFlowCompleter.future;

  /// Safety-net timer — libera el completer si algo catastrófico impide que
  /// [_completePermissionFlow] se dispare por los caminos normales (e.g. el
  /// plugin Android 13+ nunca resuelve `requestNotificationsPermission`, que
  /// es el único escenario razonable donde el usuario aprobó pero el future
  /// jamás completa). El valor (120 s) está deliberadamente sobredimensionado
  /// para que **nunca** le gane a un usuario tardando en leer el diálogo —
  /// ése es el antipatrón que queremos evitar: timeouts cortos (5 s) hacían
  /// fall-through antes de que el usuario tocara Permitir, disparando el
  /// diálogo de localización en paralelo y haciendo que Android silenciara
  /// el segundo. Este timer SOLO cubre el bug del plugin. Iniciado en
  /// [initialize] y cancelado en cuanto el flujo completa por otra vía.
  Timer? _permissionFlowSafetyTimer;

  void _completePermissionFlow() {
    _permissionFlowSafetyTimer?.cancel();
    _permissionFlowSafetyTimer = null;
    if (!_permissionFlowCompleter.isCompleted) _permissionFlowCompleter.complete();
  }

  /// Android foreground notification channel. Must match the channel id the
  /// BE (or the Notification SDK) puts in the payload.
  static const AndroidNotificationChannel _androidChannel = AndroidNotificationChannel(
    'foodly_default',
    'Foodly notifications',
    description: 'Reservations, messages, quotes, and community updates.',
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  PushNotificationService({
    required DeviceTokenRepo deviceTokenRepo,
    required Logger logger,
  })  : _deviceTokenRepo = deviceTokenRepo,
        _logger = logger;

  String? get currentToken => _currentToken;

  /// Idempotent — safe to call multiple times. Subsequent calls return early.
  Future<void> initialize() async {
    if (_initialized) {
      // Defensive: a second call before the first one settled the completer
      // (unlikely but possible if main() races) must still unblock awaiters.
      _completePermissionFlow();
      return;
    }
    if (kIsWeb) {
      // Web push is possible but requires a VAPID key + service worker
      // registration. Phase 2 — no-op for now.
      _initialized = true;
      _completePermissionFlow();
      return;
    }

    // Observamos cambios de locale del OS para re-registrar el DeviceToken
    // cuando el usuario cambia el idioma del sistema con la app abierta
    // (ver [didChangeLocales]). Lo hacemos FUERA del try/catch de Firebase:
    // aunque la init de FCM falle, seguimos queriendo reflejar el idioma del
    // sistema en el token para que el BE traduzca bien las notificaciones.
    WidgetsBinding.instance.addObserver(this);

    try {
      // Safety-net de último recurso para el completer. Cubre ÚNICAMENTE el
      // escenario donde el plugin de permisos queda colgado (i.e.
      // requestNotificationsPermission en Android 13+ no resuelve nunca).
      // 120 s es deliberadamente mucho más grande que cualquier ventana
      // razonable de interacción del usuario con el diálogo — el objetivo es
      // NO penalizar al usuario por leer despacio. Se cancela en cuanto
      // [_completePermissionFlow] dispare por el camino normal.
      _permissionFlowSafetyTimer = Timer(const Duration(seconds: 120), () {
        _logger.w('PushNotificationService permission flow safety timer fired — releasing completer (possible plugin hang)');
        _completePermissionFlow();
      });

      // Background handler MUST be registered before any other listener.
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      final messaging = FirebaseMessaging.instance;

      // iOS: request notification permission (Android 13+ handled separately
      // via the local_notifications plugin below).
      final settings = await messaging.requestPermission();
      _logger.i('FCM permission status: ${settings.authorizationStatus}');

      // Foreground presentation: iOS shows the system banner even when the app
      // is in the foreground. Android we handle via flutter_local_notifications
      // because the OS suppresses foreground notifications by default.
      await messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      // Android 13+ POST_NOTIFICATIONS permission + create the channel.
      if (!kIsWeb && Platform.isAndroid) {
        await _localNotifications
            .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission();
        await _localNotifications
            .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(_androidChannel);
      }

      // Permission dialog flow is now finished on both platforms. Signal
      // BEFORE the remaining wiring (local_notifications.initialize,
      // listeners, onTokenRefresh, getInitialMessage) so the location
      // permission prompt can unblock as soon as possible — those later
      // steps don't surface any OS dialog and can finish asynchronously
      // while the user deals with the location dialog.
      _completePermissionFlow();

      // v21 API — initialize() takes all named parameters; `settings` (not
      // the old positional InitializationSettings) is now required.
      await _localNotifications.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false, // already asked above via FCM
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
        onDidReceiveNotificationResponse: (response) {
          // User tapped a foreground local notification we displayed.
          // The payload is the URL-encoded k=v string we stashed on show.
          _handleMessageTap(_decodePayload(response.payload));
        },
      );

      // Terminated-state tap: check if the app was opened by tapping a push.
      final initial = await messaging.getInitialMessage();
      if (initial != null) {
        _logger.i('FCM initial message (terminated tap): ${initial.messageId}');
        _handleMessageTap(initial.data);
      }

      // Foreground: show a local notification so the user sees it without
      // being in-app blind. iOS already shows it thanks to
      // setForegroundNotificationPresentationOptions, but the local plugin
      // gives us a consistent onTap hook on both platforms.
      _onMessageSub = FirebaseMessaging.onMessage.listen((message) {
        _logger.d('FCM foreground message: ${message.messageId} data=${message.data}');
        _showForegroundLocalNotification(message);
        // Also refresh in-app notifications cubit so the badge updates.
        _bumpNotificationsCubit();
      });

      // Background (but app is alive) → user tapped the notification.
      _onMessageOpenedAppSub = FirebaseMessaging.onMessageOpenedApp.listen((message) {
        _logger.i('FCM tap (background): ${message.messageId} data=${message.data}');
        _handleMessageTap(message.data);
      });

      // Token rotations — re-register with BE whenever Firebase rotates.
      _onTokenRefreshSub = messaging.onTokenRefresh.listen((newToken) {
        _logger.i('FCM token refreshed');
        _currentToken = newToken;
        // Fire-and-forget — if the user is logged in, the BE header is set.
        unawaited(registerCurrentToken());
      });

      _initialized = true;
      _logger.i('PushNotificationService initialized');
    } catch (e, s) {
      // Swallow: push is best-effort. In-app notification remains source of truth.
      _logger.w('PushNotificationService.initialize failed', error: e, stackTrace: s);
      _initialized = true; // don't retry — most failures are permanent (missing entitlement etc.)
      // Must still release awaiters (location wrapper) — otherwise a broken
      // Firebase setup would freeze the "verificando ubicación" button
      // until the 5s timeout on the wrapper fires.
      _completePermissionFlow();
    }
  }

  /// Retrieves the current FCM token and POSTs it to the BE.
  ///
  /// Safe to call multiple times — server-side upsert by fcm_token makes it
  /// idempotent. Silently no-ops if the user isn't logged in (no auth header
  /// → BE returns 401 which we swallow).
  ///
  /// Reentrancy: concurrent calls collapse into a single in-flight request
  /// via [_inFlightRegister]. See the field docblock for the full rationale.
  Future<void> registerCurrentToken() async {
    if (kIsWeb) return; // Phase 2

    // Collapse concurrent callers onto a single future. The second caller
    // waits for (and reuses) the first caller's result instead of firing
    // its own POST. Cleared in the finally block below so a LATER call
    // (e.g. a real FCM rotation minutes after login) still goes through.
    final inFlight = _inFlightRegister;
    if (inFlight != null) {
      return inFlight;
    }

    final future = _registerCurrentTokenImpl();
    _inFlightRegister = future;
    try {
      await future;
    } finally {
      _inFlightRegister = null;
    }
  }

  Future<void> _registerCurrentTokenImpl() async {
    try {
      final messaging = FirebaseMessaging.instance;
      final token = await messaging.getToken();
      if (token == null || token.isEmpty) {
        _logger.w('FCM getToken returned empty — APNs entitlement missing?');
        return;
      }
      _currentToken = token;

      final platform = _resolvePlatform();
      final meta = await _collectDeviceMetadata();

      final result = await _deviceTokenRepo.register(
        fcmToken: token,
        platform: platform,
        deviceName: meta.deviceName,
        deviceModel: meta.deviceModel,
        appVersion: meta.appVersion,
        // Locale real del OS — ver FoodlyLocales.deviceLocaleTag para el
        // porqué de NO usar Intl.getCurrentLocale() acá.
        locale: FoodlyLocales.deviceLocaleTag,
      );

      result.when(
        success: (uuid) => _logger.i('Device token registered with BE (uuid=$uuid)'),
        failure: (e) => _logger.w('Device token register failed: ${e.error}'),
      );
    } catch (e, s) {
      _logger.w('registerCurrentToken error', error: e, stackTrace: s);
    }
  }

  /// DELETE on BE + FirebaseMessaging.deleteToken so the device rotates on
  /// next login. Called from the logout flow.
  Future<void> unregisterCurrentToken() async {
    if (kIsWeb) return;

    final token = _currentToken ?? await _safeGetToken();
    if (token == null || token.isEmpty) return;

    try {
      final result = await _deviceTokenRepo.unregister(fcmToken: token);
      result.when(
        success: (_) => _logger.i('Device token unregistered from BE'),
        failure: (e) => _logger.w('Device token unregister failed: ${e.error}'),
      );
    } catch (e, s) {
      _logger.w('unregisterCurrentToken BE error', error: e, stackTrace: s);
    }

    try {
      await FirebaseMessaging.instance.deleteToken();
      _currentToken = null;
    } catch (e, s) {
      _logger.w('FirebaseMessaging.deleteToken failed', error: e, stackTrace: s);
    }
  }

  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await _onTokenRefreshSub?.cancel();
    await _onMessageSub?.cancel();
    await _onMessageOpenedAppSub?.cancel();
    _onTokenRefreshSub = null;
    _onMessageSub = null;
    _onMessageOpenedAppSub = null;
    _permissionFlowSafetyTimer?.cancel();
    _permissionFlowSafetyTimer = null;
    _initialized = false;
  }

  /// El usuario cambió el idioma del sistema operativo con la app abierta.
  ///
  /// `DeviceToken.locale` (back-end) solo se refresca cuando se (re)registra
  /// el token — en login, restauración de sesión o token refresh de FCM. Sin
  /// este hook, cambiar el idioma del OS no actualizaba el token hasta el
  /// siguiente login, así que las notificaciones se seguían creando en el
  /// idioma viejo (el BE congela el idioma de cada notificación al crearla,
  /// leyendo `DeviceToken.locale`; ver `NotificationController::createNotification`).
  ///
  /// Re-registramos el token para que `locale` quede actualizado de
  /// inmediato. Fire-and-forget: si el usuario no está logueado el POST
  /// devuelve 401 y se traga silenciosamente (ver [registerCurrentToken]).
  @override
  void didChangeLocales(List<Locale>? locales) {
    _logger.i('OS locale changed → re-registering device token');
    unawaited(registerCurrentToken());
  }

  // ---------------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------------

  Future<String?> _safeGetToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (_) {
      return null;
    }
  }

  String _resolvePlatform() {
    if (kIsWeb) return 'web';
    if (Platform.isIOS) return 'ios';
    if (Platform.isAndroid) return 'android';
    return 'web'; // desktop falls back — BE only cares ios/android/web
  }

  Future<_DeviceMeta> _collectDeviceMetadata() async {
    String? name;
    String? model;
    String? version;
    try {
      final plugin = DeviceInfoPlugin();
      if (Platform.isIOS) {
        final info = await plugin.iosInfo;
        name = info.name;
        model = info.utsname.machine;
      } else if (Platform.isAndroid) {
        final info = await plugin.androidInfo;
        name = info.device;
        model = info.model;
      }
    } catch (_) {}
    try {
      version = (await PackageInfo.fromPlatform()).version;
    } catch (_) {}
    return _DeviceMeta(deviceName: name, deviceModel: model, appVersion: version);
  }

  void _showForegroundLocalNotification(RemoteMessage message) {
    final notif = message.notification;
    if (notif == null) return; // data-only push — nothing to show

    final androidDetails = AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    // v21 API — show() is fully named-parameter.
    _localNotifications.show(
      // Stable id bucketed by messageId hash — collisions here just mean a
      // later push replaces an earlier one, which is acceptable UX.
      id: message.messageId.hashCode,
      title: notif.title ?? '',
      body: notif.body ?? '',
      notificationDetails: NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: _encodePayload(message.data),
    );
  }

  void _bumpNotificationsCubit() {
    // NotificationsCubit polls every N seconds; when a push lands we
    // short-circuit that interval so the badge + list reflect the new
    // notification immediately. Safe to call even if the user just logged
    // out — the cubit's own guards will no-op.
    try {
      if (di.isRegistered<NotificationsCubit>()) {
        // Unawaited on purpose — errors bubble to the cubit's own handler.
        unawaited(di<NotificationsCubit>().refreshUnreadCount());
      }
    } catch (_) {}
  }

  /// Parse data payload → navigate to the right screen.
  /// Supported subTypes (mirrors BE Notification::SUBTYPE_*):
  ///  - reservation_*  → /my-reservations (customer) or manage-reservations (manager)
  ///  - message_*      → same, scoped to the reservation thread
  ///  - quote_*        → same, opens the quote UI
  void _handleMessageTap(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return;
    _logger.i('Push tap deeplink data: $data');

    final subType = data['subType']?.toString() ?? '';
    final router = di<AppRouter>().appRouter;

    // Default landing for any reservation-flavoured push.
    // Detail navigation inside My Reservations / Manage Reservations is
    // handled by those pages reading the data['reservation_uuid'] from
    // HydratedBloc on mount. Keeping the initial nav minimal avoids
    // fighting GoRouter guards when the app boots from terminated state.
    if (subType.startsWith('reservation_') || subType.startsWith('message_') || subType.startsWith('quote_')) {
      try {
        router.goNamed(AppRoutes.myReservations.name);
      } catch (e, s) {
        _logger.w('Push deeplink navigation failed', error: e, stackTrace: s);
      }
      return;
    }

    _logger.d('Push subType "$subType" has no deeplink handler (fallthrough)');
  }

  String _encodePayload(Map<String, dynamic> data) {
    // Tiny, dependency-free encoding — no need for dart:convert overhead
    // since data is always a Map<String,String> coming from FCM.
    return data.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}').join('&');
  }

  Map<String, dynamic> _decodePayload(String? payload) {
    if (payload == null || payload.isEmpty) return const {};
    final result = <String, dynamic>{};
    for (final pair in payload.split('&')) {
      final idx = pair.indexOf('=');
      if (idx < 0) continue;
      result[pair.substring(0, idx)] = Uri.decodeComponent(pair.substring(idx + 1));
    }
    return result;
  }
}

class _DeviceMeta {
  final String? deviceName;
  final String? deviceModel;
  final String? appVersion;
  const _DeviceMeta({this.deviceName, this.deviceModel, this.appVersion});
}
