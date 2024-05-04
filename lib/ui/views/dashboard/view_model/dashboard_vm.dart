import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/organization/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/data_models/organization/business_dm.dart';

part 'dashboard_vm.freezed.dart';

@freezed
class DashboardVM with _$DashboardVM {
  const DashboardVM._();

  const factory DashboardVM({
    @Default([]) List<BusinessDM> myBusinessesses,
    BusinessDM? currentBusiness,
    TextEditingController? businessNameCtrl,
    TextEditingController? businessPhoneNumberCtrl,
    TextEditingController? businessEmailCtrl,
    TextEditingController? businessCountryCtrl,
    TextEditingController? businessCityCtrl,
    TextEditingController? businessAddressCtrl,
    TextEditingController? businessZipCodeCtrl,
    @Default([]) List<String> picturesPath,
    String? logoPath,
    FocusNode? businessNameNode,
    FocusNode? businessEmailNode,
    FocusNode? businessPhoneNumberNode,
    FocusNode? businessDateOfOpeningNode,
    FocusNode? businessCountryNode,
    FocusNode? businessCityNode,
    FocusNode? businessAddressNode,
    FocusNode? businessZipCodeNode,
    GlobalKey<FormState>? formKey,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
  }) = _DashboardVM;

  // bool get isRequestingPassword => recoverPasswordView == RecoverPasswordView.sendingRequest;
}
