// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_orders_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagerOrderCountsDM {
  int get pending;
  int get preparing;
  int get ready;
  int get delivered;

  /// Create a copy of ManagerOrderCountsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagerOrderCountsDMCopyWith<ManagerOrderCountsDM> get copyWith =>
      _$ManagerOrderCountsDMCopyWithImpl<ManagerOrderCountsDM>(
          this as ManagerOrderCountsDM, _$identity);

  /// Serializes this ManagerOrderCountsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagerOrderCountsDM &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.preparing, preparing) ||
                other.preparing == preparing) &&
            (identical(other.ready, ready) || other.ready == ready) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pending, preparing, ready, delivered);

  @override
  String toString() {
    return 'ManagerOrderCountsDM(pending: $pending, preparing: $preparing, ready: $ready, delivered: $delivered)';
  }
}

/// @nodoc
abstract mixin class $ManagerOrderCountsDMCopyWith<$Res> {
  factory $ManagerOrderCountsDMCopyWith(ManagerOrderCountsDM value,
          $Res Function(ManagerOrderCountsDM) _then) =
      _$ManagerOrderCountsDMCopyWithImpl;
  @useResult
  $Res call({int pending, int preparing, int ready, int delivered});
}

/// @nodoc
class _$ManagerOrderCountsDMCopyWithImpl<$Res>
    implements $ManagerOrderCountsDMCopyWith<$Res> {
  _$ManagerOrderCountsDMCopyWithImpl(this._self, this._then);

  final ManagerOrderCountsDM _self;
  final $Res Function(ManagerOrderCountsDM) _then;

  /// Create a copy of ManagerOrderCountsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pending = null,
    Object? preparing = null,
    Object? ready = null,
    Object? delivered = null,
  }) {
    return _then(_self.copyWith(
      pending: null == pending
          ? _self.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      preparing: null == preparing
          ? _self.preparing
          : preparing // ignore: cast_nullable_to_non_nullable
              as int,
      ready: null == ready
          ? _self.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as int,
      delivered: null == delivered
          ? _self.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ManagerOrderCountsDM].
extension ManagerOrderCountsDMPatterns on ManagerOrderCountsDM {
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
    TResult Function(_ManagerOrderCountsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerOrderCountsDM() when $default != null:
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
    TResult Function(_ManagerOrderCountsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrderCountsDM():
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
    TResult? Function(_ManagerOrderCountsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrderCountsDM() when $default != null:
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
    TResult Function(int pending, int preparing, int ready, int delivered)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerOrderCountsDM() when $default != null:
        return $default(
            _that.pending, _that.preparing, _that.ready, _that.delivered);
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
    TResult Function(int pending, int preparing, int ready, int delivered)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrderCountsDM():
        return $default(
            _that.pending, _that.preparing, _that.ready, _that.delivered);
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
    TResult? Function(int pending, int preparing, int ready, int delivered)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrderCountsDM() when $default != null:
        return $default(
            _that.pending, _that.preparing, _that.ready, _that.delivered);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ManagerOrderCountsDM implements ManagerOrderCountsDM {
  const _ManagerOrderCountsDM(
      {this.pending = 0,
      this.preparing = 0,
      this.ready = 0,
      this.delivered = 0});
  factory _ManagerOrderCountsDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerOrderCountsDMFromJson(json);

  @override
  @JsonKey()
  final int pending;
  @override
  @JsonKey()
  final int preparing;
  @override
  @JsonKey()
  final int ready;
  @override
  @JsonKey()
  final int delivered;

  /// Create a copy of ManagerOrderCountsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManagerOrderCountsDMCopyWith<_ManagerOrderCountsDM> get copyWith =>
      __$ManagerOrderCountsDMCopyWithImpl<_ManagerOrderCountsDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ManagerOrderCountsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagerOrderCountsDM &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.preparing, preparing) ||
                other.preparing == preparing) &&
            (identical(other.ready, ready) || other.ready == ready) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pending, preparing, ready, delivered);

  @override
  String toString() {
    return 'ManagerOrderCountsDM(pending: $pending, preparing: $preparing, ready: $ready, delivered: $delivered)';
  }
}

/// @nodoc
abstract mixin class _$ManagerOrderCountsDMCopyWith<$Res>
    implements $ManagerOrderCountsDMCopyWith<$Res> {
  factory _$ManagerOrderCountsDMCopyWith(_ManagerOrderCountsDM value,
          $Res Function(_ManagerOrderCountsDM) _then) =
      __$ManagerOrderCountsDMCopyWithImpl;
  @override
  @useResult
  $Res call({int pending, int preparing, int ready, int delivered});
}

/// @nodoc
class __$ManagerOrderCountsDMCopyWithImpl<$Res>
    implements _$ManagerOrderCountsDMCopyWith<$Res> {
  __$ManagerOrderCountsDMCopyWithImpl(this._self, this._then);

  final _ManagerOrderCountsDM _self;
  final $Res Function(_ManagerOrderCountsDM) _then;

  /// Create a copy of ManagerOrderCountsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pending = null,
    Object? preparing = null,
    Object? ready = null,
    Object? delivered = null,
  }) {
    return _then(_ManagerOrderCountsDM(
      pending: null == pending
          ? _self.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      preparing: null == preparing
          ? _self.preparing
          : preparing // ignore: cast_nullable_to_non_nullable
              as int,
      ready: null == ready
          ? _self.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as int,
      delivered: null == delivered
          ? _self.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ManagerOrdersResponseDM {
  bool get success;
  List<GroupOrderDM> get orders;
  ManagerOrderCountsDM get counts;
  ManagerOrdersMetaDM? get meta;

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagerOrdersResponseDMCopyWith<ManagerOrdersResponseDM> get copyWith =>
      _$ManagerOrdersResponseDMCopyWithImpl<ManagerOrdersResponseDM>(
          this as ManagerOrdersResponseDM, _$identity);

  /// Serializes this ManagerOrdersResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagerOrdersResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.orders, orders) &&
            (identical(other.counts, counts) || other.counts == counts) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(orders), counts, meta);

  @override
  String toString() {
    return 'ManagerOrdersResponseDM(success: $success, orders: $orders, counts: $counts, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $ManagerOrdersResponseDMCopyWith<$Res> {
  factory $ManagerOrdersResponseDMCopyWith(ManagerOrdersResponseDM value,
          $Res Function(ManagerOrdersResponseDM) _then) =
      _$ManagerOrdersResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<GroupOrderDM> orders,
      ManagerOrderCountsDM counts,
      ManagerOrdersMetaDM? meta});

  $ManagerOrderCountsDMCopyWith<$Res> get counts;
  $ManagerOrdersMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ManagerOrdersResponseDMCopyWithImpl<$Res>
    implements $ManagerOrdersResponseDMCopyWith<$Res> {
  _$ManagerOrdersResponseDMCopyWithImpl(this._self, this._then);

  final ManagerOrdersResponseDM _self;
  final $Res Function(ManagerOrdersResponseDM) _then;

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? orders = null,
    Object? counts = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _self.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderDM>,
      counts: null == counts
          ? _self.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as ManagerOrderCountsDM,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ManagerOrdersMetaDM?,
    ));
  }

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerOrderCountsDMCopyWith<$Res> get counts {
    return $ManagerOrderCountsDMCopyWith<$Res>(_self.counts, (value) {
      return _then(_self.copyWith(counts: value));
    });
  }

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerOrdersMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ManagerOrdersMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ManagerOrdersResponseDM].
extension ManagerOrdersResponseDMPatterns on ManagerOrdersResponseDM {
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
    TResult Function(_ManagerOrdersResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersResponseDM() when $default != null:
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
    TResult Function(_ManagerOrdersResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersResponseDM():
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
    TResult? Function(_ManagerOrdersResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersResponseDM() when $default != null:
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
    TResult Function(bool success, List<GroupOrderDM> orders,
            ManagerOrderCountsDM counts, ManagerOrdersMetaDM? meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersResponseDM() when $default != null:
        return $default(_that.success, _that.orders, _that.counts, _that.meta);
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
    TResult Function(bool success, List<GroupOrderDM> orders,
            ManagerOrderCountsDM counts, ManagerOrdersMetaDM? meta)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersResponseDM():
        return $default(_that.success, _that.orders, _that.counts, _that.meta);
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
    TResult? Function(bool success, List<GroupOrderDM> orders,
            ManagerOrderCountsDM counts, ManagerOrdersMetaDM? meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersResponseDM() when $default != null:
        return $default(_that.success, _that.orders, _that.counts, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ManagerOrdersResponseDM implements ManagerOrdersResponseDM {
  const _ManagerOrdersResponseDM(
      {this.success = true,
      final List<GroupOrderDM> orders = const <GroupOrderDM>[],
      this.counts = const ManagerOrderCountsDM(),
      this.meta})
      : _orders = orders;
  factory _ManagerOrdersResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerOrdersResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<GroupOrderDM> _orders;
  @override
  @JsonKey()
  List<GroupOrderDM> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final ManagerOrderCountsDM counts;
  @override
  final ManagerOrdersMetaDM? meta;

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManagerOrdersResponseDMCopyWith<_ManagerOrdersResponseDM> get copyWith =>
      __$ManagerOrdersResponseDMCopyWithImpl<_ManagerOrdersResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ManagerOrdersResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagerOrdersResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.counts, counts) || other.counts == counts) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_orders), counts, meta);

  @override
  String toString() {
    return 'ManagerOrdersResponseDM(success: $success, orders: $orders, counts: $counts, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$ManagerOrdersResponseDMCopyWith<$Res>
    implements $ManagerOrdersResponseDMCopyWith<$Res> {
  factory _$ManagerOrdersResponseDMCopyWith(_ManagerOrdersResponseDM value,
          $Res Function(_ManagerOrdersResponseDM) _then) =
      __$ManagerOrdersResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<GroupOrderDM> orders,
      ManagerOrderCountsDM counts,
      ManagerOrdersMetaDM? meta});

  @override
  $ManagerOrderCountsDMCopyWith<$Res> get counts;
  @override
  $ManagerOrdersMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$ManagerOrdersResponseDMCopyWithImpl<$Res>
    implements _$ManagerOrdersResponseDMCopyWith<$Res> {
  __$ManagerOrdersResponseDMCopyWithImpl(this._self, this._then);

  final _ManagerOrdersResponseDM _self;
  final $Res Function(_ManagerOrdersResponseDM) _then;

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? orders = null,
    Object? counts = null,
    Object? meta = freezed,
  }) {
    return _then(_ManagerOrdersResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _self._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderDM>,
      counts: null == counts
          ? _self.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as ManagerOrderCountsDM,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ManagerOrdersMetaDM?,
    ));
  }

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerOrderCountsDMCopyWith<$Res> get counts {
    return $ManagerOrderCountsDMCopyWith<$Res>(_self.counts, (value) {
      return _then(_self.copyWith(counts: value));
    });
  }

  /// Create a copy of ManagerOrdersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerOrdersMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ManagerOrdersMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$ManagerHistoryResponseDM {
  bool get success;
  List<GroupOrderDM> get orders;
  @JsonKey(name: 'has_more')
  bool get hasMore;
  @JsonKey(name: 'next_before')
  String? get nextBefore;

  /// Create a copy of ManagerHistoryResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagerHistoryResponseDMCopyWith<ManagerHistoryResponseDM> get copyWith =>
      _$ManagerHistoryResponseDMCopyWithImpl<ManagerHistoryResponseDM>(
          this as ManagerHistoryResponseDM, _$identity);

  /// Serializes this ManagerHistoryResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagerHistoryResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.orders, orders) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextBefore, nextBefore) ||
                other.nextBefore == nextBefore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(orders), hasMore, nextBefore);

  @override
  String toString() {
    return 'ManagerHistoryResponseDM(success: $success, orders: $orders, hasMore: $hasMore, nextBefore: $nextBefore)';
  }
}

/// @nodoc
abstract mixin class $ManagerHistoryResponseDMCopyWith<$Res> {
  factory $ManagerHistoryResponseDMCopyWith(ManagerHistoryResponseDM value,
          $Res Function(ManagerHistoryResponseDM) _then) =
      _$ManagerHistoryResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<GroupOrderDM> orders,
      @JsonKey(name: 'has_more') bool hasMore,
      @JsonKey(name: 'next_before') String? nextBefore});
}

