// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_import_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuImportState {
  MenuImportVM get vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuImportStateCopyWith<MenuImportState> get copyWith =>
      _$MenuImportStateCopyWithImpl<MenuImportState>(
          this as MenuImportState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuImportState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $MenuImportStateCopyWith<$Res> {
  factory $MenuImportStateCopyWith(
          MenuImportState value, $Res Function(MenuImportState) _then) =
      _$MenuImportStateCopyWithImpl;
  @useResult
  $Res call({MenuImportVM vm});

  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$MenuImportStateCopyWithImpl<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  _$MenuImportStateCopyWithImpl(this._self, this._then);

  final MenuImportState _self;
  final $Res Function(MenuImportState) _then;

  /// Create a copy of MenuImportState
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
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MenuImportState].
extension MenuImportStatePatterns on MenuImportState {
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
    TResult Function(_Picking value)? picking,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Parsing value)? parsing,
    TResult Function(_Reviewing value)? reviewing,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Picking() when picking != null:
        return picking(_that);
      case _Uploading() when uploading != null:
        return uploading(_that);
      case _Parsing() when parsing != null:
        return parsing(_that);
      case _Reviewing() when reviewing != null:
        return reviewing(_that);
      case _Confirming() when confirming != null:
        return confirming(_that);
      case _Done() when done != null:
        return done(_that);
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
    required TResult Function(_Picking value) picking,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Parsing value) parsing,
    required TResult Function(_Reviewing value) reviewing,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Picking():
        return picking(_that);
      case _Uploading():
        return uploading(_that);
      case _Parsing():
        return parsing(_that);
      case _Reviewing():
        return reviewing(_that);
      case _Confirming():
        return confirming(_that);
      case _Done():
        return done(_that);
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
    TResult? Function(_Picking value)? picking,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Parsing value)? parsing,
    TResult? Function(_Reviewing value)? reviewing,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Picking() when picking != null:
        return picking(_that);
      case _Uploading() when uploading != null:
        return uploading(_that);
      case _Parsing() when parsing != null:
        return parsing(_that);
      case _Reviewing() when reviewing != null:
        return reviewing(_that);
      case _Confirming() when confirming != null:
        return confirming(_that);
      case _Done() when done != null:
        return done(_that);
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
    TResult Function(MenuImportVM vm)? initial,
    TResult Function(MenuImportVM vm)? picking,
    TResult Function(MenuImportVM vm)? uploading,
    TResult Function(MenuImportVM vm)? parsing,
    TResult Function(MenuImportVM vm)? reviewing,
    TResult Function(MenuImportVM vm)? confirming,
    TResult Function(MenuImportVM vm)? done,
    TResult Function(String message, MenuImportVM vm)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Picking() when picking != null:
        return picking(_that.vm);
      case _Uploading() when uploading != null:
        return uploading(_that.vm);
      case _Parsing() when parsing != null:
        return parsing(_that.vm);
      case _Reviewing() when reviewing != null:
        return reviewing(_that.vm);
      case _Confirming() when confirming != null:
        return confirming(_that.vm);
      case _Done() when done != null:
        return done(_that.vm);
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
    required TResult Function(MenuImportVM vm) initial,
    required TResult Function(MenuImportVM vm) picking,
    required TResult Function(MenuImportVM vm) uploading,
    required TResult Function(MenuImportVM vm) parsing,
    required TResult Function(MenuImportVM vm) reviewing,
    required TResult Function(MenuImportVM vm) confirming,
    required TResult Function(MenuImportVM vm) done,
    required TResult Function(String message, MenuImportVM vm) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Picking():
        return picking(_that.vm);
      case _Uploading():
        return uploading(_that.vm);
      case _Parsing():
        return parsing(_that.vm);
      case _Reviewing():
        return reviewing(_that.vm);
      case _Confirming():
        return confirming(_that.vm);
      case _Done():
        return done(_that.vm);
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
    TResult? Function(MenuImportVM vm)? initial,
    TResult? Function(MenuImportVM vm)? picking,
    TResult? Function(MenuImportVM vm)? uploading,
    TResult? Function(MenuImportVM vm)? parsing,
    TResult? Function(MenuImportVM vm)? reviewing,
    TResult? Function(MenuImportVM vm)? confirming,
    TResult? Function(MenuImportVM vm)? done,
    TResult? Function(String message, MenuImportVM vm)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Picking() when picking != null:
        return picking(_that.vm);
      case _Uploading() when uploading != null:
        return uploading(_that.vm);
      case _Parsing() when parsing != null:
        return parsing(_that.vm);
      case _Reviewing() when reviewing != null:
        return reviewing(_that.vm);
      case _Confirming() when confirming != null:
        return confirming(_that.vm);
      case _Done() when done != null:
        return done(_that.vm);
      case _Error() when error != null:
        return error(_that.message, _that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements MenuImportState {
  const _Initial(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

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
  String toString() {
    return 'MenuImportState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of MenuImportState
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
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Picking implements MenuImportState {
  const _Picking(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PickingCopyWith<_Picking> get copyWith =>
      __$PickingCopyWithImpl<_Picking>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Picking &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState.picking(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$PickingCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$PickingCopyWith(_Picking value, $Res Function(_Picking) _then) =
      __$PickingCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$PickingCopyWithImpl<$Res> implements _$PickingCopyWith<$Res> {
  __$PickingCopyWithImpl(this._self, this._then);

  final _Picking _self;
  final $Res Function(_Picking) _then;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Picking(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Uploading implements MenuImportState {
  const _Uploading(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadingCopyWith<_Uploading> get copyWith =>
      __$UploadingCopyWithImpl<_Uploading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Uploading &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState.uploading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$UploadingCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$UploadingCopyWith(
          _Uploading value, $Res Function(_Uploading) _then) =
      __$UploadingCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$UploadingCopyWithImpl<$Res> implements _$UploadingCopyWith<$Res> {
  __$UploadingCopyWithImpl(this._self, this._then);

  final _Uploading _self;
  final $Res Function(_Uploading) _then;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Uploading(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Parsing implements MenuImportState {
  const _Parsing(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParsingCopyWith<_Parsing> get copyWith =>
      __$ParsingCopyWithImpl<_Parsing>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Parsing &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState.parsing(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ParsingCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$ParsingCopyWith(_Parsing value, $Res Function(_Parsing) _then) =
      __$ParsingCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ParsingCopyWithImpl<$Res> implements _$ParsingCopyWith<$Res> {
  __$ParsingCopyWithImpl(this._self, this._then);

  final _Parsing _self;
  final $Res Function(_Parsing) _then;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Parsing(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Reviewing implements MenuImportState {
  const _Reviewing(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewingCopyWith<_Reviewing> get copyWith =>
      __$ReviewingCopyWithImpl<_Reviewing>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reviewing &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState.reviewing(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ReviewingCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$ReviewingCopyWith(
          _Reviewing value, $Res Function(_Reviewing) _then) =
      __$ReviewingCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ReviewingCopyWithImpl<$Res> implements _$ReviewingCopyWith<$Res> {
  __$ReviewingCopyWithImpl(this._self, this._then);

  final _Reviewing _self;
  final $Res Function(_Reviewing) _then;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Reviewing(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Confirming implements MenuImportState {
  const _Confirming(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfirmingCopyWith<_Confirming> get copyWith =>
      __$ConfirmingCopyWithImpl<_Confirming>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Confirming &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState.confirming(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ConfirmingCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$ConfirmingCopyWith(
          _Confirming value, $Res Function(_Confirming) _then) =
      __$ConfirmingCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ConfirmingCopyWithImpl<$Res> implements _$ConfirmingCopyWith<$Res> {
  __$ConfirmingCopyWithImpl(this._self, this._then);

  final _Confirming _self;
  final $Res Function(_Confirming) _then;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Confirming(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Done implements MenuImportState {
  const _Done(this.vm);

  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DoneCopyWith<_Done> get copyWith =>
      __$DoneCopyWithImpl<_Done>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Done &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'MenuImportState.done(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$DoneCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$DoneCopyWith(_Done value, $Res Function(_Done) _then) =
      __$DoneCopyWithImpl;
  @override
  @useResult
  $Res call({MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$DoneCopyWithImpl<$Res> implements _$DoneCopyWith<$Res> {
  __$DoneCopyWithImpl(this._self, this._then);

  final _Done _self;
  final $Res Function(_Done) _then;

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Done(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error implements MenuImportState {
  const _Error(this.message, this.vm);

  final String message;
  @override
  final MenuImportVM vm;

  /// Create a copy of MenuImportState
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
            (identical(other.message, message) || other.message == message) &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, vm);

  @override
  String toString() {
    return 'MenuImportState.error(message: $message, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $MenuImportStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String message, MenuImportVM vm});

  @override
  $MenuImportVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of MenuImportState
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
              as MenuImportVM,
    ));
  }

  /// Create a copy of MenuImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<$Res> get vm {
    return $MenuImportVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
