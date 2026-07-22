// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostsResponseDM _$PostsResponseDMFromJson(Map<String, dynamic> json) =>
    _PostsResponseDM(
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => PostDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : PostsMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostsResponseDMToJson(_PostsResponseDM instance) =>
    <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_PostsMetaDM _$PostsMetaDMFromJson(Map<String, dynamic> json) => _PostsMetaDM(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PostsMetaDMToJson(_PostsMetaDM instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_PostDM _$PostDMFromJson(Map<String, dynamic> json) => _PostDM(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String,
      content: json['content'] as String,
      photoUrl: json['photo_url'] as String?,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      userUuid: json['user_uuid'] as String,
      userName: json['user_name'] as String? ?? '',
      userPhoto: json['user_photo'] as String?,
      isFollowedByMe: json['is_followed_by_me'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PostDMToJson(_PostDM instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'uuid': instance.uuid,
      'content': instance.content,
      if (instance.photoUrl case final value?) 'photo_url': value,
      'likes_count': instance.likesCount,
      'is_liked': instance.isLiked,
      'user_uuid': instance.userUuid,
      'user_name': instance.userName,
      if (instance.userPhoto case final value?) 'user_photo': value,
      'is_followed_by_me': instance.isFollowedByMe,
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

_ToggleLikeResponseDM _$ToggleLikeResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ToggleLikeResponseDM(
      isLiked: json['is_liked'] as bool? ?? false,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ToggleLikeResponseDMToJson(
        _ToggleLikeResponseDM instance) =>
    <String, dynamic>{
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
    };
