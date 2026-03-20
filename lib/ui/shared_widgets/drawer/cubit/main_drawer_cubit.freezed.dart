// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_drawer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainDrawerState {
  MainDrawerVM get vm => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainDrawerStateCopyWith<MainDrawerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDrawerStateCopyWith<$Res> {
  factory $MainDrawerStateCopyWith(
          MainDrawerState value, $Res Function(MainDrawerState) then) =
      _$MainDrawerStateCopyWithImpl<$Res, MainDrawerState>;
  @useResult
  $Res call({MainDrawerVM vm});

  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$MainDrawerStateCopyWithImpl<$Res, $Val extends MainDrawerState>
    implements $MainDrawerStateCopyWith<$Res> {
  _$MainDrawerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ) as $Val);
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MainDrawerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(this.vm);

  @override
  final MainDrawerVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.initial(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.initial'))
      ..add(DiagnosticsProperty('vm', vm));
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

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) {
    return initial(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) {
    return initial?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MainDrawerState {
  const factory _Initial(final MainDrawerVM vm) = _$InitialImpl;

  @override
  MainDrawerVM get vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MainDrawerStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(this.vm);

  @override
  final MainDrawerVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.loaded(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.loaded'))
      ..add(DiagnosticsProperty('vm', vm));
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

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) {
    return loaded(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) {
    return loaded?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements MainDrawerState {
  const factory _Loaded(final MainDrawerVM vm) = _$LoadedImpl;

  @override
  MainDrawerVM get vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenDrawerImplCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$$OpenDrawerImplCopyWith(
          _$OpenDrawerImpl value, $Res Function(_$OpenDrawerImpl) then) =
      __$$OpenDrawerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$OpenDrawerImplCopyWithImpl<$Res>
    extends _$MainDrawerStateCopyWithImpl<$Res, _$OpenDrawerImpl>
    implements _$$OpenDrawerImplCopyWith<$Res> {
  __$$OpenDrawerImplCopyWithImpl(
      _$OpenDrawerImpl _value, $Res Function(_$OpenDrawerImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$OpenDrawerImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MainDrawerVM,
    ));
  }
}

/// @nodoc

class _$OpenDrawerImpl with DiagnosticableTreeMixin implements _OpenDrawer {
  const _$OpenDrawerImpl(this.vm);

  @override
  final MainDrawerVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.openDrawer(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.openDrawer'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenDrawerImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenDrawerImplCopyWith<_$OpenDrawerImpl> get copyWith =>
      __$$OpenDrawerImplCopyWithImpl<_$OpenDrawerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) {
    return openDrawer(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) {
    return openDrawer?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
    required TResult orElse(),
  }) {
    if (openDrawer != null) {
      return openDrawer(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) {
    return openDrawer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) {
    return openDrawer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (openDrawer != null) {
      return openDrawer(this);
    }
    return orElse();
  }
}

abstract class _OpenDrawer implements MainDrawerState {
  const factory _OpenDrawer(final MainDrawerVM vm) = _$OpenDrawerImpl;

  @override
  MainDrawerVM get vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenDrawerImplCopyWith<_$OpenDrawerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatingAvatarImplCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$$UpdatingAvatarImplCopyWith(_$UpdatingAvatarImpl value,
          $Res Function(_$UpdatingAvatarImpl) then) =
      __$$UpdatingAvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$UpdatingAvatarImplCopyWithImpl<$Res>
    extends _$MainDrawerStateCopyWithImpl<$Res, _$UpdatingAvatarImpl>
    implements _$$UpdatingAvatarImplCopyWith<$Res> {
  __$$UpdatingAvatarImplCopyWithImpl(
      _$UpdatingAvatarImpl _value, $Res Function(_$UpdatingAvatarImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$UpdatingAvatarImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MainDrawerVM,
    ));
  }
}

/// @nodoc

class _$UpdatingAvatarImpl
    with DiagnosticableTreeMixin
    implements _UpdatingAvatar {
  const _$UpdatingAvatarImpl(this.vm);

  @override
  final MainDrawerVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.updatingAvatar(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.updatingAvatar'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatingAvatarImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatingAvatarImplCopyWith<_$UpdatingAvatarImpl> get copyWith =>
      __$$UpdatingAvatarImplCopyWithImpl<_$UpdatingAvatarImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) {
    return updatingAvatar(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) {
    return updatingAvatar?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
    required TResult orElse(),
  }) {
    if (updatingAvatar != null) {
      return updatingAvatar(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) {
    return updatingAvatar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) {
    return updatingAvatar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updatingAvatar != null) {
      return updatingAvatar(this);
    }
    return orElse();
  }
}

abstract class _UpdatingAvatar implements MainDrawerState {
  const factory _UpdatingAvatar(final MainDrawerVM vm) = _$UpdatingAvatarImpl;

  @override
  MainDrawerVM get vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatingAvatarImplCopyWith<_$UpdatingAvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg, MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MainDrawerStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.msg, this.vm);

  @override
  final String msg;
  @override
  final MainDrawerVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.error(msg: $msg, vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.error'))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('vm', vm));
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

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) {
    return error(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) {
    return error?.call(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MainDrawerState {
  const factory _Error(final String msg, final MainDrawerVM vm) = _$ErrorImpl;

  String get msg;
  @override
  MainDrawerVM get vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
