// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nlp_search_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NlpSearchResponseDMImpl _$$NlpSearchResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$NlpSearchResponseDMImpl(
      business: (json['business'] as List<dynamic>?)
              ?.map((e) => BusinessDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nlpInfo: json['nlp_info'] == null
          ? null
          : NlpInfoDM.fromJson(json['nlp_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NlpSearchResponseDMImplToJson(
        _$NlpSearchResponseDMImpl instance) =>
    <String, dynamic>{
      'business': instance.business.map((e) => e.toJson()).toList(),
      if (instance.nlpInfo?.toJson() case final value?) 'nlp_info': value,
    };

_$NlpInfoDMImpl _$$NlpInfoDMImplFromJson(Map<String, dynamic> json) =>
    _$NlpInfoDMImpl(
      detectedCategories: (json['detected_categories'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      extractedKeywords: (json['extracted_keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
      timeFilter: json['time_filter'] == null
          ? null
          : TimeFilterDM.fromJson(json['time_filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NlpInfoDMImplToJson(_$NlpInfoDMImpl instance) =>
    <String, dynamic>{
      'detected_categories': instance.detectedCategories,
      'extracted_keywords': instance.extractedKeywords,
      'confidence': instance.confidence,
      if (instance.timeFilter?.toJson() case final value?) 'time_filter': value,
    };

_$TimeFilterDMImpl _$$TimeFilterDMImplFromJson(Map<String, dynamic> json) =>
    _$TimeFilterDMImpl(
      from: json['from'] as String?,
      to: json['to'] as String?,
      dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
      mealTime: json['meal_time'] as String?,
    );

Map<String, dynamic> _$$TimeFilterDMImplToJson(_$TimeFilterDMImpl instance) =>
    <String, dynamic>{
      if (instance.from case final value?) 'from': value,
      if (instance.to case final value?) 'to': value,
      if (instance.dayOfWeek case final value?) 'day_of_week': value,
      if (instance.mealTime case final value?) 'meal_time': value,
    };
