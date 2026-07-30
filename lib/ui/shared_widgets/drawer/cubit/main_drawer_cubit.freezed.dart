// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_drawer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainDrawerState implements DiagnosticableTreeMixin {
  MainDrawerVM get vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainDrawerStateCopyWith<MainDrawerState> get copyWith =>
      _$MainDrawerStateCopyWithImpl<MainDrawerState>(
          this as MainDrawerState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainDrawerState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $MainDrawerStateCopyWith<$Res> {
  factory $MainDrawerStateCopyWith(
          MainDrawerState value, $Res Function(MainDrawerState) _then) =
      _$MainDrawerStateCopyWithImpl;
  @useResult
  $Res call({MainDrawerVM vm});

  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$MainDrawerStateCopyWithImpl<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  _$MainDrawerStateCopyWithImpl(this._self, this._then);

  final MainDrawerState _self;
  final $Res Function(MainDrawerState) _then;

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MainDrawerState].
extension MainDrawerStatePatterns on MainDrawerState {
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_UpdatingAvatar value)? updatingAvatar,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _OpenDrawer() when openDrawer != null:
        return openDrawer(_that);
      case _UpdatingAvatar() when updatingAvatar != null:
        return updatingAvatar(_that);
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_UpdatingAvatar value) updatingAvatar,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loaded():
        return loaded(_that);
      case _OpenDrawer():
        return openDrawer(_that);
      case _UpdatingAvatar():
        return updatingAvatar(_that);
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_UpdatingAvatar value)? updatingAvatar,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _OpenDrawer() when openDrawer != null:
        return openDrawer(_that);
      case _UpdatingAvatar() when updatingAvatar != null:
        return updatingAvatar(_that);
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
    TResult Function(MainDrawerVM vm)? initial,
    TResult Function(MainDrawerVM vm)? loaded,
    TResult Function(MainDrawerVM vm)? openDrawer,
    TResult Function(MainDrawerVM vm)? updatingAvatar,
    TResult Function(String msg, MainDrawerVM vm)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _OpenDrawer() when openDrawer != null:
        return openDrawer(_that.vm);
      case _UpdatingAvatar() when updatingAvatar != null:
        return updatingAvatar(_that.vm);
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
    required TResult Function(MainDrawerVM vm) initial,
    required TResult Function(MainDrawerVM vm) loaded,
    required TResult Function(MainDrawerVM vm) openDrawer,
    required TResult Function(MainDrawerVM vm) updatingAvatar,
    required TResult Function(String msg, MainDrawerVM vm) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Loaded():
        return loaded(_that.vm);
      case _OpenDrawer():
        return openDrawer(_that.vm);
      case _UpdatingAvatar():
        return updatingAvatar(_that.vm);
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
    TResult? Function(MainDrawerVM vm)? initial,
    TResult? Function(MainDrawerVM vm)? loaded,
    TResult? Function(MainDrawerVM vm)? openDrawer,
    TResult? Function(MainDrawerVM vm)? updatingAvatar,
    TResult? Function(String msg, MainDrawerVM vm)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _OpenDrawer() when openDrawer != null:
        return openDrawer(_that.vm);
      case _UpdatingAvatar() when updatingAvatar != null:
        return updatingAvatar(_that.vm);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements MainDrawerState {
  const _Initial(this.vm);

  @override
  final MainDrawerVM vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.initial'))
      ..add(DiagnosticsProperty('vm', vm));
  }

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loaded with DiagnosticableTreeMixin implements MainDrawerState {
  const _Loaded(this.vm);

  @override
  final MainDrawerVM vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.loaded'))
      ..add(DiagnosticsProperty('vm', vm));
  }

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.loaded(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _OpenDrawer with DiagnosticableTreeMixin implements MainDrawerState {
  const _OpenDrawer(this.vm);

  @override
  final MainDrawerVM vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OpenDrawerCopyWith<_OpenDrawer> get copyWith =>
      __$OpenDrawerCopyWithImpl<_OpenDrawer>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.openDrawer'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OpenDrawer &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.openDrawer(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$OpenDrawerCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$OpenDrawerCopyWith(
          _OpenDrawer value, $Res Function(_OpenDrawer) _then) =
      __$OpenDrawerCopyWithImpl;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$OpenDrawerCopyWithImpl<$Res> implements _$OpenDrawerCopyWith<$Res> {
  __$OpenDrawerCopyWithImpl(this._self, this._then);

  final _OpenDrawer _self;
  final $Res Function(_OpenDrawer) _then;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_OpenDrawer(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MainDrawerVM,
    ));
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _UpdatingAvatar with DiagnosticableTreeMixin implements MainDrawerState {
  const _UpdatingAvatar(this.vm);

  @override
  final MainDrawerVM vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatingAvatarCopyWith<_UpdatingAvatar> get copyWith =>
      __$UpdatingAvatarCopyWithImpl<_UpdatingAvatar>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.updatingAvatar'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatingAvatar &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainDrawerState.updatingAvatar(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$UpdatingAvatarCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$UpdatingAvatarCopyWith(
          _UpdatingAvatar value, $Res Function(_UpdatingAvatar) _then) =
      __$UpdatingAvatarCopyWithImpl;
  @override
  @useResult
  $Res call({MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$UpdatingAvatarCopyWithImpl<$Res>
    implements _$UpdatingAvatarCopyWith<$Res> {
  __$UpdatingAvatarCopyWithImpl(this._self, this._then);

  final _UpdatingAvatar _self;
  final $Res Function(_UpdatingAvatar) _then;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_UpdatingAvatar(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MainDrawerVM,
    ));
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements MainDrawerState {
  const _Error(this.msg, this.vm);

  final String msg;
  @override
  final MainDrawerVM vm;

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainDrawerState.error'))
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
    return 'MainDrawerState.error(msg: $msg, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $MainDrawerStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String msg, MainDrawerVM vm});

  @override
  $MainDrawerVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of MainDrawerState
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
              as MainDrawerVM,
    ));
  }

  /// Create a copy of MainDrawerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<$Res> get vm {
    return $MainDrawerVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
