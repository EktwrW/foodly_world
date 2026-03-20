// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactState {
  ContactVM get vm => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactVM vm) idle,
    required TResult Function(ContactVM vm) sending,
    required TResult Function(ContactVM vm) sent,
    required TResult Function(String msg, ContactVM vm) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactVM vm)? idle,
    TResult? Function(ContactVM vm)? sending,
    TResult? Function(ContactVM vm)? sent,
    TResult? Function(String msg, ContactVM vm)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactVM vm)? idle,
    TResult Function(ContactVM vm)? sending,
    TResult Function(ContactVM vm)? sent,
    TResult Function(String msg, ContactVM vm)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactStateCopyWith<ContactState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactStateCopyWith<$Res> {
  factory $ContactStateCopyWith(
          ContactState value, $Res Function(ContactState) then) =
      _$ContactStateCopyWithImpl<$Res, ContactState>;
  @useResult
  $Res call({ContactVM vm});

  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$ContactStateCopyWithImpl<$Res, $Val extends ContactState>
    implements $ContactStateCopyWith<$Res> {
  _$ContactStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactState
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
              as ContactVM,
    ) as $Val);
  }

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<$Res> get vm {
    return $ContactVMCopyWith<$Res>(_value.vm, (value) {
      return _then(_value.copyWith(vm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$IdleImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ContactVM,
    ));
  }
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl(this.vm);

  @override
  final ContactVM vm;

  @override
  String toString() {
    return 'ContactState.idle(vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      __$$IdleImplCopyWithImpl<_$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactVM vm) idle,
    required TResult Function(ContactVM vm) sending,
    required TResult Function(ContactVM vm) sent,
    required TResult Function(String msg, ContactVM vm) error,
  }) {
    return idle(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactVM vm)? idle,
    TResult? Function(ContactVM vm)? sending,
    TResult? Function(ContactVM vm)? sent,
    TResult? Function(String msg, ContactVM vm)? error,
  }) {
    return idle?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactVM vm)? idle,
    TResult Function(ContactVM vm)? sending,
    TResult Function(ContactVM vm)? sent,
    TResult Function(String msg, ContactVM vm)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ContactState {
  const factory _Idle(final ContactVM vm) = _$IdleImpl;

  @override
  ContactVM get vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendingImplCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$$SendingImplCopyWith(
          _$SendingImpl value, $Res Function(_$SendingImpl) then) =
      __$$SendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$SendingImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$SendingImpl>
    implements _$$SendingImplCopyWith<$Res> {
  __$$SendingImplCopyWithImpl(
      _$SendingImpl _value, $Res Function(_$SendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$SendingImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ContactVM,
    ));
  }
}

/// @nodoc

class _$SendingImpl implements _Sending {
  const _$SendingImpl(this.vm);

  @override
  final ContactVM vm;

  @override
  String toString() {
    return 'ContactState.sending(vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendingImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendingImplCopyWith<_$SendingImpl> get copyWith =>
      __$$SendingImplCopyWithImpl<_$SendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactVM vm) idle,
    required TResult Function(ContactVM vm) sending,
    required TResult Function(ContactVM vm) sent,
    required TResult Function(String msg, ContactVM vm) error,
  }) {
    return sending(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactVM vm)? idle,
    TResult? Function(ContactVM vm)? sending,
    TResult? Function(ContactVM vm)? sent,
    TResult? Function(String msg, ContactVM vm)? error,
  }) {
    return sending?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactVM vm)? idle,
    TResult Function(ContactVM vm)? sending,
    TResult Function(ContactVM vm)? sent,
    TResult Function(String msg, ContactVM vm)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _Sending implements ContactState {
  const factory _Sending(final ContactVM vm) = _$SendingImpl;

  @override
  ContactVM get vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendingImplCopyWith<_$SendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SentImplCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$$SentImplCopyWith(
          _$SentImpl value, $Res Function(_$SentImpl) then) =
      __$$SentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$SentImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$SentImpl>
    implements _$$SentImplCopyWith<$Res> {
  __$$SentImplCopyWithImpl(_$SentImpl _value, $Res Function(_$SentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_$SentImpl(
      null == vm
          ? _value.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ContactVM,
    ));
  }
}

/// @nodoc

class _$SentImpl implements _Sent {
  const _$SentImpl(this.vm);

  @override
  final ContactVM vm;

  @override
  String toString() {
    return 'ContactState.sent(vm: $vm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentImpl &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SentImplCopyWith<_$SentImpl> get copyWith =>
      __$$SentImplCopyWithImpl<_$SentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactVM vm) idle,
    required TResult Function(ContactVM vm) sending,
    required TResult Function(ContactVM vm) sent,
    required TResult Function(String msg, ContactVM vm) error,
  }) {
    return sent(vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactVM vm)? idle,
    TResult? Function(ContactVM vm)? sending,
    TResult? Function(ContactVM vm)? sent,
    TResult? Function(String msg, ContactVM vm)? error,
  }) {
    return sent?.call(vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactVM vm)? idle,
    TResult Function(ContactVM vm)? sending,
    TResult Function(ContactVM vm)? sent,
    TResult Function(String msg, ContactVM vm)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(vm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return sent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return sent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class _Sent implements ContactState {
  const factory _Sent(final ContactVM vm) = _$SentImpl;

  @override
  ContactVM get vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SentImplCopyWith<_$SentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg, ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ContactStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactState
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
              as ContactVM,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.msg, this.vm);

  @override
  final String msg;
  @override
  final ContactVM vm;

  @override
  String toString() {
    return 'ContactState.error(msg: $msg, vm: $vm)';
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

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ContactVM vm) idle,
    required TResult Function(ContactVM vm) sending,
    required TResult Function(ContactVM vm) sent,
    required TResult Function(String msg, ContactVM vm) error,
  }) {
    return error(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ContactVM vm)? idle,
    TResult? Function(ContactVM vm)? sending,
    TResult? Function(ContactVM vm)? sent,
    TResult? Function(String msg, ContactVM vm)? error,
  }) {
    return error?.call(msg, vm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ContactVM vm)? idle,
    TResult Function(ContactVM vm)? sending,
    TResult Function(ContactVM vm)? sent,
    TResult Function(String msg, ContactVM vm)? error,
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
    required TResult Function(_Idle value) idle,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ContactState {
  const factory _Error(final String msg, final ContactVM vm) = _$ErrorImpl;

  String get msg;
  @override
  ContactVM get vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
