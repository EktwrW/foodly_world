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

  /// ¿Debe verse el chip? Orden viva (abierta o pagable) + ruta permitida.
  static bool shouldShow({required GroupOrderDM? order, required String location}) {
    if (order == null || !(order.isOpen || order.isPayable)) return false;

    final path = Uri.parse(location).path;
    if (hiddenExact.contains(path)) return false;
    for (final prefix in hiddenPrefixes) {
      if (path.startsWith(prefix)) return false;
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

/// Posición elegida por el usuario (drag) — vive en memoria para persistir
/// entre pantallas dentro de la sesión. null = usar posición inicial.
class GroupOrderChipPositionStore {
  GroupOrderChipPositionStore._();

  static final ValueNotifier<Offset?> offset = ValueNotifier<Offset?>(null);

  static void reset() => offset.value = null;
}
