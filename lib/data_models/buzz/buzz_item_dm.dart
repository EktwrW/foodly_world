import 'package:freezed_annotation/freezed_annotation.dart';

part 'buzz_item_dm.freezed.dart';
part 'buzz_item_dm.g.dart';

@freezed
class BuzzResponseDM with _$BuzzResponseDM {
  const factory BuzzResponseDM({
    @Default([]) List<BuzzItemDM> data,
    BuzzMetaDM? meta,
  }) = _BuzzResponseDM;

  factory BuzzResponseDM.fromJson(Map<String, dynamic> json) => _$BuzzResponseDMFromJson(json);
}

@freezed
class BuzzMetaDM with _$BuzzMetaDM {
  const factory BuzzMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
  }) = _BuzzMetaDM;

  factory BuzzMetaDM.fromJson(Map<String, dynamic> json) => _$BuzzMetaDMFromJson(json);
}

@freezed
class BuzzItemDM with _$BuzzItemDM {
  const factory BuzzItemDM({
    required String uuid,
    @Default('') String message,
    @JsonKey(name: 'sub_type') @Default('') String subType,
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_photo') String? businessPhoto,
    @JsonKey(name: 'menu_uuid') String? menuUuid,
    @JsonKey(name: 'entity_name') String? entityName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _BuzzItemDM;

  factory BuzzItemDM.fromJson(Map<String, dynamic> json) => _$BuzzItemDMFromJson(json);
}
