// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesVM {
  FoodlyCategories? get currentCategory => throw _privateConstructorUsedError;
  FoodlyCarouselController? get carouselController =>
      throw _privateConstructorUsedError;
  List<BusinessDM> get nearbyBusinesses => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  BusinessResultsViewMode get viewMode =>
      throw _privateConstructorUsedError; // **Default 10 km (2026-05-19):** subido desde 5 km original para mitigar
// la sensación de "Foodly no tiene cobertura" durante el bootstrap, donde
// hay pocos negocios por ciudad. Con 5 km, un negocio a 7 km del usuario
// quedaba escondido y el discovery se sentía vacío sin estarlo. El
// selector visible (`radiusDistanceOptions = [5, 10, 15, 25]` en
// `categories_page.dart`) permite al usuario bajar a 5 km cuando quiera
// resultados más cercanos. Cuando la densidad de negocios por ciudad
// crezca lo suficiente, considerar volver a 5 km como default.
  double get radiusDistanceInKm => throw _privateConstructorUsedError;
  bool get isSwitchingRadius =>
      throw _privateConstructorUsedError; // Catering & Chefs — active service_type chip (null = "All").
  ServiceType? get selectedServiceType =>
      throw _privateConstructorUsedError; // Discovery ordering (distance | priceAsc | ratingDesc).
  DiscoveryOrdering get ordering => throw _privateConstructorUsedError;

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriesVMCopyWith<CategoriesVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesVMCopyWith<$Res> {
  factory $CategoriesVMCopyWith(
          CategoriesVM value, $Res Function(CategoriesVM) then) =
      _$CategoriesVMCopyWithImpl<$Res, CategoriesVM>;
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
class _$CategoriesVMCopyWithImpl<$Res, $Val extends CategoriesVM>
    implements $CategoriesVMCopyWith<$Res> {
  _$CategoriesVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      currentCategory: freezed == currentCategory
          ? _value.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      carouselController: freezed == carouselController
          ? _value.carouselController
          : carouselController // ignore: cast_nullable_to_non_nullable
              as FoodlyCarouselController?,
      nearbyBusinesses: null == nearbyBusinesses
          ? _value.nearbyBusinesses
          : nearbyBusinesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      radiusDistanceInKm: null == radiusDistanceInKm
          ? _value.radiusDistanceInKm
          : radiusDistanceInKm // ignore: cast_nullable_to_non_nullable
              as double,
      isSwitchingRadius: null == isSwitchingRadius
          ? _value.isSwitchingRadius
          : isSwitchingRadius // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedServiceType: freezed == selectedServiceType
          ? _value.selectedServiceType
          : selectedServiceType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
      ordering: null == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as DiscoveryOrdering,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesVMImplCopyWith<$Res>
    implements $CategoriesVMCopyWith<$Res> {
  factory _$$CategoriesVMImplCopyWith(
          _$CategoriesVMImpl value, $Res Function(_$CategoriesVMImpl) then) =
      __$$CategoriesVMImplCopyWithImpl<$Res>;
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
class __$$CategoriesVMImplCopyWithImpl<$Res>
    extends _$CategoriesVMCopyWithImpl<$Res, _$CategoriesVMImpl>
    implements _$$CategoriesVMImplCopyWith<$Res> {
  __$$CategoriesVMImplCopyWithImpl(
      _$CategoriesVMImpl _value, $Res Function(_$CategoriesVMImpl) _then)
      : super(_value, _then);

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
    return _then(_$CategoriesVMImpl(
      currentCategory: freezed == currentCategory
          ? _value.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      carouselController: freezed == carouselController
          ? _value.carouselController
          : carouselController // ignore: cast_nullable_to_non_nullable
              as FoodlyCarouselController?,
      nearbyBusinesses: null == nearbyBusinesses
          ? _value._nearbyBusinesses
          : nearbyBusinesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      radiusDistanceInKm: null == radiusDistanceInKm
          ? _value.radiusDistanceInKm
          : radiusDistanceInKm // ignore: cast_nullable_to_non_nullable
              as double,
      isSwitchingRadius: null == isSwitchingRadius
          ? _value.isSwitchingRadius
          : isSwitchingRadius // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedServiceType: freezed == selectedServiceType
          ? _value.selectedServiceType
          : selectedServiceType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
      ordering: null == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as DiscoveryOrdering,
    ));
  }
}

/// @nodoc

class _$CategoriesVMImpl extends _CategoriesVM {
  const _$CategoriesVMImpl(
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

  @override
  String toString() {
    return 'CategoriesVM(currentCategory: $currentCategory, carouselController: $carouselController, nearbyBusinesses: $nearbyBusinesses, latitude: $latitude, longitude: $longitude, viewMode: $viewMode, radiusDistanceInKm: $radiusDistanceInKm, isSwitchingRadius: $isSwitchingRadius, selectedServiceType: $selectedServiceType, ordering: $ordering)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesVMImpl &&
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

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesVMImplCopyWith<_$CategoriesVMImpl> get copyWith =>
      __$$CategoriesVMImplCopyWithImpl<_$CategoriesVMImpl>(this, _$identity);
}

abstract class _CategoriesVM extends CategoriesVM {
  const factory _CategoriesVM(
      {final FoodlyCategories? currentCategory,
      final FoodlyCarouselController? carouselController,
      final List<BusinessDM> nearbyBusinesses,
      final double? latitude,
      final double? longitude,
      final BusinessResultsViewMode viewMode,
      final double radiusDistanceInKm,
      final bool isSwitchingRadius,
      final ServiceType? selectedServiceType,
      final DiscoveryOrdering ordering}) = _$CategoriesVMImpl;
  const _CategoriesVM._() : super._();

  @override
  FoodlyCategories? get currentCategory;
  @override
  FoodlyCarouselController? get carouselController;
  @override
  List<BusinessDM> get nearbyBusinesses;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  BusinessResultsViewMode
      get viewMode; // **Default 10 km (2026-05-19):** subido desde 5 km original para mitigar
// la sensación de "Foodly no tiene cobertura" durante el bootstrap, donde
// hay pocos negocios por ciudad. Con 5 km, un negocio a 7 km del usuario
// quedaba escondido y el discovery se sentía vacío sin estarlo. El
// selector visible (`radiusDistanceOptions = [5, 10, 15, 25]` en
// `categories_page.dart`) permite al usuario bajar a 5 km cuando quiera
// resultados más cercanos. Cuando la densidad de negocios por ciudad
// crezca lo suficiente, considerar volver a 5 km como default.
  @override
  double get radiusDistanceInKm;
  @override
  bool
      get isSwitchingRadius; // Catering & Chefs — active service_type chip (null = "All").
  @override
  ServiceType?
      get selectedServiceType; // Discovery ordering (distance | priceAsc | ratingDesc).
  @override
  DiscoveryOrdering get ordering;

  /// Create a copy of CategoriesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesVMImplCopyWith<_$CategoriesVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
