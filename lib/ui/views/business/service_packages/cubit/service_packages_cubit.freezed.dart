// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_packages_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicePackagesState {
  ServicePackagesVM get vm;

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicePackagesStateCopyWith<ServicePackagesState> get copyWith =>
      _$ServicePackagesStateCopyWithImpl<ServicePackagesState>(
          this as ServicePackagesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicePackagesState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'ServicePackagesState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $ServicePackagesStateCopyWith<$Res> {
  factory $ServicePackagesStateCopyWith(ServicePackagesState value,
          $Res Function(ServicePackagesState) _then) =
      _$ServicePackagesStateCopyWithImpl;
  @useResult
  $Res call({ServicePackagesVM vm});

  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$ServicePackagesStateCopyWithImpl<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  _$ServicePackagesStateCopyWithImpl(this._self, this._then);

  final ServicePackagesState _self;
  final $Res Function(ServicePackagesState) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServicePackagesState].
extension ServicePackagesStatePatterns on ServicePackagesState {
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
    TResult Function(ServicePackagesVM vm)? initial,
    TResult Function(ServicePackagesVM vm)? loading,
    TResult Function(ServicePackagesVM vm)? loaded,
    TResult Function(ServicePackagesVM vm)? saving,
    TResult Function(ServicePackagesVM vm, String message)? saved,
    TResult Function(ServicePackagesVM vm, String message)? deleted,
    TResult Function(ServicePackagesVM vm, String message)? error,
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
    required TResult Function(ServicePackagesVM vm) initial,
    required TResult Function(ServicePackagesVM vm) loading,
    required TResult Function(ServicePackagesVM vm) loaded,
    required TResult Function(ServicePackagesVM vm) saving,
    required TResult Function(ServicePackagesVM vm, String message) saved,
    required TResult Function(ServicePackagesVM vm, String message) deleted,
    required TResult Function(ServicePackagesVM vm, String message) error,
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
    TResult? Function(ServicePackagesVM vm)? initial,
    TResult? Function(ServicePackagesVM vm)? loading,
    TResult? Function(ServicePackagesVM vm)? loaded,
    TResult? Function(ServicePackagesVM vm)? saving,
    TResult? Function(ServicePackagesVM vm, String message)? saved,
    TResult? Function(ServicePackagesVM vm, String message)? deleted,
    TResult? Function(ServicePackagesVM vm, String message)? error,
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

class _Initial implements ServicePackagesState {
  const _Initial(this.vm);

  @override
  final ServicePackagesVM vm;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loading implements ServicePackagesState {
  const _Loading(this.vm);

  @override
  final ServicePackagesVM vm;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.loading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loaded implements ServicePackagesState {
  const _Loaded(this.vm);

  @override
  final ServicePackagesVM vm;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.loaded(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Saving implements ServicePackagesState {
  const _Saving(this.vm);

  @override
  final ServicePackagesVM vm;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.saving(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$SavingCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) _then) =
      __$SavingCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SavingCopyWithImpl<$Res> implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(this._self, this._then);

  final _Saving _self;
  final $Res Function(_Saving) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Saved implements ServicePackagesState {
  const _Saved(this.vm, this.message);

  @override
  final ServicePackagesVM vm;
  final String message;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.saved(vm: $vm, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SavedCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) _then) =
      __$SavedCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm, String message});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(this._self, this._then);

  final _Saved _self;
  final $Res Function(_Saved) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Deleted implements ServicePackagesState {
  const _Deleted(this.vm, this.message);

  @override
  final ServicePackagesVM vm;
  final String message;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.deleted(vm: $vm, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) =
      __$DeletedCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm, String message});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$DeletedCopyWithImpl<$Res> implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error implements ServicePackagesState {
  const _Error(this.vm, this.message);

  @override
  final ServicePackagesVM vm;
  final String message;

  /// Create a copy of ServicePackagesState
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
    return 'ServicePackagesState.error(vm: $vm, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ServicePackagesStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({ServicePackagesVM vm, String message});

  @override
  $ServicePackagesVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ServicePackagesState
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
              as ServicePackagesVM,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ServicePackagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<$Res> get vm {
    return $ServicePackagesVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
