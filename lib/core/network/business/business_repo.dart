import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business/business_client.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler_selector.dart';
import 'package:foodly_world/data_models/organization/business_dm.dart';
import 'package:foodly_world/data_transfer_objects/business/business_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';

class BusinessRepo {
  final BusinessClient _businessClient;

  BusinessRepo({required BusinessClient businessClient}) : _businessClient = businessClient;

  Future<ApiResult<BusinessDM>> fetchBusinessById(String id) async {
    try {
      return ApiResult.success(await _businessClient.fetchBusinessById(id));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessDM>> updateBusiness(String id, BusinessUpdateDTO businessUpdateDTO) async {
    try {
      return ApiResult.success(await _businessClient.updateBusiness(id, businessUpdateDTO));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessDM>> register({
    required BusinessBodyRegisterDTO registerDTO,
    String? filePath,
  }) async {
    final fileHandler = getFileHandler();
    final photoMultipartFile = await fileHandler.getMultipartFile(filePath);

    try {
      return ApiResult.success(await _businessClient.register(
        businessName: registerDTO.businessName,
        businessEmail: registerDTO.businessEmail,
        businessPhone: registerDTO.businessPhone,
        businessCountry: registerDTO.businessCountry,
        businessCity: registerDTO.businessCity,
        businessAddress: registerDTO.businessAddress,
        businessZipcode: registerDTO.businessZipcode,
        businessLatitude: registerDTO.businessLatitude,
        businessLongitude: registerDTO.businessLongitude,
        businessWebsite: registerDTO.businessWebsite,
        categoryId: registerDTO.categoryId.index,
        photo: photoMultipartFile != null ? [photoMultipartFile] : [],
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
