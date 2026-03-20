// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewUpdateDTOImpl _$$ReviewUpdateDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewUpdateDTOImpl(
      rating: (json['rating'] as num?)?.toInt(),
      reviewType: $enumDecodeNullable(_$ReviewTypeEnumMap, json['review_type']),
      comment: json['comment'] as String?,
      businessVisitedAt: json['business_visited_at'] as String?,
    );

Map<String, dynamic> _$$ReviewUpdateDTOImplToJson(
        _$ReviewUpdateDTOImpl instance) =>
    <String, dynamic>{
      if (instance.rating case final value?) 'rating': value,
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
