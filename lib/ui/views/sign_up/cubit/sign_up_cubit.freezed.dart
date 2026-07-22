// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'SignUpState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState()';
  }
}

/// @nodoc
class $SignUpStateCopyWith<$Res> {
  $SignUpStateCopyWith(SignUpState _, $Res Function(SignUpState) __);
}

/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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
    TResult Function(_UserCreated value)? userCreated,
    TResult Function(_BusinessCreationFinished value)? businessCreationFinished,
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
      case _UserCreated() when userCreated != null:
        return userCreated(_that);
      case _BusinessCreationFinished() when businessCreationFinished != null:
        return businessCreationFinished(_that);
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
    required TResult Function(_UserCreated value) userCreated,
    required TResult Function(_BusinessCreationFinished value)
        businessCreationFinished,
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
      case _UserCreated():
        return userCreated(_that);
      case _BusinessCreationFinished():
        return businessCreationFinished(_that);
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
    TResult? Function(_UserCreated value)? userCreated,
    TResult? Function(_BusinessCreationFinished value)?
        businessCreationFinished,
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
      case _UserCreated() when userCreated != null:
        return userCreated(_that);
      case _BusinessCreationFinished() when businessCreationFinished != null:
        return businessCreationFinished(_that);
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
    TResult Function(UserProfileVM signUpVM)? loading,
    TResult Function(UserProfileVM signUpVM)? loaded,
    TResult Function(UserProfileVM signUpVM)? userCreated,
    TResult Function(UserProfileVM signUpVM)? businessCreationFinished,
    TResult Function(String msg, UserProfileVM signUpVM)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.signUpVM);
      case _Loaded() when loaded != null:
        return loaded(_that.signUpVM);
      case _UserCreated() when userCreated != null:
        return userCreated(_that.signUpVM);
      case _BusinessCreationFinished() when businessCreationFinished != null:
        return businessCreationFinished(_that.signUpVM);
      case _Error() when error != null:
        return error(_that.msg, _that.signUpVM);
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
    required TResult Function(UserProfileVM signUpVM) loading,
    required TResult Function(UserProfileVM signUpVM) loaded,
    required TResult Function(UserProfileVM signUpVM) userCreated,
    required TResult Function(UserProfileVM signUpVM) businessCreationFinished,
    required TResult Function(String msg, UserProfileVM signUpVM) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading(_that.signUpVM);
      case _Loaded():
        return loaded(_that.signUpVM);
      case _UserCreated():
        return userCreated(_that.signUpVM);
      case _BusinessCreationFinished():
        return businessCreationFinished(_that.signUpVM);
      case _Error():
        return error(_that.msg, _that.signUpVM);
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
    TResult? Function(UserProfileVM signUpVM)? loading,
    TResult? Function(UserProfileVM signUpVM)? loaded,
    TResult? Function(UserProfileVM signUpVM)? userCreated,
    TResult? Function(UserProfileVM signUpVM)? businessCreationFinished,
    TResult? Function(String msg, UserProfileVM signUpVM)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.signUpVM);
      case _Loaded() when loaded != null:
        return loaded(_that.signUpVM);
      case _UserCreated() when userCreated != null:
        return userCreated(_that.signUpVM);
      case _BusinessCreationFinished() when businessCreationFinished != null:
        return businessCreationFinished(_that.signUpVM);
      case _Error() when error != null:
        return error(_that.msg, _that.signUpVM);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements SignUpState {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'SignUpState.initial'));
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
    return 'SignUpState.initial()';
  }
}

/// @nodoc

class _Loading with DiagnosticableTreeMixin implements SignUpState {
  const _Loading(this.signUpVM);

