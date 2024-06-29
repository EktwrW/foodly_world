import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:foodly_world/ui/views/dashboard/helpers/dashboard_helpers.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

export 'package:foodly_world/data_models/business/business_dm.dart';
export 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  static final _authService = di<AuthSessionService>();
  static final _businessRepo = di<BusinessRepo>();
  DashboardVM _vm;

  DashboardBloc()
      : _vm = DashboardVM(
          nameFormKey: GlobalKey<FormState>(),
          locationFormKey: GlobalKey<FormState>(),
          categoryFormKey: GlobalKey<FormState>(),
          aboutUsFormKey: GlobalKey<FormState>(),
          openingHoursFormKey: GlobalKey<FormState>(),
          servicesFormKey: GlobalKey<FormState>(),
          contactUsFormKey: GlobalKey<FormState>(),
          addInfoFormKey: GlobalKey<FormState>(),
          businessAddressCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessNameCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessAboutUsCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessEmailCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessPhoneCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessCityCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessZipCodeCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          businessAdditionalInfoCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
        ),
        super(const _Initial(DashboardVM())) {
    on<DashboardEvent>(
      (events, emit) async {
        await events.map(
          started: (_Started value) async {
            _vm = _vm.copyWith(myBusinessesses: _authService.userSessionDM?.user.business ?? []);
            await _initializeAllBusinesses(emit);
          },
          updateLogo: (_UpdateLogo value) async {
            await _updateLogo(emit, value.path);
          },
          editCoverImagesDialog: (_EditCoverImagesDialog value) {
            _vm = _vm.copyWith(picturesPath: _authService.userSessionDM?.user.business.first.coverImages ?? []);
            emit(_ShowCoverImagesDialog(_vm));
          },
          deleteCoverImageById: (_DeleteCoverImageById value) async {
            if (_vm.targetForDelete != null) {
              await _deleteCoverImage(emit, value.coverImageDM);
              return;
            }

            _vm = _vm.copyWith(targetForDelete: value.coverImageDM);
            emit(_Loaded(_vm));
          },
          cancelDeleteCoverImage: (_CancelDeleteCoverImage value) async {
            _vm = _vm.copyWith(targetForDelete: null);
            emit(_Loaded(_vm));
          },
          addPicture: (_AddPicture value) async {
            _vm = _vm.copyWith(picturesPath: List.from(_vm.picturesPath)..add(BusinessCoverImageDM(url: value.path)));
            emit(_Loaded(_vm));
          },
          uploadPictures: (_UploadPictures value) async {
            await _uploadPictures(emit);
          },
          cancelUploadPictures: (_CancelUploadPictures value) async {
            _vm = _vm.copyWith(picturesPath: [], targetForDelete: null);
            emit(_Loaded(_vm));
          },
          updatePicture: (_UpdatePicture value) async {
            await _updateCoverImageById(value.imageId, value.filePath, emit);
          },
          updateEditing: (_UpdateEditing value) {
            _vm = _vm.copyWith(
              autovalidateMode: AutovalidateMode.disabled,
              dashboardEditing: value.editing,
              newCategory: _vm.currentBusiness?.category,
              currentBusinessServices: _authService.userSessionDM?.user.business.first.businessServices ?? [],
              businessDays: _vm.currentBusiness?.businessDays ?? const BusinessDays(),
            );
            emit(_Loaded(_vm));
          },
          setCategory: (_SetCategory value) {
            _vm = _vm.copyWith(newCategory: value.category);
            emit(_Loaded(_vm));
          },
          setService: (_SetService value) {
            if (_vm.currentBusinessServices.contains(value.service)) {
              _vm = _vm.copyWith(
                  currentBusinessServices: List<BusinessServices>.from(_vm.currentBusinessServices)
                    ..remove(value.service));
              emit(_Loaded(_vm));
              return;
            }
            _vm = _vm.copyWith(
                currentBusinessServices: List<BusinessServices>.from(_vm.currentBusinessServices)..add(value.service));
            emit(_Loaded(_vm));
          },
          editLocationDialog: (_EditLocationDialog value) {
            restartAddressControllers();
            _initializeMarkers();
            _vm = _vm.copyWith(dashboardEditing: DashboardEditing.address);
            emit(_EditLocation(_vm));
          },
          setMapController: (_SetMapController value) {
            _vm = _vm.copyWith(mapController: value.controller);
            emit(_Loaded(_vm));
          },
          setCountry: (_SetCountry value) {
            _vm = _vm.copyWith(businessCountry: value.country);
            emit(_Loaded(_vm));
          },
          setAddressFromPlacesAPI: (_SetAddressFromPlacesAPI value) {
            _updateBusinessFromPlacesAPI(value.detail);
            emit(_Loaded(_vm));
          },
          setOpeningHoursDay: (_SetOpeningHoursDay value) {
            _setOpeningHours(value, emit);
          },

          /// Event to call server for updating the business object
          updateBusiness: (_UpdateBusiness value) async => await _callToUpdateBusiness(emit),
        );
      },
    );

    add(const DashboardEvent.started());
  }

  // Getters
  bool get noCurrentBusiness => _vm.currentBusiness == null;
  bool get contactUsIsEmpty =>
      (_vm.currentBusiness?.email?.isEmpty ?? true) && (_vm.currentBusiness?.phoneNumber?.isEmpty ?? true);

  // Form keys validations
  bool get notValidName => !(_vm.nameFormKey?.currentState?.validate() ?? false);
  bool get notValidLocation => !(_vm.locationFormKey?.currentState?.validate() ?? false);
  bool get notValidCategory => !(_vm.categoryFormKey?.currentState?.validate() ?? false);
  bool get notValidAboutUs => !(_vm.aboutUsFormKey?.currentState?.validate() ?? false);
  bool get notValidOpeningHours => !(_vm.openingHoursFormKey?.currentState?.validate() ?? false);
  bool get notValidServices => !(_vm.servicesFormKey?.currentState?.validate() ?? false);
  bool get notValidContactUs => !(_vm.contactUsFormKey?.currentState?.validate() ?? false);
  bool get notValidAdditionalInfo => !(_vm.addInfoFormKey?.currentState?.validate() ?? false);

  Map<DashboardEditing, bool> get cantEditBusiness => {
        DashboardEditing.name: notValidName || _vm.currentBusiness?.id == null,
        DashboardEditing.address: notValidLocation || _vm.currentBusiness?.id == null,
        DashboardEditing.category: notValidCategory || _vm.currentBusiness?.id == null,
        DashboardEditing.aboutUs: notValidAboutUs || _vm.currentBusiness?.id == null,
        DashboardEditing.openingHours: notValidOpeningHours || _vm.currentBusiness?.id == null,
        DashboardEditing.services: notValidServices || _vm.currentBusiness?.id == null,
        DashboardEditing.contactUs: notValidContactUs || _vm.currentBusiness?.id == null,
        DashboardEditing.additionalInfo: notValidAdditionalInfo || _vm.currentBusiness?.id == null,
      };

  String get lang => _authService.lang;

  /// Fetch Businesses
  Future<void> _initializeAllBusinesses(Emitter emit) async {
    emit(_Loading(_vm));
    final businesses = <BusinessDM>[];

    for (final business in _vm.myBusinessesses) {
      if (business.id?.isNotEmpty ?? false) {
        await _businessRepo.fetchBusinessById(business.id!).then(
              (response) => response.when(
                success: (business) => businesses.add(business),
                failure: (error) => _handleError(error, emit),
              ),
            );
      }
    }

    _vm = _vm.copyWith(
      myBusinessesses: businesses,
      currentBusiness: businesses.first,
      currentBusinessServices: _authService.userSessionDM?.user.business.first.businessServices ?? [],
    );
    _authService.setBusinesses(businesses);

    emit(_Loaded(_vm));
  }

  /// handle opening hours edition
  void _setOpeningHours(_SetOpeningHoursDay value, Emitter<DashboardState> emit) {
    if (value.dayIndex >= 0 && value.dayIndex <= 6) {
      final Map<int, BusinessDays Function(BusinessDays, Day)> copyWithMap = {
        0: (BusinessDays days, Day day) => days.copyWith(day0: day),
        1: (BusinessDays days, Day day) => days.copyWith(day1: day),
        2: (BusinessDays days, Day day) => days.copyWith(day2: day),
        3: (BusinessDays days, Day day) => days.copyWith(day3: day),
        4: (BusinessDays days, Day day) => days.copyWith(day4: day),
        5: (BusinessDays days, Day day) => days.copyWith(day5: day),
        6: (BusinessDays days, Day day) => days.copyWith(day6: day),
      };

      final updatedBusinessDays = copyWithMap[value.dayIndex]!(_vm.businessDays, value.day);

      _vm = _vm.copyWith(businessDays: updatedBusinessDays);

      emit(_Loaded(_vm));
    }
  }

  /// Image methods & handling
  Future<void> _updateLogo(Emitter emit, String path) async {
    if (path.isNotEmpty) {
      emit(_UpdatingLogo(_vm));
      await _businessRepo
          .updateLogo(
            filePath: path,
            id: _vm.currentBusiness?.id ?? '',
          )
          .then(
            (response) => response.when(
              success: (businessDM) {
                if (businessDM.logo?.isNotEmpty ?? false) {
                  _updateBusinessInCurrentArray(businessDM);
                }

                emit(_Loaded(_vm));
              },
              failure: (error) => _handleError(error, emit),
            ),
          );
    }
  }

  Future<void> _uploadPictures(Emitter<DashboardState> emit) async {
    final paths = _vm.picturesPath.where((p) => p.imageId == null).toList();
    log('$paths');

    if (_vm.currentBusiness?.intId != null && paths.isNotEmpty) {
      emit(_UpdatingPictures(_vm));
      await _businessRepo
          .storeCoverImages(
            filePaths: paths.map((e) => e.url ?? '').toList(),
            businessId: _vm.currentBusiness!.intId!,
          )
          .then(
            (result) => result.when(
              success: (businessCoverImageArray) {
                final updatedBusiness = _vm.currentBusiness!.copyWith(
                  coverImages: List.from(_vm.currentBusiness!.coverImages)..addAll(businessCoverImageArray),
                );
                _updateBusinessInCurrentArray(updatedBusiness);
                emit(_PicturesUpdated(_vm));
              },
              failure: (error) => _handleError(error, emit),
            ),
          );
    } else {
      log('no images to store');
    }
  }

  Future<void> _deleteCoverImage(Emitter<DashboardState> emit, BusinessCoverImageDM coverImageDM) async {
    if (_vm.targetForDelete?.imageId?.isNotEmpty ?? false) {
      emit(_UpdatingPictures(_vm));
      await _businessRepo.deleteCoverImageById(coverImageDM.imageId ?? '').then((result) {
        return result.when(
          success: (value) async {
            final currentPics = List<BusinessCoverImageDM>.from(_vm.picturesPath)
              ..removeWhere((p) => p.imageId == _vm.targetForDelete?.imageId);
            final updatedBusiness = _vm.currentBusiness!.copyWith(
              coverImages: currentPics,
            );

            _updateBusinessInCurrentArray(updatedBusiness);
            emit(_PictureDeleted(_vm));
            await Future.delayed(const Duration(milliseconds: 2500));
            emit(_Loaded(_vm = _vm.copyWith(targetForDelete: null, picturesPath: currentPics)));
          },
          failure: (error) => _handleError(error, emit),
        );
      });
    } else {
      _vm = _vm.copyWith(
        picturesPath: List.from(_vm.picturesPath)..removeWhere((p) => p == coverImageDM),
        targetForDelete: null,
      );
      emit(_Loaded(_vm));
    }
  }

  Future<void> _updateCoverImageById(String imageId, String filePath, Emitter emit) async {
    emit(_UpdatingPictures(_vm));
    await _businessRepo.updateCoverImageById(imageId, filePath).then((result) {
      return result.when(
        success: (updatedImage) {
          final currentPics = List<BusinessCoverImageDM>.from(_vm.picturesPath)
            ..removeWhere((p) => p.imageId == imageId)
            ..add(updatedImage);
          final updatedBusiness = _vm.currentBusiness!.copyWith(
            coverImages: currentPics,
          );

          _updateBusinessInCurrentArray(updatedBusiness);
          emit(_Loaded(_vm = _vm.copyWith(picturesPath: currentPics)));
        },
        failure: (error) => _handleError(error, emit),
      );
    });
  }

  /// Logic and Call to update a business
  Future<void> _callToUpdateBusiness(Emitter emit) async {
    setAutovalidateMode(AutovalidateMode.always, emit);

    if (cantEditBusiness[_vm.dashboardEditing] ?? true) {
      return;
    }

    BusinessUpdateDTO? dto = const BusinessUpdateDTO();

    final dtoMap = {
      DashboardEditing.category: dto.copyWith(category: _vm.newCategory),
      DashboardEditing.address: DashboardHelpers.getAddressFields(dto, _vm),
      DashboardEditing.aboutUs: dto.copyWith(businessAboutUs: _vm.businessAboutUsCtrl?.text),
      DashboardEditing.contactUs: DashboardHelpers.getContactUsFields(dto, _vm),
      DashboardEditing.openingHours: dto.copyWith(businessDays: _vm.businessDays),
      DashboardEditing.services: dto.copyWith(businessServices: _vm.currentBusinessServices),
      DashboardEditing.additionalInfo: dto.copyWith(businessAdditionalInfo: _vm.businessAdditionalInfoCtrl?.text),
      DashboardEditing.name: dto.copyWith(businessName: _vm.businessNameCtrl?.text),
    };

    dto = dtoMap[_vm.dashboardEditing];

    if (dto != null) {
      emit(_Loading(_vm));
      await _businessRepo.updateBusiness(_vm.currentBusiness!.id!, dto).then(
            (result) => result.when(
              success: (updatedBusiness) {
                _updateBusinessInCurrentArray(updatedBusiness);

                if (_vm.dashboardEditing == DashboardEditing.address) {
                  emit(_LocationUpdated(_vm = _vm.copyWith(dashboardEditing: DashboardEditing.none)));
                } else {
                  emit(_Loaded(_vm = _vm.copyWith(dashboardEditing: DashboardEditing.none)));
                }
              },
              failure: (error) => _handleError(error, emit),
            ),
          );
    }
  }

  /// Dashboard common methods

  void _handleError(AppRequestException error, Emitter emit) {
    di<Logger>().e(error);
    emit(_Error('$error', _vm));
  }

  void setAutovalidateMode(AutovalidateMode newMode, Emitter emit) =>
      emit(_Loaded(_vm = _vm.copyWith(autovalidateMode: newMode)));

  void _updateBusinessInCurrentArray(BusinessDM updatedBusiness) {
    final length = _vm.myBusinessesses.length;
    final businesses = List.generate(
        length, (i) => _vm.myBusinessesses[i].id == updatedBusiness.id ? updatedBusiness : _vm.myBusinessesses[i]);

    _vm = _vm.copyWith(myBusinessesses: businesses, currentBusiness: updatedBusiness);
    _authService.setBusinesses(businesses);
  }

  void restartContactUsControllers() {
    _vm.businessEmailCtrl?.controller?.text = _vm.currentBusiness?.email ?? '';
    _vm.businessPhoneCtrl?.controller?.text = _vm.currentBusiness?.phoneNumber ?? '';
  }

  void restartAddressControllers() {
    _vm = _vm.copyWith(businessCountry: _vm.currentBusiness?.country);
    _vm.businessCityCtrl?.controller?.text = _vm.currentBusiness?.city ?? '';
    _vm.businessAddressCtrl?.controller?.text = _vm.currentBusiness?.address ?? '';
    _vm.businessZipCodeCtrl?.controller?.text = _vm.currentBusiness?.zipCode ?? '';
  }

  void _initializeMarkers() {
    final position = di<LocationService>().currentLocation.position;

    final marker = Marker(
      markerId: MarkerId('${_vm.currentBusiness?.name} location'),
      position: LatLng(
        _vm.currentBusiness?.latitude ?? position?.latitude ?? 0.0,
        _vm.currentBusiness?.longitude ?? position?.longitude ?? 0.0,
      ),
      infoWindow: InfoWindow(title: '${_vm.currentBusiness?.name ?? ''} ${_vm.currentBusiness?.fullAddress ?? ''}'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    );

    _vm = _vm.copyWith(markers: {marker});
  }

  void _updateBusinessFromPlacesAPI(Place detail) => _vm = DashboardHelpers.setAddressFromPlacesAPI(detail, _vm);
}

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