// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starting_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartingStateCopyWith<$Res> {
  factory $StartingStateCopyWith(
          StartingState value, $Res Function(StartingState) then) =
      _$StartingStateCopyWithImpl<$Res, StartingState>;
}

/// @nodoc
class _$StartingStateCopyWithImpl<$Res, $Val extends StartingState>
    implements $StartingStateCopyWith<$Res> {
  _$StartingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StartingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'StartingState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements StartingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StartingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingState
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
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl(this.vm);

  @override
  final StartingVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.loading(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.loading'))
      ..add(DiagnosticsProperty('vm', vm));
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

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    return loading(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    return loading?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
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
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements StartingState {
  const factory _Loading(final StartingVM vm) = _$LoadingImpl;

  StartingVM get vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WelcomeImplCopyWith<$Res> {
  factory _$$WelcomeImplCopyWith(
          _$WelcomeImpl value, $Res Function(_$WelcomeImpl) then) =
      __$$WelcomeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$WelcomeImplCopyWithImpl<$Res>
    extends _$StartingStateCopyWithImpl<$Res, _$WelcomeImpl>
    implements _$$WelcomeImplCopyWith<$Res> {
  __$$WelcomeImplCopyWithImpl(
      _$WelcomeImpl _value, $Res Function(_$WelcomeImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$WelcomeImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _$WelcomeImpl with DiagnosticableTreeMixin implements _Welcome {
  const _$WelcomeImpl(this.vm);

  @override
  final StartingVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.welcome(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.welcome'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WelcomeImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WelcomeImplCopyWith<_$WelcomeImpl> get copyWith =>
      __$$WelcomeImplCopyWithImpl<_$WelcomeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    return welcome(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    return welcome?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
    required TResult orElse(),
  }) {
    if (welcome != null) {
      return welcome(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return welcome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return welcome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (welcome != null) {
      return welcome(this);
    }
    return orElse();
  }
}

abstract class _Welcome implements StartingState {
  const factory _Welcome(final StartingVM vm) = _$WelcomeImpl;

  StartingVM get vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WelcomeImplCopyWith<_$WelcomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsNewUserImplCopyWith<$Res> {
  factory _$$IsNewUserImplCopyWith(
          _$IsNewUserImpl value, $Res Function(_$IsNewUserImpl) then) =
      __$$IsNewUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$IsNewUserImplCopyWithImpl<$Res>
    extends _$StartingStateCopyWithImpl<$Res, _$IsNewUserImpl>
    implements _$$IsNewUserImplCopyWith<$Res> {
  __$$IsNewUserImplCopyWithImpl(
      _$IsNewUserImpl _value, $Res Function(_$IsNewUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$IsNewUserImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _$IsNewUserImpl with DiagnosticableTreeMixin implements _IsNewUser {
  const _$IsNewUserImpl(this.vm);

  @override
  final StartingVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.isNewUser(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.isNewUser'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsNewUserImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsNewUserImplCopyWith<_$IsNewUserImpl> get copyWith =>
      __$$IsNewUserImplCopyWithImpl<_$IsNewUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    return isNewUser(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    return isNewUser?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
    required TResult orElse(),
  }) {
    if (isNewUser != null) {
      return isNewUser(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return isNewUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return isNewUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (isNewUser != null) {
      return isNewUser(this);
    }
    return orElse();
  }
}

abstract class _IsNewUser implements StartingState {
  const factory _IsNewUser(final StartingVM vm) = _$IsNewUserImpl;

  StartingVM get vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsNewUserImplCopyWith<_$IsNewUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserAuthenticatedImplCopyWith<$Res> {
  factory _$$UserAuthenticatedImplCopyWith(_$UserAuthenticatedImpl value,
          $Res Function(_$UserAuthenticatedImpl) then) =
      __$$UserAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$UserAuthenticatedImplCopyWithImpl<$Res>
    extends _$StartingStateCopyWithImpl<$Res, _$UserAuthenticatedImpl>
    implements _$$UserAuthenticatedImplCopyWith<$Res> {
  __$$UserAuthenticatedImplCopyWithImpl(_$UserAuthenticatedImpl _value,
      $Res Function(_$UserAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$UserAuthenticatedImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _$UserAuthenticatedImpl
    with DiagnosticableTreeMixin
    implements _UserAuthenticated {
  const _$UserAuthenticatedImpl(this.vm);

  @override
  final StartingVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.userAuthenticated(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.userAuthenticated'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthenticatedImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthenticatedImplCopyWith<_$UserAuthenticatedImpl> get copyWith =>
      __$$UserAuthenticatedImplCopyWithImpl<_$UserAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    return userAuthenticated(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    return userAuthenticated?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
    required TResult orElse(),
  }) {
    if (userAuthenticated != null) {
      return userAuthenticated(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return userAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return userAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (userAuthenticated != null) {
      return userAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UserAuthenticated implements StartingState {
  const factory _UserAuthenticated(final StartingVM vm) =
      _$UserAuthenticatedImpl;

  StartingVM get vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAuthenticatedImplCopyWith<_$UserAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg, StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$StartingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingState
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
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.msg, this.vm);

  @override
  final String msg;
  @override
  final StartingVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.error(msg: $msg, vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.error'))
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

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    return error(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    return error?.call(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
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
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements StartingState {
  const factory _Error(final String msg, final StartingVM vm) = _$ErrorImpl;

  String get msg;
  StartingVM get vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
