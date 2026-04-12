import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_vm.freezed.dart';

@freezed
class AnalyticsVM with _$AnalyticsVM {
  const factory AnalyticsVM({
    BusinessOverviewDataDM? overview,
    @Default(30) int selectedDays,
    String? businessUuid,
  }) = _AnalyticsVM;
}
