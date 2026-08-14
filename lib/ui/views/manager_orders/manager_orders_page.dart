import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/state/load_failure_view.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_history_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_order_detail_page.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_order_history_page.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/stripe_onboarding_banner.dart';

/// F4a — pestaña "Órdenes en vivo" del negocio (maquetas v3 aprobadas):
/// chips de filtro con contadores live + tarjetas de orden. El cubit vive en
/// la ruta; el detalle se pushea con BlocProvider.value sobre el MISMO cubit.
class ManagerOrdersPage extends StatelessWidget {
  /// Deep link del modal de aviso: uuid de la orden que disparó el push.
  /// Abre su detalle directamente en vez de dejar al manager buscándola en
  /// la lista con la mesa esperando (e2e 2026-08-06).
  final String? openOrderUuid;

  const ManagerOrdersPage({super.key, this.openOrderUuid});

  static const _buckets = <String?>[null, 'pending', 'preparing', 'ready', 'delivered'];

  String _bucketLabel(String? b) => switch (b) {
        'pending' => S.current.managerBucketPending,
        'preparing' => S.current.managerBucketPreparing,
        'ready' => S.current.managerBucketReady,
        'delivered' => S.current.managerBucketDelivered,
        _ => S.current.managerBucketAll,
      };

  int? _bucketCount(ManagerOrdersState state, String? b) => switch (b) {
        'pending' => state.counts.pending,
        'preparing' => state.counts.preparing,
        'ready' => state.counts.ready,
        'delivered' => state.counts.delivered,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManagerOrdersCubit>();

    return BlocConsumer<ManagerOrdersCubit, ManagerOrdersState>(
      listener: (context, state) {
        final err = state.error;
        if (err != null) {
          // Audit F4a: copy genérico PROPIO del panel — el de join del
          // cliente ("no pudimos unirte…") no tiene sentido acá.
          FoodlySnackbars.errorGeneric(context, err.isEmpty ? S.current.managerGenericError : err);
        }
      },
      builder: (context, state) {
        return _DeepLinkOpener(
          // Solo cuando la orden YA está en el state: el detalle se cierra
          // solo si no la encuentra (manager_order_detail_page.dart:94), y
          // abrirlo tras el primer frame —con load() aún en vuelo— hacía que
          // el manager rebotara a la lista (e2e 2026-08-06).
          orderUuid: state.orders.any((o) => o.uuid == openOrderUuid) ? openOrderUuid : null,
          onOpen: (uuid) => _pushDetail(context, cubit, uuid),
          child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 60,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
              onPressed: () => di<AppRouter>().goBackToLastRoute(),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.managerLiveOrders,
                  style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(width: 8),
                // Punto "live" verde (maqueta 1).
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: FoodlyThemes.tertiaryFoodly,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.7),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              // F4a.1: historial de días anteriores (paginado por fecha).
              IconButton(
                tooltip: S.current.managerHistoryTitle,
                icon: const Icon(Icons.history_rounded, color: Colors.white),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => BlocProvider(
                      create: (_) => ManagerHistoryCubit(
                        repo: di(),
                        logger: di(),
                        businessUuid: cubit.businessUuid,
                      )..load(),
                      child: const ManagerOrderHistoryPage(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                // F4a-6: banner de onboarding de pagos (dos estados).
                const StripeOnboardingBanner().paddingBottom(3),
                // Chips de filtro por bucket con contador live. SIN altura
                // fija (e2e F4a v2): la franja deriva su alto del contenido —
                // con 46px clavados, cualquier ajuste de padding/márgenes los
                // recortaba. shrinkWrap+compact evitan el tap-target de 48px.
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Row(
                    children: [
                      for (final b in _buckets) ...[
                        if (b != _buckets.first) const SizedBox(width: 6),
                        Builder(builder: (context) {
                          final selected = state.bucket == b;
                          final count = _bucketCount(state, b);
                          return ChoiceChip(
                            selected: selected,
                            onSelected: (_) => cubit.selectBucket(b),
                            showCheckmark: false,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            selectedColor: FoodlyThemes.primaryFoodly,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
                            ),
                            labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _bucketLabel(b),
                                  style: FoodlyTextStyles.captionBold.copyWith(
                                    color: selected ? Colors.white : FoodlyThemes.primaryFoodly,
                                  ),
                                ),
                                if (count != null && count > 0) ...[
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: FoodlyThemes.secondaryFoodly,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '$count',
                                      style: FoodlyTextStyles.captionBold.copyWith(color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
                Expanded(
                  child: state.loading && state.orders.isEmpty
                      ? const Center(child: CircularProgressIndicator(color: FoodlyThemes.primaryFoodly))
                      // "No hay órdenes" y "falló la llamada" NO son lo mismo.
                      // Antes se pintaban igual: el camarero leía que no había
                      // mesas mientras las tenía vivas esperando, y el único
                      // aviso era un snackbar de 4 segundos sin reintento
                      // (auditoría 2026-08-12). Para quien atiende una sala,
                      // un dato falso es peor que un error.
                      : state.error != null && state.orders.isEmpty
                          ? LoadFailureView(onRetry: cubit.refetchSilently)
                          : state.orders.isEmpty
                          ? Center(
                              child: Text(S.current.managerNoOrders, style: FoodlyTextStyles.caption),
                            )
                          : RefreshIndicator(
                              color: FoodlyThemes.primaryFoodly,
                              onRefresh: cubit.refetchSilently,
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(14, 8, 14, 20),
                                // +1 para el pie de "mostrando N de M". El
                                // panel NO pagina (ver el comentario del
                                // cubit): si hay más de las que caben, se dice
                                // — un contador que no cuadra con la lista es
                                // peor que una lista corta y honesta.
                                itemCount: state.orders.length + (state.isTruncated ? 1 : 0),
                                separatorBuilder: (_, __) => const SizedBox(height: 10),
                                itemBuilder: (context, i) {
                                  if (i >= state.orders.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        S.current.managerOrdersTruncated(
                                          state.orders.length,
                                          state.total,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FoodlyTextStyles.caption,
                                      ),
                                    );
                                  }
                                  final order = state.orders[i];
                                  return ManagerOrderCard(
                                    order: order,
                                    onTap: () => _pushDetail(context, cubit, order.uuid),
                                  );
                                },
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
        );
      },
    );
  }

  /// Detalle sobre el MISMO cubit (la lista y el detalle comparten realtime).
  void _pushDetail(BuildContext context, ManagerOrdersCubit cubit, String orderUuid) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: ManagerOrderDetailPage(orderUuid: orderUuid),
        ),
      ),
    );
  }
}

/// Abre UNA vez el detalle de [orderUuid] en cuanto la orden está disponible.
///
/// [orderUuid] llega null mientras la lista aún carga y pasa a no-null cuando
/// la orden existe en el state; por eso el disparo vive en [didUpdateWidget]
/// además de [initState] (la lista puede llegar antes o después del montaje).
/// Aislado en su propio StatefulWidget para no volver stateful toda la
/// página: lo único que necesita estado es recordar que ya abrió.
class _DeepLinkOpener extends StatefulWidget {
  final String? orderUuid;
  final void Function(String orderUuid) onOpen;
  final Widget child;

  const _DeepLinkOpener({required this.orderUuid, required this.onOpen, required this.child});

  @override
  State<_DeepLinkOpener> createState() => _DeepLinkOpenerState();
}

class _DeepLinkOpenerState extends State<_DeepLinkOpener> {
  bool _opened = false;

  @override
  void initState() {
    super.initState();
    _maybeOpen();
  }

  @override
  void didUpdateWidget(_DeepLinkOpener old) {
    super.didUpdateWidget(old);
    _maybeOpen();
  }

  void _maybeOpen() {
    final uuid = widget.orderUuid;
    if (_opened || uuid == null || uuid.isEmpty) return;
    _opened = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.onOpen(uuid);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
