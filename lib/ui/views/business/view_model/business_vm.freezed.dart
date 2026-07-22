// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessVM {
  DashboardEditing get dashboardEditing;
  List<BusinessDM> get myBusinessesses;
  BusinessDM? get currentBusiness;
  List<BusinessServices> get currentBusinessServices;
  List<BusinessCoverImageDM> get picturesPath;
  FoodlyCategories? get newCategory;
  BusinessCoverImageDM? get targetForDelete;
  InputController? get businessNameCtrl;
  InputController? get businessAboutUsCtrl;
  InputController? get businessEmailCtrl;
  InputController? get businessPhoneCtrl;
  InputController? get businessCityCtrl;
  InputController? get businessAddressCtrl;
  InputController? get businessZipCodeCtrl;
  InputController? get businessAdditionalInfoCtrl;
  double? get latitude;
  double? get longitude;
  GlobalKey<FormState>? get nameFormKey;
  GlobalKey<FormState>? get aboutUsFormKey;
  GlobalKey<FormState>? get openingHoursFormKey;
  GlobalKey<FormState>? get servicesFormKey;
  GlobalKey<FormState>? get contactUsFormKey;
  GlobalKey<FormState>? get addInfoFormKey;
  GlobalKey<FormState>? get locationFormKey;
  GlobalKey<FormState>? get categoryFormKey;
  FoodlyCountries? get businessCountry;
  Set<Marker> get markers;
  GoogleMapController? get mapController;
  AutovalidateMode get autovalidateMode;
  BusinessDays get businessDays;
  bool get loggedUserCanEdit;
  InputController? get reservationSizeLimitCtrl;
  bool get allowReservations;

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<BusinessVM> get copyWith =>
      _$BusinessVMCopyWithImpl<BusinessVM>(this as BusinessVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessVM &&
            (identical(other.dashboardEditing, dashboardEditing) ||
                other.dashboardEditing == dashboardEditing) &&
            const DeepCollectionEquality()
                .equals(other.myBusinessesses, myBusinessesses) &&
            (identical(other.currentBusiness, currentBusiness) ||
                other.currentBusiness == currentBusiness) &&
            const DeepCollectionEquality().equals(
                other.currentBusinessServices, currentBusinessServices) &&
            const DeepCollectionEquality()
                .equals(other.picturesPath, picturesPath) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.targetForDelete, targetForDelete) ||
                other.targetForDelete == targetForDelete) &&
            (identical(other.businessNameCtrl, businessNameCtrl) ||
                other.businessNameCtrl == businessNameCtrl) &&
            (identical(other.businessAboutUsCtrl, businessAboutUsCtrl) ||
                other.businessAboutUsCtrl == businessAboutUsCtrl) &&
            (identical(other.businessEmailCtrl, businessEmailCtrl) ||
                other.businessEmailCtrl == businessEmailCtrl) &&
            (identical(other.businessPhoneCtrl, businessPhoneCtrl) ||
                other.businessPhoneCtrl == businessPhoneCtrl) &&
            (identical(other.businessCityCtrl, businessCityCtrl) ||
                other.businessCityCtrl == businessCityCtrl) &&
            (identical(other.businessAddressCtrl, businessAddressCtrl) ||
                other.businessAddressCtrl == businessAddressCtrl) &&
            (identical(other.businessZipCodeCtrl, businessZipCodeCtrl) ||
                other.businessZipCodeCtrl == businessZipCodeCtrl) &&
            (identical(other.businessAdditionalInfoCtrl,
                    businessAdditionalInfoCtrl) ||
                other.businessAdditionalInfoCtrl ==
                    businessAdditionalInfoCtrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.nameFormKey, nameFormKey) ||
                other.nameFormKey == nameFormKey) &&
            (identical(other.aboutUsFormKey, aboutUsFormKey) ||
                other.aboutUsFormKey == aboutUsFormKey) &&
            (identical(other.openingHoursFormKey, openingHoursFormKey) ||
                other.openingHoursFormKey == openingHoursFormKey) &&
            (identical(other.servicesFormKey, servicesFormKey) ||
                other.servicesFormKey == servicesFormKey) &&
            (identical(other.contactUsFormKey, contactUsFormKey) ||
                other.contactUsFormKey == contactUsFormKey) &&
            (identical(other.addInfoFormKey, addInfoFormKey) ||
                other.addInfoFormKey == addInfoFormKey) &&
            (identical(other.locationFormKey, locationFormKey) ||
                other.locationFormKey == locationFormKey) &&
            (identical(other.categoryFormKey, categoryFormKey) ||
                other.categoryFormKey == categoryFormKey) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.businessDays, businessDays) ||
                other.businessDays == businessDays) &&
            (identical(other.loggedUserCanEdit, loggedUserCanEdit) ||
                other.loggedUserCanEdit == loggedUserCanEdit) &&
            (identical(
                    other.reservationSizeLimitCtrl, reservationSizeLimitCtrl) ||
                other.reservationSizeLimitCtrl == reservationSizeLimitCtrl) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        dashboardEditing,
        const DeepCollectionEquality().hash(myBusinessesses),
        currentBusiness,
        const DeepCollectionEquality().hash(currentBusinessServices),
        const DeepCollectionEquality().hash(picturesPath),
        newCategory,
        targetForDelete,
        businessNameCtrl,
        businessAboutUsCtrl,
        businessEmailCtrl,
        businessPhoneCtrl,
        businessCityCtrl,
        businessAddressCtrl,
        businessZipCodeCtrl,
        businessAdditionalInfoCtrl,
        latitude,
        longitude,
        nameFormKey,
        aboutUsFormKey,
        openingHoursFormKey,
        servicesFormKey,
        contactUsFormKey,
        addInfoFormKey,
        locationFormKey,
        categoryFormKey,
        businessCountry,
        const DeepCollectionEquality().hash(markers),
        mapController,
        autovalidateMode,
        businessDays,
        loggedUserCanEdit,
        reservationSizeLimitCtrl,
        allowReservations
      ]);

  @override
  String toString() {
    return 'BusinessVM(dashboardEditing: $dashboardEditing, myBusinessesses: $myBusinessesses, currentBusiness: $currentBusiness, currentBusinessServices: $currentBusinessServices, picturesPath: $picturesPath, newCategory: $newCategory, targetForDelete: $targetForDelete, businessNameCtrl: $businessNameCtrl, businessAboutUsCtrl: $businessAboutUsCtrl, businessEmailCtrl: $businessEmailCtrl, businessPhoneCtrl: $businessPhoneCtrl, businessCityCtrl: $businessCityCtrl, businessAddressCtrl: $businessAddressCtrl, businessZipCodeCtrl: $businessZipCodeCtrl, businessAdditionalInfoCtrl: $businessAdditionalInfoCtrl, latitude: $latitude, longitude: $longitude, nameFormKey: $nameFormKey, aboutUsFormKey: $aboutUsFormKey, openingHoursFormKey: $openingHoursFormKey, servicesFormKey: $servicesFormKey, contactUsFormKey: $contactUsFormKey, addInfoFormKey: $addInfoFormKey, locationFormKey: $locationFormKey, categoryFormKey: $categoryFormKey, businessCountry: $businessCountry, markers: $markers, mapController: $mapController, autovalidateMode: $autovalidateMode, businessDays: $businessDays, loggedUserCanEdit: $loggedUserCanEdit, reservationSizeLimitCtrl: $reservationSizeLimitCtrl, allowReservations: $allowReservations)';
  }
}

