import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/business_availability/business_availability_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'business_availability_client.g.dart';

/// Retrofit client for the BusinessAvailability endpoints (Catering & Chefs
/// vertical calendar). The manager routes sit under `/business-availability`
/// (auth required); the public slot list is served from
/// `/public/business-availability/{businessUuid}` (rate-limited, no auth).
///
/// Dates are always sent as `YYYY-MM-DD` and times as `HH:MM` or `HH:MM:SS`.
/// Partial blocks require both `start_time` and `end_time`; full-day blocks
/// MUST omit them (the BE validates this).
@RestApi()
abstract class BusinessAvailabilityClient {
  factory BusinessAvailabilityClient(Dio dio) = _BusinessAvailabilityClient;

  // ── Manager (auth:api) ─────────────────────────────────────────

  /// List all calendar entries for a business in the [from, to] window.
  /// Both dates are inclusive. When omitted, the BE defaults to today + 90d.
  @GET('/business-availability/business/{businessUuid}')
  Future<BusinessAvailabilityResponseDM> getBusinessAvailability(
    @Path('businessUuid') String businessUuid, {
    @Query('from') String? from,
    @Query('to') String? to,
  });

  /// Create a single calendar entry (full-day or partial).
  @POST('/business-availability/store')
  Future<BusinessAvailabilityCreateResponseDM> createAvailability({
    @Field('business_uuid') required String businessUuid,
    @Field('date') required String date,
    @Field('is_full_day') required bool isFullDay,
    @Field('start_time') String? startTime,
    @Field('end_time') String? endTime,
    @Field('reason') String? reason,
  });

  /// Bulk-create calendar entries. Each entry in [entries] is a map with
  /// keys `date`, `is_full_day`, optional `start_time` / `end_time`.
  /// The `reason` applies to all entries created in this call.
  @POST('/business-availability/bulk')
  Future<BusinessAvailabilityBulkResponseDM> createBulkAvailability({
    @Field('business_uuid') required String businessUuid,
    @Field('reason') String? reason,
    @Field('entries') required List<Map<String, dynamic>> entries,
  });

  /// Update an existing entry. Only `manual` entries can be updated —
  /// auto-reservation rows return 403 on the BE.
  @PATCH('/business-availability/update/{uuid}')
  Future<BusinessAvailabilityCreateResponseDM> updateAvailability(
    @Path('uuid') String uuid, {
    @Field('date') String? date,
    @Field('is_full_day') bool? isFullDay,
    @Field('start_time') String? startTime,
    @Field('end_time') String? endTime,
    @Field('reason') String? reason,
  });

  /// Delete an entry. Same restriction — manual entries only.
  @DELETE('/business-availability/destroy/{uuid}')
  Future<BusinessAvailabilityActionResponseDM> destroyAvailability(
    @Path('uuid') String uuid,
  );

  // ── Public (no auth, rate-limited) ─────────────────────────────

  /// Stripped-down calendar for customers on the public menu page.
  /// Only date + time range is exposed — no reason, no source, no UUID.
  @GET('/public/business-availability/{businessUuid}')
  Future<PublicBusinessAvailabilityResponseDM> getPublicAvailability(
    @Path('businessUuid') String businessUuid, {
    @Query('from') String? from,
    @Query('to') String? to,
  });
}
