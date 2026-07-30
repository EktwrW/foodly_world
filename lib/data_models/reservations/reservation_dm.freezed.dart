// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationsResponseDM {
  List<ReservationDM> get reservations;
  ReservationsMetaDM? get meta;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationsResponseDMCopyWith<ReservationsResponseDM> get copyWith =>
      _$ReservationsResponseDMCopyWithImpl<ReservationsResponseDM>(
          this as ReservationsResponseDM, _$identity);

  /// Serializes this ReservationsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationsResponseDM &&
            const DeepCollectionEquality()
                .equals(other.reservations, reservations) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(reservations), meta);

  @override
  String toString() {
    return 'ReservationsResponseDM(reservations: $reservations, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $ReservationsResponseDMCopyWith<$Res> {
  factory $ReservationsResponseDMCopyWith(ReservationsResponseDM value,
          $Res Function(ReservationsResponseDM) _then) =
      _$ReservationsResponseDMCopyWithImpl;
  @useResult
  $Res call({List<ReservationDM> reservations, ReservationsMetaDM? meta});

  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ReservationsResponseDMCopyWithImpl<$Res>
    implements $ReservationsResponseDMCopyWith<$Res> {
  _$ReservationsResponseDMCopyWithImpl(this._self, this._then);

  final ReservationsResponseDM _self;
  final $Res Function(ReservationsResponseDM) _then;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      reservations: null == reservations
          ? _self.reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
    ));
  }

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ReservationsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReservationsResponseDM].
extension ReservationsResponseDMPatterns on ReservationsResponseDM {
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
    TResult Function(_ReservationsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationsResponseDM() when $default != null:
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
    TResult Function(_ReservationsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsResponseDM():
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
    TResult? Function(_ReservationsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsResponseDM() when $default != null:
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
            List<ReservationDM> reservations, ReservationsMetaDM? meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationsResponseDM() when $default != null:
        return $default(_that.reservations, _that.meta);
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
    TResult Function(List<ReservationDM> reservations, ReservationsMetaDM? meta)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsResponseDM():
        return $default(_that.reservations, _that.meta);
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
            List<ReservationDM> reservations, ReservationsMetaDM? meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsResponseDM() when $default != null:
        return $default(_that.reservations, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationsResponseDM implements ReservationsResponseDM {
  const _ReservationsResponseDM(
      {final List<ReservationDM> reservations = const [], this.meta})
      : _reservations = reservations;
  factory _ReservationsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationsResponseDMFromJson(json);

  final List<ReservationDM> _reservations;
  @override
  @JsonKey()
  List<ReservationDM> get reservations {
    if (_reservations is EqualUnmodifiableListView) return _reservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservations);
  }

  @override
  final ReservationsMetaDM? meta;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationsResponseDMCopyWith<_ReservationsResponseDM> get copyWith =>
      __$ReservationsResponseDMCopyWithImpl<_ReservationsResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationsResponseDM &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reservations), meta);

  @override
  String toString() {
    return 'ReservationsResponseDM(reservations: $reservations, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$ReservationsResponseDMCopyWith<$Res>
    implements $ReservationsResponseDMCopyWith<$Res> {
  factory _$ReservationsResponseDMCopyWith(_ReservationsResponseDM value,
          $Res Function(_ReservationsResponseDM) _then) =
      __$ReservationsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<ReservationDM> reservations, ReservationsMetaDM? meta});

  @override
  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$ReservationsResponseDMCopyWithImpl<$Res>
    implements _$ReservationsResponseDMCopyWith<$Res> {
  __$ReservationsResponseDMCopyWithImpl(this._self, this._then);

  final _ReservationsResponseDM _self;
  final $Res Function(_ReservationsResponseDM) _then;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
  }) {
    return _then(_ReservationsResponseDM(
      reservations: null == reservations
          ? _self._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
    ));
  }

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ReservationsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$ReservationsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get total;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationsMetaDMCopyWith<ReservationsMetaDM> get copyWith =>
      _$ReservationsMetaDMCopyWithImpl<ReservationsMetaDM>(
          this as ReservationsMetaDM, _$identity);

  /// Serializes this ReservationsMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationsMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  @override
  String toString() {
    return 'ReservationsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class $ReservationsMetaDMCopyWith<$Res> {
  factory $ReservationsMetaDMCopyWith(
          ReservationsMetaDM value, $Res Function(ReservationsMetaDM) _then) =
      _$ReservationsMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$ReservationsMetaDMCopyWithImpl<$Res>
    implements $ReservationsMetaDMCopyWith<$Res> {
  _$ReservationsMetaDMCopyWithImpl(this._self, this._then);

  final ReservationsMetaDM _self;
  final $Res Function(ReservationsMetaDM) _then;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
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
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReservationsMetaDM].
extension ReservationsMetaDMPatterns on ReservationsMetaDM {
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
    TResult Function(_ReservationsMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationsMetaDM() when $default != null:
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
    TResult Function(_ReservationsMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsMetaDM():
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
    TResult? Function(_ReservationsMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsMetaDM() when $default != null:
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationsMetaDM() when $default != null:
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsMetaDM():
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationsMetaDM() when $default != null:
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationsMetaDM implements ReservationsMetaDM {
  const _ReservationsMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});
  factory _ReservationsMetaDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationsMetaDMFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey()
  final int total;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationsMetaDMCopyWith<_ReservationsMetaDM> get copyWith =>
      __$ReservationsMetaDMCopyWithImpl<_ReservationsMetaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationsMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationsMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  @override
  String toString() {
    return 'ReservationsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$ReservationsMetaDMCopyWith<$Res>
    implements $ReservationsMetaDMCopyWith<$Res> {
  factory _$ReservationsMetaDMCopyWith(
          _ReservationsMetaDM value, $Res Function(_ReservationsMetaDM) _then) =
      __$ReservationsMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$ReservationsMetaDMCopyWithImpl<$Res>
    implements _$ReservationsMetaDMCopyWith<$Res> {
  __$ReservationsMetaDMCopyWithImpl(this._self, this._then);

  final _ReservationsMetaDM _self;
  final $Res Function(_ReservationsMetaDM) _then;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_ReservationsMetaDM(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ReservationCreateResponseDM {
  bool get success;
  String get message;
  ReservationDM? get reservation;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationCreateResponseDMCopyWith<ReservationCreateResponseDM>
      get copyWith => _$ReservationCreateResponseDMCopyWithImpl<
              ReservationCreateResponseDM>(
          this as ReservationCreateResponseDM, _$identity);

  /// Serializes this ReservationCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, reservation);

  @override
  String toString() {
    return 'ReservationCreateResponseDM(success: $success, message: $message, reservation: $reservation)';
  }
}

/// @nodoc
abstract mixin class $ReservationCreateResponseDMCopyWith<$Res> {
  factory $ReservationCreateResponseDMCopyWith(
          ReservationCreateResponseDM value,
          $Res Function(ReservationCreateResponseDM) _then) =
      _$ReservationCreateResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$ReservationCreateResponseDMCopyWithImpl<$Res>
    implements $ReservationCreateResponseDMCopyWith<$Res> {
  _$ReservationCreateResponseDMCopyWithImpl(this._self, this._then);

  final ReservationCreateResponseDM _self;
  final $Res Function(ReservationCreateResponseDM) _then;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _self.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_self.reservation!, (value) {
      return _then(_self.copyWith(reservation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReservationCreateResponseDM].
extension ReservationCreateResponseDMPatterns on ReservationCreateResponseDM {
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
    TResult Function(_ReservationCreateResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationCreateResponseDM() when $default != null:
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
    TResult Function(_ReservationCreateResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationCreateResponseDM():
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
    TResult? Function(_ReservationCreateResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationCreateResponseDM() when $default != null:
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
    TResult Function(bool success, String message, ReservationDM? reservation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationCreateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.reservation);
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
    TResult Function(bool success, String message, ReservationDM? reservation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationCreateResponseDM():
        return $default(_that.success, _that.message, _that.reservation);
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
    TResult? Function(bool success, String message, ReservationDM? reservation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationCreateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.reservation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationCreateResponseDM implements ReservationCreateResponseDM {
  const _ReservationCreateResponseDM(
      {this.success = false, this.message = '', this.reservation});
  factory _ReservationCreateResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationCreateResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReservationDM? reservation;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationCreateResponseDMCopyWith<_ReservationCreateResponseDM>
      get copyWith => __$ReservationCreateResponseDMCopyWithImpl<
          _ReservationCreateResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationCreateResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, reservation);

  @override
  String toString() {
    return 'ReservationCreateResponseDM(success: $success, message: $message, reservation: $reservation)';
  }
}

/// @nodoc
abstract mixin class _$ReservationCreateResponseDMCopyWith<$Res>
    implements $ReservationCreateResponseDMCopyWith<$Res> {
  factory _$ReservationCreateResponseDMCopyWith(
          _ReservationCreateResponseDM value,
          $Res Function(_ReservationCreateResponseDM) _then) =
      __$ReservationCreateResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  @override
  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$ReservationCreateResponseDMCopyWithImpl<$Res>
    implements _$ReservationCreateResponseDMCopyWith<$Res> {
  __$ReservationCreateResponseDMCopyWithImpl(this._self, this._then);

  final _ReservationCreateResponseDM _self;
  final $Res Function(_ReservationCreateResponseDM) _then;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_ReservationCreateResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _self.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_self.reservation!, (value) {
      return _then(_self.copyWith(reservation: value));
    });
  }
}

/// @nodoc
mixin _$ReservationActionResponseDM {
  bool get success;
  String get message;
  ReservationDM? get reservation;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationActionResponseDMCopyWith<ReservationActionResponseDM>
      get copyWith => _$ReservationActionResponseDMCopyWithImpl<
              ReservationActionResponseDM>(
          this as ReservationActionResponseDM, _$identity);

  /// Serializes this ReservationActionResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationActionResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, reservation);

  @override
  String toString() {
    return 'ReservationActionResponseDM(success: $success, message: $message, reservation: $reservation)';
  }
}

/// @nodoc
abstract mixin class $ReservationActionResponseDMCopyWith<$Res> {
  factory $ReservationActionResponseDMCopyWith(
          ReservationActionResponseDM value,
          $Res Function(ReservationActionResponseDM) _then) =
      _$ReservationActionResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$ReservationActionResponseDMCopyWithImpl<$Res>
    implements $ReservationActionResponseDMCopyWith<$Res> {
  _$ReservationActionResponseDMCopyWithImpl(this._self, this._then);

  final ReservationActionResponseDM _self;
  final $Res Function(ReservationActionResponseDM) _then;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _self.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_self.reservation!, (value) {
      return _then(_self.copyWith(reservation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReservationActionResponseDM].
extension ReservationActionResponseDMPatterns on ReservationActionResponseDM {
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
    TResult Function(_ReservationActionResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationActionResponseDM() when $default != null:
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
    TResult Function(_ReservationActionResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationActionResponseDM():
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
    TResult? Function(_ReservationActionResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationActionResponseDM() when $default != null:
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
    TResult Function(bool success, String message, ReservationDM? reservation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationActionResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.reservation);
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
    TResult Function(bool success, String message, ReservationDM? reservation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationActionResponseDM():
        return $default(_that.success, _that.message, _that.reservation);
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
    TResult? Function(bool success, String message, ReservationDM? reservation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationActionResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.reservation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationActionResponseDM implements ReservationActionResponseDM {
  const _ReservationActionResponseDM(
      {this.success = false, this.message = '', this.reservation});
  factory _ReservationActionResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationActionResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReservationDM? reservation;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationActionResponseDMCopyWith<_ReservationActionResponseDM>
      get copyWith => __$ReservationActionResponseDMCopyWithImpl<
          _ReservationActionResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationActionResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationActionResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, reservation);

  @override
  String toString() {
    return 'ReservationActionResponseDM(success: $success, message: $message, reservation: $reservation)';
  }
}

/// @nodoc
abstract mixin class _$ReservationActionResponseDMCopyWith<$Res>
    implements $ReservationActionResponseDMCopyWith<$Res> {
  factory _$ReservationActionResponseDMCopyWith(
          _ReservationActionResponseDM value,
          $Res Function(_ReservationActionResponseDM) _then) =
      __$ReservationActionResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  @override
  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$ReservationActionResponseDMCopyWithImpl<$Res>
    implements _$ReservationActionResponseDMCopyWith<$Res> {
  __$ReservationActionResponseDMCopyWithImpl(this._self, this._then);

  final _ReservationActionResponseDM _self;
  final $Res Function(_ReservationActionResponseDM) _then;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_ReservationActionResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _self.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_self.reservation!, (value) {
      return _then(_self.copyWith(reservation: value));
    });
  }
}

/// @nodoc
mixin _$ReservationShowResponseDM {
  ReservationDM? get reservation;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationShowResponseDMCopyWith<ReservationShowResponseDM> get copyWith =>
      _$ReservationShowResponseDMCopyWithImpl<ReservationShowResponseDM>(
          this as ReservationShowResponseDM, _$identity);

  /// Serializes this ReservationShowResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationShowResponseDM &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reservation);

  @override
  String toString() {
    return 'ReservationShowResponseDM(reservation: $reservation)';
  }
}

/// @nodoc
abstract mixin class $ReservationShowResponseDMCopyWith<$Res> {
  factory $ReservationShowResponseDMCopyWith(ReservationShowResponseDM value,
          $Res Function(ReservationShowResponseDM) _then) =
      _$ReservationShowResponseDMCopyWithImpl;
  @useResult
  $Res call({ReservationDM? reservation});

  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$ReservationShowResponseDMCopyWithImpl<$Res>
    implements $ReservationShowResponseDMCopyWith<$Res> {
  _$ReservationShowResponseDMCopyWithImpl(this._self, this._then);

  final ReservationShowResponseDM _self;
  final $Res Function(ReservationShowResponseDM) _then;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservation = freezed,
  }) {
    return _then(_self.copyWith(
      reservation: freezed == reservation
          ? _self.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_self.reservation!, (value) {
      return _then(_self.copyWith(reservation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReservationShowResponseDM].
extension ReservationShowResponseDMPatterns on ReservationShowResponseDM {
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
    TResult Function(_ReservationShowResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationShowResponseDM() when $default != null:
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
    TResult Function(_ReservationShowResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationShowResponseDM():
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
    TResult? Function(_ReservationShowResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationShowResponseDM() when $default != null:
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
    TResult Function(ReservationDM? reservation)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationShowResponseDM() when $default != null:
        return $default(_that.reservation);
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
    TResult Function(ReservationDM? reservation) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationShowResponseDM():
        return $default(_that.reservation);
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
    TResult? Function(ReservationDM? reservation)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationShowResponseDM() when $default != null:
        return $default(_that.reservation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationShowResponseDM implements ReservationShowResponseDM {
  const _ReservationShowResponseDM({this.reservation});
  factory _ReservationShowResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationShowResponseDMFromJson(json);

  @override
  final ReservationDM? reservation;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationShowResponseDMCopyWith<_ReservationShowResponseDM>
      get copyWith =>
          __$ReservationShowResponseDMCopyWithImpl<_ReservationShowResponseDM>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationShowResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationShowResponseDM &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reservation);

  @override
  String toString() {
    return 'ReservationShowResponseDM(reservation: $reservation)';
  }
}

/// @nodoc
abstract mixin class _$ReservationShowResponseDMCopyWith<$Res>
    implements $ReservationShowResponseDMCopyWith<$Res> {
  factory _$ReservationShowResponseDMCopyWith(_ReservationShowResponseDM value,
          $Res Function(_ReservationShowResponseDM) _then) =
      __$ReservationShowResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({ReservationDM? reservation});

  @override
  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$ReservationShowResponseDMCopyWithImpl<$Res>
    implements _$ReservationShowResponseDMCopyWith<$Res> {
  __$ReservationShowResponseDMCopyWithImpl(this._self, this._then);

  final _ReservationShowResponseDM _self;
  final $Res Function(_ReservationShowResponseDM) _then;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservation = freezed,
  }) {
    return _then(_ReservationShowResponseDM(
      reservation: freezed == reservation
          ? _self.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_self.reservation!, (value) {
      return _then(_self.copyWith(reservation: value));
    });
  }
}

/// @nodoc
mixin _$PendingReservationsCountDM {
  @JsonKey(name: 'pending_count')
  int get pendingCount;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingReservationsCountDMCopyWith<PendingReservationsCountDM>
      get copyWith =>
          _$PendingReservationsCountDMCopyWithImpl<PendingReservationsCountDM>(
              this as PendingReservationsCountDM, _$identity);

  /// Serializes this PendingReservationsCountDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingReservationsCountDM &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pendingCount);

  @override
  String toString() {
    return 'PendingReservationsCountDM(pendingCount: $pendingCount)';
  }
}

/// @nodoc
abstract mixin class $PendingReservationsCountDMCopyWith<$Res> {
  factory $PendingReservationsCountDMCopyWith(PendingReservationsCountDM value,
          $Res Function(PendingReservationsCountDM) _then) =
      _$PendingReservationsCountDMCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'pending_count') int pendingCount});
}

/// @nodoc
class _$PendingReservationsCountDMCopyWithImpl<$Res>
    implements $PendingReservationsCountDMCopyWith<$Res> {
  _$PendingReservationsCountDMCopyWithImpl(this._self, this._then);

  final PendingReservationsCountDM _self;
  final $Res Function(PendingReservationsCountDM) _then;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingCount = null,
  }) {
    return _then(_self.copyWith(
      pendingCount: null == pendingCount
          ? _self.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PendingReservationsCountDM].
extension PendingReservationsCountDMPatterns on PendingReservationsCountDM {
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
    TResult Function(_PendingReservationsCountDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PendingReservationsCountDM() when $default != null:
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
    TResult Function(_PendingReservationsCountDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingReservationsCountDM():
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
    TResult? Function(_PendingReservationsCountDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingReservationsCountDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'pending_count') int pendingCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PendingReservationsCountDM() when $default != null:
        return $default(_that.pendingCount);
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
    TResult Function(@JsonKey(name: 'pending_count') int pendingCount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingReservationsCountDM():
        return $default(_that.pendingCount);
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
    TResult? Function(@JsonKey(name: 'pending_count') int pendingCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PendingReservationsCountDM() when $default != null:
        return $default(_that.pendingCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PendingReservationsCountDM implements PendingReservationsCountDM {
  const _PendingReservationsCountDM(
      {@JsonKey(name: 'pending_count') this.pendingCount = 0});
  factory _PendingReservationsCountDM.fromJson(Map<String, dynamic> json) =>
      _$PendingReservationsCountDMFromJson(json);

  @override
  @JsonKey(name: 'pending_count')
  final int pendingCount;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PendingReservationsCountDMCopyWith<_PendingReservationsCountDM>
      get copyWith => __$PendingReservationsCountDMCopyWithImpl<
          _PendingReservationsCountDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PendingReservationsCountDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingReservationsCountDM &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pendingCount);

  @override
  String toString() {
    return 'PendingReservationsCountDM(pendingCount: $pendingCount)';
  }
}

/// @nodoc
abstract mixin class _$PendingReservationsCountDMCopyWith<$Res>
    implements $PendingReservationsCountDMCopyWith<$Res> {
  factory _$PendingReservationsCountDMCopyWith(
          _PendingReservationsCountDM value,
          $Res Function(_PendingReservationsCountDM) _then) =
      __$PendingReservationsCountDMCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pending_count') int pendingCount});
}

/// @nodoc
class __$PendingReservationsCountDMCopyWithImpl<$Res>
    implements _$PendingReservationsCountDMCopyWith<$Res> {
  __$PendingReservationsCountDMCopyWithImpl(this._self, this._then);

  final _PendingReservationsCountDM _self;
  final $Res Function(_PendingReservationsCountDM) _then;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pendingCount = null,
  }) {
    return _then(_PendingReservationsCountDM(
      pendingCount: null == pendingCount
          ? _self.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ReservationDM {
  @JsonKey(name: 'reservation_id')
  int? get reservationId;
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid;
  ReservationStatus get status;
  @JsonKey(name: 'booking_type')
  BookingType get bookingType;
  @JsonKey(name: 'reservation_date')
  DateTime? get reservationDate;
  @JsonKey(name: 'reservation_time')
  String? get reservationTime;
  @JsonKey(name: 'party_size')
  int get partySize;
  @JsonKey(name: 'special_requests')
  String? get specialRequests;
  @JsonKey(name: 'manager_notes')
  String? get managerNotes;
  @JsonKey(name: 'cancelled_by')
  String? get cancelledBy;
  @JsonKey(name: 'cancelled_at')
  DateTime? get cancelledAt;
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt;
  @JsonKey(name: 'rejected_at')
  DateTime? get rejectedAt; // Business info
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @JsonKey(name: 'business_name')
  String? get businessName;
  @JsonKey(name: 'business_photo')
  String? get businessPhoto;
  @JsonKey(name: 'business_latitude')
  double? get businessLatitude;
  @JsonKey(name: 'business_longitude')
  double? get businessLongitude;
  @JsonKey(name: 'business_address')
  String?
      get businessAddress; // Country of the business that owns the reservation. Used by the
// customer-facing reservation_card to render the quoted_amount in the
// right currency (€ / $ / ARS / Bs / etc.) instead of always assuming €.
// [unknownEnumValue: nullForUndefinedEnumValue] is the defensive pattern
// captured in feedback_defensive_json_enums.md — if the BE ever ships a
// country we don't have in [FoodlyCountries] (e.g. Brazil in Phase 3),
// the whole reservations list MUST NOT fail to deserialize. We just
// fall back to the global '$' default at the consumer site.
  @JsonKey(
      name: 'business_country',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  FoodlyCountries? get businessCountry; // User info
  @JsonKey(name: 'user_uuid')
  String? get userUuid;
  @JsonKey(name: 'user_name')
  String? get userName;
  @JsonKey(name: 'user_photo')
  String? get userPhoto;
  @JsonKey(name: 'user_email')
  String? get userEmail;
  @JsonKey(name: 'user_phone')
  String?
      get userPhone; // ISO del país del teléfono cuando `userPhone` es nacional (sin snapshot).
// Si hay snapshot, viene null porque `userPhone` ya es E.164. Se usa para
// componer el número internacional (display + botón de llamar).
  @JsonKey(name: 'user_phone_country_code')
  String?
      get userPhoneCountryCode; // Service booking fields (only present when booking_type = service)
  @JsonKey(name: 'service_package_uuid')
  String? get servicePackageUuid;
  @JsonKey(name: 'service_package_title')
  String? get servicePackageTitle;
  @JsonKey(name: 'event_address')
  String? get eventAddress;
  @JsonKey(name: 'event_city')
  String? get eventCity;
  @JsonKey(name: 'event_latitude')
  double? get eventLatitude;
  @JsonKey(name: 'event_longitude')
  double? get eventLongitude;
  @JsonKey(name: 'event_type')
  EventType? get eventType;
  @JsonKey(name: 'guest_count')
  int? get guestCount;
  @JsonKey(name: 'dietary_notes')
  String? get dietaryNotes;
  @JsonKey(name: 'budget_estimate')
  double? get budgetEstimate;
  @JsonKey(name: 'quoted_amount')
  double? get quotedAmount;
  @JsonKey(name: 'quoted_at')
  DateTime? get quotedAt;
  @JsonKey(name: 'messages_count')
  int get messagesCount; // Timestamps
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<ReservationDM> get copyWith =>
      _$ReservationDMCopyWithImpl<ReservationDM>(
          this as ReservationDM, _$identity);

  /// Serializes this ReservationDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationDM &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.reservationUuid, reservationUuid) ||
                other.reservationUuid == reservationUuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.reservationDate, reservationDate) ||
                other.reservationDate == reservationDate) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize) &&
            (identical(other.specialRequests, specialRequests) ||
                other.specialRequests == specialRequests) &&
            (identical(other.managerNotes, managerNotes) ||
                other.managerNotes == managerNotes) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessPhoto, businessPhoto) ||
                other.businessPhoto == businessPhoto) &&
            (identical(other.businessLatitude, businessLatitude) ||
                other.businessLatitude == businessLatitude) &&
            (identical(other.businessLongitude, businessLongitude) ||
                other.businessLongitude == businessLongitude) &&
            (identical(other.businessAddress, businessAddress) ||
                other.businessAddress == businessAddress) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhoto, userPhoto) ||
                other.userPhoto == userPhoto) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.userPhoneCountryCode, userPhoneCountryCode) ||
                other.userPhoneCountryCode == userPhoneCountryCode) &&
            (identical(other.servicePackageUuid, servicePackageUuid) ||
                other.servicePackageUuid == servicePackageUuid) &&
            (identical(other.servicePackageTitle, servicePackageTitle) ||
                other.servicePackageTitle == servicePackageTitle) &&
            (identical(other.eventAddress, eventAddress) ||
                other.eventAddress == eventAddress) &&
            (identical(other.eventCity, eventCity) ||
                other.eventCity == eventCity) &&
            (identical(other.eventLatitude, eventLatitude) ||
                other.eventLatitude == eventLatitude) &&
            (identical(other.eventLongitude, eventLongitude) ||
                other.eventLongitude == eventLongitude) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.dietaryNotes, dietaryNotes) ||
                other.dietaryNotes == dietaryNotes) &&
            (identical(other.budgetEstimate, budgetEstimate) ||
                other.budgetEstimate == budgetEstimate) &&
            (identical(other.quotedAmount, quotedAmount) ||
                other.quotedAmount == quotedAmount) &&
            (identical(other.quotedAt, quotedAt) ||
                other.quotedAt == quotedAt) &&
            (identical(other.messagesCount, messagesCount) ||
                other.messagesCount == messagesCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reservationId,
        reservationUuid,
        status,
        bookingType,
        reservationDate,
        reservationTime,
        partySize,
        specialRequests,
        managerNotes,
        cancelledBy,
        cancelledAt,
        confirmedAt,
        rejectedAt,
        businessUuid,
        businessName,
        businessPhoto,
        businessLatitude,
        businessLongitude,
        businessAddress,
        businessCountry,
        userUuid,
        userName,
        userPhoto,
        userEmail,
        userPhone,
        userPhoneCountryCode,
        servicePackageUuid,
        servicePackageTitle,
        eventAddress,
        eventCity,
        eventLatitude,
        eventLongitude,
        eventType,
        guestCount,
        dietaryNotes,
        budgetEstimate,
        quotedAmount,
        quotedAt,
        messagesCount,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ReservationDM(reservationId: $reservationId, reservationUuid: $reservationUuid, status: $status, bookingType: $bookingType, reservationDate: $reservationDate, reservationTime: $reservationTime, partySize: $partySize, specialRequests: $specialRequests, managerNotes: $managerNotes, cancelledBy: $cancelledBy, cancelledAt: $cancelledAt, confirmedAt: $confirmedAt, rejectedAt: $rejectedAt, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, businessLatitude: $businessLatitude, businessLongitude: $businessLongitude, businessAddress: $businessAddress, businessCountry: $businessCountry, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, userEmail: $userEmail, userPhone: $userPhone, userPhoneCountryCode: $userPhoneCountryCode, servicePackageUuid: $servicePackageUuid, servicePackageTitle: $servicePackageTitle, eventAddress: $eventAddress, eventCity: $eventCity, eventLatitude: $eventLatitude, eventLongitude: $eventLongitude, eventType: $eventType, guestCount: $guestCount, dietaryNotes: $dietaryNotes, budgetEstimate: $budgetEstimate, quotedAmount: $quotedAmount, quotedAt: $quotedAt, messagesCount: $messagesCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ReservationDMCopyWith<$Res> {
  factory $ReservationDMCopyWith(
          ReservationDM value, $Res Function(ReservationDM) _then) =
      _$ReservationDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservation_id') int? reservationId,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      ReservationStatus status,
      @JsonKey(name: 'booking_type') BookingType bookingType,
      @JsonKey(name: 'reservation_date') DateTime? reservationDate,
      @JsonKey(name: 'reservation_time') String? reservationTime,
      @JsonKey(name: 'party_size') int partySize,
      @JsonKey(name: 'special_requests') String? specialRequests,
      @JsonKey(name: 'manager_notes') String? managerNotes,
      @JsonKey(name: 'cancelled_by') String? cancelledBy,
      @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'business_latitude') double? businessLatitude,
      @JsonKey(name: 'business_longitude') double? businessLongitude,
      @JsonKey(name: 'business_address') String? businessAddress,
      @JsonKey(
          name: 'business_country',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      FoodlyCountries? businessCountry,
      @JsonKey(name: 'user_uuid') String? userUuid,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'user_email') String? userEmail,
      @JsonKey(name: 'user_phone') String? userPhone,
      @JsonKey(name: 'user_phone_country_code') String? userPhoneCountryCode,
      @JsonKey(name: 'service_package_uuid') String? servicePackageUuid,
      @JsonKey(name: 'service_package_title') String? servicePackageTitle,
      @JsonKey(name: 'event_address') String? eventAddress,
      @JsonKey(name: 'event_city') String? eventCity,
      @JsonKey(name: 'event_latitude') double? eventLatitude,
      @JsonKey(name: 'event_longitude') double? eventLongitude,
      @JsonKey(name: 'event_type') EventType? eventType,
      @JsonKey(name: 'guest_count') int? guestCount,
      @JsonKey(name: 'dietary_notes') String? dietaryNotes,
      @JsonKey(name: 'budget_estimate') double? budgetEstimate,
      @JsonKey(name: 'quoted_amount') double? quotedAmount,
      @JsonKey(name: 'quoted_at') DateTime? quotedAt,
      @JsonKey(name: 'messages_count') int messagesCount,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ReservationDMCopyWithImpl<$Res>
    implements $ReservationDMCopyWith<$Res> {
  _$ReservationDMCopyWithImpl(this._self, this._then);

  final ReservationDM _self;
  final $Res Function(ReservationDM) _then;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? reservationUuid = freezed,
    Object? status = null,
    Object? bookingType = null,
    Object? reservationDate = freezed,
    Object? reservationTime = freezed,
    Object? partySize = null,
    Object? specialRequests = freezed,
    Object? managerNotes = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? businessUuid = freezed,
    Object? businessName = freezed,
    Object? businessPhoto = freezed,
    Object? businessLatitude = freezed,
    Object? businessLongitude = freezed,
    Object? businessAddress = freezed,
    Object? businessCountry = freezed,
    Object? userUuid = freezed,
    Object? userName = freezed,
    Object? userPhoto = freezed,
    Object? userEmail = freezed,
    Object? userPhone = freezed,
    Object? userPhoneCountryCode = freezed,
    Object? servicePackageUuid = freezed,
    Object? servicePackageTitle = freezed,
    Object? eventAddress = freezed,
    Object? eventCity = freezed,
    Object? eventLatitude = freezed,
    Object? eventLongitude = freezed,
    Object? eventType = freezed,
    Object? guestCount = freezed,
    Object? dietaryNotes = freezed,
    Object? budgetEstimate = freezed,
    Object? quotedAmount = freezed,
    Object? quotedAt = freezed,
    Object? messagesCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      reservationId: freezed == reservationId
          ? _self.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationUuid: freezed == reservationUuid
          ? _self.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      bookingType: null == bookingType
          ? _self.bookingType
          : bookingType // ignore: cast_nullable_to_non_nullable
              as BookingType,
      reservationDate: freezed == reservationDate
          ? _self.reservationDate
          : reservationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _self.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      partySize: null == partySize
          ? _self.partySize
          : partySize // ignore: cast_nullable_to_non_nullable
              as int,
      specialRequests: freezed == specialRequests
          ? _self.specialRequests
          : specialRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      managerNotes: freezed == managerNotes
          ? _self.managerNotes
          : managerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledBy: freezed == cancelledBy
          ? _self.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _self.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _self.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _self.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _self.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLatitude: freezed == businessLatitude
          ? _self.businessLatitude
          : businessLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessLongitude: freezed == businessLongitude
          ? _self.businessLongitude
          : businessLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessAddress: freezed == businessAddress
          ? _self.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      userUuid: freezed == userUuid
          ? _self.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _self.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _self.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoneCountryCode: freezed == userPhoneCountryCode
          ? _self.userPhoneCountryCode
          : userPhoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageUuid: freezed == servicePackageUuid
          ? _self.servicePackageUuid
          : servicePackageUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageTitle: freezed == servicePackageTitle
          ? _self.servicePackageTitle
          : servicePackageTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      eventAddress: freezed == eventAddress
          ? _self.eventAddress
          : eventAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCity: freezed == eventCity
          ? _self.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String?,
      eventLatitude: freezed == eventLatitude
          ? _self.eventLatitude
          : eventLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      eventLongitude: freezed == eventLongitude
          ? _self.eventLongitude
          : eventLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      eventType: freezed == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as EventType?,
      guestCount: freezed == guestCount
          ? _self.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dietaryNotes: freezed == dietaryNotes
          ? _self.dietaryNotes
          : dietaryNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetEstimate: freezed == budgetEstimate
          ? _self.budgetEstimate
          : budgetEstimate // ignore: cast_nullable_to_non_nullable
              as double?,
      quotedAmount: freezed == quotedAmount
          ? _self.quotedAmount
          : quotedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      quotedAt: freezed == quotedAt
          ? _self.quotedAt
          : quotedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messagesCount: null == messagesCount
          ? _self.messagesCount
          : messagesCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReservationDM].
extension ReservationDMPatterns on ReservationDM {
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
    TResult Function(_ReservationDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationDM() when $default != null:
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
    TResult Function(_ReservationDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationDM():
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
    TResult? Function(_ReservationDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationDM() when $default != null:
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
            @JsonKey(name: 'reservation_id') int? reservationId,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            ReservationStatus status,
            @JsonKey(name: 'booking_type') BookingType bookingType,
            @JsonKey(name: 'reservation_date') DateTime? reservationDate,
            @JsonKey(name: 'reservation_time') String? reservationTime,
            @JsonKey(name: 'party_size') int partySize,
            @JsonKey(name: 'special_requests') String? specialRequests,
            @JsonKey(name: 'manager_notes') String? managerNotes,
            @JsonKey(name: 'cancelled_by') String? cancelledBy,
            @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
            @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
            @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'business_photo') String? businessPhoto,
            @JsonKey(name: 'business_latitude') double? businessLatitude,
            @JsonKey(name: 'business_longitude') double? businessLongitude,
            @JsonKey(name: 'business_address') String? businessAddress,
            @JsonKey(
                name: 'business_country',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            FoodlyCountries? businessCountry,
            @JsonKey(name: 'user_uuid') String? userUuid,
            @JsonKey(name: 'user_name') String? userName,
            @JsonKey(name: 'user_photo') String? userPhoto,
            @JsonKey(name: 'user_email') String? userEmail,
            @JsonKey(name: 'user_phone') String? userPhone,
            @JsonKey(name: 'user_phone_country_code')
            String? userPhoneCountryCode,
            @JsonKey(name: 'service_package_uuid') String? servicePackageUuid,
            @JsonKey(name: 'service_package_title') String? servicePackageTitle,
            @JsonKey(name: 'event_address') String? eventAddress,
            @JsonKey(name: 'event_city') String? eventCity,
            @JsonKey(name: 'event_latitude') double? eventLatitude,
            @JsonKey(name: 'event_longitude') double? eventLongitude,
            @JsonKey(name: 'event_type') EventType? eventType,
            @JsonKey(name: 'guest_count') int? guestCount,
            @JsonKey(name: 'dietary_notes') String? dietaryNotes,
            @JsonKey(name: 'budget_estimate') double? budgetEstimate,
            @JsonKey(name: 'quoted_amount') double? quotedAmount,
            @JsonKey(name: 'quoted_at') DateTime? quotedAt,
            @JsonKey(name: 'messages_count') int messagesCount,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationDM() when $default != null:
        return $default(
            _that.reservationId,
            _that.reservationUuid,
            _that.status,
            _that.bookingType,
            _that.reservationDate,
            _that.reservationTime,
            _that.partySize,
            _that.specialRequests,
            _that.managerNotes,
            _that.cancelledBy,
            _that.cancelledAt,
            _that.confirmedAt,
            _that.rejectedAt,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.businessLatitude,
            _that.businessLongitude,
            _that.businessAddress,
            _that.businessCountry,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.userEmail,
            _that.userPhone,
            _that.userPhoneCountryCode,
            _that.servicePackageUuid,
            _that.servicePackageTitle,
            _that.eventAddress,
            _that.eventCity,
            _that.eventLatitude,
            _that.eventLongitude,
            _that.eventType,
            _that.guestCount,
            _that.dietaryNotes,
            _that.budgetEstimate,
            _that.quotedAmount,
            _that.quotedAt,
            _that.messagesCount,
            _that.createdAt,
            _that.updatedAt);
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
            @JsonKey(name: 'reservation_id') int? reservationId,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            ReservationStatus status,
            @JsonKey(name: 'booking_type') BookingType bookingType,
            @JsonKey(name: 'reservation_date') DateTime? reservationDate,
            @JsonKey(name: 'reservation_time') String? reservationTime,
            @JsonKey(name: 'party_size') int partySize,
            @JsonKey(name: 'special_requests') String? specialRequests,
            @JsonKey(name: 'manager_notes') String? managerNotes,
            @JsonKey(name: 'cancelled_by') String? cancelledBy,
            @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
            @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
            @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'business_photo') String? businessPhoto,
            @JsonKey(name: 'business_latitude') double? businessLatitude,
            @JsonKey(name: 'business_longitude') double? businessLongitude,
            @JsonKey(name: 'business_address') String? businessAddress,
            @JsonKey(
                name: 'business_country',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            FoodlyCountries? businessCountry,
            @JsonKey(name: 'user_uuid') String? userUuid,
            @JsonKey(name: 'user_name') String? userName,
            @JsonKey(name: 'user_photo') String? userPhoto,
            @JsonKey(name: 'user_email') String? userEmail,
            @JsonKey(name: 'user_phone') String? userPhone,
            @JsonKey(name: 'user_phone_country_code')
            String? userPhoneCountryCode,
            @JsonKey(name: 'service_package_uuid') String? servicePackageUuid,
            @JsonKey(name: 'service_package_title') String? servicePackageTitle,
            @JsonKey(name: 'event_address') String? eventAddress,
            @JsonKey(name: 'event_city') String? eventCity,
            @JsonKey(name: 'event_latitude') double? eventLatitude,
            @JsonKey(name: 'event_longitude') double? eventLongitude,
            @JsonKey(name: 'event_type') EventType? eventType,
            @JsonKey(name: 'guest_count') int? guestCount,
            @JsonKey(name: 'dietary_notes') String? dietaryNotes,
            @JsonKey(name: 'budget_estimate') double? budgetEstimate,
            @JsonKey(name: 'quoted_amount') double? quotedAmount,
            @JsonKey(name: 'quoted_at') DateTime? quotedAt,
            @JsonKey(name: 'messages_count') int messagesCount,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationDM():
        return $default(
            _that.reservationId,
            _that.reservationUuid,
            _that.status,
            _that.bookingType,
            _that.reservationDate,
            _that.reservationTime,
            _that.partySize,
            _that.specialRequests,
            _that.managerNotes,
            _that.cancelledBy,
            _that.cancelledAt,
            _that.confirmedAt,
            _that.rejectedAt,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.businessLatitude,
            _that.businessLongitude,
            _that.businessAddress,
            _that.businessCountry,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.userEmail,
            _that.userPhone,
            _that.userPhoneCountryCode,
            _that.servicePackageUuid,
            _that.servicePackageTitle,
            _that.eventAddress,
            _that.eventCity,
            _that.eventLatitude,
            _that.eventLongitude,
            _that.eventType,
            _that.guestCount,
            _that.dietaryNotes,
            _that.budgetEstimate,
            _that.quotedAmount,
            _that.quotedAt,
            _that.messagesCount,
            _that.createdAt,
            _that.updatedAt);
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
            @JsonKey(name: 'reservation_id') int? reservationId,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            ReservationStatus status,
            @JsonKey(name: 'booking_type') BookingType bookingType,
            @JsonKey(name: 'reservation_date') DateTime? reservationDate,
            @JsonKey(name: 'reservation_time') String? reservationTime,
            @JsonKey(name: 'party_size') int partySize,
            @JsonKey(name: 'special_requests') String? specialRequests,
            @JsonKey(name: 'manager_notes') String? managerNotes,
            @JsonKey(name: 'cancelled_by') String? cancelledBy,
            @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
            @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
            @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'business_photo') String? businessPhoto,
            @JsonKey(name: 'business_latitude') double? businessLatitude,
            @JsonKey(name: 'business_longitude') double? businessLongitude,
            @JsonKey(name: 'business_address') String? businessAddress,
            @JsonKey(
                name: 'business_country',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            FoodlyCountries? businessCountry,
            @JsonKey(name: 'user_uuid') String? userUuid,
            @JsonKey(name: 'user_name') String? userName,
            @JsonKey(name: 'user_photo') String? userPhoto,
            @JsonKey(name: 'user_email') String? userEmail,
            @JsonKey(name: 'user_phone') String? userPhone,
            @JsonKey(name: 'user_phone_country_code')
            String? userPhoneCountryCode,
            @JsonKey(name: 'service_package_uuid') String? servicePackageUuid,
            @JsonKey(name: 'service_package_title') String? servicePackageTitle,
            @JsonKey(name: 'event_address') String? eventAddress,
            @JsonKey(name: 'event_city') String? eventCity,
            @JsonKey(name: 'event_latitude') double? eventLatitude,
            @JsonKey(name: 'event_longitude') double? eventLongitude,
            @JsonKey(name: 'event_type') EventType? eventType,
            @JsonKey(name: 'guest_count') int? guestCount,
            @JsonKey(name: 'dietary_notes') String? dietaryNotes,
            @JsonKey(name: 'budget_estimate') double? budgetEstimate,
            @JsonKey(name: 'quoted_amount') double? quotedAmount,
            @JsonKey(name: 'quoted_at') DateTime? quotedAt,
            @JsonKey(name: 'messages_count') int messagesCount,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationDM() when $default != null:
        return $default(
            _that.reservationId,
            _that.reservationUuid,
            _that.status,
            _that.bookingType,
            _that.reservationDate,
            _that.reservationTime,
            _that.partySize,
            _that.specialRequests,
            _that.managerNotes,
            _that.cancelledBy,
            _that.cancelledAt,
            _that.confirmedAt,
            _that.rejectedAt,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.businessLatitude,
            _that.businessLongitude,
            _that.businessAddress,
            _that.businessCountry,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.userEmail,
            _that.userPhone,
            _that.userPhoneCountryCode,
            _that.servicePackageUuid,
            _that.servicePackageTitle,
            _that.eventAddress,
            _that.eventCity,
            _that.eventLatitude,
            _that.eventLongitude,
            _that.eventType,
            _that.guestCount,
            _that.dietaryNotes,
            _that.budgetEstimate,
            _that.quotedAmount,
            _that.quotedAt,
            _that.messagesCount,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationDM extends ReservationDM {
  const _ReservationDM(
      {@JsonKey(name: 'reservation_id') this.reservationId,
      @JsonKey(name: 'reservation_uuid') this.reservationUuid,
      this.status = ReservationStatus.pending,
      @JsonKey(name: 'booking_type') this.bookingType = BookingType.table,
      @JsonKey(name: 'reservation_date') this.reservationDate,
      @JsonKey(name: 'reservation_time') this.reservationTime,
      @JsonKey(name: 'party_size') this.partySize = 1,
      @JsonKey(name: 'special_requests') this.specialRequests,
      @JsonKey(name: 'manager_notes') this.managerNotes,
      @JsonKey(name: 'cancelled_by') this.cancelledBy,
      @JsonKey(name: 'cancelled_at') this.cancelledAt,
      @JsonKey(name: 'confirmed_at') this.confirmedAt,
      @JsonKey(name: 'rejected_at') this.rejectedAt,
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_name') this.businessName,
      @JsonKey(name: 'business_photo') this.businessPhoto,
      @JsonKey(name: 'business_latitude') this.businessLatitude,
      @JsonKey(name: 'business_longitude') this.businessLongitude,
      @JsonKey(name: 'business_address') this.businessAddress,
      @JsonKey(
          name: 'business_country',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.businessCountry,
      @JsonKey(name: 'user_uuid') this.userUuid,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_photo') this.userPhoto,
      @JsonKey(name: 'user_email') this.userEmail,
      @JsonKey(name: 'user_phone') this.userPhone,
      @JsonKey(name: 'user_phone_country_code') this.userPhoneCountryCode,
      @JsonKey(name: 'service_package_uuid') this.servicePackageUuid,
      @JsonKey(name: 'service_package_title') this.servicePackageTitle,
      @JsonKey(name: 'event_address') this.eventAddress,
      @JsonKey(name: 'event_city') this.eventCity,
      @JsonKey(name: 'event_latitude') this.eventLatitude,
      @JsonKey(name: 'event_longitude') this.eventLongitude,
      @JsonKey(name: 'event_type') this.eventType,
      @JsonKey(name: 'guest_count') this.guestCount,
      @JsonKey(name: 'dietary_notes') this.dietaryNotes,
      @JsonKey(name: 'budget_estimate') this.budgetEstimate,
      @JsonKey(name: 'quoted_amount') this.quotedAmount,
      @JsonKey(name: 'quoted_at') this.quotedAt,
      @JsonKey(name: 'messages_count') this.messagesCount = 0,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();
  factory _ReservationDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationDMFromJson(json);

  @override
  @JsonKey(name: 'reservation_id')
  final int? reservationId;
  @override
  @JsonKey(name: 'reservation_uuid')
  final String? reservationUuid;
  @override
  @JsonKey()
  final ReservationStatus status;
  @override
  @JsonKey(name: 'booking_type')
  final BookingType bookingType;
  @override
  @JsonKey(name: 'reservation_date')
  final DateTime? reservationDate;
  @override
  @JsonKey(name: 'reservation_time')
  final String? reservationTime;
  @override
  @JsonKey(name: 'party_size')
  final int partySize;
  @override
  @JsonKey(name: 'special_requests')
  final String? specialRequests;
  @override
  @JsonKey(name: 'manager_notes')
  final String? managerNotes;
  @override
  @JsonKey(name: 'cancelled_by')
  final String? cancelledBy;
  @override
  @JsonKey(name: 'cancelled_at')
  final DateTime? cancelledAt;
  @override
  @JsonKey(name: 'confirmed_at')
  final DateTime? confirmedAt;
  @override
  @JsonKey(name: 'rejected_at')
  final DateTime? rejectedAt;
// Business info
  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;
  @override
  @JsonKey(name: 'business_photo')
  final String? businessPhoto;
  @override
  @JsonKey(name: 'business_latitude')
  final double? businessLatitude;
  @override
  @JsonKey(name: 'business_longitude')
  final double? businessLongitude;
  @override
  @JsonKey(name: 'business_address')
  final String? businessAddress;
// Country of the business that owns the reservation. Used by the
// customer-facing reservation_card to render the quoted_amount in the
// right currency (€ / $ / ARS / Bs / etc.) instead of always assuming €.
// [unknownEnumValue: nullForUndefinedEnumValue] is the defensive pattern
// captured in feedback_defensive_json_enums.md — if the BE ever ships a
// country we don't have in [FoodlyCountries] (e.g. Brazil in Phase 3),
// the whole reservations list MUST NOT fail to deserialize. We just
// fall back to the global '$' default at the consumer site.
  @override
  @JsonKey(
      name: 'business_country',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final FoodlyCountries? businessCountry;
// User info
  @override
  @JsonKey(name: 'user_uuid')
  final String? userUuid;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  @JsonKey(name: 'user_photo')
  final String? userPhoto;
  @override
  @JsonKey(name: 'user_email')
  final String? userEmail;
  @override
  @JsonKey(name: 'user_phone')
  final String? userPhone;
// ISO del país del teléfono cuando `userPhone` es nacional (sin snapshot).
// Si hay snapshot, viene null porque `userPhone` ya es E.164. Se usa para
// componer el número internacional (display + botón de llamar).
  @override
  @JsonKey(name: 'user_phone_country_code')
  final String? userPhoneCountryCode;
// Service booking fields (only present when booking_type = service)
  @override
  @JsonKey(name: 'service_package_uuid')
  final String? servicePackageUuid;
  @override
  @JsonKey(name: 'service_package_title')
  final String? servicePackageTitle;
  @override
  @JsonKey(name: 'event_address')
  final String? eventAddress;
  @override
  @JsonKey(name: 'event_city')
  final String? eventCity;
  @override
  @JsonKey(name: 'event_latitude')
  final double? eventLatitude;
  @override
  @JsonKey(name: 'event_longitude')
  final double? eventLongitude;
  @override
  @JsonKey(name: 'event_type')
  final EventType? eventType;
  @override
  @JsonKey(name: 'guest_count')
  final int? guestCount;
  @override
  @JsonKey(name: 'dietary_notes')
  final String? dietaryNotes;
  @override
  @JsonKey(name: 'budget_estimate')
  final double? budgetEstimate;
  @override
  @JsonKey(name: 'quoted_amount')
  final double? quotedAmount;
  @override
  @JsonKey(name: 'quoted_at')
  final DateTime? quotedAt;
  @override
  @JsonKey(name: 'messages_count')
  final int messagesCount;
// Timestamps
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationDMCopyWith<_ReservationDM> get copyWith =>
      __$ReservationDMCopyWithImpl<_ReservationDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationDM &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.reservationUuid, reservationUuid) ||
                other.reservationUuid == reservationUuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.reservationDate, reservationDate) ||
                other.reservationDate == reservationDate) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize) &&
            (identical(other.specialRequests, specialRequests) ||
                other.specialRequests == specialRequests) &&
            (identical(other.managerNotes, managerNotes) ||
                other.managerNotes == managerNotes) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessPhoto, businessPhoto) ||
                other.businessPhoto == businessPhoto) &&
            (identical(other.businessLatitude, businessLatitude) ||
                other.businessLatitude == businessLatitude) &&
            (identical(other.businessLongitude, businessLongitude) ||
                other.businessLongitude == businessLongitude) &&
            (identical(other.businessAddress, businessAddress) ||
                other.businessAddress == businessAddress) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhoto, userPhoto) ||
                other.userPhoto == userPhoto) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.userPhoneCountryCode, userPhoneCountryCode) ||
                other.userPhoneCountryCode == userPhoneCountryCode) &&
            (identical(other.servicePackageUuid, servicePackageUuid) ||
                other.servicePackageUuid == servicePackageUuid) &&
            (identical(other.servicePackageTitle, servicePackageTitle) ||
                other.servicePackageTitle == servicePackageTitle) &&
            (identical(other.eventAddress, eventAddress) ||
                other.eventAddress == eventAddress) &&
            (identical(other.eventCity, eventCity) ||
                other.eventCity == eventCity) &&
            (identical(other.eventLatitude, eventLatitude) ||
                other.eventLatitude == eventLatitude) &&
            (identical(other.eventLongitude, eventLongitude) ||
                other.eventLongitude == eventLongitude) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.dietaryNotes, dietaryNotes) ||
                other.dietaryNotes == dietaryNotes) &&
            (identical(other.budgetEstimate, budgetEstimate) ||
                other.budgetEstimate == budgetEstimate) &&
            (identical(other.quotedAmount, quotedAmount) ||
                other.quotedAmount == quotedAmount) &&
            (identical(other.quotedAt, quotedAt) ||
                other.quotedAt == quotedAt) &&
            (identical(other.messagesCount, messagesCount) ||
                other.messagesCount == messagesCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reservationId,
        reservationUuid,
        status,
        bookingType,
        reservationDate,
        reservationTime,
        partySize,
        specialRequests,
        managerNotes,
        cancelledBy,
        cancelledAt,
        confirmedAt,
        rejectedAt,
        businessUuid,
        businessName,
        businessPhoto,
        businessLatitude,
        businessLongitude,
        businessAddress,
        businessCountry,
        userUuid,
        userName,
        userPhoto,
        userEmail,
        userPhone,
        userPhoneCountryCode,
        servicePackageUuid,
        servicePackageTitle,
        eventAddress,
        eventCity,
        eventLatitude,
        eventLongitude,
        eventType,
        guestCount,
        dietaryNotes,
        budgetEstimate,
        quotedAmount,
        quotedAt,
        messagesCount,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ReservationDM(reservationId: $reservationId, reservationUuid: $reservationUuid, status: $status, bookingType: $bookingType, reservationDate: $reservationDate, reservationTime: $reservationTime, partySize: $partySize, specialRequests: $specialRequests, managerNotes: $managerNotes, cancelledBy: $cancelledBy, cancelledAt: $cancelledAt, confirmedAt: $confirmedAt, rejectedAt: $rejectedAt, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, businessLatitude: $businessLatitude, businessLongitude: $businessLongitude, businessAddress: $businessAddress, businessCountry: $businessCountry, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, userEmail: $userEmail, userPhone: $userPhone, userPhoneCountryCode: $userPhoneCountryCode, servicePackageUuid: $servicePackageUuid, servicePackageTitle: $servicePackageTitle, eventAddress: $eventAddress, eventCity: $eventCity, eventLatitude: $eventLatitude, eventLongitude: $eventLongitude, eventType: $eventType, guestCount: $guestCount, dietaryNotes: $dietaryNotes, budgetEstimate: $budgetEstimate, quotedAmount: $quotedAmount, quotedAt: $quotedAt, messagesCount: $messagesCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ReservationDMCopyWith<$Res>
    implements $ReservationDMCopyWith<$Res> {
  factory _$ReservationDMCopyWith(
          _ReservationDM value, $Res Function(_ReservationDM) _then) =
      __$ReservationDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reservation_id') int? reservationId,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      ReservationStatus status,
      @JsonKey(name: 'booking_type') BookingType bookingType,
      @JsonKey(name: 'reservation_date') DateTime? reservationDate,
      @JsonKey(name: 'reservation_time') String? reservationTime,
      @JsonKey(name: 'party_size') int partySize,
      @JsonKey(name: 'special_requests') String? specialRequests,
      @JsonKey(name: 'manager_notes') String? managerNotes,
      @JsonKey(name: 'cancelled_by') String? cancelledBy,
      @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'business_latitude') double? businessLatitude,
      @JsonKey(name: 'business_longitude') double? businessLongitude,
      @JsonKey(name: 'business_address') String? businessAddress,
      @JsonKey(
          name: 'business_country',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      FoodlyCountries? businessCountry,
      @JsonKey(name: 'user_uuid') String? userUuid,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'user_email') String? userEmail,
      @JsonKey(name: 'user_phone') String? userPhone,
      @JsonKey(name: 'user_phone_country_code') String? userPhoneCountryCode,
      @JsonKey(name: 'service_package_uuid') String? servicePackageUuid,
      @JsonKey(name: 'service_package_title') String? servicePackageTitle,
      @JsonKey(name: 'event_address') String? eventAddress,
      @JsonKey(name: 'event_city') String? eventCity,
      @JsonKey(name: 'event_latitude') double? eventLatitude,
      @JsonKey(name: 'event_longitude') double? eventLongitude,
      @JsonKey(name: 'event_type') EventType? eventType,
      @JsonKey(name: 'guest_count') int? guestCount,
      @JsonKey(name: 'dietary_notes') String? dietaryNotes,
      @JsonKey(name: 'budget_estimate') double? budgetEstimate,
      @JsonKey(name: 'quoted_amount') double? quotedAmount,
      @JsonKey(name: 'quoted_at') DateTime? quotedAt,
      @JsonKey(name: 'messages_count') int messagesCount,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$ReservationDMCopyWithImpl<$Res>
    implements _$ReservationDMCopyWith<$Res> {
  __$ReservationDMCopyWithImpl(this._self, this._then);

  final _ReservationDM _self;
  final $Res Function(_ReservationDM) _then;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservationId = freezed,
    Object? reservationUuid = freezed,
    Object? status = null,
    Object? bookingType = null,
    Object? reservationDate = freezed,
    Object? reservationTime = freezed,
    Object? partySize = null,
    Object? specialRequests = freezed,
    Object? managerNotes = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? businessUuid = freezed,
    Object? businessName = freezed,
    Object? businessPhoto = freezed,
    Object? businessLatitude = freezed,
    Object? businessLongitude = freezed,
    Object? businessAddress = freezed,
    Object? businessCountry = freezed,
    Object? userUuid = freezed,
    Object? userName = freezed,
    Object? userPhoto = freezed,
    Object? userEmail = freezed,
    Object? userPhone = freezed,
    Object? userPhoneCountryCode = freezed,
    Object? servicePackageUuid = freezed,
    Object? servicePackageTitle = freezed,
    Object? eventAddress = freezed,
    Object? eventCity = freezed,
    Object? eventLatitude = freezed,
    Object? eventLongitude = freezed,
    Object? eventType = freezed,
    Object? guestCount = freezed,
    Object? dietaryNotes = freezed,
    Object? budgetEstimate = freezed,
    Object? quotedAmount = freezed,
    Object? quotedAt = freezed,
    Object? messagesCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_ReservationDM(
      reservationId: freezed == reservationId
          ? _self.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationUuid: freezed == reservationUuid
          ? _self.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      bookingType: null == bookingType
          ? _self.bookingType
          : bookingType // ignore: cast_nullable_to_non_nullable
              as BookingType,
      reservationDate: freezed == reservationDate
          ? _self.reservationDate
          : reservationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _self.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      partySize: null == partySize
          ? _self.partySize
          : partySize // ignore: cast_nullable_to_non_nullable
              as int,
      specialRequests: freezed == specialRequests
          ? _self.specialRequests
          : specialRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      managerNotes: freezed == managerNotes
          ? _self.managerNotes
          : managerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledBy: freezed == cancelledBy
          ? _self.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _self.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _self.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _self.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _self.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLatitude: freezed == businessLatitude
          ? _self.businessLatitude
          : businessLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessLongitude: freezed == businessLongitude
          ? _self.businessLongitude
          : businessLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      businessAddress: freezed == businessAddress
          ? _self.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      userUuid: freezed == userUuid
          ? _self.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _self.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _self.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoneCountryCode: freezed == userPhoneCountryCode
          ? _self.userPhoneCountryCode
          : userPhoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageUuid: freezed == servicePackageUuid
          ? _self.servicePackageUuid
          : servicePackageUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageTitle: freezed == servicePackageTitle
          ? _self.servicePackageTitle
          : servicePackageTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      eventAddress: freezed == eventAddress
          ? _self.eventAddress
          : eventAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCity: freezed == eventCity
          ? _self.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String?,
      eventLatitude: freezed == eventLatitude
          ? _self.eventLatitude
          : eventLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      eventLongitude: freezed == eventLongitude
          ? _self.eventLongitude
          : eventLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      eventType: freezed == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as EventType?,
      guestCount: freezed == guestCount
          ? _self.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dietaryNotes: freezed == dietaryNotes
          ? _self.dietaryNotes
          : dietaryNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetEstimate: freezed == budgetEstimate
          ? _self.budgetEstimate
          : budgetEstimate // ignore: cast_nullable_to_non_nullable
              as double?,
      quotedAmount: freezed == quotedAmount
          ? _self.quotedAmount
          : quotedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      quotedAt: freezed == quotedAt
          ? _self.quotedAt
          : quotedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messagesCount: null == messagesCount
          ? _self.messagesCount
          : messagesCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
