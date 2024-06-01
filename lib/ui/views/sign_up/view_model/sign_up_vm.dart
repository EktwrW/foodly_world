import 'package:flutter/material.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

export 'package:foodly_world/core/enums/foodly_categories_enums.dart';

part 'sign_up_vm.freezed.dart';

@freezed
class SignUpVM with _$SignUpVM {
  const SignUpVM._();

  const factory SignUpVM({
    InputController? nickNameController,
    InputController? firstNameController,
    InputController? lastNameController,
    InputController? emailController,
    InputController? passwordController,
    InputController? phoneNumberController,
    InputController? cityController,
    InputController? zipCodeController,
    InputController? businessNameController,
    InputController? businessPhoneNumberController,
    InputController? businessEmailController,
    InputController? businessCityController,
    InputController? businessAddressController,
    InputController? businessZipCodeController,
    FocusNode? dateOfBirthNode,
    FocusNode? genderNode,
    FoodlyCountries? country,
    FocusNode? countryNode,
    FoodlyCountries? businessCountry,
    FocusNode? businessCountryNode,
    GlobalKey<FormState>? formKey,
    UserGender? gender,
    UserRole? roleId,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(UserSessionDM(user: UserDM(), token: '')) UserSessionDM userSessionDM,
    @Default([]) List<BusinessDM> business,
    DateTime? dateOfBirth,
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

  List<UserGender> get userGenders => UserGender.values.where((e) => e != UserGender.nonEspecified).toList();

  UserGender get userGender => gender ?? UserGender.nonEspecified;
}
