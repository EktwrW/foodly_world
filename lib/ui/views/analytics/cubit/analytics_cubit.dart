import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/analytics/dashboard_repo.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'analytics_cubit.freezed.dart';
part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final DashboardRepo _dashboardRepo;
  final Logger _logger;
  AnalyticsVM _vm;

  /// Constructor takes the FULL [BusinessDM] (not just the uuid as before)
  /// so we can derive the [AnalyticsKind] up-front from `categoryId` —
  /// that decides whether to call `/analytics/business-overview` or the
  /// upcoming `/analytics/service-overview`. The router already passes the
  /// business via `state.extra` (see business_footer_buttons.dart:79), so
  /// no upstream callsite needs to change to make the BusinessDM available.
  AnalyticsCubit({
    required DashboardRepo dashboardRepo,
    required Logger logger,
    required BusinessDM business,
  })  : _dashboardRepo = dashboardRepo,
        _logger = logger,
        _vm = AnalyticsVM(
          business: business,
          kind: _deriveKind(business),
        ),
        super(const AnalyticsState.initial(AnalyticsVM()));

  /// Maps a business to the analytics flavour it should render. Today the
  /// only signal is `categoryId == cateringAndChefs` (id 26 in the BE).
  /// A future fallback — "business has at least one active service_package" —
  /// would require a side fetch or a flag on `BusinessDM` (e.g.
  /// `has_active_packages`); deferred until needed because the category-id
  /// check covers the canonical case for Phase 1.
  static AnalyticsKind _deriveKind(BusinessDM business) {
    if (business.categoryId == FoodlyCategories.cateringAndChefs) {
      return AnalyticsKind.service;
    }
    return AnalyticsKind.restaurant;
  }

  Future<void> fetchOverview() async {
    emit(AnalyticsState.loading(_vm));

    // Branch by analytics flavour. Catering & chefs hit Mateo's
    // /analytics/service-overview which returns a service-shaped payload
    // (bookings + funnel of 6 service.* events + top_packages). Everything
    // else hits the legacy /analytics/business-overview (reservations,
    // reviews, favorites, business.* funnel).
    if (_vm.kind == AnalyticsKind.service) {
      final result = await _dashboardRepo.getServiceOverview(
        days: _vm.selectedDays,
        businessUuid: _vm.business?.uuid,
      );

      result.when(
        success: (response) {
          // Clear `overview` on the way in so a manager who somehow
          // toggles between flavours can't end up with stale data from
          // the previous fetch lingering in the VM.
          _vm = _vm.copyWith(serviceOverview: response.data, overview: null);
          emit(AnalyticsState.loaded(_vm));
        },
        failure: (error) {
          _logger.e(error);
          emit(AnalyticsState.error(_vm, error.toString()));
        },
      );
      return;
    }

    final result = await _dashboardRepo.getBusinessOverview(
      days: _vm.selectedDays,
      businessUuid: _vm.business?.uuid,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(overview: response.data, serviceOverview: null);
        emit(AnalyticsState.loaded(_vm));
      },
      failure: (error) {
        _logger.e(error);
        emit(AnalyticsState.error(_vm, error.toString()));
      },
    );
  }

  void changePeriod(int days) {
    _vm = _vm.copyWith(selectedDays: days);
    fetchOverview();
  }
}
