// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_business_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitBusinessVM {
  BusinessDM? get currentBusiness;
  List<ReviewDM>? get currentBusinessReviews;
  Set<Marker> get markers;
  GoogleMapController? get mapController;
  TextEditingController? get reviewTextController;
  int? get currentReviewStars;
  DateTime? get dateOfVisitForReview;
  List<String> get reviewPhotoPaths;
  ReviewDM? get editingReview;
  ReviewsMetaDM? get reviewsMeta;
  bool get isLoadingMoreReviews;
  DateTime? get reservationDateTime;
  String? get reservationTime;
  int? get reservationSize;
  TextEditingController? get specialRequestsController;
  bool get isSubmittingReservation;

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisitBusinessVMCopyWith<VisitBusinessVM> get copyWith =>
      _$VisitBusinessVMCopyWithImpl<VisitBusinessVM>(
          this as VisitBusinessVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisitBusinessVM &&
            (identical(other.currentBusiness, currentBusiness) ||
                other.currentBusiness == currentBusiness) &&
            const DeepCollectionEquality()
                .equals(other.currentBusinessReviews, currentBusinessReviews) &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.reviewTextController, reviewTextController) ||
                other.reviewTextController == reviewTextController) &&
            (identical(other.currentReviewStars, currentReviewStars) ||
                other.currentReviewStars == currentReviewStars) &&
            (identical(other.dateOfVisitForReview, dateOfVisitForReview) ||
                other.dateOfVisitForReview == dateOfVisitForReview) &&
            const DeepCollectionEquality()
                .equals(other.reviewPhotoPaths, reviewPhotoPaths) &&
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
      const DeepCollectionEquality().hash(currentBusinessReviews),
      const DeepCollectionEquality().hash(markers),
      mapController,
      reviewTextController,
      currentReviewStars,
      dateOfVisitForReview,
      const DeepCollectionEquality().hash(reviewPhotoPaths),
      editingReview,
      reviewsMeta,
      isLoadingMoreReviews,
      reservationDateTime,
      reservationTime,
      reservationSize,
      specialRequestsController,
      isSubmittingReservation);

  @override
  String toString() {
    return 'VisitBusinessVM(currentBusiness: $currentBusiness, currentBusinessReviews: $currentBusinessReviews, markers: $markers, mapController: $mapController, reviewTextController: $reviewTextController, currentReviewStars: $currentReviewStars, dateOfVisitForReview: $dateOfVisitForReview, reviewPhotoPaths: $reviewPhotoPaths, editingReview: $editingReview, reviewsMeta: $reviewsMeta, isLoadingMoreReviews: $isLoadingMoreReviews, reservationDateTime: $reservationDateTime, reservationTime: $reservationTime, reservationSize: $reservationSize, specialRequestsController: $specialRequestsController, isSubmittingReservation: $isSubmittingReservation)';
  }
}

