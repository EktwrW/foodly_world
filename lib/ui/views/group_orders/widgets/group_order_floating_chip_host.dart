import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/active_group_order_chip.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_chip_logic.dart';

/// Host GLOBAL del chip flotante de la orden activa (e2e r4). Envuelve el
/// árbol de la app (main.dart, builder de MaterialApp.router): con una orden
/// viva, el chip "Ver pedido · €X" queda SIEMPRE visible y arrastrable en
/// cualquier pantalla (salvo la propia orden, el join y las de auth).
///
/// Inyectables para testing puro: [ordersSource] (cubit), [routeListenable] +
/// [locationOf] (router) y [onOpenOrder] (navegación).
class GroupOrderFloatingChipHost extends StatefulWidget {
  final Widget child;
  final StateStreamable<GroupOrderDM?>? ordersSource;
  final Listenable? routeListenable;
  final String Function()? locationOf;
  final void Function(GroupOrderDM order)? onOpenOrder;

  const GroupOrderFloatingChipHost({
    super.key,
    required this.child,
    this.ordersSource,
    this.routeListenable,
    this.locationOf,
    this.onOpenOrder,
  });

  @override
  State<GroupOrderFloatingChipHost> createState() => _GroupOrderFloatingChipHostState();
}

class _GroupOrderFloatingChipHostState extends State<GroupOrderFloatingChipHost>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // e2e F4a: recuperar la orden activa/en tracking al arrancar — sin esto
    // el cliente que cerró la app no volvía a ver su orden. Solo con el
    // cubit real (los tests inyectan ordersSource y no tocan DI).
    if (widget.ordersSource == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => di<ActiveGroupOrderCubit>().syncAnyActive(),
      );
      // Al volver del detalle, el estado pudo cambiar mientras el chip
      // estaba oculto. El servicio realtime es multi-canal, así que la
      // suscripción del chip nunca se cedió: solo hace falta refrescar.
      GroupOrderPageVisibility.openCount.addListener(_refreshOnPageClose);
    }
  }

  @override
  void dispose() {
    GroupOrderPageVisibility.openCount.removeListener(_refreshOnPageClose);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _refreshOnPageClose() {
    if (GroupOrderPageVisibility.isOpen) return;
    final cubit = di<ActiveGroupOrderCubit>();
    cubit.refresh();
    cubit.watchActive(); // no-op si ya observa esa orden
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Al volver del background: si no hay orden en memoria, re-consulta
    // (cubre también el cold start donde la sesión aún restauraba → 401).
    if (state == AppLifecycleState.resumed && widget.ordersSource == null) {
      di<ActiveGroupOrderCubit>().syncAnyActive();
    }
  }

  void _openOrder(GroupOrderDM order) {
    if (widget.onOpenOrder != null) return widget.onOpenOrder!(order);
    di<AppRouter>().appRouter.pushNamed(
      AppRoutes.groupOrder.name,
      pathParameters: {AppRoutes.routeIdParam: order.uuid},
    );
  }

  @override
  Widget build(BuildContext context) {
    final source = widget.ordersSource ?? di<ActiveGroupOrderCubit>();
    final routes = widget.routeListenable ?? di<AppRouter>().appRouter.routerDelegate;
    final location = widget.locationOf ??
        () => di<AppRouter>().appRouter.routerDelegate.currentConfiguration.uri.toString();

    return BlocBuilder<StateStreamable<GroupOrderDM?>, GroupOrderDM?>(
      bloc: source,
      builder: (context, order) => AnimatedBuilder(
        // routerDelegate notifica en cambios de ubicación y el marcador de
        // la página de la orden cubre los pushes imperativos que la URI no
        // refleja (e2e r6) — con cualquiera de los dos, el chip reevalúa.
        animation: Listenable.merge([routes, GroupOrderPageVisibility.openCount]),
        builder: (context, _) {
          final visible = GroupOrderChipLogic.shouldShow(
            order: order,
            location: location(),
            orderPageOpen: GroupOrderPageVisibility.isOpen,
          );

          return Stack(
            textDirection: TextDirection.ltr,
            children: [
              widget.child,
              if (visible)
                _DraggableChipLayer(
                  order: order!,
                  onTap: () => _openOrder(order),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Capa posicionada + drag del chip. Mantiene la posición del usuario en
/// [GroupOrderChipPositionStore] (persiste entre pantallas en la sesión).
class _DraggableChipLayer extends StatefulWidget {
  final GroupOrderDM order;
  final VoidCallback onTap;

  const _DraggableChipLayer({required this.order, required this.onTap});

  @override
  State<_DraggableChipLayer> createState() => _DraggableChipLayerState();
}

class _DraggableChipLayerState extends State<_DraggableChipLayer> {
  final _chipKey = GlobalKey();

  Size _chipSize() {
    final box = _chipKey.currentContext?.findRenderObject() as RenderBox?;
    // Nominal hasta el primer layout — clamp/snap se refinan al soltar.
    return box?.hasSize == true ? box!.size : const Size(170, 36);
  }

  Offset _currentPosition(Size screen, EdgeInsets safeArea) {
    final stored = GroupOrderChipPositionStore.offset.value;
    final chip = _chipSize();
    return stored != null
        ? GroupOrderChipLogic.clamp(desired: stored, screen: screen, chip: chip, safeArea: safeArea)
        : GroupOrderChipLogic.initialOffset(screen: screen, chip: chip, safeArea: safeArea);
  }

  @override
  Widget build(BuildContext context) {
    // OJO: nada de LayoutBuilder acá — [Positioned] debe quedar ligado al
    // Stack del host (un RenderObjectWidget intermedio rompe el ParentData).
    final screen = MediaQuery.sizeOf(context);
    final safeArea = MediaQuery.paddingOf(context);

    return ValueListenableBuilder<Offset?>(
      valueListenable: GroupOrderChipPositionStore.offset,
      builder: (context, _, __) {
        final position = _currentPosition(screen, safeArea);
        final chip = ActiveGroupOrderChip(
          key: _chipKey,
          order: widget.order,
          onTap: widget.onTap,
        );

        return Positioned(
          left: position.dx,
          top: position.dy,
          // Entrada animada (refinamiento pre-F4a): scale+fade al aparecer
          // en una pantalla — antes se materializaba en seco.
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutBack,
            builder: (_, t, child) => Transform.scale(
              scale: 0.6 + 0.4 * t,
              child: Opacity(opacity: t.clamp(0.0, 1.0), child: child),
            ),
          // Draggable nativo (pedido explícito e2e r4): el [feedback] sigue
          // el dedo vía overlay, el hijo queda como fantasma atenuado, y al
          // soltar la posición se clampea y se imanta al borde más cercano.
          child: Draggable<GroupOrderDM>(
            data: widget.order,
            feedback: Transform.scale(
              scale: 1.05,
              child: ActiveGroupOrderChip(order: widget.order, onTap: () {}),
            ),
            childWhenDragging: Opacity(opacity: 0.25, child: chip),
            onDragEnd: (details) {
              // details.offset = esquina superior izquierda del feedback en
              // coordenadas globales al soltar; el Stack del host ocupa la
              // pantalla completa, así que coincide con nuestro sistema.
              GroupOrderChipPositionStore.offset.value = GroupOrderChipLogic.snapToEdge(
                current: GroupOrderChipLogic.clamp(
                  desired: details.offset,
                  screen: screen,
                  chip: _chipSize(),
                  safeArea: safeArea,
                ),
                screen: screen,
                chip: _chipSize(),
                safeArea: safeArea,
              );
            },
            child: chip,
          ),
          ),
        );
      },
    );
  }
}
