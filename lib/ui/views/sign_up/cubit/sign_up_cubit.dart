import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
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
import 'package:intl/intl.dart';
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
          nickNameController: TextEditingController(),
          firstNameController: TextEditingController(
            text: _authService.userSessionDM?.user.getFirstNameForSignUp,
          ),
          lastNameController: TextEditingController(
            text: _authService.userSessionDM?.user.getLastNameForSignUp,
          ),
          emailController: TextEditingController(
            text: _authService.userSessionDM?.user.getEmailForSignUp,
          ),
          passwordController: TextEditingController(),
          phoneNumberController: TextEditingController(),
          countryController: TextEditingController(text: _locationService.currentCountry),
          cityController: TextEditingController(text: _locationService.currentCity),
          zipCodeController: TextEditingController(text: _locationService.currentZipCode),
          businessNameController: TextEditingController(),
          businessEmailController: TextEditingController(),
          businessPhoneNumberController: TextEditingController(),
          businessCountryController: TextEditingController(text: _locationService.currentCountry),
          businessCityController: TextEditingController(text: _locationService.currentState),
          businessAddressController: TextEditingController(text: _locationService.currentCity),
          businessZipCodeController: TextEditingController(text: _locationService.currentZipCode),
          autoCompleteController: TextEditingController(),
          currentCountryCode: _locationService.currentCountryCode,
          formKey: GlobalKey<FormState>(),
          nickNameNode: FocusNode(),
          firstNameNode: FocusNode(),
          lastNameNode: FocusNode(),
          emailNode: FocusNode(),
          passwordNode: FocusNode(),
          dateOfBirthNode: FocusNode(),
          phoneNumberNode: FocusNode(),
          countryNode: FocusNode(),
          cityNode: FocusNode(),
          zipCodeNode: FocusNode(),
          genderNode: FocusNode(),
          businessNameNode: FocusNode(),
          businessEmailNode: FocusNode(),
          businessDateOfOpeningNode: FocusNode(),
          businessPhoneNumberNode: FocusNode(),
          businessCountryNode: FocusNode(),
          businessCityNode: FocusNode(),
          businessAddressNode: FocusNode(),
          businessZipCodeNode: FocusNode(),
        ),
        super(const SignUpState.initial()) {
    _initializeMarkers();
    emit(_Loaded(_vm));
  }

  String get currentCountryCode => _vm.currentCountryCode ?? _locationService.currentCountryCode;
  UserRole? get getUserRole => _vm.roleId;
  List<UserRole> get getUserTypes => _vm.userTypes;
  Position? get getCurrentPosition => _locationService.currentLocation.position;
  String get imagePath => _vm.imagePath;
  String get lang => Intl.getCurrentLocale().substring(0, 2);
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
    emit(_Loaded(_vm));
    if (_vm.formKey?.currentState?.validate() ?? false) {
      await signUpUser();
    }
  }

  Future<void> signUpUser() async {
    emit(_Loading(_vm));

    final registerDTO = UserBodyRegisterDTO(
      userName: _vm.nickNameController?.text ?? '',
      firstName: _vm.firstNameController?.text ?? '',
      lastName: _vm.lastNameController?.text ?? '',
      email: _vm.emailController?.text ?? '',
      password: _vm.passwordController?.text ?? '',
      passwordConfirmation: _vm.passwordController?.text ?? '',
      phone: _vm.phoneNumberController?.text ?? '',
      dateOfBirth: _vm.dateOfBirth?.toUtc() ?? DateTime.now().toUtc(),
      address: '-',
      zipCode: _vm.zipCodeController?.text ?? '',
      city: _vm.cityController?.text ?? '',
      country: _vm.countryController?.text ?? '',
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

  void setUserGender(UserGender? gender) => gender != null ? emit(_Loaded(_vm = _vm.copyWith(gender: gender))) : null;

  void setUserType(UserRole role) => emit(_Loaded(_vm = _vm.copyWith(roleId: role)));

  void userCreated() => emit(_UserCreated(_vm));

  void updateDateOfBirth(DateTime? picked) => emit(_Loaded(_vm = _vm.copyWith(dateOfBirth: picked)));

  void setBusinessCategory(FoodlyCategories? category) =>
      category != null ? emit(_Loaded(_vm = _vm.copyWith(businessCategory: category))) : null;

  void setBusinessDateOfOpening(DateTime? picked) => emit(_Loaded(_vm = _vm.copyWith(businessDateOfOpening: picked)));

  void processLogoPath(String? logoPath) => emit(_Loaded(_vm = _vm.copyWith(logoPath: logoPath ?? '')));

  void hideTooltipInBusinessSignUp() => emit(_Loaded(_vm = _vm.copyWith(tooltipActive: false)));

  void updateBusinessFromPlacesAPI(Place detail) async {
    _vm.businessNameController?.text = detail.name ?? '';

    _vm.businessPhoneNumberController?.text = (detail.formattedPhoneNumber ?? '').replaceAll(RegExp(r'[()\s-]'), '');

    _vm.businessCountryController?.text =
        detail.addressComponents?.firstWhere((d) => d.types.contains('country')).longName ?? '';

    _vm = _vm.copyWith(
        businessCountryCode: detail.addressComponents?.firstWhere((d) => d.types.contains('country')).shortName ??
            _locationService.currentCountryCode);

    _vm.businessCityController?.text =
        detail.addressComponents?.firstWhere((d) => d.types.contains('locality')).longName ?? '';

    _vm.businessAddressController?.text =
        detail.addressComponents?.firstWhere((d) => d.types.contains('route')).longName ?? '';

    _vm.businessZipCodeController?.text =
        detail.addressComponents?.firstWhere((d) => d.types.contains('postal_code')).longName ?? '';

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

    // if (detail.placeId != null) await fetchPlaceDetails(detail.placeId!);
  }

  Future<void> signUpBusiness() async {
    emit(_Loading(_vm));

    final bodyRegisterDTO = BusinessBodyRegisterDTO(
      businessName: _vm.businessNameController?.text ?? '',
      businessEmail: _vm.businessEmailController?.text ?? '',
      businessPhone: _vm.businessPhoneNumberController?.text ?? '',
      businessAddress: _vm.businessAddressController?.text ?? '',
      businessZipcode: _vm.businessZipCodeController?.text ?? '',
      businessCity: _vm.businessCityController?.text ?? '',
      businessCountry: _vm.businessCountryController?.text ?? '',
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

  // Future<void> fetchPlaceDetails(String placeId) async {
  //   final String url = 'https://maps.googleapis.com/maps/api/place/details/json';
  //   final _dio = Dio();

  //   try {
  //     final response = await _dio.get(url, queryParameters: {
  //       'place_id': placeId,
  //       'key': 'AIzaSyDQd8kLET9EaWLZH4MeBDLMhsL_sN0RDyY',
  //       'fields': 'name,opening_hours',
  //     });

  //     if (response.statusCode == 200) {
  //       var openingHours = response.data['result']['opening_hours'];
  //       if (openingHours != null) {
  //         log('openingHours: $openingHours');
  //         print('openingHours: $openingHours');
  //         // Acceso a 'weekday_text' dentro de 'opening_hours'
  //         var weekdayText = openingHours['weekday_text'];
  //         log('Horario de apertura: $weekdayText');
  //         print('Horario de apertura: $weekdayText');
  //       } else {
  //         log('Los horarios de apertura no están disponibles.');
  //       }
  //     } else {
  //       log('Error al obtener los datos del lugar: ${response.statusCode}');
  //     }
  //   } on DioException catch (e) {
  //     log('DioError al obtener los datos del lugar: $e');
  //   }
  // }
}
