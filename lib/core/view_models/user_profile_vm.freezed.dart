// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileVM {
  InputController? get nickNameController;
  InputController? get firstNameController;
  InputController? get lastNameController;
  InputController? get emailController;
  InputController? get passwordController;
  InputController? get newPasswordController;
  InputController? get phoneNumberController;
  InputController? get addressController;
  InputController? get cityController;
  InputController? get zipCodeController;
  InputController? get businessNameController;
  InputController? get businessPhoneNumberController;
  InputController? get businessEmailController;
  InputController? get businessCityController;
  InputController? get businessAddressController;
  InputController? get businessZipCodeController;
  InputController? get businessIntroMessageController;
  FocusNode? get dateOfBirthNode;
  FocusNode? get placesFocusNode;
  FocusNode? get genderNode;
  FoodlyCountries? get country;
  FocusNode? get countryNode;
  FoodlyCountries? get businessCountry;
  FocusNode? get businessCountryNode;
  GlobalKey<FormState>? get formKey;
  UserGender? get gender;
  UserRole? get roleId;
  AutovalidateMode get autovalidateMode;
  UserSessionDM get userSessionDM;
  List<BusinessDM> get business;
  DateTime? get dateOfBirth;
  FoodlyCategories? get businessCategory;
  String get imagePath;
  String get logoPath;
  bool get tooltipActive;
  GoogleMapController? get mapController;
  Set<Marker> get markers;
  LatLngLiteral? get businessLocation;
  LatLngLiteral? get userLocation;
  String? get businessCountryCode;
  bool get loggedUserCanEdit;
  ProfileEditing get edition;
  UserDM? get visitedUser;
  bool get termsAndContiditionsAccepted;
  bool get businessTermsAndContiditionsAccepted;
  String?
      get importedAvatar; // Social provider context populated when the user arrives at sign-up from
// a social login (e.g. Google). Forwarded to /register so the backend can
// waive the password requirement for provider-verified sign-ups.
  String? get provider;
  String? get providerId;
  List<ReviewDM> get myReviews;
  ReviewsMetaDM? get reviewsMeta;
  bool get isLoadingMoreReviews;

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileVMCopyWith<UserProfileVM> get copyWith =>
      _$UserProfileVMCopyWithImpl<UserProfileVM>(
          this as UserProfileVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileVM &&
            (identical(other.nickNameController, nickNameController) ||
                other.nickNameController == nickNameController) &&
            (identical(other.firstNameController, firstNameController) ||
                other.firstNameController == firstNameController) &&
            (identical(other.lastNameController, lastNameController) ||
                other.lastNameController == lastNameController) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.newPasswordController, newPasswordController) ||
                other.newPasswordController == newPasswordController) &&
            (identical(other.phoneNumberController, phoneNumberController) ||
                other.phoneNumberController == phoneNumberController) &&
            (identical(other.addressController, addressController) ||
                other.addressController == addressController) &&
            (identical(other.cityController, cityController) ||
                other.cityController == cityController) &&
            (identical(other.zipCodeController, zipCodeController) ||
                other.zipCodeController == zipCodeController) &&
            (identical(other.businessNameController, businessNameController) ||
                other.businessNameController == businessNameController) &&
            (identical(other.businessPhoneNumberController, businessPhoneNumberController) ||
                other.businessPhoneNumberController ==
                    businessPhoneNumberController) &&
            (identical(other.businessEmailController, businessEmailController) ||
                other.businessEmailController == businessEmailController) &&
            (identical(other.businessCityController, businessCityController) ||
                other.businessCityController == businessCityController) &&
            (identical(other.businessAddressController, businessAddressController) ||
                other.businessAddressController == businessAddressController) &&
            (identical(other.businessZipCodeController, businessZipCodeController) ||
                other.businessZipCodeController == businessZipCodeController) &&
            (identical(other.businessIntroMessageController, businessIntroMessageController) ||
                other.businessIntroMessageController ==
                    businessIntroMessageController) &&
            (identical(other.dateOfBirthNode, dateOfBirthNode) ||
                other.dateOfBirthNode == dateOfBirthNode) &&
            (identical(other.placesFocusNode, placesFocusNode) ||
                other.placesFocusNode == placesFocusNode) &&
            (identical(other.genderNode, genderNode) ||
                other.genderNode == genderNode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryNode, countryNode) ||
                other.countryNode == countryNode) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.businessCountryNode, businessCountryNode) ||
                other.businessCountryNode == businessCountryNode) &&
            (identical(other.formKey, formKey) || other.formKey == formKey) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM) &&
            const DeepCollectionEquality().equals(other.business, business) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.businessCategory, businessCategory) ||
                other.businessCategory == businessCategory) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.logoPath, logoPath) || other.logoPath == logoPath) &&
            (identical(other.tooltipActive, tooltipActive) || other.tooltipActive == tooltipActive) &&
            (identical(other.mapController, mapController) || other.mapController == mapController) &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            (identical(other.businessLocation, businessLocation) || other.businessLocation == businessLocation) &&
            (identical(other.userLocation, userLocation) || other.userLocation == userLocation) &&
            (identical(other.businessCountryCode, businessCountryCode) || other.businessCountryCode == businessCountryCode) &&
            (identical(other.loggedUserCanEdit, loggedUserCanEdit) || other.loggedUserCanEdit == loggedUserCanEdit) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.visitedUser, visitedUser) || other.visitedUser == visitedUser) &&
            (identical(other.termsAndContiditionsAccepted, termsAndContiditionsAccepted) || other.termsAndContiditionsAccepted == termsAndContiditionsAccepted) &&
            (identical(other.businessTermsAndContiditionsAccepted, businessTermsAndContiditionsAccepted) || other.businessTermsAndContiditionsAccepted == businessTermsAndContiditionsAccepted) &&
            (identical(other.importedAvatar, importedAvatar) || other.importedAvatar == importedAvatar) &&
            (identical(other.provider, provider) || other.provider == provider) &&
            (identical(other.providerId, providerId) || other.providerId == providerId) &&
            const DeepCollectionEquality().equals(other.myReviews, myReviews) &&
            (identical(other.reviewsMeta, reviewsMeta) || other.reviewsMeta == reviewsMeta) &&
            (identical(other.isLoadingMoreReviews, isLoadingMoreReviews) || other.isLoadingMoreReviews == isLoadingMoreReviews));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        nickNameController,
        firstNameController,
        lastNameController,
        emailController,
        passwordController,
        newPasswordController,
        phoneNumberController,
        addressController,
        cityController,
        zipCodeController,
        businessNameController,
        businessPhoneNumberController,
        businessEmailController,
        businessCityController,
        businessAddressController,
        businessZipCodeController,
        businessIntroMessageController,
        dateOfBirthNode,
        placesFocusNode,
        genderNode,
        country,
        countryNode,
        businessCountry,
        businessCountryNode,
        formKey,
        gender,
        roleId,
        autovalidateMode,
        userSessionDM,
        const DeepCollectionEquality().hash(business),
        dateOfBirth,
        businessCategory,
        imagePath,
        logoPath,
        tooltipActive,
        mapController,
        const DeepCollectionEquality().hash(markers),
        businessLocation,
        userLocation,
        businessCountryCode,
        loggedUserCanEdit,
        edition,
        visitedUser,
        termsAndContiditionsAccepted,
        businessTermsAndContiditionsAccepted,
        importedAvatar,
        provider,
        providerId,
        const DeepCollectionEquality().hash(myReviews),
        reviewsMeta,
        isLoadingMoreReviews
      ]);

  @override
  String toString() {
    return 'UserProfileVM(nickNameController: $nickNameController, firstNameController: $firstNameController, lastNameController: $lastNameController, emailController: $emailController, passwordController: $passwordController, newPasswordController: $newPasswordController, phoneNumberController: $phoneNumberController, addressController: $addressController, cityController: $cityController, zipCodeController: $zipCodeController, businessNameController: $businessNameController, businessPhoneNumberController: $businessPhoneNumberController, businessEmailController: $businessEmailController, businessCityController: $businessCityController, businessAddressController: $businessAddressController, businessZipCodeController: $businessZipCodeController, businessIntroMessageController: $businessIntroMessageController, dateOfBirthNode: $dateOfBirthNode, placesFocusNode: $placesFocusNode, genderNode: $genderNode, country: $country, countryNode: $countryNode, businessCountry: $businessCountry, businessCountryNode: $businessCountryNode, formKey: $formKey, gender: $gender, roleId: $roleId, autovalidateMode: $autovalidateMode, userSessionDM: $userSessionDM, business: $business, dateOfBirth: $dateOfBirth, businessCategory: $businessCategory, imagePath: $imagePath, logoPath: $logoPath, tooltipActive: $tooltipActive, mapController: $mapController, markers: $markers, businessLocation: $businessLocation, userLocation: $userLocation, businessCountryCode: $businessCountryCode, loggedUserCanEdit: $loggedUserCanEdit, edition: $edition, visitedUser: $visitedUser, termsAndContiditionsAccepted: $termsAndContiditionsAccepted, businessTermsAndContiditionsAccepted: $businessTermsAndContiditionsAccepted, importedAvatar: $importedAvatar, provider: $provider, providerId: $providerId, myReviews: $myReviews, reviewsMeta: $reviewsMeta, isLoadingMoreReviews: $isLoadingMoreReviews)';
  }
}

