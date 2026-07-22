// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessDays _$BusinessDaysFromJson(Map<String, dynamic> json) =>
    _BusinessDays(
      day0: json['day_0'] == null
          ? const Day()
          : Day.fromJson(json['day_0'] as Map<String, dynamic>),
      day1: json['day_1'] == null
          ? const Day()
          : Day.fromJson(json['day_1'] as Map<String, dynamic>),
      day2: json['day_2'] == null
          ? const Day()
          : Day.fromJson(json['day_2'] as Map<String, dynamic>),
      day3: json['day_3'] == null
          ? const Day()
          : Day.fromJson(json['day_3'] as Map<String, dynamic>),
      day4: json['day_4'] == null
          ? const Day()
          : Day.fromJson(json['day_4'] as Map<String, dynamic>),
      day5: json['day_5'] == null
          ? const Day()
          : Day.fromJson(json['day_5'] as Map<String, dynamic>),
      day6: json['day_6'] == null
          ? const Day()
          : Day.fromJson(json['day_6'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessDaysToJson(_BusinessDays instance) =>
    <String, dynamic>{
      'day_0': instance.day0.toJson(),
      'day_1': instance.day1.toJson(),
      'day_2': instance.day2.toJson(),
      'day_3': instance.day3.toJson(),
      'day_4': instance.day4.toJson(),
      'day_5': instance.day5.toJson(),
      'day_6': instance.day6.toJson(),
    };

_Day _$DayFromJson(Map<String, dynamic> json) => _Day(
      openA: json['open_a'] as String?,
      openB: json['open_b'] as String?,
      closeA: json['close_a'] as String?,
      closeB: json['close_b'] as String?,
    );

Map<String, dynamic> _$DayToJson(_Day instance) => <String, dynamic>{
      if (instance.openA case final value?) 'open_a': value,
      if (instance.openB case final value?) 'open_b': value,
      if (instance.closeA case final value?) 'close_a': value,
      if (instance.closeB case final value?) 'close_b': value,
    };
