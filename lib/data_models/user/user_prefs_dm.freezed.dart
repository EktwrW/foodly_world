// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_prefs_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPrefsDM {
  @JsonKey(name: 'user_locale')
  String? get locale;
  @JsonKey(name: 'user_theme')
  UserTheme? get userTheme;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPrefsDMCopyWith<UserPrefsDM> get copyWith =>
      _$UserPrefsDMCopyWithImpl<UserPrefsDM>(this as UserPrefsDM, _$identity);

  /// Serializes this UserPrefsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPrefsDM &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.userTheme, userTheme) ||
                other.userTheme == userTheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, userTheme);

  @override
  String toString() {
    return 'UserPrefsDM(locale: $locale, userTheme: $userTheme)';
  }
}

/// @nodoc
abstract mixin class $UserPrefsDMCopyWith<$Res> {
  factory $UserPrefsDMCopyWith(
          UserPrefsDM value, $Res Function(UserPrefsDM) _then) =
      _$UserPrefsDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_locale') String? locale,
      @JsonKey(name: 'user_theme') UserTheme? userTheme});
}

/// @nodoc
class _$UserPrefsDMCopyWithImpl<$Res> implements $UserPrefsDMCopyWith<$Res> {
  _$UserPrefsDMCopyWithImpl(this._self, this._then);

  final UserPrefsDM _self;
  final $Res Function(UserPrefsDM) _then;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? userTheme = freezed,
  }) {
    return _then(_self.copyWith(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      userTheme: freezed == userTheme
          ? _self.userTheme
          : userTheme // ignore: cast_nullable_to_non_nullable
              as UserTheme?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserPrefsDM].
extension UserPrefsDMPatterns on UserPrefsDM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserPrefsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserPrefsDM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserPrefsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPrefsDM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserPrefsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPrefsDM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'user_locale') String? locale,
            @JsonKey(name: 'user_theme') UserTheme? userTheme)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserPrefsDM() when $default != null:
        return $default(_that.locale, _that.userTheme);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'user_locale') String? locale,
            @JsonKey(name: 'user_theme') UserTheme? userTheme)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPrefsDM():
        return $default(_that.locale, _that.userTheme);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'user_locale') String? locale,
            @JsonKey(name: 'user_theme') UserTheme? userTheme)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPrefsDM() when $default != null:
        return $default(_that.locale, _that.userTheme);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserPrefsDM implements UserPrefsDM {
  const _UserPrefsDM(
      {@JsonKey(name: 'user_locale') this.locale,
      @JsonKey(name: 'user_theme') this.userTheme});
  factory _UserPrefsDM.fromJson(Map<String, dynamic> json) =>
      _$UserPrefsDMFromJson(json);

  @override
  @JsonKey(name: 'user_locale')
  final String? locale;
  @override
  @JsonKey(name: 'user_theme')
  final UserTheme? userTheme;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserPrefsDMCopyWith<_UserPrefsDM> get copyWith =>
      __$UserPrefsDMCopyWithImpl<_UserPrefsDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserPrefsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPrefsDM &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.userTheme, userTheme) ||
                other.userTheme == userTheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, userTheme);

  @override
  String toString() {
    return 'UserPrefsDM(locale: $locale, userTheme: $userTheme)';
  }
}

/// @nodoc
abstract mixin class _$UserPrefsDMCopyWith<$Res>
    implements $UserPrefsDMCopyWith<$Res> {
  factory _$UserPrefsDMCopyWith(
          _UserPrefsDM value, $Res Function(_UserPrefsDM) _then) =
      __$UserPrefsDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_locale') String? locale,
      @JsonKey(name: 'user_theme') UserTheme? userTheme});
}

/// @nodoc
class __$UserPrefsDMCopyWithImpl<$Res> implements _$UserPrefsDMCopyWith<$Res> {
  __$UserPrefsDMCopyWithImpl(this._self, this._then);

  final _UserPrefsDM _self;
  final $Res Function(_UserPrefsDM) _then;

  /// Create a copy of UserPrefsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
    Object? userTheme = freezed,
  }) {
    return _then(_UserPrefsDM(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      userTheme: freezed == userTheme
          ? _self.userTheme
          : userTheme // ignore: cast_nullable_to_non_nullable
              as UserTheme?,
    ));
  }
}

// dart format on
