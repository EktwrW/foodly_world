import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business_availability/business_availability_client.dart';
import 'package:foodly_world/data_models/business_availability/business_availability_dm.dart';

/// Repository wrapper around [BusinessAvailabilityClient] that converts
/// Dio exceptions into [ApiResult.failure] so the BLoCs can pattern-match
/// on `success` / `failure` without try/catch.
class BusinessAvailabilityRepo {
  final BusinessAvailabilityClient _client;

  const BusinessAvailabilityRepo({
    required BusinessAvailabilityClient client,
  }) : _client = client;

  // ── Manager ────────────────────────────────────────────────────

  Future<ApiResult<BusinessAvailabilityResponseDM>> getBusinessAvailability(
    String businessUuid, {
    String? from,
    String? to,
  }) async {
    try {
      return ApiResult.success(
        await _client.getBusinessAvailability(
          businessUuid,
          from: from,
          to: to,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessAvailabilityCreateResponseDM>> createAvailability({
    required String businessUuid,
    required String date,
    required bool isFullDay,
    String? startTime,
    String? endTime,
    String? reason,
  }) async {
    try {
      return ApiResult.success(
        await _client.createAvailability(
          businessUuid: businessUuid,
          date: date,
          isFullDay: isFullDay,
          startTime: startTime,
          endTime: endTime,
          reason: reason,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Convenience wrapper that maps a list of [BusinessAvailabilityBulkEntryDM]
  /// to the raw JSON shape the BE expects.
  Future<ApiResult<BusinessAvailabilityBulkResponseDM>> createBulkAvailability({
    required String businessUuid,
    String? reason,
    required List<BusinessAvailabilityBulkEntryDM> entries,
  }) async {
    try {
      return ApiResult.success(
        await _client.createBulkAvailability(
          businessUuid: businessUuid,
          reason: reason,
          entries: entries.map((e) => e.toJson()).toList(),
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessAvailabilityCreateResponseDM>> updateAvailability(
    String uuid, {
    String? date,
    bool? isFullDay,
    String? startTime,
    String? endTime,
    String? reason,
  }) async {
    try {
      return ApiResult.success(
        await _client.updateAvailability(
          uuid,
          date: date,
          isFullDay: isFullDay,
          startTime: startTime,
          endTime: endTime,
          reason: reason,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessAvailabilityActionResponseDM>> destroyAvailability(
    String uuid,
  ) async {
    try {
      return ApiResult.success(await _client.destroyAvailability(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── Public ─────────────────────────────────────────────────────

  Future<ApiResult<PublicBusinessAvailabilityResponseDM>> getPublicAvailability(
    String businessUuid, {
    String? from,
    String? to,
  }) async {
    try {
      return ApiResult.success(
        await _client.getPublicAvailability(
          businessUuid,
          from: from,
          to: to,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
