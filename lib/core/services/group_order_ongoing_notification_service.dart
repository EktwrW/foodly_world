import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';

/// Notificación *ongoing* de Android (F3a, spec v2 §D.2): mientras hay una
/// orden grupal activa, una notificación fija (no descartable) muestra el
/// total y la cantidad de ítems. Se actualiza en cada cambio del carrito y
/// se retira al pagar/expirar/cancelar/salir. iOS no la soporta (su
/// equivalente — Live Activity — llega en F3b), así que no-op fuera de
/// Android.
class GroupOrderOngoingNotificationService {
  static const int _notificationId = 3690;
  static const String _channelId = 'group_order_active';

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  bool get _supported => !kIsWeb && Platform.isAndroid;

  Future<void> _ensureInitialized() async {
    if (_initialized || !_supported) return;
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    await _plugin.initialize(settings: settings);
    _initialized = true;
  }

  /// Muestra/actualiza la notificación fija con el estado del carrito.
  Future<void> show({
    required String orderUuid,
    required String businessName,
    required double total,
    required int itemCount,
    String currency = 'EUR',
  }) async {
    if (!_supported) return;
    await _ensureInitialized();

    final android = AndroidNotificationDetails(
      _channelId,
      // Nombre/descripción del CANAL: Android los muestra en Ajustes →
      // Notificaciones, así que se localizan como cualquier string de UI.
      S.current.groupOrderOngoingChannelName,
      channelDescription: S.current.groupOrderOngoingChannelDesc,
      importance: Importance.low, // silenciosa: es un estado, no un aviso
      priority: Priority.low,
      ongoing: true, // no descartable mientras la orden siga activa
      autoCancel: false,
      onlyAlertOnce: true,
      showWhen: false,
      icon: '@mipmap/ic_launcher',
    );

    await _plugin.show(
      id: _notificationId,
      title: businessName,
      body: '$itemCount × · ${formatMoney(total, currency)} — ${S.current.groupOrderViewOrder}',
      notificationDetails: NotificationDetails(android: android),
      payload: 'group_order:$orderUuid',
    );
  }

  /// Retira la notificación (orden pagada, cancelada, expirada o abandonada).
  Future<void> dismiss() async {
    if (!_supported) return;
    await _ensureInitialized();
    await _plugin.cancel(id: _notificationId);
  }
}
