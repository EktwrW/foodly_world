// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SmartSearchState {
  SmartSearchVM get vm => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SmartSearchVM vm)? initial,
    TResult Function(SmartSearchVM vm)? listening,
    TResult Function(SmartSearchVM vm)? recognized,
    TResult Function(SmartSearchVM vm)? searching,
    TResult Function(SmartSearchVM vm)? searchComplete,
    TResult Function(String message, SmartSearchVM vm)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Listening value)? listening,
    TResult Function(_Recognized value)? recognized,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchComplete value)? searchComplete,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartSearchStateCopyWith<SmartSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartSearchStateCopyWith<$Res> {
  factory $SmartSearchStateCopyWith(
          SmartSearchState value, $Res Function(SmartSearchState) then) =
      _$SmartSearchStateCopyWithImpl<$Res, SmartSearchState>;
  @useResult
  $Res call({SmartSearchVM vm});

  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$SmartSearchStateCopyWithImpl<$Res, $Val extends SmartSearchState>
    implements $SmartSearchStateCopyWith<$Res> {
  _$SmartSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartSearchState
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
              as SmartSearchVM,
    ) as $Val);
  }

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<$Res> get vm {
    return $SmartSearchVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SmartSearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartSearchState
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
              as SmartSearchVM,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(this.vm);

  @override
  final SmartSearchVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.initial(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.initial'))
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

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    return initial(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    return initial?.call(vm);
  }

  @override
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
    if (initial != null) {
      return initial(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
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
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SmartSearchState {
  const factory _Initial(final SmartSearchVM vm) = _$InitialImpl;

  @override
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListeningImplCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$$ListeningImplCopyWith(
          _$ListeningImpl value, $Res Function(_$ListeningImpl) then) =
      __$$ListeningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ListeningImplCopyWithImpl<$Res>
    extends _$SmartSearchStateCopyWithImpl<$Res, _$ListeningImpl>
    implements _$$ListeningImplCopyWith<$Res> {
  __$$ListeningImplCopyWithImpl(
      _$ListeningImpl _value, $Res Function(_$ListeningImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$ListeningImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }
}

/// @nodoc

class _$ListeningImpl with DiagnosticableTreeMixin implements _Listening {
  const _$ListeningImpl(this.vm);

  @override
  final SmartSearchVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.listening(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.listening'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningImplCopyWith<_$ListeningImpl> get copyWith =>
      __$$ListeningImplCopyWithImpl<_$ListeningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    return listening(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    return listening?.call(vm);
  }

  @override
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
    if (listening != null) {
      return listening(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    return listening?.call(this);
  }

  @override
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
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class _Listening implements SmartSearchState {
  const factory _Listening(final SmartSearchVM vm) = _$ListeningImpl;

  @override
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningImplCopyWith<_$ListeningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecognizedImplCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$$RecognizedImplCopyWith(
          _$RecognizedImpl value, $Res Function(_$RecognizedImpl) then) =
      __$$RecognizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$RecognizedImplCopyWithImpl<$Res>
    extends _$SmartSearchStateCopyWithImpl<$Res, _$RecognizedImpl>
    implements _$$RecognizedImplCopyWith<$Res> {
  __$$RecognizedImplCopyWithImpl(
      _$RecognizedImpl _value, $Res Function(_$RecognizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$RecognizedImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }
}

/// @nodoc

class _$RecognizedImpl with DiagnosticableTreeMixin implements _Recognized {
  const _$RecognizedImpl(this.vm);

  @override
  final SmartSearchVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.recognized(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.recognized'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecognizedImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecognizedImplCopyWith<_$RecognizedImpl> get copyWith =>
      __$$RecognizedImplCopyWithImpl<_$RecognizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    return recognized(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    return recognized?.call(vm);
  }

  @override
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
    if (recognized != null) {
      return recognized(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    return recognized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    return recognized?.call(this);
  }

  @override
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
    if (recognized != null) {
      return recognized(this);
    }
    return orElse();
  }
}

abstract class _Recognized implements SmartSearchState {
  const factory _Recognized(final SmartSearchVM vm) = _$RecognizedImpl;

  @override
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecognizedImplCopyWith<_$RecognizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchingImplCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$$SearchingImplCopyWith(
          _$SearchingImpl value, $Res Function(_$SearchingImpl) then) =
      __$$SearchingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$SearchingImplCopyWithImpl<$Res>
    extends _$SmartSearchStateCopyWithImpl<$Res, _$SearchingImpl>
    implements _$$SearchingImplCopyWith<$Res> {
  __$$SearchingImplCopyWithImpl(
      _$SearchingImpl _value, $Res Function(_$SearchingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$SearchingImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }
}

/// @nodoc

class _$SearchingImpl with DiagnosticableTreeMixin implements _Searching {
  const _$SearchingImpl(this.vm);

  @override
  final SmartSearchVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.searching(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.searching'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchingImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchingImplCopyWith<_$SearchingImpl> get copyWith =>
      __$$SearchingImplCopyWithImpl<_$SearchingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    return searching(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    return searching?.call(vm);
  }

  @override
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
    if (searching != null) {
      return searching(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    return searching?.call(this);
  }

  @override
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
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class _Searching implements SmartSearchState {
  const factory _Searching(final SmartSearchVM vm) = _$SearchingImpl;

  @override
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchingImplCopyWith<_$SearchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchCompleteImplCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$$SearchCompleteImplCopyWith(_$SearchCompleteImpl value,
          $Res Function(_$SearchCompleteImpl) then) =
      __$$SearchCompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$SearchCompleteImplCopyWithImpl<$Res>
    extends _$SmartSearchStateCopyWithImpl<$Res, _$SearchCompleteImpl>
    implements _$$SearchCompleteImplCopyWith<$Res> {
  __$$SearchCompleteImplCopyWithImpl(
      _$SearchCompleteImpl _value, $Res Function(_$SearchCompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$SearchCompleteImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SmartSearchVM,
    ));
  }
}

/// @nodoc

class _$SearchCompleteImpl
    with DiagnosticableTreeMixin
    implements _SearchComplete {
  const _$SearchCompleteImpl(this.vm);

  @override
  final SmartSearchVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.searchComplete(vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.searchComplete'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCompleteImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCompleteImplCopyWith<_$SearchCompleteImpl> get copyWith =>
      __$$SearchCompleteImplCopyWithImpl<_$SearchCompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    return searchComplete(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    return searchComplete?.call(vm);
  }

  @override
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
    if (searchComplete != null) {
      return searchComplete(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    return searchComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    return searchComplete?.call(this);
  }

  @override
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
    if (searchComplete != null) {
      return searchComplete(this);
    }
    return orElse();
  }
}

abstract class _SearchComplete implements SmartSearchState {
  const factory _SearchComplete(final SmartSearchVM vm) = _$SearchCompleteImpl;

  @override
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCompleteImplCopyWith<_$SearchCompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $SmartSearchStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, SmartSearchVM vm});

  @override
  $SmartSearchVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SmartSearchStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartSearchState
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
              as SmartSearchVM,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message, this.vm);

  @override
  final String message;
  @override
  final SmartSearchVM vm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartSearchState.error(message: $message, vm: $vm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartSearchState.error'))
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

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SmartSearchVM vm) initial,
    required TResult Function(SmartSearchVM vm) listening,
    required TResult Function(SmartSearchVM vm) recognized,
    required TResult Function(SmartSearchVM vm) searching,
    required TResult Function(SmartSearchVM vm) searchComplete,
    required TResult Function(String message, SmartSearchVM vm) error,
  }) {
    return error(message, vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SmartSearchVM vm)? initial,
    TResult? Function(SmartSearchVM vm)? listening,
    TResult? Function(SmartSearchVM vm)? recognized,
    TResult? Function(SmartSearchVM vm)? searching,
    TResult? Function(SmartSearchVM vm)? searchComplete,
    TResult? Function(String message, SmartSearchVM vm)? error,
  }) {
    return error?.call(message, vm);
  }

  @override
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
    if (error != null) {
      return error(message, vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Recognized value) recognized,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchComplete value) searchComplete,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Recognized value)? recognized,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchComplete value)? searchComplete,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
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
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SmartSearchState {
  const factory _Error(final String message, final SmartSearchVM vm) =
      _$ErrorImpl;

  String get message;
  @override
  SmartSearchVM get vm;

  /// Create a copy of SmartSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
