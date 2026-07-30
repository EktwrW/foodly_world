// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactState {
  ContactVM get vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContactStateCopyWith<ContactState> get copyWith =>
      _$ContactStateCopyWithImpl<ContactState>(
          this as ContactState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContactState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'ContactState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $ContactStateCopyWith<$Res> {
  factory $ContactStateCopyWith(
          ContactState value, $Res Function(ContactState) _then) =
      _$ContactStateCopyWithImpl;
  @useResult
  $Res call({ContactVM vm});

  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$ContactStateCopyWithImpl<$Res> implements $ContactStateCopyWith<$Res> {
  _$ContactStateCopyWithImpl(this._self, this._then);

  final ContactState _self;
  final $Res Function(ContactState) _then;

  /// Create a copy of ContactState
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
              as ContactVM,
    ));
  }

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<$Res> get vm {
    return $ContactVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ContactState].
extension ContactStatePatterns on ContactState {
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
    TResult Function(_Idle value)? idle,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _Sending() when sending != null:
        return sending(_that);
      case _Sent() when sent != null:
        return sent(_that);
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
    required TResult Function(_Idle value) idle,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle(_that);
      case _Sending():
        return sending(_that);
      case _Sent():
        return sent(_that);
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
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _Sending() when sending != null:
        return sending(_that);
      case _Sent() when sent != null:
        return sent(_that);
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
    TResult Function(ContactVM vm)? idle,
    TResult Function(ContactVM vm)? sending,
    TResult Function(ContactVM vm)? sent,
    TResult Function(String msg, ContactVM vm)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that.vm);
      case _Sending() when sending != null:
        return sending(_that.vm);
      case _Sent() when sent != null:
        return sent(_that.vm);
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
    required TResult Function(ContactVM vm) idle,
    required TResult Function(ContactVM vm) sending,
    required TResult Function(ContactVM vm) sent,
    required TResult Function(String msg, ContactVM vm) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle(_that.vm);
      case _Sending():
        return sending(_that.vm);
      case _Sent():
        return sent(_that.vm);
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
    TResult? Function(ContactVM vm)? idle,
    TResult? Function(ContactVM vm)? sending,
    TResult? Function(ContactVM vm)? sent,
    TResult? Function(String msg, ContactVM vm)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that.vm);
      case _Sending() when sending != null:
        return sending(_that.vm);
      case _Sent() when sent != null:
        return sent(_that.vm);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Idle implements ContactState {
  const _Idle(this.vm);

  @override
  final ContactVM vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdleCopyWith<_Idle> get copyWith =>
      __$IdleCopyWithImpl<_Idle>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Idle &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'ContactState.idle(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$IdleCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$IdleCopyWith(_Idle value, $Res Function(_Idle) _then) =
      __$IdleCopyWithImpl;
  @override
  @useResult
  $Res call({ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$IdleCopyWithImpl<$Res> implements _$IdleCopyWith<$Res> {
  __$IdleCopyWithImpl(this._self, this._then);

  final _Idle _self;
  final $Res Function(_Idle) _then;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Idle(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ContactVM,
    ));
  }

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<$Res> get vm {
    return $ContactVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Sending implements ContactState {
  const _Sending(this.vm);

  @override
  final ContactVM vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendingCopyWith<_Sending> get copyWith =>
      __$SendingCopyWithImpl<_Sending>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sending &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'ContactState.sending(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$SendingCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$SendingCopyWith(_Sending value, $Res Function(_Sending) _then) =
      __$SendingCopyWithImpl;
  @override
  @useResult
  $Res call({ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SendingCopyWithImpl<$Res> implements _$SendingCopyWith<$Res> {
  __$SendingCopyWithImpl(this._self, this._then);

  final _Sending _self;
  final $Res Function(_Sending) _then;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Sending(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ContactVM,
    ));
  }

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<$Res> get vm {
    return $ContactVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Sent implements ContactState {
  const _Sent(this.vm);

  @override
  final ContactVM vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SentCopyWith<_Sent> get copyWith =>
      __$SentCopyWithImpl<_Sent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sent &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'ContactState.sent(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$SentCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$SentCopyWith(_Sent value, $Res Function(_Sent) _then) =
      __$SentCopyWithImpl;
  @override
  @useResult
  $Res call({ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$SentCopyWithImpl<$Res> implements _$SentCopyWith<$Res> {
  __$SentCopyWithImpl(this._self, this._then);

  final _Sent _self;
  final $Res Function(_Sent) _then;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Sent(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as ContactVM,
    ));
  }

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<$Res> get vm {
    return $ContactVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error implements ContactState {
  const _Error(this.msg, this.vm);

  final String msg;
  @override
  final ContactVM vm;

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

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
  String toString() {
    return 'ContactState.error(msg: $msg, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ContactStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String msg, ContactVM vm});

  @override
  $ContactVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ContactState
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
              as ContactVM,
    ));
  }

  /// Create a copy of ContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<$Res> get vm {
    return $ContactVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
