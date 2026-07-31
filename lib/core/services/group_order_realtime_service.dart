import 'dart:async';
import 'dart:convert';
import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

/// Realtime de Group Orders (F3a) sobre Pusher Channels.
///
/// Principios de diseño (validados con Hector 2026-07-30):
///  - El socket es una MEJORA, nunca una dependencia: si no conecta (límite
///    de plan, red que bloquea websockets…), cae silenciosamente a polling
///    suave cada [_pollInterval] y reintenta el socket cada [_retryInterval].
///  - Vive SOLO mientras hay una pantalla de orden mirándose: `watch()` al
///    entrar, `unwatch()` al salir. Al minimizar la app o apagar la pantalla
///    (lifecycle paused/inactive) se desconecta INMEDIATAMENTE — cero
///    consumo, no cuenta como conexión concurrente. Al volver (resumed):
///    reconecta y dispara un refetch para recuperar lo perdido.
///  - El evento solo trae {uuid, reason}: los datos SIEMPRE se refetchean
///    por GET (autorización en un único lugar).
///
/// La key y el cluster son PÚBLICOS (mismo criterio que firebase_options).
class GroupOrderRealtimeService with WidgetsBindingObserver {
  GroupOrderRealtimeService({required AuthSessionService authSession})
      : _authSession = authSession;

  static const String _pusherKey =
      String.fromEnvironment('PUSHER_KEY', defaultValue: 'ce919f2ae5c3eb4188a7');
  static const String _pusherCluster =
      String.fromEnvironment('PUSHER_CLUSTER', defaultValue: 'eu');

  /// Mismo DOMAIN que usa el resto de la app (launch config / build APK).
  static const String _domain =
      String.fromEnvironment('DOMAIN', defaultValue: 'https://api.foodly.solutions');

  static const Duration _pollInterval = Duration(seconds: 10);
  static const Duration _retryInterval = Duration(seconds: 60);

  final AuthSessionService _authSession;

  PusherChannelsFlutter? _pusher;
  String? _watchingUuid;
  VoidCallback? _onTouched;
  Timer? _pollTimer;
  Timer? _retryTimer;
  bool _socketHealthy = false;
  bool _observing = false;

  /// Empieza a observar la orden [orderUuid]. [onTouched] se invoca ante
  /// cualquier cambio (evento realtime, tick de polling o resume de la app);
  /// el caller decide cómo refetchear.
  Future<void> watch(String orderUuid, {required VoidCallback onTouched}) async {
    await unwatch();
    _watchingUuid = orderUuid;
    _onTouched = onTouched;

    if (!_observing) {
      WidgetsBinding.instance.addObserver(this);
      _observing = true;
    }

    await _connect();
  }

  /// Deja de observar y libera TODO (socket, timers, observer).
  Future<void> unwatch() async {
    _watchingUuid = null;
    _onTouched = null;
    _stopPolling();
    _retryTimer?.cancel();
    _retryTimer = null;
    if (_observing) {
      WidgetsBinding.instance.removeObserver(this);
      _observing = false;
    }
    await _disconnect();
  }

  // ── Lifecycle: pantalla apagada / app minimizada ─────────────────────
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_watchingUuid == null) return;

    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _stopPolling();
      _disconnect(); // corte inmediato: cero consumo en background
    } else if (state == AppLifecycleState.resumed) {
      _onTouched?.call(); // refetch: recupera lo ocurrido mientras tanto
      _connect();
    }
  }

  // ── Socket ───────────────────────────────────────────────────────────
  Future<void> _connect() async {
    final uuid = _watchingUuid;
    if (uuid == null) return;

    try {
      final pusher = PusherChannelsFlutter.getInstance();
      _pusher = pusher;

      await pusher.init(
        apiKey: _pusherKey,
        cluster: _pusherCluster,
        onAuthorizer: _authorize,
        onConnectionStateChange: (current, previous) {
          _socketHealthy = current == 'CONNECTED';
        },
        onError: (message, code, error) {
          log('Pusher error: $message', name: 'GroupOrderRealtime');
        },
        onEvent: (event) {
          if (event.eventName == 'group-order.touched') {
            _onTouched?.call();
          }
        },
      );

      await pusher.subscribe(channelName: 'private-group-order.$uuid');
      await pusher.connect();

      _socketHealthy = true;
      _stopPolling(); // el socket manda; adiós fallback
      log('Realtime conectado a la orden $uuid', name: 'GroupOrderRealtime');
    } catch (e) {
      // Fallback silencioso a polling (opción C) + reintento periódico.
      log('Socket no disponible ($e) — fallback a polling', name: 'GroupOrderRealtime');
      _socketHealthy = false;
      _startPolling();
      _scheduleRetry();
    }
  }

  Future<void> _disconnect() async {
    final pusher = _pusher;
    _pusher = null;
    _socketHealthy = false;
    if (pusher != null) {
      try {
        await pusher.disconnect();
      } catch (_) {}
    }
  }

  /// Autoriza el canal privado contra el backend (Sanctum Bearer).
  Future<dynamic> _authorize(String channelName, String socketId, dynamic options) async {
    final token = _authSession.userSessionDM?.accessToken;
    final response = await Dio().post<Map<String, dynamic>>(
      '$_domain/api/broadcasting/auth',
      data: {'channel_name': channelName, 'socket_id': socketId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    final data = response.data;
    return data is String ? jsonDecode(data as String) : data;
  }

  // ── Fallback: polling suave mientras la pantalla está activa ─────────
  void _startPolling() {
    _pollTimer ??= Timer.periodic(_pollInterval, (_) => _onTouched?.call());
  }

  void _stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void _scheduleRetry() {
    _retryTimer?.cancel();
    _retryTimer = Timer(_retryInterval, () {
      if (_watchingUuid != null && !_socketHealthy) _connect();
    });
  }
}
