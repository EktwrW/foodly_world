import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

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
          businessAddressCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessNameCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessAboutUsCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessEmailCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessPhoneCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessCountryCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessCityCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessZipCodeCtrl: DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
          businessAdditionalInfoCtrl:
              DasboardSectionController(controller: TextEditingController(), focusNode: FocusNode()),
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
              dashboardEditing: value.editing,
              currentBusinessServices: _authService.userSessionDM?.user.business.first.businessServices ?? [],
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

          /// Event to call server for updating the business object
          updateBusiness: (_UpdateBusiness value) async => await _callToUpdateBusiness(emit),
        );
      },
    );

    add(const DashboardEvent.started());
  }

  bool get noCurrentBusiness => _vm.currentBusiness == null;
  bool get contactUsIsEmpty =>
      (_vm.currentBusiness?.email?.isEmpty ?? true) && (_vm.currentBusiness?.phoneNumber?.isEmpty ?? true);

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
        picturesPath: List.from(_vm.picturesPath)..removeWhere((p) => p.imageId == coverImageDM.imageId),
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
    var dto = const BusinessUpdateDTO();

    if (_vm.currentBusiness?.id == null) {
      return;
    }

    switch (_vm.dashboardEditing) {
      case DashboardEditing.category:
        dto = dto.copyWith(category: _vm.newCategory);

      case DashboardEditing.address:
        dto = dto.copyWith();
      case DashboardEditing.aboutUs:
        dto = dto.copyWith(businessAboutUs: _vm.businessAboutUsCtrl?.controller?.text);

      case DashboardEditing.contactUs:
        if (_vm.businessEmailCtrl?.controller?.text.isNotEmpty ?? false) {
          dto = dto.copyWith(businessEmail: _vm.businessEmailCtrl?.controller?.text);
        }

        if (_vm.businessPhoneCtrl?.controller?.text.isNotEmpty ?? false) {
          dto = dto.copyWith(businessPhone: _vm.businessPhoneCtrl?.controller?.text);
        }

      case DashboardEditing.openingHours:
        dto = dto.copyWith();

      case DashboardEditing.services:
        dto = dto.copyWith(businessServices: _vm.currentBusinessServices);

      case DashboardEditing.additionalInfo:
        dto = dto.copyWith(businessAdditionalInfo: _vm.businessAdditionalInfoCtrl?.controller?.text);

      case DashboardEditing.name:
        dto = dto.copyWith(businessName: _vm.businessNameCtrl?.controller?.text);

      default:
        break;
    }

    emit(_Loading(_vm));
    await _businessRepo.updateBusiness(_vm.currentBusiness!.id!, dto).then(
          (result) => result.when(
            success: (updatedBusiness) {
              _updateBusinessInCurrentArray(updatedBusiness);
              emit(_Loaded(_vm = _vm.copyWith(dashboardEditing: DashboardEditing.none)));
            },
            failure: (error) => _handleError(error, emit),
          ),
        );
  }

  /// Common methods
  void _handleError(AppRequestException error, Emitter emit) {
    di<Logger>().e(error);
    emit(_Error('$error', _vm));
  }

  void _updateBusinessInCurrentArray(BusinessDM updatedBusiness) {
    final length = _vm.myBusinessesses.length;
    final businesses = List.generate(
        length, (i) => _vm.myBusinessesses[i].id == updatedBusiness.id ? updatedBusiness : _vm.myBusinessesses[i]);

    _vm = _vm.copyWith(myBusinessesses: businesses, currentBusiness: updatedBusiness);
    _authService.setBusinesses(businesses);
  }
}
