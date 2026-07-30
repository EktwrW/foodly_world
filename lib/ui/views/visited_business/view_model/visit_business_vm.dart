import 'package:flutter/material.dart' show TextEditingController;
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker, GoogleMapController;

export 'package:foodly_world/data_models/business/business_dm.dart';

part 'visit_business_vm.freezed.dart';

@freezed
abstract class VisitBusinessVM with _$VisitBusinessVM {
  const VisitBusinessVM._();

  const factory VisitBusinessVM({
    BusinessDM? currentBusiness,
    @Default([]) List<ReviewDM>? currentBusinessReviews,
    @Default({}) Set<Marker> markers,
    GoogleMapController? mapController,
    TextEditingController? reviewTextController,
    int? currentReviewStars,
    DateTime? dateOfVisitForReview,
    @Default([]) List<String> reviewPhotoPaths,
    ReviewDM? editingReview,
    ReviewsMetaDM? reviewsMeta,
    @Default(false) bool isLoadingMoreReviews,
    DateTime? reservationDateTime,
    String? reservationTime,
    int? reservationSize,
    TextEditingController? specialRequestsController,
    @Default(false) bool isSubmittingReservation,
  }) = _VisitBusinessVM;

  bool get canLoadMoreReviews => reviewsMeta != null && reviewsMeta!.currentPage < reviewsMeta!.lastPage;

  bool get canSubmitReservation =>
      reservationDateTime != null && reservationTime != null && reservationSize != null && reservationSize! > 0 && !isSubmittingReservation;

  bool get canSubmitReview {
    final hasBasicFields = currentReviewStars != null && currentReviewStars! > 0 && dateOfVisitForReview != null;
    if (!hasBasicFields) return false;
    if (!isEditMode) return true;
    // In edit mode, only enable if something actually changed (excluding photo deletions)
    final originalDate = editingReview!.businessVisitedAt;
    final isSameDate = dateOfVisitForReview?.year == originalDate?.year &&
        dateOfVisitForReview?.month == originalDate?.month &&
        dateOfVisitForReview?.day == originalDate?.day;

    return currentReviewStars != editingReview!.rating || !isSameDate || reviewPhotoPaths.isNotEmpty;
  }

  bool get isEditMode => editingReview != null;
}
