// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_search_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessSearchDM _$BusinessSearchDMFromJson(Map<String, dynamic> json) =>
    _BusinessSearchDM(
      business: (json['business'] as List<dynamic>)
          .map((e) => BusinessDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessSearchDMToJson(_BusinessSearchDM instance) =>
    <String, dynamic>{
      'business': instance.business.map((e) => e.toJson()).toList(),
    };
