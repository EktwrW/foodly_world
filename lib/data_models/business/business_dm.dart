import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/core/enums/business_enums.dart';
export 'package:foodly_world/core/enums/foodly_categories_enums.dart';
export 'package:foodly_world/data_models/business/business_cover_image_dm.dart';
export 'package:foodly_world/data_models/business/opening_hours_dm.dart';

part 'business_dm.freezed.dart';
part 'business_dm.g.dart';

@freezed
class BusinessDM with _$BusinessDM {
  const BusinessDM._();

  const factory BusinessDM({
    @JsonKey(name: 'id') int? intId,
    @JsonKey(name: 'business_logo') @Default(FoodlyStrings.LOGO_PLACEHOLDER) String logo,
    @JsonKey(name: 'cover_images') @Default([]) List<BusinessCoverImageDM> coverImages,
    @JsonKey(name: 'branches') @Default([]) List<BusinessDM> branches,
    @JsonKey(name: 'business_uuid') @Default('') String uuid,
    @JsonKey(name: 'business_name') String? name,
    @JsonKey(name: 'business_about_us') String? aboutUs,
    @JsonKey(name: 'business_services') List<BusinessServicesDM>? services,
    @JsonKey(name: 'business_promotions') List<PromotionDM>? promotions,
    @JsonKey(name: 'business_additional_info') String? additionalInfo,
    @JsonKey(name: 'business_email') String? email,
    @JsonKey(name: 'business_phone') String? phoneNumber,
    @JsonKey(name: 'business_address') String? address,
    @JsonKey(name: 'business_zipcode') String? zipCode,
    @JsonKey(name: 'business_city') String? city,
    @JsonKey(name: 'business_country') FoodlyCountries? country,
    @JsonKey(name: 'business_menus') @Default([]) List<MenuDM> menus,
    @JsonKey(name: 'business_latitude') double? latitude,
    @JsonKey(name: 'business_longitude') double? longitude,
    @JsonKey(name: 'category_id') FoodlyCategories? categoryId,
    @JsonKey(name: 'category') CategoryDM? category,
    @JsonKey(name: 'rating_avg') double? rating,
    @JsonKey(name: 'ratings_count') int? ratingsCount,
    @JsonKey(name: 'business_opening_hours') @Default(BusinessDays()) BusinessDays businessDays,
    @JsonKey(name: 'followers_length') @Default(0) int followersLength,

    // This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
    @Default([]) List<ReviewDM> reviews,
  }) = _BusinessDM;

  factory BusinessDM.fromJson(Map<String, dynamic> json) => _$BusinessDMFromJson(json);

  String get fullAddress {
    return [
      address,
      city,
      zipCode,
      country?.value,
    ].where((element) => element != null && element.isNotEmpty).join(', ');
  }

  List<String> get coverImageUrls {
    if (coverImages.isNotEmpty) {
      return coverImages.map((e) => e.url ?? '').toList();
    }
    return [];
  }

  List<BusinessServices> get businessServices =>
      (services?.isEmpty ?? true)
          ? []
          : services!.where((s) => s.service != null).map((s) => s.service!).toList()
        ..sort((a, b) => a.value.compareTo(b.value));
}

@freezed
class CategoryDM with _$CategoryDM {
  const factory CategoryDM({
    @JsonKey(name: 'id') FoodlyCategories? id,
    @JsonKey(name: 'category_uuid') String? categoryUuid,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_image_path') String? categoryImagePath,
  }) = _CategoryDM;

  factory CategoryDM.fromJson(Map<String, dynamic> json) => _$CategoryDMFromJson(json);
}

@freezed
class BusinessServicesDM with _$BusinessServicesDM {
  const BusinessServicesDM._();
  const factory BusinessServicesDM({
    @JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue) BusinessServices? service,
    @JsonKey(name: 'service_uuid') String? uuid,
    @JsonKey(name: 'service_name') String? serviceName,
    @JsonKey(name: 'service_description') String? serviceDescriptio,
    @JsonKey(name: 'service_image_path') String? serviceImagePath,
  }) = _BusinessServiceDM;

  factory BusinessServicesDM.fromJson(Map<String, dynamic> json) => _$BusinessServicesDMFromJson(json);
}
