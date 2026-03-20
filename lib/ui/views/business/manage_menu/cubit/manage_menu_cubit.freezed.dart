// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManageMenuState {
  ManageMenuVM get vm => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ShowSnackbar value) showSnackbar,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ShowSnackbar value)? showSnackbar,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ShowSnackbar value)? showSnackbar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageMenuStateCopyWith<ManageMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageMenuStateCopyWith<$Res> {
  factory $ManageMenuStateCopyWith(
          ManageMenuState value, $Res Function(ManageMenuState) then) =
      _$ManageMenuStateCopyWithImpl<$Res, ManageMenuState>;
  @useResult
  $Res call({ManageMenuVM vm});

  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$ManageMenuStateCopyWithImpl<$Res, $Val extends ManageMenuState>
    implements $ManageMenuStateCopyWith<$Res> {
  _$ManageMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_value.copyWith(
      vm: null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
    ) as $Val);
  }

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<$Res> get vm {
    return $ManageMenuVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ManageMenuStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$InitialImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.vm) : super._();

  @override
  final ManageMenuVM vm;

  @override
  String toString() {
    return 'ManageMenuState.initial(vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) {
    return initial(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) {
    return initial?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ShowSnackbar value) showSnackbar,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ShowSnackbar value)? showSnackbar,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ShowSnackbar value)? showSnackbar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends ManageMenuState {
  const factory _Initial(final ManageMenuVM vm) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  ManageMenuVM get vm;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ManageMenuStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$LoadingImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
    ));
  }
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl(this.vm) : super._();

  @override
  final ManageMenuVM vm;

  @override
  String toString() {
    return 'ManageMenuState.loading(vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) {
    return loading(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) {
    return loading?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ShowSnackbar value) showSnackbar,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ShowSnackbar value)? showSnackbar,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ShowSnackbar value)? showSnackbar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends ManageMenuState {
  const factory _Loading(final ManageMenuVM vm) = _$LoadingImpl;
  const _Loading._() : super._();

  @override
  ManageMenuVM get vm;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ManageMenuStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$LoadedImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl(this.vm) : super._();

  @override
  final ManageMenuVM vm;

  @override
  String toString() {
    return 'ManageMenuState.loaded(vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) {
    return loaded(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) {
    return loaded?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ShowSnackbar value) showSnackbar,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ShowSnackbar value)? showSnackbar,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ShowSnackbar value)? showSnackbar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends ManageMenuState {
  const factory _Loaded(final ManageMenuVM vm) = _$LoadedImpl;
  const _Loaded._() : super._();

  @override
  ManageMenuVM get vm;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowSnackbarImplCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$$ShowSnackbarImplCopyWith(
          _$ShowSnackbarImpl value, $Res Function(_$ShowSnackbarImpl) then) =
      __$$ShowSnackbarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ManageMenuVM vm, String msg});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ShowSnackbarImplCopyWithImpl<$Res>
    extends _$ManageMenuStateCopyWithImpl<$Res, _$ShowSnackbarImpl>
    implements _$$ShowSnackbarImplCopyWith<$Res> {
  __$$ShowSnackbarImplCopyWithImpl(
      _$ShowSnackbarImpl _value, $Res Function(_$ShowSnackbarImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
    Object? msg = null,
  }) {
    return _then(_$ShowSnackbarImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowSnackbarImpl extends _ShowSnackbar {
  const _$ShowSnackbarImpl(this.vm, this.msg) : super._();

  @override
  final ManageMenuVM vm;
  @override
  final String msg;

  @override
  String toString() {
    return 'ManageMenuState.showSnackbar(vm: $vm, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowSnackbarImpl &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, msg);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowSnackbarImplCopyWith<_$ShowSnackbarImpl> get copyWith =>
      __$$ShowSnackbarImplCopyWithImpl<_$ShowSnackbarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) {
    return showSnackbar(vm, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) {
    return showSnackbar?.call(vm, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
    required TResult orElse(),
  }) {
    if (showSnackbar != null) {
      return showSnackbar(vm, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ShowSnackbar value) showSnackbar,
    required TResult Function(_Error value) error,
  }) {
    return showSnackbar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ShowSnackbar value)? showSnackbar,
    TResult? Function(_Error value)? error,
  }) {
    return showSnackbar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ShowSnackbar value)? showSnackbar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (showSnackbar != null) {
      return showSnackbar(this);
    }
    return orElse();
  }
}

abstract class _ShowSnackbar extends ManageMenuState {
  const factory _ShowSnackbar(final ManageMenuVM vm, final String msg) =
      _$ShowSnackbarImpl;
  const _ShowSnackbar._() : super._();

  @override
  ManageMenuVM get vm;
  String get msg;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowSnackbarImplCopyWith<_$ShowSnackbarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $ManageMenuStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg, ManageMenuVM vm});

  @override
  $ManageMenuVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ManageMenuStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? vm = null,
  }) {
    return _then(_$ErrorImpl(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManageMenuVM,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(this.msg, this.vm) : super._();

  @override
  final String msg;
  @override
  final ManageMenuVM vm;

  @override
  String toString() {
    return 'ManageMenuState.error(msg: $msg, vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg, vm);

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ManageMenuVM vm) initial,
    required TResult Function(ManageMenuVM vm) loading,
    required TResult Function(ManageMenuVM vm) loaded,
    required TResult Function(ManageMenuVM vm, String msg) showSnackbar,
    required TResult Function(String msg, ManageMenuVM vm) error,
  }) {
    return error(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ManageMenuVM vm)? initial,
    TResult? Function(ManageMenuVM vm)? loading,
    TResult? Function(ManageMenuVM vm)? loaded,
    TResult? Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult? Function(String msg, ManageMenuVM vm)? error,
  }) {
    return error?.call(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ManageMenuVM vm)? initial,
    TResult Function(ManageMenuVM vm)? loading,
    TResult Function(ManageMenuVM vm)? loaded,
    TResult Function(ManageMenuVM vm, String msg)? showSnackbar,
    TResult Function(String msg, ManageMenuVM vm)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg, vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ShowSnackbar value) showSnackbar,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ShowSnackbar value)? showSnackbar,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ShowSnackbar value)? showSnackbar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends ManageMenuState {
  const factory _Error(final String msg, final ManageMenuVM vm) = _$ErrorImpl;
  const _Error._() : super._();

  String get msg;
  @override
  ManageMenuVM get vm;

  /// Create a copy of ManageMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
