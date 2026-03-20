// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_user_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyUsersResponseDMImpl _$$NearbyUsersResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyUsersResponseDMImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NearbyUserDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : NearbyUsersMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NearbyUsersResponseDMImplToJson(
        _$NearbyUsersResponseDMImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_$NearbyUsersMetaDMImpl _$$NearbyUsersMetaDMImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyUsersMetaDMImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$NearbyUsersMetaDMImplToJson(
        _$NearbyUsersMetaDMImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_$NearbyUserDMImpl _$$NearbyUserDMImplFromJson(Map<String, dynamic> json) =>
    _$NearbyUserDMImpl(
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

Map<String, dynamic> _$$NearbyUserDMImplToJson(_$NearbyUserDMImpl instance) =>
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

_$UserProfileDMImpl _$$UserProfileDMImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileDMImpl(
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

Map<String, dynamic> _$$UserProfileDMImplToJson(_$UserProfileDMImpl instance) =>
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

_$UserProfileStatsDMImpl _$$UserProfileStatsDMImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileStatsDMImpl(
      postsCount: (json['posts_count'] as num?)?.toInt() ?? 0,
      likesReceived: (json['likes_received'] as num?)?.toInt() ?? 0,
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
      followersCount: (json['followers_count'] as num?)?.toInt() ?? 0,
      followingCount: (json['following_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserProfileStatsDMImplToJson(
        _$UserProfileStatsDMImpl instance) =>
    <String, dynamic>{
      'posts_count': instance.postsCount,
      'likes_received': instance.likesReceived,
      'reviews_count': instance.reviewsCount,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
    };

_$UserProfilePostDMImpl _$$UserProfilePostDMImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfilePostDMImpl(
      uuid: json['uuid'] as String,
      content: json['content'] as String,
      photoUrl: json['photo_url'] as String?,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserProfilePostDMImplToJson(
        _$UserProfilePostDMImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'content': instance.content,
      if (instance.photoUrl case final value?) 'photo_url': value,
      'likes_count': instance.likesCount,
      'is_liked': instance.isLiked,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };
