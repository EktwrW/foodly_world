import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_dm.freezed.dart';
part 'business_dm.g.dart';

@freezed
class BusinessDM with _$BusinessDM {
  const factory BusinessDM({
    @JsonKey(name: 'id') int? intId,
    @JsonKey(name: 'business_image_path') String? logo,
    @JsonKey(name: 'business_uuid') String? id,
    @JsonKey(name: 'business_name') String? name,
    @JsonKey(name: 'business_email') String? email,
    @JsonKey(name: 'business_address') String? address,
    @JsonKey(name: 'business_zipcode') String? zipCode,
    @JsonKey(name: 'business_city') String? city,
    @JsonKey(name: 'business_country') String? country,
    @JsonKey(name: 'business_website') String? website,
    @JsonKey(name: 'business_opening_hours') String? openingHours,
    @JsonKey(name: 'business_latitude') double? latitude,
    @JsonKey(name: 'business_longitude') double? longitude,
    @JsonKey(name: 'category_id') int? categoryId,
  }) = _BusinessDM;

  factory BusinessDM.fromJson(Map<String, dynamic> json) => _$BusinessDMFromJson(json);
}

enum BusinessPlan {
  @JsonValue('free')
  free,
  @JsonValue('plan3')
  plan3,
  @JsonValue('plan6')
  plan6,
  @JsonValue('plan9')
  plan9,
}

extension BusinessPlanExtension on BusinessPlan {
  String get value {
    switch (this) {
      case BusinessPlan.free:
        return 'free';
      case BusinessPlan.plan3:
        return 'plan3';
      case BusinessPlan.plan6:
        return 'plan6';
      case BusinessPlan.plan9:
        return 'plan9';
      default:
        return 'free';
    }
  }
}
