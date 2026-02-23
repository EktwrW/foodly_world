import 'package:foodly_world/core/enums/review_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_dm.freezed.dart';
part 'review_dm.g.dart';

@freezed
class ReviewsResponseDM with _$ReviewsResponseDM {
  const factory ReviewsResponseDM({
    @Default([]) List<ReviewDM> reviews,
    ReviewsMetaDM? meta,
  }) = _ReviewsResponseDM;

  factory ReviewsResponseDM.fromJson(Map<String, dynamic> json) => _$ReviewsResponseDMFromJson(json);
}

@freezed
class ReviewsMetaDM with _$ReviewsMetaDM {
  const factory ReviewsMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'average_rating') @Default(0) double averageRating,
    @JsonKey(name: 'ratings_count') @Default(0) int ratingsCount,
  }) = _ReviewsMetaDM;

  factory ReviewsMetaDM.fromJson(Map<String, dynamic> json) => _$ReviewsMetaDMFromJson(json);
}

@freezed
class ReviewCheckResponseDM with _$ReviewCheckResponseDM {
  const factory ReviewCheckResponseDM({
    @JsonKey(name: 'has_reviewed') @Default(false) bool hasReviewed,
    ReviewDM? review,
  }) = _ReviewCheckResponseDM;

  factory ReviewCheckResponseDM.fromJson(Map<String, dynamic> json) => _$ReviewCheckResponseDMFromJson(json);
}

@freezed
class ReviewCreateResponseDM with _$ReviewCreateResponseDM {
  const factory ReviewCreateResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReviewDM? review,
  }) = _ReviewCreateResponseDM;

  factory ReviewCreateResponseDM.fromJson(Map<String, dynamic> json) => _$ReviewCreateResponseDMFromJson(json);
}

@freezed
class ReviewUpdateResponseDM with _$ReviewUpdateResponseDM {
  const factory ReviewUpdateResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReviewDM? review,
  }) = _ReviewUpdateResponseDM;

  factory ReviewUpdateResponseDM.fromJson(Map<String, dynamic> json) => _$ReviewUpdateResponseDMFromJson(json);
}

@freezed
class ReviewPhotoDM with _$ReviewPhotoDM {
  const factory ReviewPhotoDM({
    @JsonKey(name: 'photo_uuid') String? photoUuid,
    @JsonKey(name: 'photo_url') String? photoUrl,
  }) = _ReviewPhotoDM;

  factory ReviewPhotoDM.fromJson(Map<String, dynamic> json) => _$ReviewPhotoDMFromJson(json);
}

@freezed
class ReviewDM with _$ReviewDM {
  const ReviewDM._();

  const factory ReviewDM({
    @JsonKey(name: 'review_id') int? reviewId,
    @JsonKey(name: 'review_uuid') String? reviewUuid,
    @JsonKey(name: 'review_type') ReviewType? reviewType,
    @Default(0) int rating,
    String? comment,
    @Default([]) List<ReviewPhotoDM> photos,
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'business_photo') String? businessPhoto,
    @JsonKey(name: 'user_uuid') String? userUuid,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_photo') String? userPhoto,
    @JsonKey(name: 'business_visited_at') String? businessVisitedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ReviewDM;

  factory ReviewDM.fromJson(Map<String, dynamic> json) => _$ReviewDMFromJson(json);

  List<String> get photoUrls => photos.where((p) => p.photoUrl != null).map((p) => p.photoUrl!).toList();
}