/// @nodoc
class _$ManagerHistoryResponseDMCopyWithImpl<$Res>
    implements $ManagerHistoryResponseDMCopyWith<$Res> {
  _$ManagerHistoryResponseDMCopyWithImpl(this._self, this._then);

  final ManagerHistoryResponseDM _self;
  final $Res Function(ManagerHistoryResponseDM) _then;

  /// Create a copy of ManagerHistoryResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? orders = null,
    Object? hasMore = null,
    Object? nextBefore = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _self.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderDM>,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextBefore: freezed == nextBefore
          ? _self.nextBefore
          : nextBefore // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ManagerHistoryResponseDM].
extension ManagerHistoryResponseDMPatterns on ManagerHistoryResponseDM {
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
    TResult Function(_ManagerHistoryResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerHistoryResponseDM() when $default != null:
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
    TResult Function(_ManagerHistoryResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerHistoryResponseDM():
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
    TResult? Function(_ManagerHistoryResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerHistoryResponseDM() when $default != null:
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
    TResult Function(
            bool success,
            List<GroupOrderDM> orders,
            @JsonKey(name: 'has_more') bool hasMore,
            @JsonKey(name: 'next_before') String? nextBefore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerHistoryResponseDM() when $default != null:
        return $default(
            _that.success, _that.orders, _that.hasMore, _that.nextBefore);
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
    TResult Function(
            bool success,
            List<GroupOrderDM> orders,
            @JsonKey(name: 'has_more') bool hasMore,
            @JsonKey(name: 'next_before') String? nextBefore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerHistoryResponseDM():
        return $default(
            _that.success, _that.orders, _that.hasMore, _that.nextBefore);
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
    TResult? Function(
            bool success,
            List<GroupOrderDM> orders,
            @JsonKey(name: 'has_more') bool hasMore,
            @JsonKey(name: 'next_before') String? nextBefore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerHistoryResponseDM() when $default != null:
        return $default(
            _that.success, _that.orders, _that.hasMore, _that.nextBefore);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ManagerHistoryResponseDM implements ManagerHistoryResponseDM {
  const _ManagerHistoryResponseDM(
      {this.success = true,
      final List<GroupOrderDM> orders = const <GroupOrderDM>[],
      @JsonKey(name: 'has_more') this.hasMore = false,
      @JsonKey(name: 'next_before') this.nextBefore})
      : _orders = orders;
  factory _ManagerHistoryResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerHistoryResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<GroupOrderDM> _orders;
  @override
  @JsonKey()
  List<GroupOrderDM> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey(name: 'has_more')
  final bool hasMore;
  @override
  @JsonKey(name: 'next_before')
  final String? nextBefore;

  /// Create a copy of ManagerHistoryResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManagerHistoryResponseDMCopyWith<_ManagerHistoryResponseDM> get copyWith =>
      __$ManagerHistoryResponseDMCopyWithImpl<_ManagerHistoryResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ManagerHistoryResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagerHistoryResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextBefore, nextBefore) ||
                other.nextBefore == nextBefore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_orders), hasMore, nextBefore);

  @override
  String toString() {
    return 'ManagerHistoryResponseDM(success: $success, orders: $orders, hasMore: $hasMore, nextBefore: $nextBefore)';
  }
}

/// @nodoc
abstract mixin class _$ManagerHistoryResponseDMCopyWith<$Res>
    implements $ManagerHistoryResponseDMCopyWith<$Res> {
  factory _$ManagerHistoryResponseDMCopyWith(_ManagerHistoryResponseDM value,
          $Res Function(_ManagerHistoryResponseDM) _then) =
      __$ManagerHistoryResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<GroupOrderDM> orders,
      @JsonKey(name: 'has_more') bool hasMore,
      @JsonKey(name: 'next_before') String? nextBefore});
}

/// @nodoc
class __$ManagerHistoryResponseDMCopyWithImpl<$Res>
    implements _$ManagerHistoryResponseDMCopyWith<$Res> {
  __$ManagerHistoryResponseDMCopyWithImpl(this._self, this._then);

  final _ManagerHistoryResponseDM _self;
  final $Res Function(_ManagerHistoryResponseDM) _then;

  /// Create a copy of ManagerHistoryResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? orders = null,
    Object? hasMore = null,
    Object? nextBefore = freezed,
  }) {
    return _then(_ManagerHistoryResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _self._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderDM>,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextBefore: freezed == nextBefore
          ? _self.nextBefore
          : nextBefore // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PaymentModeResponseDM {
  bool get success;
  @JsonKey(name: 'group_payment_mode')
  String get groupPaymentMode;

  /// Create a copy of PaymentModeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentModeResponseDMCopyWith<PaymentModeResponseDM> get copyWith =>
      _$PaymentModeResponseDMCopyWithImpl<PaymentModeResponseDM>(
          this as PaymentModeResponseDM, _$identity);

  /// Serializes this PaymentModeResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentModeResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.groupPaymentMode, groupPaymentMode) ||
                other.groupPaymentMode == groupPaymentMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, groupPaymentMode);

  @override
  String toString() {
    return 'PaymentModeResponseDM(success: $success, groupPaymentMode: $groupPaymentMode)';
  }
}

/// @nodoc
abstract mixin class $PaymentModeResponseDMCopyWith<$Res> {
  factory $PaymentModeResponseDMCopyWith(PaymentModeResponseDM value,
          $Res Function(PaymentModeResponseDM) _then) =
      _$PaymentModeResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'group_payment_mode') String groupPaymentMode});
}

