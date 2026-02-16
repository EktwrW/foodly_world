import 'package:foodly_world/core/network/reviews/review_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_create_dto.dart' show ReviewCreateDTO, ReviewType;
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

  void _initializeVisitBusiness(String businessUuid, BusinessDM? business) async {
    Future.microtask(() => emit(_Loading(_vm)));

    await _fetchBusinessById(businessUuid);
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
  Future<void> fetchBusinessReviews(String businessUuid) async {
    // Implement if needed - for now we'll assume reviews come with the business data
    // or would be implemented in a separate cubit
  }

  void initializeInputForReview() {
    _vm = _vm.copyWith(
      reviewTextController: TextEditingController(),
    );

    Future.microtask(() => emit(_Loaded(_vm)));
  }

  Future<void> createReview() async {
    if (_vm.currentBusiness == null) {
      emit(_Error('No business selected', _vm));
      return;
    }

    await Future.microtask(() => emit(_Loading(_vm)));

    final dto = ReviewCreateDTO(
      rating: _vm.currentReviewStars!,
      comment: _vm.reviewTextController?.text,
      businessVisitedAt: _vm.dateOfVisitForReview?.toIso8601String(),
      businessUuid: _vm.currentBusiness!.uuid,
      reviewType: ReviewType.business,
    );

    await _reviewRepo.createReview(dto).then(
          (response) => response.when(
            success: (_) {
              // Optionally, you could refresh the business data to get the new review
              _fetchBusinessById(_vm.currentBusiness!.uuid);
            },
            failure: (error) {
              _logger.e(error);
              emit(_Error(error.toString(), _vm));
            },
          ),
        );
  }
}
