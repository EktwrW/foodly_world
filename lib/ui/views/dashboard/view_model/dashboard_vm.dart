import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default([]) List<String> currentBusinessServices,
    @Default([]) List<BusinessCoverImageDM> picturesPath,
    FoodlyCategories? newCategory,
    BusinessCoverImageDM? targetForDelete,
    DasboardSectionController? businessNameCtrl,
    DasboardSectionController? businessAboutUsCtrl,
    DasboardSectionController? businessEmailCtrl,
    DasboardSectionController? businessPhoneCtrl,
    DasboardSectionController? businessCountryCtrl,
    DasboardSectionController? businessCityCtrl,
    DasboardSectionController? businessAddressCtrl,
    DasboardSectionController? businessZipCodeCtrl,
    GlobalKey<FormState>? formKey,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
  }) = _DashboardVM;

  bool get isEditingName => dashboardEditing == DashboardEditing.name;
  bool get isEditingAddress => dashboardEditing == DashboardEditing.address;
  bool get isEditingCategory => dashboardEditing == DashboardEditing.category;
  bool get isEditingAboutUs => dashboardEditing == DashboardEditing.aboutUs;
  bool get isEditingOpeningHours => dashboardEditing == DashboardEditing.openingHours;
  bool get isEditingServices => dashboardEditing == DashboardEditing.services;
  bool get isEditingContactUs => dashboardEditing == DashboardEditing.contactUs;
  bool get isEditingAdditionalInfo => dashboardEditing == DashboardEditing.additionalInfo;
}

@freezed
class DasboardSectionController with _$DasboardSectionController {
  const DasboardSectionController._();

  const factory DasboardSectionController({
    TextEditingController? controller,
    FocusNode? focusNode,
  }) = _DashboardSectionController;
}