/// @nodoc
abstract mixin class $BusinessVMCopyWith<$Res> {
  factory $BusinessVMCopyWith(
          BusinessVM value, $Res Function(BusinessVM) _then) =
      _$BusinessVMCopyWithImpl;
  @useResult
  $Res call(
      {DashboardEditing dashboardEditing,
      List<BusinessDM> myBusinessesses,
      BusinessDM? currentBusiness,
      List<BusinessServices> currentBusinessServices,
      List<BusinessCoverImageDM> picturesPath,
      FoodlyCategories? newCategory,
      BusinessCoverImageDM? targetForDelete,
      InputController? businessNameCtrl,
      InputController? businessAboutUsCtrl,
      InputController? businessEmailCtrl,
      InputController? businessPhoneCtrl,
      InputController? businessCityCtrl,
      InputController? businessAddressCtrl,
      InputController? businessZipCodeCtrl,
      InputController? businessAdditionalInfoCtrl,
      double? latitude,
      double? longitude,
      GlobalKey<FormState>? nameFormKey,
      GlobalKey<FormState>? aboutUsFormKey,
      GlobalKey<FormState>? openingHoursFormKey,
      GlobalKey<FormState>? servicesFormKey,
      GlobalKey<FormState>? contactUsFormKey,
      GlobalKey<FormState>? addInfoFormKey,
      GlobalKey<FormState>? locationFormKey,
      GlobalKey<FormState>? categoryFormKey,
      FoodlyCountries? businessCountry,
      Set<Marker> markers,
      GoogleMapController? mapController,
      AutovalidateMode autovalidateMode,
      BusinessDays businessDays,
      bool loggedUserCanEdit,
      InputController? reservationSizeLimitCtrl,
      bool allowReservations});

  $BusinessDMCopyWith<$Res>? get currentBusiness;
  $BusinessCoverImageDMCopyWith<$Res>? get targetForDelete;
  $InputControllerCopyWith<$Res>? get businessNameCtrl;
  $InputControllerCopyWith<$Res>? get businessAboutUsCtrl;
  $InputControllerCopyWith<$Res>? get businessEmailCtrl;
  $InputControllerCopyWith<$Res>? get businessPhoneCtrl;
  $InputControllerCopyWith<$Res>? get businessCityCtrl;
  $InputControllerCopyWith<$Res>? get businessAddressCtrl;
  $InputControllerCopyWith<$Res>? get businessZipCodeCtrl;
  $InputControllerCopyWith<$Res>? get businessAdditionalInfoCtrl;
  $BusinessDaysCopyWith<$Res> get businessDays;
  $InputControllerCopyWith<$Res>? get reservationSizeLimitCtrl;
}

/// @nodoc
class _$BusinessVMCopyWithImpl<$Res> implements $BusinessVMCopyWith<$Res> {
  _$BusinessVMCopyWithImpl(this._self, this._then);

