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
///  - Vive SOLO mientras alguien mira: se suscribe al entrar, se cancela al
///    salir. Al minimizar la app o apagar la pantalla (lifecycle
///    paused/inactive) se desconecta INMEDIATAMENTE — cero consumo, no cuenta
///    como conexión concurrente. Al volver (resumed): reconecta y dispara un
///    refetch para recuperar lo perdido.
///  - El evento solo trae {uuid, reason}: los datos SIEMPRE se refetchean
///    por GET (autorización en un único lugar).
///
/// MULTI-CANAL sobre UNA sola conexión (2026-08-06). Antes el servicio
/// guardaba UN canal y `_startWatch` empezaba con `unwatch()`, así que el
/// último en suscribirse desconectaba al anterior. Con tres consumidores del
/// mismo singleton —el chip flotante, la página de la orden y el panel del
/// negocio— eso producía dos fallos difíciles de ver: el panel se quedaba
/// mudo al volver del background, y al cerrar la página de la orden su
/// `cancel()` podía resolver DESPUÉS de que el chip se reconectara, dejándolo
/// con la suscripción marcada pero sin socket (foto vieja permanente).
///
/// Pusher multiplexa varios canales en una conexión, así que sostener las
/// tres suscripciones a la vez NO añade conexiones concurrentes. Cada
/// consumidor recibe su [RealtimeSubscription] y solo puede cancelar la suya.
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
  bool _initialized = false;

  /// Suscripciones vivas por nombre de canal.
  final Map<String, _ChannelSub> _subs = {};

  Timer? _pollTimer;
  Timer? _retryTimer;
  bool _socketHealthy = false;
  bool _observing = false;

  /// Observa la orden [orderUuid]. [onTouched] se invoca ante cualquier
  /// cambio (evento realtime, tick de polling o resume de la app); el caller
  /// decide cómo refetchear. Cancelá la suscripción devuelta al salir.
  Future<RealtimeSubscription> watch(String orderUuid, {required VoidCallback onTouched}) =>
      _subscribe('private-group-order.$orderUuid', 'group-order.touched', onTouched);

  /// F4a: observa el canal del PANEL del negocio (dueño) — lista live de
  /// "Órdenes en vivo". Mismas garantías que [watch].
  Future<RealtimeSubscription> watchBusiness(String businessUuid, {required VoidCallback onTouched}) =>
      _subscribe('private-business-orders.$businessUuid', 'business-orders.touched', onTouched);

  Future<RealtimeSubscription> _subscribe(
    String channel,
    String eventName,
    VoidCallback onTouched,
  ) async {
    // Re-suscribirse al MISMO canal reemplaza el callback (p. ej. la página
    // se reconstruye) en vez de duplicar la suscripción.
    _subs[channel] = _ChannelSub(eventName: eventName, onTouched: onTouched);

    if (!_observing) {
      WidgetsBinding.instance.addObserver(this);
      _observing = true;
    }

    await _connect();

    return RealtimeSubscription._(this, channel);
  }

  /// Cancela UNA suscripción. La conexión solo se cierra cuando no queda
  /// ninguna: así el consumidor que se va nunca deja mudos a los demás.
  Future<void> _cancel(String channel) async {
    if (_subs.remove(channel) == null) return;

    try {
      await _pusher?.unsubscribe(channelName: channel);
    } catch (_) {/* la conexión ya podía estar caída */}

    if (_subs.isEmpty) {
      await _teardown();
    }
  }

  /// Libera TODO (socket, timers, observer). Para logout/reset.
  Future<void> unwatchAll() async {
    _subs.clear();
    await _teardown();
  }

  Future<void> _teardown() async {
    _stopPolling();
    _retryTimer?.cancel();
    _retryTimer = null;
    if (_observing) {
      WidgetsBinding.instance.removeObserver(this);
      _observing = false;
    }
    await _disconnect();
  }

  /// Avisa a TODOS los interesados (polling y resume no distinguen canal).
  void _notifyAll() {
    for (final sub in List<_ChannelSub>.from(_subs.values)) {
      sub.onTouched();
    }
  }

  // ── Lifecycle: pantalla apagada / app minimizada ─────────────────────
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_subs.isEmpty) return;

    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _stopPolling();
      _disconnect(); // corte inmediato: cero consumo en background
    } else if (state == AppLifecycleState.resumed) {
      _notifyAll(); // refetch: recupera lo ocurrido mientras tanto
      _connect();
    }
  }

  // ── Socket ───────────────────────────────────────────────────────────
  Future<void> _connect() async {
    if (_subs.isEmpty) return;

    try {
      final pusher = PusherChannelsFlutter.getInstance();
      _pusher = pusher;

      // `init` una sola vez por instancia del plugin: es un singleton nativo
      // y re-inicializarlo tira las suscripciones que ya estaban puestas.
      if (!_initialized) {
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
          // El despacho es POR CANAL: cada consumidor solo oye lo suyo.
          onEvent: (event) {
            final sub = _subs[event.channelName];
            if (sub != null && event.eventName == sub.eventName) {
              sub.onTouched();
            }
          },
        );
        _initialized = true;
      }

      for (final channel in List<String>.from(_subs.keys)) {
        await pusher.subscribe(channelName: channel);
      }
      await pusher.connect();

      _socketHealthy = true;
      _stopPolling(); // el socket manda; adiós fallback
      log('Realtime conectado a ${_subs.keys.join(', ')}', name: 'GroupOrderRealtime');
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
    _socketHealthy = false;
    if (pusher != null) {
      try {
        await pusher.disconnect();
      } catch (_) {}
    }
    // `_pusher`/_initialized se conservan: el plugin es un singleton nativo y
    // reconectar tras un resume no debe re-inicializarlo.
    if (_subs.isEmpty) {
      _pusher = null;
      _initialized = false;
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
    _pollTimer ??= Timer.periodic(_pollInterval, (_) => _notifyAll());
  }

  void _stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void _scheduleRetry() {
    _retryTimer?.cancel();
    _retryTimer = Timer(_retryInterval, () {
      if (_subs.isNotEmpty && !_socketHealthy) _connect();
    });
  }
}

class _ChannelSub {
  final String eventName;
  final VoidCallback onTouched;

  const _ChannelSub({required this.eventName, required this.onTouched});
}

/// Handle de una suscripción. Cada consumidor cancela LA SUYA: nadie puede
/// desconectar por accidente el canal de otro, que era la raíz del problema
/// del servicio mono-canal.
class RealtimeSubscription {
  final GroupOrderRealtimeService _service;
  final String _channel;
  bool _cancelled = false;

  RealtimeSubscription._(this._service, this._channel);

  String get channel => _channel;
  bool get isCancelled => _cancelled;

  Future<void> cancel() async {
    if (_cancelled) return;
    _cancelled = true;
    await _service._cancel(_channel);
  }
}
