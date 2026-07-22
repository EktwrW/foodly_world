// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewCreateDTO _$ReviewCreateDTOFromJson(Map<String, dynamic> json) =>
    _ReviewCreateDTO(
      businessUuid: json['business_uuid'] as String,
      rating: (json['rating'] as num).toInt(),
      reviewType: $enumDecodeNullable(_$ReviewTypeEnumMap, json['review_type']),
      comment: json['comment'] as String?,
      businessVisitedAt: json['business_visited_at'] as String?,
    );

Map<String, dynamic> _$ReviewCreateDTOToJson(_ReviewCreateDTO instance) =>
    <String, dynamic>{
      'business_uuid': instance.businessUuid,
      'rating': instance.rating,
      if (_$ReviewTypeEnumMap[instance.reviewType] case final value?)
        'review_type': value,
      if (instance.comment case final value?) 'comment': value,
      if (instance.businessVisitedAt case final value?)
        'business_visited_at': value,
    };

const _$ReviewTypeEnumMap = {
  ReviewType.business: 'business',
  ReviewType.dish: 'dish',
  ReviewType.service: 'service',
  ReviewType.drink: 'drink',
  ReviewType.promotion: 'promotion',
  ReviewType.event: 'event',
};
