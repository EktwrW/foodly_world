// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewsResponseDM _$ReviewsResponseDMFromJson(Map<String, dynamic> json) {
  return _ReviewsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewsResponseDM {
  List<ReviewDM> get reviews => throw _privateConstructorUsedError;
  ReviewsMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this ReviewsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewsResponseDMCopyWith<ReviewsResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsResponseDMCopyWith<$Res> {
  factory $ReviewsResponseDMCopyWith(
          ReviewsResponseDM value, $Res Function(ReviewsResponseDM) then) =
      _$ReviewsResponseDMCopyWithImpl<$Res, ReviewsResponseDM>;
  @useResult
  $Res call({List<ReviewDM> reviews, ReviewsMetaDM? meta});

  $ReviewsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ReviewsResponseDMCopyWithImpl<$Res, $Val extends ReviewsResponseDM>
    implements $ReviewsResponseDMCopyWith<$Res> {
  _$ReviewsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
    ) as $Val);
  }

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewsResponseDMImplCopyWith<$Res>
    implements $ReviewsResponseDMCopyWith<$Res> {
  factory _$$ReviewsResponseDMImplCopyWith(_$ReviewsResponseDMImpl value,
          $Res Function(_$ReviewsResponseDMImpl) then) =
      __$$ReviewsResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReviewDM> reviews, ReviewsMetaDM? meta});

  @override
  $ReviewsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ReviewsResponseDMImplCopyWithImpl<$Res>
    extends _$ReviewsResponseDMCopyWithImpl<$Res, _$ReviewsResponseDMImpl>
    implements _$$ReviewsResponseDMImplCopyWith<$Res> {
  __$$ReviewsResponseDMImplCopyWithImpl(_$ReviewsResponseDMImpl _value,
      $Res Function(_$ReviewsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? meta = freezed,
  }) {
    return _then(_$ReviewsResponseDMImpl(
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewsResponseDMImpl implements _ReviewsResponseDM {
  const _$ReviewsResponseDMImpl(
      {final List<ReviewDM> reviews = const [], this.meta})
      : _reviews = reviews;

  factory _$ReviewsResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewsResponseDMImplFromJson(json);

  final List<ReviewDM> _reviews;
  @override
  @JsonKey()
  List<ReviewDM> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final ReviewsMetaDM? meta;

  @override
  String toString() {
    return 'ReviewsResponseDM(reviews: $reviews, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsResponseDMImpl &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reviews), meta);

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsResponseDMImplCopyWith<_$ReviewsResponseDMImpl> get copyWith =>
      __$$ReviewsResponseDMImplCopyWithImpl<_$ReviewsResponseDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewsResponseDM implements ReviewsResponseDM {
  const factory _ReviewsResponseDM(
      {final List<ReviewDM> reviews,
      final ReviewsMetaDM? meta}) = _$ReviewsResponseDMImpl;

  factory _ReviewsResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReviewsResponseDMImpl.fromJson;

  @override
  List<ReviewDM> get reviews;
  @override
  ReviewsMetaDM? get meta;

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewsResponseDMImplCopyWith<_$ReviewsResponseDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewsMetaDM _$ReviewsMetaDMFromJson(Map<String, dynamic> json) {
  return _ReviewsMetaDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'ratings_count')
  int get ratingsCount => throw _privateConstructorUsedError;

  /// Serializes this ReviewsMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewsMetaDMCopyWith<ReviewsMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsMetaDMCopyWith<$Res> {
  factory $ReviewsMetaDMCopyWith(
          ReviewsMetaDM value, $Res Function(ReviewsMetaDM) then) =
      _$ReviewsMetaDMCopyWithImpl<$Res, ReviewsMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'ratings_count') int ratingsCount});
}

/// @nodoc
class _$ReviewsMetaDMCopyWithImpl<$Res, $Val extends ReviewsMetaDM>
    implements $ReviewsMetaDMCopyWith<$Res> {
  _$ReviewsMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? averageRating = null,
    Object? ratingsCount = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsCount: null == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewsMetaDMImplCopyWith<$Res>
    implements $ReviewsMetaDMCopyWith<$Res> {
  factory _$$ReviewsMetaDMImplCopyWith(
          _$ReviewsMetaDMImpl value, $Res Function(_$ReviewsMetaDMImpl) then) =
      __$$ReviewsMetaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'ratings_count') int ratingsCount});
}

/// @nodoc
class __$$ReviewsMetaDMImplCopyWithImpl<$Res>
    extends _$ReviewsMetaDMCopyWithImpl<$Res, _$ReviewsMetaDMImpl>
    implements _$$ReviewsMetaDMImplCopyWith<$Res> {
  __$$ReviewsMetaDMImplCopyWithImpl(
      _$ReviewsMetaDMImpl _value, $Res Function(_$ReviewsMetaDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? averageRating = null,
    Object? ratingsCount = null,
  }) {
    return _then(_$ReviewsMetaDMImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsCount: null == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewsMetaDMImpl implements _ReviewsMetaDM {
  const _$ReviewsMetaDMImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0,
      @JsonKey(name: 'average_rating') this.averageRating = 0,
      @JsonKey(name: 'ratings_count') this.ratingsCount = 0});

  factory _$ReviewsMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewsMetaDMImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @override
  @JsonKey(name: 'ratings_count')
  final int ratingsCount;

  @override
  String toString() {
    return 'ReviewsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, averageRating: $averageRating, ratingsCount: $ratingsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsMetaDMImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratingsCount, ratingsCount) ||
                other.ratingsCount == ratingsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, lastPage, perPage,
      total, averageRating, ratingsCount);

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsMetaDMImplCopyWith<_$ReviewsMetaDMImpl> get copyWith =>
      __$$ReviewsMetaDMImplCopyWithImpl<_$ReviewsMetaDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewsMetaDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewsMetaDM implements ReviewsMetaDM {
  const factory _ReviewsMetaDM(
          {@JsonKey(name: 'current_page') final int currentPage,
          @JsonKey(name: 'last_page') final int lastPage,
          @JsonKey(name: 'per_page') final int perPage,
          final int total,
          @JsonKey(name: 'average_rating') final double averageRating,
          @JsonKey(name: 'ratings_count') final int ratingsCount}) =
      _$ReviewsMetaDMImpl;

  factory _ReviewsMetaDM.fromJson(Map<String, dynamic> json) =
      _$ReviewsMetaDMImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;
  @override
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @override
  @JsonKey(name: 'ratings_count')
  int get ratingsCount;

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewsMetaDMImplCopyWith<_$ReviewsMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewCheckResponseDM _$ReviewCheckResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReviewCheckResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewCheckResponseDM {
  @JsonKey(name: 'has_reviewed')
  bool get hasReviewed => throw _privateConstructorUsedError;
  ReviewDM? get review => throw _privateConstructorUsedError;

  /// Serializes this ReviewCheckResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCheckResponseDMCopyWith<ReviewCheckResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCheckResponseDMCopyWith<$Res> {
  factory $ReviewCheckResponseDMCopyWith(ReviewCheckResponseDM value,
          $Res Function(ReviewCheckResponseDM) then) =
      _$ReviewCheckResponseDMCopyWithImpl<$Res, ReviewCheckResponseDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review});

  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class _$ReviewCheckResponseDMCopyWithImpl<$Res,
        $Val extends ReviewCheckResponseDM>
    implements $ReviewCheckResponseDMCopyWith<$Res> {
  _$ReviewCheckResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasReviewed = null,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      hasReviewed: null == hasReviewed
          ? _value.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ) as $Val);
  }

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewCheckResponseDMImplCopyWith<$Res>
    implements $ReviewCheckResponseDMCopyWith<$Res> {
  factory _$$ReviewCheckResponseDMImplCopyWith(
          _$ReviewCheckResponseDMImpl value,
          $Res Function(_$ReviewCheckResponseDMImpl) then) =
      __$$ReviewCheckResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review});

  @override
  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class __$$ReviewCheckResponseDMImplCopyWithImpl<$Res>
    extends _$ReviewCheckResponseDMCopyWithImpl<$Res,
        _$ReviewCheckResponseDMImpl>
    implements _$$ReviewCheckResponseDMImplCopyWith<$Res> {
  __$$ReviewCheckResponseDMImplCopyWithImpl(_$ReviewCheckResponseDMImpl _value,
      $Res Function(_$ReviewCheckResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasReviewed = null,
    Object? review = freezed,
  }) {
    return _then(_$ReviewCheckResponseDMImpl(
      hasReviewed: null == hasReviewed
          ? _value.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCheckResponseDMImpl implements _ReviewCheckResponseDM {
  const _$ReviewCheckResponseDMImpl(
      {@JsonKey(name: 'has_reviewed') this.hasReviewed = false, this.review});

  factory _$ReviewCheckResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCheckResponseDMImplFromJson(json);

  @override
  @JsonKey(name: 'has_reviewed')
  final bool hasReviewed;
  @override
  final ReviewDM? review;

  @override
  String toString() {
    return 'ReviewCheckResponseDM(hasReviewed: $hasReviewed, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCheckResponseDMImpl &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasReviewed, review);

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCheckResponseDMImplCopyWith<_$ReviewCheckResponseDMImpl>
      get copyWith => __$$ReviewCheckResponseDMImplCopyWithImpl<
          _$ReviewCheckResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCheckResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewCheckResponseDM implements ReviewCheckResponseDM {
  const factory _ReviewCheckResponseDM(
      {@JsonKey(name: 'has_reviewed') final bool hasReviewed,
      final ReviewDM? review}) = _$ReviewCheckResponseDMImpl;

  factory _ReviewCheckResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReviewCheckResponseDMImpl.fromJson;

  @override
  @JsonKey(name: 'has_reviewed')
  bool get hasReviewed;
  @override
  ReviewDM? get review;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCheckResponseDMImplCopyWith<_$ReviewCheckResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReviewCreateResponseDM _$ReviewCreateResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReviewCreateResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewCreateResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ReviewDM? get review => throw _privateConstructorUsedError;

  /// Serializes this ReviewCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCreateResponseDMCopyWith<ReviewCreateResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCreateResponseDMCopyWith<$Res> {
  factory $ReviewCreateResponseDMCopyWith(ReviewCreateResponseDM value,
          $Res Function(ReviewCreateResponseDM) then) =
      _$ReviewCreateResponseDMCopyWithImpl<$Res, ReviewCreateResponseDM>;
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class _$ReviewCreateResponseDMCopyWithImpl<$Res,
        $Val extends ReviewCreateResponseDM>
    implements $ReviewCreateResponseDMCopyWith<$Res> {
  _$ReviewCreateResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ) as $Val);
  }

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewCreateResponseDMImplCopyWith<$Res>
    implements $ReviewCreateResponseDMCopyWith<$Res> {
  factory _$$ReviewCreateResponseDMImplCopyWith(
          _$ReviewCreateResponseDMImpl value,
          $Res Function(_$ReviewCreateResponseDMImpl) then) =
      __$$ReviewCreateResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  @override
  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class __$$ReviewCreateResponseDMImplCopyWithImpl<$Res>
    extends _$ReviewCreateResponseDMCopyWithImpl<$Res,
        _$ReviewCreateResponseDMImpl>
    implements _$$ReviewCreateResponseDMImplCopyWith<$Res> {
  __$$ReviewCreateResponseDMImplCopyWithImpl(
      _$ReviewCreateResponseDMImpl _value,
      $Res Function(_$ReviewCreateResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_$ReviewCreateResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCreateResponseDMImpl implements _ReviewCreateResponseDM {
  const _$ReviewCreateResponseDMImpl(
      {this.success = false, this.message = '', this.review});

  factory _$ReviewCreateResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCreateResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReviewDM? review;

  @override
  String toString() {
    return 'ReviewCreateResponseDM(success: $success, message: $message, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCreateResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, review);

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCreateResponseDMImplCopyWith<_$ReviewCreateResponseDMImpl>
      get copyWith => __$$ReviewCreateResponseDMImplCopyWithImpl<
          _$ReviewCreateResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCreateResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewCreateResponseDM implements ReviewCreateResponseDM {
  const factory _ReviewCreateResponseDM(
      {final bool success,
      final String message,
      final ReviewDM? review}) = _$ReviewCreateResponseDMImpl;

  factory _ReviewCreateResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReviewCreateResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ReviewDM? get review;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCreateResponseDMImplCopyWith<_$ReviewCreateResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReviewUpdateResponseDM _$ReviewUpdateResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReviewUpdateResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewUpdateResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ReviewDM? get review => throw _privateConstructorUsedError;

  /// Serializes this ReviewUpdateResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewUpdateResponseDMCopyWith<ReviewUpdateResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUpdateResponseDMCopyWith<$Res> {
  factory $ReviewUpdateResponseDMCopyWith(ReviewUpdateResponseDM value,
          $Res Function(ReviewUpdateResponseDM) then) =
      _$ReviewUpdateResponseDMCopyWithImpl<$Res, ReviewUpdateResponseDM>;
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class _$ReviewUpdateResponseDMCopyWithImpl<$Res,
        $Val extends ReviewUpdateResponseDM>
    implements $ReviewUpdateResponseDMCopyWith<$Res> {
  _$ReviewUpdateResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ) as $Val);
  }

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewUpdateResponseDMImplCopyWith<$Res>
    implements $ReviewUpdateResponseDMCopyWith<$Res> {
  factory _$$ReviewUpdateResponseDMImplCopyWith(
          _$ReviewUpdateResponseDMImpl value,
          $Res Function(_$ReviewUpdateResponseDMImpl) then) =
      __$$ReviewUpdateResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  @override
  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class __$$ReviewUpdateResponseDMImplCopyWithImpl<$Res>
    extends _$ReviewUpdateResponseDMCopyWithImpl<$Res,
        _$ReviewUpdateResponseDMImpl>
    implements _$$ReviewUpdateResponseDMImplCopyWith<$Res> {
  __$$ReviewUpdateResponseDMImplCopyWithImpl(
      _$ReviewUpdateResponseDMImpl _value,
      $Res Function(_$ReviewUpdateResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_$ReviewUpdateResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewUpdateResponseDMImpl implements _ReviewUpdateResponseDM {
  const _$ReviewUpdateResponseDMImpl(
      {this.success = false, this.message = '', this.review});

  factory _$ReviewUpdateResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewUpdateResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReviewDM? review;

  @override
  String toString() {
    return 'ReviewUpdateResponseDM(success: $success, message: $message, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewUpdateResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, review);

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewUpdateResponseDMImplCopyWith<_$ReviewUpdateResponseDMImpl>
      get copyWith => __$$ReviewUpdateResponseDMImplCopyWithImpl<
          _$ReviewUpdateResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewUpdateResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewUpdateResponseDM implements ReviewUpdateResponseDM {
  const factory _ReviewUpdateResponseDM(
      {final bool success,
      final String message,
      final ReviewDM? review}) = _$ReviewUpdateResponseDMImpl;

  factory _ReviewUpdateResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReviewUpdateResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ReviewDM? get review;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewUpdateResponseDMImplCopyWith<_$ReviewUpdateResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReviewPhotoDM _$ReviewPhotoDMFromJson(Map<String, dynamic> json) {
  return _ReviewPhotoDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewPhotoDM {
  @JsonKey(name: 'photo_uuid')
  String? get photoUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this ReviewPhotoDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewPhotoDMCopyWith<ReviewPhotoDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewPhotoDMCopyWith<$Res> {
  factory $ReviewPhotoDMCopyWith(
          ReviewPhotoDM value, $Res Function(ReviewPhotoDM) then) =
      _$ReviewPhotoDMCopyWithImpl<$Res, ReviewPhotoDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'photo_uuid') String? photoUuid,
      @JsonKey(name: 'photo_url') String? photoUrl});
}

/// @nodoc
class _$ReviewPhotoDMCopyWithImpl<$Res, $Val extends ReviewPhotoDM>
    implements $ReviewPhotoDMCopyWith<$Res> {
  _$ReviewPhotoDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoUuid = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      photoUuid: freezed == photoUuid
          ? _value.photoUuid
          : photoUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewPhotoDMImplCopyWith<$Res>
    implements $ReviewPhotoDMCopyWith<$Res> {
  factory _$$ReviewPhotoDMImplCopyWith(
          _$ReviewPhotoDMImpl value, $Res Function(_$ReviewPhotoDMImpl) then) =
      __$$ReviewPhotoDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'photo_uuid') String? photoUuid,
      @JsonKey(name: 'photo_url') String? photoUrl});
}

/// @nodoc
class __$$ReviewPhotoDMImplCopyWithImpl<$Res>
    extends _$ReviewPhotoDMCopyWithImpl<$Res, _$ReviewPhotoDMImpl>
    implements _$$ReviewPhotoDMImplCopyWith<$Res> {
  __$$ReviewPhotoDMImplCopyWithImpl(
      _$ReviewPhotoDMImpl _value, $Res Function(_$ReviewPhotoDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoUuid = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$ReviewPhotoDMImpl(
      photoUuid: freezed == photoUuid
          ? _value.photoUuid
          : photoUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewPhotoDMImpl implements _ReviewPhotoDM {
  const _$ReviewPhotoDMImpl(
      {@JsonKey(name: 'photo_uuid') this.photoUuid,
      @JsonKey(name: 'photo_url') this.photoUrl});

  factory _$ReviewPhotoDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewPhotoDMImplFromJson(json);

  @override
  @JsonKey(name: 'photo_uuid')
  final String? photoUuid;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;

  @override
  String toString() {
    return 'ReviewPhotoDM(photoUuid: $photoUuid, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewPhotoDMImpl &&
            (identical(other.photoUuid, photoUuid) ||
                other.photoUuid == photoUuid) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, photoUuid, photoUrl);

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewPhotoDMImplCopyWith<_$ReviewPhotoDMImpl> get copyWith =>
      __$$ReviewPhotoDMImplCopyWithImpl<_$ReviewPhotoDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewPhotoDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewPhotoDM implements ReviewPhotoDM {
  const factory _ReviewPhotoDM(
          {@JsonKey(name: 'photo_uuid') final String? photoUuid,
          @JsonKey(name: 'photo_url') final String? photoUrl}) =
      _$ReviewPhotoDMImpl;

  factory _ReviewPhotoDM.fromJson(Map<String, dynamic> json) =
      _$ReviewPhotoDMImpl.fromJson;

  @override
  @JsonKey(name: 'photo_uuid')
  String? get photoUuid;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewPhotoDMImplCopyWith<_$ReviewPhotoDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewDM _$ReviewDMFromJson(Map<String, dynamic> json) {
  return _ReviewDM.fromJson(json);
}

/// @nodoc
mixin _$ReviewDM {
  @JsonKey(name: 'review_id')
  int? get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_uuid')
  String? get reviewUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  List<ReviewPhotoDM> get photos => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String? get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_photo')
  String? get businessPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_uuid')
  String? get userUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_photo')
  String? get userPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_visited_at')
  DateTime? get businessVisitedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReviewDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewDMCopyWith<ReviewDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDMCopyWith<$Res> {
  factory $ReviewDMCopyWith(ReviewDM value, $Res Function(ReviewDM) then) =
      _$ReviewDMCopyWithImpl<$Res, ReviewDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') int? reviewId,
      @JsonKey(name: 'review_uuid') String? reviewUuid,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      int rating,
      String? comment,
      List<ReviewPhotoDM> photos,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'user_uuid') String? userUuid,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'business_visited_at') DateTime? businessVisitedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ReviewDMCopyWithImpl<$Res, $Val extends ReviewDM>
    implements $ReviewDMCopyWith<$Res> {
  _$ReviewDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? reviewUuid = freezed,
    Object? reviewType = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? photos = null,
    Object? businessUuid = freezed,
    Object? businessName = freezed,
    Object? businessPhoto = freezed,
    Object? userUuid = freezed,
    Object? userName = freezed,
    Object? userPhoto = freezed,
    Object? businessVisitedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewUuid: freezed == reviewUuid
          ? _value.reviewUuid
          : reviewUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewType: freezed == reviewType
          ? _value.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ReviewPhotoDM>,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _value.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userUuid: freezed == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _value.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _value.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewDMImplCopyWith<$Res>
    implements $ReviewDMCopyWith<$Res> {
  factory _$$ReviewDMImplCopyWith(
          _$ReviewDMImpl value, $Res Function(_$ReviewDMImpl) then) =
      __$$ReviewDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') int? reviewId,
      @JsonKey(name: 'review_uuid') String? reviewUuid,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      int rating,
      String? comment,
      List<ReviewPhotoDM> photos,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'user_uuid') String? userUuid,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'business_visited_at') DateTime? businessVisitedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$ReviewDMImplCopyWithImpl<$Res>
    extends _$ReviewDMCopyWithImpl<$Res, _$ReviewDMImpl>
    implements _$$ReviewDMImplCopyWith<$Res> {
  __$$ReviewDMImplCopyWithImpl(
      _$ReviewDMImpl _value, $Res Function(_$ReviewDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? reviewUuid = freezed,
    Object? reviewType = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? photos = null,
    Object? businessUuid = freezed,
    Object? businessName = freezed,
    Object? businessPhoto = freezed,
    Object? userUuid = freezed,
    Object? userName = freezed,
    Object? userPhoto = freezed,
    Object? businessVisitedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReviewDMImpl(
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewUuid: freezed == reviewUuid
          ? _value.reviewUuid
          : reviewUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewType: freezed == reviewType
          ? _value.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ReviewPhotoDM>,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _value.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userUuid: freezed == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _value.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _value.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewDMImpl extends _ReviewDM {
  const _$ReviewDMImpl(
      {@JsonKey(name: 'review_id') this.reviewId,
      @JsonKey(name: 'review_uuid') this.reviewUuid,
      @JsonKey(name: 'review_type') this.reviewType,
      this.rating = 0,
      this.comment,
      final List<ReviewPhotoDM> photos = const [],
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_name') this.businessName,
      @JsonKey(name: 'business_photo') this.businessPhoto,
      @JsonKey(name: 'user_uuid') this.userUuid,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_photo') this.userPhoto,
      @JsonKey(name: 'business_visited_at') this.businessVisitedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _photos = photos,
        super._();

  factory _$ReviewDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewDMImplFromJson(json);

  @override
  @JsonKey(name: 'review_id')
  final int? reviewId;
  @override
  @JsonKey(name: 'review_uuid')
  final String? reviewUuid;
  @override
  @JsonKey(name: 'review_type')
  final ReviewType? reviewType;
  @override
  @JsonKey()
  final int rating;
  @override
  final String? comment;
  final List<ReviewPhotoDM> _photos;
  @override
  @JsonKey()
  List<ReviewPhotoDM> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;
  @override
  @JsonKey(name: 'business_photo')
  final String? businessPhoto;
  @override
  @JsonKey(name: 'user_uuid')
  final String? userUuid;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  @JsonKey(name: 'user_photo')
  final String? userPhoto;
  @override
  @JsonKey(name: 'business_visited_at')
  final DateTime? businessVisitedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ReviewDM(reviewId: $reviewId, reviewUuid: $reviewUuid, reviewType: $reviewType, rating: $rating, comment: $comment, photos: $photos, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, businessVisitedAt: $businessVisitedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDMImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.reviewUuid, reviewUuid) ||
                other.reviewUuid == reviewUuid) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessPhoto, businessPhoto) ||
                other.businessPhoto == businessPhoto) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhoto, userPhoto) ||
                other.userPhoto == userPhoto) &&
            (identical(other.businessVisitedAt, businessVisitedAt) ||
                other.businessVisitedAt == businessVisitedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      reviewUuid,
      reviewType,
      rating,
      comment,
      const DeepCollectionEquality().hash(_photos),
      businessUuid,
      businessName,
      businessPhoto,
      userUuid,
      userName,
      userPhoto,
      businessVisitedAt,
      createdAt,
      updatedAt);

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDMImplCopyWith<_$ReviewDMImpl> get copyWith =>
      __$$ReviewDMImplCopyWithImpl<_$ReviewDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewDMImplToJson(
      this,
    );
  }
}

abstract class _ReviewDM extends ReviewDM {
  const factory _ReviewDM(
      {@JsonKey(name: 'review_id') final int? reviewId,
      @JsonKey(name: 'review_uuid') final String? reviewUuid,
      @JsonKey(name: 'review_type') final ReviewType? reviewType,
      final int rating,
      final String? comment,
      final List<ReviewPhotoDM> photos,
      @JsonKey(name: 'business_uuid') final String? businessUuid,
      @JsonKey(name: 'business_name') final String? businessName,
      @JsonKey(name: 'business_photo') final String? businessPhoto,
      @JsonKey(name: 'user_uuid') final String? userUuid,
      @JsonKey(name: 'user_name') final String? userName,
      @JsonKey(name: 'user_photo') final String? userPhoto,
      @JsonKey(name: 'business_visited_at') final DateTime? businessVisitedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$ReviewDMImpl;
  const _ReviewDM._() : super._();

  factory _ReviewDM.fromJson(Map<String, dynamic> json) =
      _$ReviewDMImpl.fromJson;

  @override
  @JsonKey(name: 'review_id')
  int? get reviewId;
  @override
  @JsonKey(name: 'review_uuid')
  String? get reviewUuid;
  @override
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType;
  @override
  int get rating;
  @override
  String? get comment;
  @override
  List<ReviewPhotoDM> get photos;
  @override
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @override
  @JsonKey(name: 'business_name')
  String? get businessName;
  @override
  @JsonKey(name: 'business_photo')
  String? get businessPhoto;
  @override
  @JsonKey(name: 'user_uuid')
  String? get userUuid;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  @JsonKey(name: 'user_photo')
  String? get userPhoto;
  @override
  @JsonKey(name: 'business_visited_at')
  DateTime? get businessVisitedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewDMImplCopyWith<_$ReviewDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
