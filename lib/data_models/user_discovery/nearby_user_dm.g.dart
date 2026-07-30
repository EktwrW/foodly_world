// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_user_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyUsersResponseDM _$NearbyUsersResponseDMFromJson(
        Map<String, dynamic> json) =>
    _NearbyUsersResponseDM(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NearbyUserDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : NearbyUsersMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NearbyUsersResponseDMToJson(
        _NearbyUsersResponseDM instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_NearbyUsersMetaDM _$NearbyUsersMetaDMFromJson(Map<String, dynamic> json) =>
    _NearbyUsersMetaDM(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NearbyUsersMetaDMToJson(_NearbyUsersMetaDM instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_NearbyUserDM _$NearbyUserDMFromJson(Map<String, dynamic> json) =>
    _NearbyUserDM(
      uuid: json['uuid'] as String,
      name: json['name'] as String? ?? '',
      username: json['username'] as String?,
      photo: json['photo'] as String?,
      bio: json['bio'] as String?,
      postsCount: (json['posts_count'] as num?)?.toInt() ?? 0,
      likesReceived: (json['likes_received'] as num?)?.toInt() ?? 0,
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
      activityScore: (json['activity_score'] as num?)?.toInt() ?? 0,
      followersCount: (json['followers_count'] as num?)?.toInt() ?? 0,
      isFollowing: json['is_following'] as bool? ?? false,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$NearbyUserDMToJson(_NearbyUserDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      if (instance.username case final value?) 'username': value,
      if (instance.photo case final value?) 'photo': value,
      if (instance.bio case final value?) 'bio': value,
      'posts_count': instance.postsCount,
      'likes_received': instance.likesReceived,
      'reviews_count': instance.reviewsCount,
      'activity_score': instance.activityScore,
      'followers_count': instance.followersCount,
      'is_following': instance.isFollowing,
      'distance': instance.distance,
    };

_UserProfileDM _$UserProfileDMFromJson(Map<String, dynamic> json) =>
    _UserProfileDM(
      uuid: json['uuid'] as String,
      name: json['name'] as String? ?? '',
      username: json['username'] as String?,
      photo: json['photo'] as String?,
      bio: json['bio'] as String?,
      stats: json['stats'] == null
          ? null
          : UserProfileStatsDM.fromJson(json['stats'] as Map<String, dynamic>),
      isFollowing: json['is_following'] as bool? ?? false,
      recentPosts: (json['recent_posts'] as List<dynamic>?)
              ?.map(
                  (e) => UserProfilePostDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserProfileDMToJson(_UserProfileDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      if (instance.username case final value?) 'username': value,
      if (instance.photo case final value?) 'photo': value,
      if (instance.bio case final value?) 'bio': value,
      if (instance.stats?.toJson() case final value?) 'stats': value,
      'is_following': instance.isFollowing,
      'recent_posts': instance.recentPosts.map((e) => e.toJson()).toList(),
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };

_UserProfileStatsDM _$UserProfileStatsDMFromJson(Map<String, dynamic> json) =>
    _UserProfileStatsDM(
      postsCount: (json['posts_count'] as num?)?.toInt() ?? 0,
      likesReceived: (json['likes_received'] as num?)?.toInt() ?? 0,
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
      followersCount: (json['followers_count'] as num?)?.toInt() ?? 0,
      followingCount: (json['following_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserProfileStatsDMToJson(_UserProfileStatsDM instance) =>
    <String, dynamic>{
      'posts_count': instance.postsCount,
      'likes_received': instance.likesReceived,
      'reviews_count': instance.reviewsCount,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
    };

_UserProfilePostDM _$UserProfilePostDMFromJson(Map<String, dynamic> json) =>
    _UserProfilePostDM(
      uuid: json['uuid'] as String,
      content: json['content'] as String,
      photoUrl: json['photo_url'] as String?,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserProfilePostDMToJson(_UserProfilePostDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'content': instance.content,
      if (instance.photoUrl case final value?) 'photo_url': value,
      'likes_count': instance.likesCount,
      'is_liked': instance.isLiked,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };
