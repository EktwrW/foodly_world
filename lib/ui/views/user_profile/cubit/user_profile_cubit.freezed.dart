// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfileState {
  UserProfileVM get vm => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileStateCopyWith<UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res, UserProfileState>;
  @useResult
  $Res call({UserProfileVM vm});

  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res, $Val extends UserProfileState>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileState
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
              as UserProfileVM,
    ) as $Val);
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<$Res> get vm {
    return $UserProfileVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileVM vm});

  @override
  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
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
              as UserProfileVM,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(this.vm);

  @override
  final UserProfileVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileState.initial(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfileState.initial'))
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

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) {
    return initial(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) {
    return initial?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
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
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserProfileState {
  const factory _Initial(final UserProfileVM vm) = _$InitialImpl;

  @override
  UserProfileVM get vm;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileVM vm});

  @override
  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
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
              as UserProfileVM,
    ));
  }
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  _$LoadingImpl(this.vm);

  @override
  final UserProfileVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileState.loading(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfileState.loading'))
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

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) {
    return loading(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) {
    return loading?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
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
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserProfileState {
  factory _Loading(final UserProfileVM vm) = _$LoadingImpl;

  @override
  UserProfileVM get vm;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatingProfilePictureImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$UpdatingProfilePictureImplCopyWith(
          _$UpdatingProfilePictureImpl value,
          $Res Function(_$UpdatingProfilePictureImpl) then) =
      __$$UpdatingProfilePictureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileVM vm});

  @override
  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$UpdatingProfilePictureImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$UpdatingProfilePictureImpl>
    implements _$$UpdatingProfilePictureImplCopyWith<$Res> {
  __$$UpdatingProfilePictureImplCopyWithImpl(
      _$UpdatingProfilePictureImpl _value,
      $Res Function(_$UpdatingProfilePictureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$UpdatingProfilePictureImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }
}

/// @nodoc

class _$UpdatingProfilePictureImpl
    with DiagnosticableTreeMixin
    implements _UpdatingProfilePicture {
  _$UpdatingProfilePictureImpl(this.vm);

  @override
  final UserProfileVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileState.updatingProfilePicture(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'UserProfileState.updatingProfilePicture'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatingProfilePictureImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatingProfilePictureImplCopyWith<_$UpdatingProfilePictureImpl>
      get copyWith => __$$UpdatingProfilePictureImplCopyWithImpl<
          _$UpdatingProfilePictureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) {
    return updatingProfilePicture(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) {
    return updatingProfilePicture?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
    required TResult orElse(),
  }) {
    if (updatingProfilePicture != null) {
      return updatingProfilePicture(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) {
    return updatingProfilePicture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) {
    return updatingProfilePicture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updatingProfilePicture != null) {
      return updatingProfilePicture(this);
    }
    return orElse();
  }
}

abstract class _UpdatingProfilePicture implements UserProfileState {
  factory _UpdatingProfilePicture(final UserProfileVM vm) =
      _$UpdatingProfilePictureImpl;

  @override
  UserProfileVM get vm;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatingProfilePictureImplCopyWith<_$UpdatingProfilePictureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileVM vm});

  @override
  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
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
              as UserProfileVM,
    ));
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  _$LoadedImpl(this.vm);

  @override
  final UserProfileVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileState.loaded(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfileState.loaded'))
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

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) {
    return loaded(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) {
    return loaded?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
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
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements UserProfileState {
  factory _Loaded(final UserProfileVM vm) = _$LoadedImpl;

  @override
  UserProfileVM get vm;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUpdatedImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$UserUpdatedImplCopyWith(
          _$UserUpdatedImpl value, $Res Function(_$UserUpdatedImpl) then) =
      __$$UserUpdatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileVM vm, String msg});

  @override
  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$UserUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$UserUpdatedImpl>
    implements _$$UserUpdatedImplCopyWith<$Res> {
  __$$UserUpdatedImplCopyWithImpl(
      _$UserUpdatedImpl _value, $Res Function(_$UserUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
    Object? msg = null,
  }) {
    return _then(_$UserUpdatedImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserUpdatedImpl with DiagnosticableTreeMixin implements _UserUpdated {
  _$UserUpdatedImpl(this.vm, this.msg);

  @override
  final UserProfileVM vm;
  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileState.userUpdated(vm: $vm, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfileState.userUpdated'))
      ..add(DiagnosticsProperty('vm', vm))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdatedImpl &&
            (identical(other.vm, vm) || other.vm == vm) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm, msg);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdatedImplCopyWith<_$UserUpdatedImpl> get copyWith =>
      __$$UserUpdatedImplCopyWithImpl<_$UserUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) {
    return userUpdated(vm, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) {
    return userUpdated?.call(vm, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(vm, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) {
    return userUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) {
    return userUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(this);
    }
    return orElse();
  }
}

abstract class _UserUpdated implements UserProfileState {
  factory _UserUpdated(final UserProfileVM vm, final String msg) =
      _$UserUpdatedImpl;

  @override
  UserProfileVM get vm;
  String get msg;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserUpdatedImplCopyWith<_$UserUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, UserProfileVM vm});

  @override
  $UserProfileVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? vm = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  _$ErrorImpl(this.message, this.vm);

  @override
  final String message;
  @override
  final UserProfileVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileState.error(message: $message, vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfileState.error'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, vm);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileVM vm) initial,
    required TResult Function(UserProfileVM vm) loading,
    required TResult Function(UserProfileVM vm) updatingProfilePicture,
    required TResult Function(UserProfileVM vm) loaded,
    required TResult Function(UserProfileVM vm, String msg) userUpdated,
    required TResult Function(String message, UserProfileVM vm) error,
  }) {
    return error(message, vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfileVM vm)? initial,
    TResult? Function(UserProfileVM vm)? loading,
    TResult? Function(UserProfileVM vm)? updatingProfilePicture,
    TResult? Function(UserProfileVM vm)? loaded,
    TResult? Function(UserProfileVM vm, String msg)? userUpdated,
    TResult? Function(String message, UserProfileVM vm)? error,
  }) {
    return error?.call(message, vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileVM vm)? initial,
    TResult Function(UserProfileVM vm)? loading,
    TResult Function(UserProfileVM vm)? updatingProfilePicture,
    TResult Function(UserProfileVM vm)? loaded,
    TResult Function(UserProfileVM vm, String msg)? userUpdated,
    TResult Function(String message, UserProfileVM vm)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatingProfilePicture value)
        updatingProfilePicture,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatingProfilePicture value)? updatingProfilePicture,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserProfileState {
  factory _Error(final String message, final UserProfileVM vm) = _$ErrorImpl;

  String get message;
  @override
  UserProfileVM get vm;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
