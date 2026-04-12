import 'package:foodly_world/core/network/analytics/dashboard_client.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';

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
}
