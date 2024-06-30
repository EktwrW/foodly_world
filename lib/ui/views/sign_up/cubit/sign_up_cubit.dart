import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/consts/foodly_regex.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/business/business_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_register_dto.dart';
import 'package:foodly_world/ui/views/sign_up/view_model/sign_up_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpVM _vm;
  static final _locationService = di<LocationService>();
  static final _authService = di<AuthSessionService>();
  final _meRepo = di<MeRepo>();
  final _businessRepo = di<BusinessRepo>();
  final center = const LatLng(45.521563, -122.677433);

  SignUpCubit()
      : _vm = SignUpVM(
          nickNameController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          firstNameController: InputController(
            controller: TextEditingController(text: _authService.userSessionDM?.user.getFirstNameForSignUp),
            focusNode: FocusNode(),
          ),
          lastNameController: InputController(
            controller: TextEditingController(text: _authService.userSessionDM?.user.getLastNameForSignUp),
            focusNode: FocusNode(),
          ),
          emailController: InputController(
            controller: TextEditingController(text: _authService.userSessionDM?.user.getEmailForSignUp),
            focusNode: FocusNode(),
          ),
          passwordController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          phoneNumberController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          cityController: InputController(
            controller: TextEditingController(text: _locationService.currentCity),
            focusNode: FocusNode(),
          ),
          zipCodeController: InputController(
            controller: TextEditingController(text: _locationService.currentZipCode),
            focusNode: FocusNode(),
          ),
          businessNameController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          businessEmailController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          businessPhoneNumberController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          businessCityController: InputController(
            controller: TextEditingController(text: _locationService.currentState),
            focusNode: FocusNode(),
          ),
          businessAddressController: InputController(
            controller: TextEditingController(text: _locationService.currentCity),
            focusNode: FocusNode(),
          ),
          businessZipCodeController: InputController(
            controller: TextEditingController(text: _locationService.currentZipCode),
            focusNode: FocusNode(),
          ),
          autoCompleteController: TextEditingController(),
          formKey: GlobalKey<FormState>(),
          dateOfBirthNode: FocusNode(),
          genderNode: FocusNode(),
          countryNode: FocusNode(),
          businessCountryNode: FocusNode(),
          businessCountry: _authService.userSessionDM?.user.country,
          businessCountryCode: _authService.userSessionDM?.user.country?.countryCode,
        ),
        super(const SignUpState.initial()) {
    _initializeMarkers();
    emit(_Loaded(_vm));
  }

  String get currentCountryCode => _vm.country?.countryCode ?? _locationService.currentCountryCode;
  UserRole? get getUserRole => _vm.roleId;
  List<UserRole> get getUserTypes => _vm.userTypes;
  Position? get getCurrentPosition => _locationService.currentLocation.position;
  String get imagePath => _vm.imagePath;
  String get lang => _authService.lang;
  String get googleApiKey => di<BaseConfig>().googleDefaultApiKey;

  void _initializeMarkers() {
    final marker = Marker(
      markerId: MarkerId('${_vm.userSessionDM.user.username} location'),
      position:
          LatLng(getCurrentPosition?.latitude ?? center.latitude, getCurrentPosition?.longitude ?? center.longitude),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      // To create a custom icon, use BitmapDescriptor.fromAssetImage:
      // icon: BitmapDescriptor.fromAssetImage('assets/my_custom_icon.png'),
    );

    _vm = _vm.copyWith(markers: {marker});
  }

  Future<void> onSignUpUserPressed() async {
    setAutovalidateMode(AutovalidateMode.always);

    if (_vm.formKey?.currentState?.validate() ?? false) {
      await signUpUser();
    }
  }

  Future<void> signUpUser() async {
    emit(_Loading(_vm));

    final registerDTO = UserBodyRegisterDTO(
      userName: _vm.nickNameController?.controller?.text ?? '',
      firstName: _vm.firstNameController?.controller?.text ?? '',
      lastName: _vm.lastNameController?.controller?.text ?? '',
      email: _vm.emailController?.controller?.text ?? '',
      password: _vm.passwordController?.controller?.text ?? '',
      passwordConfirmation: _vm.passwordController?.controller?.text ?? '',
      phone: _vm.phoneNumberController?.controller?.text ?? '',
      dateOfBirth: _vm.dateOfBirth?.toUtc() ?? DateTime.now().toUtc(),
      address: '',
      zipCode: _vm.zipCodeController?.controller?.text ?? '',
      city: _vm.cityController?.controller?.text ?? '',
      country: _vm.country!,
      gender: _vm.userGender.name.toLowerCase(),
      roleId: _vm.roleId,
    );

    await _meRepo.register(registerDTO: registerDTO, filePath: _vm.imagePath).then((response) {
      return response.when(
        success: (userSessionDM) {
          _authService.setSession(userSessionDM);
          emit(_UserCreated(_vm = _vm.copyWith(userSessionDM: userSessionDM)));
        },
        failure: (e) {
          di<Logger>().e(e.errorMsg);
          emit(_Error('$e', _vm));
        },
      );
    });
  }

  void processImagePath(String? imagePath) async => emit(_Loaded(_vm = _vm.copyWith(imagePath: imagePath ?? '')));

  void setUserCountry(FoodlyCountries? country) =>
      country != null ? emit(_Loaded(_vm = _vm.copyWith(country: country))) : null;

  void setUserGender(UserGender? gender) => gender != null ? emit(_Loaded(_vm = _vm.copyWith(gender: gender))) : null;

  void setUserType(UserRole role) => emit(_Loaded(_vm = _vm.copyWith(roleId: role)));

  void userCreated() => emit(_UserCreated(_vm));

  void updateDateOfBirth(DateTime? picked) => emit(_Loaded(_vm = _vm.copyWith(dateOfBirth: picked)));

  void setBusinessCategory(FoodlyCategories? category) =>
      category != null ? emit(_Loaded(_vm = _vm.copyWith(businessCategory: category))) : null;

  void setBusinessCountry(FoodlyCountries? country) => country != null
      ? emit(_Loaded(_vm = _vm.copyWith(businessCountry: country, businessCountryCode: country.countryCode)))
      : null;

  void processLogoPath(String? logoPath) => emit(_Loaded(_vm = _vm.copyWith(logoPath: logoPath ?? '')));

  void hideTooltipInBusinessSignUp() => emit(_Loaded(_vm = _vm.copyWith(tooltipActive: false)));

  void updateBusinessFromPlacesAPI(Place detail) async {
    final country = detail.addressComponents?.firstWhere((d) => d.types.contains(FoodlyStrings.COUNTRY)).longName ?? '';

    if (FoodlyCountries.values.any((c) => c.value.contains(country))) {
      _vm = _vm.copyWith(businessCountry: FoodlyCountries.values.firstWhere((c) => c.value.contains(country)));
    }

    _vm.businessNameController?.controller?.text = detail.name ?? '';

    _vm.businessPhoneNumberController?.controller?.text =
        (detail.formattedPhoneNumber ?? '').replaceAll(FoodlyRegex.phoneCleanUpCode, '');

    _vm = _vm.copyWith(
        businessCountryCode:
            detail.addressComponents?.firstWhere((d) => d.types.contains(FoodlyStrings.COUNTRY)).shortName ??
                _locationService.currentCountryCode);

    _vm.businessCityController?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.LOCALITY))?.longName ?? '';

    _vm.businessAddressController?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.ROUTE))?.longName ?? '';

    _vm.businessZipCodeController?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.POSTAL_CODE))?.longName ?? '';

    if (detail.geometry != null) {
      final location = detail.geometry!.location;

      _vm = _vm.copyWith(businessLocation: LatLngLiteral(lat: location.lat, lng: location.lng));

      final newMarker = Marker(
        markerId: MarkerId(detail.placeId ?? ''),
        position: LatLng(location.lat, location.lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        infoWindow: InfoWindow(title: detail.name ?? ''),
      );
      _vm = _vm.copyWith(markers: Set.from(_vm.markers)..add(newMarker));
    }

    emit(_Loaded(_vm));
  }

  Future<void> signUpBusiness() async {
    emit(_Loading(_vm));

    final bodyRegisterDTO = BusinessBodyRegisterDTO(
      businessName: _vm.businessNameController?.controller?.text ?? '',
      businessEmail: _vm.businessEmailController?.controller?.text ?? '',
      businessPhone: _vm.businessPhoneNumberController?.controller?.text ?? '',
      businessAddress: _vm.businessAddressController?.controller?.text ?? '',
      businessZipcode: _vm.businessZipCodeController?.controller?.text ?? '',
      businessCity: _vm.businessCityController?.controller?.text ?? '',
      businessCountry: _vm.businessCountry!,
      businessWebsite: '',
      businessLatitude: _vm.businessLocation?.lat,
      businessLongitude: _vm.businessLocation?.lng,
      categoryId: _vm.businessCategory!,
    );

    await _businessRepo.register(registerDTO: bodyRegisterDTO, filePath: _vm.logoPath).then((response) {
      return response.when(
        success: (businessDM) {
          final manager = _authService.userSessionDM!.user.copyWith(business: [businessDM]);
          _authService.setSession(_authService.userSessionDM!.copyWith(user: manager));

          emit(_BusinessCreated(_vm = _vm.copyWith(
              userSessionDM: _authService.userSessionDM ?? const UserSessionDM(user: UserDM(), token: ''))));
        },
        failure: (e) {
          di<Logger>().e(e.errorMsg);
          emit(_Error('$e', _vm));
        },
      );
    });
  }

  void onMapCreated(GoogleMapController controller) => emit(_Loaded(_vm = _vm.copyWith(mapController: controller)));

  void setAutovalidateMode(AutovalidateMode newMode) => emit(_Loaded(_vm = _vm.copyWith(autovalidateMode: newMode)));
}
