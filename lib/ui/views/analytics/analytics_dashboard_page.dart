import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart' show AnalyticsDashboardShimmer;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_cubit.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_vm.dart';
import 'package:foodly_world/ui/views/analytics/widgets/daily_trends_chart.dart';
import 'package:foodly_world/ui/views/analytics/widgets/funnel_chart.dart';
import 'package:foodly_world/ui/views/analytics/widgets/kpi_row.dart';
import 'package:foodly_world/ui/views/analytics/widgets/period_selector.dart';
import 'package:foodly_world/ui/views/analytics/widgets/reservations_donut.dart';
import 'package:foodly_world/ui/views/analytics/widgets/service_funnel_chart.dart';
import 'package:foodly_world/ui/views/analytics/widgets/service_kpi_row.dart';
import 'package:foodly_world/ui/views/analytics/widgets/top_events_bar.dart';
import 'package:foodly_world/ui/views/analytics/widgets/top_packages_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class AnalyticsDashboardPage extends StatefulWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<AnalyticsCubit>().fetchOverview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          Text(
            S.current.analyticsTitle,
            overflow: TextOverflow.ellipsis,
            style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
          ).paddingOnly(right: 18),
        ],
        leading: CustomRoundedNeumorphicButton(
          iconSize: 26,
          diameter: 32,
          iconData: Bootstrap.caret_left_fill,
          onPressed: () {
            if (context.canPop()) {
              di<AppRouter>().removeLastRouteHistory();
              context.pop();
            } else {
              di<AppRouter>().goBackToLastRoute();
            }
          },
          padding: const EdgeInsets.all(6),
        ).paddingSymmetric(vertical: 10, horizontal: 10),
        leadingWidth: 60,
      ),
      body: BlocBuilder<AnalyticsCubit, AnalyticsState>(
        builder: (context, state) {
          final vm = state.vm;

          return state.maybeWhen(
            loading: (_) => const AnalyticsDashboardShimmer(),
            error: (_, message) => _ErrorView(
              message: message,
              onRetry: () => context.read<AnalyticsCubit>().fetchOverview(),
            ),
            orElse: () {
              // Branch the entire body by analytics flavour. Restaurant
              // managers (kind == restaurant) keep the original
              // reservations / reviews / favorites dashboard. Catering &
              // chefs (kind == service) get the bookings / response-time /
              // top-packages dashboard. Both use the same shimmer + error
              // surfaces and the same period selector chrome — only the
              // payload widgets differ.
              if (vm.kind == AnalyticsKind.service) {
                final serviceOverview = vm.serviceOverview;
                if (serviceOverview == null) {
                  return const AnalyticsDashboardShimmer();
                }
                return _ServiceDashboardBody(
                  vm: vm,
                  overview: serviceOverview,
                  onPeriodChanged: (days) => context.read<AnalyticsCubit>().changePeriod(days),
                  onRefresh: () => context.read<AnalyticsCubit>().fetchOverview(),
                );
              }

              final overview = vm.overview;
              if (overview == null) {
                return const AnalyticsDashboardShimmer();
              }
              return _RestaurantDashboardBody(
                vm: vm,
                overview: overview,
                onPeriodChanged: (days) => context.read<AnalyticsCubit>().changePeriod(days),
                onRefresh: () => context.read<AnalyticsCubit>().fetchOverview(),
              );
            },
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text(
              S.current.couldNotLoadAnalytics,
              style: FoodlyTextStyles.actionsBodyBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: FoodlyTextStyles.caption,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(S.current.retry),
              style: FilledButton.styleFrom(backgroundColor: FoodlyThemes.primaryFoodly),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Dashboard bodies — restaurant + service
//
// Both bodies share the same chrome (RefreshIndicator + scroll + period
// selector) and emit the same shimmer/empty paths. They only differ in which
// payload widgets they render. Extracted as two separate stateless widgets
// rather than one big switch in the parent so each branch is locally legible
// and so we don't accidentally end up with optional null fields on every
// widget call. If we ever add a third flavour (e.g. retail/stores), it would
// follow the same pattern.
// ─────────────────────────────────────────────────────────────────────────────

class _RestaurantDashboardBody extends StatelessWidget {
  final AnalyticsVM vm;
  final BusinessOverviewDataDM overview;
  final ValueChanged<int> onPeriodChanged;
  final Future<void> Function() onRefresh;

  const _RestaurantDashboardBody({
    required this.vm,
    required this.overview,
    required this.onPeriodChanged,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: FoodlyThemes.primaryFoodly,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeriodSelector(
              selectedDays: vm.selectedDays,
              onChanged: onPeriodChanged,
            ),
            const SizedBox(height: 16),
            if (overview.kpis != null) KpiRow(kpis: overview.kpis!),
            const SizedBox(height: 20),
            if (overview.series != null)
              DailyTrendsChart(
                eventsDaily: overview.series!.eventsDaily,
                reservationsDaily: overview.series!.reservationsDaily,
              ),
            const SizedBox(height: 20),
            if (overview.funnel != null && overview.funnel!.steps.isNotEmpty) FunnelChart(funnel: overview.funnel!),
            const SizedBox(height: 20),
            if (overview.breakdowns != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth > 500;

                    final donut = overview.breakdowns!.reservationsByStatus.isNotEmpty
                        ? ReservationsDonut(items: overview.breakdowns!.reservationsByStatus)
                        : null;

                    final bar = overview.breakdowns!.topEventTypes.isNotEmpty
                        ? TopEventsBar(items: overview.breakdowns!.topEventTypes)
                        : null;

                    if (wide && donut != null && bar != null) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: donut),
                          const SizedBox(width: 12),
                          Expanded(child: bar),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        if (donut != null) donut,
                        if (donut != null && bar != null) const SizedBox(height: 16),
                        if (bar != null) bar,
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ServiceDashboardBody extends StatelessWidget {
  final AnalyticsVM vm;
  final ServiceOverviewDataDM overview;
  final ValueChanged<int> onPeriodChanged;
  final Future<void> Function() onRefresh;

  const _ServiceDashboardBody({
    required this.vm,
    required this.overview,
    required this.onPeriodChanged,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: FoodlyThemes.primaryFoodly,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeriodSelector(
              selectedDays: vm.selectedDays,
              onChanged: onPeriodChanged,
            ),
            const SizedBox(height: 16),
            if (overview.kpis != null) ServiceKpiRow(kpis: overview.kpis!),
            const SizedBox(height: 20),
            if (overview.series != null)
              DailyTrendsChart(
                eventsDaily: overview.series!.eventsDaily,
                // The service flavour reuses the chart with `bookingsDaily`
                // sitting in the slot that the restaurant flavour fills with
                // `reservationsDaily`. Same chart shape, different label.
                reservationsDaily: overview.series!.bookingsDaily,
                primaryLabel: S.current.analyticsBookings,
              ),
            const SizedBox(height: 20),
            if (overview.funnel != null && overview.funnel!.steps.isNotEmpty)
              ServiceFunnelChart(funnel: overview.funnel!),
            const SizedBox(height: 20),
            if (overview.breakdowns != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth > 500;

                    final donut = overview.breakdowns!.bookingsByStatus.isNotEmpty
                        ? ReservationsDonut(items: overview.breakdowns!.bookingsByStatus)
                        : null;

                    final bar = overview.breakdowns!.topPackages.isNotEmpty
                        ? TopPackagesBar(items: overview.breakdowns!.topPackages)
                        : null;

                    if (wide && donut != null && bar != null) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: donut),
                          const SizedBox(width: 12),
                          Expanded(child: bar),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        if (donut != null) donut,
                        if (donut != null && bar != null) const SizedBox(height: 16),
                        if (bar != null) bar,
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
