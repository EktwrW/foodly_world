// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_body_set_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBodySetPasswordDTO {
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBodySetPasswordDTOCopyWith<UserBodySetPasswordDTO> get copyWith =>
      _$UserBodySetPasswordDTOCopyWithImpl<UserBodySetPasswordDTO>(
          this as UserBodySetPasswordDTO, _$identity);

  /// Serializes this UserBodySetPasswordDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBodySetPasswordDTO &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  @override
  String toString() {
    return 'UserBodySetPasswordDTO(newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UserBodySetPasswordDTOCopyWith<$Res> {
  factory $UserBodySetPasswordDTOCopyWith(UserBodySetPasswordDTO value,
          $Res Function(UserBodySetPasswordDTO) _then) =
      _$UserBodySetPasswordDTOCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class _$UserBodySetPasswordDTOCopyWithImpl<$Res>
    implements $UserBodySetPasswordDTOCopyWith<$Res> {
  _$UserBodySetPasswordDTOCopyWithImpl(this._self, this._then);

  final UserBodySetPasswordDTO _self;
  final $Res Function(UserBodySetPasswordDTO) _then;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_self.copyWith(
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserBodySetPasswordDTO].
extension UserBodySetPasswordDTOPatterns on UserBodySetPasswordDTO {
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
    TResult Function(_UserBodySetPasswordDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBodySetPasswordDTO() when $default != null:
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
    TResult Function(_UserBodySetPasswordDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodySetPasswordDTO():
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
    TResult? Function(_UserBodySetPasswordDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodySetPasswordDTO() when $default != null:
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
    TResult Function(@JsonKey(name: 'new_password') String newPassword)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBodySetPasswordDTO() when $default != null:
        return $default(_that.newPassword);
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
    TResult Function(@JsonKey(name: 'new_password') String newPassword)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodySetPasswordDTO():
        return $default(_that.newPassword);
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
    TResult? Function(@JsonKey(name: 'new_password') String newPassword)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBodySetPasswordDTO() when $default != null:
        return $default(_that.newPassword);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserBodySetPasswordDTO implements UserBodySetPasswordDTO {
  const _UserBodySetPasswordDTO(
      {@JsonKey(name: 'new_password') required this.newPassword});
  factory _UserBodySetPasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$UserBodySetPasswordDTOFromJson(json);

  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBodySetPasswordDTOCopyWith<_UserBodySetPasswordDTO> get copyWith =>
      __$UserBodySetPasswordDTOCopyWithImpl<_UserBodySetPasswordDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBodySetPasswordDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBodySetPasswordDTO &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  @override
  String toString() {
    return 'UserBodySetPasswordDTO(newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class _$UserBodySetPasswordDTOCopyWith<$Res>
    implements $UserBodySetPasswordDTOCopyWith<$Res> {
  factory _$UserBodySetPasswordDTOCopyWith(_UserBodySetPasswordDTO value,
          $Res Function(_UserBodySetPasswordDTO) _then) =
      __$UserBodySetPasswordDTOCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class __$UserBodySetPasswordDTOCopyWithImpl<$Res>
    implements _$UserBodySetPasswordDTOCopyWith<$Res> {
  __$UserBodySetPasswordDTOCopyWithImpl(this._self, this._then);

  final _UserBodySetPasswordDTO _self;
  final $Res Function(_UserBodySetPasswordDTO) _then;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_UserBodySetPasswordDTO(
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
