import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_cubit.dart';
import 'package:foodly_world/ui/views/analytics/widgets/daily_trends_chart.dart';
import 'package:foodly_world/ui/views/analytics/widgets/funnel_chart.dart';
import 'package:foodly_world/ui/views/analytics/widgets/kpi_row.dart';
import 'package:foodly_world/ui/views/analytics/widgets/period_selector.dart';
import 'package:foodly_world/ui/views/analytics/widgets/reservations_donut.dart';
import 'package:foodly_world/ui/views/analytics/widgets/top_events_bar.dart';

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
        title: Text(S.current.analyticsTitle, style: FoodlyTextStyles.actionsBodyBold.copyWith(color: Colors.white)),
        backgroundColor: FoodlyThemes.primaryFoodly,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<AnalyticsCubit, AnalyticsState>(
        builder: (context, state) {
          final vm = state.vm;

          return state.maybeWhen(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (_, message) => _ErrorView(
              message: message,
              onRetry: () => context.read<AnalyticsCubit>().fetchOverview(),
            ),
            orElse: () {
              final overview = vm.overview;
              if (overview == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return RefreshIndicator(
                onRefresh: () => context.read<AnalyticsCubit>().fetchOverview(),
                color: FoodlyThemes.primaryFoodly,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Period selector
                      PeriodSelector(
                        selectedDays: vm.selectedDays,
                        onChanged: (days) => context.read<AnalyticsCubit>().changePeriod(days),
                      ),
                      const SizedBox(height: 16),

                      // KPI cards
                      if (overview.kpis != null) KpiRow(kpis: overview.kpis!),
                      const SizedBox(height: 20),

                      // Daily trends line chart
                      if (overview.series != null)
                        DailyTrendsChart(
                          eventsDaily: overview.series!.eventsDaily,
                          reservationsDaily: overview.series!.reservationsDaily,
                        ),
                      const SizedBox(height: 20),

                      // Funnel
                      if (overview.funnel != null && overview.funnel!.steps.isNotEmpty)
                        FunnelChart(funnel: overview.funnel!),
                      const SizedBox(height: 20),

                      // Breakdowns: donut + bar side by side (or stacked on narrow screens)
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
        padding: const EdgeInsets.all(32),
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
