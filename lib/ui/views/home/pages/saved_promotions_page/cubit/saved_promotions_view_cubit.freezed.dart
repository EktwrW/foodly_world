// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_promotions_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedPromotionsViewState {
  SavedPromotionsViewVM get vm;

  /// Create a copy of SavedPromotionsViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedPromotionsViewStateCopyWith<SavedPromotionsViewState> get copyWith =>
      _$SavedPromotionsViewStateCopyWithImpl<SavedPromotionsViewState>(
          this as SavedPromotionsViewState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedPromotionsViewState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'SavedPromotionsViewState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $SavedPromotionsViewStateCopyWith<$Res> {
  factory $SavedPromotionsViewStateCopyWith(SavedPromotionsViewState value,
          $Res Function(SavedPromotionsViewState) _then) =
      _$SavedPromotionsViewStateCopyWithImpl;
  @useResult
  $Res call({SavedPromotionsViewVM vm});
}

/// @nodoc
class _$SavedPromotionsViewStateCopyWithImpl<$Res>
    implements $SavedPromotionsViewStateCopyWith<$Res> {
  _$SavedPromotionsViewStateCopyWithImpl(this._self, this._then);

  final SavedPromotionsViewState _self;
  final $Res Function(SavedPromotionsViewState) _then;

  /// Create a copy of SavedPromotionsViewState
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
              as SavedPromotionsViewVM,
    ));
  }
}

/// Adds pattern-matching-related methods to [SavedPromotionsViewState].
extension SavedPromotionsViewStatePatterns on SavedPromotionsViewState {
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
    TResult Function(_ChangeView value)? changeView,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _ChangeView() when changeView != null:
        return changeView(_that);
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
    required TResult Function(_ChangeView value) changeView,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _ChangeView():
        return changeView(_that);
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
    TResult? Function(_ChangeView value)? changeView,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _ChangeView() when changeView != null:
        return changeView(_that);
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
    TResult Function(SavedPromotionsViewVM vm)? initial,
    TResult Function(SavedPromotionsViewVM vm)? changeView,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _ChangeView() when changeView != null:
        return changeView(_that.vm);
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
    required TResult Function(SavedPromotionsViewVM vm) initial,
    required TResult Function(SavedPromotionsViewVM vm) changeView,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _ChangeView():
        return changeView(_that.vm);
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
    TResult? Function(SavedPromotionsViewVM vm)? initial,
    TResult? Function(SavedPromotionsViewVM vm)? changeView,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _ChangeView() when changeView != null:
        return changeView(_that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements SavedPromotionsViewState {
  const _Initial(this.vm);

  @override
  final SavedPromotionsViewVM vm;

  /// Create a copy of SavedPromotionsViewState
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
    return 'SavedPromotionsViewState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $SavedPromotionsViewStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({SavedPromotionsViewVM vm});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of SavedPromotionsViewState
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
              as SavedPromotionsViewVM,
    ));
  }
}

/// @nodoc

class _ChangeView implements SavedPromotionsViewState {
  const _ChangeView(this.vm);

  @override
  final SavedPromotionsViewVM vm;

  /// Create a copy of SavedPromotionsViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeViewCopyWith<_ChangeView> get copyWith =>
      __$ChangeViewCopyWithImpl<_ChangeView>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeView &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString() {
    return 'SavedPromotionsViewState.changeView(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ChangeViewCopyWith<$Res>
    implements $SavedPromotionsViewStateCopyWith<$Res> {
  factory _$ChangeViewCopyWith(
          _ChangeView value, $Res Function(_ChangeView) _then) =
      __$ChangeViewCopyWithImpl;
  @override
  @useResult
  $Res call({SavedPromotionsViewVM vm});
}

/// @nodoc
class __$ChangeViewCopyWithImpl<$Res> implements _$ChangeViewCopyWith<$Res> {
  __$ChangeViewCopyWithImpl(this._self, this._then);

  final _ChangeView _self;
  final $Res Function(_ChangeView) _then;

  /// Create a copy of SavedPromotionsViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_ChangeView(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as SavedPromotionsViewVM,
    ));
  }
}

// dart format on
