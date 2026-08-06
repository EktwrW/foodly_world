import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// F4a — host GLOBAL del aviso "nueva orden pagada" (estilo Foodly, mismo
/// patrón que GroupOrderFloatingChipHost). Cuando llega un push
/// `manager_group_order` en foreground y el owner está en CUALQUIER pantalla
/// que no sea su panel de órdenes, muestra un modal para ir a atenderla.
/// En el panel no molesta: ahí la lista se refresca sola vía Pusher.
///
/// Inyectables para testing puro: [pushes] (stream), [locationOf] (router),
/// [onGoToOrders] (navegación) y [fallbackBusinessUuid].
class ManagerOrderAlertHost extends StatefulWidget {
  final Widget child;
  final Stream<Map<String, dynamic>>? pushes;
  final String Function()? locationOf;
  final void Function(String businessUuid, String? orderUuid)? onGoToOrders;
  final String? Function()? fallbackBusinessUuid;

  const ManagerOrderAlertHost({
    super.key,
    required this.child,
    this.pushes,
    this.locationOf,
    this.onGoToOrders,
    this.fallbackBusinessUuid,
  });

  @override
  State<ManagerOrderAlertHost> createState() => _ManagerOrderAlertHostState();
}

class _ManagerOrderAlertHostState extends State<ManagerOrderAlertHost> {
  StreamSubscription<Map<String, dynamic>>? _sub;

  /// Aviso pendiente en pantalla (null = sin modal). Uno a la vez: si entran
  /// más órdenes con el modal abierto, no se apilan — el panel las lista.
  Map<String, dynamic>? _pending;

  @override
  void initState() {
    super.initState();
    final stream = widget.pushes ?? di<PushNotificationService>().managerOrderPushes;
    _sub = stream.listen(_onPush);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  String _location() =>
      widget.locationOf?.call() ??
      di<AppRouter>().appRouter.routerDelegate.currentConfiguration.uri.toString();

  String? _businessUuid(Map<String, dynamic> data) =>
      (data['business_uuid'] as String?) ??
      (widget.fallbackBusinessUuid != null
          ? widget.fallbackBusinessUuid!()
          : di<AuthSessionService>().userSessionDM?.user.business.firstOrNull?.uuid);

  void _onPush(Map<String, dynamic> data) {
    if (!mounted) return;
    // Ya está mirando el panel → Pusher refresca la lista, sin modal.
    if (_location().contains('/live-orders')) return;
    // Un modal a la vez.
    if (_pending != null) return;
    setState(() => _pending = data);
  }

  void _dismiss() => setState(() => _pending = null);

  void _goToOrders() {
    final data = _pending!;
    _dismiss();
    final uuid = _businessUuid(data);
    if (uuid == null) return;
    // El BE ya manda el uuid de la orden: "Ir a atenderla" debe abrir ESA
    // orden, no dejar al manager buscándola en la lista (e2e 2026-08-06).
    final orderUuid = data['uuid'] as String?;
    if (widget.onGoToOrders != null) return widget.onGoToOrders!(uuid, orderUuid);
    final router = di<AppRouter>().appRouter;
    router.pushNamed(
      AppRoutes.liveOrders.name,
      pathParameters: {AppRoutes.routeIdParam: uuid},
      queryParameters: orderUuid != null ? {'order': orderUuid} : const {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        widget.child,
        if (_pending != null) ...[
          // Barrera: cerrar tocando afuera (no bloquea al manager ocupado).
          Positioned.fill(
            child: GestureDetector(
              onTap: _dismiss,
              child: const ColoredBox(color: Color(0x8A000000)),
            ),
          ),
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutBack,
              builder: (_, t, child) => Transform.scale(
                scale: 0.8 + 0.2 * t,
                child: Opacity(opacity: t.clamp(0.0, 1.0), child: child),
              ),
              child: _AlertCard(
                kind: _pending!['kind'] as String?,
                body: _pending!['body'] as String?,
                onLater: _dismiss,
                onGo: _goToOrders,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Tarjeta del aviso — lenguaje visual Foodly: blanca, radius 24, icono en
/// círculo plum, CTA verde (misma paleta del panel del manager).
class _AlertCard extends StatelessWidget {
  final String? kind;
  final String? body;
  final VoidCallback onLater;
  final VoidCallback onGo;

  const _AlertCard({
    required this.kind,
    required this.body,
    required this.onLater,
    required this.onGo,
  });

  /// El aviso se discierne por MODO y ACCIÓN — no solo el título: también el
  /// icono y, sobre todo, el CTA (e2e 2026-08-06).
  ///
  /// Antes todo se anunciaba como "¡Nueva orden pagada! · Ir a atenderla".
  /// Eso rompía en los dos extremos del ciclo de la cuenta abierta: una tanda
  /// recién enviada prometía un cobro que no ocurrió, y el pago final mandaba
  /// al negocio a atender una mesa que acababa de irse.
  ///
  /// `tab_closed` es el único informativo: no hay nada que atender, solo algo
  /// que mirar.
  (String, IconData, String) get _look => switch (kind) {
        'more_items' => (
            S.current.managerMoreItemsTitle,
            Icons.add_shopping_cart_rounded,
            S.current.managerNewOrderGo,
          ),
        'paid' => (
            S.current.managerPaidOrderTitle,
            Icons.payments_rounded,
            S.current.managerNewOrderGo,
          ),
        'tab_closed' => (
            S.current.managerTabClosedTitle,
            Icons.check_circle_rounded,
            S.current.managerViewOrderGo,
          ),
        _ => (
            S.current.managerNewOrderTitle,
            Icons.room_service_rounded,
            S.current.managerNewOrderGo,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final (title, icon, goLabel) = _look;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        padding: const EdgeInsets.fromLTRB(22, 24, 22, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: .25), blurRadius: 24, offset: const Offset(0, 10)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: .1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: FoodlyThemes.primaryFoodly, size: 30),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: FoodlyTextStyles.sectionsTitle,
            ),
            if (body != null) ...[
              const SizedBox(height: 6),
              Text(body!, textAlign: TextAlign.center, style: FoodlyTextStyles.caption),
            ],
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onGo,
                style: FilledButton.styleFrom(
                  backgroundColor: FoodlyThemes.tertiaryFoodly,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  goLabel,
                  style: FoodlyTextStyles.labelBold.copyWith(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: onLater,
              child: Text(
                S.current.managerNewOrderLater,
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.secondaryFoodly),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
