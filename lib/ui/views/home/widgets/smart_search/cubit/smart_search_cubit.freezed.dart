// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SmartSearchState implements DiagnosticableTreeMixin {
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SmartSearchStateCopyWith<SmartSearchState> get copyWith =>
      _$SmartSearchStateCopyWithImpl<SmartSearchState>(
          this as SmartSearchState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SmartSearchState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $SmartSearchStateCopyWith<$Res> {
  factory $SmartSearchStateCopyWith(
          SmartSearchState value, $Res Function(SmartSearchState) _then) =
      _$SmartSearchStateCopyWithImpl;
  @useResult
  $Res call({SmartSearchVM vm});

  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$SmartSearchStateCopyWithImpl<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  _$SmartSearchStateCopyWithImpl(this._self, this._then);

  final SmartSearchState _self;
  final $Res Function(SmartSearchState) _then;

  /// Create a copy of SmartSearchState
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
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SmartSearchState].
extension SmartSearchStatePatterns on SmartSearchState {
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
    TResult Function(_Listening value)? listening,
    TResult Function(_Recognized value)? recognized,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchComplete value)? searchComplete,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Listening() when listening != null:
        return listening(_that);
      case _Recognized() when recognized != null:
        return recognized(_that);
      case _Searching() when searching != null:
        return searching(_that);
      case _SearchComplete() when searchComplete != null:
        return searchComplete(_that);
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
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Listening():
        return listening(_that);
      case _Recognized():
        return recognized(_that);
      case _Searching():
        return searching(_that);
      case _SearchComplete():
        return searchComplete(_that);
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
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Listening() when listening != null:
        return listening(_that);
      case _Recognized() when recognized != null:
        return recognized(_that);
      case _Searching() when searching != null:
        return searching(_that);
      case _SearchComplete() when searchComplete != null:
        return searchComplete(_that);
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
    TResult Function(SmartSearchVM vm)? initial,
    TResult Function(SmartSearchVM vm)? listening,
    TResult Function(SmartSearchVM vm)? recognized,
    TResult Function(SmartSearchVM vm)? searching,
    TResult Function(SmartSearchVM vm)? searchComplete,
    TResult Function(String message, SmartSearchVM vm)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Listening() when listening != null:
        return listening(_that.vm);
      case _Recognized() when recognized != null:
        return recognized(_that.vm);
      case _Searching() when searching != null:
        return searching(_that.vm);
      case _SearchComplete() when searchComplete != null:
        return searchComplete(_that.vm);
      case _Error() when error != null:
        return error(_that.message, _that.vm);
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
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Listening():
        return listening(_that.vm);
      case _Recognized():
        return recognized(_that.vm);
      case _Searching():
        return searching(_that.vm);
      case _SearchComplete():
        return searchComplete(_that.vm);
      case _Error():
        return error(_that.message, _that.vm);
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
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Listening() when listening != null:
        return listening(_that.vm);
      case _Recognized() when recognized != null:
        return recognized(_that.vm);
      case _Searching() when searching != null:
        return searching(_that.vm);
      case _SearchComplete() when searchComplete != null:
        return searchComplete(_that.vm);
      case _Error() when error != null:
        return error(_that.message, _that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements SmartSearchState {
  const _Initial(this.vm);

  @override
  final SmartSearchVM vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.initial'))
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
    return 'SmartSearchState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of SmartSearchState
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
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Listening with DiagnosticableTreeMixin implements SmartSearchState {
  const _Listening(this.vm);

  @override
  final SmartSearchVM vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListeningCopyWith<_Listening> get copyWith =>
      __$ListeningCopyWithImpl<_Listening>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.listening'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Listening &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.listening(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ListeningCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$ListeningCopyWith(
          _Listening value, $Res Function(_Listening) _then) =
      __$ListeningCopyWithImpl;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ListeningCopyWithImpl<$Res> implements _$ListeningCopyWith<$Res> {
  __$ListeningCopyWithImpl(this._self, this._then);

  final _Listening _self;
  final $Res Function(_Listening) _then;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Listening(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Recognized with DiagnosticableTreeMixin implements SmartSearchState {
  const _Recognized(this.vm);

  @override
  final SmartSearchVM vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecognizedCopyWith<_Recognized> get copyWith =>
      __$RecognizedCopyWithImpl<_Recognized>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.recognized'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recognized &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.recognized(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$RecognizedCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$RecognizedCopyWith(
          _Recognized value, $Res Function(_Recognized) _then) =
      __$RecognizedCopyWithImpl;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$RecognizedCopyWithImpl<$Res> implements _$RecognizedCopyWith<$Res> {
  __$RecognizedCopyWithImpl(this._self, this._then);

  final _Recognized _self;
  final $Res Function(_Recognized) _then;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Recognized(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Searching with DiagnosticableTreeMixin implements SmartSearchState {
  const _Searching(this.vm);

  @override
  final SmartSearchVM vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchingCopyWith<_Searching> get copyWith =>
      __$SearchingCopyWithImpl<_Searching>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.searching'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Searching &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.searching(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$SearchingCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$SearchingCopyWith(
          _Searching value, $Res Function(_Searching) _then) =
      __$SearchingCopyWithImpl;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SearchingCopyWithImpl<$Res> implements _$SearchingCopyWith<$Res> {
  __$SearchingCopyWithImpl(this._self, this._then);

  final _Searching _self;
  final $Res Function(_Searching) _then;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Searching(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _SearchComplete with DiagnosticableTreeMixin implements SmartSearchState {
  const _SearchComplete(this.vm);

  @override
  final SmartSearchVM vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCompleteCopyWith<_SearchComplete> get copyWith =>
      __$SearchCompleteCopyWithImpl<_SearchComplete>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.searchComplete'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchComplete &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.searchComplete(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$SearchCompleteCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$SearchCompleteCopyWith(
          _SearchComplete value, $Res Function(_SearchComplete) _then) =
      __$SearchCompleteCopyWithImpl;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SearchCompleteCopyWithImpl<$Res>
    implements _$SearchCompleteCopyWith<$Res> {
  __$SearchCompleteCopyWithImpl(this._self, this._then);

  final _SearchComplete _self;
  final $Res Function(_SearchComplete) _then;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_SearchComplete(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements SmartSearchState {
  const _Error(this.message, this.vm);

  final String message;
  @override
  final SmartSearchVM vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.error'))
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
    return 'SmartSearchState.error(message: $message, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String message, SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of SmartSearchState
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
              as SmartSearchVM,
    ));
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
