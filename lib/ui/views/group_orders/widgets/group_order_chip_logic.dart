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

  static bool get isOpen => openCount.value > 0;

  static void markOpened() => openCount.value++;

  static void markClosed() {
    if (openCount.value > 0) openCount.value--;
  }

  /// Solo para tests.
  static void reset() => openCount.value = 0;
}

/// Posición elegida por el usuario (drag) — vive en memoria para persistir
/// entre pantallas dentro de la sesión. null = usar posición inicial.
class GroupOrderChipPositionStore {
  GroupOrderChipPositionStore._();

  static final ValueNotifier<Offset?> offset = ValueNotifier<Offset?>(null);

  static void reset() => offset.value = null;
}
