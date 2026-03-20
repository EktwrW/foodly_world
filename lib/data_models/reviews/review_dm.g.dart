// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewsResponseDMImpl _$$ReviewsResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewsResponseDMImpl(
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : ReviewsMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewsResponseDMImplToJson(
        _$ReviewsResponseDMImpl instance) =>
    <String, dynamic>{
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_$ReviewsMetaDMImpl _$$ReviewsMetaDMImplFromJson(Map<String, dynamic> json) =>
    _$ReviewsMetaDMImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0,
      ratingsCount: (json['ratings_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReviewsMetaDMImplToJson(_$ReviewsMetaDMImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'average_rating': instance.averageRating,
      'ratings_count': instance.ratingsCount,
    };

_$ReviewCheckResponseDMImpl _$$ReviewCheckResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewCheckResponseDMImpl(
      hasReviewed: json['has_reviewed'] as bool? ?? false,
      review: json['review'] == null
          ? null
          : ReviewDM.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewCheckResponseDMImplToJson(
        _$ReviewCheckResponseDMImpl instance) =>
    <String, dynamic>{
      'has_reviewed': instance.hasReviewed,
      if (instance.review?.toJson() case final value?) 'review': value,
    };

_$ReviewCreateResponseDMImpl _$$ReviewCreateResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewCreateResponseDMImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      review: json['review'] == null
          ? null
          : ReviewDM.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewCreateResponseDMImplToJson(
        _$ReviewCreateResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.review?.toJson() case final value?) 'review': value,
    };

_$ReviewUpdateResponseDMImpl _$$ReviewUpdateResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewUpdateResponseDMImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      review: json['review'] == null
          ? null
          : ReviewDM.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewUpdateResponseDMImplToJson(
        _$ReviewUpdateResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.review?.toJson() case final value?) 'review': value,
    };

_$ReviewPhotoDMImpl _$$ReviewPhotoDMImplFromJson(Map<String, dynamic> json) =>
    _$ReviewPhotoDMImpl(
      photoUuid: json['photo_uuid'] as String?,
      photoUrl: json['photo_url'] as String?,
    );

Map<String, dynamic> _$$ReviewPhotoDMImplToJson(_$ReviewPhotoDMImpl instance) =>
    <String, dynamic>{
      if (instance.photoUuid case final value?) 'photo_uuid': value,
      if (instance.photoUrl case final value?) 'photo_url': value,
    };

_$ReviewDMImpl _$$ReviewDMImplFromJson(Map<String, dynamic> json) =>
    _$ReviewDMImpl(
      reviewId: (json['review_id'] as num?)?.toInt(),
      reviewUuid: json['review_uuid'] as String?,
      reviewType: $enumDecodeNullable(_$ReviewTypeEnumMap, json['review_type']),
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String?,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => ReviewPhotoDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      businessUuid: json['business_uuid'] as String?,
      businessName: json['business_name'] as String?,
      businessPhoto: json['business_photo'] as String?,
      userUuid: json['user_uuid'] as String?,
      userName: json['user_name'] as String?,
      userPhoto: json['user_photo'] as String?,
      businessVisitedAt: json['business_visited_at'] == null
          ? null
          : DateTime.parse(json['business_visited_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ReviewDMImplToJson(_$ReviewDMImpl instance) =>
    <String, dynamic>{
      if (instance.reviewId case final value?) 'review_id': value,
      if (instance.reviewUuid case final value?) 'review_uuid': value,
      if (_$ReviewTypeEnumMap[instance.reviewType] case final value?)
        'review_type': value,
      'rating': instance.rating,
      if (instance.comment case final value?) 'comment': value,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      if (instance.businessUuid case final value?) 'business_uuid': value,
      if (instance.businessName case final value?) 'business_name': value,
      if (instance.businessPhoto case final value?) 'business_photo': value,
      if (instance.userUuid case final value?) 'user_uuid': value,
      if (instance.userName case final value?) 'user_name': value,
      if (instance.userPhoto case final value?) 'user_photo': value,
      if (instance.businessVisitedAt?.toIso8601String() case final value?)
        'business_visited_at': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

const _$ReviewTypeEnumMap = {
  ReviewType.business: 'business',
  ReviewType.dish: 'dish',
  ReviewType.service: 'service',
  ReviewType.drink: 'drink',
  ReviewType.promotion: 'promotion',
  ReviewType.event: 'event',
};
