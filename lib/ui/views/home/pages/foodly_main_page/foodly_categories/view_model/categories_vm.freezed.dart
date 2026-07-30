// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesVM {
  FoodlyCategories? get currentCategory;
  FoodlyCarouselController? get carouselController;
  List<BusinessDM> get nearbyBusinesses;
  double? get latitude;
  double? get longitude;
  BusinessResultsViewMode
      get viewMode; // **Default 10 km (2026-05-19):** subido desde 5 km original para mitigar
// la sensación de "Foodly no tiene cobertura" durante el bootstrap, donde
// hay pocos negocios por ciudad. Con 5 km, un negocio a 7 km del usuario
// quedaba escondido y el discovery se sentía vacío sin estarlo. El
// selector visible (`radiusDistanceOptions = [5, 10, 15, 25]` en
// `categories_page.dart`) permite al usuario bajar a 5 km cuando quiera
// resultados más cercanos. Cuando la densidad de negocios por ciudad
// crezca lo suficiente, considerar volver a 5 km como default.
  double get radiusDistanceInKm;
  bool
      get isSwitchingRadius; // Catering & Chefs — active service_type chip (null = "All").
  ServiceType?
      get selectedServiceType; // Discovery ordering (distance | priceAsc | ratingDesc).
  DiscoveryOrdering get ordering;

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesVMCopyWith<CategoriesVM> get copyWith =>
      _$CategoriesVMCopyWithImpl<CategoriesVM>(
          this as CategoriesVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesVM &&
            (identical(other.currentCategory, currentCategory) ||
                other.currentCategory == currentCategory) &&
            (identical(other.carouselController, carouselController) ||
                other.carouselController == carouselController) &&
            const DeepCollectionEquality()
                .equals(other.nearbyBusinesses, nearbyBusinesses) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.radiusDistanceInKm, radiusDistanceInKm) ||
                other.radiusDistanceInKm == radiusDistanceInKm) &&
            (identical(other.isSwitchingRadius, isSwitchingRadius) ||
                other.isSwitchingRadius == isSwitchingRadius) &&
            (identical(other.selectedServiceType, selectedServiceType) ||
                other.selectedServiceType == selectedServiceType) &&
            (identical(other.ordering, ordering) ||
                other.ordering == ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentCategory,
      carouselController,
      const DeepCollectionEquality().hash(nearbyBusinesses),
      latitude,
      longitude,
      viewMode,
      radiusDistanceInKm,
      isSwitchingRadius,
      selectedServiceType,
      ordering);

  @override
  String toString() {
    return 'CategoriesVM(currentCategory: $currentCategory, carouselController: $carouselController, nearbyBusinesses: $nearbyBusinesses, latitude: $latitude, longitude: $longitude, viewMode: $viewMode, radiusDistanceInKm: $radiusDistanceInKm, isSwitchingRadius: $isSwitchingRadius, selectedServiceType: $selectedServiceType, ordering: $ordering)';
  }
}

/// @nodoc
abstract mixin class $CategoriesVMCopyWith<$Res> {
  factory $CategoriesVMCopyWith(
          CategoriesVM value, $Res Function(CategoriesVM) _then) =
      _$CategoriesVMCopyWithImpl;
  @useResult
  $Res call(
      {FoodlyCategories? currentCategory,
      FoodlyCarouselController? carouselController,
      List<BusinessDM> nearbyBusinesses,
      double? latitude,
      double? longitude,
      BusinessResultsViewMode viewMode,
      double radiusDistanceInKm,
      bool isSwitchingRadius,
      ServiceType? selectedServiceType,
      DiscoveryOrdering ordering});
}

/// @nodoc
class _$CategoriesVMCopyWithImpl<$Res> implements $CategoriesVMCopyWith<$Res> {
  _$CategoriesVMCopyWithImpl(this._self, this._then);

  final CategoriesVM _self;
  final $Res Function(CategoriesVM) _then;

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCategory = freezed,
    Object? carouselController = freezed,
    Object? nearbyBusinesses = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? viewMode = null,
    Object? radiusDistanceInKm = null,
    Object? isSwitchingRadius = null,
    Object? selectedServiceType = freezed,
    Object? ordering = null,
  }) {
    return _then(_self.copyWith(
      currentCategory: freezed == currentCategory
          ? _self.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      carouselController: freezed == carouselController
          ? _self.carouselController
          : carouselController // ignore: cast_nullable_to_non_nullable
              as FoodlyCarouselController?,
      nearbyBusinesses: null == nearbyBusinesses
          ? _self.nearbyBusinesses
          : nearbyBusinesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      radiusDistanceInKm: null == radiusDistanceInKm
          ? _self.radiusDistanceInKm
          : radiusDistanceInKm // ignore: cast_nullable_to_non_nullable
              as double,
      isSwitchingRadius: null == isSwitchingRadius
          ? _self.isSwitchingRadius
          : isSwitchingRadius // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedServiceType: freezed == selectedServiceType
          ? _self.selectedServiceType
          : selectedServiceType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
      ordering: null == ordering
          ? _self.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as DiscoveryOrdering,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoriesVM].
extension CategoriesVMPatterns on CategoriesVM {
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
    TResult Function(_CategoriesVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesVM() when $default != null:
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
    TResult Function(_CategoriesVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesVM():
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
    TResult? Function(_CategoriesVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesVM() when $default != null:
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
            FoodlyCategories? currentCategory,
            FoodlyCarouselController? carouselController,
            List<BusinessDM> nearbyBusinesses,
            double? latitude,
            double? longitude,
            BusinessResultsViewMode viewMode,
            double radiusDistanceInKm,
            bool isSwitchingRadius,
            ServiceType? selectedServiceType,
            DiscoveryOrdering ordering)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesVM() when $default != null:
        return $default(
            _that.currentCategory,
            _that.carouselController,
            _that.nearbyBusinesses,
            _that.latitude,
            _that.longitude,
            _that.viewMode,
            _that.radiusDistanceInKm,
            _that.isSwitchingRadius,
            _that.selectedServiceType,
            _that.ordering);
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
            FoodlyCategories? currentCategory,
            FoodlyCarouselController? carouselController,
            List<BusinessDM> nearbyBusinesses,
            double? latitude,
            double? longitude,
            BusinessResultsViewMode viewMode,
            double radiusDistanceInKm,
            bool isSwitchingRadius,
            ServiceType? selectedServiceType,
            DiscoveryOrdering ordering)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesVM():
        return $default(
            _that.currentCategory,
            _that.carouselController,
            _that.nearbyBusinesses,
            _that.latitude,
            _that.longitude,
            _that.viewMode,
            _that.radiusDistanceInKm,
            _that.isSwitchingRadius,
            _that.selectedServiceType,
            _that.ordering);
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
            FoodlyCategories? currentCategory,
            FoodlyCarouselController? carouselController,
            List<BusinessDM> nearbyBusinesses,
            double? latitude,
            double? longitude,
            BusinessResultsViewMode viewMode,
            double radiusDistanceInKm,
            bool isSwitchingRadius,
            ServiceType? selectedServiceType,
            DiscoveryOrdering ordering)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesVM() when $default != null:
        return $default(
            _that.currentCategory,
            _that.carouselController,
            _that.nearbyBusinesses,
            _that.latitude,
            _that.longitude,
            _that.viewMode,
            _that.radiusDistanceInKm,
            _that.isSwitchingRadius,
            _that.selectedServiceType,
            _that.ordering);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoriesVM extends CategoriesVM {
  const _CategoriesVM(
      {this.currentCategory,
      this.carouselController,
      final List<BusinessDM> nearbyBusinesses = const [],
      this.latitude,
      this.longitude,
      this.viewMode = BusinessResultsViewMode.list,
      this.radiusDistanceInKm = 10,
      this.isSwitchingRadius = false,
      this.selectedServiceType,
      this.ordering = DiscoveryOrdering.distance})
      : _nearbyBusinesses = nearbyBusinesses,
        super._();

  @override
  final FoodlyCategories? currentCategory;
  @override
  final FoodlyCarouselController? carouselController;
  final List<BusinessDM> _nearbyBusinesses;
  @override
  @JsonKey()
  List<BusinessDM> get nearbyBusinesses {
    if (_nearbyBusinesses is EqualUnmodifiableListView)
      return _nearbyBusinesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nearbyBusinesses);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey()
  final BusinessResultsViewMode viewMode;
// **Default 10 km (2026-05-19):** subido desde 5 km original para mitigar
// la sensación de "Foodly no tiene cobertura" durante el bootstrap, donde
// hay pocos negocios por ciudad. Con 5 km, un negocio a 7 km del usuario
// quedaba escondido y el discovery se sentía vacío sin estarlo. El
// selector visible (`radiusDistanceOptions = [5, 10, 15, 25]` en
// `categories_page.dart`) permite al usuario bajar a 5 km cuando quiera
// resultados más cercanos. Cuando la densidad de negocios por ciudad
// crezca lo suficiente, considerar volver a 5 km como default.
  @override
  @JsonKey()
  final double radiusDistanceInKm;
  @override
  @JsonKey()
  final bool isSwitchingRadius;
// Catering & Chefs — active service_type chip (null = "All").
  @override
  final ServiceType? selectedServiceType;
// Discovery ordering (distance | priceAsc | ratingDesc).
  @override
  @JsonKey()
  final DiscoveryOrdering ordering;

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoriesVMCopyWith<_CategoriesVM> get copyWith =>
      __$CategoriesVMCopyWithImpl<_CategoriesVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesVM &&
            (identical(other.currentCategory, currentCategory) ||
                other.currentCategory == currentCategory) &&
            (identical(other.carouselController, carouselController) ||
                other.carouselController == carouselController) &&
            const DeepCollectionEquality()
                .equals(other._nearbyBusinesses, _nearbyBusinesses) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.radiusDistanceInKm, radiusDistanceInKm) ||
                other.radiusDistanceInKm == radiusDistanceInKm) &&
            (identical(other.isSwitchingRadius, isSwitchingRadius) ||
                other.isSwitchingRadius == isSwitchingRadius) &&
            (identical(other.selectedServiceType, selectedServiceType) ||
                other.selectedServiceType == selectedServiceType) &&
            (identical(other.ordering, ordering) ||
                other.ordering == ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentCategory,
      carouselController,
      const DeepCollectionEquality().hash(_nearbyBusinesses),
      latitude,
      longitude,
      viewMode,
      radiusDistanceInKm,
      isSwitchingRadius,
      selectedServiceType,
      ordering);

  @override
  String toString() {
    return 'CategoriesVM(currentCategory: $currentCategory, carouselController: $carouselController, nearbyBusinesses: $nearbyBusinesses, latitude: $latitude, longitude: $longitude, viewMode: $viewMode, radiusDistanceInKm: $radiusDistanceInKm, isSwitchingRadius: $isSwitchingRadius, selectedServiceType: $selectedServiceType, ordering: $ordering)';
  }
}

/// @nodoc
abstract mixin class _$CategoriesVMCopyWith<$Res>
    implements $CategoriesVMCopyWith<$Res> {
  factory _$CategoriesVMCopyWith(
          _CategoriesVM value, $Res Function(_CategoriesVM) _then) =
      __$CategoriesVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {FoodlyCategories? currentCategory,
      FoodlyCarouselController? carouselController,
      List<BusinessDM> nearbyBusinesses,
      double? latitude,
      double? longitude,
      BusinessResultsViewMode viewMode,
      double radiusDistanceInKm,
      bool isSwitchingRadius,
      ServiceType? selectedServiceType,
      DiscoveryOrdering ordering});
}

