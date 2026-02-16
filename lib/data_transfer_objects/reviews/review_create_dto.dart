import 'package:foodly_world/core/enums/review_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/core/enums/review_enums.dart';

part 'review_create_dto.freezed.dart';
part 'review_create_dto.g.dart';

@freezed
class ReviewCreateDTO with _$ReviewCreateDTO {
  const factory ReviewCreateDTO({
    @JsonKey(name: 'business_uuid') required String businessUuid,
    required int rating,
    @JsonKey(name: 'review_type') ReviewType? reviewType,
    String? comment,
    @JsonKey(name: 'business_visited_at') String? businessVisitedAt,
  }) = _ReviewCreateDTO;

  factory ReviewCreateDTO.fromJson(Map<String, dynamic> json) => _$ReviewCreateDTOFromJson(json);
}