/// @nodoc
abstract mixin class $UserProfileVMCopyWith<$Res> {
  factory $UserProfileVMCopyWith(
          UserProfileVM value, $Res Function(UserProfileVM) _then) =
      _$UserProfileVMCopyWithImpl;
  @useResult
  $Res call(
      {InputController? nickNameController,
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
      AutovalidateMode autovalidateMode,
      UserSessionDM userSessionDM,
      List<BusinessDM> business,
      DateTime? dateOfBirth,
      FoodlyCategories? businessCategory,
      String imagePath,
      String logoPath,
      bool tooltipActive,
      GoogleMapController? mapController,
      Set<Marker> markers,
      LatLngLiteral? businessLocation,
      LatLngLiteral? userLocation,
      String? businessCountryCode,
      bool loggedUserCanEdit,
      ProfileEditing edition,
      UserDM? visitedUser,
      bool termsAndContiditionsAccepted,
      bool businessTermsAndContiditionsAccepted,
      String? importedAvatar,
      String? provider,
      String? providerId,
      List<ReviewDM> myReviews,
      ReviewsMetaDM? reviewsMeta,
      bool isLoadingMoreReviews});

  $InputControllerCopyWith<$Res>? get nickNameController;
  $InputControllerCopyWith<$Res>? get firstNameController;
  $InputControllerCopyWith<$Res>? get lastNameController;
  $InputControllerCopyWith<$Res>? get emailController;
  $InputControllerCopyWith<$Res>? get passwordController;
  $InputControllerCopyWith<$Res>? get newPasswordController;
  $InputControllerCopyWith<$Res>? get phoneNumberController;
  $InputControllerCopyWith<$Res>? get addressController;
  $InputControllerCopyWith<$Res>? get cityController;
  $InputControllerCopyWith<$Res>? get zipCodeController;
  $InputControllerCopyWith<$Res>? get businessNameController;
  $InputControllerCopyWith<$Res>? get businessPhoneNumberController;
  $InputControllerCopyWith<$Res>? get businessEmailController;
  $InputControllerCopyWith<$Res>? get businessCityController;
  $InputControllerCopyWith<$Res>? get businessAddressController;
  $InputControllerCopyWith<$Res>? get businessZipCodeController;
  $InputControllerCopyWith<$Res>? get businessIntroMessageController;
  $UserSessionDMCopyWith<$Res> get userSessionDM;
  $UserDMCopyWith<$Res>? get visitedUser;
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta;
}

