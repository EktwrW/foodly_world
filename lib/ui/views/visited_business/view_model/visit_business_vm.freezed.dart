// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_business_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VisitBusinessVM {
  BusinessDM? get currentBusiness => throw _privateConstructorUsedError;
  List<ReviewDM>? get currentBusinessReviews =>
      throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  TextEditingController? get reviewTextController =>
      throw _privateConstructorUsedError;
  int? get currentReviewStars => throw _privateConstructorUsedError;
  DateTime? get dateOfVisitForReview => throw _privateConstructorUsedError;
  List<String> get reviewPhotoPaths => throw _privateConstructorUsedError;
  ReviewDM? get editingReview => throw _privateConstructorUsedError;
  ReviewsMetaDM? get reviewsMeta => throw _privateConstructorUsedError;
  bool get isLoadingMoreReviews => throw _privateConstructorUsedError;
  DateTime? get reservationDateTime => throw _privateConstructorUsedError;
  String? get reservationTime => throw _privateConstructorUsedError;
  int? get reservationSize => throw _privateConstructorUsedError;
  TextEditingController? get specialRequestsController =>
      throw _privateConstructorUsedError;
  bool get isSubmittingReservation => throw _privateConstructorUsedError;

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitBusinessVMCopyWith<VisitBusinessVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitBusinessVMCopyWith<$Res> {
  factory $VisitBusinessVMCopyWith(
          VisitBusinessVM value, $Res Function(VisitBusinessVM) then) =
      _$VisitBusinessVMCopyWithImpl<$Res, VisitBusinessVM>;
  @useResult
  $Res call(
      {BusinessDM? currentBusiness,
      List<ReviewDM>? currentBusinessReviews,
      Set<Marker> markers,
      GoogleMapController? mapController,
      TextEditingController? reviewTextController,
      int? currentReviewStars,
      DateTime? dateOfVisitForReview,
      List<String> reviewPhotoPaths,
      ReviewDM? editingReview,
      ReviewsMetaDM? reviewsMeta,
      bool isLoadingMoreReviews,
      DateTime? reservationDateTime,
      String? reservationTime,
      int? reservationSize,
      TextEditingController? specialRequestsController,
      bool isSubmittingReservation});

  $BusinessDMCopyWith<$Res>? get currentBusiness;
  $ReviewDMCopyWith<$Res>? get editingReview;
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta;
}

/// @nodoc
class _$VisitBusinessVMCopyWithImpl<$Res, $Val extends VisitBusinessVM>
    implements $VisitBusinessVMCopyWith<$Res> {
  _$VisitBusinessVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBusiness = freezed,
    Object? currentBusinessReviews = freezed,
    Object? markers = null,
    Object? mapController = freezed,
    Object? reviewTextController = freezed,
    Object? currentReviewStars = freezed,
    Object? dateOfVisitForReview = freezed,
    Object? reviewPhotoPaths = null,
    Object? editingReview = freezed,
    Object? reviewsMeta = freezed,
    Object? isLoadingMoreReviews = null,
    Object? reservationDateTime = freezed,
    Object? reservationTime = freezed,
    Object? reservationSize = freezed,
    Object? specialRequestsController = freezed,
    Object? isSubmittingReservation = null,
  }) {
    return _then(_value.copyWith(
      currentBusiness: freezed == currentBusiness
          ? _value.currentBusiness
          : currentBusiness // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      currentBusinessReviews: freezed == currentBusinessReviews
          ? _value.currentBusinessReviews
          : currentBusinessReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      reviewTextController: freezed == reviewTextController
          ? _value.reviewTextController
          : reviewTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      currentReviewStars: freezed == currentReviewStars
          ? _value.currentReviewStars
          : currentReviewStars // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfVisitForReview: freezed == dateOfVisitForReview
          ? _value.dateOfVisitForReview
          : dateOfVisitForReview // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewPhotoPaths: null == reviewPhotoPaths
          ? _value.reviewPhotoPaths
          : reviewPhotoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editingReview: freezed == editingReview
          ? _value.editingReview
          : editingReview // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
      reviewsMeta: freezed == reviewsMeta
          ? _value.reviewsMeta
          : reviewsMeta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
      isLoadingMoreReviews: null == isLoadingMoreReviews
          ? _value.isLoadingMoreReviews
          : isLoadingMoreReviews // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationDateTime: freezed == reservationDateTime
          ? _value.reservationDateTime
          : reservationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationSize: freezed == reservationSize
          ? _value.reservationSize
          : reservationSize // ignore: cast_nullable_to_non_nullable
              as int?,
      specialRequestsController: freezed == specialRequestsController
          ? _value.specialRequestsController
          : specialRequestsController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isSubmittingReservation: null == isSubmittingReservation
          ? _value.isSubmittingReservation
          : isSubmittingReservation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get currentBusiness {
    if (_value.currentBusiness == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_value.currentBusiness!, (value) {
      return _then(_value.copyWith(currentBusiness: value) as $Val);
    });
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get editingReview {
    if (_value.editingReview == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_value.editingReview!, (value) {
      return _then(_value.copyWith(editingReview: value) as $Val);
    });
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta {
    if (_value.reviewsMeta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_value.reviewsMeta!, (value) {
      return _then(_value.copyWith(reviewsMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VisitBusinessVMImplCopyWith<$Res>
    implements $VisitBusinessVMCopyWith<$Res> {
  factory _$$VisitBusinessVMImplCopyWith(_$VisitBusinessVMImpl value,
          $Res Function(_$VisitBusinessVMImpl) then) =
      __$$VisitBusinessVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BusinessDM? currentBusiness,
      List<ReviewDM>? currentBusinessReviews,
      Set<Marker> markers,
      GoogleMapController? mapController,
      TextEditingController? reviewTextController,
      int? currentReviewStars,
      DateTime? dateOfVisitForReview,
      List<String> reviewPhotoPaths,
      ReviewDM? editingReview,
      ReviewsMetaDM? reviewsMeta,
      bool isLoadingMoreReviews,
      DateTime? reservationDateTime,
      String? reservationTime,
      int? reservationSize,
      TextEditingController? specialRequestsController,
      bool isSubmittingReservation});

  @override
  $BusinessDMCopyWith<$Res>? get currentBusiness;
  @override
  $ReviewDMCopyWith<$Res>? get editingReview;
  @override
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta;
}

/// @nodoc
class __$$VisitBusinessVMImplCopyWithImpl<$Res>
    extends _$VisitBusinessVMCopyWithImpl<$Res, _$VisitBusinessVMImpl>
    implements _$$VisitBusinessVMImplCopyWith<$Res> {
  __$$VisitBusinessVMImplCopyWithImpl(
      _$VisitBusinessVMImpl _value, $Res Function(_$VisitBusinessVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBusiness = freezed,
    Object? currentBusinessReviews = freezed,
    Object? markers = null,
    Object? mapController = freezed,
    Object? reviewTextController = freezed,
    Object? currentReviewStars = freezed,
    Object? dateOfVisitForReview = freezed,
    Object? reviewPhotoPaths = null,
    Object? editingReview = freezed,
    Object? reviewsMeta = freezed,
    Object? isLoadingMoreReviews = null,
    Object? reservationDateTime = freezed,
    Object? reservationTime = freezed,
    Object? reservationSize = freezed,
    Object? specialRequestsController = freezed,
    Object? isSubmittingReservation = null,
  }) {
    return _then(_$VisitBusinessVMImpl(
      currentBusiness: freezed == currentBusiness
          ? _value.currentBusiness
          : currentBusiness // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      currentBusinessReviews: freezed == currentBusinessReviews
          ? _value._currentBusinessReviews
          : currentBusinessReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      reviewTextController: freezed == reviewTextController
          ? _value.reviewTextController
          : reviewTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      currentReviewStars: freezed == currentReviewStars
          ? _value.currentReviewStars
          : currentReviewStars // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfVisitForReview: freezed == dateOfVisitForReview
          ? _value.dateOfVisitForReview
          : dateOfVisitForReview // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewPhotoPaths: null == reviewPhotoPaths
          ? _value._reviewPhotoPaths
          : reviewPhotoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editingReview: freezed == editingReview
          ? _value.editingReview
          : editingReview // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
      reviewsMeta: freezed == reviewsMeta
          ? _value.reviewsMeta
          : reviewsMeta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
      isLoadingMoreReviews: null == isLoadingMoreReviews
          ? _value.isLoadingMoreReviews
          : isLoadingMoreReviews // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationDateTime: freezed == reservationDateTime
          ? _value.reservationDateTime
          : reservationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationSize: freezed == reservationSize
          ? _value.reservationSize
          : reservationSize // ignore: cast_nullable_to_non_nullable
              as int?,
      specialRequestsController: freezed == specialRequestsController
          ? _value.specialRequestsController
          : specialRequestsController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isSubmittingReservation: null == isSubmittingReservation
          ? _value.isSubmittingReservation
          : isSubmittingReservation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VisitBusinessVMImpl extends _VisitBusinessVM {
  const _$VisitBusinessVMImpl(
      {this.currentBusiness,
      final List<ReviewDM>? currentBusinessReviews = const [],
      final Set<Marker> markers = const {},
      this.mapController,
      this.reviewTextController,
      this.currentReviewStars,
      this.dateOfVisitForReview,
      final List<String> reviewPhotoPaths = const [],
      this.editingReview,
      this.reviewsMeta,
      this.isLoadingMoreReviews = false,
      this.reservationDateTime,
      this.reservationTime,
      this.reservationSize,
      this.specialRequestsController,
      this.isSubmittingReservation = false})
      : _currentBusinessReviews = currentBusinessReviews,
        _markers = markers,
        _reviewPhotoPaths = reviewPhotoPaths,
        super._();

  @override
  final BusinessDM? currentBusiness;
  final List<ReviewDM>? _currentBusinessReviews;
  @override
  @JsonKey()
  List<ReviewDM>? get currentBusinessReviews {
    final value = _currentBusinessReviews;
    if (value == null) return null;
    if (_currentBusinessReviews is EqualUnmodifiableListView)
      return _currentBusinessReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  final GoogleMapController? mapController;
  @override
  final TextEditingController? reviewTextController;
  @override
  final int? currentReviewStars;
  @override
  final DateTime? dateOfVisitForReview;
  final List<String> _reviewPhotoPaths;
  @override
  @JsonKey()
  List<String> get reviewPhotoPaths {
    if (_reviewPhotoPaths is EqualUnmodifiableListView)
      return _reviewPhotoPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewPhotoPaths);
  }

  @override
  final ReviewDM? editingReview;
  @override
  final ReviewsMetaDM? reviewsMeta;
  @override
  @JsonKey()
  final bool isLoadingMoreReviews;
  @override
  final DateTime? reservationDateTime;
  @override
  final String? reservationTime;
  @override
  final int? reservationSize;
  @override
  final TextEditingController? specialRequestsController;
  @override
  @JsonKey()
  final bool isSubmittingReservation;

  @override
  String toString() {
    return 'VisitBusinessVM(currentBusiness: $currentBusiness, currentBusinessReviews: $currentBusinessReviews, markers: $markers, mapController: $mapController, reviewTextController: $reviewTextController, currentReviewStars: $currentReviewStars, dateOfVisitForReview: $dateOfVisitForReview, reviewPhotoPaths: $reviewPhotoPaths, editingReview: $editingReview, reviewsMeta: $reviewsMeta, isLoadingMoreReviews: $isLoadingMoreReviews, reservationDateTime: $reservationDateTime, reservationTime: $reservationTime, reservationSize: $reservationSize, specialRequestsController: $specialRequestsController, isSubmittingReservation: $isSubmittingReservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitBusinessVMImpl &&
            (identical(other.currentBusiness, currentBusiness) ||
                other.currentBusiness == currentBusiness) &&
            const DeepCollectionEquality().equals(
                other._currentBusinessReviews, _currentBusinessReviews) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.reviewTextController, reviewTextController) ||
                other.reviewTextController == reviewTextController) &&
            (identical(other.currentReviewStars, currentReviewStars) ||
                other.currentReviewStars == currentReviewStars) &&
            (identical(other.dateOfVisitForReview, dateOfVisitForReview) ||
                other.dateOfVisitForReview == dateOfVisitForReview) &&
            const DeepCollectionEquality()
                .equals(other._reviewPhotoPaths, _reviewPhotoPaths) &&
            (identical(other.editingReview, editingReview) ||
                other.editingReview == editingReview) &&
            (identical(other.reviewsMeta, reviewsMeta) ||
                other.reviewsMeta == reviewsMeta) &&
            (identical(other.isLoadingMoreReviews, isLoadingMoreReviews) ||
                other.isLoadingMoreReviews == isLoadingMoreReviews) &&
            (identical(other.reservationDateTime, reservationDateTime) ||
                other.reservationDateTime == reservationDateTime) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.reservationSize, reservationSize) ||
                other.reservationSize == reservationSize) &&
            (identical(other.specialRequestsController,
                    specialRequestsController) ||
                other.specialRequestsController == specialRequestsController) &&
            (identical(
                    other.isSubmittingReservation, isSubmittingReservation) ||
                other.isSubmittingReservation == isSubmittingReservation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentBusiness,
      const DeepCollectionEquality().hash(_currentBusinessReviews),
      const DeepCollectionEquality().hash(_markers),
      mapController,
      reviewTextController,
      currentReviewStars,
      dateOfVisitForReview,
      const DeepCollectionEquality().hash(_reviewPhotoPaths),
      editingReview,
      reviewsMeta,
      isLoadingMoreReviews,
      reservationDateTime,
      reservationTime,
      reservationSize,
      specialRequestsController,
      isSubmittingReservation);

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitBusinessVMImplCopyWith<_$VisitBusinessVMImpl> get copyWith =>
      __$$VisitBusinessVMImplCopyWithImpl<_$VisitBusinessVMImpl>(
          this, _$identity);
}

abstract class _VisitBusinessVM extends VisitBusinessVM {
  const factory _VisitBusinessVM(
      {final BusinessDM? currentBusiness,
      final List<ReviewDM>? currentBusinessReviews,
      final Set<Marker> markers,
      final GoogleMapController? mapController,
      final TextEditingController? reviewTextController,
      final int? currentReviewStars,
      final DateTime? dateOfVisitForReview,
      final List<String> reviewPhotoPaths,
      final ReviewDM? editingReview,
      final ReviewsMetaDM? reviewsMeta,
      final bool isLoadingMoreReviews,
      final DateTime? reservationDateTime,
      final String? reservationTime,
      final int? reservationSize,
      final TextEditingController? specialRequestsController,
      final bool isSubmittingReservation}) = _$VisitBusinessVMImpl;
  const _VisitBusinessVM._() : super._();

  @override
  BusinessDM? get currentBusiness;
  @override
  List<ReviewDM>? get currentBusinessReviews;
  @override
  Set<Marker> get markers;
  @override
  GoogleMapController? get mapController;
  @override
  TextEditingController? get reviewTextController;
  @override
  int? get currentReviewStars;
  @override
  DateTime? get dateOfVisitForReview;
  @override
  List<String> get reviewPhotoPaths;
  @override
  ReviewDM? get editingReview;
  @override
  ReviewsMetaDM? get reviewsMeta;
  @override
  bool get isLoadingMoreReviews;
  @override
  DateTime? get reservationDateTime;
  @override
  String? get reservationTime;
  @override
  int? get reservationSize;
  @override
  TextEditingController? get specialRequestsController;
  @override
  bool get isSubmittingReservation;

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitBusinessVMImplCopyWith<_$VisitBusinessVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
