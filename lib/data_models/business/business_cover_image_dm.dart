import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_cover_image_dm.freezed.dart';
part 'business_cover_image_dm.g.dart';

@freezed
abstract class BusinessCoverImageDM with _$BusinessCoverImageDM {
  const BusinessCoverImageDM._();

  const factory BusinessCoverImageDM({
    @JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
    @JsonKey(name: 'business_image_uuid') String? imageId,
    @JsonKey(name: 'business_image_path') String? url,
    @JsonKey(name: 'business_id', fromJson: _intFromJson) int? businessId,
    @JsonKey(name: 'created_at') DateTime? dateCreated,
    @JsonKey(name: 'updated_at') DateTime? dateUpdated,
  }) = _BusinessCoverImageDM;

  factory BusinessCoverImageDM.fromJson(Map<String, dynamic> json) => _$BusinessCoverImageDMFromJson(json);
}

// Helper to accept both numeric and string values for id fields coming from the API.
int? _intFromJson(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  try {
    return int.parse(value.toString());
  } catch (_) {
    return null;
  }
}
