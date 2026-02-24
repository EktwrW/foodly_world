import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_dm.freezed.dart';
part 'post_dm.g.dart';

@freezed
class PostsResponseDM with _$PostsResponseDM {
  const factory PostsResponseDM({
    @Default([]) List<PostDM> posts,
    PostsMetaDM? meta,
  }) = _PostsResponseDM;

  factory PostsResponseDM.fromJson(Map<String, dynamic> json) => _$PostsResponseDMFromJson(json);
}

@freezed
class PostsMetaDM with _$PostsMetaDM {
  const factory PostsMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
  }) = _PostsMetaDM;

  factory PostsMetaDM.fromJson(Map<String, dynamic> json) => _$PostsMetaDMFromJson(json);
}

@freezed
class PostDM with _$PostDM {
  const PostDM._();

  const factory PostDM({
    int? id,
    required String uuid,
    required String content,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'user_uuid') required String userUuid,
    @JsonKey(name: 'user_name') @Default('') String userName,
    @JsonKey(name: 'user_photo') String? userPhoto,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PostDM;

  bool get hasPhoto => photoUrl != null && photoUrl!.isNotEmpty;

  factory PostDM.fromJson(Map<String, dynamic> json) => _$PostDMFromJson(json);
}

@freezed
class ToggleLikeResponseDM with _$ToggleLikeResponseDM {
  const factory ToggleLikeResponseDM({
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
  }) = _ToggleLikeResponseDM;

  factory ToggleLikeResponseDM.fromJson(Map<String, dynamic> json) => _$ToggleLikeResponseDMFromJson(json);
}
