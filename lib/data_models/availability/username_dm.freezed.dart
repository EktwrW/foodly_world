// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsernameDM {
  String get username;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsernameDMCopyWith<UsernameDM> get copyWith =>
      _$UsernameDMCopyWithImpl<UsernameDM>(this as UsernameDM, _$identity);

  /// Serializes this UsernameDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsernameDM &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  @override
  String toString() {
    return 'UsernameDM(username: $username)';
  }
}

/// @nodoc
abstract mixin class $UsernameDMCopyWith<$Res> {
  factory $UsernameDMCopyWith(
          UsernameDM value, $Res Function(UsernameDM) _then) =
      _$UsernameDMCopyWithImpl;
  @useResult
  $Res call({String username});
}

/// @nodoc
class _$UsernameDMCopyWithImpl<$Res> implements $UsernameDMCopyWith<$Res> {
  _$UsernameDMCopyWithImpl(this._self, this._then);

  final UsernameDM _self;
  final $Res Function(UsernameDM) _then;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_self.copyWith(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UsernameDM].
extension UsernameDMPatterns on UsernameDM {
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
    TResult Function(_UsernameDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UsernameDM() when $default != null:
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
    TResult Function(_UsernameDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UsernameDM():
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
    TResult? Function(_UsernameDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UsernameDM() when $default != null:
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
    TResult Function(String username)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UsernameDM() when $default != null:
        return $default(_that.username);
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
    TResult Function(String username) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UsernameDM():
        return $default(_that.username);
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
    TResult? Function(String username)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UsernameDM() when $default != null:
        return $default(_that.username);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UsernameDM extends UsernameDM {
  const _UsernameDM({required this.username}) : super._();
  factory _UsernameDM.fromJson(Map<String, dynamic> json) =>
      _$UsernameDMFromJson(json);

  @override
  final String username;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsernameDMCopyWith<_UsernameDM> get copyWith =>
      __$UsernameDMCopyWithImpl<_UsernameDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsernameDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsernameDM &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  @override
  String toString() {
    return 'UsernameDM(username: $username)';
  }
}

/// @nodoc
abstract mixin class _$UsernameDMCopyWith<$Res>
    implements $UsernameDMCopyWith<$Res> {
  factory _$UsernameDMCopyWith(
          _UsernameDM value, $Res Function(_UsernameDM) _then) =
      __$UsernameDMCopyWithImpl;
  @override
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$UsernameDMCopyWithImpl<$Res> implements _$UsernameDMCopyWith<$Res> {
  __$UsernameDMCopyWithImpl(this._self, this._then);

  final _UsernameDM _self;
  final $Res Function(_UsernameDM) _then;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
  }) {
    return _then(_UsernameDM(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
