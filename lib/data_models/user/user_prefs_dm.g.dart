// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefs_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPrefsDMImpl _$$UserPrefsDMImplFromJson(Map<String, dynamic> json) =>
    _$UserPrefsDMImpl(
      locale: json['user_locale'] as String?,
      userTheme: $enumDecodeNullable(_$UserThemeEnumMap, json['user_theme']),
    );

Map<String, dynamic> _$$UserPrefsDMImplToJson(_$UserPrefsDMImpl instance) =>
    <String, dynamic>{
      if (instance.locale case final value?) 'user_locale': value,
      if (_$UserThemeEnumMap[instance.userTheme] case final value?)
        'user_theme': value,
    };

const _$UserThemeEnumMap = {
  UserTheme.dark: 'dark',
  UserTheme.light: 'light',
  UserTheme.none: 'none',
};
