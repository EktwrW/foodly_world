// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_prefs_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPrefsDM _$UserPrefsDMFromJson(Map<String, dynamic> json) {
  return _UserPrefsDM.fromJson(json);
}

/// @nodoc
mixin _$UserPrefsDM {
  @JsonKey(name: 'user_locale')
  String? get locale => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_theme')
  UserTheme? get userTheme => throw _privateConstructorUsedError;

  /// Serializes this UserPrefsDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPrefsDMCopyWith<UserPrefsDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrefsDMCopyWith<$Res> {
  factory $UserPrefsDMCopyWith(
          UserPrefsDM value, $Res Function(UserPrefsDM) then) =
      _$UserPrefsDMCopyWithImpl<$Res, UserPrefsDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_locale') String? locale,
      @JsonKey(name: 'user_theme') UserTheme? userTheme});
}

/// @nodoc
class _$UserPrefsDMCopyWithImpl<$Res, $Val extends UserPrefsDM>
    implements $UserPrefsDMCopyWith<$Res> {
  _$UserPrefsDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? userTheme = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      userTheme: freezed == userTheme
          ? _value.userTheme
          : userTheme // ignore: cast_nullable_to_non_nullable
              as UserTheme?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPrefsDMImplCopyWith<$Res>
    implements $UserPrefsDMCopyWith<$Res> {
  factory _$$UserPrefsDMImplCopyWith(
          _$UserPrefsDMImpl value, $Res Function(_$UserPrefsDMImpl) then) =
      __$$UserPrefsDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_locale') String? locale,
      @JsonKey(name: 'user_theme') UserTheme? userTheme});
}

/// @nodoc
class __$$UserPrefsDMImplCopyWithImpl<$Res>
    extends _$UserPrefsDMCopyWithImpl<$Res, _$UserPrefsDMImpl>
    implements _$$UserPrefsDMImplCopyWith<$Res> {
  __$$UserPrefsDMImplCopyWithImpl(
      _$UserPrefsDMImpl _value, $Res Function(_$UserPrefsDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? userTheme = freezed,
  }) {
    return _then(_$UserPrefsDMImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      userTheme: freezed == userTheme
          ? _value.userTheme
          : userTheme // ignore: cast_nullable_to_non_nullable
              as UserTheme?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPrefsDMImpl implements _UserPrefsDM {
  const _$UserPrefsDMImpl(
      {@JsonKey(name: 'user_locale') this.locale,
      @JsonKey(name: 'user_theme') this.userTheme});

  factory _$UserPrefsDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPrefsDMImplFromJson(json);

  @override
  @JsonKey(name: 'user_locale')
  final String? locale;
  @override
  @JsonKey(name: 'user_theme')
  final UserTheme? userTheme;

  @override
  String toString() {
    return 'UserPrefsDM(locale: $locale, userTheme: $userTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPrefsDMImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.userTheme, userTheme) ||
                other.userTheme == userTheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, userTheme);

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPrefsDMImplCopyWith<_$UserPrefsDMImpl> get copyWith =>
      __$$UserPrefsDMImplCopyWithImpl<_$UserPrefsDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPrefsDMImplToJson(
      this,
    );
  }
}

abstract class _UserPrefsDM implements UserPrefsDM {
  const factory _UserPrefsDM(
          {@JsonKey(name: 'user_locale') final String? locale,
          @JsonKey(name: 'user_theme') final UserTheme? userTheme}) =
      _$UserPrefsDMImpl;

  factory _UserPrefsDM.fromJson(Map<String, dynamic> json) =
      _$UserPrefsDMImpl.fromJson;

  @override
  @JsonKey(name: 'user_locale')
  String? get locale;
  @override
  @JsonKey(name: 'user_theme')
  UserTheme? get userTheme;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPrefsDMImplCopyWith<_$UserPrefsDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
