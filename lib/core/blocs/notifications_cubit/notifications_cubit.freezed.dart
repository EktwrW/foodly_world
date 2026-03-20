// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsState {
  NotificationsVM get vm => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationsVM vm) initial,
    required TResult Function(NotificationsVM vm) loading,
    required TResult Function(NotificationsVM vm) loaded,
    required TResult Function(NotificationsVM vm, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationsVM vm)? initial,
    TResult? Function(NotificationsVM vm)? loading,
    TResult? Function(NotificationsVM vm)? loaded,
    TResult? Function(NotificationsVM vm, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationsVM vm)? initial,
    TResult Function(NotificationsVM vm)? loading,
    TResult Function(NotificationsVM vm)? loaded,
    TResult Function(NotificationsVM vm, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
  @useResult
  $Res call({NotificationsVM vm});

  $NotificationsVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsState
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
              as NotificationsVM,
    ) as $Val);
  }

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsVMCopyWith<$Res> get vm {
    return $NotificationsVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationsVM vm});

  @override
  $NotificationsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
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
              as NotificationsVM,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.vm);

  @override
  final NotificationsVM vm;

  @override
  String toString() {
    return 'NotificationsState.initial(vm: $vm)';
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

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationsVM vm) initial,
    required TResult Function(NotificationsVM vm) loading,
    required TResult Function(NotificationsVM vm) loaded,
    required TResult Function(NotificationsVM vm, String message) error,
  }) {
    return initial(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationsVM vm)? initial,
    TResult? Function(NotificationsVM vm)? loading,
    TResult? Function(NotificationsVM vm)? loaded,
    TResult? Function(NotificationsVM vm, String message)? error,
  }) {
    return initial?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationsVM vm)? initial,
    TResult Function(NotificationsVM vm)? loading,
    TResult Function(NotificationsVM vm)? loaded,
    TResult Function(NotificationsVM vm, String message)? error,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationsState {
  const factory _Initial(final NotificationsVM vm) = _$InitialImpl;

  @override
  NotificationsVM get vm;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationsVM vm});

  @override
  $NotificationsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
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
              as NotificationsVM,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.vm);

  @override
  final NotificationsVM vm;

  @override
  String toString() {
    return 'NotificationsState.loading(vm: $vm)';
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

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationsVM vm) initial,
    required TResult Function(NotificationsVM vm) loading,
    required TResult Function(NotificationsVM vm) loaded,
    required TResult Function(NotificationsVM vm, String message) error,
  }) {
    return loading(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationsVM vm)? initial,
    TResult? Function(NotificationsVM vm)? loading,
    TResult? Function(NotificationsVM vm)? loaded,
    TResult? Function(NotificationsVM vm, String message)? error,
  }) {
    return loading?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationsVM vm)? initial,
    TResult Function(NotificationsVM vm)? loading,
    TResult Function(NotificationsVM vm)? loaded,
    TResult Function(NotificationsVM vm, String message)? error,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NotificationsState {
  const factory _Loading(final NotificationsVM vm) = _$LoadingImpl;

  @override
  NotificationsVM get vm;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationsVM vm});

  @override
  $NotificationsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
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
              as NotificationsVM,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.vm);

  @override
  final NotificationsVM vm;

  @override
  String toString() {
    return 'NotificationsState.loaded(vm: $vm)';
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

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationsVM vm) initial,
    required TResult Function(NotificationsVM vm) loading,
    required TResult Function(NotificationsVM vm) loaded,
    required TResult Function(NotificationsVM vm, String message) error,
  }) {
    return loaded(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationsVM vm)? initial,
    TResult? Function(NotificationsVM vm)? loading,
    TResult? Function(NotificationsVM vm)? loaded,
    TResult? Function(NotificationsVM vm, String message)? error,
  }) {
    return loaded?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationsVM vm)? initial,
    TResult Function(NotificationsVM vm)? loading,
    TResult Function(NotificationsVM vm)? loaded,
    TResult Function(NotificationsVM vm, String message)? error,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements NotificationsState {
  const factory _Loaded(final NotificationsVM vm) = _$LoadedImpl;

  @override
  NotificationsVM get vm;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationsVM vm, String message});

  @override
  $NotificationsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as NotificationsVM,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.vm, this.message);

  @override
  final NotificationsVM vm;
  @override
  final String message;

  @override
  String toString() {
    return 'NotificationsState.error(vm: $vm, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, message);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationsVM vm) initial,
    required TResult Function(NotificationsVM vm) loading,
    required TResult Function(NotificationsVM vm) loaded,
    required TResult Function(NotificationsVM vm, String message) error,
  }) {
    return error(vm, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationsVM vm)? initial,
    TResult? Function(NotificationsVM vm)? loading,
    TResult? Function(NotificationsVM vm)? loaded,
    TResult? Function(NotificationsVM vm, String message)? error,
  }) {
    return error?.call(vm, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationsVM vm)? initial,
    TResult Function(NotificationsVM vm)? loading,
    TResult Function(NotificationsVM vm)? loaded,
    TResult Function(NotificationsVM vm, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(vm, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
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
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NotificationsState {
  const factory _Error(final NotificationsVM vm, final String message) =
      _$ErrorImpl;

  @override
  NotificationsVM get vm;
  String get message;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
