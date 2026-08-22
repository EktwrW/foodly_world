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
  final Map<String, ChannelListeners> _subs = {};

  /// Identifica a cada oyente dentro de su canal. Monótono: no se reusa.
  int _ultimoOyenteId = 0;

  Timer? _pollTimer;
  Timer? _retryTimer;
  bool _socketHealthy = false;
  bool _observing = false;

  /// Canales que YA están puestos en el cliente NATIVO de Pusher.
  ///
  /// `disconnect()` cierra el socket pero no toca el registro de canales
  /// (verificado en pusher_channels_flutter 2.6.0), y el cliente los vuelve a
  /// suscribir solo al reconectar. Volver a pedirlos lanza "Already subscribed
  /// to a channel with name…" desde `ChannelManager`, que este servicio leía
  /// como "no hay socket": caía a polling y el reintento repetía la misma
  /// excepción cada 60 s. El socket quedaba muerto el resto de la sesión
  /// después del primer apagado de pantalla (bug 2026-08-17).
  final _suscritosNativos = <String>{};

  /// Estado de los timers, para que un test pueda afirmar que la pausa no deja
  /// trabajo corriendo en background.
  @visibleForTesting
  bool get pollingActivo => _pollTimer?.isActive ?? false;

  @visibleForTesting
  bool get reintentoProgramado => _retryTimer?.isActive ?? false;

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
    // Cada consumidor SUMA su oyente: el canal es compartido y la conexión
    // también, pero las suscripciones son independientes.
    final sub = _subs.putIfAbsent(channel, () => ChannelListeners(eventName: eventName));
    final id = ++_ultimoOyenteId;
    sub.add(id, onTouched);

    if (!_observing) {
      WidgetsBinding.instance.addObserver(this);
      _observing = true;
    }

    await _connect();

    return RealtimeSubscription._(this, channel, id);
  }

  /// Cancela UNA suscripción. El canal nativo se suelta cuando se va su
  /// ÚLTIMO oyente, y la conexión cuando no queda ningún canal: así el
  /// consumidor que se va nunca deja mudos a los demás.
  Future<void> _cancel(String channel, int id) async {
    final sub = _subs[channel];
    if (sub == null || !sub.remove(id)) return;

    _subs.remove(channel);

    try {
      await _pusher?.unsubscribe(channelName: channel);
    } catch (_) {/* la conexión ya podía estar caída */}
    _suscritosNativos.remove(channel);

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
    _cancelRetry();
    if (_observing) {
      WidgetsBinding.instance.removeObserver(this);
      _observing = false;
    }
    await _disconnect();
  }

  /// Avisa a TODOS los interesados (polling y resume no distinguen canal).
  void _notifyAll() {
    for (final sub in List<ChannelListeners>.from(_subs.values)) {
      sub.notificar();
    }
  }

  // ── Lifecycle: pantalla apagada / app minimizada ─────────────────────
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_subs.isEmpty) return;

    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _stopPolling();
      // Y el reintento. Sin esto sobrevivía a la pausa, disparaba `_connect()`
      // con la pantalla apagada y su `catch` volvía a arrancar el polling en
      // background: un GET cada 10 s en reposo, y cada fallo un snackbar
      // encolado que el manager veía en tanda al encender (bug 2026-08-17).
      _cancelRetry();
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
              sub.notificar();
            }
          },
        );
        _initialized = true;
      }

      for (final channel in List<String>.from(_subs.keys)) {
        if (_suscritosNativos.contains(channel)) continue;
        await pusher.subscribe(channelName: channel);
        _suscritosNativos.add(channel);
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
      // El próximo `_connect` re-inicializa el plugin, que construye un Pusher
      // nuevo sin canales: lo que creíamos suscrito ya no existe.
      _suscritosNativos.clear();
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

  void _cancelRetry() {
    _retryTimer?.cancel();
    _retryTimer = null;
  }

  void _scheduleRetry() {
    _retryTimer?.cancel();
    _retryTimer = Timer(_retryInterval, () {
      if (_subs.isNotEmpty && !_socketHealthy) _connect();
    });
  }
}

/// Un canal y TODOS los que lo escuchan.
///
/// Pública para poder testearla: es lógica pura y es exactamente la pieza
/// que se rompía.
///
/// Era un solo `onTouched` por canal, y eso rompía justo donde más se nota:
/// el chip flotante y la página de la orden observan el MISMO
/// `private-group-order.{uuid}`. Al abrir la página su callback reemplazaba
/// al del chip, y al cerrarla el `cancel` borraba el canal entero — el chip
/// quedaba sordo para siempre, porque `watchActive` se cree suscrito
/// (`_watchedUuid` sigue seteado) y no reintenta.
class ChannelListeners {
  final String eventName;
  final Map<int, VoidCallback> _oyentes = {};

  ChannelListeners({required this.eventName});

  bool get vacio => _oyentes.isEmpty;

  void add(int id, VoidCallback onTouched) => _oyentes[id] = onTouched;

  /// Devuelve true si el canal se quedó sin oyentes.
  bool remove(int id) {
    _oyentes.remove(id);
    return vacio;
  }

  /// Copia antes de iterar: un oyente puede cancelarse desde su propio
  /// callback (la página cerrándose por un evento, sin ir más lejos).
  void notificar() {
    for (final oyente in List<VoidCallback>.from(_oyentes.values)) {
      oyente();
    }
  }
}

/// Handle de una suscripción. Cada consumidor cancela LA SUYA: nadie puede
/// desconectar por accidente el canal de otro, que era la raíz del problema
/// del servicio mono-canal.
class RealtimeSubscription {
  final GroupOrderRealtimeService _service;
  final String _channel;
  final int _id;
  bool _cancelled = false;

  RealtimeSubscription._(this._service, this._channel, this._id);

  String get channel => _channel;
  bool get isCancelled => _cancelled;

  Future<void> cancel() async {
    if (_cancelled) return;
    _cancelled = true;
    await _service._cancel(_channel, _id);
  }
}