/// @nodoc
class _$UserProfileVMCopyWithImpl<$Res>
    implements $UserProfileVMCopyWith<$Res> {
  _$UserProfileVMCopyWithImpl(this._self, this._then);

  final UserProfileVM _self;
  final $Res Function(UserProfileVM) _then;

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickNameController = freezed,
    Object? firstNameController = freezed,
    Object? lastNameController = freezed,
    Object? emailController = freezed,
    Object? passwordController = freezed,
    Object? newPasswordController = freezed,
    Object? phoneNumberController = freezed,
    Object? addressController = freezed,
    Object? cityController = freezed,
    Object? zipCodeController = freezed,
    Object? businessNameController = freezed,
    Object? businessPhoneNumberController = freezed,
    Object? businessEmailController = freezed,
    Object? businessCityController = freezed,
    Object? businessAddressController = freezed,
    Object? businessZipCodeController = freezed,
    Object? businessIntroMessageController = freezed,
    Object? dateOfBirthNode = freezed,
    Object? placesFocusNode = freezed,
    Object? genderNode = freezed,
    Object? country = freezed,
    Object? countryNode = freezed,
    Object? businessCountry = freezed,
    Object? businessCountryNode = freezed,
    Object? formKey = freezed,
    Object? gender = freezed,
    Object? roleId = freezed,
    Object? autovalidateMode = null,
    Object? userSessionDM = null,
    Object? business = null,
    Object? dateOfBirth = freezed,
    Object? businessCategory = freezed,
    Object? imagePath = null,
    Object? logoPath = null,
    Object? tooltipActive = null,
    Object? mapController = freezed,
    Object? markers = null,
    Object? businessLocation = freezed,
    Object? userLocation = freezed,
    Object? businessCountryCode = freezed,
    Object? loggedUserCanEdit = null,
    Object? edition = null,
    Object? visitedUser = freezed,
    Object? termsAndContiditionsAccepted = null,
    Object? businessTermsAndContiditionsAccepted = null,
    Object? importedAvatar = freezed,
    Object? provider = freezed,
    Object? providerId = freezed,
    Object? myReviews = null,
    Object? reviewsMeta = freezed,
    Object? isLoadingMoreReviews = null,
  }) {
    return _then(_self.copyWith(
      nickNameController: freezed == nickNameController
          ? _self.nickNameController
          : nickNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      firstNameController: freezed == firstNameController
          ? _self.firstNameController
          : firstNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      lastNameController: freezed == lastNameController
          ? _self.lastNameController
          : lastNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      emailController: freezed == emailController
          ? _self.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      passwordController: freezed == passwordController
          ? _self.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      newPasswordController: freezed == newPasswordController
          ? _self.newPasswordController
          : newPasswordController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      phoneNumberController: freezed == phoneNumberController
          ? _self.phoneNumberController
          : phoneNumberController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      addressController: freezed == addressController
          ? _self.addressController
          : addressController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      cityController: freezed == cityController
          ? _self.cityController
          : cityController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      zipCodeController: freezed == zipCodeController
          ? _self.zipCodeController
          : zipCodeController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessNameController: freezed == businessNameController
          ? _self.businessNameController
          : businessNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessPhoneNumberController: freezed == businessPhoneNumberController
          ? _self.businessPhoneNumberController
          : businessPhoneNumberController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessEmailController: freezed == businessEmailController
          ? _self.businessEmailController
          : businessEmailController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessCityController: freezed == businessCityController
          ? _self.businessCityController
          : businessCityController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAddressController: freezed == businessAddressController
          ? _self.businessAddressController
          : businessAddressController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessZipCodeController: freezed == businessZipCodeController
          ? _self.businessZipCodeController
          : businessZipCodeController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessIntroMessageController: freezed == businessIntroMessageController
          ? _self.businessIntroMessageController
          : businessIntroMessageController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      dateOfBirthNode: freezed == dateOfBirthNode
          ? _self.dateOfBirthNode
          : dateOfBirthNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      placesFocusNode: freezed == placesFocusNode
          ? _self.placesFocusNode
          : placesFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      genderNode: freezed == genderNode
          ? _self.genderNode
          : genderNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      countryNode: freezed == countryNode
          ? _self.countryNode
          : countryNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      businessCountryNode: freezed == businessCountryNode
          ? _self.businessCountryNode
          : businessCountryNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      formKey: freezed == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      roleId: freezed == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      businessCategory: freezed == businessCategory
          ? _self.businessCategory
          : businessCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: null == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      tooltipActive: null == tooltipActive
          ? _self.tooltipActive
          : tooltipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      mapController: freezed == mapController
          ? _self.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      markers: null == markers
          ? _self.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      businessLocation: freezed == businessLocation
          ? _self.businessLocation
          : businessLocation // ignore: cast_nullable_to_non_nullable
              as LatLngLiteral?,
      userLocation: freezed == userLocation
          ? _self.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LatLngLiteral?,
      businessCountryCode: freezed == businessCountryCode
          ? _self.businessCountryCode
          : businessCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      loggedUserCanEdit: null == loggedUserCanEdit
          ? _self.loggedUserCanEdit
          : loggedUserCanEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      edition: null == edition
          ? _self.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as ProfileEditing,
      visitedUser: freezed == visitedUser
          ? _self.visitedUser
          : visitedUser // ignore: cast_nullable_to_non_nullable
              as UserDM?,
      termsAndContiditionsAccepted: null == termsAndContiditionsAccepted
          ? _self.termsAndContiditionsAccepted
          : termsAndContiditionsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      businessTermsAndContiditionsAccepted: null ==
              businessTermsAndContiditionsAccepted
          ? _self.businessTermsAndContiditionsAccepted
          : businessTermsAndContiditionsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      importedAvatar: freezed == importedAvatar
          ? _self.importedAvatar
          : importedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      myReviews: null == myReviews
          ? _self.myReviews
          : myReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
      reviewsMeta: freezed == reviewsMeta
          ? _self.reviewsMeta
          : reviewsMeta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
      isLoadingMoreReviews: null == isLoadingMoreReviews
          ? _self.isLoadingMoreReviews
          : isLoadingMoreReviews // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get nickNameController {
    if (_self.nickNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.nickNameController!, (value) {
      return _then(_self.copyWith(nickNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get firstNameController {
    if (_self.firstNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.firstNameController!, (value) {
      return _then(_self.copyWith(firstNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get lastNameController {
    if (_self.lastNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.lastNameController!, (value) {
      return _then(_self.copyWith(lastNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get emailController {
    if (_self.emailController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.emailController!, (value) {
      return _then(_self.copyWith(emailController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get passwordController {
    if (_self.passwordController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.passwordController!, (value) {
      return _then(_self.copyWith(passwordController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get newPasswordController {
    if (_self.newPasswordController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.newPasswordController!,
        (value) {
      return _then(_self.copyWith(newPasswordController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get phoneNumberController {
    if (_self.phoneNumberController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.phoneNumberController!,
        (value) {
      return _then(_self.copyWith(phoneNumberController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get addressController {
    if (_self.addressController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.addressController!, (value) {
      return _then(_self.copyWith(addressController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get cityController {
    if (_self.cityController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.cityController!, (value) {
      return _then(_self.copyWith(cityController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get zipCodeController {
    if (_self.zipCodeController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.zipCodeController!, (value) {
      return _then(_self.copyWith(zipCodeController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessNameController {
    if (_self.businessNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessNameController!,
        (value) {
      return _then(_self.copyWith(businessNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessPhoneNumberController {
    if (_self.businessPhoneNumberController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessPhoneNumberController!,
        (value) {
      return _then(_self.copyWith(businessPhoneNumberController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessEmailController {
    if (_self.businessEmailController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessEmailController!,
        (value) {
      return _then(_self.copyWith(businessEmailController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessCityController {
    if (_self.businessCityController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessCityController!,
        (value) {
      return _then(_self.copyWith(businessCityController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAddressController {
    if (_self.businessAddressController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAddressController!,
        (value) {
      return _then(_self.copyWith(businessAddressController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessZipCodeController {
    if (_self.businessZipCodeController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessZipCodeController!,
        (value) {
      return _then(_self.copyWith(businessZipCodeController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessIntroMessageController {
    if (_self.businessIntroMessageController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessIntroMessageController!,
        (value) {
      return _then(_self.copyWith(businessIntroMessageController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDMCopyWith<$Res>? get visitedUser {
    if (_self.visitedUser == null) {
      return null;
    }

    return $UserDMCopyWith<$Res>(_self.visitedUser!, (value) {
      return _then(_self.copyWith(visitedUser: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta {
    if (_self.reviewsMeta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_self.reviewsMeta!, (value) {
      return _then(_self.copyWith(reviewsMeta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserProfileVM].
extension UserProfileVMPatterns on UserProfileVM {
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
    TResult Function(_UserProfileVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfileVM() when $default != null:
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
    TResult Function(_UserProfileVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileVM():
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
    TResult? Function(_UserProfileVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileVM() when $default != null:
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
            AutovalidateMode autovalidateMode,
            UserSessionDM userSessionDM,
            List<BusinessDM> business,
            DateTime? dateOfBirth,
            FoodlyCategories? businessCategory,
            String imagePath,
            String logoPath,
            bool tooltipActive,
            GoogleMapController? mapController,
            Set<Marker> markers,
            LatLngLiteral? businessLocation,
            LatLngLiteral? userLocation,
            String? businessCountryCode,
            bool loggedUserCanEdit,
            ProfileEditing edition,
            UserDM? visitedUser,
            bool termsAndContiditionsAccepted,
            bool businessTermsAndContiditionsAccepted,
            String? importedAvatar,
            String? provider,
            String? providerId,
            List<ReviewDM> myReviews,
            ReviewsMetaDM? reviewsMeta,
            bool isLoadingMoreReviews)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfileVM() when $default != null:
        return $default(
            _that.nickNameController,
            _that.firstNameController,
            _that.lastNameController,
            _that.emailController,
            _that.passwordController,
            _that.newPasswordController,
            _that.phoneNumberController,
            _that.addressController,
            _that.cityController,
            _that.zipCodeController,
            _that.businessNameController,
            _that.businessPhoneNumberController,
            _that.businessEmailController,
            _that.businessCityController,
            _that.businessAddressController,
            _that.businessZipCodeController,
            _that.businessIntroMessageController,
            _that.dateOfBirthNode,
            _that.placesFocusNode,
            _that.genderNode,
            _that.country,
            _that.countryNode,
            _that.businessCountry,
            _that.businessCountryNode,
            _that.formKey,
            _that.gender,
            _that.roleId,
            _that.autovalidateMode,
            _that.userSessionDM,
            _that.business,
            _that.dateOfBirth,
            _that.businessCategory,
            _that.imagePath,
            _that.logoPath,
            _that.tooltipActive,
            _that.mapController,
            _that.markers,
            _that.businessLocation,
            _that.userLocation,
            _that.businessCountryCode,
            _that.loggedUserCanEdit,
            _that.edition,
            _that.visitedUser,
            _that.termsAndContiditionsAccepted,
            _that.businessTermsAndContiditionsAccepted,
            _that.importedAvatar,
            _that.provider,
            _that.providerId,
            _that.myReviews,
            _that.reviewsMeta,
            _that.isLoadingMoreReviews);
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
            AutovalidateMode autovalidateMode,
            UserSessionDM userSessionDM,
            List<BusinessDM> business,
            DateTime? dateOfBirth,
            FoodlyCategories? businessCategory,
            String imagePath,
            String logoPath,
            bool tooltipActive,
            GoogleMapController? mapController,
            Set<Marker> markers,
            LatLngLiteral? businessLocation,
            LatLngLiteral? userLocation,
            String? businessCountryCode,
            bool loggedUserCanEdit,
            ProfileEditing edition,
            UserDM? visitedUser,
            bool termsAndContiditionsAccepted,
            bool businessTermsAndContiditionsAccepted,
            String? importedAvatar,
            String? provider,
            String? providerId,
            List<ReviewDM> myReviews,
            ReviewsMetaDM? reviewsMeta,
            bool isLoadingMoreReviews)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileVM():
        return $default(
            _that.nickNameController,
            _that.firstNameController,
            _that.lastNameController,
            _that.emailController,
            _that.passwordController,
            _that.newPasswordController,
            _that.phoneNumberController,
            _that.addressController,
            _that.cityController,
            _that.zipCodeController,
            _that.businessNameController,
            _that.businessPhoneNumberController,
            _that.businessEmailController,
            _that.businessCityController,
            _that.businessAddressController,
            _that.businessZipCodeController,
            _that.businessIntroMessageController,
            _that.dateOfBirthNode,
            _that.placesFocusNode,
            _that.genderNode,
            _that.country,
            _that.countryNode,
            _that.businessCountry,
            _that.businessCountryNode,
            _that.formKey,
            _that.gender,
            _that.roleId,
            _that.autovalidateMode,
            _that.userSessionDM,
            _that.business,
            _that.dateOfBirth,
            _that.businessCategory,
            _that.imagePath,
            _that.logoPath,
            _that.tooltipActive,
            _that.mapController,
            _that.markers,
            _that.businessLocation,
            _that.userLocation,
            _that.businessCountryCode,
            _that.loggedUserCanEdit,
            _that.edition,
            _that.visitedUser,
            _that.termsAndContiditionsAccepted,
            _that.businessTermsAndContiditionsAccepted,
            _that.importedAvatar,
            _that.provider,
            _that.providerId,
            _that.myReviews,
            _that.reviewsMeta,
            _that.isLoadingMoreReviews);
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
            AutovalidateMode autovalidateMode,
            UserSessionDM userSessionDM,
            List<BusinessDM> business,
            DateTime? dateOfBirth,
            FoodlyCategories? businessCategory,
            String imagePath,
            String logoPath,
            bool tooltipActive,
            GoogleMapController? mapController,
            Set<Marker> markers,
            LatLngLiteral? businessLocation,
            LatLngLiteral? userLocation,
            String? businessCountryCode,
            bool loggedUserCanEdit,
            ProfileEditing edition,
            UserDM? visitedUser,
            bool termsAndContiditionsAccepted,
            bool businessTermsAndContiditionsAccepted,
            String? importedAvatar,
            String? provider,
            String? providerId,
            List<ReviewDM> myReviews,
            ReviewsMetaDM? reviewsMeta,
            bool isLoadingMoreReviews)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileVM() when $default != null:
        return $default(
            _that.nickNameController,
            _that.firstNameController,
            _that.lastNameController,
            _that.emailController,
            _that.passwordController,
            _that.newPasswordController,
            _that.phoneNumberController,
            _that.addressController,
            _that.cityController,
            _that.zipCodeController,
            _that.businessNameController,
            _that.businessPhoneNumberController,
            _that.businessEmailController,
            _that.businessCityController,
            _that.businessAddressController,
            _that.businessZipCodeController,
            _that.businessIntroMessageController,
            _that.dateOfBirthNode,
            _that.placesFocusNode,
            _that.genderNode,
            _that.country,
            _that.countryNode,
            _that.businessCountry,
            _that.businessCountryNode,
            _that.formKey,
            _that.gender,
            _that.roleId,
            _that.autovalidateMode,
            _that.userSessionDM,
            _that.business,
            _that.dateOfBirth,
            _that.businessCategory,
            _that.imagePath,
            _that.logoPath,
            _that.tooltipActive,
            _that.mapController,
            _that.markers,
            _that.businessLocation,
            _that.userLocation,
            _that.businessCountryCode,
            _that.loggedUserCanEdit,
            _that.edition,
            _that.visitedUser,
            _that.termsAndContiditionsAccepted,
            _that.businessTermsAndContiditionsAccepted,
            _that.importedAvatar,
            _that.provider,
            _that.providerId,
            _that.myReviews,
            _that.reviewsMeta,
            _that.isLoadingMoreReviews);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserProfileVM extends UserProfileVM {
  const _UserProfileVM(
      {this.nickNameController,
      this.firstNameController,
      this.lastNameController,
      this.emailController,
      this.passwordController,
      this.newPasswordController,
      this.phoneNumberController,
      this.addressController,
      this.cityController,
      this.zipCodeController,
      this.businessNameController,
      this.businessPhoneNumberController,
      this.businessEmailController,
      this.businessCityController,
      this.businessAddressController,
      this.businessZipCodeController,
      this.businessIntroMessageController,
      this.dateOfBirthNode,
      this.placesFocusNode,
      this.genderNode,
      this.country,
      this.countryNode,
      this.businessCountry,
      this.businessCountryNode,
      this.formKey,
      this.gender,
      this.roleId,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.userSessionDM = const UserSessionDM(user: UserDM(), token: ''),
      final List<BusinessDM> business = const [],
      this.dateOfBirth,
      this.businessCategory,
      this.imagePath = '',
      this.logoPath = '',
      this.tooltipActive = true,
      this.mapController,
      final Set<Marker> markers = const {},
      this.businessLocation,
      this.userLocation,
      this.businessCountryCode,
      this.loggedUserCanEdit = false,
      this.edition = ProfileEditing.none,
      this.visitedUser,
      this.termsAndContiditionsAccepted = false,
      this.businessTermsAndContiditionsAccepted = false,
      this.importedAvatar,
      this.provider,
      this.providerId,
      final List<ReviewDM> myReviews = const [],
      this.reviewsMeta,
      this.isLoadingMoreReviews = false})
      : _business = business,
        _markers = markers,
        _myReviews = myReviews,
        super._();

  @override
  final InputController? nickNameController;
  @override
  final InputController? firstNameController;
  @override
  final InputController? lastNameController;
  @override
  final InputController? emailController;
  @override
  final InputController? passwordController;
  @override
  final InputController? newPasswordController;
  @override
  final InputController? phoneNumberController;
  @override
  final InputController? addressController;
  @override
  final InputController? cityController;
  @override
  final InputController? zipCodeController;
  @override
  final InputController? businessNameController;
  @override
  final InputController? businessPhoneNumberController;
  @override
  final InputController? businessEmailController;
  @override
  final InputController? businessCityController;
  @override
  final InputController? businessAddressController;
  @override
  final InputController? businessZipCodeController;
  @override
  final InputController? businessIntroMessageController;
  @override
  final FocusNode? dateOfBirthNode;
  @override
  final FocusNode? placesFocusNode;
  @override
  final FocusNode? genderNode;
  @override
  final FoodlyCountries? country;
  @override
  final FocusNode? countryNode;
  @override
  final FoodlyCountries? businessCountry;
  @override
  final FocusNode? businessCountryNode;
  @override
  final GlobalKey<FormState>? formKey;
  @override
  final UserGender? gender;
  @override
  final UserRole? roleId;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  @override
  @JsonKey()
  final UserSessionDM userSessionDM;
  final List<BusinessDM> _business;
  @override
  @JsonKey()
  List<BusinessDM> get business {
    if (_business is EqualUnmodifiableListView) return _business;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_business);
  }

  @override
  final DateTime? dateOfBirth;
  @override
  final FoodlyCategories? businessCategory;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String logoPath;
  @override
  @JsonKey()
  final bool tooltipActive;
  @override
  final GoogleMapController? mapController;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  final LatLngLiteral? businessLocation;
  @override
  final LatLngLiteral? userLocation;
  @override
  final String? businessCountryCode;
  @override
  @JsonKey()
  final bool loggedUserCanEdit;
  @override
  @JsonKey()
  final ProfileEditing edition;
  @override
  final UserDM? visitedUser;
  @override
  @JsonKey()
  final bool termsAndContiditionsAccepted;
  @override
  @JsonKey()
  final bool businessTermsAndContiditionsAccepted;
  @override
  final String? importedAvatar;
// Social provider context populated when the user arrives at sign-up from
// a social login (e.g. Google). Forwarded to /register so the backend can
// waive the password requirement for provider-verified sign-ups.
  @override
  final String? provider;
  @override
  final String? providerId;
  final List<ReviewDM> _myReviews;
  @override
  @JsonKey()
  List<ReviewDM> get myReviews {
    if (_myReviews is EqualUnmodifiableListView) return _myReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myReviews);
  }

  @override
  final ReviewsMetaDM? reviewsMeta;
  @override
  @JsonKey()
  final bool isLoadingMoreReviews;

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileVMCopyWith<_UserProfileVM> get copyWith =>
      __$UserProfileVMCopyWithImpl<_UserProfileVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileVM &&
            (identical(other.nickNameController, nickNameController) ||
                other.nickNameController == nickNameController) &&
            (identical(other.firstNameController, firstNameController) ||
                other.firstNameController == firstNameController) &&
            (identical(other.lastNameController, lastNameController) ||
                other.lastNameController == lastNameController) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.newPasswordController, newPasswordController) ||
                other.newPasswordController == newPasswordController) &&
            (identical(other.phoneNumberController, phoneNumberController) ||
                other.phoneNumberController == phoneNumberController) &&
            (identical(other.addressController, addressController) ||
                other.addressController == addressController) &&
            (identical(other.cityController, cityController) ||
                other.cityController == cityController) &&
            (identical(other.zipCodeController, zipCodeController) ||
                other.zipCodeController == zipCodeController) &&
            (identical(other.businessNameController, businessNameController) ||
                other.businessNameController == businessNameController) &&
            (identical(other.businessPhoneNumberController, businessPhoneNumberController) ||
                other.businessPhoneNumberController ==
                    businessPhoneNumberController) &&
            (identical(other.businessEmailController, businessEmailController) ||
                other.businessEmailController == businessEmailController) &&
            (identical(other.businessCityController, businessCityController) ||
                other.businessCityController == businessCityController) &&
            (identical(other.businessAddressController, businessAddressController) ||
                other.businessAddressController == businessAddressController) &&
            (identical(other.businessZipCodeController, businessZipCodeController) ||
                other.businessZipCodeController == businessZipCodeController) &&
            (identical(other.businessIntroMessageController, businessIntroMessageController) ||
                other.businessIntroMessageController ==
                    businessIntroMessageController) &&
            (identical(other.dateOfBirthNode, dateOfBirthNode) ||
                other.dateOfBirthNode == dateOfBirthNode) &&
            (identical(other.placesFocusNode, placesFocusNode) ||
                other.placesFocusNode == placesFocusNode) &&
            (identical(other.genderNode, genderNode) ||
                other.genderNode == genderNode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryNode, countryNode) ||
                other.countryNode == countryNode) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.businessCountryNode, businessCountryNode) ||
                other.businessCountryNode == businessCountryNode) &&
            (identical(other.formKey, formKey) || other.formKey == formKey) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM) &&
            const DeepCollectionEquality().equals(other._business, _business) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.businessCategory, businessCategory) ||
                other.businessCategory == businessCategory) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.logoPath, logoPath) || other.logoPath == logoPath) &&
            (identical(other.tooltipActive, tooltipActive) || other.tooltipActive == tooltipActive) &&
            (identical(other.mapController, mapController) || other.mapController == mapController) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.businessLocation, businessLocation) || other.businessLocation == businessLocation) &&
            (identical(other.userLocation, userLocation) || other.userLocation == userLocation) &&
            (identical(other.businessCountryCode, businessCountryCode) || other.businessCountryCode == businessCountryCode) &&
            (identical(other.loggedUserCanEdit, loggedUserCanEdit) || other.loggedUserCanEdit == loggedUserCanEdit) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.visitedUser, visitedUser) || other.visitedUser == visitedUser) &&
            (identical(other.termsAndContiditionsAccepted, termsAndContiditionsAccepted) || other.termsAndContiditionsAccepted == termsAndContiditionsAccepted) &&
            (identical(other.businessTermsAndContiditionsAccepted, businessTermsAndContiditionsAccepted) || other.businessTermsAndContiditionsAccepted == businessTermsAndContiditionsAccepted) &&
            (identical(other.importedAvatar, importedAvatar) || other.importedAvatar == importedAvatar) &&
            (identical(other.provider, provider) || other.provider == provider) &&
            (identical(other.providerId, providerId) || other.providerId == providerId) &&
            const DeepCollectionEquality().equals(other._myReviews, _myReviews) &&
            (identical(other.reviewsMeta, reviewsMeta) || other.reviewsMeta == reviewsMeta) &&
            (identical(other.isLoadingMoreReviews, isLoadingMoreReviews) || other.isLoadingMoreReviews == isLoadingMoreReviews));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        nickNameController,
        firstNameController,
        lastNameController,
        emailController,
        passwordController,
        newPasswordController,
        phoneNumberController,
        addressController,
        cityController,
        zipCodeController,
        businessNameController,
        businessPhoneNumberController,
        businessEmailController,
        businessCityController,
        businessAddressController,
        businessZipCodeController,
        businessIntroMessageController,
        dateOfBirthNode,
        placesFocusNode,
        genderNode,
        country,
        countryNode,
        businessCountry,
        businessCountryNode,
        formKey,
        gender,
        roleId,
        autovalidateMode,
        userSessionDM,
        const DeepCollectionEquality().hash(_business),
        dateOfBirth,
        businessCategory,
        imagePath,
        logoPath,
        tooltipActive,
        mapController,
        const DeepCollectionEquality().hash(_markers),
        businessLocation,
        userLocation,
        businessCountryCode,
        loggedUserCanEdit,
        edition,
        visitedUser,
        termsAndContiditionsAccepted,
        businessTermsAndContiditionsAccepted,
        importedAvatar,
        provider,
        providerId,
        const DeepCollectionEquality().hash(_myReviews),
        reviewsMeta,
        isLoadingMoreReviews
      ]);

  @override
  String toString() {
    return 'UserProfileVM(nickNameController: $nickNameController, firstNameController: $firstNameController, lastNameController: $lastNameController, emailController: $emailController, passwordController: $passwordController, newPasswordController: $newPasswordController, phoneNumberController: $phoneNumberController, addressController: $addressController, cityController: $cityController, zipCodeController: $zipCodeController, businessNameController: $businessNameController, businessPhoneNumberController: $businessPhoneNumberController, businessEmailController: $businessEmailController, businessCityController: $businessCityController, businessAddressController: $businessAddressController, businessZipCodeController: $businessZipCodeController, businessIntroMessageController: $businessIntroMessageController, dateOfBirthNode: $dateOfBirthNode, placesFocusNode: $placesFocusNode, genderNode: $genderNode, country: $country, countryNode: $countryNode, businessCountry: $businessCountry, businessCountryNode: $businessCountryNode, formKey: $formKey, gender: $gender, roleId: $roleId, autovalidateMode: $autovalidateMode, userSessionDM: $userSessionDM, business: $business, dateOfBirth: $dateOfBirth, businessCategory: $businessCategory, imagePath: $imagePath, logoPath: $logoPath, tooltipActive: $tooltipActive, mapController: $mapController, markers: $markers, businessLocation: $businessLocation, userLocation: $userLocation, businessCountryCode: $businessCountryCode, loggedUserCanEdit: $loggedUserCanEdit, edition: $edition, visitedUser: $visitedUser, termsAndContiditionsAccepted: $termsAndContiditionsAccepted, businessTermsAndContiditionsAccepted: $businessTermsAndContiditionsAccepted, importedAvatar: $importedAvatar, provider: $provider, providerId: $providerId, myReviews: $myReviews, reviewsMeta: $reviewsMeta, isLoadingMoreReviews: $isLoadingMoreReviews)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileVMCopyWith<$Res>
    implements $UserProfileVMCopyWith<$Res> {
  factory _$UserProfileVMCopyWith(
          _UserProfileVM value, $Res Function(_UserProfileVM) _then) =
      __$UserProfileVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {InputController? nickNameController,
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
      AutovalidateMode autovalidateMode,
      UserSessionDM userSessionDM,
      List<BusinessDM> business,
      DateTime? dateOfBirth,
      FoodlyCategories? businessCategory,
      String imagePath,
      String logoPath,
      bool tooltipActive,
      GoogleMapController? mapController,
      Set<Marker> markers,
      LatLngLiteral? businessLocation,
      LatLngLiteral? userLocation,
      String? businessCountryCode,
      bool loggedUserCanEdit,
      ProfileEditing edition,
      UserDM? visitedUser,
      bool termsAndContiditionsAccepted,
      bool businessTermsAndContiditionsAccepted,
      String? importedAvatar,
      String? provider,
      String? providerId,
      List<ReviewDM> myReviews,
      ReviewsMetaDM? reviewsMeta,
      bool isLoadingMoreReviews});

  @override
  $InputControllerCopyWith<$Res>? get nickNameController;
  @override
  $InputControllerCopyWith<$Res>? get firstNameController;
  @override
  $InputControllerCopyWith<$Res>? get lastNameController;
  @override
  $InputControllerCopyWith<$Res>? get emailController;
  @override
  $InputControllerCopyWith<$Res>? get passwordController;
  @override
  $InputControllerCopyWith<$Res>? get newPasswordController;
  @override
  $InputControllerCopyWith<$Res>? get phoneNumberController;
  @override
  $InputControllerCopyWith<$Res>? get addressController;
  @override
  $InputControllerCopyWith<$Res>? get cityController;
  @override
  $InputControllerCopyWith<$Res>? get zipCodeController;
  @override
  $InputControllerCopyWith<$Res>? get businessNameController;
  @override
  $InputControllerCopyWith<$Res>? get businessPhoneNumberController;
  @override
  $InputControllerCopyWith<$Res>? get businessEmailController;
  @override
  $InputControllerCopyWith<$Res>? get businessCityController;
  @override
  $InputControllerCopyWith<$Res>? get businessAddressController;
  @override
  $InputControllerCopyWith<$Res>? get businessZipCodeController;
  @override
  $InputControllerCopyWith<$Res>? get businessIntroMessageController;
  @override
  $UserSessionDMCopyWith<$Res> get userSessionDM;
  @override
  $UserDMCopyWith<$Res>? get visitedUser;
  @override
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta;
}

/// @nodoc
class __$UserProfileVMCopyWithImpl<$Res>
    implements _$UserProfileVMCopyWith<$Res> {
  __$UserProfileVMCopyWithImpl(this._self, this._then);

  final _UserProfileVM _self;
  final $Res Function(_UserProfileVM) _then;

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nickNameController = freezed,
    Object? firstNameController = freezed,
    Object? lastNameController = freezed,
    Object? emailController = freezed,
    Object? passwordController = freezed,
    Object? newPasswordController = freezed,
    Object? phoneNumberController = freezed,
    Object? addressController = freezed,
    Object? cityController = freezed,
    Object? zipCodeController = freezed,
    Object? businessNameController = freezed,
    Object? businessPhoneNumberController = freezed,
    Object? businessEmailController = freezed,
    Object? businessCityController = freezed,
    Object? businessAddressController = freezed,
    Object? businessZipCodeController = freezed,
    Object? businessIntroMessageController = freezed,
    Object? dateOfBirthNode = freezed,
    Object? placesFocusNode = freezed,
    Object? genderNode = freezed,
    Object? country = freezed,
    Object? countryNode = freezed,
    Object? businessCountry = freezed,
    Object? businessCountryNode = freezed,
    Object? formKey = freezed,
    Object? gender = freezed,
    Object? roleId = freezed,
    Object? autovalidateMode = null,
    Object? userSessionDM = null,
    Object? business = null,
    Object? dateOfBirth = freezed,
    Object? businessCategory = freezed,
    Object? imagePath = null,
    Object? logoPath = null,
    Object? tooltipActive = null,
    Object? mapController = freezed,
    Object? markers = null,
    Object? businessLocation = freezed,
    Object? userLocation = freezed,
    Object? businessCountryCode = freezed,
    Object? loggedUserCanEdit = null,
    Object? edition = null,
    Object? visitedUser = freezed,
    Object? termsAndContiditionsAccepted = null,
    Object? businessTermsAndContiditionsAccepted = null,
    Object? importedAvatar = freezed,
    Object? provider = freezed,
    Object? providerId = freezed,
    Object? myReviews = null,
    Object? reviewsMeta = freezed,
    Object? isLoadingMoreReviews = null,
  }) {
    return _then(_UserProfileVM(
      nickNameController: freezed == nickNameController
          ? _self.nickNameController
          : nickNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      firstNameController: freezed == firstNameController
          ? _self.firstNameController
          : firstNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      lastNameController: freezed == lastNameController
          ? _self.lastNameController
          : lastNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      emailController: freezed == emailController
          ? _self.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      passwordController: freezed == passwordController
          ? _self.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      newPasswordController: freezed == newPasswordController
          ? _self.newPasswordController
          : newPasswordController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      phoneNumberController: freezed == phoneNumberController
          ? _self.phoneNumberController
          : phoneNumberController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      addressController: freezed == addressController
          ? _self.addressController
          : addressController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      cityController: freezed == cityController
          ? _self.cityController
          : cityController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      zipCodeController: freezed == zipCodeController
          ? _self.zipCodeController
          : zipCodeController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessNameController: freezed == businessNameController
          ? _self.businessNameController
          : businessNameController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessPhoneNumberController: freezed == businessPhoneNumberController
          ? _self.businessPhoneNumberController
          : businessPhoneNumberController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessEmailController: freezed == businessEmailController
          ? _self.businessEmailController
          : businessEmailController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessCityController: freezed == businessCityController
          ? _self.businessCityController
          : businessCityController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessAddressController: freezed == businessAddressController
          ? _self.businessAddressController
          : businessAddressController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessZipCodeController: freezed == businessZipCodeController
          ? _self.businessZipCodeController
          : businessZipCodeController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      businessIntroMessageController: freezed == businessIntroMessageController
          ? _self.businessIntroMessageController
          : businessIntroMessageController // ignore: cast_nullable_to_non_nullable
              as InputController?,
      dateOfBirthNode: freezed == dateOfBirthNode
          ? _self.dateOfBirthNode
          : dateOfBirthNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      placesFocusNode: freezed == placesFocusNode
          ? _self.placesFocusNode
          : placesFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      genderNode: freezed == genderNode
          ? _self.genderNode
          : genderNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      countryNode: freezed == countryNode
          ? _self.countryNode
          : countryNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      businessCountryNode: freezed == businessCountryNode
          ? _self.businessCountryNode
          : businessCountryNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      formKey: freezed == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      roleId: freezed == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
      business: null == business
          ? _self._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      businessCategory: freezed == businessCategory
          ? _self.businessCategory
          : businessCategory // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories?,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: null == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      tooltipActive: null == tooltipActive
          ? _self.tooltipActive
          : tooltipActive // ignore: cast_nullable_to_non_nullable
              as bool,
      mapController: freezed == mapController
          ? _self.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      businessLocation: freezed == businessLocation
          ? _self.businessLocation
          : businessLocation // ignore: cast_nullable_to_non_nullable
              as LatLngLiteral?,
      userLocation: freezed == userLocation
          ? _self.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LatLngLiteral?,
      businessCountryCode: freezed == businessCountryCode
          ? _self.businessCountryCode
          : businessCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      loggedUserCanEdit: null == loggedUserCanEdit
          ? _self.loggedUserCanEdit
          : loggedUserCanEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      edition: null == edition
          ? _self.edition
          : edition // ignore: cast_nullable_to_non_nullable
              as ProfileEditing,
      visitedUser: freezed == visitedUser
          ? _self.visitedUser
          : visitedUser // ignore: cast_nullable_to_non_nullable
              as UserDM?,
      termsAndContiditionsAccepted: null == termsAndContiditionsAccepted
          ? _self.termsAndContiditionsAccepted
          : termsAndContiditionsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      businessTermsAndContiditionsAccepted: null ==
              businessTermsAndContiditionsAccepted
          ? _self.businessTermsAndContiditionsAccepted
          : businessTermsAndContiditionsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      importedAvatar: freezed == importedAvatar
          ? _self.importedAvatar
          : importedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      myReviews: null == myReviews
          ? _self._myReviews
          : myReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
      reviewsMeta: freezed == reviewsMeta
          ? _self.reviewsMeta
          : reviewsMeta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
      isLoadingMoreReviews: null == isLoadingMoreReviews
          ? _self.isLoadingMoreReviews
          : isLoadingMoreReviews // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get nickNameController {
    if (_self.nickNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.nickNameController!, (value) {
      return _then(_self.copyWith(nickNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get firstNameController {
    if (_self.firstNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.firstNameController!, (value) {
      return _then(_self.copyWith(firstNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get lastNameController {
    if (_self.lastNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.lastNameController!, (value) {
      return _then(_self.copyWith(lastNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get emailController {
    if (_self.emailController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.emailController!, (value) {
      return _then(_self.copyWith(emailController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get passwordController {
    if (_self.passwordController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.passwordController!, (value) {
      return _then(_self.copyWith(passwordController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get newPasswordController {
    if (_self.newPasswordController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.newPasswordController!,
        (value) {
      return _then(_self.copyWith(newPasswordController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get phoneNumberController {
    if (_self.phoneNumberController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.phoneNumberController!,
        (value) {
      return _then(_self.copyWith(phoneNumberController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get addressController {
    if (_self.addressController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.addressController!, (value) {
      return _then(_self.copyWith(addressController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get cityController {
    if (_self.cityController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.cityController!, (value) {
      return _then(_self.copyWith(cityController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get zipCodeController {
    if (_self.zipCodeController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.zipCodeController!, (value) {
      return _then(_self.copyWith(zipCodeController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessNameController {
    if (_self.businessNameController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessNameController!,
        (value) {
      return _then(_self.copyWith(businessNameController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessPhoneNumberController {
    if (_self.businessPhoneNumberController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessPhoneNumberController!,
        (value) {
      return _then(_self.copyWith(businessPhoneNumberController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessEmailController {
    if (_self.businessEmailController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessEmailController!,
        (value) {
      return _then(_self.copyWith(businessEmailController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessCityController {
    if (_self.businessCityController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessCityController!,
        (value) {
      return _then(_self.copyWith(businessCityController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessAddressController {
    if (_self.businessAddressController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessAddressController!,
        (value) {
      return _then(_self.copyWith(businessAddressController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessZipCodeController {
    if (_self.businessZipCodeController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessZipCodeController!,
        (value) {
      return _then(_self.copyWith(businessZipCodeController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get businessIntroMessageController {
    if (_self.businessIntroMessageController == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.businessIntroMessageController!,
        (value) {
      return _then(_self.copyWith(businessIntroMessageController: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDMCopyWith<$Res>? get visitedUser {
    if (_self.visitedUser == null) {
      return null;
    }

    return $UserDMCopyWith<$Res>(_self.visitedUser!, (value) {
      return _then(_self.copyWith(visitedUser: value));
    });
  }

  /// Create a copy of UserProfileVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta {
    if (_self.reviewsMeta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_self.reviewsMeta!, (value) {
      return _then(_self.copyWith(reviewsMeta: value));
    });
  }
}

// dart format on