  final BusinessVM _self;
  final $Res Function(BusinessVM) _then;

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardEditing = null,
    Object? myBusinessesses = null,
    Object? currentBusiness = freezed,
    Object? currentBusinessServices = null,
    Object? picturesPath = null,
    Object? newCategory = freezed,
    Object? targetForDelete = freezed,
    Object? businessNameCtrl = freezed,
    Object? businessAboutUsCtrl = freezed,
    Object? businessEmailCtrl = freezed,
    Object? businessPhoneCtrl = freezed,
    Object? businessCityCtrl = freezed,
    Object? businessAddressCtrl = freezed,
    Object? businessZipCodeCtrl = freezed,
    Object? businessAdditionalInfoCtrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? nameFormKey = freezed,
    Object? aboutUsFormKey = freezed,
    Object? openingHoursFormKey = freezed,
    Object? servicesFormKey = freezed,
    Object? contactUsFormKey = freezed,
    Object? addInfoFormKey = freezed,
    Object? locationFormKey = freezed,
    Object? categoryFormKey = freezed,
    Object? businessCountry = freezed,
    Object? markers = null,
    Object? mapController = freezed,
    Object? autovalidateMode = null,
    Object? businessDays = null,
    Object? loggedUserCanEdit = null,
    Object? reservationSizeLimitCtrl = freezed,
    Object? allowReservations = null,
  }) {
    return _then(_self.copyWith(
      dashboardEditing: null == dashboardEditing
          ? _self.dashboardEditing
          : dashboardEditing // ignore: cast_nullable_to_non_nullable
              as DashboardEditing,
      myBusinessesses: null == myBusinessesses
          ? _self.myBusinessesses
          : myBusinessesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      currentBusiness: freezed == currentBusiness
          ? _self.currentBusiness
          : currentBusiness // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      currentBusinessServices: null == currentBusinessServices
          ? _self.currentBusinessServices
          : currentBusinessServices // ignore: cast_nullable_to_non_nullable
              as List<BusinessServices>,
      picturesPath: null == picturesPath
          ? _self.picturesPath
          : picturesPath // ignore: cast_nullable_to_non_nullable
              as List<BusinessCoverImageDM>,
      newCategory: freezed == newCategory
          ? _self.newCategory
          : newCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      targetForDelete: freezed == targetForDelete
          ? _self.targetForDelete
          : targetForDelete // ignore: cast_nullable_to_non_nullable
              as BusinessCoverImageDM?,
      businessNameCtrl: freezed == businessNameCtrl
          ? _self.businessNameCtrl
          : businessNameCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAboutUsCtrl: freezed == businessAboutUsCtrl
          ? _self.businessAboutUsCtrl
          : businessAboutUsCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessEmailCtrl: freezed == businessEmailCtrl
          ? _self.businessEmailCtrl
          : businessEmailCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessPhoneCtrl: freezed == businessPhoneCtrl
          ? _self.businessPhoneCtrl
          : businessPhoneCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessCityCtrl: freezed == businessCityCtrl
          ? _self.businessCityCtrl
          : businessCityCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAddressCtrl: freezed == businessAddressCtrl
          ? _self.businessAddressCtrl
          : businessAddressCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessZipCodeCtrl: freezed == businessZipCodeCtrl
          ? _self.businessZipCodeCtrl
          : businessZipCodeCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAdditionalInfoCtrl: freezed == businessAdditionalInfoCtrl
          ? _self.businessAdditionalInfoCtrl
          : businessAdditionalInfoCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      nameFormKey: freezed == nameFormKey
          ? _self.nameFormKey
          : nameFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      aboutUsFormKey: freezed == aboutUsFormKey
          ? _self.aboutUsFormKey
          : aboutUsFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      openingHoursFormKey: freezed == openingHoursFormKey
          ? _self.openingHoursFormKey
          : openingHoursFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      servicesFormKey: freezed == servicesFormKey
          ? _self.servicesFormKey
          : servicesFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      contactUsFormKey: freezed == contactUsFormKey
          ? _self.contactUsFormKey
          : contactUsFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      addInfoFormKey: freezed == addInfoFormKey
          ? _self.addInfoFormKey
          : addInfoFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      locationFormKey: freezed == locationFormKey
          ? _self.locationFormKey
          : locationFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      categoryFormKey: freezed == categoryFormKey
          ? _self.categoryFormKey
          : categoryFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      markers: null == markers
          ? _self.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      mapController: freezed == mapController
          ? _self.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      businessDays: null == businessDays
          ? _self.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays,
      loggedUserCanEdit: null == loggedUserCanEdit
          ? _self.loggedUserCanEdit
          : loggedUserCanEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationSizeLimitCtrl: freezed == reservationSizeLimitCtrl
          ? _self.reservationSizeLimitCtrl
          : reservationSizeLimitCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      allowReservations: null == allowReservations
          ? _self.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get currentBusiness {
    if (_self.currentBusiness == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.currentBusiness!, (value) {
      return _then(_self.copyWith(currentBusiness: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessCoverImageDMCopyWith<$Res>? get targetForDelete {
    if (_self.targetForDelete == null) {
      return null;
    }

    return $BusinessCoverImageDMCopyWith<$Res>(_self.targetForDelete!, (value) {
      return _then(_self.copyWith(targetForDelete: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessNameCtrl {
    if (_self.businessNameCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessNameCtrl!, (value) {
      return _then(_self.copyWith(businessNameCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAboutUsCtrl {
    if (_self.businessAboutUsCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAboutUsCtrl!, (value) {
      return _then(_self.copyWith(businessAboutUsCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessEmailCtrl {
    if (_self.businessEmailCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessEmailCtrl!, (value) {
      return _then(_self.copyWith(businessEmailCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessPhoneCtrl {
    if (_self.businessPhoneCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessPhoneCtrl!, (value) {
      return _then(_self.copyWith(businessPhoneCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessCityCtrl {
    if (_self.businessCityCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessCityCtrl!, (value) {
      return _then(_self.copyWith(businessCityCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAddressCtrl {
    if (_self.businessAddressCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAddressCtrl!, (value) {
      return _then(_self.copyWith(businessAddressCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessZipCodeCtrl {
    if (_self.businessZipCodeCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessZipCodeCtrl!, (value) {
      return _then(_self.copyWith(businessZipCodeCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAdditionalInfoCtrl {
    if (_self.businessAdditionalInfoCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAdditionalInfoCtrl!,
        (value) {
      return _then(_self.copyWith(businessAdditionalInfoCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res> get businessDays {
    return $BusinessDaysCopyWith<$Res>(_self.businessDays, (value) {
      return _then(_self.copyWith(businessDays: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get reservationSizeLimitCtrl {
    if (_self.reservationSizeLimitCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.reservationSizeLimitCtrl!,
        (value) {
      return _then(_self.copyWith(reservationSizeLimitCtrl: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessVM].
extension BusinessVMPatterns on BusinessVM {
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
    TResult Function(_BusinessVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessVM() when $default != null:
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
    TResult Function(_BusinessVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessVM():
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
    TResult? Function(_BusinessVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessVM() when $default != null:
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
            DashboardEditing dashboardEditing,
            List<BusinessDM> myBusinessesses,
            BusinessDM? currentBusiness,
            List<BusinessServices> currentBusinessServices,
            List<BusinessCoverImageDM> picturesPath,
            FoodlyCategories? newCategory,
            BusinessCoverImageDM? targetForDelete,
            InputController? businessNameCtrl,
            InputController? businessAboutUsCtrl,
            InputController? businessEmailCtrl,
            InputController? businessPhoneCtrl,
            InputController? businessCityCtrl,
            InputController? businessAddressCtrl,
            InputController? businessZipCodeCtrl,
            InputController? businessAdditionalInfoCtrl,
            double? latitude,
            double? longitude,
            GlobalKey<FormState>? nameFormKey,
            GlobalKey<FormState>? aboutUsFormKey,
            GlobalKey<FormState>? openingHoursFormKey,
            GlobalKey<FormState>? servicesFormKey,
            GlobalKey<FormState>? contactUsFormKey,
            GlobalKey<FormState>? addInfoFormKey,
            GlobalKey<FormState>? locationFormKey,
            GlobalKey<FormState>? categoryFormKey,
            FoodlyCountries? businessCountry,
            Set<Marker> markers,
            GoogleMapController? mapController,
            AutovalidateMode autovalidateMode,
            BusinessDays businessDays,
            bool loggedUserCanEdit,
            InputController? reservationSizeLimitCtrl,
            bool allowReservations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessVM() when $default != null:
        return $default(
            _that.dashboardEditing,
            _that.myBusinessesses,
            _that.currentBusiness,
            _that.currentBusinessServices,
            _that.picturesPath,
            _that.newCategory,
            _that.targetForDelete,
            _that.businessNameCtrl,
            _that.businessAboutUsCtrl,
            _that.businessEmailCtrl,
            _that.businessPhoneCtrl,
            _that.businessCityCtrl,
            _that.businessAddressCtrl,
            _that.businessZipCodeCtrl,
            _that.businessAdditionalInfoCtrl,
            _that.latitude,
            _that.longitude,
            _that.nameFormKey,
            _that.aboutUsFormKey,
            _that.openingHoursFormKey,
            _that.servicesFormKey,
            _that.contactUsFormKey,
            _that.addInfoFormKey,
            _that.locationFormKey,
            _that.categoryFormKey,
            _that.businessCountry,
            _that.markers,
            _that.mapController,
            _that.autovalidateMode,
            _that.businessDays,
            _that.loggedUserCanEdit,
            _that.reservationSizeLimitCtrl,
            _that.allowReservations);
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
            DashboardEditing dashboardEditing,
            List<BusinessDM> myBusinessesses,
            BusinessDM? currentBusiness,
            List<BusinessServices> currentBusinessServices,
            List<BusinessCoverImageDM> picturesPath,
            FoodlyCategories? newCategory,
            BusinessCoverImageDM? targetForDelete,
            InputController? businessNameCtrl,
            InputController? businessAboutUsCtrl,
            InputController? businessEmailCtrl,
            InputController? businessPhoneCtrl,
            InputController? businessCityCtrl,
            InputController? businessAddressCtrl,
            InputController? businessZipCodeCtrl,
            InputController? businessAdditionalInfoCtrl,
            double? latitude,
            double? longitude,
            GlobalKey<FormState>? nameFormKey,
            GlobalKey<FormState>? aboutUsFormKey,
            GlobalKey<FormState>? openingHoursFormKey,
            GlobalKey<FormState>? servicesFormKey,
            GlobalKey<FormState>? contactUsFormKey,
            GlobalKey<FormState>? addInfoFormKey,
            GlobalKey<FormState>? locationFormKey,
            GlobalKey<FormState>? categoryFormKey,
            FoodlyCountries? businessCountry,
            Set<Marker> markers,
            GoogleMapController? mapController,
            AutovalidateMode autovalidateMode,
            BusinessDays businessDays,
            bool loggedUserCanEdit,
            InputController? reservationSizeLimitCtrl,
            bool allowReservations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessVM():
        return $default(
            _that.dashboardEditing,
            _that.myBusinessesses,
            _that.currentBusiness,
            _that.currentBusinessServices,
            _that.picturesPath,
            _that.newCategory,
            _that.targetForDelete,
            _that.businessNameCtrl,
            _that.businessAboutUsCtrl,
            _that.businessEmailCtrl,
            _that.businessPhoneCtrl,
            _that.businessCityCtrl,
            _that.businessAddressCtrl,
            _that.businessZipCodeCtrl,
            _that.businessAdditionalInfoCtrl,
            _that.latitude,
            _that.longitude,
            _that.nameFormKey,
            _that.aboutUsFormKey,
            _that.openingHoursFormKey,
            _that.servicesFormKey,
            _that.contactUsFormKey,
            _that.addInfoFormKey,
            _that.locationFormKey,
            _that.categoryFormKey,
            _that.businessCountry,
            _that.markers,
            _that.mapController,
            _that.autovalidateMode,
            _that.businessDays,
            _that.loggedUserCanEdit,
            _that.reservationSizeLimitCtrl,
            _that.allowReservations);
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
            DashboardEditing dashboardEditing,
            List<BusinessDM> myBusinessesses,
            BusinessDM? currentBusiness,
            List<BusinessServices> currentBusinessServices,
            List<BusinessCoverImageDM> picturesPath,
            FoodlyCategories? newCategory,
            BusinessCoverImageDM? targetForDelete,
            InputController? businessNameCtrl,
            InputController? businessAboutUsCtrl,
            InputController? businessEmailCtrl,
            InputController? businessPhoneCtrl,
            InputController? businessCityCtrl,
            InputController? businessAddressCtrl,
            InputController? businessZipCodeCtrl,
            InputController? businessAdditionalInfoCtrl,
            double? latitude,
            double? longitude,
            GlobalKey<FormState>? nameFormKey,
            GlobalKey<FormState>? aboutUsFormKey,
            GlobalKey<FormState>? openingHoursFormKey,
            GlobalKey<FormState>? servicesFormKey,
            GlobalKey<FormState>? contactUsFormKey,
            GlobalKey<FormState>? addInfoFormKey,
            GlobalKey<FormState>? locationFormKey,
            GlobalKey<FormState>? categoryFormKey,
            FoodlyCountries? businessCountry,
            Set<Marker> markers,
            GoogleMapController? mapController,
            AutovalidateMode autovalidateMode,
            BusinessDays businessDays,
            bool loggedUserCanEdit,
            InputController? reservationSizeLimitCtrl,
            bool allowReservations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessVM() when $default != null:
        return $default(
            _that.dashboardEditing,
            _that.myBusinessesses,
            _that.currentBusiness,
            _that.currentBusinessServices,
            _that.picturesPath,
            _that.newCategory,
            _that.targetForDelete,
            _that.businessNameCtrl,
            _that.businessAboutUsCtrl,
            _that.businessEmailCtrl,
            _that.businessPhoneCtrl,
            _that.businessCityCtrl,
            _that.businessAddressCtrl,
            _that.businessZipCodeCtrl,
            _that.businessAdditionalInfoCtrl,
            _that.latitude,
            _that.longitude,
            _that.nameFormKey,
            _that.aboutUsFormKey,
            _that.openingHoursFormKey,
            _that.servicesFormKey,
            _that.contactUsFormKey,
            _that.addInfoFormKey,
            _that.locationFormKey,
            _that.categoryFormKey,
            _that.businessCountry,
            _that.markers,
            _that.mapController,
            _that.autovalidateMode,
            _that.businessDays,
            _that.loggedUserCanEdit,
            _that.reservationSizeLimitCtrl,
            _that.allowReservations);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BusinessVM extends BusinessVM {
  const _BusinessVM(
      {this.dashboardEditing = DashboardEditing.none,
      final List<BusinessDM> myBusinessesses = const [],
      this.currentBusiness,
      final List<BusinessServices> currentBusinessServices = const [],
      final List<BusinessCoverImageDM> picturesPath = const [],
      this.newCategory,
      this.targetForDelete,
      this.businessNameCtrl,
      this.businessAboutUsCtrl,
      this.businessEmailCtrl,
      this.businessPhoneCtrl,
      this.businessCityCtrl,
      this.businessAddressCtrl,
      this.businessZipCodeCtrl,
      this.businessAdditionalInfoCtrl,
      this.latitude,
      this.longitude,
      this.nameFormKey,
      this.aboutUsFormKey,
      this.openingHoursFormKey,
      this.servicesFormKey,
      this.contactUsFormKey,
      this.addInfoFormKey,
      this.locationFormKey,
      this.categoryFormKey,
      this.businessCountry,
      final Set<Marker> markers = const {},
      this.mapController,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.businessDays = const BusinessDays(),
      this.loggedUserCanEdit = false,
      this.reservationSizeLimitCtrl,
      this.allowReservations = false})
      : _myBusinessesses = myBusinessesses,
        _currentBusinessServices = currentBusinessServices,
        _picturesPath = picturesPath,
        _markers = markers,
        super._();

  @override
  @JsonKey()
  final DashboardEditing dashboardEditing;
  final List<BusinessDM> _myBusinessesses;
  @override
  @JsonKey()
  List<BusinessDM> get myBusinessesses {
    if (_myBusinessesses is EqualUnmodifiableListView) return _myBusinessesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myBusinessesses);
  }

  @override
  final BusinessDM? currentBusiness;
  final List<BusinessServices> _currentBusinessServices;
  @override
  @JsonKey()
  List<BusinessServices> get currentBusinessServices {
    if (_currentBusinessServices is EqualUnmodifiableListView)
      return _currentBusinessServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentBusinessServices);
  }

  final List<BusinessCoverImageDM> _picturesPath;
  @override
  @JsonKey()
  List<BusinessCoverImageDM> get picturesPath {
    if (_picturesPath is EqualUnmodifiableListView) return _picturesPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_picturesPath);
  }

  @override
  final FoodlyCategories? newCategory;
  @override
  final BusinessCoverImageDM? targetForDelete;
  @override
  final InputController? businessNameCtrl;
  @override
  final InputController? businessAboutUsCtrl;
  @override
  final InputController? businessEmailCtrl;
  @override
  final InputController? businessPhoneCtrl;
  @override
  final InputController? businessCityCtrl;
  @override
  final InputController? businessAddressCtrl;
  @override
  final InputController? businessZipCodeCtrl;
  @override
  final InputController? businessAdditionalInfoCtrl;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final GlobalKey<FormState>? nameFormKey;
  @override
  final GlobalKey<FormState>? aboutUsFormKey;
  @override
  final GlobalKey<FormState>? openingHoursFormKey;
  @override
  final GlobalKey<FormState>? servicesFormKey;
  @override
  final GlobalKey<FormState>? contactUsFormKey;
  @override
  final GlobalKey<FormState>? addInfoFormKey;
  @override
  final GlobalKey<FormState>? locationFormKey;
  @override
  final GlobalKey<FormState>? categoryFormKey;
  @override
  final FoodlyCountries? businessCountry;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  final GoogleMapController? mapController;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  @override
  @JsonKey()
  final BusinessDays businessDays;
  @override
  @JsonKey()
  final bool loggedUserCanEdit;
  @override
  final InputController? reservationSizeLimitCtrl;
  @override
  @JsonKey()
  final bool allowReservations;

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessVMCopyWith<_BusinessVM> get copyWith =>
      __$BusinessVMCopyWithImpl<_BusinessVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessVM &&
            (identical(other.dashboardEditing, dashboardEditing) ||
                other.dashboardEditing == dashboardEditing) &&
            const DeepCollectionEquality()
                .equals(other._myBusinessesses, _myBusinessesses) &&
            (identical(other.currentBusiness, currentBusiness) ||
                other.currentBusiness == currentBusiness) &&
            const DeepCollectionEquality().equals(
                other._currentBusinessServices, _currentBusinessServices) &&
            const DeepCollectionEquality()
                .equals(other._picturesPath, _picturesPath) &&
            (identical(other.newCategory, newCategory) ||
                other.newCategory == newCategory) &&
            (identical(other.targetForDelete, targetForDelete) ||
                other.targetForDelete == targetForDelete) &&
            (identical(other.businessNameCtrl, businessNameCtrl) ||
                other.businessNameCtrl == businessNameCtrl) &&
            (identical(other.businessAboutUsCtrl, businessAboutUsCtrl) ||
                other.businessAboutUsCtrl == businessAboutUsCtrl) &&
            (identical(other.businessEmailCtrl, businessEmailCtrl) ||
                other.businessEmailCtrl == businessEmailCtrl) &&
            (identical(other.businessPhoneCtrl, businessPhoneCtrl) ||
                other.businessPhoneCtrl == businessPhoneCtrl) &&
            (identical(other.businessCityCtrl, businessCityCtrl) ||
                other.businessCityCtrl == businessCityCtrl) &&
            (identical(other.businessAddressCtrl, businessAddressCtrl) ||
                other.businessAddressCtrl == businessAddressCtrl) &&
            (identical(other.businessZipCodeCtrl, businessZipCodeCtrl) ||
                other.businessZipCodeCtrl == businessZipCodeCtrl) &&
            (identical(other.businessAdditionalInfoCtrl,
                    businessAdditionalInfoCtrl) ||
                other.businessAdditionalInfoCtrl ==
                    businessAdditionalInfoCtrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.nameFormKey, nameFormKey) ||
                other.nameFormKey == nameFormKey) &&
            (identical(other.aboutUsFormKey, aboutUsFormKey) ||
                other.aboutUsFormKey == aboutUsFormKey) &&
            (identical(other.openingHoursFormKey, openingHoursFormKey) ||
                other.openingHoursFormKey == openingHoursFormKey) &&
            (identical(other.servicesFormKey, servicesFormKey) ||
                other.servicesFormKey == servicesFormKey) &&
            (identical(other.contactUsFormKey, contactUsFormKey) ||
                other.contactUsFormKey == contactUsFormKey) &&
            (identical(other.addInfoFormKey, addInfoFormKey) ||
                other.addInfoFormKey == addInfoFormKey) &&
            (identical(other.locationFormKey, locationFormKey) ||
                other.locationFormKey == locationFormKey) &&
            (identical(other.categoryFormKey, categoryFormKey) ||
                other.categoryFormKey == categoryFormKey) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.businessDays, businessDays) ||
                other.businessDays == businessDays) &&
            (identical(other.loggedUserCanEdit, loggedUserCanEdit) ||
                other.loggedUserCanEdit == loggedUserCanEdit) &&
            (identical(
                    other.reservationSizeLimitCtrl, reservationSizeLimitCtrl) ||
                other.reservationSizeLimitCtrl == reservationSizeLimitCtrl) &&
            (identical(other.allowReservations, allowReservations) ||
                other.allowReservations == allowReservations));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        dashboardEditing,
        const DeepCollectionEquality().hash(_myBusinessesses),
        currentBusiness,
        const DeepCollectionEquality().hash(_currentBusinessServices),
        const DeepCollectionEquality().hash(_picturesPath),
        newCategory,
        targetForDelete,
        businessNameCtrl,
        businessAboutUsCtrl,
        businessEmailCtrl,
        businessPhoneCtrl,
        businessCityCtrl,
        businessAddressCtrl,
        businessZipCodeCtrl,
        businessAdditionalInfoCtrl,
        latitude,
        longitude,
        nameFormKey,
        aboutUsFormKey,
        openingHoursFormKey,
        servicesFormKey,
        contactUsFormKey,
        addInfoFormKey,
        locationFormKey,
        categoryFormKey,
        businessCountry,
        const DeepCollectionEquality().hash(_markers),
        mapController,
        autovalidateMode,
        businessDays,
        loggedUserCanEdit,
        reservationSizeLimitCtrl,
        allowReservations
      ]);

  @override
  String toString() {
    return 'BusinessVM(dashboardEditing: $dashboardEditing, myBusinessesses: $myBusinessesses, currentBusiness: $currentBusiness, currentBusinessServices: $currentBusinessServices, picturesPath: $picturesPath, newCategory: $newCategory, targetForDelete: $targetForDelete, businessNameCtrl: $businessNameCtrl, businessAboutUsCtrl: $businessAboutUsCtrl, businessEmailCtrl: $businessEmailCtrl, businessPhoneCtrl: $businessPhoneCtrl, businessCityCtrl: $businessCityCtrl, businessAddressCtrl: $businessAddressCtrl, businessZipCodeCtrl: $businessZipCodeCtrl, businessAdditionalInfoCtrl: $businessAdditionalInfoCtrl, latitude: $latitude, longitude: $longitude, nameFormKey: $nameFormKey, aboutUsFormKey: $aboutUsFormKey, openingHoursFormKey: $openingHoursFormKey, servicesFormKey: $servicesFormKey, contactUsFormKey: $contactUsFormKey, addInfoFormKey: $addInfoFormKey, locationFormKey: $locationFormKey, categoryFormKey: $categoryFormKey, businessCountry: $businessCountry, markers: $markers, mapController: $mapController, autovalidateMode: $autovalidateMode, businessDays: $businessDays, loggedUserCanEdit: $loggedUserCanEdit, reservationSizeLimitCtrl: $reservationSizeLimitCtrl, allowReservations: $allowReservations)';
  }
}

/// @nodoc
abstract mixin class _$BusinessVMCopyWith<$Res>
    implements $BusinessVMCopyWith<$Res> {
  factory _$BusinessVMCopyWith(
          _BusinessVM value, $Res Function(_BusinessVM) _then) =
      __$BusinessVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DashboardEditing dashboardEditing,
      List<BusinessDM> myBusinessesses,
      BusinessDM? currentBusiness,
      List<BusinessServices> currentBusinessServices,
      List<BusinessCoverImageDM> picturesPath,
      FoodlyCategories? newCategory,
      BusinessCoverImageDM? targetForDelete,
      InputController? businessNameCtrl,
      InputController? businessAboutUsCtrl,
      InputController? businessEmailCtrl,
      InputController? businessPhoneCtrl,
      InputController? businessCityCtrl,
      InputController? businessAddressCtrl,
      InputController? businessZipCodeCtrl,
      InputController? businessAdditionalInfoCtrl,
      double? latitude,
      double? longitude,
      GlobalKey<FormState>? nameFormKey,
      GlobalKey<FormState>? aboutUsFormKey,
      GlobalKey<FormState>? openingHoursFormKey,
      GlobalKey<FormState>? servicesFormKey,
      GlobalKey<FormState>? contactUsFormKey,
      GlobalKey<FormState>? addInfoFormKey,
      GlobalKey<FormState>? locationFormKey,
      GlobalKey<FormState>? categoryFormKey,
      FoodlyCountries? businessCountry,
      Set<Marker> markers,
      GoogleMapController? mapController,
      AutovalidateMode autovalidateMode,
      BusinessDays businessDays,
      bool loggedUserCanEdit,
      InputController? reservationSizeLimitCtrl,
      bool allowReservations});

  @override
  $BusinessDMCopyWith<$Res>? get currentBusiness;
  @override
  $BusinessCoverImageDMCopyWith<$Res>? get targetForDelete;
  @override
  $InputControllerCopyWith<$Res>? get businessNameCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessAboutUsCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessEmailCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessPhoneCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessCityCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessAddressCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessZipCodeCtrl;
  @override
  $InputControllerCopyWith<$Res>? get businessAdditionalInfoCtrl;
  @override
  $BusinessDaysCopyWith<$Res> get businessDays;
  @override
  $InputControllerCopyWith<$Res>? get reservationSizeLimitCtrl;
}

/// @nodoc
class __$BusinessVMCopyWithImpl<$Res> implements _$BusinessVMCopyWith<$Res> {
  __$BusinessVMCopyWithImpl(this._self, this._then);

  final _BusinessVM _self;
  final $Res Function(_BusinessVM) _then;

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dashboardEditing = null,
    Object? myBusinessesses = null,
    Object? currentBusiness = freezed,
    Object? currentBusinessServices = null,
    Object? picturesPath = null,
    Object? newCategory = freezed,
    Object? targetForDelete = freezed,
    Object? businessNameCtrl = freezed,
    Object? businessAboutUsCtrl = freezed,
    Object? businessEmailCtrl = freezed,
    Object? businessPhoneCtrl = freezed,
    Object? businessCityCtrl = freezed,
    Object? businessAddressCtrl = freezed,
    Object? businessZipCodeCtrl = freezed,
    Object? businessAdditionalInfoCtrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? nameFormKey = freezed,
    Object? aboutUsFormKey = freezed,
    Object? openingHoursFormKey = freezed,
    Object? servicesFormKey = freezed,
    Object? contactUsFormKey = freezed,
    Object? addInfoFormKey = freezed,
    Object? locationFormKey = freezed,
    Object? categoryFormKey = freezed,
    Object? businessCountry = freezed,
    Object? markers = null,
    Object? mapController = freezed,
    Object? autovalidateMode = null,
    Object? businessDays = null,
    Object? loggedUserCanEdit = null,
    Object? reservationSizeLimitCtrl = freezed,
    Object? allowReservations = null,
  }) {
    return _then(_BusinessVM(
      dashboardEditing: null == dashboardEditing
          ? _self.dashboardEditing
          : dashboardEditing // ignore: cast_nullable_to_non_nullable
              as DashboardEditing,
      myBusinessesses: null == myBusinessesses
          ? _self._myBusinessesses
          : myBusinessesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      currentBusiness: freezed == currentBusiness
          ? _self.currentBusiness
          : currentBusiness // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      currentBusinessServices: null == currentBusinessServices
          ? _self._currentBusinessServices
          : currentBusinessServices // ignore: cast_nullable_to_non_nullable
              as List<BusinessServices>,
      picturesPath: null == picturesPath
          ? _self._picturesPath
          : picturesPath // ignore: cast_nullable_to_non_nullable
              as List<BusinessCoverImageDM>,
      newCategory: freezed == newCategory
          ? _self.newCategory
          : newCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      targetForDelete: freezed == targetForDelete
          ? _self.targetForDelete
          : targetForDelete // ignore: cast_nullable_to_non_nullable
              as BusinessCoverImageDM?,
      businessNameCtrl: freezed == businessNameCtrl
          ? _self.businessNameCtrl
          : businessNameCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAboutUsCtrl: freezed == businessAboutUsCtrl
          ? _self.businessAboutUsCtrl
          : businessAboutUsCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessEmailCtrl: freezed == businessEmailCtrl
          ? _self.businessEmailCtrl
          : businessEmailCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessPhoneCtrl: freezed == businessPhoneCtrl
          ? _self.businessPhoneCtrl
          : businessPhoneCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessCityCtrl: freezed == businessCityCtrl
          ? _self.businessCityCtrl
          : businessCityCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAddressCtrl: freezed == businessAddressCtrl
          ? _self.businessAddressCtrl
          : businessAddressCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessZipCodeCtrl: freezed == businessZipCodeCtrl
          ? _self.businessZipCodeCtrl
          : businessZipCodeCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAdditionalInfoCtrl: freezed == businessAdditionalInfoCtrl
          ? _self.businessAdditionalInfoCtrl
          : businessAdditionalInfoCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      nameFormKey: freezed == nameFormKey
          ? _self.nameFormKey
          : nameFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      aboutUsFormKey: freezed == aboutUsFormKey
          ? _self.aboutUsFormKey
          : aboutUsFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      openingHoursFormKey: freezed == openingHoursFormKey
          ? _self.openingHoursFormKey
          : openingHoursFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      servicesFormKey: freezed == servicesFormKey
          ? _self.servicesFormKey
          : servicesFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      contactUsFormKey: freezed == contactUsFormKey
          ? _self.contactUsFormKey
          : contactUsFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      addInfoFormKey: freezed == addInfoFormKey
          ? _self.addInfoFormKey
          : addInfoFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      locationFormKey: freezed == locationFormKey
          ? _self.locationFormKey
          : locationFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      categoryFormKey: freezed == categoryFormKey
          ? _self.categoryFormKey
          : categoryFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      mapController: freezed == mapController
          ? _self.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      businessDays: null == businessDays
          ? _self.businessDays
          : businessDays // ignore: cast_nullable_to_non_nullable
              as BusinessDays,
      loggedUserCanEdit: null == loggedUserCanEdit
          ? _self.loggedUserCanEdit
          : loggedUserCanEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationSizeLimitCtrl: freezed == reservationSizeLimitCtrl
          ? _self.reservationSizeLimitCtrl
          : reservationSizeLimitCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      allowReservations: null == allowReservations
          ? _self.allowReservations
          : allowReservations // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get currentBusiness {
    if (_self.currentBusiness == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.currentBusiness!, (value) {
      return _then(_self.copyWith(currentBusiness: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessCoverImageDMCopyWith<$Res>? get targetForDelete {
    if (_self.targetForDelete == null) {
      return null;
    }

    return $BusinessCoverImageDMCopyWith<$Res>(_self.targetForDelete!, (value) {
      return _then(_self.copyWith(targetForDelete: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessNameCtrl {
    if (_self.businessNameCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessNameCtrl!, (value) {
      return _then(_self.copyWith(businessNameCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAboutUsCtrl {
    if (_self.businessAboutUsCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAboutUsCtrl!, (value) {
      return _then(_self.copyWith(businessAboutUsCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessEmailCtrl {
    if (_self.businessEmailCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessEmailCtrl!, (value) {
      return _then(_self.copyWith(businessEmailCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessPhoneCtrl {
    if (_self.businessPhoneCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessPhoneCtrl!, (value) {
      return _then(_self.copyWith(businessPhoneCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessCityCtrl {
    if (_self.businessCityCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessCityCtrl!, (value) {
      return _then(_self.copyWith(businessCityCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAddressCtrl {
    if (_self.businessAddressCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAddressCtrl!, (value) {
      return _then(_self.copyWith(businessAddressCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessZipCodeCtrl {
    if (_self.businessZipCodeCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessZipCodeCtrl!, (value) {
      return _then(_self.copyWith(businessZipCodeCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAdditionalInfoCtrl {
    if (_self.businessAdditionalInfoCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAdditionalInfoCtrl!,
        (value) {
      return _then(_self.copyWith(businessAdditionalInfoCtrl: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDaysCopyWith<$Res> get businessDays {
    return $BusinessDaysCopyWith<$Res>(_self.businessDays, (value) {
      return _then(_self.copyWith(businessDays: value));
    });
  }

  /// Create a copy of BusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get reservationSizeLimitCtrl {
    if (_self.reservationSizeLimitCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.reservationSizeLimitCtrl!,
        (value) {
      return _then(_self.copyWith(reservationSizeLimitCtrl: value));
    });
  }
}

// dart format on
