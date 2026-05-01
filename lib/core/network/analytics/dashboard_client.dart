import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';
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

  /// Catering & chefs vertical analytics. Same auth + query-params contract
  /// as [getBusinessOverview], different response shape — see
  /// [ServiceOverviewResponseDM] for the (PROVISIONAL) deduced field set.
  ///
  /// As of 2026-04-28 the endpoint is implemented on Mateo's branch but
  /// hasn't landed in `main` (a deploy from `main` returns 404). Wired up
  /// here so the Retrofit client is ready the moment the merge happens —
  /// no consumer calls this yet, see DashboardRepo / AnalyticsCubit comments.
  @GET('/analytics/service-overview')
  Future<ServiceOverviewResponseDM> getServiceOverview({
    @Query('days') int? days,
    @Query('business_uuid') String? businessUuid,
    @Query('owner_user_id') int? ownerUserId,
  });
}
