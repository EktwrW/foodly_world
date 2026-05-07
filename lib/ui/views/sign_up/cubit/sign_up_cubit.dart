import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:foodly_world/data_transfer_objects/business/business_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_update_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nova_places_api/nova_places_api.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  UserProfileVM _vm;
  final LocationService _locationService;
  final AuthSessionService _authService;
  final MeRepo _meRepo;
  final BusinessRepo _businessRepo;
  final center = const LatLng(45.521563, -122.677433);

  SignUpCubit(
    LocationService locationService,
    AuthSessionService authService,
    MeRepo meRepo,
    BusinessRepo businessRepo,
  )   : _locationService = locationService,
        _authService = authService,
        _meRepo = meRepo,
        _businessRepo = businessRepo,
        _vm = UserProfileVM(
          nickNameController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          firstNameController: InputController(
            controller: TextEditingController(text: authService.userSessionDM?.user.getFirstNameForSignUp),
            focusNode: FocusNode(),
          ),
          lastNameController: InputController(
            controller: TextEditingController(text: authService.userSessionDM?.user.getLastNameForSignUp),
            focusNode: FocusNode(),
          ),
          emailController: InputController(
            controller: TextEditingController(text: authService.userSessionDM?.user.getEmailForSignUp),
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
          addressController: InputController(
            controller: TextEditingController(text: locationService.currentAddress),
            focusNode: FocusNode(),
          ),
          cityController: InputController(
            controller: TextEditingController(text: locationService.currentCity),
            focusNode: FocusNode(),
          ),
          zipCodeController: InputController(
            controller: TextEditingController(text: locationService.currentZipCode),
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
            controller: TextEditingController(
                text: authService.userSessionDM?.user.principalAddress?.city ?? locationService.currentCity),
            focusNode: FocusNode(),
          ),
          businessAddressController: InputController(
            controller: TextEditingController(
                text: authService.userSessionDM?.user.isClient == true ? '' : locationService.currentAddress),
            focusNode: FocusNode(),
          ),
          businessZipCodeController: InputController(
            controller: TextEditingController(
                text: authService.userSessionDM?.user.principalAddress?.zipCode ?? locationService.currentZipCode),
            focusNode: FocusNode(),
          ),
          businessIntroMessageController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          formKey: GlobalKey<FormState>(),
          dateOfBirthNode: FocusNode(),
          genderNode: FocusNode(),
          countryNode: FocusNode(),
          placesFocusNode: FocusNode(),
          businessCountryNode: FocusNode(),
          // country: sólo sembramos desde `locationService` si ya hay data GPS
          // real. Pre-login el service está virgen y `currentCountryCode` cae a
          // 'US' por fallback — si confiáramos en eso, [applyDeviceLocation] ya
          // encontraría country != null y su guard `_vm.country == null` nunca
          // dispararía, dejando el form pegado en USA incluso para usuarios en
          // AR/ES/PT/VE. Con country=null, el pipeline
          // LocationEvent.checkLocation → _LocationChecked(dm) → applyDeviceLocation
          // siembra el país real. Post-login esto es no-op: `hasLocationData`
          // ya es true, entonces se mantiene el comportamiento previo.
          country: locationService.hasLocationData
              ? FoodlyCountries.values.firstWhereOrNull((c) => c.countryCode == locationService.currentCountryCode)
              : null,
          businessCountry: authService.userSessionDM?.user.principalAddress?.country,
          businessCountryCode: authService.userSessionDM?.user.principalAddress?.country?.countryCode,
          userSessionDM: authService.userSessionDM ?? const UserSessionDM(user: UserDM(), token: ''),
        ),
        super(const SignUpState.initial()) {
    // Initialize userLocation from GPS if available, so pre-filled addresses
    // retain their coordinates even without Places autocomplete selection.
    if (_locationService.hasLocationData) {
      final pos = _locationService.currentLocation.position!;
      _vm = _vm.copyWith(userLocation: LatLngLiteral(lat: pos.latitude, lng: pos.longitude));
    }
    _initializeMarkers();
    emit(_Loaded(_vm));
  }

  String get currentCountryCode => _vm.country?.countryCode ?? _locationService.currentCountryCode;
  UserRole? get getUserRole => _vm.roleId;
  List<UserRole> get getUserTypes => _vm.userTypes;
  Position? get getCurrentPosition => _locationService.currentLocation.position;
  String get lang => _authService.lang;
  // Note: `googleApiKey` getter removido 2026-05-07 — código muerto desde Fase 4
  // del Places Proxy (Apr 2026). La Android Maps API key fue restringida por
  // package+SHA-1 ese mismo día, así que aunque alguien la re-introduzca por
  // accidente, GCP la rechazaría desde iOS/web igual.
  bool get isGoogleSignIn => _vm.importedAvatar?.isNotEmpty ?? false;

  // Tracks the ISO code and complete number from the phone field's onChanged.
  // Using completeNumber avoids double-prefix bugs when the controller only stores the national part.
  String _phoneIsoCode = '';
  String _completePhone = '';
  String get phoneIsoCode => _phoneIsoCode;
  String get completePhone => _completePhone;
  void setPhoneIsoCode(String isoCode) => _phoneIsoCode = isoCode.toUpperCase();
  void setCompletePhone(String phone) => _completePhone = phone;

  bool validateForm() {
    setAutovalidateMode(AutovalidateMode.always);
    return _vm.formKey?.currentState?.validate() ?? false;
  }

  void _initializeMarkers() {
    final marker = Marker(
      markerId: MarkerId('${_vm.userSessionDM.user.username} location'),
      position:
          LatLng(getCurrentPosition?.latitude ?? center.latitude, getCurrentPosition?.longitude ?? center.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    );

    _vm = _vm.copyWith(markers: {marker});
  }

  Future<void> onSignUpUserPressed() async {
    if (validateForm()) await signUpUser();
  }

  Future<void> signUpUser({String? firebaseToken}) async {
    emit(_Loading(_vm));

    // Crear la dirección "home" por defecto
    final homeAddressLabel = AddressLabelDM(
      name: 'home',
      description: 'Home address',
      icon: 'home',
    );

    final homeAddress = AddressDM(
      id: 0, // Será asignado por el backend
      uuid: '', // Será asignado por el backend
      address: _vm.addressController?.controller?.text ?? '',
      city: _vm.cityController?.controller?.text ?? '',
      country: _vm.country,
      zipCode: _vm.zipCodeController?.controller?.text ?? '',
      latitude: _vm.userLocation?.lat ?? getCurrentPosition?.latitude ?? 0.0,
      longitude: _vm.userLocation?.lng ?? getCurrentPosition?.longitude ?? 0.0,
      addressLabel: homeAddressLabel,
      principal: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // For social sign-ups the provider verified the identity, so we don't
    // send a password (the backend waives the requirement when `provider`
    // and `provider_id` are present).
    final password = isGoogleSignIn ? '' : (_vm.passwordController?.controller?.text ?? '');

    final registerDTO = UserBodyRegisterDTO(
      userName: _vm.nickNameController?.controller?.text ?? '',
      firstName: _vm.firstNameController?.controller?.text ?? '',
      lastName: _vm.lastNameController?.controller?.text ?? '',
      email: _vm.emailController?.controller?.text ?? '',
      password: password,
      passwordConfirmation: password,
      phone: _vm.phoneNumberController?.controller?.text ?? '',
      // No `.toUtc()` — el DTO se serializa con `.toIso8601String()` via
      // freezed/json_serializable, que ya emite el ISO con la zona local.
      // El BE (Carbon::parse) lo acepta en cualquier zona y normaliza.
      // Forzar UTC acá rompe consistencia con el resto del proyecto.
      dateOfBirth: _vm.dateOfBirth ?? DateTime.now(),
      address: _vm.addressController?.controller?.text ?? '',
      zipCode: _vm.zipCodeController?.controller?.text ?? '',
      city: _vm.cityController?.controller?.text ?? '',
      country: _vm.country!,
      gender: _vm.userGender.key,
      roleId: _vm.roleId,
      termsAndContiditionsAccepted: _vm.termsAndContiditionsAccepted,
      latitude: _vm.userLocation?.lat ?? getCurrentPosition?.latitude,
      longitude: _vm.userLocation?.lng ?? getCurrentPosition?.longitude,
      addresses: [homeAddress],
      firebasePhoneToken: firebaseToken,
      provider: _vm.provider,
      providerId: _vm.providerId,
    );

    await _meRepo
        .register(registerDTO: registerDTO, filePath: _vm.imagePath, avatarUrl: _vm.importedAvatar)
        .then((response) {
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

  void processImagePath(String? imagePath) async => emit(_Loaded(_vm = _vm.copyWith(
        imagePath: imagePath ?? '',
        // Clear provider avatar so the gallery photo is used at registration
        importedAvatar: (imagePath?.isNotEmpty == true) ? null : _vm.importedAvatar,
      )));

  void processImportedAvatar(String? importedAvatar) async =>
      emit(_Loaded(_vm = _vm.copyWith(importedAvatar: importedAvatar)));

  /// Persist the provider context received from `/social-login` so that the
  /// `/register` call can forward it to the backend and skip password.
  void processSocialSignUpData({String? avatar, String? provider, String? providerId}) async {
    _vm = _vm.copyWith(
      importedAvatar: avatar ?? _vm.importedAvatar,
      provider: provider,
      providerId: providerId,
    );
    emit(_Loaded(_vm));
  }

  void setUserCountry(FoodlyCountries? country) =>
      country != null ? emit(_Loaded(_vm = _vm.copyWith(country: country))) : null;

  void updateUserLocationFromPlacesAPI(Place detail) async {
    final country = detail.addressComponents?.firstWhere((d) => d.types.contains(FoodlyStrings.COUNTRY)).longName ?? '';

    if (FoodlyCountries.values.any((c) => c.value.contains(country))) {
      _vm = _vm.copyWith(country: FoodlyCountries.values.firstWhere((c) => c.value.contains(country)));
    }

    _vm.addressController?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.ROUTE))?.longName ?? '';

    _vm.cityController?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.LOCALITY))?.longName ?? '';

    _vm.zipCodeController?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.POSTAL_CODE))?.longName ?? '';

    if (detail.geometry != null) {
      final location = detail.geometry!.location;

      _vm = _vm.copyWith(userLocation: LatLngLiteral(lat: location.lat, lng: location.lng));
    }

    _vm.phoneNumberController?.focusNode?.requestFocus();

    emit(_Loaded(_vm));
  }

  /// Pre-fill de country / dirección / coords desde el bootstrap GPS del
  /// dispositivo (reverse-geocoding vía `PlacesProxyRepo.reverse`).
  ///
  /// Consumer del `LocationBloc`: `SignUpUserPage` dispara
  /// `LocationEvent.checkLocation` pre-login y el `BlocListener` delega acá
  /// cuando llega `_LocationChecked(dm)`. El pipeline completo es:
  ///
  ///   Geolocator.getCurrentPosition → PlacesProxyRepo.reverse → _LocationChecked(dm) → applyDeviceLocation(dm)
  ///
  /// **Contrato:**
  /// - **No pisa lo que el usuario ya escribió.** Cada controller solo se
  ///   pre-fillea si `text.isEmpty`. Esto cubre:
  ///     (a) usuario tipeando más rápido que el reverse-geocoding,
  ///     (b) valores pre-existentes desde [processSocialSignUpData],
  ///     (c) múltiples `_LocationChecked` en un resume/re-check.
  /// - **Idempotente.** Si ninguna asignación aplicó (todo ya lleno o el DM
  ///   vacío), no se emite un estado nuevo — evita rebuilds innecesarios.
  /// - **No llama `LocationService.updateLocation`.** A propósito: ese
  ///   side-effect vive en `FoodlyLocationWrapper` y arrastra carga de
  ///   `NearbyPromotionsCubit` + `NewReleasesCubit` + splash removal.
  ///   Duplicarlo acá rompería el happy path post-login. Trade-off: una
  ///   llamada extra a `/geocoding/reverse` cuando el usuario termina el
  ///   sign-up y el wrapper se monta (backend la cachea, costo marginal).
  /// - **Country matching por countryCode ISO-2.** Si el code del dispositivo
  ///   no matchea ningún `FoodlyCountries` activo (p.ej. usuario en Chile),
  ///   dejamos `country` como estaba. Pre-login el constructor ahora deja
  ///   `country=null` cuando el service está virgen (ver constructor), así que
  ///   el guard `_vm.country == null` dispara correctamente y sembramos el país
  ///   real. Post-login, el constructor ya resolvió el país desde el GPS real;
  ///   un segundo `_LocationChecked` del mismo país es no-op.
  void applyDeviceLocation(LocationDetailsDM dm) {
    var changed = false;

    // 1) Country: solo sobrescribe si aún no hay country seteado y el DM
    // trae un code reconocido. No forzamos USA si el code es de un mercado
    // fuera de Foodly — respetamos la selección default del constructor.
    final resolvedCountry =
        FoodlyCountries.values.firstWhereOrNull((c) => c.countryCode == dm.countryCode);
    if (_vm.country == null && resolvedCountry != null) {
      _vm = _vm.copyWith(country: resolvedCountry);
      changed = true;
    }

    // 2) Controllers: pre-fill SOLO si están vacíos. Preservamos typing en
    // curso e inputs ya pre-llenos (social sign-up).
    final addressCtrl = _vm.addressController?.controller;
    final addressText = dm.address;
    if (addressCtrl != null &&
        addressCtrl.text.isEmpty &&
        addressText != null &&
        addressText.isNotEmpty) {
      addressCtrl.text = addressText;
      changed = true;
    }

    final cityCtrl = _vm.cityController?.controller;
    final cityText = dm.city;
    if (cityCtrl != null && cityCtrl.text.isEmpty && cityText != null && cityText.isNotEmpty) {
      cityCtrl.text = cityText;
      changed = true;
    }

    final zipCtrl = _vm.zipCodeController?.controller;
    final zipText = dm.zipCode;
    if (zipCtrl != null && zipCtrl.text.isEmpty && zipText != null && zipText.isNotEmpty) {
      zipCtrl.text = zipText;
      changed = true;
    }

    // 3) userLocation (coords): el constructor ya la setea si
    // `_locationService.hasLocationData` era true al nacer el cubit. En el
    // flujo pre-login el service estaba virgen, así que la sembramos acá.
    if (_vm.userLocation == null && dm.position != null) {
      _vm = _vm.copyWith(
        userLocation: LatLngLiteral(lat: dm.position!.latitude, lng: dm.position!.longitude),
      );
      changed = true;
    }

    if (changed) emit(_Loaded(_vm));
  }

  void setUserGender(UserGender? gender) => gender != null ? emit(_Loaded(_vm = _vm.copyWith(gender: gender))) : null;

  void setUserType(UserRole role) => emit(_Loaded(_vm = _vm.copyWith(roleId: role)));

  void setTermsAndContiditions(bool value) => emit(_Loaded(_vm = _vm.copyWith(termsAndContiditionsAccepted: value)));

  void setBusinessTermsAndContiditions(bool value) =>
      emit(_Loaded(_vm = _vm.copyWith(businessTermsAndContiditionsAccepted: value)));

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
        (detail.formattedPhoneNumber ?? '').replaceAll(RegExp(FoodlyRegex.phoneCleanUpCode as String), '');

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
      introMessage: _vm.businessIntroMessageController?.controller?.text.trim().isEmpty == true
          ? null
          : _vm.businessIntroMessageController?.controller?.text.trim(),
      termsAccepted: _vm.businessTermsAndContiditionsAccepted,
    );

    final registerResult = await _businessRepo.register(registerDTO: bodyRegisterDTO, filePath: _vm.logoPath);

    await registerResult.when(
      success: (businessDM) async {
        final currentSession = _authService.userSessionDM;
        if (currentSession == null) {
          emit(_Error('Missing auth session after business registration', _vm));
          return;
        }

        final fetchResult = await _meRepo.fetchLoggedUser();

        await fetchResult.when(
          success: (freshUser) async {
            final userWithBusiness =
                freshUser.business.isNotEmpty ? freshUser : freshUser.copyWith(business: [businessDM]);

            _authService
              ..setSession(currentSession.copyWith(user: userWithBusiness))
              ..initializeFavorites()
              ..initializeNotifications();

            emit(_BusinessCreationFinished(_vm = _vm.copyWith(
                userSessionDM: _authService.userSessionDM ?? const UserSessionDM(user: UserDM(), token: ''))));
          },
          failure: (e) async {
            di<Logger>().w('Could not refresh logged user after business creation: ${e.errorMsg}');

            final optimisticManager = currentSession.user.copyWith(
              business: [businessDM],
              roleId: UserRole.owner,
              userRole: 'Manager',
            );

            _authService
              ..setSession(currentSession.copyWith(user: optimisticManager))
              ..initializeFavorites()
              ..initializeNotifications();

            emit(_BusinessCreationFinished(_vm = _vm.copyWith(
                userSessionDM: _authService.userSessionDM ?? const UserSessionDM(user: UserDM(), token: ''))));
          },
        );
      },
      failure: (e) async {
        di<Logger>().e('Business registration failed: ${e.errorMsg}');
        emit(_Error(e.errorMsg, _vm));
      },
    );
  }

  void onMapCreated(GoogleMapController controller) => emit(_Loaded(_vm = _vm.copyWith(mapController: controller)));

  void setAutovalidateMode(AutovalidateMode newMode) => emit(_Loaded(_vm = _vm.copyWith(autovalidateMode: newMode)));

  void changeUserRoleToClient() async {
    emit(_Loading(_vm));

    final dto = const UserBodyUpdateDTO(roleId: UserRole.customer);

    await _meRepo.updateProfile(dto).then((result) {
      result.when(
        success: (userSessionDM) => emit(_BusinessCreationFinished(_vm =
            _vm.copyWith(userSessionDM: _authService.userSessionDM ?? const UserSessionDM(user: UserDM(), token: '')))),
        failure: (e) {
          di<Logger>().e(e.errorMsg);
          emit(_Error(e.errorMsg, _vm));
        },
      );
    });

    setAutovalidateMode(AutovalidateMode.disabled);
  }
}
