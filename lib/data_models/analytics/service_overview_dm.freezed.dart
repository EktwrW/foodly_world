// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_overview_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceOverviewResponseDM {
  bool get success;
  ServiceOverviewDataDM? get data;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceOverviewResponseDMCopyWith<ServiceOverviewResponseDM> get copyWith =>
      _$ServiceOverviewResponseDMCopyWithImpl<ServiceOverviewResponseDM>(
          this as ServiceOverviewResponseDM, _$identity);

  /// Serializes this ServiceOverviewResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceOverviewResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @override
  String toString() {
    return 'ServiceOverviewResponseDM(success: $success, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ServiceOverviewResponseDMCopyWith<$Res> {
  factory $ServiceOverviewResponseDMCopyWith(ServiceOverviewResponseDM value,
          $Res Function(ServiceOverviewResponseDM) _then) =
      _$ServiceOverviewResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, ServiceOverviewDataDM? data});

  $ServiceOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$ServiceOverviewResponseDMCopyWithImpl<$Res>
    implements $ServiceOverviewResponseDMCopyWith<$Res> {
  _$ServiceOverviewResponseDMCopyWithImpl(this._self, this._then);

  final ServiceOverviewResponseDM _self;
  final $Res Function(ServiceOverviewResponseDM) _then;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
    ));
  }

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ServiceOverviewDataDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServiceOverviewResponseDM].
extension ServiceOverviewResponseDMPatterns on ServiceOverviewResponseDM {
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
    TResult Function(_ServiceOverviewResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewResponseDM() when $default != null:
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
    TResult Function(_ServiceOverviewResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewResponseDM():
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
    TResult? Function(_ServiceOverviewResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewResponseDM() when $default != null:
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
    TResult Function(bool success, ServiceOverviewDataDM? data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewResponseDM() when $default != null:
        return $default(_that.success, _that.data);
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
    TResult Function(bool success, ServiceOverviewDataDM? data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewResponseDM():
        return $default(_that.success, _that.data);
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
    TResult? Function(bool success, ServiceOverviewDataDM? data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewResponseDM() when $default != null:
        return $default(_that.success, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceOverviewResponseDM implements ServiceOverviewResponseDM {
  const _ServiceOverviewResponseDM({this.success = false, this.data});
  factory _ServiceOverviewResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceOverviewResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final ServiceOverviewDataDM? data;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceOverviewResponseDMCopyWith<_ServiceOverviewResponseDM>
      get copyWith =>
          __$ServiceOverviewResponseDMCopyWithImpl<_ServiceOverviewResponseDM>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceOverviewResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceOverviewResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @override
  String toString() {
    return 'ServiceOverviewResponseDM(success: $success, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ServiceOverviewResponseDMCopyWith<$Res>
    implements $ServiceOverviewResponseDMCopyWith<$Res> {
  factory _$ServiceOverviewResponseDMCopyWith(_ServiceOverviewResponseDM value,
          $Res Function(_ServiceOverviewResponseDM) _then) =
      __$ServiceOverviewResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, ServiceOverviewDataDM? data});

  @override
  $ServiceOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$ServiceOverviewResponseDMCopyWithImpl<$Res>
    implements _$ServiceOverviewResponseDMCopyWith<$Res> {
  __$ServiceOverviewResponseDMCopyWithImpl(this._self, this._then);

  final _ServiceOverviewResponseDM _self;
  final $Res Function(_ServiceOverviewResponseDM) _then;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_ServiceOverviewResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
    ));
  }

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ServiceOverviewDataDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$ServiceOverviewDataDM {
  AnalyticsScopeDM? get scope;
  ServiceKpisDM? get kpis;
  ServiceFunnelDM? get funnel;
  ServiceDailySeriesDM? get series;
  ServiceBreakdownsDM? get breakdowns;
  AnalyticsMetaDM? get meta;

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<ServiceOverviewDataDM> get copyWith =>
      _$ServiceOverviewDataDMCopyWithImpl<ServiceOverviewDataDM>(
          this as ServiceOverviewDataDM, _$identity);

  /// Serializes this ServiceOverviewDataDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceOverviewDataDM &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.kpis, kpis) || other.kpis == kpis) &&
            (identical(other.funnel, funnel) || other.funnel == funnel) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.breakdowns, breakdowns) ||
                other.breakdowns == breakdowns) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, scope, kpis, funnel, series, breakdowns, meta);

  @override
  String toString() {
    return 'ServiceOverviewDataDM(scope: $scope, kpis: $kpis, funnel: $funnel, series: $series, breakdowns: $breakdowns, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $ServiceOverviewDataDMCopyWith<$Res> {
  factory $ServiceOverviewDataDMCopyWith(ServiceOverviewDataDM value,
          $Res Function(ServiceOverviewDataDM) _then) =
      _$ServiceOverviewDataDMCopyWithImpl;
  @useResult
  $Res call(
      {AnalyticsScopeDM? scope,
      ServiceKpisDM? kpis,
      ServiceFunnelDM? funnel,
      ServiceDailySeriesDM? series,
      ServiceBreakdownsDM? breakdowns,
      AnalyticsMetaDM? meta});

  $AnalyticsScopeDMCopyWith<$Res>? get scope;
  $ServiceKpisDMCopyWith<$Res>? get kpis;
  $ServiceFunnelDMCopyWith<$Res>? get funnel;
  $ServiceDailySeriesDMCopyWith<$Res>? get series;
  $ServiceBreakdownsDMCopyWith<$Res>? get breakdowns;
  $AnalyticsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ServiceOverviewDataDMCopyWithImpl<$Res>
    implements $ServiceOverviewDataDMCopyWith<$Res> {
  _$ServiceOverviewDataDMCopyWithImpl(this._self, this._then);

  final ServiceOverviewDataDM _self;
  final $Res Function(ServiceOverviewDataDM) _then;

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scope = freezed,
    Object? kpis = freezed,
    Object? funnel = freezed,
    Object? series = freezed,
    Object? breakdowns = freezed,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      scope: freezed == scope
          ? _self.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as AnalyticsScopeDM?,
      kpis: freezed == kpis
          ? _self.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as ServiceKpisDM?,
      funnel: freezed == funnel
          ? _self.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelDM?,
      series: freezed == series
          ? _self.series
          : series // ignore: cast_nullable_to_non_nullable
              as ServiceDailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _self.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as ServiceBreakdownsDM?,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AnalyticsMetaDM?,
    ));
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsScopeDMCopyWith<$Res>? get scope {
    if (_self.scope == null) {
      return null;
    }

    return $AnalyticsScopeDMCopyWith<$Res>(_self.scope!, (value) {
      return _then(_self.copyWith(scope: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceKpisDMCopyWith<$Res>? get kpis {
    if (_self.kpis == null) {
      return null;
    }

    return $ServiceKpisDMCopyWith<$Res>(_self.kpis!, (value) {
      return _then(_self.copyWith(kpis: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceFunnelDMCopyWith<$Res>? get funnel {
    if (_self.funnel == null) {
      return null;
    }

    return $ServiceFunnelDMCopyWith<$Res>(_self.funnel!, (value) {
      return _then(_self.copyWith(funnel: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceDailySeriesDMCopyWith<$Res>? get series {
    if (_self.series == null) {
      return null;
    }

    return $ServiceDailySeriesDMCopyWith<$Res>(_self.series!, (value) {
      return _then(_self.copyWith(series: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceBreakdownsDMCopyWith<$Res>? get breakdowns {
    if (_self.breakdowns == null) {
      return null;
    }

    return $ServiceBreakdownsDMCopyWith<$Res>(_self.breakdowns!, (value) {
      return _then(_self.copyWith(breakdowns: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $AnalyticsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServiceOverviewDataDM].
extension ServiceOverviewDataDMPatterns on ServiceOverviewDataDM {
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
    TResult Function(_ServiceOverviewDataDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewDataDM() when $default != null:
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
    TResult Function(_ServiceOverviewDataDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewDataDM():
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
    TResult? Function(_ServiceOverviewDataDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewDataDM() when $default != null:
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
            AnalyticsScopeDM? scope,
            ServiceKpisDM? kpis,
            ServiceFunnelDM? funnel,
            ServiceDailySeriesDM? series,
            ServiceBreakdownsDM? breakdowns,
            AnalyticsMetaDM? meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewDataDM() when $default != null:
        return $default(_that.scope, _that.kpis, _that.funnel, _that.series,
            _that.breakdowns, _that.meta);
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
            AnalyticsScopeDM? scope,
            ServiceKpisDM? kpis,
            ServiceFunnelDM? funnel,
            ServiceDailySeriesDM? series,
            ServiceBreakdownsDM? breakdowns,
            AnalyticsMetaDM? meta)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewDataDM():
        return $default(_that.scope, _that.kpis, _that.funnel, _that.series,
            _that.breakdowns, _that.meta);
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
            AnalyticsScopeDM? scope,
            ServiceKpisDM? kpis,
            ServiceFunnelDM? funnel,
            ServiceDailySeriesDM? series,
            ServiceBreakdownsDM? breakdowns,
            AnalyticsMetaDM? meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceOverviewDataDM() when $default != null:
        return $default(_that.scope, _that.kpis, _that.funnel, _that.series,
            _that.breakdowns, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceOverviewDataDM implements ServiceOverviewDataDM {
  const _ServiceOverviewDataDM(
      {this.scope,
      this.kpis,
      this.funnel,
      this.series,
      this.breakdowns,
      this.meta});
  factory _ServiceOverviewDataDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceOverviewDataDMFromJson(json);

  @override
  final AnalyticsScopeDM? scope;
  @override
  final ServiceKpisDM? kpis;
  @override
  final ServiceFunnelDM? funnel;
  @override
  final ServiceDailySeriesDM? series;
  @override
  final ServiceBreakdownsDM? breakdowns;
  @override
  final AnalyticsMetaDM? meta;

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceOverviewDataDMCopyWith<_ServiceOverviewDataDM> get copyWith =>
      __$ServiceOverviewDataDMCopyWithImpl<_ServiceOverviewDataDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceOverviewDataDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceOverviewDataDM &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.kpis, kpis) || other.kpis == kpis) &&
            (identical(other.funnel, funnel) || other.funnel == funnel) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.breakdowns, breakdowns) ||
                other.breakdowns == breakdowns) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, scope, kpis, funnel, series, breakdowns, meta);

  @override
  String toString() {
    return 'ServiceOverviewDataDM(scope: $scope, kpis: $kpis, funnel: $funnel, series: $series, breakdowns: $breakdowns, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$ServiceOverviewDataDMCopyWith<$Res>
    implements $ServiceOverviewDataDMCopyWith<$Res> {
  factory _$ServiceOverviewDataDMCopyWith(_ServiceOverviewDataDM value,
          $Res Function(_ServiceOverviewDataDM) _then) =
      __$ServiceOverviewDataDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AnalyticsScopeDM? scope,
      ServiceKpisDM? kpis,
      ServiceFunnelDM? funnel,
      ServiceDailySeriesDM? series,
      ServiceBreakdownsDM? breakdowns,
      AnalyticsMetaDM? meta});

  @override
  $AnalyticsScopeDMCopyWith<$Res>? get scope;
  @override
  $ServiceKpisDMCopyWith<$Res>? get kpis;
  @override
  $ServiceFunnelDMCopyWith<$Res>? get funnel;
  @override
  $ServiceDailySeriesDMCopyWith<$Res>? get series;
  @override
  $ServiceBreakdownsDMCopyWith<$Res>? get breakdowns;
  @override
  $AnalyticsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$ServiceOverviewDataDMCopyWithImpl<$Res>
    implements _$ServiceOverviewDataDMCopyWith<$Res> {
  __$ServiceOverviewDataDMCopyWithImpl(this._self, this._then);

  final _ServiceOverviewDataDM _self;
  final $Res Function(_ServiceOverviewDataDM) _then;

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? scope = freezed,
    Object? kpis = freezed,
    Object? funnel = freezed,
    Object? series = freezed,
    Object? breakdowns = freezed,
    Object? meta = freezed,
  }) {
    return _then(_ServiceOverviewDataDM(
      scope: freezed == scope
          ? _self.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as AnalyticsScopeDM?,
      kpis: freezed == kpis
          ? _self.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as ServiceKpisDM?,
      funnel: freezed == funnel
          ? _self.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelDM?,
      series: freezed == series
          ? _self.series
          : series // ignore: cast_nullable_to_non_nullable
              as ServiceDailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _self.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as ServiceBreakdownsDM?,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AnalyticsMetaDM?,
    ));
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsScopeDMCopyWith<$Res>? get scope {
    if (_self.scope == null) {
      return null;
    }

    return $AnalyticsScopeDMCopyWith<$Res>(_self.scope!, (value) {
      return _then(_self.copyWith(scope: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceKpisDMCopyWith<$Res>? get kpis {
    if (_self.kpis == null) {
      return null;
    }

    return $ServiceKpisDMCopyWith<$Res>(_self.kpis!, (value) {
      return _then(_self.copyWith(kpis: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceFunnelDMCopyWith<$Res>? get funnel {
    if (_self.funnel == null) {
      return null;
    }

    return $ServiceFunnelDMCopyWith<$Res>(_self.funnel!, (value) {
      return _then(_self.copyWith(funnel: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceDailySeriesDMCopyWith<$Res>? get series {
    if (_self.series == null) {
      return null;
    }

    return $ServiceDailySeriesDMCopyWith<$Res>(_self.series!, (value) {
      return _then(_self.copyWith(series: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceBreakdownsDMCopyWith<$Res>? get breakdowns {
    if (_self.breakdowns == null) {
      return null;
    }

    return $ServiceBreakdownsDMCopyWith<$Res>(_self.breakdowns!, (value) {
      return _then(_self.copyWith(breakdowns: value));
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $AnalyticsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$AnalyticsScopeDM {
  AnalyticsPeriodDM? get period;
  List<AnalyticsBusinessRefDM> get businesses;

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsScopeDMCopyWith<AnalyticsScopeDM> get copyWith =>
      _$AnalyticsScopeDMCopyWithImpl<AnalyticsScopeDM>(
          this as AnalyticsScopeDM, _$identity);

  /// Serializes this AnalyticsScopeDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsScopeDM &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other.businesses, businesses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, period, const DeepCollectionEquality().hash(businesses));

  @override
  String toString() {
    return 'AnalyticsScopeDM(period: $period, businesses: $businesses)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsScopeDMCopyWith<$Res> {
  factory $AnalyticsScopeDMCopyWith(
          AnalyticsScopeDM value, $Res Function(AnalyticsScopeDM) _then) =
      _$AnalyticsScopeDMCopyWithImpl;
  @useResult
  $Res call(
      {AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses});

  $AnalyticsPeriodDMCopyWith<$Res>? get period;
}

/// @nodoc
class _$AnalyticsScopeDMCopyWithImpl<$Res>
    implements $AnalyticsScopeDMCopyWith<$Res> {
  _$AnalyticsScopeDMCopyWithImpl(this._self, this._then);

  final AnalyticsScopeDM _self;
  final $Res Function(AnalyticsScopeDM) _then;

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? businesses = null,
  }) {
    return _then(_self.copyWith(
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriodDM?,
      businesses: null == businesses
          ? _self.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsBusinessRefDM>,
    ));
  }

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodDMCopyWith<$Res>? get period {
    if (_self.period == null) {
      return null;
    }

    return $AnalyticsPeriodDMCopyWith<$Res>(_self.period!, (value) {
      return _then(_self.copyWith(period: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AnalyticsScopeDM].
extension AnalyticsScopeDMPatterns on AnalyticsScopeDM {
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
    TResult Function(_AnalyticsScopeDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsScopeDM() when $default != null:
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
    TResult Function(_AnalyticsScopeDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsScopeDM():
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
    TResult? Function(_AnalyticsScopeDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsScopeDM() when $default != null:
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
            AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsScopeDM() when $default != null:
        return $default(_that.period, _that.businesses);
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
            AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsScopeDM():
        return $default(_that.period, _that.businesses);
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
            AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsScopeDM() when $default != null:
        return $default(_that.period, _that.businesses);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AnalyticsScopeDM implements AnalyticsScopeDM {
  const _AnalyticsScopeDM(
      {this.period, final List<AnalyticsBusinessRefDM> businesses = const []})
      : _businesses = businesses;
  factory _AnalyticsScopeDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsScopeDMFromJson(json);

  @override
  final AnalyticsPeriodDM? period;
  final List<AnalyticsBusinessRefDM> _businesses;
  @override
  @JsonKey()
  List<AnalyticsBusinessRefDM> get businesses {
    if (_businesses is EqualUnmodifiableListView) return _businesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businesses);
  }

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsScopeDMCopyWith<_AnalyticsScopeDM> get copyWith =>
      __$AnalyticsScopeDMCopyWithImpl<_AnalyticsScopeDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnalyticsScopeDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsScopeDM &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._businesses, _businesses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, period, const DeepCollectionEquality().hash(_businesses));

  @override
  String toString() {
    return 'AnalyticsScopeDM(period: $period, businesses: $businesses)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsScopeDMCopyWith<$Res>
    implements $AnalyticsScopeDMCopyWith<$Res> {
  factory _$AnalyticsScopeDMCopyWith(
          _AnalyticsScopeDM value, $Res Function(_AnalyticsScopeDM) _then) =
      __$AnalyticsScopeDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses});

  @override
  $AnalyticsPeriodDMCopyWith<$Res>? get period;
}

/// @nodoc
class __$AnalyticsScopeDMCopyWithImpl<$Res>
    implements _$AnalyticsScopeDMCopyWith<$Res> {
  __$AnalyticsScopeDMCopyWithImpl(this._self, this._then);

  final _AnalyticsScopeDM _self;
  final $Res Function(_AnalyticsScopeDM) _then;

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? period = freezed,
    Object? businesses = null,
  }) {
    return _then(_AnalyticsScopeDM(
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriodDM?,
      businesses: null == businesses
          ? _self._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsBusinessRefDM>,
    ));
  }

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodDMCopyWith<$Res>? get period {
    if (_self.period == null) {
      return null;
    }

    return $AnalyticsPeriodDMCopyWith<$Res>(_self.period!, (value) {
      return _then(_self.copyWith(period: value));
    });
  }
}

/// @nodoc
mixin _$AnalyticsPeriodDM {
  int get days;
  String get start;
  String get end;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodDMCopyWith<AnalyticsPeriodDM> get copyWith =>
      _$AnalyticsPeriodDMCopyWithImpl<AnalyticsPeriodDM>(
          this as AnalyticsPeriodDM, _$identity);

  /// Serializes this AnalyticsPeriodDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsPeriodDM &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, days, start, end);

  @override
  String toString() {
    return 'AnalyticsPeriodDM(days: $days, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsPeriodDMCopyWith<$Res> {
  factory $AnalyticsPeriodDMCopyWith(
          AnalyticsPeriodDM value, $Res Function(AnalyticsPeriodDM) _then) =
      _$AnalyticsPeriodDMCopyWithImpl;
  @useResult
  $Res call({int days, String start, String end});
}

/// @nodoc
class _$AnalyticsPeriodDMCopyWithImpl<$Res>
    implements $AnalyticsPeriodDMCopyWith<$Res> {
  _$AnalyticsPeriodDMCopyWithImpl(this._self, this._then);

  final AnalyticsPeriodDM _self;
  final $Res Function(AnalyticsPeriodDM) _then;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AnalyticsPeriodDM].
extension AnalyticsPeriodDMPatterns on AnalyticsPeriodDM {
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
    TResult Function(_AnalyticsPeriodDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsPeriodDM() when $default != null:
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
    TResult Function(_AnalyticsPeriodDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsPeriodDM():
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
    TResult? Function(_AnalyticsPeriodDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsPeriodDM() when $default != null:
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
    TResult Function(int days, String start, String end)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsPeriodDM() when $default != null:
        return $default(_that.days, _that.start, _that.end);
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
    TResult Function(int days, String start, String end) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsPeriodDM():
        return $default(_that.days, _that.start, _that.end);
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
    TResult? Function(int days, String start, String end)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsPeriodDM() when $default != null:
        return $default(_that.days, _that.start, _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AnalyticsPeriodDM implements AnalyticsPeriodDM {
  const _AnalyticsPeriodDM({this.days = 30, this.start = '', this.end = ''});
  factory _AnalyticsPeriodDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsPeriodDMFromJson(json);

  @override
  @JsonKey()
  final int days;
  @override
  @JsonKey()
  final String start;
  @override
  @JsonKey()
  final String end;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsPeriodDMCopyWith<_AnalyticsPeriodDM> get copyWith =>
      __$AnalyticsPeriodDMCopyWithImpl<_AnalyticsPeriodDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnalyticsPeriodDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsPeriodDM &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, days, start, end);

  @override
  String toString() {
    return 'AnalyticsPeriodDM(days: $days, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsPeriodDMCopyWith<$Res>
    implements $AnalyticsPeriodDMCopyWith<$Res> {
  factory _$AnalyticsPeriodDMCopyWith(
          _AnalyticsPeriodDM value, $Res Function(_AnalyticsPeriodDM) _then) =
      __$AnalyticsPeriodDMCopyWithImpl;
  @override
  @useResult
  $Res call({int days, String start, String end});
}

/// @nodoc
class __$AnalyticsPeriodDMCopyWithImpl<$Res>
    implements _$AnalyticsPeriodDMCopyWith<$Res> {
  __$AnalyticsPeriodDMCopyWithImpl(this._self, this._then);

  final _AnalyticsPeriodDM _self;
  final $Res Function(_AnalyticsPeriodDM) _then;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? days = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_AnalyticsPeriodDM(
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AnalyticsBusinessRefDM {
  int get id;
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @JsonKey(name: 'business_name')
  String? get businessName;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsBusinessRefDMCopyWith<AnalyticsBusinessRefDM> get copyWith =>
      _$AnalyticsBusinessRefDMCopyWithImpl<AnalyticsBusinessRefDM>(
          this as AnalyticsBusinessRefDM, _$identity);

  /// Serializes this AnalyticsBusinessRefDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsBusinessRefDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, businessUuid, businessName);

  @override
  String toString() {
    return 'AnalyticsBusinessRefDM(id: $id, businessUuid: $businessUuid, businessName: $businessName)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsBusinessRefDMCopyWith<$Res> {
  factory $AnalyticsBusinessRefDMCopyWith(AnalyticsBusinessRefDM value,
          $Res Function(AnalyticsBusinessRefDM) _then) =
      _$AnalyticsBusinessRefDMCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_name') String? businessName});
}

/// @nodoc
class _$AnalyticsBusinessRefDMCopyWithImpl<$Res>
    implements $AnalyticsBusinessRefDMCopyWith<$Res> {
  _$AnalyticsBusinessRefDMCopyWithImpl(this._self, this._then);

  final AnalyticsBusinessRefDM _self;
  final $Res Function(AnalyticsBusinessRefDM) _then;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessUuid = null,
    Object? businessName = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AnalyticsBusinessRefDM].
extension AnalyticsBusinessRefDMPatterns on AnalyticsBusinessRefDM {
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
    TResult Function(_AnalyticsBusinessRefDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsBusinessRefDM() when $default != null:
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
    TResult Function(_AnalyticsBusinessRefDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsBusinessRefDM():
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
    TResult? Function(_AnalyticsBusinessRefDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsBusinessRefDM() when $default != null:
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
            int id,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_name') String? businessName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsBusinessRefDM() when $default != null:
        return $default(_that.id, _that.businessUuid, _that.businessName);
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
            int id,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_name') String? businessName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsBusinessRefDM():
        return $default(_that.id, _that.businessUuid, _that.businessName);
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
            int id,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_name') String? businessName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsBusinessRefDM() when $default != null:
        return $default(_that.id, _that.businessUuid, _that.businessName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AnalyticsBusinessRefDM implements AnalyticsBusinessRefDM {
  const _AnalyticsBusinessRefDM(
      {this.id = 0,
      @JsonKey(name: 'business_uuid') this.businessUuid = '',
      @JsonKey(name: 'business_name') this.businessName});
  factory _AnalyticsBusinessRefDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsBusinessRefDMFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'business_uuid')
  final String businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsBusinessRefDMCopyWith<_AnalyticsBusinessRefDM> get copyWith =>
      __$AnalyticsBusinessRefDMCopyWithImpl<_AnalyticsBusinessRefDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnalyticsBusinessRefDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsBusinessRefDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, businessUuid, businessName);

  @override
  String toString() {
    return 'AnalyticsBusinessRefDM(id: $id, businessUuid: $businessUuid, businessName: $businessName)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsBusinessRefDMCopyWith<$Res>
    implements $AnalyticsBusinessRefDMCopyWith<$Res> {
  factory _$AnalyticsBusinessRefDMCopyWith(_AnalyticsBusinessRefDM value,
          $Res Function(_AnalyticsBusinessRefDM) _then) =
      __$AnalyticsBusinessRefDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_name') String? businessName});
}

/// @nodoc
class __$AnalyticsBusinessRefDMCopyWithImpl<$Res>
    implements _$AnalyticsBusinessRefDMCopyWith<$Res> {
  __$AnalyticsBusinessRefDMCopyWithImpl(this._self, this._then);

  final _AnalyticsBusinessRefDM _self;
  final $Res Function(_AnalyticsBusinessRefDM) _then;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? businessUuid = null,
    Object? businessName = freezed,
  }) {
    return _then(_AnalyticsBusinessRefDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ServiceKpisDM {
  @JsonKey(name: 'bookings_total')
  int get bookingsTotal;
  @JsonKey(name: 'booking_success_rate')
  double get bookingSuccessRate;
  @JsonKey(name: 'avg_response_hours')
  double get avgResponseHours;
  @JsonKey(name: 'availability_checks')
  int get availabilityChecks;
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

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceKpisDMCopyWith<ServiceKpisDM> get copyWith =>
      _$ServiceKpisDMCopyWithImpl<ServiceKpisDM>(
          this as ServiceKpisDM, _$identity);

  /// Serializes this ServiceKpisDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceKpisDM &&
            (identical(other.bookingsTotal, bookingsTotal) ||
                other.bookingsTotal == bookingsTotal) &&
            (identical(other.bookingSuccessRate, bookingSuccessRate) ||
                other.bookingSuccessRate == bookingSuccessRate) &&
            (identical(other.avgResponseHours, avgResponseHours) ||
                other.avgResponseHours == avgResponseHours) &&
            (identical(other.availabilityChecks, availabilityChecks) ||
                other.availabilityChecks == availabilityChecks) &&
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
      bookingsTotal,
      bookingSuccessRate,
      avgResponseHours,
      availabilityChecks,
      reviewsTotal,
      reviewsAvgRating,
      favoritesTotal,
      favoritesUniqueUsers,
      eventsTotal);

  @override
  String toString() {
    return 'ServiceKpisDM(bookingsTotal: $bookingsTotal, bookingSuccessRate: $bookingSuccessRate, avgResponseHours: $avgResponseHours, availabilityChecks: $availabilityChecks, reviewsTotal: $reviewsTotal, reviewsAvgRating: $reviewsAvgRating, favoritesTotal: $favoritesTotal, favoritesUniqueUsers: $favoritesUniqueUsers, eventsTotal: $eventsTotal)';
  }
}

/// @nodoc
abstract mixin class $ServiceKpisDMCopyWith<$Res> {
  factory $ServiceKpisDMCopyWith(
          ServiceKpisDM value, $Res Function(ServiceKpisDM) _then) =
      _$ServiceKpisDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_total') int bookingsTotal,
      @JsonKey(name: 'booking_success_rate') double bookingSuccessRate,
      @JsonKey(name: 'avg_response_hours') double avgResponseHours,
      @JsonKey(name: 'availability_checks') int availabilityChecks,
      @JsonKey(name: 'reviews_total') int reviewsTotal,
      @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
      @JsonKey(name: 'favorites_total') int favoritesTotal,
      @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
      @JsonKey(name: 'events_total') int eventsTotal});
}

/// @nodoc
class _$ServiceKpisDMCopyWithImpl<$Res>
    implements $ServiceKpisDMCopyWith<$Res> {
  _$ServiceKpisDMCopyWithImpl(this._self, this._then);

  final ServiceKpisDM _self;
  final $Res Function(ServiceKpisDM) _then;

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsTotal = null,
    Object? bookingSuccessRate = null,
    Object? avgResponseHours = null,
    Object? availabilityChecks = null,
    Object? reviewsTotal = null,
    Object? reviewsAvgRating = null,
    Object? favoritesTotal = null,
    Object? favoritesUniqueUsers = null,
    Object? eventsTotal = null,
  }) {
    return _then(_self.copyWith(
      bookingsTotal: null == bookingsTotal
          ? _self.bookingsTotal
          : bookingsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bookingSuccessRate: null == bookingSuccessRate
          ? _self.bookingSuccessRate
          : bookingSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
      avgResponseHours: null == avgResponseHours
          ? _self.avgResponseHours
          : avgResponseHours // ignore: cast_nullable_to_non_nullable
              as double,
      availabilityChecks: null == availabilityChecks
          ? _self.availabilityChecks
          : availabilityChecks // ignore: cast_nullable_to_non_nullable
              as int,
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

/// Adds pattern-matching-related methods to [ServiceKpisDM].
extension ServiceKpisDMPatterns on ServiceKpisDM {
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
    TResult Function(_ServiceKpisDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceKpisDM() when $default != null:
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
    TResult Function(_ServiceKpisDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceKpisDM():
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
    TResult? Function(_ServiceKpisDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceKpisDM() when $default != null:
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
            @JsonKey(name: 'bookings_total') int bookingsTotal,
            @JsonKey(name: 'booking_success_rate') double bookingSuccessRate,
            @JsonKey(name: 'avg_response_hours') double avgResponseHours,
            @JsonKey(name: 'availability_checks') int availabilityChecks,
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
      case _ServiceKpisDM() when $default != null:
        return $default(
            _that.bookingsTotal,
            _that.bookingSuccessRate,
            _that.avgResponseHours,
            _that.availabilityChecks,
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
            @JsonKey(name: 'bookings_total') int bookingsTotal,
            @JsonKey(name: 'booking_success_rate') double bookingSuccessRate,
            @JsonKey(name: 'avg_response_hours') double avgResponseHours,
            @JsonKey(name: 'availability_checks') int availabilityChecks,
            @JsonKey(name: 'reviews_total') int reviewsTotal,
            @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
            @JsonKey(name: 'favorites_total') int favoritesTotal,
            @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
            @JsonKey(name: 'events_total') int eventsTotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceKpisDM():
        return $default(
            _that.bookingsTotal,
            _that.bookingSuccessRate,
            _that.avgResponseHours,
            _that.availabilityChecks,
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
            @JsonKey(name: 'bookings_total') int bookingsTotal,
            @JsonKey(name: 'booking_success_rate') double bookingSuccessRate,
            @JsonKey(name: 'avg_response_hours') double avgResponseHours,
            @JsonKey(name: 'availability_checks') int availabilityChecks,
            @JsonKey(name: 'reviews_total') int reviewsTotal,
            @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
            @JsonKey(name: 'favorites_total') int favoritesTotal,
            @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
            @JsonKey(name: 'events_total') int eventsTotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceKpisDM() when $default != null:
        return $default(
            _that.bookingsTotal,
            _that.bookingSuccessRate,
            _that.avgResponseHours,
            _that.availabilityChecks,
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
class _ServiceKpisDM implements ServiceKpisDM {
  const _ServiceKpisDM(
      {@JsonKey(name: 'bookings_total') this.bookingsTotal = 0,
      @JsonKey(name: 'booking_success_rate') this.bookingSuccessRate = 0.0,
      @JsonKey(name: 'avg_response_hours') this.avgResponseHours = 0.0,
      @JsonKey(name: 'availability_checks') this.availabilityChecks = 0,
      @JsonKey(name: 'reviews_total') this.reviewsTotal = 0,
      @JsonKey(name: 'reviews_avg_rating') this.reviewsAvgRating = 0.0,
      @JsonKey(name: 'favorites_total') this.favoritesTotal = 0,
      @JsonKey(name: 'favorites_unique_users') this.favoritesUniqueUsers = 0,
      @JsonKey(name: 'events_total') this.eventsTotal = 0});
  factory _ServiceKpisDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceKpisDMFromJson(json);

  @override
  @JsonKey(name: 'bookings_total')
  final int bookingsTotal;
  @override
  @JsonKey(name: 'booking_success_rate')
  final double bookingSuccessRate;
  @override
  @JsonKey(name: 'avg_response_hours')
  final double avgResponseHours;
  @override
  @JsonKey(name: 'availability_checks')
  final int availabilityChecks;
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

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceKpisDMCopyWith<_ServiceKpisDM> get copyWith =>
      __$ServiceKpisDMCopyWithImpl<_ServiceKpisDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceKpisDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceKpisDM &&
            (identical(other.bookingsTotal, bookingsTotal) ||
                other.bookingsTotal == bookingsTotal) &&
            (identical(other.bookingSuccessRate, bookingSuccessRate) ||
                other.bookingSuccessRate == bookingSuccessRate) &&
            (identical(other.avgResponseHours, avgResponseHours) ||
                other.avgResponseHours == avgResponseHours) &&
            (identical(other.availabilityChecks, availabilityChecks) ||
                other.availabilityChecks == availabilityChecks) &&
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
      bookingsTotal,
      bookingSuccessRate,
      avgResponseHours,
      availabilityChecks,
      reviewsTotal,
      reviewsAvgRating,
      favoritesTotal,
      favoritesUniqueUsers,
      eventsTotal);

  @override
  String toString() {
    return 'ServiceKpisDM(bookingsTotal: $bookingsTotal, bookingSuccessRate: $bookingSuccessRate, avgResponseHours: $avgResponseHours, availabilityChecks: $availabilityChecks, reviewsTotal: $reviewsTotal, reviewsAvgRating: $reviewsAvgRating, favoritesTotal: $favoritesTotal, favoritesUniqueUsers: $favoritesUniqueUsers, eventsTotal: $eventsTotal)';
  }
}

/// @nodoc
abstract mixin class _$ServiceKpisDMCopyWith<$Res>
    implements $ServiceKpisDMCopyWith<$Res> {
  factory _$ServiceKpisDMCopyWith(
          _ServiceKpisDM value, $Res Function(_ServiceKpisDM) _then) =
      __$ServiceKpisDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_total') int bookingsTotal,
      @JsonKey(name: 'booking_success_rate') double bookingSuccessRate,
      @JsonKey(name: 'avg_response_hours') double avgResponseHours,
      @JsonKey(name: 'availability_checks') int availabilityChecks,
      @JsonKey(name: 'reviews_total') int reviewsTotal,
      @JsonKey(name: 'reviews_avg_rating') double reviewsAvgRating,
      @JsonKey(name: 'favorites_total') int favoritesTotal,
      @JsonKey(name: 'favorites_unique_users') int favoritesUniqueUsers,
      @JsonKey(name: 'events_total') int eventsTotal});
}

/// @nodoc
class __$ServiceKpisDMCopyWithImpl<$Res>
    implements _$ServiceKpisDMCopyWith<$Res> {
  __$ServiceKpisDMCopyWithImpl(this._self, this._then);

  final _ServiceKpisDM _self;
  final $Res Function(_ServiceKpisDM) _then;

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingsTotal = null,
    Object? bookingSuccessRate = null,
    Object? avgResponseHours = null,
    Object? availabilityChecks = null,
    Object? reviewsTotal = null,
    Object? reviewsAvgRating = null,
    Object? favoritesTotal = null,
    Object? favoritesUniqueUsers = null,
    Object? eventsTotal = null,
  }) {
    return _then(_ServiceKpisDM(
      bookingsTotal: null == bookingsTotal
          ? _self.bookingsTotal
          : bookingsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bookingSuccessRate: null == bookingSuccessRate
          ? _self.bookingSuccessRate
          : bookingSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
      avgResponseHours: null == avgResponseHours
          ? _self.avgResponseHours
          : avgResponseHours // ignore: cast_nullable_to_non_nullable
              as double,
      availabilityChecks: null == availabilityChecks
          ? _self.availabilityChecks
          : availabilityChecks // ignore: cast_nullable_to_non_nullable
              as int,
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
mixin _$ServiceFunnelDM {
  @JsonKey(fromJson: parseFunnelSteps)
  List<FunnelStepDM> get steps;
  ServiceFunnelConversionDM? get conversion;

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceFunnelDMCopyWith<ServiceFunnelDM> get copyWith =>
      _$ServiceFunnelDMCopyWithImpl<ServiceFunnelDM>(
          this as ServiceFunnelDM, _$identity);

  /// Serializes this ServiceFunnelDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceFunnelDM &&
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
    return 'ServiceFunnelDM(steps: $steps, conversion: $conversion)';
  }
}

/// @nodoc
abstract mixin class $ServiceFunnelDMCopyWith<$Res> {
  factory $ServiceFunnelDMCopyWith(
          ServiceFunnelDM value, $Res Function(ServiceFunnelDM) _then) =
      _$ServiceFunnelDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
      ServiceFunnelConversionDM? conversion});

  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class _$ServiceFunnelDMCopyWithImpl<$Res>
    implements $ServiceFunnelDMCopyWith<$Res> {
  _$ServiceFunnelDMCopyWithImpl(this._self, this._then);

  final ServiceFunnelDM _self;
  final $Res Function(ServiceFunnelDM) _then;

  /// Create a copy of ServiceFunnelDM
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
              as ServiceFunnelConversionDM?,
    ));
  }

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion {
    if (_self.conversion == null) {
      return null;
    }

    return $ServiceFunnelConversionDMCopyWith<$Res>(_self.conversion!, (value) {
      return _then(_self.copyWith(conversion: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServiceFunnelDM].
extension ServiceFunnelDMPatterns on ServiceFunnelDM {
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
    TResult Function(_ServiceFunnelDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelDM() when $default != null:
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
    TResult Function(_ServiceFunnelDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelDM():
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
    TResult? Function(_ServiceFunnelDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelDM() when $default != null:
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
            ServiceFunnelConversionDM? conversion)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelDM() when $default != null:
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
            ServiceFunnelConversionDM? conversion)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelDM():
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
            ServiceFunnelConversionDM? conversion)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelDM() when $default != null:
        return $default(_that.steps, _that.conversion);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceFunnelDM implements ServiceFunnelDM {
  const _ServiceFunnelDM(
      {@JsonKey(fromJson: parseFunnelSteps)
      final List<FunnelStepDM> steps = const [],
      this.conversion})
      : _steps = steps;
  factory _ServiceFunnelDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceFunnelDMFromJson(json);

  final List<FunnelStepDM> _steps;
  @override
  @JsonKey(fromJson: parseFunnelSteps)
  List<FunnelStepDM> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final ServiceFunnelConversionDM? conversion;

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceFunnelDMCopyWith<_ServiceFunnelDM> get copyWith =>
      __$ServiceFunnelDMCopyWithImpl<_ServiceFunnelDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceFunnelDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceFunnelDM &&
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
    return 'ServiceFunnelDM(steps: $steps, conversion: $conversion)';
  }
}

/// @nodoc
abstract mixin class _$ServiceFunnelDMCopyWith<$Res>
    implements $ServiceFunnelDMCopyWith<$Res> {
  factory _$ServiceFunnelDMCopyWith(
          _ServiceFunnelDM value, $Res Function(_ServiceFunnelDM) _then) =
      __$ServiceFunnelDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
      ServiceFunnelConversionDM? conversion});

  @override
  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class __$ServiceFunnelDMCopyWithImpl<$Res>
    implements _$ServiceFunnelDMCopyWith<$Res> {
  __$ServiceFunnelDMCopyWithImpl(this._self, this._then);

  final _ServiceFunnelDM _self;
  final $Res Function(_ServiceFunnelDM) _then;

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? steps = null,
    Object? conversion = freezed,
  }) {
    return _then(_ServiceFunnelDM(
      steps: null == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<FunnelStepDM>,
      conversion: freezed == conversion
          ? _self.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelConversionDM?,
    ));
  }

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion {
    if (_self.conversion == null) {
      return null;
    }

    return $ServiceFunnelConversionDMCopyWith<$Res>(_self.conversion!, (value) {
      return _then(_self.copyWith(conversion: value));
    });
  }
}

/// @nodoc
mixin _$ServiceFunnelConversionDM {
  @JsonKey(name: 'view_to_inquiry_rate')
  double get viewToInquiryRate;
  @JsonKey(name: 'inquiry_to_booking_rate')
  double get inquiryToBookingRate;
  @JsonKey(name: 'view_to_booking_rate')
  double get viewToBookingRate;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceFunnelConversionDMCopyWith<ServiceFunnelConversionDM> get copyWith =>
      _$ServiceFunnelConversionDMCopyWithImpl<ServiceFunnelConversionDM>(
          this as ServiceFunnelConversionDM, _$identity);

  /// Serializes this ServiceFunnelConversionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceFunnelConversionDM &&
            (identical(other.viewToInquiryRate, viewToInquiryRate) ||
                other.viewToInquiryRate == viewToInquiryRate) &&
            (identical(other.inquiryToBookingRate, inquiryToBookingRate) ||
                other.inquiryToBookingRate == inquiryToBookingRate) &&
            (identical(other.viewToBookingRate, viewToBookingRate) ||
                other.viewToBookingRate == viewToBookingRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, viewToInquiryRate, inquiryToBookingRate, viewToBookingRate);

  @override
  String toString() {
    return 'ServiceFunnelConversionDM(viewToInquiryRate: $viewToInquiryRate, inquiryToBookingRate: $inquiryToBookingRate, viewToBookingRate: $viewToBookingRate)';
  }
}

/// @nodoc
abstract mixin class $ServiceFunnelConversionDMCopyWith<$Res> {
  factory $ServiceFunnelConversionDMCopyWith(ServiceFunnelConversionDM value,
          $Res Function(ServiceFunnelConversionDM) _then) =
      _$ServiceFunnelConversionDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
      @JsonKey(name: 'inquiry_to_booking_rate') double inquiryToBookingRate,
      @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate});
}

/// @nodoc
class _$ServiceFunnelConversionDMCopyWithImpl<$Res>
    implements $ServiceFunnelConversionDMCopyWith<$Res> {
  _$ServiceFunnelConversionDMCopyWithImpl(this._self, this._then);

  final ServiceFunnelConversionDM _self;
  final $Res Function(ServiceFunnelConversionDM) _then;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewToInquiryRate = null,
    Object? inquiryToBookingRate = null,
    Object? viewToBookingRate = null,
  }) {
    return _then(_self.copyWith(
      viewToInquiryRate: null == viewToInquiryRate
          ? _self.viewToInquiryRate
          : viewToInquiryRate // ignore: cast_nullable_to_non_nullable
              as double,
      inquiryToBookingRate: null == inquiryToBookingRate
          ? _self.inquiryToBookingRate
          : inquiryToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
      viewToBookingRate: null == viewToBookingRate
          ? _self.viewToBookingRate
          : viewToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceFunnelConversionDM].
extension ServiceFunnelConversionDMPatterns on ServiceFunnelConversionDM {
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
    TResult Function(_ServiceFunnelConversionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelConversionDM() when $default != null:
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
    TResult Function(_ServiceFunnelConversionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelConversionDM():
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
    TResult? Function(_ServiceFunnelConversionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelConversionDM() when $default != null:
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
            @JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
            @JsonKey(name: 'inquiry_to_booking_rate')
            double inquiryToBookingRate,
            @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelConversionDM() when $default != null:
        return $default(_that.viewToInquiryRate, _that.inquiryToBookingRate,
            _that.viewToBookingRate);
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
            @JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
            @JsonKey(name: 'inquiry_to_booking_rate')
            double inquiryToBookingRate,
            @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelConversionDM():
        return $default(_that.viewToInquiryRate, _that.inquiryToBookingRate,
            _that.viewToBookingRate);
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
            @JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
            @JsonKey(name: 'inquiry_to_booking_rate')
            double inquiryToBookingRate,
            @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceFunnelConversionDM() when $default != null:
        return $default(_that.viewToInquiryRate, _that.inquiryToBookingRate,
            _that.viewToBookingRate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceFunnelConversionDM implements ServiceFunnelConversionDM {
  const _ServiceFunnelConversionDM(
      {@JsonKey(name: 'view_to_inquiry_rate') this.viewToInquiryRate = 0.0,
      @JsonKey(name: 'inquiry_to_booking_rate') this.inquiryToBookingRate = 0.0,
      @JsonKey(name: 'view_to_booking_rate') this.viewToBookingRate = 0.0});
  factory _ServiceFunnelConversionDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceFunnelConversionDMFromJson(json);

  @override
  @JsonKey(name: 'view_to_inquiry_rate')
  final double viewToInquiryRate;
  @override
  @JsonKey(name: 'inquiry_to_booking_rate')
  final double inquiryToBookingRate;
  @override
  @JsonKey(name: 'view_to_booking_rate')
  final double viewToBookingRate;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceFunnelConversionDMCopyWith<_ServiceFunnelConversionDM>
      get copyWith =>
          __$ServiceFunnelConversionDMCopyWithImpl<_ServiceFunnelConversionDM>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceFunnelConversionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceFunnelConversionDM &&
            (identical(other.viewToInquiryRate, viewToInquiryRate) ||
                other.viewToInquiryRate == viewToInquiryRate) &&
            (identical(other.inquiryToBookingRate, inquiryToBookingRate) ||
                other.inquiryToBookingRate == inquiryToBookingRate) &&
            (identical(other.viewToBookingRate, viewToBookingRate) ||
                other.viewToBookingRate == viewToBookingRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, viewToInquiryRate, inquiryToBookingRate, viewToBookingRate);

  @override
  String toString() {
    return 'ServiceFunnelConversionDM(viewToInquiryRate: $viewToInquiryRate, inquiryToBookingRate: $inquiryToBookingRate, viewToBookingRate: $viewToBookingRate)';
  }
}

/// @nodoc
abstract mixin class _$ServiceFunnelConversionDMCopyWith<$Res>
    implements $ServiceFunnelConversionDMCopyWith<$Res> {
  factory _$ServiceFunnelConversionDMCopyWith(_ServiceFunnelConversionDM value,
          $Res Function(_ServiceFunnelConversionDM) _then) =
      __$ServiceFunnelConversionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
      @JsonKey(name: 'inquiry_to_booking_rate') double inquiryToBookingRate,
      @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate});
}

/// @nodoc
class __$ServiceFunnelConversionDMCopyWithImpl<$Res>
    implements _$ServiceFunnelConversionDMCopyWith<$Res> {
  __$ServiceFunnelConversionDMCopyWithImpl(this._self, this._then);

  final _ServiceFunnelConversionDM _self;
  final $Res Function(_ServiceFunnelConversionDM) _then;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? viewToInquiryRate = null,
    Object? inquiryToBookingRate = null,
    Object? viewToBookingRate = null,
  }) {
    return _then(_ServiceFunnelConversionDM(
      viewToInquiryRate: null == viewToInquiryRate
          ? _self.viewToInquiryRate
          : viewToInquiryRate // ignore: cast_nullable_to_non_nullable
              as double,
      inquiryToBookingRate: null == inquiryToBookingRate
          ? _self.inquiryToBookingRate
          : inquiryToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
      viewToBookingRate: null == viewToBookingRate
          ? _self.viewToBookingRate
          : viewToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$ServiceDailySeriesDM {
  @JsonKey(name: 'bookings_daily')
  List<DailyPointDM> get bookingsDaily;
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily;
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily;

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceDailySeriesDMCopyWith<ServiceDailySeriesDM> get copyWith =>
      _$ServiceDailySeriesDMCopyWithImpl<ServiceDailySeriesDM>(
          this as ServiceDailySeriesDM, _$identity);

  /// Serializes this ServiceDailySeriesDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDailySeriesDM &&
            const DeepCollectionEquality()
                .equals(other.bookingsDaily, bookingsDaily) &&
            const DeepCollectionEquality()
                .equals(other.reviewsDaily, reviewsDaily) &&
            const DeepCollectionEquality()
                .equals(other.eventsDaily, eventsDaily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bookingsDaily),
      const DeepCollectionEquality().hash(reviewsDaily),
      const DeepCollectionEquality().hash(eventsDaily));

  @override
  String toString() {
    return 'ServiceDailySeriesDM(bookingsDaily: $bookingsDaily, reviewsDaily: $reviewsDaily, eventsDaily: $eventsDaily)';
  }
}

/// @nodoc
abstract mixin class $ServiceDailySeriesDMCopyWith<$Res> {
  factory $ServiceDailySeriesDMCopyWith(ServiceDailySeriesDM value,
          $Res Function(ServiceDailySeriesDM) _then) =
      _$ServiceDailySeriesDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class _$ServiceDailySeriesDMCopyWithImpl<$Res>
    implements $ServiceDailySeriesDMCopyWith<$Res> {
  _$ServiceDailySeriesDMCopyWithImpl(this._self, this._then);

  final ServiceDailySeriesDM _self;
  final $Res Function(ServiceDailySeriesDM) _then;

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsDaily = null,
    Object? reviewsDaily = null,
    Object? eventsDaily = null,
  }) {
    return _then(_self.copyWith(
      bookingsDaily: null == bookingsDaily
          ? _self.bookingsDaily
          : bookingsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _self.reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _self.eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceDailySeriesDM].
extension ServiceDailySeriesDMPatterns on ServiceDailySeriesDM {
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
    TResult Function(_ServiceDailySeriesDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceDailySeriesDM() when $default != null:
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
    TResult Function(_ServiceDailySeriesDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceDailySeriesDM():
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
    TResult? Function(_ServiceDailySeriesDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceDailySeriesDM() when $default != null:
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
            @JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
            @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
            @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceDailySeriesDM() when $default != null:
        return $default(
            _that.bookingsDaily, _that.reviewsDaily, _that.eventsDaily);
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
            @JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
            @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
            @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceDailySeriesDM():
        return $default(
            _that.bookingsDaily, _that.reviewsDaily, _that.eventsDaily);
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
            @JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
            @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
            @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceDailySeriesDM() when $default != null:
        return $default(
            _that.bookingsDaily, _that.reviewsDaily, _that.eventsDaily);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceDailySeriesDM implements ServiceDailySeriesDM {
  const _ServiceDailySeriesDM(
      {@JsonKey(name: 'bookings_daily')
      final List<DailyPointDM> bookingsDaily = const [],
      @JsonKey(name: 'reviews_daily')
      final List<DailyPointDM> reviewsDaily = const [],
      @JsonKey(name: 'events_daily')
      final List<DailyPointDM> eventsDaily = const []})
      : _bookingsDaily = bookingsDaily,
        _reviewsDaily = reviewsDaily,
        _eventsDaily = eventsDaily;
  factory _ServiceDailySeriesDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceDailySeriesDMFromJson(json);

  final List<DailyPointDM> _bookingsDaily;
  @override
  @JsonKey(name: 'bookings_daily')
  List<DailyPointDM> get bookingsDaily {
    if (_bookingsDaily is EqualUnmodifiableListView) return _bookingsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingsDaily);
  }

  final List<DailyPointDM> _reviewsDaily;
  @override
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily {
    if (_reviewsDaily is EqualUnmodifiableListView) return _reviewsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewsDaily);
  }

  final List<DailyPointDM> _eventsDaily;
  @override
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily {
    if (_eventsDaily is EqualUnmodifiableListView) return _eventsDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventsDaily);
  }

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceDailySeriesDMCopyWith<_ServiceDailySeriesDM> get copyWith =>
      __$ServiceDailySeriesDMCopyWithImpl<_ServiceDailySeriesDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceDailySeriesDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceDailySeriesDM &&
            const DeepCollectionEquality()
                .equals(other._bookingsDaily, _bookingsDaily) &&
            const DeepCollectionEquality()
                .equals(other._reviewsDaily, _reviewsDaily) &&
            const DeepCollectionEquality()
                .equals(other._eventsDaily, _eventsDaily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookingsDaily),
      const DeepCollectionEquality().hash(_reviewsDaily),
      const DeepCollectionEquality().hash(_eventsDaily));

  @override
  String toString() {
    return 'ServiceDailySeriesDM(bookingsDaily: $bookingsDaily, reviewsDaily: $reviewsDaily, eventsDaily: $eventsDaily)';
  }
}

/// @nodoc
abstract mixin class _$ServiceDailySeriesDMCopyWith<$Res>
    implements $ServiceDailySeriesDMCopyWith<$Res> {
  factory _$ServiceDailySeriesDMCopyWith(_ServiceDailySeriesDM value,
          $Res Function(_ServiceDailySeriesDM) _then) =
      __$ServiceDailySeriesDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class __$ServiceDailySeriesDMCopyWithImpl<$Res>
    implements _$ServiceDailySeriesDMCopyWith<$Res> {
  __$ServiceDailySeriesDMCopyWithImpl(this._self, this._then);

  final _ServiceDailySeriesDM _self;
  final $Res Function(_ServiceDailySeriesDM) _then;

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingsDaily = null,
    Object? reviewsDaily = null,
    Object? eventsDaily = null,
  }) {
    return _then(_ServiceDailySeriesDM(
      bookingsDaily: null == bookingsDaily
          ? _self._bookingsDaily
          : bookingsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _self._reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _self._eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ));
  }
}

/// @nodoc
mixin _$ServiceBreakdownsDM {
  @JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
  List<BreakdownItemDM> get bookingsByStatus;
  @JsonKey(name: 'top_packages')
  List<TopServicePackageDM> get topPackages;

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceBreakdownsDMCopyWith<ServiceBreakdownsDM> get copyWith =>
      _$ServiceBreakdownsDMCopyWithImpl<ServiceBreakdownsDM>(
          this as ServiceBreakdownsDM, _$identity);

  /// Serializes this ServiceBreakdownsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceBreakdownsDM &&
            const DeepCollectionEquality()
                .equals(other.bookingsByStatus, bookingsByStatus) &&
            const DeepCollectionEquality()
                .equals(other.topPackages, topPackages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bookingsByStatus),
      const DeepCollectionEquality().hash(topPackages));

  @override
  String toString() {
    return 'ServiceBreakdownsDM(bookingsByStatus: $bookingsByStatus, topPackages: $topPackages)';
  }
}

/// @nodoc
abstract mixin class $ServiceBreakdownsDMCopyWith<$Res> {
  factory $ServiceBreakdownsDMCopyWith(
          ServiceBreakdownsDM value, $Res Function(ServiceBreakdownsDM) _then) =
      _$ServiceBreakdownsDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      List<BreakdownItemDM> bookingsByStatus,
      @JsonKey(name: 'top_packages') List<TopServicePackageDM> topPackages});
}

/// @nodoc
class _$ServiceBreakdownsDMCopyWithImpl<$Res>
    implements $ServiceBreakdownsDMCopyWith<$Res> {
  _$ServiceBreakdownsDMCopyWithImpl(this._self, this._then);

  final ServiceBreakdownsDM _self;
  final $Res Function(ServiceBreakdownsDM) _then;

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsByStatus = null,
    Object? topPackages = null,
  }) {
    return _then(_self.copyWith(
      bookingsByStatus: null == bookingsByStatus
          ? _self.bookingsByStatus
          : bookingsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topPackages: null == topPackages
          ? _self.topPackages
          : topPackages // ignore: cast_nullable_to_non_nullable
              as List<TopServicePackageDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceBreakdownsDM].
extension ServiceBreakdownsDMPatterns on ServiceBreakdownsDM {
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
    TResult Function(_ServiceBreakdownsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceBreakdownsDM() when $default != null:
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
    TResult Function(_ServiceBreakdownsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceBreakdownsDM():
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
    TResult? Function(_ServiceBreakdownsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceBreakdownsDM() when $default != null:
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
                name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
            List<BreakdownItemDM> bookingsByStatus,
            @JsonKey(name: 'top_packages')
            List<TopServicePackageDM> topPackages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceBreakdownsDM() when $default != null:
        return $default(_that.bookingsByStatus, _that.topPackages);
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
                name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
            List<BreakdownItemDM> bookingsByStatus,
            @JsonKey(name: 'top_packages')
            List<TopServicePackageDM> topPackages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceBreakdownsDM():
        return $default(_that.bookingsByStatus, _that.topPackages);
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
                name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
            List<BreakdownItemDM> bookingsByStatus,
            @JsonKey(name: 'top_packages')
            List<TopServicePackageDM> topPackages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceBreakdownsDM() when $default != null:
        return $default(_that.bookingsByStatus, _that.topPackages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceBreakdownsDM implements ServiceBreakdownsDM {
  const _ServiceBreakdownsDM(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      final List<BreakdownItemDM> bookingsByStatus = const [],
      @JsonKey(name: 'top_packages')
      final List<TopServicePackageDM> topPackages = const []})
      : _bookingsByStatus = bookingsByStatus,
        _topPackages = topPackages;
  factory _ServiceBreakdownsDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceBreakdownsDMFromJson(json);

  final List<BreakdownItemDM> _bookingsByStatus;
  @override
  @JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
  List<BreakdownItemDM> get bookingsByStatus {
    if (_bookingsByStatus is EqualUnmodifiableListView)
      return _bookingsByStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingsByStatus);
  }

  final List<TopServicePackageDM> _topPackages;
  @override
  @JsonKey(name: 'top_packages')
  List<TopServicePackageDM> get topPackages {
    if (_topPackages is EqualUnmodifiableListView) return _topPackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPackages);
  }

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceBreakdownsDMCopyWith<_ServiceBreakdownsDM> get copyWith =>
      __$ServiceBreakdownsDMCopyWithImpl<_ServiceBreakdownsDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceBreakdownsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceBreakdownsDM &&
            const DeepCollectionEquality()
                .equals(other._bookingsByStatus, _bookingsByStatus) &&
            const DeepCollectionEquality()
                .equals(other._topPackages, _topPackages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookingsByStatus),
      const DeepCollectionEquality().hash(_topPackages));

  @override
  String toString() {
    return 'ServiceBreakdownsDM(bookingsByStatus: $bookingsByStatus, topPackages: $topPackages)';
  }
}

/// @nodoc
abstract mixin class _$ServiceBreakdownsDMCopyWith<$Res>
    implements $ServiceBreakdownsDMCopyWith<$Res> {
  factory _$ServiceBreakdownsDMCopyWith(_ServiceBreakdownsDM value,
          $Res Function(_ServiceBreakdownsDM) _then) =
      __$ServiceBreakdownsDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      List<BreakdownItemDM> bookingsByStatus,
      @JsonKey(name: 'top_packages') List<TopServicePackageDM> topPackages});
}

/// @nodoc
class __$ServiceBreakdownsDMCopyWithImpl<$Res>
    implements _$ServiceBreakdownsDMCopyWith<$Res> {
  __$ServiceBreakdownsDMCopyWithImpl(this._self, this._then);

  final _ServiceBreakdownsDM _self;
  final $Res Function(_ServiceBreakdownsDM) _then;

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingsByStatus = null,
    Object? topPackages = null,
  }) {
    return _then(_ServiceBreakdownsDM(
      bookingsByStatus: null == bookingsByStatus
          ? _self._bookingsByStatus
          : bookingsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topPackages: null == topPackages
          ? _self._topPackages
          : topPackages // ignore: cast_nullable_to_non_nullable
              as List<TopServicePackageDM>,
    ));
  }
}

/// @nodoc
mixin _$TopServicePackageDM {
  @JsonKey(name: 'package_uuid')
  String get packageUuid;
  String get title;
  @JsonKey(name: 'price_type')
  String get priceType;
  double get price;
  @JsonKey(name: 'bookings_count')
  int get bookingsCount;

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopServicePackageDMCopyWith<TopServicePackageDM> get copyWith =>
      _$TopServicePackageDMCopyWithImpl<TopServicePackageDM>(
          this as TopServicePackageDM, _$identity);

  /// Serializes this TopServicePackageDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopServicePackageDM &&
            (identical(other.packageUuid, packageUuid) ||
                other.packageUuid == packageUuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.bookingsCount, bookingsCount) ||
                other.bookingsCount == bookingsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, packageUuid, title, priceType, price, bookingsCount);

  @override
  String toString() {
    return 'TopServicePackageDM(packageUuid: $packageUuid, title: $title, priceType: $priceType, price: $price, bookingsCount: $bookingsCount)';
  }
}

/// @nodoc
abstract mixin class $TopServicePackageDMCopyWith<$Res> {
  factory $TopServicePackageDMCopyWith(
          TopServicePackageDM value, $Res Function(TopServicePackageDM) _then) =
      _$TopServicePackageDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'package_uuid') String packageUuid,
      String title,
      @JsonKey(name: 'price_type') String priceType,
      double price,
      @JsonKey(name: 'bookings_count') int bookingsCount});
}

/// @nodoc
class _$TopServicePackageDMCopyWithImpl<$Res>
    implements $TopServicePackageDMCopyWith<$Res> {
  _$TopServicePackageDMCopyWithImpl(this._self, this._then);

  final TopServicePackageDM _self;
  final $Res Function(TopServicePackageDM) _then;

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageUuid = null,
    Object? title = null,
    Object? priceType = null,
    Object? price = null,
    Object? bookingsCount = null,
  }) {
    return _then(_self.copyWith(
      packageUuid: null == packageUuid
          ? _self.packageUuid
          : packageUuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _self.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bookingsCount: null == bookingsCount
          ? _self.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [TopServicePackageDM].
extension TopServicePackageDMPatterns on TopServicePackageDM {
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
    TResult Function(_TopServicePackageDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopServicePackageDM() when $default != null:
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
    TResult Function(_TopServicePackageDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopServicePackageDM():
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
    TResult? Function(_TopServicePackageDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopServicePackageDM() when $default != null:
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
            @JsonKey(name: 'package_uuid') String packageUuid,
            String title,
            @JsonKey(name: 'price_type') String priceType,
            double price,
            @JsonKey(name: 'bookings_count') int bookingsCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopServicePackageDM() when $default != null:
        return $default(_that.packageUuid, _that.title, _that.priceType,
            _that.price, _that.bookingsCount);
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
            @JsonKey(name: 'package_uuid') String packageUuid,
            String title,
            @JsonKey(name: 'price_type') String priceType,
            double price,
            @JsonKey(name: 'bookings_count') int bookingsCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopServicePackageDM():
        return $default(_that.packageUuid, _that.title, _that.priceType,
            _that.price, _that.bookingsCount);
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
            @JsonKey(name: 'package_uuid') String packageUuid,
            String title,
            @JsonKey(name: 'price_type') String priceType,
            double price,
            @JsonKey(name: 'bookings_count') int bookingsCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopServicePackageDM() when $default != null:
        return $default(_that.packageUuid, _that.title, _that.priceType,
            _that.price, _that.bookingsCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TopServicePackageDM implements TopServicePackageDM {
  const _TopServicePackageDM(
      {@JsonKey(name: 'package_uuid') this.packageUuid = '',
      this.title = '',
      @JsonKey(name: 'price_type') this.priceType = '',
      this.price = 0.0,
      @JsonKey(name: 'bookings_count') this.bookingsCount = 0});
  factory _TopServicePackageDM.fromJson(Map<String, dynamic> json) =>
      _$TopServicePackageDMFromJson(json);

  @override
  @JsonKey(name: 'package_uuid')
  final String packageUuid;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: 'price_type')
  final String priceType;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey(name: 'bookings_count')
  final int bookingsCount;

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopServicePackageDMCopyWith<_TopServicePackageDM> get copyWith =>
      __$TopServicePackageDMCopyWithImpl<_TopServicePackageDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TopServicePackageDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopServicePackageDM &&
            (identical(other.packageUuid, packageUuid) ||
                other.packageUuid == packageUuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.bookingsCount, bookingsCount) ||
                other.bookingsCount == bookingsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, packageUuid, title, priceType, price, bookingsCount);

  @override
  String toString() {
    return 'TopServicePackageDM(packageUuid: $packageUuid, title: $title, priceType: $priceType, price: $price, bookingsCount: $bookingsCount)';
  }
}

/// @nodoc
abstract mixin class _$TopServicePackageDMCopyWith<$Res>
    implements $TopServicePackageDMCopyWith<$Res> {
  factory _$TopServicePackageDMCopyWith(_TopServicePackageDM value,
          $Res Function(_TopServicePackageDM) _then) =
      __$TopServicePackageDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'package_uuid') String packageUuid,
      String title,
      @JsonKey(name: 'price_type') String priceType,
      double price,
      @JsonKey(name: 'bookings_count') int bookingsCount});
}

/// @nodoc
class __$TopServicePackageDMCopyWithImpl<$Res>
    implements _$TopServicePackageDMCopyWith<$Res> {
  __$TopServicePackageDMCopyWithImpl(this._self, this._then);

  final _TopServicePackageDM _self;
  final $Res Function(_TopServicePackageDM) _then;

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packageUuid = null,
    Object? title = null,
    Object? priceType = null,
    Object? price = null,
    Object? bookingsCount = null,
  }) {
    return _then(_TopServicePackageDM(
      packageUuid: null == packageUuid
          ? _self.packageUuid
          : packageUuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _self.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bookingsCount: null == bookingsCount
          ? _self.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$AnalyticsMetaDM {
  @JsonKey(name: 'generated_at')
  String? get generatedAt;
  String get source;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsMetaDMCopyWith<AnalyticsMetaDM> get copyWith =>
      _$AnalyticsMetaDMCopyWithImpl<AnalyticsMetaDM>(
          this as AnalyticsMetaDM, _$identity);

  /// Serializes this AnalyticsMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsMetaDM &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, generatedAt, source);

  @override
  String toString() {
    return 'AnalyticsMetaDM(generatedAt: $generatedAt, source: $source)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsMetaDMCopyWith<$Res> {
  factory $AnalyticsMetaDMCopyWith(
          AnalyticsMetaDM value, $Res Function(AnalyticsMetaDM) _then) =
      _$AnalyticsMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'generated_at') String? generatedAt, String source});
}

/// @nodoc
class _$AnalyticsMetaDMCopyWithImpl<$Res>
    implements $AnalyticsMetaDMCopyWith<$Res> {
  _$AnalyticsMetaDMCopyWithImpl(this._self, this._then);

  final AnalyticsMetaDM _self;
  final $Res Function(AnalyticsMetaDM) _then;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = freezed,
    Object? source = null,
  }) {
    return _then(_self.copyWith(
      generatedAt: freezed == generatedAt
          ? _self.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AnalyticsMetaDM].
extension AnalyticsMetaDMPatterns on AnalyticsMetaDM {
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
    TResult Function(_AnalyticsMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsMetaDM() when $default != null:
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
    TResult Function(_AnalyticsMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsMetaDM():
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
    TResult? Function(_AnalyticsMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsMetaDM() when $default != null:
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
            @JsonKey(name: 'generated_at') String? generatedAt, String source)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsMetaDM() when $default != null:
        return $default(_that.generatedAt, _that.source);
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
            @JsonKey(name: 'generated_at') String? generatedAt, String source)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsMetaDM():
        return $default(_that.generatedAt, _that.source);
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
            @JsonKey(name: 'generated_at') String? generatedAt, String source)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsMetaDM() when $default != null:
        return $default(_that.generatedAt, _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AnalyticsMetaDM implements AnalyticsMetaDM {
  const _AnalyticsMetaDM(
      {@JsonKey(name: 'generated_at') this.generatedAt, this.source = ''});
  factory _AnalyticsMetaDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsMetaDMFromJson(json);

  @override
  @JsonKey(name: 'generated_at')
  final String? generatedAt;
  @override
  @JsonKey()
  final String source;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsMetaDMCopyWith<_AnalyticsMetaDM> get copyWith =>
      __$AnalyticsMetaDMCopyWithImpl<_AnalyticsMetaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnalyticsMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsMetaDM &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, generatedAt, source);

  @override
  String toString() {
    return 'AnalyticsMetaDM(generatedAt: $generatedAt, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsMetaDMCopyWith<$Res>
    implements $AnalyticsMetaDMCopyWith<$Res> {
  factory _$AnalyticsMetaDMCopyWith(
          _AnalyticsMetaDM value, $Res Function(_AnalyticsMetaDM) _then) =
      __$AnalyticsMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'generated_at') String? generatedAt, String source});
}

/// @nodoc
class __$AnalyticsMetaDMCopyWithImpl<$Res>
    implements _$AnalyticsMetaDMCopyWith<$Res> {
  __$AnalyticsMetaDMCopyWithImpl(this._self, this._then);

  final _AnalyticsMetaDM _self;
  final $Res Function(_AnalyticsMetaDM) _then;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generatedAt = freezed,
    Object? source = null,
  }) {
    return _then(_AnalyticsMetaDM(
      generatedAt: freezed == generatedAt
          ? _self.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
