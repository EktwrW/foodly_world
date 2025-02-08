import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_body_register_dto.g.dart';

@JsonSerializable()
class BusinessBodyRegisterDTO {
  @JsonKey(name: 'business_name')
  final String businessName;

  @JsonKey(name: 'business_email')
  final String businessEmail;

  @JsonKey(name: 'business_phone')
  final String businessPhone;

  @JsonKey(name: 'business_address')
  final String businessAddress;

  @JsonKey(name: 'business_zipcode')
  final String businessZipcode;

  @JsonKey(name: 'business_city')
  final String businessCity;

  @JsonKey(name: 'business_country')
  final FoodlyCountries businessCountry;

  @JsonKey(name: 'business_website')
  final String businessWebsite;

  @JsonKey(name: 'business_latitude')
  final double? businessLatitude;

  @JsonKey(name: 'business_longitude')
  final double? businessLongitude;

  @JsonKey(name: 'category_id')
  final FoodlyCategories categoryId;

  const BusinessBodyRegisterDTO({
    required this.businessName,
    required this.businessEmail,
    required this.businessPhone,
    required this.businessAddress,
    required this.businessZipcode,
    required this.businessCity,
    required this.businessCountry,
    required this.businessWebsite,
    required this.businessLatitude,
    required this.businessLongitude,
    required this.categoryId,
  });

  factory BusinessBodyRegisterDTO.fromJson(Map<String, dynamic> json) => _$BusinessBodyRegisterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessBodyRegisterDTOToJson(this);
}
