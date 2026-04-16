import 'package:dio/dio.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/service_packages/service_package_client.dart';
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';

class ServicePackageRepo {
  final ServicePackageClient _client;

  const ServicePackageRepo({required ServicePackageClient client}) : _client = client;

  // ── Professional Profile ───────────────────────────────────

  Future<ApiResult<ProfessionalProfileResponseDM>> getProfile(String businessUuid) async {
    try {
      return ApiResult.success(await _client.getProfile(businessUuid: businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ProfessionalProfileResponseDM>> createOrUpdateProfile(Map<String, dynamic> data) async {
    try {
      return ApiResult.success(await _client.createOrUpdateProfile(data));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ProfessionalProfileResponseDM>> updateProfile(String uuid, Map<String, dynamic> data) async {
    try {
      return ApiResult.success(await _client.updateProfile(uuid, data));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ProfessionalProfileResponseDM>> getPublicProfile(String businessUuid) async {
    try {
      return ApiResult.success(await _client.getPublicProfile(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── Service Packages ───────────────────────────────────────

  Future<ApiResult<ServicePackagesResponseDM>> getPackages(String businessUuid) async {
    try {
      return ApiResult.success(await _client.getPackages(businessUuid: businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ServicePackageActionResponseDM>> createPackage(Map<String, dynamic> data) async {
    try {
      return ApiResult.success(await _client.createPackage(data));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ServicePackageActionResponseDM>> getPackage(String uuid) async {
    try {
      return ApiResult.success(await _client.getPackage(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ServicePackageActionResponseDM>> updatePackage(String uuid, Map<String, dynamic> data) async {
    try {
      return ApiResult.success(await _client.updatePackage(uuid, data));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GenericSuccessResponseDM>> deletePackage(String uuid) async {
    try {
      return ApiResult.success(await _client.deletePackage(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GenericSuccessResponseDM>> reorderPackages(Map<String, dynamic> data) async {
    try {
      return ApiResult.success(await _client.reorderPackages(data));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ServicePackagesResponseDM>> getPublicPackages(String businessUuid) async {
    try {
      return ApiResult.success(await _client.getPublicPackages(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── Service Package Photos ─────────────────────────────────

  Future<ApiResult<PhotoUploadResponseDM>> uploadPhotos(
    String servicePackageUuid,
    List<MultipartFile> photos,
  ) async {
    try {
      return ApiResult.success(await _client.uploadPhotos(servicePackageUuid, photos));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GenericSuccessResponseDM>> updatePhoto(String uuid, MultipartFile photo) async {
    try {
      return ApiResult.success(await _client.updatePhoto(uuid, photo));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GenericSuccessResponseDM>> deletePhoto(String uuid) async {
    try {
      return ApiResult.success(await _client.deletePhoto(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GenericSuccessResponseDM>> reorderPhotos(Map<String, dynamic> data) async {
    try {
      return ApiResult.success(await _client.reorderPhotos(data));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
