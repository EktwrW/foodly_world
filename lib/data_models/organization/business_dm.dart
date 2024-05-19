import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/data_models/organization/business_cover_image_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/core/enums/foodly_categories_enums.dart';
export 'package:foodly_world/data_models/organization/business_cover_image_dm.dart';

part 'business_dm.freezed.dart';
part 'business_dm.g.dart';

@freezed
class BusinessDM with _$BusinessDM {
  const BusinessDM._();

  const factory BusinessDM({
    @JsonKey(name: 'business_id') int? intId,
    @JsonKey(name: 'business_logo') String? logo,
    @JsonKey(name: 'cover_images') @Default([]) List<BusinessCoverImageDM> coverImages,
    @JsonKey(name: 'branches') @Default([]) List<Object> branches,
    @JsonKey(name: 'business_uuid') String? id,
    @JsonKey(name: 'business_name') String? name,
    @JsonKey(name: 'business_about_us') String? aboutUs,
    @JsonKey(name: 'business_services') List<String>? services,
    @JsonKey(name: 'business_additional_info') String? additionalInfo,
    @JsonKey(name: 'business_email') String? email,
    @JsonKey(name: 'business_phone') String? phoneNumber,
    @JsonKey(name: 'business_address') String? address,
    @JsonKey(name: 'business_zipcode') String? zipCode,
    @JsonKey(name: 'business_city') String? city,
    @JsonKey(name: 'business_country') String? country,
    @JsonKey(name: 'business_website') String? website,
    @JsonKey(name: 'business_opening_hours') String? openingHours,
    @JsonKey(name: 'business_latitude') double? latitude,
    @JsonKey(name: 'business_longitude') double? longitude,
    @JsonKey(name: 'category_id') FoodlyCategories? category,
  }) = _BusinessDM;

  factory BusinessDM.fromJson(Map<String, dynamic> json) => _$BusinessDMFromJson(json);

  String get fullAddress {
    return [
      address,
      city,
      zipCode,
      country,
    ].where((element) => element != null && element.isNotEmpty).join(', ');
  }

  List<String> get coverImageUrls {
    if (coverImages.isNotEmpty) {
      return coverImages.map((e) => e.url ?? '').toList();
    }
    return [];
  }
}
