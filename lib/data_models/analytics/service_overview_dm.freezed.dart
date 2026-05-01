// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_overview_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceOverviewResponseDM _$ServiceOverviewResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ServiceOverviewResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceOverviewResponseDM {
  bool get success => throw _privateConstructorUsedError;
  ServiceOverviewDataDM? get data => throw _privateConstructorUsedError;

  /// Serializes this ServiceOverviewResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceOverviewResponseDMCopyWith<ServiceOverviewResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOverviewResponseDMCopyWith<$Res> {
  factory $ServiceOverviewResponseDMCopyWith(ServiceOverviewResponseDM value,
          $Res Function(ServiceOverviewResponseDM) then) =
      _$ServiceOverviewResponseDMCopyWithImpl<$Res, ServiceOverviewResponseDM>;
  @useResult
  $Res call({bool success, ServiceOverviewDataDM? data});

  $ServiceOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$ServiceOverviewResponseDMCopyWithImpl<$Res,
        $Val extends ServiceOverviewResponseDM>
    implements $ServiceOverviewResponseDMCopyWith<$Res> {
  _$ServiceOverviewResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
    ) as $Val);
  }

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ServiceOverviewDataDMCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceOverviewResponseDMImplCopyWith<$Res>
    implements $ServiceOverviewResponseDMCopyWith<$Res> {
  factory _$$ServiceOverviewResponseDMImplCopyWith(
          _$ServiceOverviewResponseDMImpl value,
          $Res Function(_$ServiceOverviewResponseDMImpl) then) =
      __$$ServiceOverviewResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, ServiceOverviewDataDM? data});

  @override
  $ServiceOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ServiceOverviewResponseDMImplCopyWithImpl<$Res>
    extends _$ServiceOverviewResponseDMCopyWithImpl<$Res,
        _$ServiceOverviewResponseDMImpl>
    implements _$$ServiceOverviewResponseDMImplCopyWith<$Res> {
  __$$ServiceOverviewResponseDMImplCopyWithImpl(
      _$ServiceOverviewResponseDMImpl _value,
      $Res Function(_$ServiceOverviewResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_$ServiceOverviewResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceOverviewResponseDMImpl implements _ServiceOverviewResponseDM {
  const _$ServiceOverviewResponseDMImpl({this.success = false, this.data});

  factory _$ServiceOverviewResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceOverviewResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final ServiceOverviewDataDM? data;

  @override
  String toString() {
    return 'ServiceOverviewResponseDM(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceOverviewResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceOverviewResponseDMImplCopyWith<_$ServiceOverviewResponseDMImpl>
      get copyWith => __$$ServiceOverviewResponseDMImplCopyWithImpl<
          _$ServiceOverviewResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceOverviewResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceOverviewResponseDM implements ServiceOverviewResponseDM {
  const factory _ServiceOverviewResponseDM(
      {final bool success,
      final ServiceOverviewDataDM? data}) = _$ServiceOverviewResponseDMImpl;

  factory _ServiceOverviewResponseDM.fromJson(Map<String, dynamic> json) =
      _$ServiceOverviewResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  ServiceOverviewDataDM? get data;

  /// Create a copy of ServiceOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceOverviewResponseDMImplCopyWith<_$ServiceOverviewResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceOverviewDataDM _$ServiceOverviewDataDMFromJson(
    Map<String, dynamic> json) {
  return _ServiceOverviewDataDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceOverviewDataDM {
  AnalyticsScopeDM? get scope => throw _privateConstructorUsedError;
  ServiceKpisDM? get kpis => throw _privateConstructorUsedError;
  ServiceFunnelDM? get funnel => throw _privateConstructorUsedError;
  ServiceDailySeriesDM? get series => throw _privateConstructorUsedError;
  ServiceBreakdownsDM? get breakdowns => throw _privateConstructorUsedError;
  AnalyticsMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this ServiceOverviewDataDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceOverviewDataDMCopyWith<ServiceOverviewDataDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceOverviewDataDMCopyWith<$Res> {
  factory $ServiceOverviewDataDMCopyWith(ServiceOverviewDataDM value,
          $Res Function(ServiceOverviewDataDM) then) =
      _$ServiceOverviewDataDMCopyWithImpl<$Res, ServiceOverviewDataDM>;
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
class _$ServiceOverviewDataDMCopyWithImpl<$Res,
        $Val extends ServiceOverviewDataDM>
    implements $ServiceOverviewDataDMCopyWith<$Res> {
  _$ServiceOverviewDataDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as AnalyticsScopeDM?,
      kpis: freezed == kpis
          ? _value.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as ServiceKpisDM?,
      funnel: freezed == funnel
          ? _value.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelDM?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as ServiceDailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _value.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as ServiceBreakdownsDM?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AnalyticsMetaDM?,
    ) as $Val);
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsScopeDMCopyWith<$Res>? get scope {
    if (_value.scope == null) {
      return null;
    }

    return $AnalyticsScopeDMCopyWith<$Res>(_value.scope!, (value) {
      return _then(_value.copyWith(scope: value) as $Val);
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceKpisDMCopyWith<$Res>? get kpis {
    if (_value.kpis == null) {
      return null;
    }

    return $ServiceKpisDMCopyWith<$Res>(_value.kpis!, (value) {
      return _then(_value.copyWith(kpis: value) as $Val);
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceFunnelDMCopyWith<$Res>? get funnel {
    if (_value.funnel == null) {
      return null;
    }

    return $ServiceFunnelDMCopyWith<$Res>(_value.funnel!, (value) {
      return _then(_value.copyWith(funnel: value) as $Val);
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceDailySeriesDMCopyWith<$Res>? get series {
    if (_value.series == null) {
      return null;
    }

    return $ServiceDailySeriesDMCopyWith<$Res>(_value.series!, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceBreakdownsDMCopyWith<$Res>? get breakdowns {
    if (_value.breakdowns == null) {
      return null;
    }

    return $ServiceBreakdownsDMCopyWith<$Res>(_value.breakdowns!, (value) {
      return _then(_value.copyWith(breakdowns: value) as $Val);
    });
  }

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $AnalyticsMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceOverviewDataDMImplCopyWith<$Res>
    implements $ServiceOverviewDataDMCopyWith<$Res> {
  factory _$$ServiceOverviewDataDMImplCopyWith(
          _$ServiceOverviewDataDMImpl value,
          $Res Function(_$ServiceOverviewDataDMImpl) then) =
      __$$ServiceOverviewDataDMImplCopyWithImpl<$Res>;
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
class __$$ServiceOverviewDataDMImplCopyWithImpl<$Res>
    extends _$ServiceOverviewDataDMCopyWithImpl<$Res,
        _$ServiceOverviewDataDMImpl>
    implements _$$ServiceOverviewDataDMImplCopyWith<$Res> {
  __$$ServiceOverviewDataDMImplCopyWithImpl(_$ServiceOverviewDataDMImpl _value,
      $Res Function(_$ServiceOverviewDataDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ServiceOverviewDataDMImpl(
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as AnalyticsScopeDM?,
      kpis: freezed == kpis
          ? _value.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as ServiceKpisDM?,
      funnel: freezed == funnel
          ? _value.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelDM?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as ServiceDailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _value.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as ServiceBreakdownsDM?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AnalyticsMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceOverviewDataDMImpl implements _ServiceOverviewDataDM {
  const _$ServiceOverviewDataDMImpl(
      {this.scope,
      this.kpis,
      this.funnel,
      this.series,
      this.breakdowns,
      this.meta});

  factory _$ServiceOverviewDataDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceOverviewDataDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceOverviewDataDM(scope: $scope, kpis: $kpis, funnel: $funnel, series: $series, breakdowns: $breakdowns, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceOverviewDataDMImpl &&
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

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceOverviewDataDMImplCopyWith<_$ServiceOverviewDataDMImpl>
      get copyWith => __$$ServiceOverviewDataDMImplCopyWithImpl<
          _$ServiceOverviewDataDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceOverviewDataDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceOverviewDataDM implements ServiceOverviewDataDM {
  const factory _ServiceOverviewDataDM(
      {final AnalyticsScopeDM? scope,
      final ServiceKpisDM? kpis,
      final ServiceFunnelDM? funnel,
      final ServiceDailySeriesDM? series,
      final ServiceBreakdownsDM? breakdowns,
      final AnalyticsMetaDM? meta}) = _$ServiceOverviewDataDMImpl;

  factory _ServiceOverviewDataDM.fromJson(Map<String, dynamic> json) =
      _$ServiceOverviewDataDMImpl.fromJson;

  @override
  AnalyticsScopeDM? get scope;
  @override
  ServiceKpisDM? get kpis;
  @override
  ServiceFunnelDM? get funnel;
  @override
  ServiceDailySeriesDM? get series;
  @override
  ServiceBreakdownsDM? get breakdowns;
  @override
  AnalyticsMetaDM? get meta;

  /// Create a copy of ServiceOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceOverviewDataDMImplCopyWith<_$ServiceOverviewDataDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AnalyticsScopeDM _$AnalyticsScopeDMFromJson(Map<String, dynamic> json) {
  return _AnalyticsScopeDM.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsScopeDM {
  AnalyticsPeriodDM? get period => throw _privateConstructorUsedError;
  List<AnalyticsBusinessRefDM> get businesses =>
      throw _privateConstructorUsedError;

  /// Serializes this AnalyticsScopeDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsScopeDMCopyWith<AnalyticsScopeDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsScopeDMCopyWith<$Res> {
  factory $AnalyticsScopeDMCopyWith(
          AnalyticsScopeDM value, $Res Function(AnalyticsScopeDM) then) =
      _$AnalyticsScopeDMCopyWithImpl<$Res, AnalyticsScopeDM>;
  @useResult
  $Res call(
      {AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses});

  $AnalyticsPeriodDMCopyWith<$Res>? get period;
}

/// @nodoc
class _$AnalyticsScopeDMCopyWithImpl<$Res, $Val extends AnalyticsScopeDM>
    implements $AnalyticsScopeDMCopyWith<$Res> {
  _$AnalyticsScopeDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? businesses = null,
  }) {
    return _then(_value.copyWith(
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriodDM?,
      businesses: null == businesses
          ? _value.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsBusinessRefDM>,
    ) as $Val);
  }

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodDMCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $AnalyticsPeriodDMCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsScopeDMImplCopyWith<$Res>
    implements $AnalyticsScopeDMCopyWith<$Res> {
  factory _$$AnalyticsScopeDMImplCopyWith(_$AnalyticsScopeDMImpl value,
          $Res Function(_$AnalyticsScopeDMImpl) then) =
      __$$AnalyticsScopeDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnalyticsPeriodDM? period, List<AnalyticsBusinessRefDM> businesses});

  @override
  $AnalyticsPeriodDMCopyWith<$Res>? get period;
}

/// @nodoc
class __$$AnalyticsScopeDMImplCopyWithImpl<$Res>
    extends _$AnalyticsScopeDMCopyWithImpl<$Res, _$AnalyticsScopeDMImpl>
    implements _$$AnalyticsScopeDMImplCopyWith<$Res> {
  __$$AnalyticsScopeDMImplCopyWithImpl(_$AnalyticsScopeDMImpl _value,
      $Res Function(_$AnalyticsScopeDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = freezed,
    Object? businesses = null,
  }) {
    return _then(_$AnalyticsScopeDMImpl(
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriodDM?,
      businesses: null == businesses
          ? _value._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsBusinessRefDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsScopeDMImpl implements _AnalyticsScopeDM {
  const _$AnalyticsScopeDMImpl(
      {this.period, final List<AnalyticsBusinessRefDM> businesses = const []})
      : _businesses = businesses;

  factory _$AnalyticsScopeDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsScopeDMImplFromJson(json);

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

  @override
  String toString() {
    return 'AnalyticsScopeDM(period: $period, businesses: $businesses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsScopeDMImpl &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._businesses, _businesses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, period, const DeepCollectionEquality().hash(_businesses));

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsScopeDMImplCopyWith<_$AnalyticsScopeDMImpl> get copyWith =>
      __$$AnalyticsScopeDMImplCopyWithImpl<_$AnalyticsScopeDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsScopeDMImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsScopeDM implements AnalyticsScopeDM {
  const factory _AnalyticsScopeDM(
      {final AnalyticsPeriodDM? period,
      final List<AnalyticsBusinessRefDM> businesses}) = _$AnalyticsScopeDMImpl;

  factory _AnalyticsScopeDM.fromJson(Map<String, dynamic> json) =
      _$AnalyticsScopeDMImpl.fromJson;

  @override
  AnalyticsPeriodDM? get period;
  @override
  List<AnalyticsBusinessRefDM> get businesses;

  /// Create a copy of AnalyticsScopeDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsScopeDMImplCopyWith<_$AnalyticsScopeDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsPeriodDM _$AnalyticsPeriodDMFromJson(Map<String, dynamic> json) {
  return _AnalyticsPeriodDM.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsPeriodDM {
  int get days => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsPeriodDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsPeriodDMCopyWith<AnalyticsPeriodDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsPeriodDMCopyWith<$Res> {
  factory $AnalyticsPeriodDMCopyWith(
          AnalyticsPeriodDM value, $Res Function(AnalyticsPeriodDM) then) =
      _$AnalyticsPeriodDMCopyWithImpl<$Res, AnalyticsPeriodDM>;
  @useResult
  $Res call({int days, String start, String end});
}

/// @nodoc
class _$AnalyticsPeriodDMCopyWithImpl<$Res, $Val extends AnalyticsPeriodDM>
    implements $AnalyticsPeriodDMCopyWith<$Res> {
  _$AnalyticsPeriodDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsPeriodDMImplCopyWith<$Res>
    implements $AnalyticsPeriodDMCopyWith<$Res> {
  factory _$$AnalyticsPeriodDMImplCopyWith(_$AnalyticsPeriodDMImpl value,
          $Res Function(_$AnalyticsPeriodDMImpl) then) =
      __$$AnalyticsPeriodDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int days, String start, String end});
}

/// @nodoc
class __$$AnalyticsPeriodDMImplCopyWithImpl<$Res>
    extends _$AnalyticsPeriodDMCopyWithImpl<$Res, _$AnalyticsPeriodDMImpl>
    implements _$$AnalyticsPeriodDMImplCopyWith<$Res> {
  __$$AnalyticsPeriodDMImplCopyWithImpl(_$AnalyticsPeriodDMImpl _value,
      $Res Function(_$AnalyticsPeriodDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$AnalyticsPeriodDMImpl(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsPeriodDMImpl implements _AnalyticsPeriodDM {
  const _$AnalyticsPeriodDMImpl(
      {this.days = 30, this.start = '', this.end = ''});

  factory _$AnalyticsPeriodDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsPeriodDMImplFromJson(json);

  @override
  @JsonKey()
  final int days;
  @override
  @JsonKey()
  final String start;
  @override
  @JsonKey()
  final String end;

  @override
  String toString() {
    return 'AnalyticsPeriodDM(days: $days, start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsPeriodDMImpl &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, days, start, end);

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsPeriodDMImplCopyWith<_$AnalyticsPeriodDMImpl> get copyWith =>
      __$$AnalyticsPeriodDMImplCopyWithImpl<_$AnalyticsPeriodDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsPeriodDMImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsPeriodDM implements AnalyticsPeriodDM {
  const factory _AnalyticsPeriodDM(
      {final int days,
      final String start,
      final String end}) = _$AnalyticsPeriodDMImpl;

  factory _AnalyticsPeriodDM.fromJson(Map<String, dynamic> json) =
      _$AnalyticsPeriodDMImpl.fromJson;

  @override
  int get days;
  @override
  String get start;
  @override
  String get end;

  /// Create a copy of AnalyticsPeriodDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsPeriodDMImplCopyWith<_$AnalyticsPeriodDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsBusinessRefDM _$AnalyticsBusinessRefDMFromJson(
    Map<String, dynamic> json) {
  return _AnalyticsBusinessRefDM.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsBusinessRefDM {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String? get businessName => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsBusinessRefDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsBusinessRefDMCopyWith<AnalyticsBusinessRefDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsBusinessRefDMCopyWith<$Res> {
  factory $AnalyticsBusinessRefDMCopyWith(AnalyticsBusinessRefDM value,
          $Res Function(AnalyticsBusinessRefDM) then) =
      _$AnalyticsBusinessRefDMCopyWithImpl<$Res, AnalyticsBusinessRefDM>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_name') String? businessName});
}

/// @nodoc
class _$AnalyticsBusinessRefDMCopyWithImpl<$Res,
        $Val extends AnalyticsBusinessRefDM>
    implements $AnalyticsBusinessRefDMCopyWith<$Res> {
  _$AnalyticsBusinessRefDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessUuid = null,
    Object? businessName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsBusinessRefDMImplCopyWith<$Res>
    implements $AnalyticsBusinessRefDMCopyWith<$Res> {
  factory _$$AnalyticsBusinessRefDMImplCopyWith(
          _$AnalyticsBusinessRefDMImpl value,
          $Res Function(_$AnalyticsBusinessRefDMImpl) then) =
      __$$AnalyticsBusinessRefDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_name') String? businessName});
}

/// @nodoc
class __$$AnalyticsBusinessRefDMImplCopyWithImpl<$Res>
    extends _$AnalyticsBusinessRefDMCopyWithImpl<$Res,
        _$AnalyticsBusinessRefDMImpl>
    implements _$$AnalyticsBusinessRefDMImplCopyWith<$Res> {
  __$$AnalyticsBusinessRefDMImplCopyWithImpl(
      _$AnalyticsBusinessRefDMImpl _value,
      $Res Function(_$AnalyticsBusinessRefDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessUuid = null,
    Object? businessName = freezed,
  }) {
    return _then(_$AnalyticsBusinessRefDMImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsBusinessRefDMImpl implements _AnalyticsBusinessRefDM {
  const _$AnalyticsBusinessRefDMImpl(
      {this.id = 0,
      @JsonKey(name: 'business_uuid') this.businessUuid = '',
      @JsonKey(name: 'business_name') this.businessName});

  factory _$AnalyticsBusinessRefDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsBusinessRefDMImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'business_uuid')
  final String businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;

  @override
  String toString() {
    return 'AnalyticsBusinessRefDM(id: $id, businessUuid: $businessUuid, businessName: $businessName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsBusinessRefDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, businessUuid, businessName);

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsBusinessRefDMImplCopyWith<_$AnalyticsBusinessRefDMImpl>
      get copyWith => __$$AnalyticsBusinessRefDMImplCopyWithImpl<
          _$AnalyticsBusinessRefDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsBusinessRefDMImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsBusinessRefDM implements AnalyticsBusinessRefDM {
  const factory _AnalyticsBusinessRefDM(
          {final int id,
          @JsonKey(name: 'business_uuid') final String businessUuid,
          @JsonKey(name: 'business_name') final String? businessName}) =
      _$AnalyticsBusinessRefDMImpl;

  factory _AnalyticsBusinessRefDM.fromJson(Map<String, dynamic> json) =
      _$AnalyticsBusinessRefDMImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @override
  @JsonKey(name: 'business_name')
  String? get businessName;

  /// Create a copy of AnalyticsBusinessRefDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsBusinessRefDMImplCopyWith<_$AnalyticsBusinessRefDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceKpisDM _$ServiceKpisDMFromJson(Map<String, dynamic> json) {
  return _ServiceKpisDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceKpisDM {
  @JsonKey(name: 'bookings_total')
  int get bookingsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_success_rate')
  double get bookingSuccessRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_response_hours')
  double get avgResponseHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'availability_checks')
  int get availabilityChecks => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_total')
  int get reviewsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_avg_rating')
  double get reviewsAvgRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorites_total')
  int get favoritesTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorites_unique_users')
  int get favoritesUniqueUsers => throw _privateConstructorUsedError;
  @JsonKey(name: 'events_total')
  int get eventsTotal => throw _privateConstructorUsedError;

  /// Serializes this ServiceKpisDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceKpisDMCopyWith<ServiceKpisDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceKpisDMCopyWith<$Res> {
  factory $ServiceKpisDMCopyWith(
          ServiceKpisDM value, $Res Function(ServiceKpisDM) then) =
      _$ServiceKpisDMCopyWithImpl<$Res, ServiceKpisDM>;
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
class _$ServiceKpisDMCopyWithImpl<$Res, $Val extends ServiceKpisDM>
    implements $ServiceKpisDMCopyWith<$Res> {
  _$ServiceKpisDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      bookingsTotal: null == bookingsTotal
          ? _value.bookingsTotal
          : bookingsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bookingSuccessRate: null == bookingSuccessRate
          ? _value.bookingSuccessRate
          : bookingSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
      avgResponseHours: null == avgResponseHours
          ? _value.avgResponseHours
          : avgResponseHours // ignore: cast_nullable_to_non_nullable
              as double,
      availabilityChecks: null == availabilityChecks
          ? _value.availabilityChecks
          : availabilityChecks // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsTotal: null == reviewsTotal
          ? _value.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsAvgRating: null == reviewsAvgRating
          ? _value.reviewsAvgRating
          : reviewsAvgRating // ignore: cast_nullable_to_non_nullable
              as double,
      favoritesTotal: null == favoritesTotal
          ? _value.favoritesTotal
          : favoritesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesUniqueUsers: null == favoritesUniqueUsers
          ? _value.favoritesUniqueUsers
          : favoritesUniqueUsers // ignore: cast_nullable_to_non_nullable
              as int,
      eventsTotal: null == eventsTotal
          ? _value.eventsTotal
          : eventsTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceKpisDMImplCopyWith<$Res>
    implements $ServiceKpisDMCopyWith<$Res> {
  factory _$$ServiceKpisDMImplCopyWith(
          _$ServiceKpisDMImpl value, $Res Function(_$ServiceKpisDMImpl) then) =
      __$$ServiceKpisDMImplCopyWithImpl<$Res>;
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
class __$$ServiceKpisDMImplCopyWithImpl<$Res>
    extends _$ServiceKpisDMCopyWithImpl<$Res, _$ServiceKpisDMImpl>
    implements _$$ServiceKpisDMImplCopyWith<$Res> {
  __$$ServiceKpisDMImplCopyWithImpl(
      _$ServiceKpisDMImpl _value, $Res Function(_$ServiceKpisDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ServiceKpisDMImpl(
      bookingsTotal: null == bookingsTotal
          ? _value.bookingsTotal
          : bookingsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bookingSuccessRate: null == bookingSuccessRate
          ? _value.bookingSuccessRate
          : bookingSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
      avgResponseHours: null == avgResponseHours
          ? _value.avgResponseHours
          : avgResponseHours // ignore: cast_nullable_to_non_nullable
              as double,
      availabilityChecks: null == availabilityChecks
          ? _value.availabilityChecks
          : availabilityChecks // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsTotal: null == reviewsTotal
          ? _value.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsAvgRating: null == reviewsAvgRating
          ? _value.reviewsAvgRating
          : reviewsAvgRating // ignore: cast_nullable_to_non_nullable
              as double,
      favoritesTotal: null == favoritesTotal
          ? _value.favoritesTotal
          : favoritesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesUniqueUsers: null == favoritesUniqueUsers
          ? _value.favoritesUniqueUsers
          : favoritesUniqueUsers // ignore: cast_nullable_to_non_nullable
              as int,
      eventsTotal: null == eventsTotal
          ? _value.eventsTotal
          : eventsTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceKpisDMImpl implements _ServiceKpisDM {
  const _$ServiceKpisDMImpl(
      {@JsonKey(name: 'bookings_total') this.bookingsTotal = 0,
      @JsonKey(name: 'booking_success_rate') this.bookingSuccessRate = 0.0,
      @JsonKey(name: 'avg_response_hours') this.avgResponseHours = 0.0,
      @JsonKey(name: 'availability_checks') this.availabilityChecks = 0,
      @JsonKey(name: 'reviews_total') this.reviewsTotal = 0,
      @JsonKey(name: 'reviews_avg_rating') this.reviewsAvgRating = 0.0,
      @JsonKey(name: 'favorites_total') this.favoritesTotal = 0,
      @JsonKey(name: 'favorites_unique_users') this.favoritesUniqueUsers = 0,
      @JsonKey(name: 'events_total') this.eventsTotal = 0});

  factory _$ServiceKpisDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceKpisDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceKpisDM(bookingsTotal: $bookingsTotal, bookingSuccessRate: $bookingSuccessRate, avgResponseHours: $avgResponseHours, availabilityChecks: $availabilityChecks, reviewsTotal: $reviewsTotal, reviewsAvgRating: $reviewsAvgRating, favoritesTotal: $favoritesTotal, favoritesUniqueUsers: $favoritesUniqueUsers, eventsTotal: $eventsTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceKpisDMImpl &&
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

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceKpisDMImplCopyWith<_$ServiceKpisDMImpl> get copyWith =>
      __$$ServiceKpisDMImplCopyWithImpl<_$ServiceKpisDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceKpisDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceKpisDM implements ServiceKpisDM {
  const factory _ServiceKpisDM(
      {@JsonKey(name: 'bookings_total') final int bookingsTotal,
      @JsonKey(name: 'booking_success_rate') final double bookingSuccessRate,
      @JsonKey(name: 'avg_response_hours') final double avgResponseHours,
      @JsonKey(name: 'availability_checks') final int availabilityChecks,
      @JsonKey(name: 'reviews_total') final int reviewsTotal,
      @JsonKey(name: 'reviews_avg_rating') final double reviewsAvgRating,
      @JsonKey(name: 'favorites_total') final int favoritesTotal,
      @JsonKey(name: 'favorites_unique_users') final int favoritesUniqueUsers,
      @JsonKey(name: 'events_total')
      final int eventsTotal}) = _$ServiceKpisDMImpl;

  factory _ServiceKpisDM.fromJson(Map<String, dynamic> json) =
      _$ServiceKpisDMImpl.fromJson;

  @override
  @JsonKey(name: 'bookings_total')
  int get bookingsTotal;
  @override
  @JsonKey(name: 'booking_success_rate')
  double get bookingSuccessRate;
  @override
  @JsonKey(name: 'avg_response_hours')
  double get avgResponseHours;
  @override
  @JsonKey(name: 'availability_checks')
  int get availabilityChecks;
  @override
  @JsonKey(name: 'reviews_total')
  int get reviewsTotal;
  @override
  @JsonKey(name: 'reviews_avg_rating')
  double get reviewsAvgRating;
  @override
  @JsonKey(name: 'favorites_total')
  int get favoritesTotal;
  @override
  @JsonKey(name: 'favorites_unique_users')
  int get favoritesUniqueUsers;
  @override
  @JsonKey(name: 'events_total')
  int get eventsTotal;

  /// Create a copy of ServiceKpisDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceKpisDMImplCopyWith<_$ServiceKpisDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceFunnelDM _$ServiceFunnelDMFromJson(Map<String, dynamic> json) {
  return _ServiceFunnelDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceFunnelDM {
  @JsonKey(fromJson: parseFunnelSteps)
  List<FunnelStepDM> get steps => throw _privateConstructorUsedError;
  ServiceFunnelConversionDM? get conversion =>
      throw _privateConstructorUsedError;

  /// Serializes this ServiceFunnelDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceFunnelDMCopyWith<ServiceFunnelDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceFunnelDMCopyWith<$Res> {
  factory $ServiceFunnelDMCopyWith(
          ServiceFunnelDM value, $Res Function(ServiceFunnelDM) then) =
      _$ServiceFunnelDMCopyWithImpl<$Res, ServiceFunnelDM>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
      ServiceFunnelConversionDM? conversion});

  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class _$ServiceFunnelDMCopyWithImpl<$Res, $Val extends ServiceFunnelDM>
    implements $ServiceFunnelDMCopyWith<$Res> {
  _$ServiceFunnelDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? conversion = freezed,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<FunnelStepDM>,
      conversion: freezed == conversion
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelConversionDM?,
    ) as $Val);
  }

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion {
    if (_value.conversion == null) {
      return null;
    }

    return $ServiceFunnelConversionDMCopyWith<$Res>(_value.conversion!,
        (value) {
      return _then(_value.copyWith(conversion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceFunnelDMImplCopyWith<$Res>
    implements $ServiceFunnelDMCopyWith<$Res> {
  factory _$$ServiceFunnelDMImplCopyWith(_$ServiceFunnelDMImpl value,
          $Res Function(_$ServiceFunnelDMImpl) then) =
      __$$ServiceFunnelDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseFunnelSteps) List<FunnelStepDM> steps,
      ServiceFunnelConversionDM? conversion});

  @override
  $ServiceFunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class __$$ServiceFunnelDMImplCopyWithImpl<$Res>
    extends _$ServiceFunnelDMCopyWithImpl<$Res, _$ServiceFunnelDMImpl>
    implements _$$ServiceFunnelDMImplCopyWith<$Res> {
  __$$ServiceFunnelDMImplCopyWithImpl(
      _$ServiceFunnelDMImpl _value, $Res Function(_$ServiceFunnelDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? conversion = freezed,
  }) {
    return _then(_$ServiceFunnelDMImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<FunnelStepDM>,
      conversion: freezed == conversion
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as ServiceFunnelConversionDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceFunnelDMImpl implements _ServiceFunnelDM {
  const _$ServiceFunnelDMImpl(
      {@JsonKey(fromJson: parseFunnelSteps)
      final List<FunnelStepDM> steps = const [],
      this.conversion})
      : _steps = steps;

  factory _$ServiceFunnelDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceFunnelDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceFunnelDM(steps: $steps, conversion: $conversion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceFunnelDMImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_steps), conversion);

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceFunnelDMImplCopyWith<_$ServiceFunnelDMImpl> get copyWith =>
      __$$ServiceFunnelDMImplCopyWithImpl<_$ServiceFunnelDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceFunnelDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceFunnelDM implements ServiceFunnelDM {
  const factory _ServiceFunnelDM(
      {@JsonKey(fromJson: parseFunnelSteps) final List<FunnelStepDM> steps,
      final ServiceFunnelConversionDM? conversion}) = _$ServiceFunnelDMImpl;

  factory _ServiceFunnelDM.fromJson(Map<String, dynamic> json) =
      _$ServiceFunnelDMImpl.fromJson;

  @override
  @JsonKey(fromJson: parseFunnelSteps)
  List<FunnelStepDM> get steps;
  @override
  ServiceFunnelConversionDM? get conversion;

  /// Create a copy of ServiceFunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceFunnelDMImplCopyWith<_$ServiceFunnelDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceFunnelConversionDM _$ServiceFunnelConversionDMFromJson(
    Map<String, dynamic> json) {
  return _ServiceFunnelConversionDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceFunnelConversionDM {
  @JsonKey(name: 'view_to_inquiry_rate')
  double get viewToInquiryRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'inquiry_to_booking_rate')
  double get inquiryToBookingRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_to_booking_rate')
  double get viewToBookingRate => throw _privateConstructorUsedError;

  /// Serializes this ServiceFunnelConversionDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceFunnelConversionDMCopyWith<ServiceFunnelConversionDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceFunnelConversionDMCopyWith<$Res> {
  factory $ServiceFunnelConversionDMCopyWith(ServiceFunnelConversionDM value,
          $Res Function(ServiceFunnelConversionDM) then) =
      _$ServiceFunnelConversionDMCopyWithImpl<$Res, ServiceFunnelConversionDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
      @JsonKey(name: 'inquiry_to_booking_rate') double inquiryToBookingRate,
      @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate});
}

/// @nodoc
class _$ServiceFunnelConversionDMCopyWithImpl<$Res,
        $Val extends ServiceFunnelConversionDM>
    implements $ServiceFunnelConversionDMCopyWith<$Res> {
  _$ServiceFunnelConversionDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewToInquiryRate = null,
    Object? inquiryToBookingRate = null,
    Object? viewToBookingRate = null,
  }) {
    return _then(_value.copyWith(
      viewToInquiryRate: null == viewToInquiryRate
          ? _value.viewToInquiryRate
          : viewToInquiryRate // ignore: cast_nullable_to_non_nullable
              as double,
      inquiryToBookingRate: null == inquiryToBookingRate
          ? _value.inquiryToBookingRate
          : inquiryToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
      viewToBookingRate: null == viewToBookingRate
          ? _value.viewToBookingRate
          : viewToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceFunnelConversionDMImplCopyWith<$Res>
    implements $ServiceFunnelConversionDMCopyWith<$Res> {
  factory _$$ServiceFunnelConversionDMImplCopyWith(
          _$ServiceFunnelConversionDMImpl value,
          $Res Function(_$ServiceFunnelConversionDMImpl) then) =
      __$$ServiceFunnelConversionDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'view_to_inquiry_rate') double viewToInquiryRate,
      @JsonKey(name: 'inquiry_to_booking_rate') double inquiryToBookingRate,
      @JsonKey(name: 'view_to_booking_rate') double viewToBookingRate});
}

/// @nodoc
class __$$ServiceFunnelConversionDMImplCopyWithImpl<$Res>
    extends _$ServiceFunnelConversionDMCopyWithImpl<$Res,
        _$ServiceFunnelConversionDMImpl>
    implements _$$ServiceFunnelConversionDMImplCopyWith<$Res> {
  __$$ServiceFunnelConversionDMImplCopyWithImpl(
      _$ServiceFunnelConversionDMImpl _value,
      $Res Function(_$ServiceFunnelConversionDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewToInquiryRate = null,
    Object? inquiryToBookingRate = null,
    Object? viewToBookingRate = null,
  }) {
    return _then(_$ServiceFunnelConversionDMImpl(
      viewToInquiryRate: null == viewToInquiryRate
          ? _value.viewToInquiryRate
          : viewToInquiryRate // ignore: cast_nullable_to_non_nullable
              as double,
      inquiryToBookingRate: null == inquiryToBookingRate
          ? _value.inquiryToBookingRate
          : inquiryToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
      viewToBookingRate: null == viewToBookingRate
          ? _value.viewToBookingRate
          : viewToBookingRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceFunnelConversionDMImpl implements _ServiceFunnelConversionDM {
  const _$ServiceFunnelConversionDMImpl(
      {@JsonKey(name: 'view_to_inquiry_rate') this.viewToInquiryRate = 0.0,
      @JsonKey(name: 'inquiry_to_booking_rate') this.inquiryToBookingRate = 0.0,
      @JsonKey(name: 'view_to_booking_rate') this.viewToBookingRate = 0.0});

  factory _$ServiceFunnelConversionDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceFunnelConversionDMImplFromJson(json);

  @override
  @JsonKey(name: 'view_to_inquiry_rate')
  final double viewToInquiryRate;
  @override
  @JsonKey(name: 'inquiry_to_booking_rate')
  final double inquiryToBookingRate;
  @override
  @JsonKey(name: 'view_to_booking_rate')
  final double viewToBookingRate;

  @override
  String toString() {
    return 'ServiceFunnelConversionDM(viewToInquiryRate: $viewToInquiryRate, inquiryToBookingRate: $inquiryToBookingRate, viewToBookingRate: $viewToBookingRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceFunnelConversionDMImpl &&
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

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceFunnelConversionDMImplCopyWith<_$ServiceFunnelConversionDMImpl>
      get copyWith => __$$ServiceFunnelConversionDMImplCopyWithImpl<
          _$ServiceFunnelConversionDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceFunnelConversionDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceFunnelConversionDM implements ServiceFunnelConversionDM {
  const factory _ServiceFunnelConversionDM(
      {@JsonKey(name: 'view_to_inquiry_rate') final double viewToInquiryRate,
      @JsonKey(name: 'inquiry_to_booking_rate')
      final double inquiryToBookingRate,
      @JsonKey(name: 'view_to_booking_rate')
      final double viewToBookingRate}) = _$ServiceFunnelConversionDMImpl;

  factory _ServiceFunnelConversionDM.fromJson(Map<String, dynamic> json) =
      _$ServiceFunnelConversionDMImpl.fromJson;

  @override
  @JsonKey(name: 'view_to_inquiry_rate')
  double get viewToInquiryRate;
  @override
  @JsonKey(name: 'inquiry_to_booking_rate')
  double get inquiryToBookingRate;
  @override
  @JsonKey(name: 'view_to_booking_rate')
  double get viewToBookingRate;

  /// Create a copy of ServiceFunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceFunnelConversionDMImplCopyWith<_$ServiceFunnelConversionDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceDailySeriesDM _$ServiceDailySeriesDMFromJson(Map<String, dynamic> json) {
  return _ServiceDailySeriesDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceDailySeriesDM {
  @JsonKey(name: 'bookings_daily')
  List<DailyPointDM> get bookingsDaily => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily => throw _privateConstructorUsedError;
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily => throw _privateConstructorUsedError;

  /// Serializes this ServiceDailySeriesDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceDailySeriesDMCopyWith<ServiceDailySeriesDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDailySeriesDMCopyWith<$Res> {
  factory $ServiceDailySeriesDMCopyWith(ServiceDailySeriesDM value,
          $Res Function(ServiceDailySeriesDM) then) =
      _$ServiceDailySeriesDMCopyWithImpl<$Res, ServiceDailySeriesDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class _$ServiceDailySeriesDMCopyWithImpl<$Res,
        $Val extends ServiceDailySeriesDM>
    implements $ServiceDailySeriesDMCopyWith<$Res> {
  _$ServiceDailySeriesDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsDaily = null,
    Object? reviewsDaily = null,
    Object? eventsDaily = null,
  }) {
    return _then(_value.copyWith(
      bookingsDaily: null == bookingsDaily
          ? _value.bookingsDaily
          : bookingsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _value.reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _value.eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceDailySeriesDMImplCopyWith<$Res>
    implements $ServiceDailySeriesDMCopyWith<$Res> {
  factory _$$ServiceDailySeriesDMImplCopyWith(_$ServiceDailySeriesDMImpl value,
          $Res Function(_$ServiceDailySeriesDMImpl) then) =
      __$$ServiceDailySeriesDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_daily') List<DailyPointDM> bookingsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class __$$ServiceDailySeriesDMImplCopyWithImpl<$Res>
    extends _$ServiceDailySeriesDMCopyWithImpl<$Res, _$ServiceDailySeriesDMImpl>
    implements _$$ServiceDailySeriesDMImplCopyWith<$Res> {
  __$$ServiceDailySeriesDMImplCopyWithImpl(_$ServiceDailySeriesDMImpl _value,
      $Res Function(_$ServiceDailySeriesDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsDaily = null,
    Object? reviewsDaily = null,
    Object? eventsDaily = null,
  }) {
    return _then(_$ServiceDailySeriesDMImpl(
      bookingsDaily: null == bookingsDaily
          ? _value._bookingsDaily
          : bookingsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _value._reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _value._eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceDailySeriesDMImpl implements _ServiceDailySeriesDM {
  const _$ServiceDailySeriesDMImpl(
      {@JsonKey(name: 'bookings_daily')
      final List<DailyPointDM> bookingsDaily = const [],
      @JsonKey(name: 'reviews_daily')
      final List<DailyPointDM> reviewsDaily = const [],
      @JsonKey(name: 'events_daily')
      final List<DailyPointDM> eventsDaily = const []})
      : _bookingsDaily = bookingsDaily,
        _reviewsDaily = reviewsDaily,
        _eventsDaily = eventsDaily;

  factory _$ServiceDailySeriesDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceDailySeriesDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceDailySeriesDM(bookingsDaily: $bookingsDaily, reviewsDaily: $reviewsDaily, eventsDaily: $eventsDaily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDailySeriesDMImpl &&
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

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDailySeriesDMImplCopyWith<_$ServiceDailySeriesDMImpl>
      get copyWith =>
          __$$ServiceDailySeriesDMImplCopyWithImpl<_$ServiceDailySeriesDMImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceDailySeriesDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceDailySeriesDM implements ServiceDailySeriesDM {
  const factory _ServiceDailySeriesDM(
      {@JsonKey(name: 'bookings_daily') final List<DailyPointDM> bookingsDaily,
      @JsonKey(name: 'reviews_daily') final List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'events_daily')
      final List<DailyPointDM> eventsDaily}) = _$ServiceDailySeriesDMImpl;

  factory _ServiceDailySeriesDM.fromJson(Map<String, dynamic> json) =
      _$ServiceDailySeriesDMImpl.fromJson;

  @override
  @JsonKey(name: 'bookings_daily')
  List<DailyPointDM> get bookingsDaily;
  @override
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily;
  @override
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily;

  /// Create a copy of ServiceDailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceDailySeriesDMImplCopyWith<_$ServiceDailySeriesDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceBreakdownsDM _$ServiceBreakdownsDMFromJson(Map<String, dynamic> json) {
  return _ServiceBreakdownsDM.fromJson(json);
}

/// @nodoc
mixin _$ServiceBreakdownsDM {
  @JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
  List<BreakdownItemDM> get bookingsByStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'top_packages')
  List<TopServicePackageDM> get topPackages =>
      throw _privateConstructorUsedError;

  /// Serializes this ServiceBreakdownsDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceBreakdownsDMCopyWith<ServiceBreakdownsDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceBreakdownsDMCopyWith<$Res> {
  factory $ServiceBreakdownsDMCopyWith(
          ServiceBreakdownsDM value, $Res Function(ServiceBreakdownsDM) then) =
      _$ServiceBreakdownsDMCopyWithImpl<$Res, ServiceBreakdownsDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      List<BreakdownItemDM> bookingsByStatus,
      @JsonKey(name: 'top_packages') List<TopServicePackageDM> topPackages});
}

/// @nodoc
class _$ServiceBreakdownsDMCopyWithImpl<$Res, $Val extends ServiceBreakdownsDM>
    implements $ServiceBreakdownsDMCopyWith<$Res> {
  _$ServiceBreakdownsDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsByStatus = null,
    Object? topPackages = null,
  }) {
    return _then(_value.copyWith(
      bookingsByStatus: null == bookingsByStatus
          ? _value.bookingsByStatus
          : bookingsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topPackages: null == topPackages
          ? _value.topPackages
          : topPackages // ignore: cast_nullable_to_non_nullable
              as List<TopServicePackageDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceBreakdownsDMImplCopyWith<$Res>
    implements $ServiceBreakdownsDMCopyWith<$Res> {
  factory _$$ServiceBreakdownsDMImplCopyWith(_$ServiceBreakdownsDMImpl value,
          $Res Function(_$ServiceBreakdownsDMImpl) then) =
      __$$ServiceBreakdownsDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      List<BreakdownItemDM> bookingsByStatus,
      @JsonKey(name: 'top_packages') List<TopServicePackageDM> topPackages});
}

/// @nodoc
class __$$ServiceBreakdownsDMImplCopyWithImpl<$Res>
    extends _$ServiceBreakdownsDMCopyWithImpl<$Res, _$ServiceBreakdownsDMImpl>
    implements _$$ServiceBreakdownsDMImplCopyWith<$Res> {
  __$$ServiceBreakdownsDMImplCopyWithImpl(_$ServiceBreakdownsDMImpl _value,
      $Res Function(_$ServiceBreakdownsDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsByStatus = null,
    Object? topPackages = null,
  }) {
    return _then(_$ServiceBreakdownsDMImpl(
      bookingsByStatus: null == bookingsByStatus
          ? _value._bookingsByStatus
          : bookingsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topPackages: null == topPackages
          ? _value._topPackages
          : topPackages // ignore: cast_nullable_to_non_nullable
              as List<TopServicePackageDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceBreakdownsDMImpl implements _ServiceBreakdownsDM {
  const _$ServiceBreakdownsDMImpl(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      final List<BreakdownItemDM> bookingsByStatus = const [],
      @JsonKey(name: 'top_packages')
      final List<TopServicePackageDM> topPackages = const []})
      : _bookingsByStatus = bookingsByStatus,
        _topPackages = topPackages;

  factory _$ServiceBreakdownsDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceBreakdownsDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceBreakdownsDM(bookingsByStatus: $bookingsByStatus, topPackages: $topPackages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceBreakdownsDMImpl &&
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

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceBreakdownsDMImplCopyWith<_$ServiceBreakdownsDMImpl> get copyWith =>
      __$$ServiceBreakdownsDMImplCopyWithImpl<_$ServiceBreakdownsDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceBreakdownsDMImplToJson(
      this,
    );
  }
}

abstract class _ServiceBreakdownsDM implements ServiceBreakdownsDM {
  const factory _ServiceBreakdownsDM(
      {@JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
      final List<BreakdownItemDM> bookingsByStatus,
      @JsonKey(name: 'top_packages')
      final List<TopServicePackageDM> topPackages}) = _$ServiceBreakdownsDMImpl;

  factory _ServiceBreakdownsDM.fromJson(Map<String, dynamic> json) =
      _$ServiceBreakdownsDMImpl.fromJson;

  @override
  @JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
  List<BreakdownItemDM> get bookingsByStatus;
  @override
  @JsonKey(name: 'top_packages')
  List<TopServicePackageDM> get topPackages;

  /// Create a copy of ServiceBreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceBreakdownsDMImplCopyWith<_$ServiceBreakdownsDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopServicePackageDM _$TopServicePackageDMFromJson(Map<String, dynamic> json) {
  return _TopServicePackageDM.fromJson(json);
}

/// @nodoc
mixin _$TopServicePackageDM {
  @JsonKey(name: 'package_uuid')
  String get packageUuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_type')
  String get priceType => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookings_count')
  int get bookingsCount => throw _privateConstructorUsedError;

  /// Serializes this TopServicePackageDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopServicePackageDMCopyWith<TopServicePackageDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopServicePackageDMCopyWith<$Res> {
  factory $TopServicePackageDMCopyWith(
          TopServicePackageDM value, $Res Function(TopServicePackageDM) then) =
      _$TopServicePackageDMCopyWithImpl<$Res, TopServicePackageDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'package_uuid') String packageUuid,
      String title,
      @JsonKey(name: 'price_type') String priceType,
      double price,
      @JsonKey(name: 'bookings_count') int bookingsCount});
}

/// @nodoc
class _$TopServicePackageDMCopyWithImpl<$Res, $Val extends TopServicePackageDM>
    implements $TopServicePackageDMCopyWith<$Res> {
  _$TopServicePackageDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      packageUuid: null == packageUuid
          ? _value.packageUuid
          : packageUuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bookingsCount: null == bookingsCount
          ? _value.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopServicePackageDMImplCopyWith<$Res>
    implements $TopServicePackageDMCopyWith<$Res> {
  factory _$$TopServicePackageDMImplCopyWith(_$TopServicePackageDMImpl value,
          $Res Function(_$TopServicePackageDMImpl) then) =
      __$$TopServicePackageDMImplCopyWithImpl<$Res>;
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
class __$$TopServicePackageDMImplCopyWithImpl<$Res>
    extends _$TopServicePackageDMCopyWithImpl<$Res, _$TopServicePackageDMImpl>
    implements _$$TopServicePackageDMImplCopyWith<$Res> {
  __$$TopServicePackageDMImplCopyWithImpl(_$TopServicePackageDMImpl _value,
      $Res Function(_$TopServicePackageDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$TopServicePackageDMImpl(
      packageUuid: null == packageUuid
          ? _value.packageUuid
          : packageUuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bookingsCount: null == bookingsCount
          ? _value.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopServicePackageDMImpl implements _TopServicePackageDM {
  const _$TopServicePackageDMImpl(
      {@JsonKey(name: 'package_uuid') this.packageUuid = '',
      this.title = '',
      @JsonKey(name: 'price_type') this.priceType = '',
      this.price = 0.0,
      @JsonKey(name: 'bookings_count') this.bookingsCount = 0});

  factory _$TopServicePackageDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopServicePackageDMImplFromJson(json);

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

  @override
  String toString() {
    return 'TopServicePackageDM(packageUuid: $packageUuid, title: $title, priceType: $priceType, price: $price, bookingsCount: $bookingsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopServicePackageDMImpl &&
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

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopServicePackageDMImplCopyWith<_$TopServicePackageDMImpl> get copyWith =>
      __$$TopServicePackageDMImplCopyWithImpl<_$TopServicePackageDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopServicePackageDMImplToJson(
      this,
    );
  }
}

abstract class _TopServicePackageDM implements TopServicePackageDM {
  const factory _TopServicePackageDM(
          {@JsonKey(name: 'package_uuid') final String packageUuid,
          final String title,
          @JsonKey(name: 'price_type') final String priceType,
          final double price,
          @JsonKey(name: 'bookings_count') final int bookingsCount}) =
      _$TopServicePackageDMImpl;

  factory _TopServicePackageDM.fromJson(Map<String, dynamic> json) =
      _$TopServicePackageDMImpl.fromJson;

  @override
  @JsonKey(name: 'package_uuid')
  String get packageUuid;
  @override
  String get title;
  @override
  @JsonKey(name: 'price_type')
  String get priceType;
  @override
  double get price;
  @override
  @JsonKey(name: 'bookings_count')
  int get bookingsCount;

  /// Create a copy of TopServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopServicePackageDMImplCopyWith<_$TopServicePackageDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsMetaDM _$AnalyticsMetaDMFromJson(Map<String, dynamic> json) {
  return _AnalyticsMetaDM.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsMetaDM {
  @JsonKey(name: 'generated_at')
  String? get generatedAt => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsMetaDMCopyWith<AnalyticsMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsMetaDMCopyWith<$Res> {
  factory $AnalyticsMetaDMCopyWith(
          AnalyticsMetaDM value, $Res Function(AnalyticsMetaDM) then) =
      _$AnalyticsMetaDMCopyWithImpl<$Res, AnalyticsMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'generated_at') String? generatedAt, String source});
}

/// @nodoc
class _$AnalyticsMetaDMCopyWithImpl<$Res, $Val extends AnalyticsMetaDM>
    implements $AnalyticsMetaDMCopyWith<$Res> {
  _$AnalyticsMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = freezed,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsMetaDMImplCopyWith<$Res>
    implements $AnalyticsMetaDMCopyWith<$Res> {
  factory _$$AnalyticsMetaDMImplCopyWith(_$AnalyticsMetaDMImpl value,
          $Res Function(_$AnalyticsMetaDMImpl) then) =
      __$$AnalyticsMetaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'generated_at') String? generatedAt, String source});
}

/// @nodoc
class __$$AnalyticsMetaDMImplCopyWithImpl<$Res>
    extends _$AnalyticsMetaDMCopyWithImpl<$Res, _$AnalyticsMetaDMImpl>
    implements _$$AnalyticsMetaDMImplCopyWith<$Res> {
  __$$AnalyticsMetaDMImplCopyWithImpl(
      _$AnalyticsMetaDMImpl _value, $Res Function(_$AnalyticsMetaDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = freezed,
    Object? source = null,
  }) {
    return _then(_$AnalyticsMetaDMImpl(
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsMetaDMImpl implements _AnalyticsMetaDM {
  const _$AnalyticsMetaDMImpl(
      {@JsonKey(name: 'generated_at') this.generatedAt, this.source = ''});

  factory _$AnalyticsMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsMetaDMImplFromJson(json);

  @override
  @JsonKey(name: 'generated_at')
  final String? generatedAt;
  @override
  @JsonKey()
  final String source;

  @override
  String toString() {
    return 'AnalyticsMetaDM(generatedAt: $generatedAt, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsMetaDMImpl &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, generatedAt, source);

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsMetaDMImplCopyWith<_$AnalyticsMetaDMImpl> get copyWith =>
      __$$AnalyticsMetaDMImplCopyWithImpl<_$AnalyticsMetaDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsMetaDMImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsMetaDM implements AnalyticsMetaDM {
  const factory _AnalyticsMetaDM(
      {@JsonKey(name: 'generated_at') final String? generatedAt,
      final String source}) = _$AnalyticsMetaDMImpl;

  factory _AnalyticsMetaDM.fromJson(Map<String, dynamic> json) =
      _$AnalyticsMetaDMImpl.fromJson;

  @override
  @JsonKey(name: 'generated_at')
  String? get generatedAt;
  @override
  String get source;

  /// Create a copy of AnalyticsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsMetaDMImplCopyWith<_$AnalyticsMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
