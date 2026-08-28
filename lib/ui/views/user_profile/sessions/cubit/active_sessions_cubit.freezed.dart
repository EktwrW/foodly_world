// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_sessions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActiveSessionsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActiveSessionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActiveSessionsState()';
  }
}

/// @nodoc
class $ActiveSessionsStateCopyWith<$Res> {
  $ActiveSessionsStateCopyWith(
      ActiveSessionsState _, $Res Function(ActiveSessionsState) __);
}

/// Adds pattern-matching-related methods to [ActiveSessionsState].
extension ActiveSessionsStatePatterns on ActiveSessionsState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActiveSessionsLoading value)? loading,
    TResult Function(ActiveSessionsLoaded value)? loaded,
    TResult Function(ActiveSessionsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ActiveSessionsLoading() when loading != null:
        return loading(_that);
      case ActiveSessionsLoaded() when loaded != null:
        return loaded(_that);
      case ActiveSessionsError() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(ActiveSessionsLoading value) loading,
    required TResult Function(ActiveSessionsLoaded value) loaded,
    required TResult Function(ActiveSessionsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ActiveSessionsLoading():
        return loading(_that);
      case ActiveSessionsLoaded():
        return loaded(_that);
      case ActiveSessionsError():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActiveSessionsLoading value)? loading,
    TResult? Function(ActiveSessionsLoaded value)? loaded,
    TResult? Function(ActiveSessionsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ActiveSessionsLoading() when loading != null:
        return loading(_that);
      case ActiveSessionsLoaded() when loaded != null:
        return loaded(_that);
      case ActiveSessionsError() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ActiveSessionsDM data, String? closingId)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ActiveSessionsLoading() when loading != null:
        return loading();
      case ActiveSessionsLoaded() when loaded != null:
        return loaded(_that.data, _that.closingId);
      case ActiveSessionsError() when error != null:
        return error(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ActiveSessionsDM data, String? closingId) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case ActiveSessionsLoading():
        return loading();
      case ActiveSessionsLoaded():
        return loaded(_that.data, _that.closingId);
      case ActiveSessionsError():
        return error(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ActiveSessionsDM data, String? closingId)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ActiveSessionsLoading() when loading != null:
        return loading();
      case ActiveSessionsLoaded() when loaded != null:
        return loaded(_that.data, _that.closingId);
      case ActiveSessionsError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ActiveSessionsLoading implements ActiveSessionsState {
  const ActiveSessionsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActiveSessionsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActiveSessionsState.loading()';
  }
}

/// @nodoc

class ActiveSessionsLoaded implements ActiveSessionsState {
  const ActiveSessionsLoaded(this.data, {this.closingId});

  final ActiveSessionsDM data;
  final String? closingId;

  /// Create a copy of ActiveSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActiveSessionsLoadedCopyWith<ActiveSessionsLoaded> get copyWith =>
      _$ActiveSessionsLoadedCopyWithImpl<ActiveSessionsLoaded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActiveSessionsLoaded &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.closingId, closingId) ||
                other.closingId == closingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, closingId);

  @override
  String toString() {
    return 'ActiveSessionsState.loaded(data: $data, closingId: $closingId)';
  }
}

/// @nodoc
abstract mixin class $ActiveSessionsLoadedCopyWith<$Res>
    implements $ActiveSessionsStateCopyWith<$Res> {
  factory $ActiveSessionsLoadedCopyWith(ActiveSessionsLoaded value,
          $Res Function(ActiveSessionsLoaded) _then) =
      _$ActiveSessionsLoadedCopyWithImpl;
  @useResult
  $Res call({ActiveSessionsDM data, String? closingId});

  $ActiveSessionsDMCopyWith<$Res> get data;
}

/// @nodoc
class _$ActiveSessionsLoadedCopyWithImpl<$Res>
    implements $ActiveSessionsLoadedCopyWith<$Res> {
  _$ActiveSessionsLoadedCopyWithImpl(this._self, this._then);

  final ActiveSessionsLoaded _self;
  final $Res Function(ActiveSessionsLoaded) _then;

  /// Create a copy of ActiveSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? closingId = freezed,
  }) {
    return _then(ActiveSessionsLoaded(
      null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ActiveSessionsDM,
      closingId: freezed == closingId
          ? _self.closingId
          : closingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ActiveSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActiveSessionsDMCopyWith<$Res> get data {
    return $ActiveSessionsDMCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc

class ActiveSessionsError implements ActiveSessionsState {
  const ActiveSessionsError(this.message);

  final String message;

  /// Create a copy of ActiveSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActiveSessionsErrorCopyWith<ActiveSessionsError> get copyWith =>
      _$ActiveSessionsErrorCopyWithImpl<ActiveSessionsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActiveSessionsError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ActiveSessionsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ActiveSessionsErrorCopyWith<$Res>
    implements $ActiveSessionsStateCopyWith<$Res> {
  factory $ActiveSessionsErrorCopyWith(
          ActiveSessionsError value, $Res Function(ActiveSessionsError) _then) =
      _$ActiveSessionsErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ActiveSessionsErrorCopyWithImpl<$Res>
    implements $ActiveSessionsErrorCopyWith<$Res> {
  _$ActiveSessionsErrorCopyWithImpl(this._self, this._then);

  final ActiveSessionsError _self;
  final $Res Function(ActiveSessionsError) _then;

  /// Create a copy of ActiveSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ActiveSessionsError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
