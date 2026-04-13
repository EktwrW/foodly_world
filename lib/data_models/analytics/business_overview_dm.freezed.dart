// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_overview_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessOverviewResponseDM _$BusinessOverviewResponseDMFromJson(
    Map<String, dynamic> json) {
  return _BusinessOverviewResponseDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessOverviewResponseDM {
  BusinessOverviewDataDM? get data => throw _privateConstructorUsedError;

  /// Serializes this BusinessOverviewResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessOverviewResponseDMCopyWith<BusinessOverviewResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessOverviewResponseDMCopyWith<$Res> {
  factory $BusinessOverviewResponseDMCopyWith(BusinessOverviewResponseDM value,
          $Res Function(BusinessOverviewResponseDM) then) =
      _$BusinessOverviewResponseDMCopyWithImpl<$Res,
          BusinessOverviewResponseDM>;
  @useResult
  $Res call({BusinessOverviewDataDM? data});

  $BusinessOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$BusinessOverviewResponseDMCopyWithImpl<$Res,
        $Val extends BusinessOverviewResponseDM>
    implements $BusinessOverviewResponseDMCopyWith<$Res> {
  _$BusinessOverviewResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
    ) as $Val);
  }

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessOverviewResponseDMImplCopyWith<$Res>
    implements $BusinessOverviewResponseDMCopyWith<$Res> {
  factory _$$BusinessOverviewResponseDMImplCopyWith(
          _$BusinessOverviewResponseDMImpl value,
          $Res Function(_$BusinessOverviewResponseDMImpl) then) =
      __$$BusinessOverviewResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BusinessOverviewDataDM? data});

  @override
  $BusinessOverviewDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BusinessOverviewResponseDMImplCopyWithImpl<$Res>
    extends _$BusinessOverviewResponseDMCopyWithImpl<$Res,
        _$BusinessOverviewResponseDMImpl>
    implements _$$BusinessOverviewResponseDMImplCopyWith<$Res> {
  __$$BusinessOverviewResponseDMImplCopyWithImpl(
      _$BusinessOverviewResponseDMImpl _value,
      $Res Function(_$BusinessOverviewResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BusinessOverviewResponseDMImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessOverviewResponseDMImpl implements _BusinessOverviewResponseDM {
  const _$BusinessOverviewResponseDMImpl({this.data});

  factory _$BusinessOverviewResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessOverviewResponseDMImplFromJson(json);

  @override
  final BusinessOverviewDataDM? data;

  @override
  String toString() {
    return 'BusinessOverviewResponseDM(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessOverviewResponseDMImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessOverviewResponseDMImplCopyWith<_$BusinessOverviewResponseDMImpl>
      get copyWith => __$$BusinessOverviewResponseDMImplCopyWithImpl<
          _$BusinessOverviewResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessOverviewResponseDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessOverviewResponseDM
    implements BusinessOverviewResponseDM {
  const factory _BusinessOverviewResponseDM(
      {final BusinessOverviewDataDM? data}) = _$BusinessOverviewResponseDMImpl;

  factory _BusinessOverviewResponseDM.fromJson(Map<String, dynamic> json) =
      _$BusinessOverviewResponseDMImpl.fromJson;

  @override
  BusinessOverviewDataDM? get data;

  /// Create a copy of BusinessOverviewResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessOverviewResponseDMImplCopyWith<_$BusinessOverviewResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessOverviewDataDM _$BusinessOverviewDataDMFromJson(
    Map<String, dynamic> json) {
  return _BusinessOverviewDataDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessOverviewDataDM {
  KpisDM? get kpis => throw _privateConstructorUsedError;
  FunnelDM? get funnel => throw _privateConstructorUsedError;
  @JsonKey(name: 'series')
  DailySeriesDM? get series => throw _privateConstructorUsedError;
  BreakdownsDM? get breakdowns => throw _privateConstructorUsedError;

  /// Serializes this BusinessOverviewDataDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessOverviewDataDMCopyWith<BusinessOverviewDataDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessOverviewDataDMCopyWith<$Res> {
  factory $BusinessOverviewDataDMCopyWith(BusinessOverviewDataDM value,
          $Res Function(BusinessOverviewDataDM) then) =
      _$BusinessOverviewDataDMCopyWithImpl<$Res, BusinessOverviewDataDM>;
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
class _$BusinessOverviewDataDMCopyWithImpl<$Res,
        $Val extends BusinessOverviewDataDM>
    implements $BusinessOverviewDataDMCopyWith<$Res> {
  _$BusinessOverviewDataDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      kpis: freezed == kpis
          ? _value.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as KpisDM?,
      funnel: freezed == funnel
          ? _value.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as FunnelDM?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as DailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _value.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as BreakdownsDM?,
    ) as $Val);
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpisDMCopyWith<$Res>? get kpis {
    if (_value.kpis == null) {
      return null;
    }

    return $KpisDMCopyWith<$Res>(_value.kpis!, (value) {
      return _then(_value.copyWith(kpis: value) as $Val);
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunnelDMCopyWith<$Res>? get funnel {
    if (_value.funnel == null) {
      return null;
    }

    return $FunnelDMCopyWith<$Res>(_value.funnel!, (value) {
      return _then(_value.copyWith(funnel: value) as $Val);
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailySeriesDMCopyWith<$Res>? get series {
    if (_value.series == null) {
      return null;
    }

    return $DailySeriesDMCopyWith<$Res>(_value.series!, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BreakdownsDMCopyWith<$Res>? get breakdowns {
    if (_value.breakdowns == null) {
      return null;
    }

    return $BreakdownsDMCopyWith<$Res>(_value.breakdowns!, (value) {
      return _then(_value.copyWith(breakdowns: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessOverviewDataDMImplCopyWith<$Res>
    implements $BusinessOverviewDataDMCopyWith<$Res> {
  factory _$$BusinessOverviewDataDMImplCopyWith(
          _$BusinessOverviewDataDMImpl value,
          $Res Function(_$BusinessOverviewDataDMImpl) then) =
      __$$BusinessOverviewDataDMImplCopyWithImpl<$Res>;
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
class __$$BusinessOverviewDataDMImplCopyWithImpl<$Res>
    extends _$BusinessOverviewDataDMCopyWithImpl<$Res,
        _$BusinessOverviewDataDMImpl>
    implements _$$BusinessOverviewDataDMImplCopyWith<$Res> {
  __$$BusinessOverviewDataDMImplCopyWithImpl(
      _$BusinessOverviewDataDMImpl _value,
      $Res Function(_$BusinessOverviewDataDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$BusinessOverviewDataDMImpl(
      kpis: freezed == kpis
          ? _value.kpis
          : kpis // ignore: cast_nullable_to_non_nullable
              as KpisDM?,
      funnel: freezed == funnel
          ? _value.funnel
          : funnel // ignore: cast_nullable_to_non_nullable
              as FunnelDM?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as DailySeriesDM?,
      breakdowns: freezed == breakdowns
          ? _value.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as BreakdownsDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessOverviewDataDMImpl implements _BusinessOverviewDataDM {
  const _$BusinessOverviewDataDMImpl(
      {this.kpis,
      this.funnel,
      @JsonKey(name: 'series') this.series,
      this.breakdowns});

  factory _$BusinessOverviewDataDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessOverviewDataDMImplFromJson(json);

  @override
  final KpisDM? kpis;
  @override
  final FunnelDM? funnel;
  @override
  @JsonKey(name: 'series')
  final DailySeriesDM? series;
  @override
  final BreakdownsDM? breakdowns;

  @override
  String toString() {
    return 'BusinessOverviewDataDM(kpis: $kpis, funnel: $funnel, series: $series, breakdowns: $breakdowns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessOverviewDataDMImpl &&
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

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessOverviewDataDMImplCopyWith<_$BusinessOverviewDataDMImpl>
      get copyWith => __$$BusinessOverviewDataDMImplCopyWithImpl<
          _$BusinessOverviewDataDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessOverviewDataDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessOverviewDataDM implements BusinessOverviewDataDM {
  const factory _BusinessOverviewDataDM(
      {final KpisDM? kpis,
      final FunnelDM? funnel,
      @JsonKey(name: 'series') final DailySeriesDM? series,
      final BreakdownsDM? breakdowns}) = _$BusinessOverviewDataDMImpl;

  factory _BusinessOverviewDataDM.fromJson(Map<String, dynamic> json) =
      _$BusinessOverviewDataDMImpl.fromJson;

  @override
  KpisDM? get kpis;
  @override
  FunnelDM? get funnel;
  @override
  @JsonKey(name: 'series')
  DailySeriesDM? get series;
  @override
  BreakdownsDM? get breakdowns;

  /// Create a copy of BusinessOverviewDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessOverviewDataDMImplCopyWith<_$BusinessOverviewDataDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

KpisDM _$KpisDMFromJson(Map<String, dynamic> json) {
  return _KpisDM.fromJson(json);
}

/// @nodoc
mixin _$KpisDM {
  @JsonKey(name: 'reservations_total')
  int get reservationsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_success_rate')
  double get reservationSuccessRate => throw _privateConstructorUsedError;
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

  /// Serializes this KpisDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KpisDMCopyWith<KpisDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KpisDMCopyWith<$Res> {
  factory $KpisDMCopyWith(KpisDM value, $Res Function(KpisDM) then) =
      _$KpisDMCopyWithImpl<$Res, KpisDM>;
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
class _$KpisDMCopyWithImpl<$Res, $Val extends KpisDM>
    implements $KpisDMCopyWith<$Res> {
  _$KpisDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      reservationsTotal: null == reservationsTotal
          ? _value.reservationsTotal
          : reservationsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reservationSuccessRate: null == reservationSuccessRate
          ? _value.reservationSuccessRate
          : reservationSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$KpisDMImplCopyWith<$Res> implements $KpisDMCopyWith<$Res> {
  factory _$$KpisDMImplCopyWith(
          _$KpisDMImpl value, $Res Function(_$KpisDMImpl) then) =
      __$$KpisDMImplCopyWithImpl<$Res>;
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
class __$$KpisDMImplCopyWithImpl<$Res>
    extends _$KpisDMCopyWithImpl<$Res, _$KpisDMImpl>
    implements _$$KpisDMImplCopyWith<$Res> {
  __$$KpisDMImplCopyWithImpl(
      _$KpisDMImpl _value, $Res Function(_$KpisDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$KpisDMImpl(
      reservationsTotal: null == reservationsTotal
          ? _value.reservationsTotal
          : reservationsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      reservationSuccessRate: null == reservationSuccessRate
          ? _value.reservationSuccessRate
          : reservationSuccessRate // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$KpisDMImpl implements _KpisDM {
  const _$KpisDMImpl(
      {@JsonKey(name: 'reservations_total') this.reservationsTotal = 0,
      @JsonKey(name: 'reservation_success_rate')
      this.reservationSuccessRate = 0.0,
      @JsonKey(name: 'reviews_total') this.reviewsTotal = 0,
      @JsonKey(name: 'reviews_avg_rating') this.reviewsAvgRating = 0.0,
      @JsonKey(name: 'favorites_total') this.favoritesTotal = 0,
      @JsonKey(name: 'favorites_unique_users') this.favoritesUniqueUsers = 0,
      @JsonKey(name: 'events_total') this.eventsTotal = 0});

  factory _$KpisDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$KpisDMImplFromJson(json);

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

  @override
  String toString() {
    return 'KpisDM(reservationsTotal: $reservationsTotal, reservationSuccessRate: $reservationSuccessRate, reviewsTotal: $reviewsTotal, reviewsAvgRating: $reviewsAvgRating, favoritesTotal: $favoritesTotal, favoritesUniqueUsers: $favoritesUniqueUsers, eventsTotal: $eventsTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KpisDMImpl &&
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

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KpisDMImplCopyWith<_$KpisDMImpl> get copyWith =>
      __$$KpisDMImplCopyWithImpl<_$KpisDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KpisDMImplToJson(
      this,
    );
  }
}

abstract class _KpisDM implements KpisDM {
  const factory _KpisDM(
      {@JsonKey(name: 'reservations_total') final int reservationsTotal,
      @JsonKey(name: 'reservation_success_rate')
      final double reservationSuccessRate,
      @JsonKey(name: 'reviews_total') final int reviewsTotal,
      @JsonKey(name: 'reviews_avg_rating') final double reviewsAvgRating,
      @JsonKey(name: 'favorites_total') final int favoritesTotal,
      @JsonKey(name: 'favorites_unique_users') final int favoritesUniqueUsers,
      @JsonKey(name: 'events_total') final int eventsTotal}) = _$KpisDMImpl;

  factory _KpisDM.fromJson(Map<String, dynamic> json) = _$KpisDMImpl.fromJson;

  @override
  @JsonKey(name: 'reservations_total')
  int get reservationsTotal;
  @override
  @JsonKey(name: 'reservation_success_rate')
  double get reservationSuccessRate;
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

  /// Create a copy of KpisDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KpisDMImplCopyWith<_$KpisDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunnelDM _$FunnelDMFromJson(Map<String, dynamic> json) {
  return _FunnelDM.fromJson(json);
}

/// @nodoc
mixin _$FunnelDM {
  List<FunnelStepDM> get steps => throw _privateConstructorUsedError;
  FunnelConversionDM? get conversion => throw _privateConstructorUsedError;

  /// Serializes this FunnelDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunnelDMCopyWith<FunnelDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunnelDMCopyWith<$Res> {
  factory $FunnelDMCopyWith(FunnelDM value, $Res Function(FunnelDM) then) =
      _$FunnelDMCopyWithImpl<$Res, FunnelDM>;
  @useResult
  $Res call({List<FunnelStepDM> steps, FunnelConversionDM? conversion});

  $FunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class _$FunnelDMCopyWithImpl<$Res, $Val extends FunnelDM>
    implements $FunnelDMCopyWith<$Res> {
  _$FunnelDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunnelDM
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
              as FunnelConversionDM?,
    ) as $Val);
  }

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FunnelConversionDMCopyWith<$Res>? get conversion {
    if (_value.conversion == null) {
      return null;
    }

    return $FunnelConversionDMCopyWith<$Res>(_value.conversion!, (value) {
      return _then(_value.copyWith(conversion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FunnelDMImplCopyWith<$Res>
    implements $FunnelDMCopyWith<$Res> {
  factory _$$FunnelDMImplCopyWith(
          _$FunnelDMImpl value, $Res Function(_$FunnelDMImpl) then) =
      __$$FunnelDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FunnelStepDM> steps, FunnelConversionDM? conversion});

  @override
  $FunnelConversionDMCopyWith<$Res>? get conversion;
}

/// @nodoc
class __$$FunnelDMImplCopyWithImpl<$Res>
    extends _$FunnelDMCopyWithImpl<$Res, _$FunnelDMImpl>
    implements _$$FunnelDMImplCopyWith<$Res> {
  __$$FunnelDMImplCopyWithImpl(
      _$FunnelDMImpl _value, $Res Function(_$FunnelDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? conversion = freezed,
  }) {
    return _then(_$FunnelDMImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<FunnelStepDM>,
      conversion: freezed == conversion
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as FunnelConversionDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FunnelDMImpl implements _FunnelDM {
  const _$FunnelDMImpl(
      {final List<FunnelStepDM> steps = const [], this.conversion})
      : _steps = steps;

  factory _$FunnelDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunnelDMImplFromJson(json);

  final List<FunnelStepDM> _steps;
  @override
  @JsonKey()
  List<FunnelStepDM> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final FunnelConversionDM? conversion;

  @override
  String toString() {
    return 'FunnelDM(steps: $steps, conversion: $conversion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunnelDMImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_steps), conversion);

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunnelDMImplCopyWith<_$FunnelDMImpl> get copyWith =>
      __$$FunnelDMImplCopyWithImpl<_$FunnelDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunnelDMImplToJson(
      this,
    );
  }
}

abstract class _FunnelDM implements FunnelDM {
  const factory _FunnelDM(
      {final List<FunnelStepDM> steps,
      final FunnelConversionDM? conversion}) = _$FunnelDMImpl;

  factory _FunnelDM.fromJson(Map<String, dynamic> json) =
      _$FunnelDMImpl.fromJson;

  @override
  List<FunnelStepDM> get steps;
  @override
  FunnelConversionDM? get conversion;

  /// Create a copy of FunnelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunnelDMImplCopyWith<_$FunnelDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunnelStepDM _$FunnelStepDMFromJson(Map<String, dynamic> json) {
  return _FunnelStepDM.fromJson(json);
}

/// @nodoc
mixin _$FunnelStepDM {
  String get label => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this FunnelStepDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunnelStepDMCopyWith<FunnelStepDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunnelStepDMCopyWith<$Res> {
  factory $FunnelStepDMCopyWith(
          FunnelStepDM value, $Res Function(FunnelStepDM) then) =
      _$FunnelStepDMCopyWithImpl<$Res, FunnelStepDM>;
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class _$FunnelStepDMCopyWithImpl<$Res, $Val extends FunnelStepDM>
    implements $FunnelStepDMCopyWith<$Res> {
  _$FunnelStepDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FunnelStepDMImplCopyWith<$Res>
    implements $FunnelStepDMCopyWith<$Res> {
  factory _$$FunnelStepDMImplCopyWith(
          _$FunnelStepDMImpl value, $Res Function(_$FunnelStepDMImpl) then) =
      __$$FunnelStepDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class __$$FunnelStepDMImplCopyWithImpl<$Res>
    extends _$FunnelStepDMCopyWithImpl<$Res, _$FunnelStepDMImpl>
    implements _$$FunnelStepDMImplCopyWith<$Res> {
  __$$FunnelStepDMImplCopyWithImpl(
      _$FunnelStepDMImpl _value, $Res Function(_$FunnelStepDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$FunnelStepDMImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FunnelStepDMImpl implements _FunnelStepDM {
  const _$FunnelStepDMImpl({this.label = '', this.value = 0});

  factory _$FunnelStepDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunnelStepDMImplFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'FunnelStepDM(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunnelStepDMImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunnelStepDMImplCopyWith<_$FunnelStepDMImpl> get copyWith =>
      __$$FunnelStepDMImplCopyWithImpl<_$FunnelStepDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunnelStepDMImplToJson(
      this,
    );
  }
}

abstract class _FunnelStepDM implements FunnelStepDM {
  const factory _FunnelStepDM({final String label, final int value}) =
      _$FunnelStepDMImpl;

  factory _FunnelStepDM.fromJson(Map<String, dynamic> json) =
      _$FunnelStepDMImpl.fromJson;

  @override
  String get label;
  @override
  int get value;

  /// Create a copy of FunnelStepDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunnelStepDMImplCopyWith<_$FunnelStepDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunnelConversionDM _$FunnelConversionDMFromJson(Map<String, dynamic> json) {
  return _FunnelConversionDM.fromJson(json);
}

/// @nodoc
mixin _$FunnelConversionDM {
  @JsonKey(name: 'open_to_cta_rate')
  double get openToCtaRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_to_reservation_rate')
  double get openToReservationRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'cta_to_reservation_rate')
  double get ctaToReservationRate => throw _privateConstructorUsedError;

  /// Serializes this FunnelConversionDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunnelConversionDMCopyWith<FunnelConversionDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunnelConversionDMCopyWith<$Res> {
  factory $FunnelConversionDMCopyWith(
          FunnelConversionDM value, $Res Function(FunnelConversionDM) then) =
      _$FunnelConversionDMCopyWithImpl<$Res, FunnelConversionDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
      @JsonKey(name: 'open_to_reservation_rate') double openToReservationRate,
      @JsonKey(name: 'cta_to_reservation_rate') double ctaToReservationRate});
}

/// @nodoc
class _$FunnelConversionDMCopyWithImpl<$Res, $Val extends FunnelConversionDM>
    implements $FunnelConversionDMCopyWith<$Res> {
  _$FunnelConversionDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openToCtaRate = null,
    Object? openToReservationRate = null,
    Object? ctaToReservationRate = null,
  }) {
    return _then(_value.copyWith(
      openToCtaRate: null == openToCtaRate
          ? _value.openToCtaRate
          : openToCtaRate // ignore: cast_nullable_to_non_nullable
              as double,
      openToReservationRate: null == openToReservationRate
          ? _value.openToReservationRate
          : openToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
      ctaToReservationRate: null == ctaToReservationRate
          ? _value.ctaToReservationRate
          : ctaToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FunnelConversionDMImplCopyWith<$Res>
    implements $FunnelConversionDMCopyWith<$Res> {
  factory _$$FunnelConversionDMImplCopyWith(_$FunnelConversionDMImpl value,
          $Res Function(_$FunnelConversionDMImpl) then) =
      __$$FunnelConversionDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'open_to_cta_rate') double openToCtaRate,
      @JsonKey(name: 'open_to_reservation_rate') double openToReservationRate,
      @JsonKey(name: 'cta_to_reservation_rate') double ctaToReservationRate});
}

/// @nodoc
class __$$FunnelConversionDMImplCopyWithImpl<$Res>
    extends _$FunnelConversionDMCopyWithImpl<$Res, _$FunnelConversionDMImpl>
    implements _$$FunnelConversionDMImplCopyWith<$Res> {
  __$$FunnelConversionDMImplCopyWithImpl(_$FunnelConversionDMImpl _value,
      $Res Function(_$FunnelConversionDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openToCtaRate = null,
    Object? openToReservationRate = null,
    Object? ctaToReservationRate = null,
  }) {
    return _then(_$FunnelConversionDMImpl(
      openToCtaRate: null == openToCtaRate
          ? _value.openToCtaRate
          : openToCtaRate // ignore: cast_nullable_to_non_nullable
              as double,
      openToReservationRate: null == openToReservationRate
          ? _value.openToReservationRate
          : openToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
      ctaToReservationRate: null == ctaToReservationRate
          ? _value.ctaToReservationRate
          : ctaToReservationRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FunnelConversionDMImpl implements _FunnelConversionDM {
  const _$FunnelConversionDMImpl(
      {@JsonKey(name: 'open_to_cta_rate') this.openToCtaRate = 0.0,
      @JsonKey(name: 'open_to_reservation_rate') this.openToReservationRate = 0.0,
      @JsonKey(name: 'cta_to_reservation_rate') this.ctaToReservationRate = 0.0});

  factory _$FunnelConversionDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunnelConversionDMImplFromJson(json);

  @override
  @JsonKey(name: 'open_to_cta_rate')
  final double openToCtaRate;
  @override
  @JsonKey(name: 'open_to_reservation_rate')
  final double openToReservationRate;
  @override
  @JsonKey(name: 'cta_to_reservation_rate')
  final double ctaToReservationRate;

  @override
  String toString() {
    return 'FunnelConversionDM(openToCtaRate: $openToCtaRate, openToReservationRate: $openToReservationRate, ctaToReservationRate: $ctaToReservationRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunnelConversionDMImpl &&
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

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunnelConversionDMImplCopyWith<_$FunnelConversionDMImpl> get copyWith =>
      __$$FunnelConversionDMImplCopyWithImpl<_$FunnelConversionDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunnelConversionDMImplToJson(
      this,
    );
  }
}

abstract class _FunnelConversionDM implements FunnelConversionDM {
  const factory _FunnelConversionDM(
      {@JsonKey(name: 'open_to_cta_rate') final double openToCtaRate,
      @JsonKey(name: 'open_to_reservation_rate') final double openToReservationRate,
      @JsonKey(name: 'cta_to_reservation_rate')
      final double ctaToReservationRate}) = _$FunnelConversionDMImpl;

  factory _FunnelConversionDM.fromJson(Map<String, dynamic> json) =
      _$FunnelConversionDMImpl.fromJson;

  @override
  @JsonKey(name: 'open_to_cta_rate')
  double get openToCtaRate;
  @override
  @JsonKey(name: 'open_to_reservation_rate')
  double get openToReservationRate;
  @override
  @JsonKey(name: 'cta_to_reservation_rate')
  double get ctaToReservationRate;

  /// Create a copy of FunnelConversionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunnelConversionDMImplCopyWith<_$FunnelConversionDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailySeriesDM _$DailySeriesDMFromJson(Map<String, dynamic> json) {
  return _DailySeriesDM.fromJson(json);
}

/// @nodoc
mixin _$DailySeriesDM {
  @JsonKey(name: 'reservations_daily')
  List<DailyPointDM> get reservationsDaily =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorites_daily')
  List<DailyPointDM> get favoritesDaily => throw _privateConstructorUsedError;
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily => throw _privateConstructorUsedError;

  /// Serializes this DailySeriesDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySeriesDMCopyWith<DailySeriesDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySeriesDMCopyWith<$Res> {
  factory $DailySeriesDMCopyWith(
          DailySeriesDM value, $Res Function(DailySeriesDM) then) =
      _$DailySeriesDMCopyWithImpl<$Res, DailySeriesDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_daily')
      List<DailyPointDM> reservationsDaily,
      @JsonKey(name: 'reviews_daily') List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'favorites_daily') List<DailyPointDM> favoritesDaily,
      @JsonKey(name: 'events_daily') List<DailyPointDM> eventsDaily});
}

/// @nodoc
class _$DailySeriesDMCopyWithImpl<$Res, $Val extends DailySeriesDM>
    implements $DailySeriesDMCopyWith<$Res> {
  _$DailySeriesDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      reservationsDaily: null == reservationsDaily
          ? _value.reservationsDaily
          : reservationsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _value.reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      favoritesDaily: null == favoritesDaily
          ? _value.favoritesDaily
          : favoritesDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      eventsDaily: null == eventsDaily
          ? _value.eventsDaily
          : eventsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySeriesDMImplCopyWith<$Res>
    implements $DailySeriesDMCopyWith<$Res> {
  factory _$$DailySeriesDMImplCopyWith(
          _$DailySeriesDMImpl value, $Res Function(_$DailySeriesDMImpl) then) =
      __$$DailySeriesDMImplCopyWithImpl<$Res>;
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
class __$$DailySeriesDMImplCopyWithImpl<$Res>
    extends _$DailySeriesDMCopyWithImpl<$Res, _$DailySeriesDMImpl>
    implements _$$DailySeriesDMImplCopyWith<$Res> {
  __$$DailySeriesDMImplCopyWithImpl(
      _$DailySeriesDMImpl _value, $Res Function(_$DailySeriesDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$DailySeriesDMImpl(
      reservationsDaily: null == reservationsDaily
          ? _value._reservationsDaily
          : reservationsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      reviewsDaily: null == reviewsDaily
          ? _value._reviewsDaily
          : reviewsDaily // ignore: cast_nullable_to_non_nullable
              as List<DailyPointDM>,
      favoritesDaily: null == favoritesDaily
          ? _value._favoritesDaily
          : favoritesDaily // ignore: cast_nullable_to_non_nullable
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
class _$DailySeriesDMImpl implements _DailySeriesDM {
  const _$DailySeriesDMImpl(
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

  factory _$DailySeriesDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySeriesDMImplFromJson(json);

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

  @override
  String toString() {
    return 'DailySeriesDM(reservationsDaily: $reservationsDaily, reviewsDaily: $reviewsDaily, favoritesDaily: $favoritesDaily, eventsDaily: $eventsDaily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySeriesDMImpl &&
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

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySeriesDMImplCopyWith<_$DailySeriesDMImpl> get copyWith =>
      __$$DailySeriesDMImplCopyWithImpl<_$DailySeriesDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySeriesDMImplToJson(
      this,
    );
  }
}

abstract class _DailySeriesDM implements DailySeriesDM {
  const factory _DailySeriesDM(
      {@JsonKey(name: 'reservations_daily')
      final List<DailyPointDM> reservationsDaily,
      @JsonKey(name: 'reviews_daily') final List<DailyPointDM> reviewsDaily,
      @JsonKey(name: 'favorites_daily') final List<DailyPointDM> favoritesDaily,
      @JsonKey(name: 'events_daily')
      final List<DailyPointDM> eventsDaily}) = _$DailySeriesDMImpl;

  factory _DailySeriesDM.fromJson(Map<String, dynamic> json) =
      _$DailySeriesDMImpl.fromJson;

  @override
  @JsonKey(name: 'reservations_daily')
  List<DailyPointDM> get reservationsDaily;
  @override
  @JsonKey(name: 'reviews_daily')
  List<DailyPointDM> get reviewsDaily;
  @override
  @JsonKey(name: 'favorites_daily')
  List<DailyPointDM> get favoritesDaily;
  @override
  @JsonKey(name: 'events_daily')
  List<DailyPointDM> get eventsDaily;

  /// Create a copy of DailySeriesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySeriesDMImplCopyWith<_$DailySeriesDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyPointDM _$DailyPointDMFromJson(Map<String, dynamic> json) {
  return _DailyPointDM.fromJson(json);
}

/// @nodoc
mixin _$DailyPointDM {
  String get date => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this DailyPointDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyPointDMCopyWith<DailyPointDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPointDMCopyWith<$Res> {
  factory $DailyPointDMCopyWith(
          DailyPointDM value, $Res Function(DailyPointDM) then) =
      _$DailyPointDMCopyWithImpl<$Res, DailyPointDM>;
  @useResult
  $Res call({String date, int value});
}

/// @nodoc
class _$DailyPointDMCopyWithImpl<$Res, $Val extends DailyPointDM>
    implements $DailyPointDMCopyWith<$Res> {
  _$DailyPointDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPointDMImplCopyWith<$Res>
    implements $DailyPointDMCopyWith<$Res> {
  factory _$$DailyPointDMImplCopyWith(
          _$DailyPointDMImpl value, $Res Function(_$DailyPointDMImpl) then) =
      __$$DailyPointDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int value});
}

/// @nodoc
class __$$DailyPointDMImplCopyWithImpl<$Res>
    extends _$DailyPointDMCopyWithImpl<$Res, _$DailyPointDMImpl>
    implements _$$DailyPointDMImplCopyWith<$Res> {
  __$$DailyPointDMImplCopyWithImpl(
      _$DailyPointDMImpl _value, $Res Function(_$DailyPointDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_$DailyPointDMImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyPointDMImpl implements _DailyPointDM {
  const _$DailyPointDMImpl({this.date = '', this.value = 0});

  factory _$DailyPointDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPointDMImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'DailyPointDM(date: $date, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPointDMImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, value);

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPointDMImplCopyWith<_$DailyPointDMImpl> get copyWith =>
      __$$DailyPointDMImplCopyWithImpl<_$DailyPointDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPointDMImplToJson(
      this,
    );
  }
}

abstract class _DailyPointDM implements DailyPointDM {
  const factory _DailyPointDM({final String date, final int value}) =
      _$DailyPointDMImpl;

  factory _DailyPointDM.fromJson(Map<String, dynamic> json) =
      _$DailyPointDMImpl.fromJson;

  @override
  String get date;
  @override
  int get value;

  /// Create a copy of DailyPointDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyPointDMImplCopyWith<_$DailyPointDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreakdownsDM _$BreakdownsDMFromJson(Map<String, dynamic> json) {
  return _BreakdownsDM.fromJson(json);
}

/// @nodoc
mixin _$BreakdownsDM {
  @JsonKey(name: 'reservations_by_status')
  List<BreakdownItemDM> get reservationsByStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'top_event_types')
  List<BreakdownItemDM> get topEventTypes => throw _privateConstructorUsedError;

  /// Serializes this BreakdownsDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakdownsDMCopyWith<BreakdownsDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakdownsDMCopyWith<$Res> {
  factory $BreakdownsDMCopyWith(
          BreakdownsDM value, $Res Function(BreakdownsDM) then) =
      _$BreakdownsDMCopyWithImpl<$Res, BreakdownsDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_by_status')
      List<BreakdownItemDM> reservationsByStatus,
      @JsonKey(name: 'top_event_types') List<BreakdownItemDM> topEventTypes});
}

/// @nodoc
class _$BreakdownsDMCopyWithImpl<$Res, $Val extends BreakdownsDM>
    implements $BreakdownsDMCopyWith<$Res> {
  _$BreakdownsDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationsByStatus = null,
    Object? topEventTypes = null,
  }) {
    return _then(_value.copyWith(
      reservationsByStatus: null == reservationsByStatus
          ? _value.reservationsByStatus
          : reservationsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topEventTypes: null == topEventTypes
          ? _value.topEventTypes
          : topEventTypes // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreakdownsDMImplCopyWith<$Res>
    implements $BreakdownsDMCopyWith<$Res> {
  factory _$$BreakdownsDMImplCopyWith(
          _$BreakdownsDMImpl value, $Res Function(_$BreakdownsDMImpl) then) =
      __$$BreakdownsDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reservations_by_status')
      List<BreakdownItemDM> reservationsByStatus,
      @JsonKey(name: 'top_event_types') List<BreakdownItemDM> topEventTypes});
}

/// @nodoc
class __$$BreakdownsDMImplCopyWithImpl<$Res>
    extends _$BreakdownsDMCopyWithImpl<$Res, _$BreakdownsDMImpl>
    implements _$$BreakdownsDMImplCopyWith<$Res> {
  __$$BreakdownsDMImplCopyWithImpl(
      _$BreakdownsDMImpl _value, $Res Function(_$BreakdownsDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationsByStatus = null,
    Object? topEventTypes = null,
  }) {
    return _then(_$BreakdownsDMImpl(
      reservationsByStatus: null == reservationsByStatus
          ? _value._reservationsByStatus
          : reservationsByStatus // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
      topEventTypes: null == topEventTypes
          ? _value._topEventTypes
          : topEventTypes // ignore: cast_nullable_to_non_nullable
              as List<BreakdownItemDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakdownsDMImpl implements _BreakdownsDM {
  const _$BreakdownsDMImpl(
      {@JsonKey(name: 'reservations_by_status')
      final List<BreakdownItemDM> reservationsByStatus = const [],
      @JsonKey(name: 'top_event_types')
      final List<BreakdownItemDM> topEventTypes = const []})
      : _reservationsByStatus = reservationsByStatus,
        _topEventTypes = topEventTypes;

  factory _$BreakdownsDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakdownsDMImplFromJson(json);

  final List<BreakdownItemDM> _reservationsByStatus;
  @override
  @JsonKey(name: 'reservations_by_status')
  List<BreakdownItemDM> get reservationsByStatus {
    if (_reservationsByStatus is EqualUnmodifiableListView)
      return _reservationsByStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationsByStatus);
  }

  final List<BreakdownItemDM> _topEventTypes;
  @override
  @JsonKey(name: 'top_event_types')
  List<BreakdownItemDM> get topEventTypes {
    if (_topEventTypes is EqualUnmodifiableListView) return _topEventTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topEventTypes);
  }

  @override
  String toString() {
    return 'BreakdownsDM(reservationsByStatus: $reservationsByStatus, topEventTypes: $topEventTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakdownsDMImpl &&
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

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakdownsDMImplCopyWith<_$BreakdownsDMImpl> get copyWith =>
      __$$BreakdownsDMImplCopyWithImpl<_$BreakdownsDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakdownsDMImplToJson(
      this,
    );
  }
}

abstract class _BreakdownsDM implements BreakdownsDM {
  const factory _BreakdownsDM(
      {@JsonKey(name: 'reservations_by_status')
      final List<BreakdownItemDM> reservationsByStatus,
      @JsonKey(name: 'top_event_types')
      final List<BreakdownItemDM> topEventTypes}) = _$BreakdownsDMImpl;

  factory _BreakdownsDM.fromJson(Map<String, dynamic> json) =
      _$BreakdownsDMImpl.fromJson;

  @override
  @JsonKey(name: 'reservations_by_status')
  List<BreakdownItemDM> get reservationsByStatus;
  @override
  @JsonKey(name: 'top_event_types')
  List<BreakdownItemDM> get topEventTypes;

  /// Create a copy of BreakdownsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakdownsDMImplCopyWith<_$BreakdownsDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreakdownItemDM _$BreakdownItemDMFromJson(Map<String, dynamic> json) {
  return _BreakdownItemDM.fromJson(json);
}

/// @nodoc
mixin _$BreakdownItemDM {
  String get label => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this BreakdownItemDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakdownItemDMCopyWith<BreakdownItemDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakdownItemDMCopyWith<$Res> {
  factory $BreakdownItemDMCopyWith(
          BreakdownItemDM value, $Res Function(BreakdownItemDM) then) =
      _$BreakdownItemDMCopyWithImpl<$Res, BreakdownItemDM>;
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class _$BreakdownItemDMCopyWithImpl<$Res, $Val extends BreakdownItemDM>
    implements $BreakdownItemDMCopyWith<$Res> {
  _$BreakdownItemDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreakdownItemDMImplCopyWith<$Res>
    implements $BreakdownItemDMCopyWith<$Res> {
  factory _$$BreakdownItemDMImplCopyWith(_$BreakdownItemDMImpl value,
          $Res Function(_$BreakdownItemDMImpl) then) =
      __$$BreakdownItemDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class __$$BreakdownItemDMImplCopyWithImpl<$Res>
    extends _$BreakdownItemDMCopyWithImpl<$Res, _$BreakdownItemDMImpl>
    implements _$$BreakdownItemDMImplCopyWith<$Res> {
  __$$BreakdownItemDMImplCopyWithImpl(
      _$BreakdownItemDMImpl _value, $Res Function(_$BreakdownItemDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$BreakdownItemDMImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakdownItemDMImpl implements _BreakdownItemDM {
  const _$BreakdownItemDMImpl({this.label = '', this.value = 0});

  factory _$BreakdownItemDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakdownItemDMImplFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'BreakdownItemDM(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakdownItemDMImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakdownItemDMImplCopyWith<_$BreakdownItemDMImpl> get copyWith =>
      __$$BreakdownItemDMImplCopyWithImpl<_$BreakdownItemDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakdownItemDMImplToJson(
      this,
    );
  }
}

abstract class _BreakdownItemDM implements BreakdownItemDM {
  const factory _BreakdownItemDM({final String label, final int value}) =
      _$BreakdownItemDMImpl;

  factory _BreakdownItemDM.fromJson(Map<String, dynamic> json) =
      _$BreakdownItemDMImpl.fromJson;

  @override
  String get label;
  @override
  int get value;

  /// Create a copy of BreakdownItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakdownItemDMImplCopyWith<_$BreakdownItemDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
