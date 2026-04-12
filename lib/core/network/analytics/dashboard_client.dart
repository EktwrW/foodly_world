import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'dashboard_client.g.dart';

@RestApi()
abstract class DashboardClient {
  factory DashboardClient(Dio dio) = _DashboardClient;

  @GET('/analytics/business-overview')
  Future<BusinessOverviewResponseDM> getBusinessOverview({
    @Query('days') int? days,
    @Query('business_uuid') String? businessUuid,
    @Query('owner_user_id') int? ownerUserId,
  });
}
