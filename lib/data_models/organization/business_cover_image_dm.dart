import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_cover_image_dm.freezed.dart';
part 'business_cover_image_dm.g.dart';

@freezed
class BusinessCoverImageDM with _$BusinessCoverImageDM {
  const BusinessCoverImageDM._();

  const factory BusinessCoverImageDM({
    @JsonKey(name: 'id') int? intId,
    @JsonKey(name: 'business_image_uuid') String? imageId,
    @JsonKey(name: 'business_image_path') String? url,
    @JsonKey(name: 'business_id') int? businessId,
    @JsonKey(name: 'created_at') DateTime? dateCreated,
    @JsonKey(name: 'updated_at') DateTime? dateUpdated,
  }) = _BusinessCoverImageDM;

  factory BusinessCoverImageDM.fromJson(Map<String, dynamic> json) => _$BusinessCoverImageDMFromJson(json);
}
