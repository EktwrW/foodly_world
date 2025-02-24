import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show AutovalidateMode, FocusNode, FormState, GlobalKey, TextEditingController;
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_update_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_places_api/nova_places_api.dart';

export 'package:foodly_world/core/view_models/user_profile_vm.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileVM _vm;
  static final _locationService = di<LocationService>();
  static final _authService = di<AuthSessionService>();
  final _meRepo = di<MeRepo>();
  late final String _currentuuid;

  UserProfileCubit(String currentuuid)
      : _currentuuid = currentuuid,
        _vm = UserProfileVM(
          loggedUserCanEdit: _authService.uuid == currentuuid,
          userSessionDM: _authService.userSessionDM ?? const UserSessionDM(user: UserDM(), token: ''),
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
          newPasswordController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          phoneNumberController: InputController(
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          addressController: InputController(
            controller: TextEditingController(text: _locationService.currentAddress),
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
          formKey: GlobalKey<FormState>(),
          gender: _authService.userSessionDM?.user.gender,
          genderNode: FocusNode(),
          dateOfBirthNode: FocusNode(),
          countryNode: FocusNode(),
          country: _authService.userSessionDM?.user.country ??
              FoodlyCountries.values.firstWhereOrNull((c) => c.countryCode == _locationService.currentCountryCode),
        ),
        super(const UserProfileState.initial(UserProfileVM())) {
    _fetchUser();
  }

  String get currentCountryCode => (_vm.country?.countryCode ?? di<LocationService>().currentCountryCode).toUpperCase();
  String get lang => _authService.lang;
  UserRole? get getUserRole => _vm.roleId;
  String get imagePath => _vm.imagePath;

  void updateEditMode(ProfileEditing editMode) => emit(_Loaded(_vm = _vm.copyWith(edition: editMode)));

  void _fetchUser() async {
    emit(_Loading(_vm));

    await (_vm.loggedUserCanEdit ? _meRepo.fetchLoggedUser() : _meRepo.getUserByGuid(_currentuuid)).then((result) {
      result.when(
        success: (user) => _updateCurrentUser(user),
        failure: (e) => emit(_Error(e.errorMsg, _vm)),
      );
    });
  }

  void _updateCurrentUser(UserDM user) {
    final isInitialFetch = !_vm.edition.isActive;

    if (_vm.loggedUserCanEdit) {
      if (_vm.edition.isEditingAddress) {
        di<LocationService>().updateLocationUserDM(user);
      }

      _vm = _vm.copyWith(userSessionDM: _vm.userSessionDM.copyWith(user: user), edition: ProfileEditing.none);

      _authService.setSession(_vm.userSessionDM);

      if (isInitialFetch) {
        emit(_Loaded(_vm));
      } else {
        emit(_UserUpdated(_vm = _vm.copyWith(edition: ProfileEditing.none), S.current.userProfileUpdated));
      }

      return;
    }

    emit(_Loaded(_vm = _vm.copyWith(visitedUser: user, edition: ProfileEditing.none)));
  }

  Future<void> callToUpdateProfile() async {
    setAutovalidateMode(AutovalidateMode.always);
    if (_vm.formKey?.currentState?.validate() == false) {
      return;
    }

    UserBodyUpdateDTO dto = const UserBodyUpdateDTO();

    emit(_Loading(_vm));

    final dtoMap = {
      ProfileEditing.nickName: dto.copyWith(
        userName: _vm.nickNameController?.controller?.text,
      ),
      ProfileEditing.userName: dto.copyWith(
        firstName: _vm.firstNameController?.controller?.text,
        lastName: _vm.lastNameController?.controller?.text,
      ),
      ProfileEditing.password: dto.copyWith(
        password: _vm.passwordController?.controller?.text,
        newPassword: _vm.newPasswordController?.controller?.text,
      ),
      ProfileEditing.location: dto.copyWith(
        city: _vm.cityController?.text,
        zipCode: _vm.zipCodeController?.text,
        country: _vm.country,
        address: _vm.addressController?.text,
        latitude: _vm.userLocation?.lat,
        longitude: _vm.userLocation?.lng,
      ),
      ProfileEditing.dateOfBirth: dto.copyWith(
        dateOfBirth: _vm.dateOfBirth,
      ),
      ProfileEditing.gender: dto.copyWith(
        gender: _vm.gender?.key,
      ),
      ProfileEditing.contact: dto.copyWith(
        email: _vm.emailController?.controller?.text,
        phone: _vm.phoneNumberController?.controller?.text,
      ),
    };

    dto = dtoMap[_vm.edition] ?? dto;
    log('DTO: $dto');

    await (_vm.edition.isEditingPassword ? _meRepo.updatePassword(dto) : _meRepo.updateProfile(dto)).then((result) {
      result.when(
        success: (userSessionDM) {
          log('USER: ${(userSessionDM as UserSessionDM).user}');
          if (_vm.edition.isEditingPassword) {
            emit(_UserUpdated(_vm = _vm.copyWith(edition: ProfileEditing.none), S.current.userPasswordUpdated));
          } else {
            _updateCurrentUser((userSessionDM as UserSessionDM).user);
          }
        },
        failure: (e) => emit(_Error(e.errorMsg, _vm)),
      );
    });

    setAutovalidateMode(AutovalidateMode.disabled);
  }

  void setUserGender(UserGender? gender) => gender != null ? emit(_Loaded(_vm = _vm.copyWith(gender: gender))) : null;

  void setUserCountry(FoodlyCountries? country) =>
      country != null ? emit(_Loaded(_vm = _vm.copyWith(country: country))) : null;

  void setAutovalidateMode(AutovalidateMode newMode) => emit(_Loaded(_vm = _vm.copyWith(autovalidateMode: newMode)));

  void updateProfilePhoto(String path) async {
    emit(_UpdatingProfilePicture(_vm));
    await _meRepo.updateProfilePhoto(filePath: path).then(
          (response) async => response.when(
            success: (_) async {
              await _meRepo.fetchLoggedUser().then(
                    (result) => result.when(
                      success: (userDM) {
                        final newUserSessionDM = di<AuthSessionService>().userSessionDM?.copyWith(user: userDM);
                        di<AuthSessionService>().setSession(newUserSessionDM);

                        _vm = _vm.copyWith(userSessionDM: newUserSessionDM ?? _vm.userSessionDM);

                        emit(_Loaded(_vm));
                      },
                      failure: (e) => emit(_Error(e.errorMsg, _vm)),
                    ),
                  );
            },
            failure: (e) => emit(_Error(e.errorMsg, _vm)),
          ),
        );
  }

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

    emit(_Loaded(_vm));
  }

  void cancelEditLocation() {
    _vm.cityController?.controller?.clear();
    _vm.zipCodeController?.controller?.clear();
    _vm = _vm.copyWith(userLocation: null);
  }
}
