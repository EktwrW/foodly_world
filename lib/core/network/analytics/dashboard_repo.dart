import 'package:foodly_world/core/network/analytics/dashboard_client.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';

class DashboardRepo {
  final DashboardClient _dashboardClient;

  const DashboardRepo({required DashboardClient dashboardClient})
      : _dashboardClient = dashboardClient;

  Future<ApiResult<BusinessOverviewResponseDM>> getBusinessOverview({
    int? days,
    String? businessUuid,
    int? ownerUserId,
  }) async {
    try {
      return ApiResult.success(
        await _dashboardClient.getBusinessOverview(
          days: days,
          businessUuid: businessUuid,
          ownerUserId: ownerUserId,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Catering & chefs vertical analytics. Mirrors [getBusinessOverview] —
  /// same ApiResult wrapping convention, same exception swallowing — but
  /// hits the service-overview endpoint and returns the service-shape DM.
  ///
  /// Not consumed by [AnalyticsCubit] yet because the endpoint isn't in
  /// `main` of the NLP service (calling it today returns 404). Once Mateo
  /// merges, flip the branch in `AnalyticsCubit.fetchOverview()` to call
  /// this when `_vm.kind == AnalyticsKind.service`.
  Future<ApiResult<ServiceOverviewResponseDM>> getServiceOverview({
    int? days,
    String? businessUuid,
    int? ownerUserId,
  }) async {
    try {
      return ApiResult.success(
        await _dashboardClient.getServiceOverview(
          days: days,
          businessUuid: businessUuid,
          ownerUserId: ownerUserId,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
