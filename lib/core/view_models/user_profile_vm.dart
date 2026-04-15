import 'package:flutter/material.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nova_places_api/nova_places_api.dart';

export 'package:foodly_world/core/controllers/input_controller.dart';
export 'package:foodly_world/core/enums/foodly_categories_enums.dart';
export 'package:foodly_world/data_models/business/business_dm.dart';
export 'package:foodly_world/data_models/user/user_dm.dart';
export 'package:foodly_world/data_models/user_session/user_session_dm.dart';

part 'user_profile_vm.freezed.dart';

enum ProfileEditing {
  none,
  userName,
  nickName,
  contact,
  location,
  gender,
  password,
  dateOfBirth;

  bool get isActive => this != none;
  bool get isEditingName => this == userName;
  bool get isEditingNickName => this == nickName;
  bool get isEditingContact => this == contact;
  bool get isEditingAddress => this == location;
  bool get isEditingGender => this == gender;
  bool get isEditingPassword => this == password;
  bool get isEditingDateOfBirth => this == dateOfBirth;
}

@freezed
class UserProfileVM with _$UserProfileVM {
  const UserProfileVM._();

  const factory UserProfileVM({
    InputController? nickNameController,
    InputController? firstNameController,
    InputController? lastNameController,
    InputController? emailController,
    InputController? passwordController,
    InputController? newPasswordController,
    InputController? phoneNumberController,
    InputController? addressController,
    InputController? cityController,
    InputController? zipCodeController,
    InputController? businessNameController,
    InputController? businessPhoneNumberController,
    InputController? businessEmailController,
    InputController? businessCityController,
    InputController? businessAddressController,
    InputController? businessZipCodeController,
    InputController? businessIntroMessageController,
    FocusNode? dateOfBirthNode,
    FocusNode? placesFocusNode,
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
    @Default(true) bool tooltipActive,
    GoogleMapController? mapController,
    @Default({}) Set<Marker> markers,
    LatLngLiteral? businessLocation,
    LatLngLiteral? userLocation,
    String? businessCountryCode,
    @Default(false) bool loggedUserCanEdit,
    @Default(ProfileEditing.none) ProfileEditing edition,
    UserDM? visitedUser,
    @Default(false) bool termsAndContiditionsAccepted,
    @Default(false) bool businessTermsAndContiditionsAccepted,
    String? importedAvatar,
    // Social provider context populated when the user arrives at sign-up from
    // a social login (e.g. Google). Forwarded to /register so the backend can
    // waive the password requirement for provider-verified sign-ups.
    String? provider,
    String? providerId,
    @Default([]) List<ReviewDM> myReviews,
    ReviewsMetaDM? reviewsMeta,
    @Default(false) bool isLoadingMoreReviews,
  }) = _UserProfileVM;

  List<UserRole> get userTypes => [UserRole.customer, UserRole.owner];

  List<UserGender> get userGenders => UserGender.values;

  UserGender get userGender => gender ?? UserGender.preferNotToSay;

  UserDM? get currentUser => loggedUserCanEdit ? userSessionDM.user : visitedUser;
  String? get currentUserName => currentUser?.username ?? '';
  String? get currentUserEmail => currentUser?.email;
  String? get currentUserPhoneNumber => currentUser?.phone;
  String? get currentUserCountry => currentUser?.principalAddress?.country?.value;
  String? get currentUserCity => currentUser?.principalAddress?.city ?? '';
  String? get currentUserAddress => currentUser?.principalAddress?.address ?? '';
  String? get currentUserZipCode => currentUser?.principalAddress?.zipCode ?? '';
  String? get currentUserBirthday => currentUser?.dateOfBirth?.getBirthdayFormat;
  UserGender? get currentUserGender => currentUser?.gender;

  bool get currentUserHasNewLocation =>
      userLocation != null &&
      (userLocation?.lng != currentUser?.principalAddress?.longitude) &&
      (userLocation?.lat != currentUser?.principalAddress?.latitude);

  String get currentUserFullAddress => [
        currentUserAddress,
        currentUserCity,
        currentUserZipCode,
        currentUserCountry,
      ].where((element) => element != null && element.isNotEmpty).join(', ');

  bool get canLoadMoreReviews =>
      !isLoadingMoreReviews && reviewsMeta != null && reviewsMeta!.currentPage < reviewsMeta!.lastPage;

  int get reviewsCurrentPage => reviewsMeta?.currentPage ?? 1;
  int get reviewsLastPage => reviewsMeta?.lastPage ?? 1;
  int get reviewsTotal => reviewsMeta?.total ?? 0;
}