  final UserProfileVM signUpVM;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.loading'))
      ..add(DiagnosticsProperty('signUpVM', signUpVM));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.signUpVM, signUpVM) ||
                other.signUpVM == signUpVM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpVM);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.loading(signUpVM: $signUpVM)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @useResult
  $Res call({UserProfileVM signUpVM});

  $UserProfileVMCopyWith<$Res> get signUpVM;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signUpVM = null,
  }) {
    return _then(_Loading(
      null == signUpVM
          ? _self.signUpVM
          : signUpVM // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<$Res> get signUpVM {
    return $UserProfileVMCopyWith<$Res>(_self.signUpVM, (value) {
      return _then(_self.copyWith(signUpVM: value));
    });
  }
}

/// @nodoc

class _Loaded with DiagnosticableTreeMixin implements SignUpState {
  const _Loaded(this.signUpVM);

  final UserProfileVM signUpVM;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.loaded'))
      ..add(DiagnosticsProperty('signUpVM', signUpVM));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.signUpVM, signUpVM) ||
                other.signUpVM == signUpVM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpVM);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.loaded(signUpVM: $signUpVM)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({UserProfileVM signUpVM});

  $UserProfileVMCopyWith<$Res> get signUpVM;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signUpVM = null,
  }) {
    return _then(_Loaded(
      null == signUpVM
          ? _self.signUpVM
          : signUpVM // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<$Res> get signUpVM {
    return $UserProfileVMCopyWith<$Res>(_self.signUpVM, (value) {
      return _then(_self.copyWith(signUpVM: value));
    });
  }
}

/// @nodoc

class _UserCreated with DiagnosticableTreeMixin implements SignUpState {
  const _UserCreated(this.signUpVM);

  final UserProfileVM signUpVM;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCreatedCopyWith<_UserCreated> get copyWith =>
      __$UserCreatedCopyWithImpl<_UserCreated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.userCreated'))
      ..add(DiagnosticsProperty('signUpVM', signUpVM));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCreated &&
            (identical(other.signUpVM, signUpVM) ||
                other.signUpVM == signUpVM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpVM);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.userCreated(signUpVM: $signUpVM)';
  }
}

/// @nodoc
abstract mixin class _$UserCreatedCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$UserCreatedCopyWith(
          _UserCreated value, $Res Function(_UserCreated) _then) =
      __$UserCreatedCopyWithImpl;
  @useResult
  $Res call({UserProfileVM signUpVM});

  $UserProfileVMCopyWith<$Res> get signUpVM;
}

/// @nodoc
class __$UserCreatedCopyWithImpl<$Res> implements _$UserCreatedCopyWith<$Res> {
  __$UserCreatedCopyWithImpl(this._self, this._then);

  final _UserCreated _self;
  final $Res Function(_UserCreated) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signUpVM = null,
  }) {
    return _then(_UserCreated(
      null == signUpVM
          ? _self.signUpVM
          : signUpVM // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<$Res> get signUpVM {
    return $UserProfileVMCopyWith<$Res>(_self.signUpVM, (value) {
      return _then(_self.copyWith(signUpVM: value));
    });
  }
}

/// @nodoc

class _BusinessCreationFinished
    with DiagnosticableTreeMixin
    implements SignUpState {
  const _BusinessCreationFinished(this.signUpVM);

  final UserProfileVM signUpVM;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessCreationFinishedCopyWith<_BusinessCreationFinished> get copyWith =>
      __$BusinessCreationFinishedCopyWithImpl<_BusinessCreationFinished>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.businessCreationFinished'))
      ..add(DiagnosticsProperty('signUpVM', signUpVM));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessCreationFinished &&
            (identical(other.signUpVM, signUpVM) ||
                other.signUpVM == signUpVM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpVM);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.businessCreationFinished(signUpVM: $signUpVM)';
  }
}

/// @nodoc
abstract mixin class _$BusinessCreationFinishedCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$BusinessCreationFinishedCopyWith(_BusinessCreationFinished value,
          $Res Function(_BusinessCreationFinished) _then) =
      __$BusinessCreationFinishedCopyWithImpl;
  @useResult
  $Res call({UserProfileVM signUpVM});

  $UserProfileVMCopyWith<$Res> get signUpVM;
}

/// @nodoc
class __$BusinessCreationFinishedCopyWithImpl<$Res>
    implements _$BusinessCreationFinishedCopyWith<$Res> {
  __$BusinessCreationFinishedCopyWithImpl(this._self, this._then);

  final _BusinessCreationFinished _self;
  final $Res Function(_BusinessCreationFinished) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signUpVM = null,
  }) {
    return _then(_BusinessCreationFinished(
      null == signUpVM
          ? _self.signUpVM
          : signUpVM // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<$Res> get signUpVM {
    return $UserProfileVMCopyWith<$Res>(_self.signUpVM, (value) {
      return _then(_self.copyWith(signUpVM: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements SignUpState {
  const _Error(this.msg, this.signUpVM);

  final String msg;
  final UserProfileVM signUpVM;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.error'))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('signUpVM', signUpVM));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.signUpVM, signUpVM) ||
                other.signUpVM == signUpVM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg, signUpVM);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.error(msg: $msg, signUpVM: $signUpVM)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String msg, UserProfileVM signUpVM});

  $UserProfileVMCopyWith<$Res> get signUpVM;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
    Object? signUpVM = null,
  }) {
    return _then(_Error(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      null == signUpVM
          ? _self.signUpVM
          : signUpVM // ignore: cast_nullable_to_non_nullable
              as UserProfileVM,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<$Res> get signUpVM {
    return $UserProfileVMCopyWith<$Res>(_self.signUpVM, (value) {
      return _then(_self.copyWith(signUpVM: value));
    });
  }
}

// dart format on
