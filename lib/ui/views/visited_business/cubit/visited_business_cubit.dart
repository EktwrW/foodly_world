import 'dart:async' show Completer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly_world/core/enums/review_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/network/reviews/review_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/core/services/foodly_image_cache.dart';
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
  final ReservationRepo _reservationRepo;
  final Logger _logger;
  final EventTrackingService _tracker;
  VisitBusinessVM _vm;

  VisitBusinessCubit(
    BusinessRepo businessRepo,
    Logger logger,
    String businessUuid,
    BusinessDM? business,
    ReviewRepo reviewRepo,
    ReservationRepo reservationRepo,
    EventTrackingService tracker,
  )   : _businessRepo = businessRepo,
        _reviewRepo = reviewRepo,
        _reservationRepo = reservationRepo,
        _logger = logger,
        _tracker = tracker,
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
            success: (business) async {
              _vm = _vm.copyWith(currentBusiness: business);
              _tracker.track(
                'business.open',
                'business_detail_page',
                page: 'business_detail',
                targetUuid: business.uuid,
                targetType: 'business',
                data: {'business_name': business.name},
              );
              await _precacheBusiness(business);
              emit(_Loaded(_vm));
            },
            failure: (error) async {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }

  static const int _reviewsPerPage = 10;

  /// Get business reviews (first page)
  void _fetchBusinessReviews(String businessUuid) {
    _reviewRepo.getBusinessReviews(businessUuid, perPage: _reviewsPerPage).then(
          (response) => response.when(
            success: (reviewsResponse) async {
              _vm = _vm.copyWith(
                currentBusinessReviews: reviewsResponse.reviews,
                reviewsMeta: reviewsResponse.meta,
              );
              await _precacheReviews(reviewsResponse.reviews);
              Future.microtask(() => emit(_Loaded(_vm)));
            },
            failure: (error) async {
              _logger.e(error);
              Future.microtask(() => emit(_Error(error.toString(), _vm)));
            },
          ),
        );
  }

  /// Fetch next page of reviews and append to existing list
  Future<void> fetchMoreReviews() async {
    if (!_vm.canLoadMoreReviews || _vm.isLoadingMoreReviews || _vm.currentBusiness == null) return;

    _vm = _vm.copyWith(isLoadingMoreReviews: true);
    emit(_Loaded(_vm));

    final nextPage = (_vm.reviewsMeta?.currentPage ?? 1) + 1;

    await _reviewRepo.getBusinessReviews(_vm.currentBusiness!.uuid, page: nextPage, perPage: _reviewsPerPage).then(
          (response) => response.when(
            success: (reviewsResponse) {
              _vm = _vm.copyWith(
                currentBusinessReviews: [...(_vm.currentBusinessReviews ?? []), ...reviewsResponse.reviews],
                reviewsMeta: reviewsResponse.meta,
                isLoadingMoreReviews: false,
              );
              emit(_Loaded(_vm));
              _precacheReviews(reviewsResponse.reviews);
            },
            failure: (error) {
              _logger.e(error);
              _vm = _vm.copyWith(isLoadingMoreReviews: false);
              emit(_Loaded(_vm));
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

  // ── Reservation methods ──────────────────────────────────────────────

  /// El snackbar de reserva resetea el form al CERRARSE (vía `.closed`). Pero
  /// durante el submit lo cerramos a propósito (para que el diálogo de contacto
  /// quede al frente), y NO queremos perder fecha/hora/tamaño. Este flag
  /// transitorio le dice al callback `.closed` que omita ESE reset una vez.
  /// Va fuera del VM para no afectar `canSubmitReservation`.
  bool _suppressReservationResetOnClose = false;

  void suppressReservationResetOnClose() => _suppressReservationResetOnClose = true;

  /// Devuelve true (y consume el flag) si el próximo cierre del snackbar NO
  /// debe resetear el form.
  bool consumeReservationResetSuppression() {
    final suppressed = _suppressReservationResetOnClose;
    _suppressReservationResetOnClose = false;
    return suppressed;
  }

  void initializeReservationInput() {
    _vm = _vm.copyWith(
      specialRequestsController: TextEditingController(),
      reservationDateTime: null,
      reservationTime: null,
      reservationSize: null,
      isSubmittingReservation: false,
    );
    _tracker.track(
      'reservation.started',
      'reservation_flow',
      page: 'reservation_form',
      targetUuid: _vm.currentBusiness?.uuid,
      targetType: 'business',
      data: {'source_page': 'business_detail'},
    );
    Future.microtask(() => emit(_Loaded(_vm)));
  }

  void setReservationDate(DateTime date) {
    _vm = _vm.copyWith(reservationDateTime: date);
    emit(_Loaded(_vm));
  }

  void setReservationTime(String time) {
    _vm = _vm.copyWith(reservationTime: time);
    emit(_Loaded(_vm));
  }

  void setReservationSize(int size) {
    _vm = _vm.copyWith(reservationSize: size);
    emit(_Loaded(_vm));
  }

  void resetReservationInput() {
    _vm.specialRequestsController?.clear();
    _vm = _vm.copyWith(
      reservationDateTime: null,
      reservationTime: null,
      reservationSize: null,
      isSubmittingReservation: false,
    );
    Future.microtask(() => emit(_Loaded(_vm)));
  }

  Future<void> _precacheBusiness(BusinessDM business) {
    final futures = <Future<void>>[];
    final f = _precacheUrlFuture(business.logo);
    if (f != null) futures.add(f);
    for (final img in business.coverImages) {
      final f2 = _precacheUrlFuture(img.url);
      if (f2 != null) futures.add(f2);
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void> _precacheReviews(List<ReviewDM> reviews) {
    final futures = <Future<void>>[];
    for (final r in reviews) {
      final f1 = _precacheUrlFuture(r.userPhoto);
      final f2 = _precacheUrlFuture(r.businessPhoto);
      if (f1 != null) futures.add(f1);
      if (f2 != null) futures.add(f2);
      for (final url in r.photoUrls) {
        final f3 = _precacheUrlFuture(url);
        if (f3 != null) futures.add(f3);
      }
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url, cacheManager: FoodlyImageCache.manager).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
      onError: (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
    ));
    return completer.future;
  }

  Future<bool> createReservation({String? contactPhone, String? contactEmail}) async {
    final business = _vm.currentBusiness;
    if (business == null || !_vm.canSubmitReservation) return false;

    _vm = _vm.copyWith(isSubmittingReservation: true);
    emit(_Loaded(_vm));

    final date =
        '${_vm.reservationDateTime!.year}-${_vm.reservationDateTime!.month.toString().padLeft(2, '0')}-${_vm.reservationDateTime!.day.toString().padLeft(2, '0')}';

    _tracker.track(
      'reservation.submitted',
      'reservation_flow',
      page: 'reservation_form',
      targetUuid: business.uuid,
      targetType: 'business',
      data: {
        'party_size': _vm.reservationSize,
        'reservation_date': date,
        'reservation_time': _vm.reservationTime,
      },
    );

    final result = await _reservationRepo.createReservation(
      businessUuid: business.uuid,
      reservationDate: date,
      reservationTime: _vm.reservationTime!,
      partySize: _vm.reservationSize!,
      specialRequests: _vm.specialRequestsController?.text,
      contactPhone: contactPhone,
      contactEmail: contactEmail,
    );

    return result.when(
      success: (response) {
        _tracker.track(
          'reservation.succeeded',
          'reservation_flow',
          page: 'reservation_success',
          targetUuid: business.uuid,
          targetType: 'business',
          data: {
            'reservation_uuid': response.reservation?.reservationUuid,
            'party_size': _vm.reservationSize,
          },
        );
        _vm = _vm.copyWith(isSubmittingReservation: false);
        resetReservationInput();
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _tracker.track(
          'reservation.failed',
          'reservation_flow',
          page: 'reservation_form',
          targetUuid: business.uuid,
          targetType: 'business',
          data: {
            'error_code': error.toString(),
            'error_stage': 'backend',
          },
        );
        _vm = _vm.copyWith(isSubmittingReservation: false);
        emit(_Error(error.toString(), _vm));
        return false;
      },
    );
  }
}
