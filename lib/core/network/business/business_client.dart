import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/organization/business_dm.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'business_client.g.dart';

@RestApi()
abstract class BusinessClient {
  factory BusinessClient(Dio dio) = _BusinessClient;

  @GET('/business/{uuid}')
  Future<BusinessDM> fetchBusinessById(@Path('uuid') String id);

  @POST('/business-update/{uuid}')
  Future<BusinessDM> updateBusiness(@Path('uuid') String id, @Queries() BusinessUpdateDTO loginDT);

  @POST('/business-store')
  @MultiPart()
  Future<BusinessDM> register({
    @Part(name: 'business_name') required String businessName,
    @Part(name: 'business_email') required String businessEmail,
    @Part(name: 'business_phone') required String businessPhone,
    @Part(name: 'business_address') required String businessAddress,
    @Part(name: 'business_zipcode') required String businessZipcode,
    @Part(name: 'business_city') required String businessCity,
    @Part(name: 'business_country') required String businessCountry,
    @Part(name: 'business_website') required String? businessWebsite,
    @Part(name: 'business_latitude') required double? businessLatitude,
    @Part(name: 'business_longitude') required double? businessLongitude,
    @Part(name: 'category_id') required int categoryId,
    @Part(name: 'business_logo') required List<MultipartFile> photo,
  });
}
