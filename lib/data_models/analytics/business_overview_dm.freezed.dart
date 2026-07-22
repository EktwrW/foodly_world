// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_overview_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessOverviewResponseDM {
  BusinessOverviewDataDM? get data;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessOverviewResponseDMCopyWith<BusinessOverviewResponseDM>
      get copyWith =>
          _$BusinessOverviewResponseDMCopyWithImpl<BusinessOverviewResponseDM>(
              this as BusinessOverviewResponseDM, _$identity);

  /// Serializes this BusinessOverviewResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessOverviewResponseDM &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'BusinessOverviewResponseDM(data: $data)';
  }
}

/// @nodoc
abstract mixin class $BusinessOverviewResponseDMCopyWith<$Res> {
  factory $BusinessOverviewResponseDMCopyWith(BusinessOverviewResponseDM value,
          $Res Function(BusinessOverviewResponseDM) _then) =
      _$BusinessOverviewResponseDMCopyWithImpl;
  @useResult
  $Res call({BusinessOverviewDataDM? data});

  $BusinessOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$BusinessOverviewResponseDMCopyWithImpl<$Res>
    implements $BusinessOverviewResponseDMCopyWith<$Res> {
  _$BusinessOverviewResponseDMCopyWithImpl(this._self, this._then);

  final BusinessOverviewResponseDM _self;
  final $Res Function(BusinessOverviewResponseDM) _then;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
    ));
  }

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessOverviewResponseDM].
extension BusinessOverviewResponseDMPatterns on BusinessOverviewResponseDM {
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
    TResult Function(_BusinessOverviewResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewResponseDM() when $default != null:
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
    TResult Function(_BusinessOverviewResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewResponseDM():
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
    TResult? Function(_BusinessOverviewResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewResponseDM() when $default != null:
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
    TResult Function(BusinessOverviewDataDM? data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewResponseDM() when $default != null:
        return $default(_that.data);
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
    TResult Function(BusinessOverviewDataDM? data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewResponseDM():
        return $default(_that.data);
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
    TResult? Function(BusinessOverviewDataDM? data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewResponseDM() when $default != null:
        return $default(_that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessOverviewResponseDM implements BusinessOverviewResponseDM {
  const _BusinessOverviewResponseDM({this.data});
  factory _BusinessOverviewResponseDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessOverviewResponseDMFromJson(json);

  @override
  final BusinessOverviewDataDM? data;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessOverviewResponseDMCopyWith<_BusinessOverviewResponseDM>
      get copyWith => __$BusinessOverviewResponseDMCopyWithImpl<
          _BusinessOverviewResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessOverviewResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessOverviewResponseDM &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'BusinessOverviewResponseDM(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$BusinessOverviewResponseDMCopyWith<$Res>
    implements $BusinessOverviewResponseDMCopyWith<$Res> {
  factory _$BusinessOverviewResponseDMCopyWith(
          _BusinessOverviewResponseDM value,
          $Res Function(_BusinessOverviewResponseDM) _then) =
      __$BusinessOverviewResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessOverviewDataDM? data});

  @override
  $BusinessOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$BusinessOverviewResponseDMCopyWithImpl<$Res>
    implements _$BusinessOverviewResponseDMCopyWith<$Res> {
  __$BusinessOverviewResponseDMCopyWithImpl(this._self, this._then);

  final _BusinessOverviewResponseDM _self;
  final $Res Function(_BusinessOverviewResponseDM) _then;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_BusinessOverviewResponseDM(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
    ));
  }

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$BusinessOverviewDataDM {
  KpisDM? get kpis;
  FunnelDM? get funnel;
  @JsonKey(name: 'series')
  DailySeriesDM? get series;
  BreakdownsDM? get breakdowns;

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<BusinessOverviewDataDM> get copyWith =>
      _$BusinessOverviewDataDMCopyWithImpl<BusinessOverviewDataDM>(
          this as BusinessOverviewDataDM, _$identity);

  /// Serializes this BusinessOverviewDataDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessOverviewDataDM &&
            (identical(other.kpis, kpis) || other.kpis == kpis) &&
            (identical(other.funnel, funnel) || other.funnel == funnel) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.breakdowns, breakdowns) ||
                other.breakdowns == breakdowns));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kpis, funnel, series, breakdowns);

  @override
  String toString() {
    return 'BusinessOverviewDataDM(kpis: $kpis, funnel: $funnel, series: $series, breakdowns: $breakdowns)';
  }
}

/// @nodoc
abstract mixin class $BusinessOverviewDataDMCopyWith<$Res> {
  factory $BusinessOverviewDataDMCopyWith(BusinessOverviewDataDM value,
          $Res Function(BusinessOverviewDataDM) _then) =
      _$BusinessOverviewDataDMCopyWithImpl;
  @useResult
  $Res call(
      {KpisDM? kpis,
      FunnelDM? funnel,
      @JsonKey(name: 'series') DailySeriesDM? series,
      BreakdownsDM? breakdowns});

  $KpisDMCopyWith<$Res>? get kpis;
  $FunnelDMCopyWith<$Res>? get funnel;
  $DailySeriesDMCopyWith<$Res>? get series;
  $BreakdownsDMCopyWith<$Res>? get breakdowns;
}

/// @nodoc
class _$BusinessOverviewDataDMCopyWithImpl<$Res>
    implements $BusinessOverviewDataDMCopyWith<$Res> {
  _$BusinessOverviewDataDMCopyWithImpl(this._self, this._then);

  final BusinessOverviewDataDM _self;
  final $Res Function(BusinessOverviewDataDM) _then;

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kpis = freezed,
    Object? funnel = freezed,
    Object? series = freezed,
    Object? breakdowns = freezed,
  }) {
    return _then(_self.copyWith(
      kpis: freezed == kpis
          ? _self.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as KpisDM?,
      funnel: freezed == funnel
          ? _self.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as FunnelDM?,
      series: freezed == series
          ? _self.series
          : series // ignore: cast_nullable_to_non_nullable
              as DailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _self.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as BreakdownsDM?,
    ));
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpisDMCopyWith<$Res>? get kpis {
    if (_self.kpis == null) {
      return null;
    }

    return $KpisDMCopyWith<$Res>(_self.kpis!, (value) {
      return _then(_self.copyWith(kpis: value));
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunnelDMCopyWith<$Res>? get funnel {
    if (_self.funnel == null) {
      return null;
    }

    return $FunnelDMCopyWith<$Res>(_self.funnel!, (value) {
      return _then(_self.copyWith(funnel: value));
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailySeriesDMCopyWith<$Res>? get series {
    if (_self.series == null) {
      return null;
    }

    return $DailySeriesDMCopyWith<$Res>(_self.series!, (value) {
      return _then(_self.copyWith(series: value));
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BreakdownsDMCopyWith<$Res>? get breakdowns {
    if (_self.breakdowns == null) {
      return null;
    }

    return $BreakdownsDMCopyWith<$Res>(_self.breakdowns!, (value) {
      return _then(_self.copyWith(breakdowns: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessOverviewDataDM].
extension BusinessOverviewDataDMPatterns on BusinessOverviewDataDM {
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
    TResult Function(_BusinessOverviewDataDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewDataDM() when $default != null:
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
    TResult Function(_BusinessOverviewDataDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewDataDM():
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
    TResult? Function(_BusinessOverviewDataDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewDataDM() when $default != null:
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
            KpisDM? kpis,
            FunnelDM? funnel,
            @JsonKey(name: 'series') DailySeriesDM? series,
            BreakdownsDM? breakdowns)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewDataDM() when $default != null:
        return $default(
            _that.kpis, _that.funnel, _that.series, _that.breakdowns);
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
            KpisDM? kpis,
            FunnelDM? funnel,
            @JsonKey(name: 'series') DailySeriesDM? series,
            BreakdownsDM? breakdowns)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewDataDM():
        return $default(
            _that.kpis, _that.funnel, _that.series, _that.breakdowns);
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
            KpisDM? kpis,
            FunnelDM? funnel,
            @JsonKey(name: 'series') DailySeriesDM? series,
            BreakdownsDM? breakdowns)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessOverviewDataDM() when $default != null:
        return $default(
            _that.kpis, _that.funnel, _that.series, _that.breakdowns);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessOverviewDataDM implements BusinessOverviewDataDM {
  const _BusinessOverviewDataDM(
      {this.kpis,
      this.funnel,
      @JsonKey(name: 'series') this.series,
      this.breakdowns});
  factory _BusinessOverviewDataDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessOverviewDataDMFromJson(json);

  @override
  final KpisDM? kpis;
  @override
  final FunnelDM? funnel;
  @override
  @JsonKey(name: 'series')
  final DailySeriesDM? series;
  @override
  final BreakdownsDM? breakdowns;

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessOverviewDataDMCopyWith<_BusinessOverviewDataDM> get copyWith =>
      __$BusinessOverviewDataDMCopyWithImpl<_BusinessOverviewDataDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessOverviewDataDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessOverviewDataDM &&
            (identical(other.kpis, kpis) || other.kpis == kpis) &&
            (identical(other.funnel, funnel) || other.funnel == funnel) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.breakdowns, breakdowns) ||
                other.breakdowns == breakdowns));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kpis, funnel, series, breakdowns);

  @override
  String toString() {
    return 'BusinessOverviewDataDM(kpis: $kpis, funnel: $funnel, series: $series, breakdowns: $breakdowns)';
  }
}

/// @nodoc
abstract mixin class _$BusinessOverviewDataDMCopyWith<$Res>
    implements $BusinessOverviewDataDMCopyWith<$Res> {
  factory _$BusinessOverviewDataDMCopyWith(_BusinessOverviewDataDM value,
          $Res Function(_BusinessOverviewDataDM) _then) =
      __$BusinessOverviewDataDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {KpisDM? kpis,
      FunnelDM? funnel,
      @JsonKey(name: 'series') DailySeriesDM? series,
      BreakdownsDM? breakdowns});

  @override
  $KpisDMCopyWith<$Res>? get kpis;
  @override
  $FunnelDMCopyWith<$Res>? get funnel;
  @override
  $DailySeriesDMCopyWith<$Res>? get series;
  @override
  $BreakdownsDMCopyWith<$Res>? get breakdowns;
}

/// @nodoc
class __$BusinessOverviewDataDMCopyWithImpl<$Res>
    implements _$BusinessOverviewDataDMCopyWith<$Res> {
  __$BusinessOverviewDataDMCopyWithImpl(this._self, this._then);

  final _BusinessOverviewDataDM _self;
  final $Res Function(_BusinessOverviewDataDM) _then;

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kpis = freezed,
    Object? funnel = freezed,
    Object? series = freezed,
    Object? breakdowns = freezed,
  }) {
    return _then(_BusinessOverviewDataDM(
      kpis: freezed == kpis
          ? _self.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as KpisDM?,
      funnel: freezed == funnel
          ? _self.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as FunnelDM?,
      series: freezed == series
          ? _self.series
          : series // ignore: cast_nullable_to_non_nullable
              as DailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _self.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as BreakdownsDM?,
    ));
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpisDMCopyWith<$Res>? get kpis {
    if (_self.kpis == null) {
      return null;
    }

    return $KpisDMCopyWith<$Res>(_self.kpis!, (value) {
      return _then(_self.copyWith(kpis: value));
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunnelDMCopyWith<$Res>? get funnel {
    if (_self.funnel == null) {
      return null;
    }

    return $FunnelDMCopyWith<$Res>(_self.funnel!, (value) {
      return _then(_self.copyWith(funnel: value));
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailySeriesDMCopyWith<$Res>? get series {
    if (_self.series == null) {
      return null;
    }

    return $DailySeriesDMCopyWith<$Res>(_self.series!, (value) {
      return _then(_self.copyWith(series: value));
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BreakdownsDMCopyWith<$Res>? get breakdowns {
    if (_self.breakdowns == null) {
      return null;
    }

    return $BreakdownsDMCopyWith<$Res>(_self.breakdowns!, (value) {
      return _then(_self.copyWith(breakdowns: value));
    });
  }
}

/// @nodoc
mixin _$KpisDM {
  @JsonKey(name: 'reservations_total')
  int get reservationsTotal;
  @JsonKey(name: 'reservation_success_rate')
  double get reservationSuccessRate;
  @JsonKey(name: 'reviews_total')
  int get reviewsTotal;
  @JsonKey(name: 'reviews_avg_rating')
  double get reviewsAvgRating;
  @JsonKey(name: 'favorites_total')
  int get favoritesTotal;
  @JsonKey(name: 'favorites_unique_users')
  int get favoritesUniqueUsers;
  @JsonKey(name: 'events_total')
  int get eventsTotal;

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpisDMCopyWith<KpisDM> get copyWith =>
      _$KpisDMCopyWithImpl<KpisDM>(this as KpisDM, _$identity);

  /// Serializes this KpisDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpisDM &&
            (identical(other.reservationsTotal, reservationsTotal) ||
                other.reservationsTotal == reservationsTotal) &&
            (identical(other.reservationSuccessRate, reservationSuccessRate) ||
                other.reservationSuccessRate == reservationSuccessRate) &&
            (identical(other.reviewsTotal, reviewsTotal) ||
                other.reviewsTotal == reviewsTotal) &&
            (identical(other.reviewsAvgRating, reviewsAvgRating) ||
                other.reviewsAvgRating == reviewsAvgRating) &&
            (identical(other.favoritesTotal, favoritesTotal) ||
                other.favoritesTotal == favoritesTotal) &&
            (identical(other.favoritesUniqueUsers, favoritesUniqueUsers) ||
                other.favoritesUniqueUsers == favoritesUniqueUsers) &&
            (identical(other.eventsTotal, eventsTotal) ||
                other.eventsTotal == eventsTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reservationsTotal,
      reservationSuccessRate,
      reviewsTotal,
      reviewsAvgRating,
      favoritesTotal,
      favoritesUniqueUsers,
      eventsTotal);

  @override
  String toString() {
    return 'KpisDM(reservationsTotal: $reservationsTotal, reservationSuccessRate: $reservationSuccessRate, reviewsTotal: $reviewsTotal, reviewsAvgRating: $reviewsAvgRating, favoritesTotal: $favoritesTotal, favoritesUniqueUsers: $favoritesUniqueUsers, eventsTotal: $eventsTotal)';
  }
}

/// @nodoc
abstract mixin class $KpisDMCopyWith<$Res> {
  factory $KpisDMCopyWith(KpisDM value, $Res Function(KpisDM) _then) =
      _$KpisDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_total') int reservationsTotal,
      @JsonKey(name: 'reservation_success_rate') double reservationSuccessRate,
      @JsonKey(name: 'reviews_total') int reviewsTotal,
      @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
      @JsonKey(name: 'favorites_total') int favoritesTotal,
      @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
      @JsonKey(name: 'events_total') int eventsTotal});
}

/// @nodoc
class _$KpisDMCopyWithImpl<$Res> implements $KpisDMCopyWith<$Res> {
  _$KpisDMCopyWithImpl(this._self, this._then);

  final KpisDM _self;
  final $Res Function(KpisDM) _then;

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationsTotal = null,
    Object? reservationSuccessRate = null,
    Object? reviewsTotal = null,
    Object? reviewsAvgRating = null,
    Object? favoritesTotal = null,
    Object? favoritesUniqueUsers = null,
    Object? eventsTotal = null,
  }) {
    return _then(_self.copyWith(
      reservationsTotal: null == reservationsTotal
          ? _self.reservationsTotal
          : reservationsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reservationSuccessRate: null == reservationSuccessRate
          ? _self.reservationSuccessRate
          : reservationSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
      reviewsTotal: null == reviewsTotal
          ? _self.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsAvgRating: null == reviewsAvgRating
          ? _self.reviewsAvgRating
          : reviewsAvgRating // ignore: cast_nullable_to_non_nullable
              as double,
      favoritesTotal: null == favoritesTotal
          ? _self.favoritesTotal
          : favoritesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesUniqueUsers: null == favoritesUniqueUsers
          ? _self.favoritesUniqueUsers
          : favoritesUniqueUsers // ignore: cast_nullable_to_non_nullable
              as int,
      eventsTotal: null == eventsTotal
          ? _self.eventsTotal
          : eventsTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [KpisDM].
extension KpisDMPatterns on KpisDM {
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
    TResult Function(_KpisDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpisDM() when $default != null:
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
    TResult Function(_KpisDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpisDM():
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
    TResult? Function(_KpisDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpisDM() when $default != null:
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
            @JsonKey(name: 'reservations_total') int reservationsTotal,
            @JsonKey(name: 'reservation_success_rate')
            double reservationSuccessRate,
            @JsonKey(name: 'reviews_total') int reviewsTotal,
            @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
            @JsonKey(name: 'favorites_total') int favoritesTotal,
            @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
            @JsonKey(name: 'events_total') int eventsTotal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpisDM() when $default != null:
        return $default(
            _that.reservationsTotal,
            _that.reservationSuccessRate,
            _that.reviewsTotal,
            _that.reviewsAvgRating,
            _that.favoritesTotal,
            _that.favoritesUniqueUsers,
            _that.eventsTotal);
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
            @JsonKey(name: 'reservations_total') int reservationsTotal,
            @JsonKey(name: 'reservation_success_rate')
            double reservationSuccessRate,
            @JsonKey(name: 'reviews_total') int reviewsTotal,
            @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
            @JsonKey(name: 'favorites_total') int favoritesTotal,
            @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
            @JsonKey(name: 'events_total') int eventsTotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpisDM():
        return $default(
            _that.reservationsTotal,
            _that.reservationSuccessRate,
            _that.reviewsTotal,
            _that.reviewsAvgRating,
            _that.favoritesTotal,
            _that.favoritesUniqueUsers,
            _that.eventsTotal);
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
            @JsonKey(name: 'reservations_total') int reservationsTotal,
            @JsonKey(name: 'reservation_success_rate')
            double reservationSuccessRate,
            @JsonKey(name: 'reviews_total') int reviewsTotal,
            @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
            @JsonKey(name: 'favorites_total') int favoritesTotal,
            @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
            @JsonKey(name: 'events_total') int eventsTotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpisDM() when $default != null:
        return $default(
            _that.reservationsTotal,
            _that.reservationSuccessRate,
            _that.reviewsTotal,
            _that.reviewsAvgRating,
            _that.favoritesTotal,
            _that.favoritesUniqueUsers,
            _that.eventsTotal);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpisDM implements KpisDM {
  const _KpisDM(
      {@JsonKey(name: 'reservations_total') this.reservationsTotal = 0,
      @JsonKey(name: 'reservation_success_rate')
      this.reservationSuccessRate = 0.0,
      @JsonKey(name: 'reviews_total') this.reviewsTotal = 0,
      @JsonKey(name: 'reviews_avg_rating') this.reviewsAvgRating = 0.0,
      @JsonKey(name: 'favorites_total') this.favoritesTotal = 0,
      @JsonKey(name: 'favorites_unique_users') this.favoritesUniqueUsers = 0,
      @JsonKey(name: 'events_total') this.eventsTotal = 0});
  factory _KpisDM.fromJson(Map<String, dynamic> json) => _$KpisDMFromJson(json);

  @override
  @JsonKey(name: 'reservations_total')
  final int reservationsTotal;
  @override
  @JsonKey(name: 'reservation_success_rate')
  final double reservationSuccessRate;
  @override
  @JsonKey(name: 'reviews_total')
  final int reviewsTotal;
  @override
  @JsonKey(name: 'reviews_avg_rating')
  final double reviewsAvgRating;
  @override
  @JsonKey(name: 'favorites_total')
  final int favoritesTotal;
  @override
  @JsonKey(name: 'favorites_unique_users')
  final int favoritesUniqueUsers;
  @override
  @JsonKey(name: 'events_total')
  final int eventsTotal;

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpisDMCopyWith<_KpisDM> get copyWith =>
      __$KpisDMCopyWithImpl<_KpisDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpisDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpisDM &&
            (identical(other.reservationsTotal, reservationsTotal) ||
                other.reservationsTotal == reservationsTotal) &&
            (identical(other.reservationSuccessRate, reservationSuccessRate) ||
                other.reservationSuccessRate == reservationSuccessRate) &&
            (identical(other.reviewsTotal, reviewsTotal) ||
                other.reviewsTotal == reviewsTotal) &&
            (identical(other.reviewsAvgRating, reviewsAvgRating) ||
                other.reviewsAvgRating == reviewsAvgRating) &&
            (identical(other.favoritesTotal, favoritesTotal) ||
                other.favoritesTotal == favoritesTotal) &&
            (identical(other.favoritesUniqueUsers, favoritesUniqueUsers) ||
                other.favoritesUniqueUsers == favoritesUniqueUsers) &&
            (identical(other.eventsTotal, eventsTotal) ||
                other.eventsTotal == eventsTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reservationsTotal,
      reservationSuccessRate,
      reviewsTotal,
      reviewsAvgRating,
      favoritesTotal,
      favoritesUniqueUsers,
      eventsTotal);

  @override
  String toString() {
    return 'KpisDM(reservationsTotal: $reservationsTotal, reservationSuccessRate: $reservationSuccessRate, reviewsTotal: $reviewsTotal, reviewsAvgRating: $reviewsAvgRating, favoritesTotal: $favoritesTotal, favoritesUniqueUsers: $favoritesUniqueUsers, eventsTotal: $eventsTotal)';
  }
}

/// @nodoc
abstract mixin class _$KpisDMCopyWith<$Res> implements $KpisDMCopyWith<$Res> {
  factory _$KpisDMCopyWith(_KpisDM value, $Res Function(_KpisDM) _then) =
      __$KpisDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_total') int reservationsTotal,
      @JsonKey(name: 'reservation_success_rate') double reservationSuccessRate,
      @JsonKey(name: 'reviews_total') int reviewsTotal,
      @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
      @JsonKey(name: 'favorites_total') int favoritesTotal,
      @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
      @JsonKey(name: 'events_total') int eventsTotal});
}

/// @nodoc
class __$KpisDMCopyWithImpl<$Res> implements _$KpisDMCopyWith<$Res> {
  __$KpisDMCopyWithImpl(this._self, this._then);

  final _KpisDM _self;
  final $Res Function(_KpisDM) _then;

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservationsTotal = null,
    Object? reservationSuccessRate = null,
    Object? reviewsTotal = null,
    Object? reviewsAvgRating = null,
    Object? favoritesTotal = null,
    Object? favoritesUniqueUsers = null,
    Object? eventsTotal = null,
  }) {
    return _then(_KpisDM(
      reservationsTotal: null == reservationsTotal
          ? _self.reservationsTotal
          : reservationsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reservationSuccessRate: null == reservationSuccessRate
          ? _self.reservationSuccessRate
          : reservationSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
      reviewsTotal: null == reviewsTotal
          ? _self.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsAvgRating: null == reviewsAvgRating
          ? _self.reviewsAvgRating
          : reviewsAvgRating // ignore: cast_nullable_to_non_nullable
              as double,
      favoritesTotal: null == favoritesTotal
          ? _self.favoritesTotal
          : favoritesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesUniqueUsers: null == favoritesUniqueUsers
          ? _self.favoritesUniqueUsers
          : favoritesUniqueUsers // ignore: cast_nullable_to_non_nullable
              as int,
      eventsTotal: null == eventsTotal
          ? _self.eventsTotal
          : eventsTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$FunnelDM {
  @JsonKey(fromJson: parseFunnelSteps)
  List<FunnelStepDM> get steps;
  FunnelConversionDM? get conversion;

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FunnelDMCopyWith<FunnelDM> get copyWith =>
      _$FunnelDMCopyWithImpl<FunnelDM>(this as FunnelDM, _$identity);

  /// Serializes this FunnelDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FunnelDM &&
            const DeepCollectionEquality().equals(other.steps, steps) &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(steps), conversion);

  @override
  String toString() {
    return 'FunnelDM(steps: $steps, conversion: $conversion)';
  }
}

/// @nodoc
abstract mixin class $FunnelDMCopyWith<$Res> {
  factory $FunnelDMCopyWith(FunnelDM value, $Res Function(FunnelDM) _then) =
      _$FunnelDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
      FunnelConversionDM? conversion});

  $FunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class _$FunnelDMCopyWithImpl<$Res> implements $FunnelDMCopyWith<$Res> {
  _$FunnelDMCopyWithImpl(this._self, this._then);

  final FunnelDM _self;
  final $Res Function(FunnelDM) _then;

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? conversion = freezed,
  }) {
    return _then(_self.copyWith(
      steps: null == steps
          ? _self.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<FunnelStepDM>,
      conversion: freezed == conversion
          ? _self.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as FunnelConversionDM?,
    ));
  }

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunnelConversionDMCopyWith<$Res>? get conversion {
    if (_self.conversion == null) {
      return null;
    }

    return $FunnelConversionDMCopyWith<$Res>(_self.conversion!, (value) {
      return _then(_self.copyWith(conversion: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FunnelDM].
extension FunnelDMPatterns on FunnelDM {
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
    TResult Function(_FunnelDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FunnelDM() when $default != null:
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
    TResult Function(_FunnelDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelDM():
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
    TResult? Function(_FunnelDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelDM() when $default != null:
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
            @JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
            FunnelConversionDM? conversion)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FunnelDM() when $default != null:
        return $default(_that.steps, _that.conversion);
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
            @JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
            FunnelConversionDM? conversion)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelDM():
        return $default(_that.steps, _that.conversion);
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
            @JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
            FunnelConversionDM? conversion)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelDM() when $default != null:
        return $default(_that.steps, _that.conversion);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FunnelDM implements FunnelDM {
  const _FunnelDM(
      {@JsonKey(fromJson: parseFunnelSteps)
      final List<FunnelStepDM> steps = const [],
      this.conversion})
      : _steps = steps;
  factory _FunnelDM.fromJson(Map<String, dynamic> json) =>
      _$FunnelDMFromJson(json);

  final List<FunnelStepDM> _steps;
  @override
  @JsonKey(fromJson: parseFunnelSteps)
  List<FunnelStepDM> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final FunnelConversionDM? conversion;

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FunnelDMCopyWith<_FunnelDM> get copyWith =>
      __$FunnelDMCopyWithImpl<_FunnelDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FunnelDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FunnelDM &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_steps), conversion);

  @override
  String toString() {
    return 'FunnelDM(steps: $steps, conversion: $conversion)';
  }
}

/// @nodoc
abstract mixin class _$FunnelDMCopyWith<$Res>
    implements $FunnelDMCopyWith<$Res> {
  factory _$FunnelDMCopyWith(_FunnelDM value, $Res Function(_FunnelDM) _then) =
      __$FunnelDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
      FunnelConversionDM? conversion});

  @override
  $FunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class __$FunnelDMCopyWithImpl<$Res> implements _$FunnelDMCopyWith<$Res> {
  __$FunnelDMCopyWithImpl(this._self, this._then);

  final _FunnelDM _self;
  final $Res Function(_FunnelDM) _then;

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? steps = null,
    Object? conversion = freezed,
  }) {
    return _then(_FunnelDM(
      steps: null == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<FunnelStepDM>,
      conversion: freezed == conversion
          ? _self.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as FunnelConversionDM?,
    ));
  }

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunnelConversionDMCopyWith<$Res>? get conversion {
    if (_self.conversion == null) {
      return null;
    }

    return $FunnelConversionDMCopyWith<$Res>(_self.conversion!, (value) {
      return _then(_self.copyWith(conversion: value));
    });
  }
}

/// @nodoc
mixin _$FunnelStepDM {
  String get label;
  int get value;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FunnelStepDMCopyWith<FunnelStepDM> get copyWith =>
      _$FunnelStepDMCopyWithImpl<FunnelStepDM>(
          this as FunnelStepDM, _$identity);

  /// Serializes this FunnelStepDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FunnelStepDM &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @override
  String toString() {
    return 'FunnelStepDM(label: $label, value: $value)';
  }
}

/// @nodoc
abstract mixin class $FunnelStepDMCopyWith<$Res> {
  factory $FunnelStepDMCopyWith(
          FunnelStepDM value, $Res Function(FunnelStepDM) _then) =
      _$FunnelStepDMCopyWithImpl;
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class _$FunnelStepDMCopyWithImpl<$Res> implements $FunnelStepDMCopyWith<$Res> {
  _$FunnelStepDMCopyWithImpl(this._self, this._then);

  final FunnelStepDM _self;
  final $Res Function(FunnelStepDM) _then;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FunnelStepDM].
extension FunnelStepDMPatterns on FunnelStepDM {
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
    TResult Function(_FunnelStepDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FunnelStepDM() when $default != null:
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
    TResult Function(_FunnelStepDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelStepDM():
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
    TResult? Function(_FunnelStepDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelStepDM() when $default != null:
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
    TResult Function(String label, int value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FunnelStepDM() when $default != null:
        return $default(_that.label, _that.value);
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
    TResult Function(String label, int value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelStepDM():
        return $default(_that.label, _that.value);
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
    TResult? Function(String label, int value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelStepDM() when $default != null:
        return $default(_that.label, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FunnelStepDM implements FunnelStepDM {
  const _FunnelStepDM({this.label = '', this.value = 0});
  factory _FunnelStepDM.fromJson(Map<String, dynamic> json) =>
      _$FunnelStepDMFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final int value;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FunnelStepDMCopyWith<_FunnelStepDM> get copyWith =>
      __$FunnelStepDMCopyWithImpl<_FunnelStepDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FunnelStepDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FunnelStepDM &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @override
  String toString() {
    return 'FunnelStepDM(label: $label, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$FunnelStepDMCopyWith<$Res>
    implements $FunnelStepDMCopyWith<$Res> {
  factory _$FunnelStepDMCopyWith(
          _FunnelStepDM value, $Res Function(_FunnelStepDM) _then) =
      __$FunnelStepDMCopyWithImpl;
  @override
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class __$FunnelStepDMCopyWithImpl<$Res>
    implements _$FunnelStepDMCopyWith<$Res> {
  __$FunnelStepDMCopyWithImpl(this._self, this._then);

  final _FunnelStepDM _self;
  final $Res Function(_FunnelStepDM) _then;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_FunnelStepDM(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$FunnelConversionDM {
  @JsonKey(name: 'open_to_cta_rate')
  double get openToCtaRate;
  @JsonKey(name: 'open_to_reservation_rate')
  double get openToReservationRate;
  @JsonKey(name: 'cta_to_reservation_rate')
  double get ctaToReservationRate;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FunnelConversionDMCopyWith<FunnelConversionDM> get copyWith =>
      _$FunnelConversionDMCopyWithImpl<FunnelConversionDM>(
          this as FunnelConversionDM, _$identity);

  /// Serializes this FunnelConversionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FunnelConversionDM &&
            (identical(other.openToCtaRate, openToCtaRate) ||
                other.openToCtaRate == openToCtaRate) &&
            (identical(other.openToReservationRate, openToReservationRate) ||
                other.openToReservationRate == openToReservationRate) &&
            (identical(other.ctaToReservationRate, ctaToReservationRate) ||
                other.ctaToReservationRate == ctaToReservationRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, openToCtaRate, openToReservationRate, ctaToReservationRate);

  @override
  String toString() {
    return 'FunnelConversionDM(openToCtaRate: $openToCtaRate, openToReservationRate: $openToReservationRate, ctaToReservationRate: $ctaToReservationRate)';
  }
}

/// @nodoc
abstract mixin class $FunnelConversionDMCopyWith<$Res> {
  factory $FunnelConversionDMCopyWith(
          FunnelConversionDM value, $Res Function(FunnelConversionDM) _then) =
      _$FunnelConversionDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
      @JsonKey(name: 'open_to_reservation_rate') double openToReservationRate,
      @JsonKey(name: 'cta_to_reservation_rate') double ctaToReservationRate});
}

/// @nodoc
class _$FunnelConversionDMCopyWithImpl<$Res>
    implements $FunnelConversionDMCopyWith<$Res> {
  _$FunnelConversionDMCopyWithImpl(this._self, this._then);

  final FunnelConversionDM _self;
  final $Res Function(FunnelConversionDM) _then;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openToCtaRate = null,
    Object? openToReservationRate = null,
    Object? ctaToReservationRate = null,
  }) {
    return _then(_self.copyWith(
      openToCtaRate: null == openToCtaRate
          ? _self.openToCtaRate
          : openToCtaRate // ignore: cast_nullable_to_non_nullable
              as double,
      openToReservationRate: null == openToReservationRate
          ? _self.openToReservationRate
          : openToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
      ctaToReservationRate: null == ctaToReservationRate
          ? _self.ctaToReservationRate
          : ctaToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [FunnelConversionDM].
extension FunnelConversionDMPatterns on FunnelConversionDM {
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
    TResult Function(_FunnelConversionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FunnelConversionDM() when $default != null:
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
    TResult Function(_FunnelConversionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelConversionDM():
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
    TResult? Function(_FunnelConversionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelConversionDM() when $default != null:
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
            @JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
            @JsonKey(name: 'open_to_reservation_rate')
            double openToReservationRate,
            @JsonKey(name: 'cta_to_reservation_rate')
            double ctaToReservationRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FunnelConversionDM() when $default != null:
        return $default(_that.openToCtaRate, _that.openToReservationRate,
            _that.ctaToReservationRate);
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
            @JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
            @JsonKey(name: 'open_to_reservation_rate')
            double openToReservationRate,
            @JsonKey(name: 'cta_to_reservation_rate')
            double ctaToReservationRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelConversionDM():
        return $default(_that.openToCtaRate, _that.openToReservationRate,
            _that.ctaToReservationRate);
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
            @JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
            @JsonKey(name: 'open_to_reservation_rate')
            double openToReservationRate,
            @JsonKey(name: 'cta_to_reservation_rate')
            double ctaToReservationRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FunnelConversionDM() when $default != null:
        return $default(_that.openToCtaRate, _that.openToReservationRate,
            _that.ctaToReservationRate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FunnelConversionDM implements FunnelConversionDM {
  const _FunnelConversionDM(
      {@JsonKey(name: 'open_to_cta_rate') this.openToCtaRate = 0.0,
      @JsonKey(name: 'open_to_reservation_rate')
      this.openToReservationRate = 0.0,
      @JsonKey(name: 'cta_to_reservation_rate')
      this.ctaToReservationRate = 0.0});
  factory _FunnelConversionDM.fromJson(Map<String, dynamic> json) =>
      _$FunnelConversionDMFromJson(json);

  @override
  @JsonKey(name: 'open_to_cta_rate')
  final double openToCtaRate;
  @override
  @JsonKey(name: 'open_to_reservation_rate')
  final double openToReservationRate;
  @override
  @JsonKey(name: 'cta_to_reservation_rate')
  final double ctaToReservationRate;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FunnelConversionDMCopyWith<_FunnelConversionDM> get copyWith =>
      __$FunnelConversionDMCopyWithImpl<_FunnelConversionDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FunnelConversionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FunnelConversionDM &&
            (identical(other.openToCtaRate, openToCtaRate) ||
                other.openToCtaRate == openToCtaRate) &&
            (identical(other.openToReservationRate, openToReservationRate) ||
                other.openToReservationRate == openToReservationRate) &&
            (identical(other.ctaToReservationRate, ctaToReservationRate) ||
                other.ctaToReservationRate == ctaToReservationRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, openToCtaRate, openToReservationRate, ctaToReservationRate);

  @override
  String toString() {
    return 'FunnelConversionDM(openToCtaRate: $openToCtaRate, openToReservationRate: $openToReservationRate, ctaToReservationRate: $ctaToReservationRate)';
  }
}

/// @nodoc
abstract mixin class _$FunnelConversionDMCopyWith<$Res>
    implements $FunnelConversionDMCopyWith<$Res> {
  factory _$FunnelConversionDMCopyWith(
          _FunnelConversionDM value, $Res Function(_FunnelConversionDM) _then) =
      __$FunnelConversionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
      @JsonKey(name: 'open_to_reservation_rate') double openToReservationRate,
      @JsonKey(name: 'cta_to_reservation_rate') double ctaToReservationRate});
}

/// @nodoc
class __$FunnelConversionDMCopyWithImpl<$Res>
    implements _$FunnelConversionDMCopyWith<$Res> {
  __$FunnelConversionDMCopyWithImpl(this._self, this._then);

  final _FunnelConversionDM _self;
  final $Res Function(_FunnelConversionDM) _then;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? openToCtaRate = null,
    Object? openToReservationRate = null,
    Object? ctaToReservationRate = null,
  }) {
    return _then(_FunnelConversionDM(
      openToCtaRate: null == openToCtaRate
          ? _self.openToCtaRate
          : openToCtaRate // ignore: cast_nullable_to_non_nullable
              as double,
      openToReservationRate: null == openToReservationRate
          ? _self.openToReservationRate
          : openToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
      ctaToReservationRate: null == ctaToReservationRate
          ? _self.ctaToReservationRate
          : ctaToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$DailySeriesDM {
  @JsonKey(name: 'reservations_daily')
  List<DailyPointDM> get reservationsDaily;
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily;
  @JsonKey(name: 'favorites_daily')
  List<DailyPointDM> get favoritesDaily;
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily;

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailySeriesDMCopyWith<DailySeriesDM> get copyWith =>
      _$DailySeriesDMCopyWithImpl<DailySeriesDM>(
          this as DailySeriesDM, _$identity);

  /// Serializes this DailySeriesDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailySeriesDM &&
            const DeepCollectionEquality()
                .equals(other.reservationsDaily, reservationsDaily) &&
            const DeepCollectionEquality()
                .equals(other.reviewsDaily, reviewsDaily) &&
            const DeepCollectionEquality()
                .equals(other.favoritesDaily, favoritesDaily) &&
            const DeepCollectionEquality()
                .equals(other.eventsDaily, eventsDaily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reservationsDaily),
      const DeepCollectionEquality().hash(reviewsDaily),
      const DeepCollectionEquality().hash(favoritesDaily),
      const DeepCollectionEquality().hash(eventsDaily));

  @override
  String toString() {
    return 'DailySeriesDM(reservationsDaily: $reservationsDaily, reviewsDaily: $reviewsDaily, favoritesDaily: $favoritesDaily, eventsDaily: $eventsDaily)';
  }
}

/// @nodoc
abstract mixin class $DailySeriesDMCopyWith<$Res> {
  factory $DailySeriesDMCopyWith(
          DailySeriesDM value, $Res Function(DailySeriesDM) _then) =
      _$DailySeriesDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_daily')
      List<DailyPointDM> reservationsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'favorites_daily') List<DailyPointDM> favoritesDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class _$DailySeriesDMCopyWithImpl<$Res>
    implements $DailySeriesDMCopyWith<$Res> {
  _$DailySeriesDMCopyWithImpl(this._self, this._then);

  final DailySeriesDM _self;
  final $Res Function(DailySeriesDM) _then;

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationsDaily = null,
    Object? reviewsDaily = null,
    Object? favoritesDaily = null,
    Object? eventsDaily = null,
  }) {
    return _then(_self.copyWith(
      reservationsDaily: null == reservationsDaily
          ? _self.reservationsDaily
          : reservationsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _self.reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      favoritesDaily: null == favoritesDaily
          ? _self.favoritesDaily
          : favoritesDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _self.eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DailySeriesDM].
extension DailySeriesDMPatterns on DailySeriesDM {
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
    TResult Function(_DailySeriesDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailySeriesDM() when $default != null:
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
    TResult Function(_DailySeriesDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySeriesDM():
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
    TResult? Function(_DailySeriesDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySeriesDM() when $default != null:
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
            @JsonKey(name: 'reservations_daily')
            List<DailyPointDM> reservationsDaily,
            @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
            @JsonKey(name: 'favorites_daily') List<DailyPointDM> favoritesDaily,
            @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailySeriesDM() when $default != null:
        return $default(_that.reservationsDaily, _that.reviewsDaily,
            _that.favoritesDaily, _that.eventsDaily);
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
            @JsonKey(name: 'reservations_daily')
            List<DailyPointDM> reservationsDaily,
            @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
            @JsonKey(name: 'favorites_daily') List<DailyPointDM> favoritesDaily,
            @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySeriesDM():
        return $default(_that.reservationsDaily, _that.reviewsDaily,
            _that.favoritesDaily, _that.eventsDaily);
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
            @JsonKey(name: 'reservations_daily')
            List<DailyPointDM> reservationsDaily,
            @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
            @JsonKey(name: 'favorites_daily') List<DailyPointDM> favoritesDaily,
            @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailySeriesDM() when $default != null:
        return $default(_that.reservationsDaily, _that.reviewsDaily,
            _that.favoritesDaily, _that.eventsDaily);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailySeriesDM implements DailySeriesDM {
  const _DailySeriesDM(
      {@JsonKey(name: 'reservations_daily')
      final List<DailyPointDM> reservationsDaily = const [],
      @JsonKey(name: 'reviews_daily')
      final List<DailyPointDM> reviewsDaily = const [],
      @JsonKey(name: 'favorites_daily')
      final List<DailyPointDM> favoritesDaily = const [],
      @JsonKey(name: 'events_daily')
      final List<DailyPointDM> eventsDaily = const []})
      : _reservationsDaily = reservationsDaily,
        _reviewsDaily = reviewsDaily,
        _favoritesDaily = favoritesDaily,
        _eventsDaily = eventsDaily;
  factory _DailySeriesDM.fromJson(Map<String, dynamic> json) =>
      _$DailySeriesDMFromJson(json);

  final List<DailyPointDM> _reservationsDaily;
  @override
  @JsonKey(name: 'reservations_daily')
  List<DailyPointDM> get reservationsDaily {
    if (_reservationsDaily is EqualUnmodifiableListView)
      return _reservationsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationsDaily);
  }

  final List<DailyPointDM> _reviewsDaily;
  @override
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily {
    if (_reviewsDaily is EqualUnmodifiableListView) return _reviewsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewsDaily);
  }

  final List<DailyPointDM> _favoritesDaily;
  @override
  @JsonKey(name: 'favorites_daily')
  List<DailyPointDM> get favoritesDaily {
    if (_favoritesDaily is EqualUnmodifiableListView) return _favoritesDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritesDaily);
  }

  final List<DailyPointDM> _eventsDaily;
  @override
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily {
    if (_eventsDaily is EqualUnmodifiableListView) return _eventsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventsDaily);
  }

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailySeriesDMCopyWith<_DailySeriesDM> get copyWith =>
      __$DailySeriesDMCopyWithImpl<_DailySeriesDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailySeriesDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailySeriesDM &&
            const DeepCollectionEquality()
                .equals(other._reservationsDaily, _reservationsDaily) &&
            const DeepCollectionEquality()
                .equals(other._reviewsDaily, _reviewsDaily) &&
            const DeepCollectionEquality()
                .equals(other._favoritesDaily, _favoritesDaily) &&
            const DeepCollectionEquality()
                .equals(other._eventsDaily, _eventsDaily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservationsDaily),
      const DeepCollectionEquality().hash(_reviewsDaily),
      const DeepCollectionEquality().hash(_favoritesDaily),
      const DeepCollectionEquality().hash(_eventsDaily));

  @override
  String toString() {
    return 'DailySeriesDM(reservationsDaily: $reservationsDaily, reviewsDaily: $reviewsDaily, favoritesDaily: $favoritesDaily, eventsDaily: $eventsDaily)';
  }
}

/// @nodoc
abstract mixin class _$DailySeriesDMCopyWith<$Res>
    implements $DailySeriesDMCopyWith<$Res> {
  factory _$DailySeriesDMCopyWith(
          _DailySeriesDM value, $Res Function(_DailySeriesDM) _then) =
      __$DailySeriesDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_daily')
      List<DailyPointDM> reservationsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'favorites_daily') List<DailyPointDM> favoritesDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class __$DailySeriesDMCopyWithImpl<$Res>
    implements _$DailySeriesDMCopyWith<$Res> {
  __$DailySeriesDMCopyWithImpl(this._self, this._then);

  final _DailySeriesDM _self;
  final $Res Function(_DailySeriesDM) _then;

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservationsDaily = null,
    Object? reviewsDaily = null,
    Object? favoritesDaily = null,
    Object? eventsDaily = null,
  }) {
    return _then(_DailySeriesDM(
      reservationsDaily: null == reservationsDaily
          ? _self._reservationsDaily
          : reservationsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _self._reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      favoritesDaily: null == favoritesDaily
          ? _self._favoritesDaily
          : favoritesDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _self._eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ));
  }
}

/// @nodoc
mixin _$DailyPointDM {
  String get date;
  int get value;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyPointDMCopyWith<DailyPointDM> get copyWith =>
      _$DailyPointDMCopyWithImpl<DailyPointDM>(
          this as DailyPointDM, _$identity);

  /// Serializes this DailyPointDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyPointDM &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, value);

  @override
  String toString() {
    return 'DailyPointDM(date: $date, value: $value)';
  }
}

/// @nodoc
abstract mixin class $DailyPointDMCopyWith<$Res> {
  factory $DailyPointDMCopyWith(
          DailyPointDM value, $Res Function(DailyPointDM) _then) =
      _$DailyPointDMCopyWithImpl;
  @useResult
  $Res call({String date, int value});
}

/// @nodoc
class _$DailyPointDMCopyWithImpl<$Res> implements $DailyPointDMCopyWith<$Res> {
  _$DailyPointDMCopyWithImpl(this._self, this._then);

  final DailyPointDM _self;
  final $Res Function(DailyPointDM) _then;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DailyPointDM].
extension DailyPointDMPatterns on DailyPointDM {
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
    TResult Function(_DailyPointDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyPointDM() when $default != null:
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
    TResult Function(_DailyPointDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPointDM():
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
    TResult? Function(_DailyPointDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPointDM() when $default != null:
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
    TResult Function(String date, int value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyPointDM() when $default != null:
        return $default(_that.date, _that.value);
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
    TResult Function(String date, int value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPointDM():
        return $default(_that.date, _that.value);
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
    TResult? Function(String date, int value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPointDM() when $default != null:
        return $default(_that.date, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailyPointDM implements DailyPointDM {
  const _DailyPointDM({this.date = '', this.value = 0});
  factory _DailyPointDM.fromJson(Map<String, dynamic> json) =>
      _$DailyPointDMFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final int value;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyPointDMCopyWith<_DailyPointDM> get copyWith =>
      __$DailyPointDMCopyWithImpl<_DailyPointDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyPointDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyPointDM &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, value);

  @override
  String toString() {
    return 'DailyPointDM(date: $date, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DailyPointDMCopyWith<$Res>
    implements $DailyPointDMCopyWith<$Res> {
  factory _$DailyPointDMCopyWith(
          _DailyPointDM value, $Res Function(_DailyPointDM) _then) =
      __$DailyPointDMCopyWithImpl;
  @override
  @useResult
  $Res call({String date, int value});
}

/// @nodoc
class __$DailyPointDMCopyWithImpl<$Res>
    implements _$DailyPointDMCopyWith<$Res> {
  __$DailyPointDMCopyWithImpl(this._self, this._then);

  final _DailyPointDM _self;
  final $Res Function(_DailyPointDM) _then;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_DailyPointDM(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$BreakdownsDM {
  @JsonKey(name: 'reservations_by_status', fromJson: parseBreakdownMapOrList)
  List<BreakdownItemDM> get reservationsByStatus;
  @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
  List<BreakdownItemDM> get topEventTypes;

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BreakdownsDMCopyWith<BreakdownsDM> get copyWith =>
      _$BreakdownsDMCopyWithImpl<BreakdownsDM>(
          this as BreakdownsDM, _$identity);

  /// Serializes this BreakdownsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BreakdownsDM &&
            const DeepCollectionEquality()
                .equals(other.reservationsByStatus, reservationsByStatus) &&
            const DeepCollectionEquality()
                .equals(other.topEventTypes, topEventTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reservationsByStatus),
      const DeepCollectionEquality().hash(topEventTypes));

  @override
  String toString() {
    return 'BreakdownsDM(reservationsByStatus: $reservationsByStatus, topEventTypes: $topEventTypes)';
  }
}

/// @nodoc
abstract mixin class $BreakdownsDMCopyWith<$Res> {
  factory $BreakdownsDMCopyWith(
          BreakdownsDM value, $Res Function(BreakdownsDM) _then) =
      _$BreakdownsDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'reservations_by_status', fromJson: parseBreakdownMapOrList)
      List<BreakdownItemDM> reservationsByStatus,
      @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
      List<BreakdownItemDM> topEventTypes});
}

/// @nodoc
class _$BreakdownsDMCopyWithImpl<$Res> implements $BreakdownsDMCopyWith<$Res> {
  _$BreakdownsDMCopyWithImpl(this._self, this._then);

  final BreakdownsDM _self;
  final $Res Function(BreakdownsDM) _then;

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationsByStatus = null,
    Object? topEventTypes = null,
  }) {
    return _then(_self.copyWith(
      reservationsByStatus: null == reservationsByStatus
          ? _self.reservationsByStatus
          : reservationsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topEventTypes: null == topEventTypes
          ? _self.topEventTypes
          : topEventTypes // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BreakdownsDM].
extension BreakdownsDMPatterns on BreakdownsDM {
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
    TResult Function(_BreakdownsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BreakdownsDM() when $default != null:
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
    TResult Function(_BreakdownsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownsDM():
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
    TResult? Function(_BreakdownsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownsDM() when $default != null:
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
            @JsonKey(
                name: 'reservations_by_status',
                fromJson: parseBreakdownMapOrList)
            List<BreakdownItemDM> reservationsByStatus,
            @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
            List<BreakdownItemDM> topEventTypes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BreakdownsDM() when $default != null:
        return $default(_that.reservationsByStatus, _that.topEventTypes);
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
            @JsonKey(
                name: 'reservations_by_status',
                fromJson: parseBreakdownMapOrList)
            List<BreakdownItemDM> reservationsByStatus,
            @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
            List<BreakdownItemDM> topEventTypes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownsDM():
        return $default(_that.reservationsByStatus, _that.topEventTypes);
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
            @JsonKey(
                name: 'reservations_by_status',
                fromJson: parseBreakdownMapOrList)
            List<BreakdownItemDM> reservationsByStatus,
            @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
            List<BreakdownItemDM> topEventTypes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownsDM() when $default != null:
        return $default(_that.reservationsByStatus, _that.topEventTypes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BreakdownsDM implements BreakdownsDM {
  const _BreakdownsDM(
      {@JsonKey(
          name: 'reservations_by_status', fromJson: parseBreakdownMapOrList)
      final List<BreakdownItemDM> reservationsByStatus = const [],
      @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
      final List<BreakdownItemDM> topEventTypes = const []})
      : _reservationsByStatus = reservationsByStatus,
        _topEventTypes = topEventTypes;
  factory _BreakdownsDM.fromJson(Map<String, dynamic> json) =>
      _$BreakdownsDMFromJson(json);

  final List<BreakdownItemDM> _reservationsByStatus;
  @override
  @JsonKey(name: 'reservations_by_status', fromJson: parseBreakdownMapOrList)
  List<BreakdownItemDM> get reservationsByStatus {
    if (_reservationsByStatus is EqualUnmodifiableListView)
      return _reservationsByStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationsByStatus);
  }

  final List<BreakdownItemDM> _topEventTypes;
  @override
  @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
  List<BreakdownItemDM> get topEventTypes {
    if (_topEventTypes is EqualUnmodifiableListView) return _topEventTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topEventTypes);
  }

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BreakdownsDMCopyWith<_BreakdownsDM> get copyWith =>
      __$BreakdownsDMCopyWithImpl<_BreakdownsDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BreakdownsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BreakdownsDM &&
            const DeepCollectionEquality()
                .equals(other._reservationsByStatus, _reservationsByStatus) &&
            const DeepCollectionEquality()
                .equals(other._topEventTypes, _topEventTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservationsByStatus),
      const DeepCollectionEquality().hash(_topEventTypes));

  @override
  String toString() {
    return 'BreakdownsDM(reservationsByStatus: $reservationsByStatus, topEventTypes: $topEventTypes)';
  }
}

/// @nodoc
abstract mixin class _$BreakdownsDMCopyWith<$Res>
    implements $BreakdownsDMCopyWith<$Res> {
  factory _$BreakdownsDMCopyWith(
          _BreakdownsDM value, $Res Function(_BreakdownsDM) _then) =
      __$BreakdownsDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'reservations_by_status', fromJson: parseBreakdownMapOrList)
      List<BreakdownItemDM> reservationsByStatus,
      @JsonKey(name: 'top_event_types', fromJson: parseEventTypes)
      List<BreakdownItemDM> topEventTypes});
}

/// @nodoc
class __$BreakdownsDMCopyWithImpl<$Res>
    implements _$BreakdownsDMCopyWith<$Res> {
  __$BreakdownsDMCopyWithImpl(this._self, this._then);

  final _BreakdownsDM _self;
  final $Res Function(_BreakdownsDM) _then;

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservationsByStatus = null,
    Object? topEventTypes = null,
  }) {
    return _then(_BreakdownsDM(
      reservationsByStatus: null == reservationsByStatus
          ? _self._reservationsByStatus
          : reservationsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topEventTypes: null == topEventTypes
          ? _self._topEventTypes
          : topEventTypes // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
    ));
  }
}

/// @nodoc
mixin _$BreakdownItemDM {
  String get label;
  int get value;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BreakdownItemDMCopyWith<BreakdownItemDM> get copyWith =>
      _$BreakdownItemDMCopyWithImpl<BreakdownItemDM>(
          this as BreakdownItemDM, _$identity);

  /// Serializes this BreakdownItemDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BreakdownItemDM &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @override
  String toString() {
    return 'BreakdownItemDM(label: $label, value: $value)';
  }
}

/// @nodoc
abstract mixin class $BreakdownItemDMCopyWith<$Res> {
  factory $BreakdownItemDMCopyWith(
          BreakdownItemDM value, $Res Function(BreakdownItemDM) _then) =
      _$BreakdownItemDMCopyWithImpl;
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class _$BreakdownItemDMCopyWithImpl<$Res>
    implements $BreakdownItemDMCopyWith<$Res> {
  _$BreakdownItemDMCopyWithImpl(this._self, this._then);

  final BreakdownItemDM _self;
  final $Res Function(BreakdownItemDM) _then;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [BreakdownItemDM].
extension BreakdownItemDMPatterns on BreakdownItemDM {
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
    TResult Function(_BreakdownItemDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BreakdownItemDM() when $default != null:
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
    TResult Function(_BreakdownItemDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownItemDM():
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
    TResult? Function(_BreakdownItemDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownItemDM() when $default != null:
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
    TResult Function(String label, int value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BreakdownItemDM() when $default != null:
        return $default(_that.label, _that.value);
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
    TResult Function(String label, int value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownItemDM():
        return $default(_that.label, _that.value);
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
    TResult? Function(String label, int value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BreakdownItemDM() when $default != null:
        return $default(_that.label, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BreakdownItemDM implements BreakdownItemDM {
  const _BreakdownItemDM({this.label = '', this.value = 0});
  factory _BreakdownItemDM.fromJson(Map<String, dynamic> json) =>
      _$BreakdownItemDMFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final int value;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BreakdownItemDMCopyWith<_BreakdownItemDM> get copyWith =>
      __$BreakdownItemDMCopyWithImpl<_BreakdownItemDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BreakdownItemDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BreakdownItemDM &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @override
  String toString() {
    return 'BreakdownItemDM(label: $label, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$BreakdownItemDMCopyWith<$Res>
    implements $BreakdownItemDMCopyWith<$Res> {
  factory _$BreakdownItemDMCopyWith(
          _BreakdownItemDM value, $Res Function(_BreakdownItemDM) _then) =
      __$BreakdownItemDMCopyWithImpl;
  @override
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class __$BreakdownItemDMCopyWithImpl<$Res>
    implements _$BreakdownItemDMCopyWith<$Res> {
  __$BreakdownItemDMCopyWithImpl(this._self, this._then);

  final _BreakdownItemDM _self;
  final $Res Function(_BreakdownItemDM) _then;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_BreakdownItemDM(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
