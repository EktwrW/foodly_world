import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_dm.freezed.dart';
part 'post_dm.g.dart';

@freezed
abstract class PostsResponseDM with _$PostsResponseDM {
  const factory PostsResponseDM({
    @Default([]) List<PostDM> posts,
    PostsMetaDM? meta,
  }) = _PostsResponseDM;

  factory PostsResponseDM.fromJson(Map<String, dynamic> json) => _$PostsResponseDMFromJson(json);
}

@freezed
abstract class PostsMetaDM with _$PostsMetaDM {
  const factory PostsMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
  }) = _PostsMetaDM;

  factory PostsMetaDM.fromJson(Map<String, dynamic> json) => _$PostsMetaDMFromJson(json);
}

@freezed
abstract class PostDM with _$PostDM {
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
    // Follow Loop (mayo 2026): true cuando el usuario actual sigue al
    // autor. La PostCard pinta un anillo purple al avatar como cue
    // visual de "esta persona ya está en tu red". Default false para
    // que un BE viejo (sin la key) no rompa el parser.
    @JsonKey(name: 'is_followed_by_me') @Default(false) bool isFollowedByMe,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PostDM;

  bool get hasPhoto => photoUrl != null && photoUrl!.isNotEmpty;

  factory PostDM.fromJson(Map<String, dynamic> json) => _$PostDMFromJson(json);
}

@freezed
abstract class ToggleLikeResponseDM with _$ToggleLikeResponseDM {
  const factory ToggleLikeResponseDM({
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
  }) = _ToggleLikeResponseDM;

  factory ToggleLikeResponseDM.fromJson(Map<String, dynamic> json) => _$ToggleLikeResponseDMFromJson(json);
}
