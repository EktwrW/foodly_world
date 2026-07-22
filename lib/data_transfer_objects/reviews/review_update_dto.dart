import 'package:foodly_world/core/enums/review_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_update_dto.freezed.dart';
part 'review_update_dto.g.dart';

@freezed
abstract class ReviewUpdateDTO with _$ReviewUpdateDTO {
  const factory ReviewUpdateDTO({
    int? rating,
    @JsonKey(name: 'review_type') ReviewType? reviewType,
    String? comment,
    @JsonKey(name: 'business_visited_at') String? businessVisitedAt,
  }) = _ReviewUpdateDTO;

  factory ReviewUpdateDTO.fromJson(Map<String, dynamic> json) => _$ReviewUpdateDTOFromJson(json);
}
