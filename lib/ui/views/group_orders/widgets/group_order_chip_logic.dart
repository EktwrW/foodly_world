import 'dart:async' show scheduleMicrotask;

import 'package:flutter/widgets.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// Lógica PURA del chip flotante global de la orden activa (e2e r4):
/// visibilidad, posición inicial (dock IZQUIERDO — a la derecha tapaba los
/// botones del FAB al abrirse), clamping del drag y snap a borde.
/// Separada del widget para unit testing duro sin pumpear UI.
class GroupOrderChipLogic {
  GroupOrderChipLogic._();

  /// Margen del chip contra los bordes de pantalla.
  static const double edgeMargin = 8;

  /// Altura del dock inicial sobre el borde inferior (despegado de FABs).
  static const double bottomDock = 140;

  /// Rutas donde el chip NO se muestra: la propia orden (redundante), el
  /// flujo de join (transitorio) y las pantallas sin sesión/de arranque.
  static const hiddenPrefixes = ['/group-order/', '/join/'];
  static const hiddenExact = ['/', '/login', '/sign-up', '/sign-up-business', '/no-access'];

  /// Rutas donde el chip TAMPOCO se muestra, matcheadas por contención (el
  /// path lleva el :id en el medio): el módulo del MANAGER — el chip de
  /// cliente encima del panel de órdenes es ruido de otro rol (e2e F4a).
  static const hiddenContains = ['/my-business/live-orders'];

  /// ¿Debe verse el chip? Orden viva (abierta, pagable o EN TRACKING: pagada
  /// sin entregar — e2e F4a, el cliente debe poder volver a ver su estado) +
  /// ruta permitida + la página de la orden NO abierta. [orderPageOpen] llega
  /// del marcador de ciclo de vida ([GroupOrderPageVisibility]) porque la URI
  /// del router no siempre refleja pushes imperativos (e2e r6).
  static bool shouldShow({
    required GroupOrderDM? order,
    required String location,
    bool orderPageOpen = false,
  }) {
    if (orderPageOpen) return false;
    if (order == null || !(order.isOpen || order.isPayable || order.isTracking)) return false;

    final path = Uri.parse(location).path;
    if (hiddenExact.contains(path)) return false;
    for (final prefix in hiddenPrefixes) {
      if (path.startsWith(prefix)) return false;
    }
    for (final fragment in hiddenContains) {
      if (path.contains(fragment)) return false;
    }

    return true;
  }

  /// Posición inicial: docked a la IZQUIERDA, sobre el borde inferior.
  static Offset initialOffset({
    required Size screen,
    required Size chip,
    EdgeInsets safeArea = EdgeInsets.zero,
  }) =>
      clamp(
        desired: Offset(
          safeArea.left + edgeMargin,
          screen.height - safeArea.bottom - bottomDock - chip.height,
        ),
        screen: screen,
        chip: chip,
        safeArea: safeArea,
      );

  /// Mantiene el chip completo dentro de la pantalla (respetando safe areas).
  static Offset clamp({
    required Offset desired,
    required Size screen,
    required Size chip,
    EdgeInsets safeArea = EdgeInsets.zero,
  }) {
    final minX = safeArea.left + edgeMargin;
    final maxX = screen.width - safeArea.right - edgeMargin - chip.width;
    final minY = safeArea.top + edgeMargin;
    final maxY = screen.height - safeArea.bottom - edgeMargin - chip.height;

    return Offset(
      desired.dx.clamp(minX, maxX <= minX ? minX : maxX),
      desired.dy.clamp(minY, maxY <= minY ? minY : maxY),
    );
  }

  /// Al soltar el drag, el chip "imanta" al borde lateral más cercano
  /// (según el centro del chip); conserva la altura, clampeada.
  static Offset snapToEdge({
    required Offset current,
    required Size screen,
    required Size chip,
    EdgeInsets safeArea = EdgeInsets.zero,
  }) {
    final centerX = current.dx + chip.width / 2;
    final snapLeft = centerX <= screen.width / 2;
    final x = snapLeft
        ? safeArea.left + edgeMargin
        : screen.width - safeArea.right - edgeMargin - chip.width;

    return clamp(
      desired: Offset(x, current.dy),
      screen: screen,
      chip: chip,
      safeArea: safeArea,
    );
  }
}

/// Marcador de ciclo de vida de GroupOrderPage (e2e r6): la página se
/// registra al montarse y se des-registra al desmontarse. Es la señal
/// FIABLE de "estoy viendo la orden" — la URI del router puede no reflejar
/// un push imperativo. Contador (no bool) por si algún flujo apila dos.
class GroupOrderPageVisibility {
  GroupOrderPageVisibility._();

  static final ValueNotifier<int> openCount = ValueNotifier<int>(0);

  /// Valor REAL, actualizado en el acto. `openCount` es solo el canal de
  /// notificación y puede ir un frame por detrás (ver [_bump]).
  static int _count = 0;

  static bool get isOpen => _count > 0;

  static void markOpened() => _bump(1);

  static void markClosed() => _bump(-1);

  /// La GroupOrderPage se monta DURANTE el build del árbol, y el host del
  /// chip ya se construyó en ese mismo frame. Notificar ahí no lo hace
  /// repintar (y en debug es un `setState` en fase de build), así que el chip
  /// quedaba dibujado ENCIMA de la orden — y estando dentro de ella nada más
  /// vuelve a construir el host, con lo que se quedaba fijo (e2e 2026-08-06).
  ///
  /// El contador se actualiza ya; la notificación viaja en un microtask, que
  /// corre cuando la fase de build sincrónica terminó. Se usa microtask y no
  /// `addPostFrameCallback` a propósito: esto es un contador, no debe exigir
  /// que el binding de Flutter exista para funcionar (con el binding de por
  /// medio, un `test()` puro reventaba con "Binding has not yet been
  /// initialized").
  ///
  /// CONSECUENCIA para los tests: [isOpen] cambia en el acto, pero el árbol
  /// no. Hacen falta DOS `pump()` — el primero deja correr el microtask y
  /// agenda el frame, el segundo lo dibuja. En la app da igual: el frame
  /// siguiente llega solo, y el chip queda tapado por la transición de 400 ms.
  static void _bump(int delta) {
    _count = (_count + delta).clamp(0, 1 << 20);
    scheduleMicrotask(() => openCount.value = _count);
  }

  /// Solo para tests.
  static void reset() {
    _count = 0;
    openCount.value = 0;
  }
}

/// Posición elegida por el usuario (drag) — vive en memoria para persistir
/// entre pantallas dentro de la sesión. null = usar posición inicial.
class GroupOrderChipPositionStore {
  GroupOrderChipPositionStore._();

  static final ValueNotifier<Offset?> offset = ValueNotifier<Offset?>(null);

  static void reset() => offset.value = null;
}
