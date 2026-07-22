// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_promotions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagePromotionsState implements DiagnosticableTreeMixin {
  ManagePromotionsVM get vm;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagePromotionsStateCopyWith<ManagePromotionsState> get copyWith =>
      _$ManagePromotionsStateCopyWithImpl<ManagePromotionsState>(
          this as ManagePromotionsState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsState'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagePromotionsState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ManagePromotionsState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $ManagePromotionsStateCopyWith<$Res> {
  factory $ManagePromotionsStateCopyWith(ManagePromotionsState value,
          $Res Function(ManagePromotionsState) _then) =
      _$ManagePromotionsStateCopyWithImpl;
  @useResult
  $Res call({ManagePromotionsVM vm});

  $ManagePromotionsVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$ManagePromotionsStateCopyWithImpl<$Res>
    implements $ManagePromotionsStateCopyWith<$Res> {
  _$ManagePromotionsStateCopyWithImpl(this._self, this._then);

  final ManagePromotionsState _self;
  final $Res Function(ManagePromotionsState) _then;

  /// Create a copy of ManagePromotionsState
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
              as ManagePromotionsVM,
    ));
  }

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<$Res> get vm {
    return $ManagePromotionsVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ManagePromotionsState].
extension ManagePromotionsStatePatterns on ManagePromotionsState {
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
    TResult Function(_Error value)? error,
    TResult Function(_AiQuotaExhausted value)? aiQuotaExhausted,
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
      case _Error() when error != null:
        return error(_that);
      case _AiQuotaExhausted() when aiQuotaExhausted != null:
        return aiQuotaExhausted(_that);
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
    required TResult Function(_Error value) error,
    required TResult Function(_AiQuotaExhausted value) aiQuotaExhausted,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
      case _AiQuotaExhausted():
        return aiQuotaExhausted(_that);
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
    TResult? Function(_Error value)? error,
    TResult? Function(_AiQuotaExhausted value)? aiQuotaExhausted,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _AiQuotaExhausted() when aiQuotaExhausted != null:
        return aiQuotaExhausted(_that);
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
    TResult Function(ManagePromotionsVM vm)? initial,
    TResult Function(ManagePromotionsVM vm)? loading,
    TResult Function(ManagePromotionsVM vm)? loaded,
    TResult Function(String message, ManagePromotionsVM vm)? error,
    TResult Function(ManagePromotionsVM vm)? aiQuotaExhausted,
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
      case _Error() when error != null:
        return error(_that.message, _that.vm);
      case _AiQuotaExhausted() when aiQuotaExhausted != null:
        return aiQuotaExhausted(_that.vm);
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
    required TResult Function(ManagePromotionsVM vm) initial,
    required TResult Function(ManagePromotionsVM vm) loading,
    required TResult Function(ManagePromotionsVM vm) loaded,
    required TResult Function(String message, ManagePromotionsVM vm) error,
    required TResult Function(ManagePromotionsVM vm) aiQuotaExhausted,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Loading():
        return loading(_that.vm);
      case _Loaded():
        return loaded(_that.vm);
      case _Error():
        return error(_that.message, _that.vm);
      case _AiQuotaExhausted():
        return aiQuotaExhausted(_that.vm);
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
    TResult? Function(ManagePromotionsVM vm)? initial,
    TResult? Function(ManagePromotionsVM vm)? loading,
    TResult? Function(ManagePromotionsVM vm)? loaded,
    TResult? Function(String message, ManagePromotionsVM vm)? error,
    TResult? Function(ManagePromotionsVM vm)? aiQuotaExhausted,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _Error() when error != null:
        return error(_that.message, _that.vm);
      case _AiQuotaExhausted() when aiQuotaExhausted != null:
        return aiQuotaExhausted(_that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements ManagePromotionsState {
  const _Initial(this.vm);

  @override
  final ManagePromotionsVM vm;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsState.initial'))
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
    return 'ManagePromotionsState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $ManagePromotionsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({ManagePromotionsVM vm});

  @override
  $ManagePromotionsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of ManagePromotionsState
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
              as ManagePromotionsVM,
    ));
  }

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<$Res> get vm {
    return $ManagePromotionsVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loading with DiagnosticableTreeMixin implements ManagePromotionsState {
  const _Loading(this.vm);

  @override
  final ManagePromotionsVM vm;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsState.loading'))
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
    return 'ManagePromotionsState.loading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $ManagePromotionsStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({ManagePromotionsVM vm});

  @override
  $ManagePromotionsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of ManagePromotionsState
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
              as ManagePromotionsVM,
    ));
  }

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<$Res> get vm {
    return $ManagePromotionsVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loaded with DiagnosticableTreeMixin implements ManagePromotionsState {
  const _Loaded(this.vm);

  @override
  final ManagePromotionsVM vm;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsState.loaded'))
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
    return 'ManagePromotionsState.loaded(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $ManagePromotionsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({ManagePromotionsVM vm});

  @override
  $ManagePromotionsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of ManagePromotionsState
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
              as ManagePromotionsVM,
    ));
  }

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<$Res> get vm {
    return $ManagePromotionsVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements ManagePromotionsState {
  const _Error(this.message, this.vm);

  final String message;
  @override
  final ManagePromotionsVM vm;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsState.error'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ManagePromotionsState.error(message: $message, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ManagePromotionsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String message, ManagePromotionsVM vm});

  @override
  $ManagePromotionsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? vm = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManagePromotionsVM,
    ));
  }

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<$Res> get vm {
    return $ManagePromotionsVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _AiQuotaExhausted
    with DiagnosticableTreeMixin
    implements ManagePromotionsState {
  const _AiQuotaExhausted(this.vm);

  @override
  final ManagePromotionsVM vm;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiQuotaExhaustedCopyWith<_AiQuotaExhausted> get copyWith =>
      __$AiQuotaExhaustedCopyWithImpl<_AiQuotaExhausted>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'ManagePromotionsState.aiQuotaExhausted'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiQuotaExhausted &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ManagePromotionsState.aiQuotaExhausted(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$AiQuotaExhaustedCopyWith<$Res>
    implements $ManagePromotionsStateCopyWith<$Res> {
  factory _$AiQuotaExhaustedCopyWith(
          _AiQuotaExhausted value, $Res Function(_AiQuotaExhausted) _then) =
      __$AiQuotaExhaustedCopyWithImpl;
  @override
  @useResult
  $Res call({ManagePromotionsVM vm});

  @override
  $ManagePromotionsVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$AiQuotaExhaustedCopyWithImpl<$Res>
    implements _$AiQuotaExhaustedCopyWith<$Res> {
  __$AiQuotaExhaustedCopyWithImpl(this._self, this._then);

  final _AiQuotaExhausted _self;
  final $Res Function(_AiQuotaExhausted) _then;

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_AiQuotaExhausted(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ManagePromotionsVM,
    ));
  }

  /// Create a copy of ManagePromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<$Res> get vm {
    return $ManagePromotionsVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
