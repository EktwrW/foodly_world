import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_order_detail_page.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/stripe_onboarding_banner.dart';

/// F4a — pestaña "Órdenes en vivo" del negocio (maquetas v3 aprobadas):
/// chips de filtro con contadores live + tarjetas de orden. El cubit vive en
/// la ruta; el detalle se pushea con BlocProvider.value sobre el MISMO cubit.
class ManagerOrdersPage extends StatelessWidget {
  const ManagerOrdersPage({super.key});

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
          FoodlySnackbars.errorGeneric(
              context, err.isEmpty ? S.current.managerGenericError : err);
        }
      },
      builder: (context, state) {
        return Scaffold(
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
          ),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                // F4a-6: banner de onboarding de pagos (dos estados).
                const StripeOnboardingBanner(),
                // Chips de filtro por bucket con contador live.
                SizedBox(
                  height: 46,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
                    itemCount: _buckets.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 6),
                    itemBuilder: (context, i) {
                      final b = _buckets[i];
                      final selected = state.bucket == b;
                      final count = _bucketCount(state, b);
                      return ChoiceChip(
                        selected: selected,
                        onSelected: (_) => cubit.selectBucket(b),
                        showCheckmark: false,
                        selectedColor: FoodlyThemes.primaryFoodly,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
                        ),
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
                                  style: FoodlyTextStyles.captionBold
                                      .copyWith(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: state.loading && state.orders.isEmpty
                      ? const Center(child: CircularProgressIndicator(color: FoodlyThemes.primaryFoodly))
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
                                itemCount: state.orders.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 10),
                                itemBuilder: (context, i) {
                                  final order = state.orders[i];
                                  return ManagerOrderCard(
                                    order: order,
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (_) => BlocProvider.value(
                                          value: cubit,
                                          child: ManagerOrderDetailPage(orderUuid: order.uuid),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