/// @nodoc
abstract mixin class $VisitBusinessVMCopyWith<$Res> {
  factory $VisitBusinessVMCopyWith(
          VisitBusinessVM value, $Res Function(VisitBusinessVM) _then) =
      _$VisitBusinessVMCopyWithImpl;
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
class _$VisitBusinessVMCopyWithImpl<$Res>
    implements $VisitBusinessVMCopyWith<$Res> {
  _$VisitBusinessVMCopyWithImpl(this._self, this._then);

  final VisitBusinessVM _self;
  final $Res Function(VisitBusinessVM) _then;

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
    return _then(_self.copyWith(
      currentBusiness: freezed == currentBusiness
          ? _self.currentBusiness
          : currentBusiness // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      currentBusinessReviews: freezed == currentBusinessReviews
          ? _self.currentBusinessReviews
          : currentBusinessReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>?,
      markers: null == markers
          ? _self.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      mapController: freezed == mapController
          ? _self.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      reviewTextController: freezed == reviewTextController
          ? _self.reviewTextController
          : reviewTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      currentReviewStars: freezed == currentReviewStars
          ? _self.currentReviewStars
          : currentReviewStars // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfVisitForReview: freezed == dateOfVisitForReview
          ? _self.dateOfVisitForReview
          : dateOfVisitForReview // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewPhotoPaths: null == reviewPhotoPaths
          ? _self.reviewPhotoPaths
          : reviewPhotoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editingReview: freezed == editingReview
          ? _self.editingReview
          : editingReview // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
      reviewsMeta: freezed == reviewsMeta
          ? _self.reviewsMeta
          : reviewsMeta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
      isLoadingMoreReviews: null == isLoadingMoreReviews
          ? _self.isLoadingMoreReviews
          : isLoadingMoreReviews // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationDateTime: freezed == reservationDateTime
          ? _self.reservationDateTime
          : reservationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _self.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationSize: freezed == reservationSize
          ? _self.reservationSize
          : reservationSize // ignore: cast_nullable_to_non_nullable
              as int?,
      specialRequestsController: freezed == specialRequestsController
          ? _self.specialRequestsController
          : specialRequestsController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isSubmittingReservation: null == isSubmittingReservation
          ? _self.isSubmittingReservation
          : isSubmittingReservation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get currentBusiness {
    if (_self.currentBusiness == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.currentBusiness!, (value) {
      return _then(_self.copyWith(currentBusiness: value));
    });
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get editingReview {
    if (_self.editingReview == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.editingReview!, (value) {
      return _then(_self.copyWith(editingReview: value));
    });
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta {
    if (_self.reviewsMeta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_self.reviewsMeta!, (value) {
      return _then(_self.copyWith(reviewsMeta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VisitBusinessVM].
extension VisitBusinessVMPatterns on VisitBusinessVM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VisitBusinessVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitBusinessVM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VisitBusinessVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitBusinessVM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VisitBusinessVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitBusinessVM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            BusinessDM? currentBusiness,
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
            bool isSubmittingReservation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitBusinessVM() when $default != null:
        return $default(
            _that.currentBusiness,
            _that.currentBusinessReviews,
            _that.markers,
            _that.mapController,
            _that.reviewTextController,
            _that.currentReviewStars,
            _that.dateOfVisitForReview,
            _that.reviewPhotoPaths,
            _that.editingReview,
            _that.reviewsMeta,
            _that.isLoadingMoreReviews,
            _that.reservationDateTime,
            _that.reservationTime,
            _that.reservationSize,
            _that.specialRequestsController,
            _that.isSubmittingReservation);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            BusinessDM? currentBusiness,
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
            bool isSubmittingReservation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitBusinessVM():
        return $default(
            _that.currentBusiness,
            _that.currentBusinessReviews,
            _that.markers,
            _that.mapController,
            _that.reviewTextController,
            _that.currentReviewStars,
            _that.dateOfVisitForReview,
            _that.reviewPhotoPaths,
            _that.editingReview,
            _that.reviewsMeta,
            _that.isLoadingMoreReviews,
            _that.reservationDateTime,
            _that.reservationTime,
            _that.reservationSize,
            _that.specialRequestsController,
            _that.isSubmittingReservation);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            BusinessDM? currentBusiness,
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
            bool isSubmittingReservation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitBusinessVM() when $default != null:
        return $default(
            _that.currentBusiness,
            _that.currentBusinessReviews,
            _that.markers,
            _that.mapController,
            _that.reviewTextController,
            _that.currentReviewStars,
            _that.dateOfVisitForReview,
            _that.reviewPhotoPaths,
            _that.editingReview,
            _that.reviewsMeta,
            _that.isLoadingMoreReviews,
            _that.reservationDateTime,
            _that.reservationTime,
            _that.reservationSize,
            _that.specialRequestsController,
            _that.isSubmittingReservation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VisitBusinessVM extends VisitBusinessVM {
  const _VisitBusinessVM(
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

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisitBusinessVMCopyWith<_VisitBusinessVM> get copyWith =>
      __$VisitBusinessVMCopyWithImpl<_VisitBusinessVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisitBusinessVM &&
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

  @override
  String toString() {
    return 'VisitBusinessVM(currentBusiness: $currentBusiness, currentBusinessReviews: $currentBusinessReviews, markers: $markers, mapController: $mapController, reviewTextController: $reviewTextController, currentReviewStars: $currentReviewStars, dateOfVisitForReview: $dateOfVisitForReview, reviewPhotoPaths: $reviewPhotoPaths, editingReview: $editingReview, reviewsMeta: $reviewsMeta, isLoadingMoreReviews: $isLoadingMoreReviews, reservationDateTime: $reservationDateTime, reservationTime: $reservationTime, reservationSize: $reservationSize, specialRequestsController: $specialRequestsController, isSubmittingReservation: $isSubmittingReservation)';
  }
}

/// @nodoc
abstract mixin class _$VisitBusinessVMCopyWith<$Res>
    implements $VisitBusinessVMCopyWith<$Res> {
  factory _$VisitBusinessVMCopyWith(
          _VisitBusinessVM value, $Res Function(_VisitBusinessVM) _then) =
      __$VisitBusinessVMCopyWithImpl;
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
class __$VisitBusinessVMCopyWithImpl<$Res>
    implements _$VisitBusinessVMCopyWith<$Res> {
  __$VisitBusinessVMCopyWithImpl(this._self, this._then);

  final _VisitBusinessVM _self;
  final $Res Function(_VisitBusinessVM) _then;

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_VisitBusinessVM(
      currentBusiness: freezed == currentBusiness
          ? _self.currentBusiness
          : currentBusiness // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      currentBusinessReviews: freezed == currentBusinessReviews
          ? _self._currentBusinessReviews
          : currentBusinessReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>?,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      mapController: freezed == mapController
          ? _self.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      reviewTextController: freezed == reviewTextController
          ? _self.reviewTextController
          : reviewTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      currentReviewStars: freezed == currentReviewStars
          ? _self.currentReviewStars
          : currentReviewStars // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfVisitForReview: freezed == dateOfVisitForReview
          ? _self.dateOfVisitForReview
          : dateOfVisitForReview // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewPhotoPaths: null == reviewPhotoPaths
          ? _self._reviewPhotoPaths
          : reviewPhotoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editingReview: freezed == editingReview
          ? _self.editingReview
          : editingReview // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
      reviewsMeta: freezed == reviewsMeta
          ? _self.reviewsMeta
          : reviewsMeta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
      isLoadingMoreReviews: null == isLoadingMoreReviews
          ? _self.isLoadingMoreReviews
          : isLoadingMoreReviews // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationDateTime: freezed == reservationDateTime
          ? _self.reservationDateTime
          : reservationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _self.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationSize: freezed == reservationSize
          ? _self.reservationSize
          : reservationSize // ignore: cast_nullable_to_non_nullable
              as int?,
      specialRequestsController: freezed == specialRequestsController
          ? _self.specialRequestsController
          : specialRequestsController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isSubmittingReservation: null == isSubmittingReservation
          ? _self.isSubmittingReservation
          : isSubmittingReservation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get currentBusiness {
    if (_self.currentBusiness == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.currentBusiness!, (value) {
      return _then(_self.copyWith(currentBusiness: value));
    });
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get editingReview {
    if (_self.editingReview == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.editingReview!, (value) {
      return _then(_self.copyWith(editingReview: value));
    });
  }

  /// Create a copy of VisitBusinessVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get reviewsMeta {
    if (_self.reviewsMeta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_self.reviewsMeta!, (value) {
      return _then(_self.copyWith(reviewsMeta: value));
    });
  }
}

// dart format on
