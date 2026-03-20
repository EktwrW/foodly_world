// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_search_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessSearchDMImpl _$$BusinessSearchDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessSearchDMImpl(
      business: (json['business'] as List<dynamic>)
          .map((e) => BusinessDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BusinessSearchDMImplToJson(
        _$BusinessSearchDMImpl instance) =>
    <String, dynamic>{
      'business': instance.business.map((e) => e.toJson()).toList(),
    };
