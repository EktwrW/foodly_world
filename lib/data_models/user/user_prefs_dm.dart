import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_prefs_dm.freezed.dart';
part 'user_prefs_dm.g.dart';

@freezed
class UserPrefsDM with _$UserPrefsDM {
  const factory UserPrefsDM({
    @JsonKey(name: 'user_locale') String? locale,
    @JsonKey(name: 'user_theme') UserTheme? userTheme,
  }) = _UserPrefsDM;

  factory UserPrefsDM.fromJson(Map<String, dynamic> json) => _$UserPrefsDMFromJson(json);
}

@JsonEnum(valueField: 'value')
enum UserTheme {
  @JsonValue('dark')
  dark('dark'),
  @JsonValue('light')
  light('light'),
  @JsonValue('none')
  none('none');

  final String value;
  const UserTheme(this.value);
}
