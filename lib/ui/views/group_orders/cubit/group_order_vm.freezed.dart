// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_order_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupOrderVM {
  GroupOrderDM? get order;
  double get myShare;
  String? get myParticipantUuid;
  bool get isPaying;
  String? get errorMessage;

  /// Create a copy of GroupOrderVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupOrderVMCopyWith<GroupOrderVM> get copyWith =>
      _$GroupOrderVMCopyWithImpl<GroupOrderVM>(
          this as GroupOrderVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupOrderVM &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.myShare, myShare) || other.myShare == myShare) &&
            (identical(other.myParticipantUuid, myParticipantUuid) ||
                other.myParticipantUuid == myParticipantUuid) &&
            (identical(other.isPaying, isPaying) ||
                other.isPaying == isPaying) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, order, myShare, myParticipantUuid, isPaying, errorMessage);

  @override
  String toString() {
    return 'GroupOrderVM(order: $order, myShare: $myShare, myParticipantUuid: $myParticipantUuid, isPaying: $isPaying, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $GroupOrderVMCopyWith<$Res> {
  factory $GroupOrderVMCopyWith(
          GroupOrderVM value, $Res Function(GroupOrderVM) _then) =
      _$GroupOrderVMCopyWithImpl;
  @useResult
  $Res call(
      {GroupOrderDM? order,
      double myShare,
      String? myParticipantUuid,
      bool isPaying,
      String? errorMessage});

  $GroupOrderDMCopyWith<$Res>? get order;
}

/// @nodoc
class _$GroupOrderVMCopyWithImpl<$Res> implements $GroupOrderVMCopyWith<$Res> {
  _$GroupOrderVMCopyWithImpl(this._self, this._then);

  final GroupOrderVM _self;
  final $Res Function(GroupOrderVM) _then;

  /// Create a copy of GroupOrderVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? myShare = null,
    Object? myParticipantUuid = freezed,
    Object? isPaying = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as GroupOrderDM?,
      myShare: null == myShare
          ? _self.myShare
          : myShare // ignore: cast_nullable_to_non_nullable
              as double,
      myParticipantUuid: freezed == myParticipantUuid
          ? _self.myParticipantUuid
          : myParticipantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaying: null == isPaying
          ? _self.isPaying
          : isPaying // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of GroupOrderVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupOrderDMCopyWith<$Res>? get order {
    if (_self.order == null) {
      return null;
    }

    return $GroupOrderDMCopyWith<$Res>(_self.order!, (value) {
      return _then(_self.copyWith(order: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroupOrderVM].
extension GroupOrderVMPatterns on GroupOrderVM {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GroupOrderVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderVM() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_GroupOrderVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderVM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GroupOrderVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderVM() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GroupOrderDM? order, double myShare,
            String? myParticipantUuid, bool isPaying, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderVM() when $default != null:
        return $default(_that.order, _that.myShare, _that.myParticipantUuid,
            _that.isPaying, _that.errorMessage);
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
  TResult when<TResult extends Object?>(
    TResult Function(GroupOrderDM? order, double myShare,
            String? myParticipantUuid, bool isPaying, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderVM():
        return $default(_that.order, _that.myShare, _that.myParticipantUuid,
            _that.isPaying, _that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(GroupOrderDM? order, double myShare,
            String? myParticipantUuid, bool isPaying, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderVM() when $default != null:
        return $default(_that.order, _that.myShare, _that.myParticipantUuid,
            _that.isPaying, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GroupOrderVM extends GroupOrderVM {
  const _GroupOrderVM(
      {this.order,
      this.myShare = 0,
      this.myParticipantUuid,
      this.isPaying = false,
      this.errorMessage})
      : super._();

  @override
  final GroupOrderDM? order;
  @override
  @JsonKey()
  final double myShare;
  @override
  final String? myParticipantUuid;
  @override
  @JsonKey()
  final bool isPaying;
  @override
  final String? errorMessage;

  /// Create a copy of GroupOrderVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupOrderVMCopyWith<_GroupOrderVM> get copyWith =>
      __$GroupOrderVMCopyWithImpl<_GroupOrderVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupOrderVM &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.myShare, myShare) || other.myShare == myShare) &&
            (identical(other.myParticipantUuid, myParticipantUuid) ||
                other.myParticipantUuid == myParticipantUuid) &&
            (identical(other.isPaying, isPaying) ||
                other.isPaying == isPaying) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, order, myShare, myParticipantUuid, isPaying, errorMessage);

  @override
  String toString() {
    return 'GroupOrderVM(order: $order, myShare: $myShare, myParticipantUuid: $myParticipantUuid, isPaying: $isPaying, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$GroupOrderVMCopyWith<$Res>
    implements $GroupOrderVMCopyWith<$Res> {
  factory _$GroupOrderVMCopyWith(
          _GroupOrderVM value, $Res Function(_GroupOrderVM) _then) =
      __$GroupOrderVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GroupOrderDM? order,
      double myShare,
      String? myParticipantUuid,
      bool isPaying,
      String? errorMessage});

  @override
  $GroupOrderDMCopyWith<$Res>? get order;
}

/// @nodoc
class __$GroupOrderVMCopyWithImpl<$Res>
    implements _$GroupOrderVMCopyWith<$Res> {
  __$GroupOrderVMCopyWithImpl(this._self, this._then);

  final _GroupOrderVM _self;
  final $Res Function(_GroupOrderVM) _then;

  /// Create a copy of GroupOrderVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? order = freezed,
    Object? myShare = null,
    Object? myParticipantUuid = freezed,
    Object? isPaying = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_GroupOrderVM(
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as GroupOrderDM?,
      myShare: null == myShare
          ? _self.myShare
          : myShare // ignore: cast_nullable_to_non_nullable
              as double,
      myParticipantUuid: freezed == myParticipantUuid
          ? _self.myParticipantUuid
          : myParticipantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaying: null == isPaying
          ? _self.isPaying
          : isPaying // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of GroupOrderVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupOrderDMCopyWith<$Res>? get order {
    if (_self.order == null) {
      return null;
    }

    return $GroupOrderDMCopyWith<$Res>(_self.order!, (value) {
      return _then(_self.copyWith(order: value));
    });
  }
}

// dart format on
