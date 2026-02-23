import 'package:foodly_world/core/enums/review_enums.dart';
import 'package:foodly_world/core/network/reviews/review_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_update_dto.dart';
import 'package:foodly_world/ui/views/visited_business/view_model/visit_business_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'visited_business_cubit.freezed.dart';
part 'visited_business_state.dart';

class VisitBusinessCubit extends Cubit<VisitBusinessState> {
  final BusinessRepo _businessRepo;
  final ReviewRepo _reviewRepo;
  final Logger _logger;
  VisitBusinessVM _vm;

  VisitBusinessCubit(
    BusinessRepo businessRepo,
    Logger logger,
    String businessUuid,
    BusinessDM? business,
    ReviewRepo reviewRepo,
  )   : _businessRepo = businessRepo,
        _reviewRepo = reviewRepo,
        _logger = logger,
        _vm = const VisitBusinessVM(),
        super(const _Initial(VisitBusinessVM())) {
    _initializeVisitBusiness(businessUuid, business);
  }

  void _initializeVisitBusiness(String businessUuid, BusinessDM? business) {
    Future.microtask(() => emit(_Loading(_vm)));
    _fetchBusinessReviews(businessUuid);
    _fetchBusinessById(businessUuid);
  }

  void setMapcontroller(GoogleMapController controller) {
    if (_vm.currentBusiness?.latitude != null && _vm.currentBusiness?.longitude != null) {
      final marker = Marker(
        markerId: MarkerId('${_vm.currentBusiness?.name} location'),
        position: LatLng(
          _vm.currentBusiness!.latitude!,
          _vm.currentBusiness!.longitude!,
        ),
        infoWindow: InfoWindow(title: '${_vm.currentBusiness?.name ?? ''} ${_vm.currentBusiness?.fullAddress ?? ''}'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      );
      _vm = _vm.copyWith(markers: {marker});
    }

    _vm = _vm.copyWith(mapController: controller);
    Future.microtask(() => emit(_Loaded(_vm)));
  }

  Future<void> _fetchBusinessById(String businessUuid) async {
    if (businessUuid.isEmpty) {
      emit(_Error('Business ID is empty', _vm));
      return;
    }

    await _businessRepo.fetchBusinessById(businessUuid).then(
          (response) => response.when(
            success: (business) {
              _vm = _vm.copyWith(currentBusiness: business);
              emit(_Loaded(_vm));
            },
            failure: (error) {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }

  /// Get business reviews (if needed as a separate operation)
  void _fetchBusinessReviews(String businessUuid) {
    _reviewRepo.getBusinessReviews(businessUuid).then(
          (response) => response.when(
            success: (reviewsResponse) {
              _vm = _vm.copyWith(currentBusinessReviews: reviewsResponse.reviews);
              Future.microtask(() => emit(_Loaded(_vm)));
            },
            failure: (error) {
              _logger.e(error);
              Future.microtask(() => emit(_Error(error.toString(), _vm)));
            },
          ),
        );
  }

  void initializeInputForReview() {
    _vm = _vm.copyWith(
      reviewTextController: TextEditingController(),
      reviewPhotoPaths: [],
    );

    Future.microtask(() => emit(_Loaded(_vm)));
  }

  void resetReviewInput() {
    _vm.reviewTextController?.clear();
    _vm = _vm.copyWith(
      reviewPhotoPaths: [],
      currentReviewStars: null,
      dateOfVisitForReview: null,
      editingReview: null,
    );
    Future.microtask(() => emit(_Loaded(_vm)));
  }

  void addReviewPhoto(String path) {
    if (_vm.reviewPhotoPaths.length >= 3) return;

    _vm = _vm.copyWith(reviewPhotoPaths: [..._vm.reviewPhotoPaths, path]);
    emit(_Loaded(_vm));
  }

  void removeReviewPhoto(int index) {
    if (index < 0 || index >= _vm.reviewPhotoPaths.length) return;

    final updated = List<String>.from(_vm.reviewPhotoPaths)..removeAt(index);
    _vm = _vm.copyWith(reviewPhotoPaths: updated);
    emit(_Loaded(_vm));
  }

  void setReviewStars(int stars) {
    _vm = _vm.copyWith(currentReviewStars: stars);
    emit(_Loaded(_vm));
  }

  void setDateOfVisitForReview(DateTime date) {
    _vm = _vm.copyWith(dateOfVisitForReview: date);
    emit(_Loaded(_vm));
  }

  Future<void> createReview() async {
    if (_vm.currentBusiness == null) {
      emit(_Error('No business selected', _vm));
      return;
    }

    await Future.microtask(() => emit(_Loading(_vm)));

    await _reviewRepo
        .createReview(
          businessUuid: _vm.currentBusiness!.uuid,
          rating: _vm.currentReviewStars!,
          reviewType: ReviewType.business,
          comment: _vm.reviewTextController?.text,
          businessVisitedAt: _vm.dateOfVisitForReview,
          photoPaths: _vm.reviewPhotoPaths.isNotEmpty ? _vm.reviewPhotoPaths : null,
        )
        .then(
          (response) => response.when(
            success: (data) async {
              _vm = _vm.copyWith(
                currentBusinessReviews: List.from(_vm.currentBusinessReviews ?? [])..insert(0, data.review!),
              );

              await _businessRepo.fetchBusinessById(_vm.currentBusiness!.uuid).then(
                    (response) => response.when(
                      success: (business) {
                        _vm = _vm.copyWith(currentBusiness: business);
                        emit(_Loaded(_vm));
                      },
                      failure: (error) {
                        _logger.e(error);
                        emit(_Error(error.toString(), _vm));
                      },
                    ),
                  );
            },
            failure: (error) {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }

  Future<ReviewCheckResponseDM?> checkReview() async {
    if (_vm.currentBusiness == null) return null;

    final result = await _reviewRepo.checkReview(_vm.currentBusiness!.uuid);

    return result.when(
      success: (data) => data,
      failure: (error) {
        _logger.e(error);
        return null;
      },
    );
  }

  void initializeInputForEditReview(ReviewDM review) {
    final controller = TextEditingController(text: review.comment ?? '');
    _vm = _vm.copyWith(
      reviewTextController: controller,
      reviewPhotoPaths: [],
      currentReviewStars: review.rating,
      dateOfVisitForReview: review.businessVisitedAt,
      editingReview: review,
    );

    Future.microtask(() => emit(_Loaded(_vm)));
  }

  Future<void> updateReview() async {
    final editingReview = _vm.editingReview;
    if (editingReview == null || editingReview.reviewUuid == null) {
      emit(_Error('No review to update', _vm));
      return;
    }

    await Future.microtask(() => emit(_Loading(_vm)));

    final dto = ReviewUpdateDTO(
      rating: _vm.currentReviewStars,
      reviewType: ReviewType.business,
      comment: _vm.reviewTextController?.text,
      businessVisitedAt: _vm.dateOfVisitForReview != null
          ? '${_vm.dateOfVisitForReview!.year}-${_vm.dateOfVisitForReview!.month.toString().padLeft(2, '0')}-${_vm.dateOfVisitForReview!.day.toString().padLeft(2, '0')}'
          : null,
    );

    await _reviewRepo.updateReview(editingReview.reviewUuid!, dto).then(
          (response) => response.when(
            success: (data) async {
              var latestReview = data.review;

              // Upload new photos if any were added
              if (_vm.reviewPhotoPaths.isNotEmpty) {
                final photosResult = await _reviewRepo.addPhotos(
                  reviewUuid: editingReview.reviewUuid!,
                  photoPaths: _vm.reviewPhotoPaths,
                );
                photosResult.when(
                  success: (photosData) {
                    if (photosData.review != null) {
                      latestReview = photosData.review;
                    }
                  },
                  failure: (error) => _logger.e(error),
                );
              }

              if (latestReview != null) {
                final updatedList = (_vm.currentBusinessReviews ?? [])
                    .map((r) => r.reviewUuid == editingReview.reviewUuid ? latestReview! : r)
                    .toList();
                _vm = _vm.copyWith(currentBusinessReviews: updatedList);
              }
              resetReviewInput();

              if (_vm.currentBusiness != null) {
                await _businessRepo.fetchBusinessById(_vm.currentBusiness!.uuid).then(
                      (response) => response.when(
                        success: (business) {
                          _vm = _vm.copyWith(currentBusiness: business);
                          emit(_Loaded(_vm));
                        },
                        failure: (error) {
                          _logger.e(error);
                          emit(_Error(error.toString(), _vm));
                        },
                      ),
                    );
              }
            },
            failure: (error) {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }

  Future<void> deleteReview(String reviewUuid) async {
    await Future.microtask(() => emit(_Loading(_vm)));

    await _reviewRepo.deleteReview(reviewUuid).then(
          (response) => response.when(
            success: (_) async {
              final updatedList = (_vm.currentBusinessReviews ?? []).where((r) => r.reviewUuid != reviewUuid).toList();
              _vm = _vm.copyWith(currentBusinessReviews: updatedList);

              if (_vm.currentBusiness != null) {
                await _businessRepo.fetchBusinessById(_vm.currentBusiness!.uuid).then(
                      (response) => response.when(
                        success: (business) {
                          _vm = _vm.copyWith(currentBusiness: business);
                          emit(_Loaded(_vm));
                        },
                        failure: (error) {
                          _logger.e(error);
                          emit(_Error(error.toString(), _vm));
                        },
                      ),
                    );
              }
            },
            failure: (error) {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }

  Future<void> deleteReviewPhoto(String reviewPhotoUuid) async {
    final editingReview = _vm.editingReview;
    if (editingReview == null || editingReview.reviewUuid == null) {
      emit(_Error('No review to update', _vm));
      return;
    }

    await Future.microtask(() => emit(_Loading(_vm)));

    await _reviewRepo.destroyPhoto(reviewPhotoUuid).then(
          (response) => response.when(
            success: (_) async {
              final updatedPhotos =
                  (_vm.editingReview?.photos ?? []).where((p) => p.photoUuid != reviewPhotoUuid).toList();
              final updatedReview = _vm.editingReview?.copyWith(photos: updatedPhotos);
              final updatedList = (_vm.currentBusinessReviews ?? [])
                  .map((r) => r.reviewUuid == editingReview.reviewUuid ? updatedReview! : r)
                  .toList();
              _vm = _vm.copyWith(
                currentBusinessReviews: updatedList,
                editingReview: updatedReview,
              );
              emit(_Loaded(_vm));
            },
            failure: (error) {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }
}