/// @nodoc
class __$CategoriesVMCopyWithImpl<$Res>
    implements _$CategoriesVMCopyWith<$Res> {
  __$CategoriesVMCopyWithImpl(this._self, this._then);

  final _CategoriesVM _self;
  final $Res Function(_CategoriesVM) _then;

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentCategory = freezed,
    Object? carouselController = freezed,
    Object? nearbyBusinesses = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? viewMode = null,
    Object? radiusDistanceInKm = null,
    Object? isSwitchingRadius = null,
    Object? selectedServiceType = freezed,
    Object? ordering = null,
  }) {
    return _then(_CategoriesVM(
      currentCategory: freezed == currentCategory
          ? _self.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      carouselController: freezed == carouselController
          ? _self.carouselController
          : carouselController // ignore: cast_nullable_to_non_nullable
              as FoodlyCarouselController?,
      nearbyBusinesses: null == nearbyBusinesses
          ? _self._nearbyBusinesses
          : nearbyBusinesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      radiusDistanceInKm: null == radiusDistanceInKm
          ? _self.radiusDistanceInKm
          : radiusDistanceInKm // ignore: cast_nullable_to_non_nullable
              as double,
      isSwitchingRadius: null == isSwitchingRadius
          ? _self.isSwitchingRadius
          : isSwitchingRadius // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedServiceType: freezed == selectedServiceType
          ? _self.selectedServiceType
          : selectedServiceType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
      ordering: null == ordering
          ? _self.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as DiscoveryOrdering,
    ));
  }
}

// dart format on
