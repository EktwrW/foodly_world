import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'service_package_client.g.dart';

@RestApi()
abstract class ServicePackageClient {
  factory ServicePackageClient(Dio dio) = _ServicePackageClient;

  // ── Professional Profile ───────────────────────────────────

  @GET('/professional-profile')
  Future<ProfessionalProfileResponseDM> getProfile({
    @Query('business_uuid') required String businessUuid,
  });

  @POST('/professional-profile/store')
  Future<ProfessionalProfileResponseDM> createOrUpdateProfile(
    @Body() Map<String, dynamic> data,
  );

  @PATCH('/professional-profile/update/{uuid}')
  Future<ProfessionalProfileResponseDM> updateProfile(
    @Path('uuid') String uuid,
    @Body() Map<String, dynamic> data,
  );

  @GET('/public/professional-profile/{businessUuid}')
  Future<ProfessionalProfileResponseDM> getPublicProfile(
    @Path('businessUuid') String businessUuid,
  );

  // ── Service Packages ───────────────────────────────────────

  @GET('/service-packages')
  Future<ServicePackagesResponseDM> getPackages({
    @Query('business_uuid') required String businessUuid,
  });

  @POST('/service-packages/store')
  Future<ServicePackageActionResponseDM> createPackage(
    @Body() Map<String, dynamic> data,
  );

  @GET('/service-packages/{uuid}')
  Future<ServicePackageActionResponseDM> getPackage(
    @Path('uuid') String uuid,
  );

  @PATCH('/service-packages/update/{uuid}')
  Future<ServicePackageActionResponseDM> updatePackage(
    @Path('uuid') String uuid,
    @Body() Map<String, dynamic> data,
  );

  @DELETE('/service-packages/delete/{uuid}')
  Future<GenericSuccessResponseDM> deletePackage(
    @Path('uuid') String uuid,
  );

  @POST('/service-packages/reorder')
  Future<GenericSuccessResponseDM> reorderPackages(
    @Body() Map<String, dynamic> data,
  );

  @GET('/public/service-packages/{businessUuid}')
  Future<ServicePackagesResponseDM> getPublicPackages(
    @Path('businessUuid') String businessUuid,
  );

  // ── Service Package Photos ─────────────────────────────────

  @POST('/service-package-photos/store')
  @MultiPart()
  Future<PhotoUploadResponseDM> uploadPhotos({
    @Part(name: 'service_package_uuid') required String servicePackageUuid,
    @Part(name: 'photos[]') required List<MultipartFile> photos,
  });

  @POST('/service-package-photos/update/{uuid}')
  @MultiPart()
  Future<GenericSuccessResponseDM> updatePhoto(
    @Path('uuid') String uuid, {
    @Part(name: 'photo') required List<MultipartFile> photo,
  });

  @DELETE('/service-package-photos/delete/{uuid}')
  Future<GenericSuccessResponseDM> deletePhoto(
    @Path('uuid') String uuid,
  );

  @POST('/service-package-photos/reorder')
  Future<GenericSuccessResponseDM> reorderPhotos(
    @Body() Map<String, dynamic> data,
  );
}
