import 'package:flutter/material.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/data_models/organization/business_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

part 'sign_up_vm.freezed.dart';

@freezed
class SignUpVM with _$SignUpVM {
  const SignUpVM._();

  const factory SignUpVM({
    TextEditingController? nickNameController,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? phoneNumberController,
    TextEditingController? countryController,
    TextEditingController? cityController,
    TextEditingController? zipCodeController,
    TextEditingController? businessNameController,
    TextEditingController? businessPhoneNumberController,
    TextEditingController? businessEmailController,
    TextEditingController? businessCountryController,
    TextEditingController? businessCityController,
    TextEditingController? businessAddressController,
    TextEditingController? businessZipCodeController,
    GlobalKey<FormState>? formKey,
    FocusNode? nickNameNode,
    FocusNode? firstNameNode,
    FocusNode? lastNameNode,
    FocusNode? emailNode,
    FocusNode? passwordNode,
    FocusNode? phoneNumberNode,
    FocusNode? dateOfBirthNode,
    FocusNode? countryNode,
    FocusNode? cityNode,
    FocusNode? zipCodeNode,
    FocusNode? genderNode,
    FocusNode? businessNameNode,
    FocusNode? businessEmailNode,
    FocusNode? businessPhoneNumberNode,
    FocusNode? businessDateOfOpeningNode,
    FocusNode? businessCountryNode,
    FocusNode? businessCityNode,
    FocusNode? businessAddressNode,
    FocusNode? businessZipCodeNode,
    UserGender? gender,
    UserRole? roleId,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(UserSessionDM(user: UserDM(), token: ''))
    UserSessionDM userSessionDM,
    @Default([]) List<BusinessDM> business,
    String? currentCountryCode,
    DateTime? dateOfBirth,
    DateTime? businessDateOfOpening,
    FoodlyCategories? businessCategory,
    @Default('') String imagePath,
    @Default('') String logoPath,
    TextEditingController? autoCompleteController,
    @Default(true) bool tooltipActive,
    GoogleMapController? mapController,
    @Default({}) Set<Marker> markers,
    LatLngLiteral? businessLocation,
    String? businessCountryCode,
  }) = _SignUpVM;

  List<UserRole> get userTypes => [UserRole.customer, UserRole.owner];

  List<UserGender> get userGenders =>
      UserGender.values.where((e) => e != UserGender.nonEspecified).toList();

  UserGender get userGender => gender ?? UserGender.nonEspecified;
}
