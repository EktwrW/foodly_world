import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_update_dto.freezed.dart';
part 'business_update_dto.g.dart';

@freezed
class BusinessUpdateDTO with _$BusinessUpdateDTO {
  const factory BusinessUpdateDTO({
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'business_about_us') String? businessAboutUs,
    @JsonKey(name: 'business_additional_info') String? businessAdditionalInfo,
    @JsonKey(name: 'business_services[]') List<BusinessServices>? businessServices,
    @JsonKey(name: 'business_email') String? businessEmail,
    @JsonKey(name: 'business_phone') String? businessPhone,
    @JsonKey(name: 'business_address') String? businessAddress,
    @JsonKey(name: 'business_zipcode') String? businessZipcode,
    @JsonKey(name: 'business_city') String? businessCity,
    @JsonKey(name: 'business_country') FoodlyCountries? businessCountry,
    @JsonKey(name: 'business_website') String? businessWebsite,
    @JsonKey(name: 'business_latitude') double? businessLatitude,
    @JsonKey(name: 'business_longitude') double? businessLongitude,
    @JsonKey(name: 'category_id') FoodlyCategories? category,
  }) = _BusinessUpdateDTO;

  factory BusinessUpdateDTO.fromJson(Map<String, dynamic> json) => _$BusinessUpdateDTOFromJson(json);
}
