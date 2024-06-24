import 'package:flutter/material.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker, GoogleMapController;

export 'package:foodly_world/data_models/business/business_dm.dart';

part 'dashboard_vm.freezed.dart';

enum DashboardEditing { none, name, address, category, aboutUs, openingHours, services, contactUs, additionalInfo }

@freezed
class DashboardVM with _$DashboardVM {
  const DashboardVM._();

  const factory DashboardVM({
    @Default(DashboardEditing.none) DashboardEditing dashboardEditing,
    @Default([]) List<BusinessDM> myBusinessesses,
    BusinessDM? currentBusiness,
    @Default([]) List<BusinessServices> currentBusinessServices,
    @Default([]) List<BusinessCoverImageDM> picturesPath,
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
    @Default({}) Set<Marker> markers,
    GoogleMapController? mapController,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(BusinessOpeningHoursDm()) BusinessOpeningHoursDm currentOpeningHours,
  }) = _DashboardVM;

  bool get isEditingName => dashboardEditing == DashboardEditing.name;
  bool get isEditingAddress => dashboardEditing == DashboardEditing.address;
  bool get isEditingCategory => dashboardEditing == DashboardEditing.category;
  bool get isEditingAboutUs => dashboardEditing == DashboardEditing.aboutUs;
  bool get isEditingOpeningHours => dashboardEditing == DashboardEditing.openingHours;
  bool get isEditingServices => dashboardEditing == DashboardEditing.services;
  bool get isEditingContactUs => dashboardEditing == DashboardEditing.contactUs;
  bool get isEditingAdditionalInfo => dashboardEditing == DashboardEditing.additionalInfo;

  String? get businessCountryCode => businessCountry?.countryCode ?? currentBusiness?.country?.countryCode;
}
