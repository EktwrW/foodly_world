// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalyticsVM {
  /// Business whose analytics we're showing. Carried through the cubit
  /// so widgets can access `categoryId`, `name`, etc. without a lookup.
  /// Nullable to support the empty `initial` state — every real lifecycle
  /// path (`loading`, `loaded`, `error`) is emitted with `business` set.
  BusinessDM? get business => throw _privateConstructorUsedError;

  /// Pre-resolved at cubit construction so `AnalyticsDashboardPage` can
  /// branch synchronously without re-deriving on every rebuild. Default
  /// `restaurant` covers the empty/initial state.
  AnalyticsKind get kind => throw _privateConstructorUsedError;

  /// Restaurant-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.restaurant]. Mutually exclusive with [serviceOverview]
  /// — at most one of the two is non-null per loaded state.
  BusinessOverviewDataDM? get overview => throw _privateConstructorUsedError;

  /// Catering & chefs-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.service]. Mutually exclusive with [overview].
  ServiceOverviewDataDM? get serviceOverview =>
      throw _privateConstructorUsedError;
  int get selectedDays => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsVMCopyWith<AnalyticsVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsVMCopyWith<$Res> {
  factory $AnalyticsVMCopyWith(
          AnalyticsVM value, $Res Function(AnalyticsVM) then) =
      _$AnalyticsVMCopyWithImpl<$Res, AnalyticsVM>;
  @useResult
  $Res call(
      {BusinessDM? business,
      AnalyticsKind kind,
      BusinessOverviewDataDM? overview,
      ServiceOverviewDataDM? serviceOverview,
      int selectedDays});

  $BusinessDMCopyWith<$Res>? get business;
  $BusinessOverviewDataDMCopyWith<$Res>? get overview;
  $ServiceOverviewDataDMCopyWith<$Res>? get serviceOverview;
}

/// @nodoc
class _$AnalyticsVMCopyWithImpl<$Res, $Val extends AnalyticsVM>
    implements $AnalyticsVMCopyWith<$Res> {
  _$AnalyticsVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = freezed,
    Object? kind = null,
    Object? overview = freezed,
    Object? serviceOverview = freezed,
    Object? selectedDays = null,
  }) {
    return _then(_value.copyWith(
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AnalyticsKind,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
      serviceOverview: freezed == serviceOverview
          ? _value.serviceOverview
          : serviceOverview // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_value.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_value.business!, (value) {
      return _then(_value.copyWith(business: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get overview {
    if (_value.overview == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_value.overview!, (value) {
      return _then(_value.copyWith(overview: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<$Res>? get serviceOverview {
    if (_value.serviceOverview == null) {
      return null;
    }

    return $ServiceOverviewDataDMCopyWith<$Res>(_value.serviceOverview!,
        (value) {
      return _then(_value.copyWith(serviceOverview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsVMImplCopyWith<$Res>
    implements $AnalyticsVMCopyWith<$Res> {
  factory _$$AnalyticsVMImplCopyWith(
          _$AnalyticsVMImpl value, $Res Function(_$AnalyticsVMImpl) then) =
      __$$AnalyticsVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BusinessDM? business,
      AnalyticsKind kind,
      BusinessOverviewDataDM? overview,
      ServiceOverviewDataDM? serviceOverview,
      int selectedDays});

  @override
  $BusinessDMCopyWith<$Res>? get business;
  @override
  $BusinessOverviewDataDMCopyWith<$Res>? get overview;
  @override
  $ServiceOverviewDataDMCopyWith<$Res>? get serviceOverview;
}

/// @nodoc
class __$$AnalyticsVMImplCopyWithImpl<$Res>
    extends _$AnalyticsVMCopyWithImpl<$Res, _$AnalyticsVMImpl>
    implements _$$AnalyticsVMImplCopyWith<$Res> {
  __$$AnalyticsVMImplCopyWithImpl(
      _$AnalyticsVMImpl _value, $Res Function(_$AnalyticsVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = freezed,
    Object? kind = null,
    Object? overview = freezed,
    Object? serviceOverview = freezed,
    Object? selectedDays = null,
  }) {
    return _then(_$AnalyticsVMImpl(
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AnalyticsKind,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
      serviceOverview: freezed == serviceOverview
          ? _value.serviceOverview
          : serviceOverview // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AnalyticsVMImpl implements _AnalyticsVM {
  const _$AnalyticsVMImpl(
      {this.business,
      this.kind = AnalyticsKind.restaurant,
      this.overview,
      this.serviceOverview,
      this.selectedDays = 30});

  /// Business whose analytics we're showing. Carried through the cubit
  /// so widgets can access `categoryId`, `name`, etc. without a lookup.
  /// Nullable to support the empty `initial` state — every real lifecycle
  /// path (`loading`, `loaded`, `error`) is emitted with `business` set.
  @override
  final BusinessDM? business;

  /// Pre-resolved at cubit construction so `AnalyticsDashboardPage` can
  /// branch synchronously without re-deriving on every rebuild. Default
  /// `restaurant` covers the empty/initial state.
  @override
  @JsonKey()
  final AnalyticsKind kind;

  /// Restaurant-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.restaurant]. Mutually exclusive with [serviceOverview]
  /// — at most one of the two is non-null per loaded state.
  @override
  final BusinessOverviewDataDM? overview;

  /// Catering & chefs-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.service]. Mutually exclusive with [overview].
  @override
  final ServiceOverviewDataDM? serviceOverview;
  @override
  @JsonKey()
  final int selectedDays;

  @override
  String toString() {
    return 'AnalyticsVM(business: $business, kind: $kind, overview: $overview, serviceOverview: $serviceOverview, selectedDays: $selectedDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsVMImpl &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.serviceOverview, serviceOverview) ||
                other.serviceOverview == serviceOverview) &&
            (identical(other.selectedDays, selectedDays) ||
                other.selectedDays == selectedDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, business, kind, overview, serviceOverview, selectedDays);

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsVMImplCopyWith<_$AnalyticsVMImpl> get copyWith =>
      __$$AnalyticsVMImplCopyWithImpl<_$AnalyticsVMImpl>(this, _$identity);
}

abstract class _AnalyticsVM implements AnalyticsVM {
  const factory _AnalyticsVM(
      {final BusinessDM? business,
      final AnalyticsKind kind,
      final BusinessOverviewDataDM? overview,
      final ServiceOverviewDataDM? serviceOverview,
      final int selectedDays}) = _$AnalyticsVMImpl;

  /// Business whose analytics we're showing. Carried through the cubit
  /// so widgets can access `categoryId`, `name`, etc. without a lookup.
  /// Nullable to support the empty `initial` state — every real lifecycle
  /// path (`loading`, `loaded`, `error`) is emitted with `business` set.
  @override
  BusinessDM? get business;

  /// Pre-resolved at cubit construction so `AnalyticsDashboardPage` can
  /// branch synchronously without re-deriving on every rebuild. Default
  /// `restaurant` covers the empty/initial state.
  @override
  AnalyticsKind get kind;

  /// Restaurant-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.restaurant]. Mutually exclusive with [serviceOverview]
  /// — at most one of the two is non-null per loaded state.
  @override
  BusinessOverviewDataDM? get overview;

  /// Catering & chefs-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.service]. Mutually exclusive with [overview].
  @override
  ServiceOverviewDataDM? get serviceOverview;
  @override
  int get selectedDays;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsVMImplCopyWith<_$AnalyticsVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
