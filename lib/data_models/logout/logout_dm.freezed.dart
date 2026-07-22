// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutDM {
  @JsonKey(name: 'message')
  String? get message;

  /// Create a copy of LogoutDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LogoutDMCopyWith<LogoutDM> get copyWith =>
      _$LogoutDMCopyWithImpl<LogoutDM>(this as LogoutDM, _$identity);

  /// Serializes this LogoutDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LogoutDM &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LogoutDM(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LogoutDMCopyWith<$Res> {
  factory $LogoutDMCopyWith(LogoutDM value, $Res Function(LogoutDM) _then) =
      _$LogoutDMCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$LogoutDMCopyWithImpl<$Res> implements $LogoutDMCopyWith<$Res> {
  _$LogoutDMCopyWithImpl(this._self, this._then);

  final LogoutDM _self;
  final $Res Function(LogoutDM) _then;

  /// Create a copy of LogoutDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LogoutDM].
extension LogoutDMPatterns on LogoutDM {
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
    TResult Function(_LogoutDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LogoutDM() when $default != null:
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
    TResult Function(_LogoutDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LogoutDM():
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
    TResult? Function(_LogoutDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LogoutDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'message') String? message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LogoutDM() when $default != null:
        return $default(_that.message);
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
    TResult Function(@JsonKey(name: 'message') String? message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LogoutDM():
        return $default(_that.message);
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
    TResult? Function(@JsonKey(name: 'message') String? message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LogoutDM() when $default != null:
        return $default(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LogoutDM implements LogoutDM {
  const _LogoutDM({@JsonKey(name: 'message') this.message});
  factory _LogoutDM.fromJson(Map<String, dynamic> json) =>
      _$LogoutDMFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String? message;

  /// Create a copy of LogoutDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LogoutDMCopyWith<_LogoutDM> get copyWith =>
      __$LogoutDMCopyWithImpl<_LogoutDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LogoutDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LogoutDM &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LogoutDM(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$LogoutDMCopyWith<$Res>
    implements $LogoutDMCopyWith<$Res> {
  factory _$LogoutDMCopyWith(_LogoutDM value, $Res Function(_LogoutDM) _then) =
      __$LogoutDMCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$LogoutDMCopyWithImpl<$Res> implements _$LogoutDMCopyWith<$Res> {
  __$LogoutDMCopyWithImpl(this._self, this._then);

  final _LogoutDM _self;
  final $Res Function(_LogoutDM) _then;

  /// Create a copy of LogoutDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_LogoutDM(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
