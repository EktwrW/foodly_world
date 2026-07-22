// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailabilityState {
  AvailabilityVM get vm;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AvailabilityStateCopyWith<AvailabilityState> get copyWith =>
      _$AvailabilityStateCopyWithImpl<AvailabilityState>(
          this as AvailabilityState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvailabilityState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'AvailabilityState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $AvailabilityStateCopyWith<$Res> {
  factory $AvailabilityStateCopyWith(
          AvailabilityState value, $Res Function(AvailabilityState) _then) =
      _$AvailabilityStateCopyWithImpl;
  @useResult
  $Res call({AvailabilityVM vm});

  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$AvailabilityStateCopyWithImpl<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  _$AvailabilityStateCopyWithImpl(this._self, this._then);

  final AvailabilityState _self;
  final $Res Function(AvailabilityState) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_self.copyWith(
      vm: null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AvailabilityState].
extension AvailabilityStatePatterns on AvailabilityState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Saving() when saving != null:
        return saving(_that);
      case _Saved() when saved != null:
        return saved(_that);
      case _Deleted() when deleted != null:
        return deleted(_that);
      case _Error() when error != null:
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Saving():
        return saving(_that);
      case _Saved():
        return saved(_that);
      case _Deleted():
        return deleted(_that);
      case _Error():
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Saving() when saving != null:
        return saving(_that);
      case _Saved() when saved != null:
        return saved(_that);
      case _Deleted() when deleted != null:
        return deleted(_that);
      case _Error() when error != null:
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
    TResult Function(AvailabilityVM vm)? initial,
    TResult Function(AvailabilityVM vm)? loading,
    TResult Function(AvailabilityVM vm)? loaded,
    TResult Function(AvailabilityVM vm)? saving,
    TResult Function(AvailabilityVM vm, String message)? saved,
    TResult Function(AvailabilityVM vm, String message)? deleted,
    TResult Function(AvailabilityVM vm, String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _Saving() when saving != null:
        return saving(_that.vm);
      case _Saved() when saved != null:
        return saved(_that.vm, _that.message);
      case _Deleted() when deleted != null:
        return deleted(_that.vm, _that.message);
      case _Error() when error != null:
        return error(_that.vm, _that.message);
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
    required TResult Function(AvailabilityVM vm) initial,
    required TResult Function(AvailabilityVM vm) loading,
    required TResult Function(AvailabilityVM vm) loaded,
    required TResult Function(AvailabilityVM vm) saving,
    required TResult Function(AvailabilityVM vm, String message) saved,
    required TResult Function(AvailabilityVM vm, String message) deleted,
    required TResult Function(AvailabilityVM vm, String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Loading():
        return loading(_that.vm);
      case _Loaded():
        return loaded(_that.vm);
      case _Saving():
        return saving(_that.vm);
      case _Saved():
        return saved(_that.vm, _that.message);
      case _Deleted():
        return deleted(_that.vm, _that.message);
      case _Error():
        return error(_that.vm, _that.message);
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
    TResult? Function(AvailabilityVM vm)? initial,
    TResult? Function(AvailabilityVM vm)? loading,
    TResult? Function(AvailabilityVM vm)? loaded,
    TResult? Function(AvailabilityVM vm)? saving,
    TResult? Function(AvailabilityVM vm, String message)? saved,
    TResult? Function(AvailabilityVM vm, String message)? deleted,
    TResult? Function(AvailabilityVM vm, String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _Saving() when saving != null:
        return saving(_that.vm);
      case _Saved() when saved != null:
        return saved(_that.vm, _that.message);
      case _Deleted() when deleted != null:
        return deleted(_that.vm, _that.message);
      case _Error() when error != null:
        return error(_that.vm, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements AvailabilityState {
  const _Initial(this.vm);

  @override
  final AvailabilityVM vm;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'AvailabilityState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Initial(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loading implements AvailabilityState {
  const _Loading(this.vm);

  @override
  final AvailabilityVM vm;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'AvailabilityState.loading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Loading(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loaded implements AvailabilityState {
  const _Loaded(this.vm);

  @override
  final AvailabilityVM vm;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'AvailabilityState.loaded(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Loaded(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Saving implements AvailabilityState {
  const _Saving(this.vm);

  @override
  final AvailabilityVM vm;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavingCopyWith<_Saving> get copyWith =>
      __$SavingCopyWithImpl<_Saving>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Saving &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'AvailabilityState.saving(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$SavingCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) _then) =
      __$SavingCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SavingCopyWithImpl<$Res> implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(this._self, this._then);

  final _Saving _self;
  final $Res Function(_Saving) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Saving(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Saved implements AvailabilityState {
  const _Saved(this.vm, this.message);

  @override
  final AvailabilityVM vm;
  final String message;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedCopyWith<_Saved> get copyWith =>
      __$SavedCopyWithImpl<_Saved>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Saved &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, message);

  @override
  String toString() {
    return 'AvailabilityState.saved(vm: $vm, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SavedCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) _then) =
      __$SavedCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm, String message});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(this._self, this._then);

  final _Saved _self;
  final $Res Function(_Saved) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
    Object? message = null,
  }) {
    return _then(_Saved(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Deleted implements AvailabilityState {
  const _Deleted(this.vm, this.message);

  @override
  final AvailabilityVM vm;
  final String message;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeletedCopyWith<_Deleted> get copyWith =>
      __$DeletedCopyWithImpl<_Deleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Deleted &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, message);

  @override
  String toString() {
    return 'AvailabilityState.deleted(vm: $vm, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) =
      __$DeletedCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm, String message});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$DeletedCopyWithImpl<$Res> implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
    Object? message = null,
  }) {
    return _then(_Deleted(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error implements AvailabilityState {
  const _Error(this.vm, this.message);

  @override
  final AvailabilityVM vm;
  final String message;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, message);

  @override
  String toString() {
    return 'AvailabilityState.error(vm: $vm, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({AvailabilityVM vm, String message});

  @override
  $AvailabilityVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
    Object? message = null,
  }) {
    return _then(_Error(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as AvailabilityVM,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<$Res> get vm {
    return $AvailabilityVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
