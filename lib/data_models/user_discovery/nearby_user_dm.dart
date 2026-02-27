import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_user_dm.freezed.dart';
part 'nearby_user_dm.g.dart';

@freezed
class NearbyUsersResponseDM with _$NearbyUsersResponseDM {
  const factory NearbyUsersResponseDM({
    @Default([]) List<NearbyUserDM> data,
    NearbyUsersMetaDM? meta,
  }) = _NearbyUsersResponseDM;

  factory NearbyUsersResponseDM.fromJson(Map<String, dynamic> json) => _$NearbyUsersResponseDMFromJson(json);
}

@freezed
class NearbyUsersMetaDM with _$NearbyUsersMetaDM {
  const factory NearbyUsersMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
  }) = _NearbyUsersMetaDM;

  factory NearbyUsersMetaDM.fromJson(Map<String, dynamic> json) => _$NearbyUsersMetaDMFromJson(json);
}

@freezed
class NearbyUserDM with _$NearbyUserDM {
  const NearbyUserDM._();

  const factory NearbyUserDM({
    required String uuid,
    @Default('') String name,
    String? username,
    String? photo,
    String? bio,
    @JsonKey(name: 'posts_count') @Default(0) int postsCount,
    @JsonKey(name: 'likes_received') @Default(0) int likesReceived,
    @JsonKey(name: 'reviews_count') @Default(0) int reviewsCount,
    @JsonKey(name: 'activity_score') @Default(0) int activityScore,
    @JsonKey(name: 'followers_count') @Default(0) int followersCount,
    @JsonKey(name: 'is_following') @Default(false) bool isFollowing,
    @Default(0.0) double distance,
  }) = _NearbyUserDM;

  factory NearbyUserDM.fromJson(Map<String, dynamic> json) => _$NearbyUserDMFromJson(json);
}

@freezed
class UserProfileDM with _$UserProfileDM {
  const factory UserProfileDM({
    required String uuid,
    @Default('') String name,
    String? username,
    String? photo,
    String? bio,
    UserProfileStatsDM? stats,
    @JsonKey(name: 'is_following') @Default(false) bool isFollowing,
    @JsonKey(name: 'recent_posts') @Default([]) List<UserProfilePostDM> recentPosts,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserProfileDM;

  factory UserProfileDM.fromJson(Map<String, dynamic> json) => _$UserProfileDMFromJson(json);
}

@freezed
class UserProfileStatsDM with _$UserProfileStatsDM {
  const factory UserProfileStatsDM({
    @JsonKey(name: 'posts_count') @Default(0) int postsCount,
    @JsonKey(name: 'likes_received') @Default(0) int likesReceived,
    @JsonKey(name: 'reviews_count') @Default(0) int reviewsCount,
    @JsonKey(name: 'followers_count') @Default(0) int followersCount,
    @JsonKey(name: 'following_count') @Default(0) int followingCount,
  }) = _UserProfileStatsDM;

  factory UserProfileStatsDM.fromJson(Map<String, dynamic> json) => _$UserProfileStatsDMFromJson(json);
}

@freezed
class UserProfilePostDM with _$UserProfilePostDM {
  const factory UserProfilePostDM({
    required String uuid,
    required String content,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserProfilePostDM;

  factory UserProfilePostDM.fromJson(Map<String, dynamic> json) => _$UserProfilePostDMFromJson(json);
}
