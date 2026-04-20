// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodly_world/core/network/device_tokens/device_token_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:intl/intl.dart';
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
class PushNotificationService {
  final DeviceTokenRepo _deviceTokenRepo;
  final Logger _logger;

  String? _currentToken;
  bool _initialized = false;
  StreamSubscription<String>? _onTokenRefreshSub;
  StreamSubscription<RemoteMessage>? _onMessageSub;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSub;

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
    if (_initialized) return;
    if (kIsWeb) {
      // Web push is possible but requires a VAPID key + service worker
      // registration. Phase 2 — no-op for now.
      _initialized = true;
      return;
    }

    try {
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
    }
  }

  /// Retrieves the current FCM token and POSTs it to the BE.
  /// Safe to call multiple times — server-side upsert by fcm_token makes it
  /// idempotent. Silently no-ops if the user isn't logged in (no auth header
  /// → BE returns 401 which we swallow).
  Future<void> registerCurrentToken() async {
    if (kIsWeb) return; // Phase 2

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
        locale: Intl.getCurrentLocale(),
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
    await _onTokenRefreshSub?.cancel();
    await _onMessageSub?.cancel();
    await _onMessageOpenedAppSub?.cancel();
    _onTokenRefreshSub = null;
    _onMessageSub = null;
    _onMessageOpenedAppSub = null;
    _initialized = false;
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
