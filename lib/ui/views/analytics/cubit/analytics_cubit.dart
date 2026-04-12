import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/analytics/dashboard_repo.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'analytics_cubit.freezed.dart';
part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final DashboardRepo _dashboardRepo;
  final Logger _logger;
  AnalyticsVM _vm;

  AnalyticsCubit({
    required DashboardRepo dashboardRepo,
    required Logger logger,
    required String businessUuid,
  })  : _dashboardRepo = dashboardRepo,
        _logger = logger,
        _vm = AnalyticsVM(businessUuid: businessUuid),
        super(const AnalyticsState.initial(AnalyticsVM()));

  Future<void> fetchOverview() async {
    emit(AnalyticsState.loading(_vm));

    final result = await _dashboardRepo.getBusinessOverview(
      days: _vm.selectedDays,
      businessUuid: _vm.businessUuid,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(overview: response.data);
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
