// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starting_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StartingState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'StartingState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StartingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState()';
  }
}

/// @nodoc
class $StartingStateCopyWith<$Res> {
  $StartingStateCopyWith(StartingState _, $Res Function(StartingState) __);
}

/// Adds pattern-matching-related methods to [StartingState].
extension StartingStatePatterns on StartingState {
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
    TResult Function(_Welcome value)? welcome,
    TResult Function(_IsNewUser value)? isNewUser,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Welcome() when welcome != null:
        return welcome(_that);
      case _IsNewUser() when isNewUser != null:
        return isNewUser(_that);
      case _UserAuthenticated() when userAuthenticated != null:
        return userAuthenticated(_that);
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
    required TResult Function(_Welcome value) welcome,
    required TResult Function(_IsNewUser value) isNewUser,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Welcome():
        return welcome(_that);
      case _IsNewUser():
        return isNewUser(_that);
      case _UserAuthenticated():
        return userAuthenticated(_that);
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
    TResult? Function(_Welcome value)? welcome,
    TResult? Function(_IsNewUser value)? isNewUser,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Welcome() when welcome != null:
        return welcome(_that);
      case _IsNewUser() when isNewUser != null:
        return isNewUser(_that);
      case _UserAuthenticated() when userAuthenticated != null:
        return userAuthenticated(_that);
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
    TResult Function()? initial,
    TResult Function(StartingVM vm)? loading,
    TResult Function(StartingVM vm)? welcome,
    TResult Function(StartingVM vm)? isNewUser,
    TResult Function(StartingVM vm)? userAuthenticated,
    TResult Function(String msg, StartingVM vm)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Welcome() when welcome != null:
        return welcome(_that.vm);
      case _IsNewUser() when isNewUser != null:
        return isNewUser(_that.vm);
      case _UserAuthenticated() when userAuthenticated != null:
        return userAuthenticated(_that.vm);
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
    required TResult Function() initial,
    required TResult Function(StartingVM vm) loading,
    required TResult Function(StartingVM vm) welcome,
    required TResult Function(StartingVM vm) isNewUser,
    required TResult Function(StartingVM vm) userAuthenticated,
    required TResult Function(String msg, StartingVM vm) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading(_that.vm);
      case _Welcome():
        return welcome(_that.vm);
      case _IsNewUser():
        return isNewUser(_that.vm);
      case _UserAuthenticated():
        return userAuthenticated(_that.vm);
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
    TResult? Function()? initial,
    TResult? Function(StartingVM vm)? loading,
    TResult? Function(StartingVM vm)? welcome,
    TResult? Function(StartingVM vm)? isNewUser,
    TResult? Function(StartingVM vm)? userAuthenticated,
    TResult? Function(String msg, StartingVM vm)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Welcome() when welcome != null:
        return welcome(_that.vm);
      case _IsNewUser() when isNewUser != null:
        return isNewUser(_that.vm);
      case _UserAuthenticated() when userAuthenticated != null:
        return userAuthenticated(_that.vm);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements StartingState {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'StartingState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.initial()';
  }
}

/// @nodoc

class _Loading with DiagnosticableTreeMixin implements StartingState {
  const _Loading(this.vm);

  final StartingVM vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.loading'))
      ..add(DiagnosticsProperty('vm', vm));
  }

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.loading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $StartingStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Loading(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Welcome with DiagnosticableTreeMixin implements StartingState {
  const _Welcome(this.vm);

  final StartingVM vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WelcomeCopyWith<_Welcome> get copyWith =>
      __$WelcomeCopyWithImpl<_Welcome>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.welcome'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Welcome &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.welcome(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$WelcomeCopyWith<$Res>
    implements $StartingStateCopyWith<$Res> {
  factory _$WelcomeCopyWith(_Welcome value, $Res Function(_Welcome) _then) =
      __$WelcomeCopyWithImpl;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$WelcomeCopyWithImpl<$Res> implements _$WelcomeCopyWith<$Res> {
  __$WelcomeCopyWithImpl(this._self, this._then);

  final _Welcome _self;
  final $Res Function(_Welcome) _then;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Welcome(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _IsNewUser with DiagnosticableTreeMixin implements StartingState {
  const _IsNewUser(this.vm);

  final StartingVM vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IsNewUserCopyWith<_IsNewUser> get copyWith =>
      __$IsNewUserCopyWithImpl<_IsNewUser>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.isNewUser'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IsNewUser &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.isNewUser(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$IsNewUserCopyWith<$Res>
    implements $StartingStateCopyWith<$Res> {
  factory _$IsNewUserCopyWith(
          _IsNewUser value, $Res Function(_IsNewUser) _then) =
      __$IsNewUserCopyWithImpl;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$IsNewUserCopyWithImpl<$Res> implements _$IsNewUserCopyWith<$Res> {
  __$IsNewUserCopyWithImpl(this._self, this._then);

  final _IsNewUser _self;
  final $Res Function(_IsNewUser) _then;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_IsNewUser(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _UserAuthenticated with DiagnosticableTreeMixin implements StartingState {
  const _UserAuthenticated(this.vm);

  final StartingVM vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAuthenticatedCopyWith<_UserAuthenticated> get copyWith =>
      __$UserAuthenticatedCopyWithImpl<_UserAuthenticated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.userAuthenticated'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAuthenticated &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.userAuthenticated(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$UserAuthenticatedCopyWith<$Res>
    implements $StartingStateCopyWith<$Res> {
  factory _$UserAuthenticatedCopyWith(
          _UserAuthenticated value, $Res Function(_UserAuthenticated) _then) =
      __$UserAuthenticatedCopyWithImpl;
  @useResult
  $Res call({StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$UserAuthenticatedCopyWithImpl<$Res>
    implements _$UserAuthenticatedCopyWith<$Res> {
  __$UserAuthenticatedCopyWithImpl(this._self, this._then);

  final _UserAuthenticated _self;
  final $Res Function(_UserAuthenticated) _then;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_UserAuthenticated(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements StartingState {
  const _Error(this.msg, this.vm);

  final String msg;
  final StartingVM vm;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'StartingState.error'))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('vm', vm));
  }

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingState.error(msg: $msg, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $StartingStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String msg, StartingVM vm});

  $StartingVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
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
              as StartingVM,
    ));
  }

  /// Create a copy of StartingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<$Res> get vm {
    return $StartingVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
