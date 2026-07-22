// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageMenuState {
  ManageMenuVM get vm;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManageMenuStateCopyWith<ManageMenuState> get copyWith =>
      _$ManageMenuStateCopyWithImpl<ManageMenuState>(
          this as ManageMenuState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManageMenuState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'ManageMenuState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $ManageMenuStateCopyWith<$Res> {
  factory $ManageMenuStateCopyWith(
          ManageMenuState value, $Res Function(ManageMenuState) _then) =
      _$ManageMenuStateCopyWithImpl;
  @useResult
  $Res call({ManageMenuVM vm});

  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$ManageMenuStateCopyWithImpl<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  _$ManageMenuStateCopyWithImpl(this._self, this._then);

  final ManageMenuState _self;
  final $Res Function(ManageMenuState) _then;

  /// Create a copy of ManageMenuState
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
              as ManageMenuVM,
    ));
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ManageMenuState].
extension ManageMenuStatePatterns on ManageMenuState {
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
    TResult Function(_ShowSnackbar value)? showSnackbar,
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
      case _ShowSnackbar() when showSnackbar != null:
        return showSnackbar(_that);
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
    required TResult Function(_ShowSnackbar value) showSnackbar,
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
      case _ShowSnackbar():
        return showSnackbar(_that);
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
    TResult? Function(_ShowSnackbar value)? showSnackbar,
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
      case _ShowSnackbar() when showSnackbar != null:
        return showSnackbar(_that);
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
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
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
      case _ShowSnackbar() when showSnackbar != null:
        return showSnackbar(_that.vm, _that.msg);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
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
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Loading():
        return loading(_that.vm);
      case _Loaded():
        return loaded(_that.vm);
      case _ShowSnackbar():
        return showSnackbar(_that.vm, _that.msg);
      case _Error():
        return error(_that.msg, _that.vm);
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
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _ShowSnackbar() when showSnackbar != null:
        return showSnackbar(_that.vm, _that.msg);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial extends ManageMenuState {
  const _Initial(this.vm) : super._();

  @override
  final ManageMenuVM vm;

  /// Create a copy of ManageMenuState
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
    return 'ManageMenuState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of ManageMenuState
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
              as ManageMenuVM,
    ));
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loading extends ManageMenuState {
  const _Loading(this.vm) : super._();

  @override
  final ManageMenuVM vm;

  /// Create a copy of ManageMenuState
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
    return 'ManageMenuState.loading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of ManageMenuState
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
              as ManageMenuVM,
    ));
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loaded extends ManageMenuState {
  const _Loaded(this.vm) : super._();

  @override
  final ManageMenuVM vm;

  /// Create a copy of ManageMenuState
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
    return 'ManageMenuState.loaded(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of ManageMenuState
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
              as ManageMenuVM,
    ));
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _ShowSnackbar extends ManageMenuState {
  const _ShowSnackbar(this.vm, this.msg) : super._();

  @override
  final ManageMenuVM vm;
  final String msg;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowSnackbarCopyWith<_ShowSnackbar> get copyWith =>
      __$ShowSnackbarCopyWithImpl<_ShowSnackbar>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowSnackbar &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, msg);

  @override
  String toString() {
    return 'ManageMenuState.showSnackbar(vm: $vm, msg: $msg)';
  }
}

/// @nodoc
abstract mixin class _$ShowSnackbarCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$ShowSnackbarCopyWith(
          _ShowSnackbar value, $Res Function(_ShowSnackbar) _then) =
      __$ShowSnackbarCopyWithImpl;
  @override
  @useResult
  $Res call({ManageMenuVM vm, String msg});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ShowSnackbarCopyWithImpl<$Res>
    implements _$ShowSnackbarCopyWith<$Res> {
  __$ShowSnackbarCopyWithImpl(this._self, this._then);

  final _ShowSnackbar _self;
  final $Res Function(_ShowSnackbar) _then;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
    Object? msg = null,
  }) {
    return _then(_ShowSnackbar(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error extends ManageMenuState {
  const _Error(this.msg, this.vm) : super._();

  final String msg;
  @override
  final ManageMenuVM vm;

  /// Create a copy of ManageMenuState
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
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg, vm);

  @override
  String toString() {
    return 'ManageMenuState.error(msg: $msg, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String msg, ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
    Object? vm = null,
  }) {
    return _then(_Error(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
    ));
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
