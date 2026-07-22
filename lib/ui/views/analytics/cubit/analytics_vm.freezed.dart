// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsVM {
  /// Business whose analytics we're showing. Carried through the cubit
  /// so widgets can access `categoryId`, `name`, etc. without a lookup.
  /// Nullable to support the empty `initial` state — every real lifecycle
  /// path (`loading`, `loaded`, `error`) is emitted with `business` set.
  BusinessDM? get business;

  /// Pre-resolved at cubit construction so `AnalyticsDashboardPage` can
  /// branch synchronously without re-deriving on every rebuild. Default
  /// `restaurant` covers the empty/initial state.
  AnalyticsKind get kind;

  /// Restaurant-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.restaurant]. Mutually exclusive with [serviceOverview]
  /// — at most one of the two is non-null per loaded state.
  BusinessOverviewDataDM? get overview;

  /// Catering & chefs-flavour payload. Populated only when [kind] is
  /// [AnalyticsKind.service]. Mutually exclusive with [overview].
  ServiceOverviewDataDM? get serviceOverview;
  int get selectedDays;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsVMCopyWith<AnalyticsVM> get copyWith =>
      _$AnalyticsVMCopyWithImpl<AnalyticsVM>(this as AnalyticsVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsVM &&
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

  @override
  String toString() {
    return 'AnalyticsVM(business: $business, kind: $kind, overview: $overview, serviceOverview: $serviceOverview, selectedDays: $selectedDays)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsVMCopyWith<$Res> {
  factory $AnalyticsVMCopyWith(
          AnalyticsVM value, $Res Function(AnalyticsVM) _then) =
      _$AnalyticsVMCopyWithImpl;
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
class _$AnalyticsVMCopyWithImpl<$Res> implements $AnalyticsVMCopyWith<$Res> {
  _$AnalyticsVMCopyWithImpl(this._self, this._then);

  final AnalyticsVM _self;
  final $Res Function(AnalyticsVM) _then;

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
    return _then(_self.copyWith(
      business: freezed == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AnalyticsKind,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
      serviceOverview: freezed == serviceOverview
          ? _self.serviceOverview
          : serviceOverview // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
      selectedDays: null == selectedDays
          ? _self.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_self.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.business!, (value) {
      return _then(_self.copyWith(business: value));
    });
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get overview {
    if (_self.overview == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_self.overview!, (value) {
      return _then(_self.copyWith(overview: value));
    });
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<$Res>? get serviceOverview {
    if (_self.serviceOverview == null) {
      return null;
    }

    return $ServiceOverviewDataDMCopyWith<$Res>(_self.serviceOverview!,
        (value) {
      return _then(_self.copyWith(serviceOverview: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AnalyticsVM].
extension AnalyticsVMPatterns on AnalyticsVM {
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
    TResult Function(_AnalyticsVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsVM() when $default != null:
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
    TResult Function(_AnalyticsVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsVM():
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
    TResult? Function(_AnalyticsVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsVM() when $default != null:
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
            BusinessDM? business,
            AnalyticsKind kind,
            BusinessOverviewDataDM? overview,
            ServiceOverviewDataDM? serviceOverview,
            int selectedDays)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsVM() when $default != null:
        return $default(_that.business, _that.kind, _that.overview,
            _that.serviceOverview, _that.selectedDays);
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
            BusinessDM? business,
            AnalyticsKind kind,
            BusinessOverviewDataDM? overview,
            ServiceOverviewDataDM? serviceOverview,
            int selectedDays)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsVM():
        return $default(_that.business, _that.kind, _that.overview,
            _that.serviceOverview, _that.selectedDays);
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
            BusinessDM? business,
            AnalyticsKind kind,
            BusinessOverviewDataDM? overview,
            ServiceOverviewDataDM? serviceOverview,
            int selectedDays)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsVM() when $default != null:
        return $default(_that.business, _that.kind, _that.overview,
            _that.serviceOverview, _that.selectedDays);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AnalyticsVM implements AnalyticsVM {
  const _AnalyticsVM(
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

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsVMCopyWith<_AnalyticsVM> get copyWith =>
      __$AnalyticsVMCopyWithImpl<_AnalyticsVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsVM &&
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

  @override
  String toString() {
    return 'AnalyticsVM(business: $business, kind: $kind, overview: $overview, serviceOverview: $serviceOverview, selectedDays: $selectedDays)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsVMCopyWith<$Res>
    implements $AnalyticsVMCopyWith<$Res> {
  factory _$AnalyticsVMCopyWith(
          _AnalyticsVM value, $Res Function(_AnalyticsVM) _then) =
      __$AnalyticsVMCopyWithImpl;
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
class __$AnalyticsVMCopyWithImpl<$Res> implements _$AnalyticsVMCopyWith<$Res> {
  __$AnalyticsVMCopyWithImpl(this._self, this._then);

  final _AnalyticsVM _self;
  final $Res Function(_AnalyticsVM) _then;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? business = freezed,
    Object? kind = null,
    Object? overview = freezed,
    Object? serviceOverview = freezed,
    Object? selectedDays = null,
  }) {
    return _then(_AnalyticsVM(
      business: freezed == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AnalyticsKind,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
      serviceOverview: freezed == serviceOverview
          ? _self.serviceOverview
          : serviceOverview // ignore: cast_nullable_to_non_nullable
              as ServiceOverviewDataDM?,
      selectedDays: null == selectedDays
          ? _self.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_self.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.business!, (value) {
      return _then(_self.copyWith(business: value));
    });
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get overview {
    if (_self.overview == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_self.overview!, (value) {
      return _then(_self.copyWith(overview: value));
    });
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceOverviewDataDMCopyWith<$Res>? get serviceOverview {
    if (_self.serviceOverview == null) {
      return null;
    }

    return $ServiceOverviewDataDMCopyWith<$Res>(_self.serviceOverview!,
        (value) {
      return _then(_self.copyWith(serviceOverview: value));
    });
  }
}

// dart format on