/// @nodoc
class _$PaymentModeResponseDMCopyWithImpl<$Res>
    implements $PaymentModeResponseDMCopyWith<$Res> {
  _$PaymentModeResponseDMCopyWithImpl(this._self, this._then);

  final PaymentModeResponseDM _self;
  final $Res Function(PaymentModeResponseDM) _then;

  /// Create a copy of PaymentModeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? groupPaymentMode = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      groupPaymentMode: null == groupPaymentMode
          ? _self.groupPaymentMode
          : groupPaymentMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentModeResponseDM].
extension PaymentModeResponseDMPatterns on PaymentModeResponseDM {
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
    TResult Function(_PaymentModeResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentModeResponseDM() when $default != null:
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
    TResult Function(_PaymentModeResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModeResponseDM():
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
    TResult? Function(_PaymentModeResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModeResponseDM() when $default != null:
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
    TResult Function(bool success,
            @JsonKey(name: 'group_payment_mode') String groupPaymentMode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentModeResponseDM() when $default != null:
        return $default(_that.success, _that.groupPaymentMode);
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
    TResult Function(bool success,
            @JsonKey(name: 'group_payment_mode') String groupPaymentMode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModeResponseDM():
        return $default(_that.success, _that.groupPaymentMode);
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
    TResult? Function(bool success,
            @JsonKey(name: 'group_payment_mode') String groupPaymentMode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModeResponseDM() when $default != null:
        return $default(_that.success, _that.groupPaymentMode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentModeResponseDM implements PaymentModeResponseDM {
  const _PaymentModeResponseDM(
      {this.success = true,
      @JsonKey(name: 'group_payment_mode')
      this.groupPaymentMode = 'per_round'});
  factory _PaymentModeResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PaymentModeResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey(name: 'group_payment_mode')
  final String groupPaymentMode;

  /// Create a copy of PaymentModeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentModeResponseDMCopyWith<_PaymentModeResponseDM> get copyWith =>
      __$PaymentModeResponseDMCopyWithImpl<_PaymentModeResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentModeResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentModeResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.groupPaymentMode, groupPaymentMode) ||
                other.groupPaymentMode == groupPaymentMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, groupPaymentMode);

  @override
  String toString() {
    return 'PaymentModeResponseDM(success: $success, groupPaymentMode: $groupPaymentMode)';
  }
}

/// @nodoc
abstract mixin class _$PaymentModeResponseDMCopyWith<$Res>
    implements $PaymentModeResponseDMCopyWith<$Res> {
  factory _$PaymentModeResponseDMCopyWith(_PaymentModeResponseDM value,
          $Res Function(_PaymentModeResponseDM) _then) =
      __$PaymentModeResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'group_payment_mode') String groupPaymentMode});
}

/// @nodoc
class __$PaymentModeResponseDMCopyWithImpl<$Res>
    implements _$PaymentModeResponseDMCopyWith<$Res> {
  __$PaymentModeResponseDMCopyWithImpl(this._self, this._then);

  final _PaymentModeResponseDM _self;
  final $Res Function(_PaymentModeResponseDM) _then;

  /// Create a copy of PaymentModeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? groupPaymentMode = null,
  }) {
    return _then(_PaymentModeResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      groupPaymentMode: null == groupPaymentMode
          ? _self.groupPaymentMode
          : groupPaymentMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ManagerOrdersMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  int get total;

  /// Create a copy of ManagerOrdersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagerOrdersMetaDMCopyWith<ManagerOrdersMetaDM> get copyWith =>
      _$ManagerOrdersMetaDMCopyWithImpl<ManagerOrdersMetaDM>(
          this as ManagerOrdersMetaDM, _$identity);

  /// Serializes this ManagerOrdersMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagerOrdersMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, lastPage, total);

  @override
  String toString() {
    return 'ManagerOrdersMetaDM(currentPage: $currentPage, lastPage: $lastPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class $ManagerOrdersMetaDMCopyWith<$Res> {
  factory $ManagerOrdersMetaDMCopyWith(
          ManagerOrdersMetaDM value, $Res Function(ManagerOrdersMetaDM) _then) =
      _$ManagerOrdersMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      int total});
}

/// @nodoc
class _$ManagerOrdersMetaDMCopyWithImpl<$Res>
    implements $ManagerOrdersMetaDMCopyWith<$Res> {
  _$ManagerOrdersMetaDMCopyWithImpl(this._self, this._then);

  final ManagerOrdersMetaDM _self;
  final $Res Function(ManagerOrdersMetaDM) _then;

  /// Create a copy of ManagerOrdersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ManagerOrdersMetaDM].
extension ManagerOrdersMetaDMPatterns on ManagerOrdersMetaDM {
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
    TResult Function(_ManagerOrdersMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersMetaDM() when $default != null:
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
    TResult Function(_ManagerOrdersMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersMetaDM():
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
    TResult? Function(_ManagerOrdersMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersMetaDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage, int total)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersMetaDM() when $default != null:
        return $default(_that.currentPage, _that.lastPage, _that.total);
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
    TResult Function(@JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage, int total)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersMetaDM():
        return $default(_that.currentPage, _that.lastPage, _that.total);
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
    TResult? Function(@JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage, int total)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagerOrdersMetaDM() when $default != null:
        return $default(_that.currentPage, _that.lastPage, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ManagerOrdersMetaDM implements ManagerOrdersMetaDM {
  const _ManagerOrdersMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      this.total = 0});
  factory _ManagerOrdersMetaDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerOrdersMetaDMFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey()
  final int total;

  /// Create a copy of ManagerOrdersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManagerOrdersMetaDMCopyWith<_ManagerOrdersMetaDM> get copyWith =>
      __$ManagerOrdersMetaDMCopyWithImpl<_ManagerOrdersMetaDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ManagerOrdersMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagerOrdersMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, lastPage, total);

  @override
  String toString() {
    return 'ManagerOrdersMetaDM(currentPage: $currentPage, lastPage: $lastPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$ManagerOrdersMetaDMCopyWith<$Res>
    implements $ManagerOrdersMetaDMCopyWith<$Res> {
  factory _$ManagerOrdersMetaDMCopyWith(_ManagerOrdersMetaDM value,
          $Res Function(_ManagerOrdersMetaDM) _then) =
      __$ManagerOrdersMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      int total});
}

/// @nodoc
class __$ManagerOrdersMetaDMCopyWithImpl<$Res>
    implements _$ManagerOrdersMetaDMCopyWith<$Res> {
  __$ManagerOrdersMetaDMCopyWithImpl(this._self, this._then);

  final _ManagerOrdersMetaDM _self;
  final $Res Function(_ManagerOrdersMetaDM) _then;

  /// Create a copy of ManagerOrdersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
  }) {
    return _then(_ManagerOrdersMetaDM(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
