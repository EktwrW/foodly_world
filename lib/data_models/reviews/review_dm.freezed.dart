// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewsResponseDM {
  List<ReviewDM> get reviews;
  ReviewsMetaDM? get meta;

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewsResponseDMCopyWith<ReviewsResponseDM> get copyWith =>
      _$ReviewsResponseDMCopyWithImpl<ReviewsResponseDM>(
          this as ReviewsResponseDM, _$identity);

  /// Serializes this ReviewsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewsResponseDM &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(reviews), meta);

  @override
  String toString() {
    return 'ReviewsResponseDM(reviews: $reviews, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $ReviewsResponseDMCopyWith<$Res> {
  factory $ReviewsResponseDMCopyWith(
          ReviewsResponseDM value, $Res Function(ReviewsResponseDM) _then) =
      _$ReviewsResponseDMCopyWithImpl;
  @useResult
  $Res call({List<ReviewDM> reviews, ReviewsMetaDM? meta});

  $ReviewsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ReviewsResponseDMCopyWithImpl<$Res>
    implements $ReviewsResponseDMCopyWith<$Res> {
  _$ReviewsResponseDMCopyWithImpl(this._self, this._then);

  final ReviewsResponseDM _self;
  final $Res Function(ReviewsResponseDM) _then;

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
    ));
  }

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReviewsResponseDM].
extension ReviewsResponseDMPatterns on ReviewsResponseDM {
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
    TResult Function(_ReviewsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsResponseDM() when $default != null:
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
    TResult Function(_ReviewsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsResponseDM():
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
    TResult? Function(_ReviewsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsResponseDM() when $default != null:
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
    TResult Function(List<ReviewDM> reviews, ReviewsMetaDM? meta)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsResponseDM() when $default != null:
        return $default(_that.reviews, _that.meta);
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
    TResult Function(List<ReviewDM> reviews, ReviewsMetaDM? meta) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsResponseDM():
        return $default(_that.reviews, _that.meta);
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
    TResult? Function(List<ReviewDM> reviews, ReviewsMetaDM? meta)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsResponseDM() when $default != null:
        return $default(_that.reviews, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewsResponseDM implements ReviewsResponseDM {
  const _ReviewsResponseDM({final List<ReviewDM> reviews = const [], this.meta})
      : _reviews = reviews;
  factory _ReviewsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseDMFromJson(json);

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

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewsResponseDMCopyWith<_ReviewsResponseDM> get copyWith =>
      __$ReviewsResponseDMCopyWithImpl<_ReviewsResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewsResponseDM &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reviews), meta);

  @override
  String toString() {
    return 'ReviewsResponseDM(reviews: $reviews, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$ReviewsResponseDMCopyWith<$Res>
    implements $ReviewsResponseDMCopyWith<$Res> {
  factory _$ReviewsResponseDMCopyWith(
          _ReviewsResponseDM value, $Res Function(_ReviewsResponseDM) _then) =
      __$ReviewsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<ReviewDM> reviews, ReviewsMetaDM? meta});

  @override
  $ReviewsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$ReviewsResponseDMCopyWithImpl<$Res>
    implements _$ReviewsResponseDMCopyWith<$Res> {
  __$ReviewsResponseDMCopyWithImpl(this._self, this._then);

  final _ReviewsResponseDM _self;
  final $Res Function(_ReviewsResponseDM) _then;

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviews = null,
    Object? meta = freezed,
  }) {
    return _then(_ReviewsResponseDM(
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReviewsMetaDM?,
    ));
  }

  /// Create a copy of ReviewsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ReviewsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$ReviewsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get total;
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @JsonKey(name: 'ratings_count')
  int get ratingsCount;

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewsMetaDMCopyWith<ReviewsMetaDM> get copyWith =>
      _$ReviewsMetaDMCopyWithImpl<ReviewsMetaDM>(
          this as ReviewsMetaDM, _$identity);

  /// Serializes this ReviewsMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewsMetaDM &&
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

  @override
  String toString() {
    return 'ReviewsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, averageRating: $averageRating, ratingsCount: $ratingsCount)';
  }
}

/// @nodoc
abstract mixin class $ReviewsMetaDMCopyWith<$Res> {
  factory $ReviewsMetaDMCopyWith(
          ReviewsMetaDM value, $Res Function(ReviewsMetaDM) _then) =
      _$ReviewsMetaDMCopyWithImpl;
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
class _$ReviewsMetaDMCopyWithImpl<$Res>
    implements $ReviewsMetaDMCopyWith<$Res> {
  _$ReviewsMetaDMCopyWithImpl(this._self, this._then);

  final ReviewsMetaDM _self;
  final $Res Function(ReviewsMetaDM) _then;

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
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsCount: null == ratingsCount
          ? _self.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewsMetaDM].
extension ReviewsMetaDMPatterns on ReviewsMetaDM {
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
    TResult Function(_ReviewsMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsMetaDM() when $default != null:
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
    TResult Function(_ReviewsMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsMetaDM():
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
    TResult? Function(_ReviewsMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsMetaDM() when $default != null:
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'ratings_count') int ratingsCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsMetaDM() when $default != null:
        return $default(_that.currentPage, _that.lastPage, _that.perPage,
            _that.total, _that.averageRating, _that.ratingsCount);
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'ratings_count') int ratingsCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsMetaDM():
        return $default(_that.currentPage, _that.lastPage, _that.perPage,
            _that.total, _that.averageRating, _that.ratingsCount);
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'ratings_count') int ratingsCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsMetaDM() when $default != null:
        return $default(_that.currentPage, _that.lastPage, _that.perPage,
            _that.total, _that.averageRating, _that.ratingsCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewsMetaDM implements ReviewsMetaDM {
  const _ReviewsMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0,
      @JsonKey(name: 'average_rating') this.averageRating = 0,
      @JsonKey(name: 'ratings_count') this.ratingsCount = 0});
  factory _ReviewsMetaDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewsMetaDMFromJson(json);

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

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewsMetaDMCopyWith<_ReviewsMetaDM> get copyWith =>
      __$ReviewsMetaDMCopyWithImpl<_ReviewsMetaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewsMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewsMetaDM &&
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

  @override
  String toString() {
    return 'ReviewsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, averageRating: $averageRating, ratingsCount: $ratingsCount)';
  }
}

/// @nodoc
abstract mixin class _$ReviewsMetaDMCopyWith<$Res>
    implements $ReviewsMetaDMCopyWith<$Res> {
  factory _$ReviewsMetaDMCopyWith(
          _ReviewsMetaDM value, $Res Function(_ReviewsMetaDM) _then) =
      __$ReviewsMetaDMCopyWithImpl;
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
class __$ReviewsMetaDMCopyWithImpl<$Res>
    implements _$ReviewsMetaDMCopyWith<$Res> {
  __$ReviewsMetaDMCopyWithImpl(this._self, this._then);

  final _ReviewsMetaDM _self;
  final $Res Function(_ReviewsMetaDM) _then;

  /// Create a copy of ReviewsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? averageRating = null,
    Object? ratingsCount = null,
  }) {
    return _then(_ReviewsMetaDM(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsCount: null == ratingsCount
          ? _self.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ReviewCheckResponseDM {
  @JsonKey(name: 'has_reviewed')
  bool get hasReviewed;
  ReviewDM? get review;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewCheckResponseDMCopyWith<ReviewCheckResponseDM> get copyWith =>
      _$ReviewCheckResponseDMCopyWithImpl<ReviewCheckResponseDM>(
          this as ReviewCheckResponseDM, _$identity);

  /// Serializes this ReviewCheckResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewCheckResponseDM &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasReviewed, review);

  @override
  String toString() {
    return 'ReviewCheckResponseDM(hasReviewed: $hasReviewed, review: $review)';
  }
}

/// @nodoc
abstract mixin class $ReviewCheckResponseDMCopyWith<$Res> {
  factory $ReviewCheckResponseDMCopyWith(ReviewCheckResponseDM value,
          $Res Function(ReviewCheckResponseDM) _then) =
      _$ReviewCheckResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review});

  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class _$ReviewCheckResponseDMCopyWithImpl<$Res>
    implements $ReviewCheckResponseDMCopyWith<$Res> {
  _$ReviewCheckResponseDMCopyWithImpl(this._self, this._then);

  final ReviewCheckResponseDM _self;
  final $Res Function(ReviewCheckResponseDM) _then;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasReviewed = null,
    Object? review = freezed,
  }) {
    return _then(_self.copyWith(
      hasReviewed: null == hasReviewed
          ? _self.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_self.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.review!, (value) {
      return _then(_self.copyWith(review: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReviewCheckResponseDM].
extension ReviewCheckResponseDMPatterns on ReviewCheckResponseDM {
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
    TResult Function(_ReviewCheckResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewCheckResponseDM() when $default != null:
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
    TResult Function(_ReviewCheckResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCheckResponseDM():
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
    TResult? Function(_ReviewCheckResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCheckResponseDM() when $default != null:
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
            @JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewCheckResponseDM() when $default != null:
        return $default(_that.hasReviewed, _that.review);
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
            @JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCheckResponseDM():
        return $default(_that.hasReviewed, _that.review);
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
            @JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCheckResponseDM() when $default != null:
        return $default(_that.hasReviewed, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewCheckResponseDM implements ReviewCheckResponseDM {
  const _ReviewCheckResponseDM(
      {@JsonKey(name: 'has_reviewed') this.hasReviewed = false, this.review});
  factory _ReviewCheckResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewCheckResponseDMFromJson(json);

  @override
  @JsonKey(name: 'has_reviewed')
  final bool hasReviewed;
  @override
  final ReviewDM? review;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewCheckResponseDMCopyWith<_ReviewCheckResponseDM> get copyWith =>
      __$ReviewCheckResponseDMCopyWithImpl<_ReviewCheckResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewCheckResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewCheckResponseDM &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasReviewed, review);

  @override
  String toString() {
    return 'ReviewCheckResponseDM(hasReviewed: $hasReviewed, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$ReviewCheckResponseDMCopyWith<$Res>
    implements $ReviewCheckResponseDMCopyWith<$Res> {
  factory _$ReviewCheckResponseDMCopyWith(_ReviewCheckResponseDM value,
          $Res Function(_ReviewCheckResponseDM) _then) =
      __$ReviewCheckResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'has_reviewed') bool hasReviewed, ReviewDM? review});

  @override
  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class __$ReviewCheckResponseDMCopyWithImpl<$Res>
    implements _$ReviewCheckResponseDMCopyWith<$Res> {
  __$ReviewCheckResponseDMCopyWithImpl(this._self, this._then);

  final _ReviewCheckResponseDM _self;
  final $Res Function(_ReviewCheckResponseDM) _then;

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hasReviewed = null,
    Object? review = freezed,
  }) {
    return _then(_ReviewCheckResponseDM(
      hasReviewed: null == hasReviewed
          ? _self.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }

  /// Create a copy of ReviewCheckResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_self.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.review!, (value) {
      return _then(_self.copyWith(review: value));
    });
  }
}

/// @nodoc
mixin _$ReviewCreateResponseDM {
  bool get success;
  String get message;
  ReviewDM? get review;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewCreateResponseDMCopyWith<ReviewCreateResponseDM> get copyWith =>
      _$ReviewCreateResponseDMCopyWithImpl<ReviewCreateResponseDM>(
          this as ReviewCreateResponseDM, _$identity);

  /// Serializes this ReviewCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, review);

  @override
  String toString() {
    return 'ReviewCreateResponseDM(success: $success, message: $message, review: $review)';
  }
}

/// @nodoc
abstract mixin class $ReviewCreateResponseDMCopyWith<$Res> {
  factory $ReviewCreateResponseDMCopyWith(ReviewCreateResponseDM value,
          $Res Function(ReviewCreateResponseDM) _then) =
      _$ReviewCreateResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class _$ReviewCreateResponseDMCopyWithImpl<$Res>
    implements $ReviewCreateResponseDMCopyWith<$Res> {
  _$ReviewCreateResponseDMCopyWithImpl(this._self, this._then);

  final ReviewCreateResponseDM _self;
  final $Res Function(ReviewCreateResponseDM) _then;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_self.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.review!, (value) {
      return _then(_self.copyWith(review: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReviewCreateResponseDM].
extension ReviewCreateResponseDMPatterns on ReviewCreateResponseDM {
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
    TResult Function(_ReviewCreateResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateResponseDM() when $default != null:
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
    TResult Function(_ReviewCreateResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateResponseDM():
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
    TResult? Function(_ReviewCreateResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateResponseDM() when $default != null:
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
    TResult Function(bool success, String message, ReviewDM? review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.review);
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
    TResult Function(bool success, String message, ReviewDM? review) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateResponseDM():
        return $default(_that.success, _that.message, _that.review);
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
    TResult? Function(bool success, String message, ReviewDM? review)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewCreateResponseDM implements ReviewCreateResponseDM {
  const _ReviewCreateResponseDM(
      {this.success = false, this.message = '', this.review});
  factory _ReviewCreateResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewCreateResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReviewDM? review;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewCreateResponseDMCopyWith<_ReviewCreateResponseDM> get copyWith =>
      __$ReviewCreateResponseDMCopyWithImpl<_ReviewCreateResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewCreateResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, review);

  @override
  String toString() {
    return 'ReviewCreateResponseDM(success: $success, message: $message, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$ReviewCreateResponseDMCopyWith<$Res>
    implements $ReviewCreateResponseDMCopyWith<$Res> {
  factory _$ReviewCreateResponseDMCopyWith(_ReviewCreateResponseDM value,
          $Res Function(_ReviewCreateResponseDM) _then) =
      __$ReviewCreateResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  @override
  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class __$ReviewCreateResponseDMCopyWithImpl<$Res>
    implements _$ReviewCreateResponseDMCopyWith<$Res> {
  __$ReviewCreateResponseDMCopyWithImpl(this._self, this._then);

  final _ReviewCreateResponseDM _self;
  final $Res Function(_ReviewCreateResponseDM) _then;

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_ReviewCreateResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }

  /// Create a copy of ReviewCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_self.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.review!, (value) {
      return _then(_self.copyWith(review: value));
    });
  }
}

/// @nodoc
mixin _$ReviewUpdateResponseDM {
  bool get success;
  String get message;
  ReviewDM? get review;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewUpdateResponseDMCopyWith<ReviewUpdateResponseDM> get copyWith =>
      _$ReviewUpdateResponseDMCopyWithImpl<ReviewUpdateResponseDM>(
          this as ReviewUpdateResponseDM, _$identity);

  /// Serializes this ReviewUpdateResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewUpdateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, review);

  @override
  String toString() {
    return 'ReviewUpdateResponseDM(success: $success, message: $message, review: $review)';
  }
}

/// @nodoc
abstract mixin class $ReviewUpdateResponseDMCopyWith<$Res> {
  factory $ReviewUpdateResponseDMCopyWith(ReviewUpdateResponseDM value,
          $Res Function(ReviewUpdateResponseDM) _then) =
      _$ReviewUpdateResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class _$ReviewUpdateResponseDMCopyWithImpl<$Res>
    implements $ReviewUpdateResponseDMCopyWith<$Res> {
  _$ReviewUpdateResponseDMCopyWithImpl(this._self, this._then);

  final ReviewUpdateResponseDM _self;
  final $Res Function(ReviewUpdateResponseDM) _then;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_self.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.review!, (value) {
      return _then(_self.copyWith(review: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReviewUpdateResponseDM].
extension ReviewUpdateResponseDMPatterns on ReviewUpdateResponseDM {
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
    TResult Function(_ReviewUpdateResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateResponseDM() when $default != null:
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
    TResult Function(_ReviewUpdateResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateResponseDM():
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
    TResult? Function(_ReviewUpdateResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateResponseDM() when $default != null:
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
    TResult Function(bool success, String message, ReviewDM? review)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.review);
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
    TResult Function(bool success, String message, ReviewDM? review) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateResponseDM():
        return $default(_that.success, _that.message, _that.review);
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
    TResult? Function(bool success, String message, ReviewDM? review)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.review);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewUpdateResponseDM implements ReviewUpdateResponseDM {
  const _ReviewUpdateResponseDM(
      {this.success = false, this.message = '', this.review});
  factory _ReviewUpdateResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewUpdateResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReviewDM? review;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewUpdateResponseDMCopyWith<_ReviewUpdateResponseDM> get copyWith =>
      __$ReviewUpdateResponseDMCopyWithImpl<_ReviewUpdateResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewUpdateResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewUpdateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, review);

  @override
  String toString() {
    return 'ReviewUpdateResponseDM(success: $success, message: $message, review: $review)';
  }
}

/// @nodoc
abstract mixin class _$ReviewUpdateResponseDMCopyWith<$Res>
    implements $ReviewUpdateResponseDMCopyWith<$Res> {
  factory _$ReviewUpdateResponseDMCopyWith(_ReviewUpdateResponseDM value,
          $Res Function(_ReviewUpdateResponseDM) _then) =
      __$ReviewUpdateResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, ReviewDM? review});

  @override
  $ReviewDMCopyWith<$Res>? get review;
}

/// @nodoc
class __$ReviewUpdateResponseDMCopyWithImpl<$Res>
    implements _$ReviewUpdateResponseDMCopyWith<$Res> {
  __$ReviewUpdateResponseDMCopyWithImpl(this._self, this._then);

  final _ReviewUpdateResponseDM _self;
  final $Res Function(_ReviewUpdateResponseDM) _then;

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? review = freezed,
  }) {
    return _then(_ReviewUpdateResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewDM?,
    ));
  }

  /// Create a copy of ReviewUpdateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<$Res>? get review {
    if (_self.review == null) {
      return null;
    }

    return $ReviewDMCopyWith<$Res>(_self.review!, (value) {
      return _then(_self.copyWith(review: value));
    });
  }
}

/// @nodoc
mixin _$ReviewPhotoDM {
  @JsonKey(name: 'photo_uuid')
  String? get photoUuid;
  @JsonKey(name: 'photo_url')
  String? get photoUrl;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewPhotoDMCopyWith<ReviewPhotoDM> get copyWith =>
      _$ReviewPhotoDMCopyWithImpl<ReviewPhotoDM>(
          this as ReviewPhotoDM, _$identity);

  /// Serializes this ReviewPhotoDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewPhotoDM &&
            (identical(other.photoUuid, photoUuid) ||
                other.photoUuid == photoUuid) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, photoUuid, photoUrl);

  @override
  String toString() {
    return 'ReviewPhotoDM(photoUuid: $photoUuid, photoUrl: $photoUrl)';
  }
}

/// @nodoc
abstract mixin class $ReviewPhotoDMCopyWith<$Res> {
  factory $ReviewPhotoDMCopyWith(
          ReviewPhotoDM value, $Res Function(ReviewPhotoDM) _then) =
      _$ReviewPhotoDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'photo_uuid') String? photoUuid,
      @JsonKey(name: 'photo_url') String? photoUrl});
}

/// @nodoc
class _$ReviewPhotoDMCopyWithImpl<$Res>
    implements $ReviewPhotoDMCopyWith<$Res> {
  _$ReviewPhotoDMCopyWithImpl(this._self, this._then);

  final ReviewPhotoDM _self;
  final $Res Function(ReviewPhotoDM) _then;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoUuid = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_self.copyWith(
      photoUuid: freezed == photoUuid
          ? _self.photoUuid
          : photoUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewPhotoDM].
extension ReviewPhotoDMPatterns on ReviewPhotoDM {
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
    TResult Function(_ReviewPhotoDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewPhotoDM() when $default != null:
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
    TResult Function(_ReviewPhotoDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPhotoDM():
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
    TResult? Function(_ReviewPhotoDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPhotoDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'photo_uuid') String? photoUuid,
            @JsonKey(name: 'photo_url') String? photoUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewPhotoDM() when $default != null:
        return $default(_that.photoUuid, _that.photoUrl);
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
    TResult Function(@JsonKey(name: 'photo_uuid') String? photoUuid,
            @JsonKey(name: 'photo_url') String? photoUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPhotoDM():
        return $default(_that.photoUuid, _that.photoUrl);
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
    TResult? Function(@JsonKey(name: 'photo_uuid') String? photoUuid,
            @JsonKey(name: 'photo_url') String? photoUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPhotoDM() when $default != null:
        return $default(_that.photoUuid, _that.photoUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewPhotoDM implements ReviewPhotoDM {
  const _ReviewPhotoDM(
      {@JsonKey(name: 'photo_uuid') this.photoUuid,
      @JsonKey(name: 'photo_url') this.photoUrl});
  factory _ReviewPhotoDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewPhotoDMFromJson(json);

  @override
  @JsonKey(name: 'photo_uuid')
  final String? photoUuid;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewPhotoDMCopyWith<_ReviewPhotoDM> get copyWith =>
      __$ReviewPhotoDMCopyWithImpl<_ReviewPhotoDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewPhotoDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewPhotoDM &&
            (identical(other.photoUuid, photoUuid) ||
                other.photoUuid == photoUuid) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, photoUuid, photoUrl);

  @override
  String toString() {
    return 'ReviewPhotoDM(photoUuid: $photoUuid, photoUrl: $photoUrl)';
  }
}

/// @nodoc
abstract mixin class _$ReviewPhotoDMCopyWith<$Res>
    implements $ReviewPhotoDMCopyWith<$Res> {
  factory _$ReviewPhotoDMCopyWith(
          _ReviewPhotoDM value, $Res Function(_ReviewPhotoDM) _then) =
      __$ReviewPhotoDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'photo_uuid') String? photoUuid,
      @JsonKey(name: 'photo_url') String? photoUrl});
}

/// @nodoc
class __$ReviewPhotoDMCopyWithImpl<$Res>
    implements _$ReviewPhotoDMCopyWith<$Res> {
  __$ReviewPhotoDMCopyWithImpl(this._self, this._then);

  final _ReviewPhotoDM _self;
  final $Res Function(_ReviewPhotoDM) _then;

  /// Create a copy of ReviewPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? photoUuid = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_ReviewPhotoDM(
      photoUuid: freezed == photoUuid
          ? _self.photoUuid
          : photoUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ReviewDM {
  @JsonKey(name: 'review_id')
  int? get reviewId;
  @JsonKey(name: 'review_uuid')
  String? get reviewUuid;
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType;
  int get rating;
  String? get comment;
  List<ReviewPhotoDM> get photos;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @JsonKey(name: 'business_name')
  String? get businessName;
  @JsonKey(name: 'business_photo')
  String? get businessPhoto;
  @JsonKey(name: 'user_uuid')
  String? get userUuid;
  @JsonKey(name: 'user_name')
  String? get userName;
  @JsonKey(name: 'user_photo')
  String? get userPhoto;
  @JsonKey(name: 'business_visited_at')
  DateTime? get businessVisitedAt;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewDMCopyWith<ReviewDM> get copyWith =>
      _$ReviewDMCopyWithImpl<ReviewDM>(this as ReviewDM, _$identity);

  /// Serializes this ReviewDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewDM &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.reviewUuid, reviewUuid) ||
                other.reviewUuid == reviewUuid) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
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
      const DeepCollectionEquality().hash(photos),
      businessUuid,
      businessName,
      businessPhoto,
      userUuid,
      userName,
      userPhoto,
      businessVisitedAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ReviewDM(reviewId: $reviewId, reviewUuid: $reviewUuid, reviewType: $reviewType, rating: $rating, comment: $comment, photos: $photos, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, businessVisitedAt: $businessVisitedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewDMCopyWith<$Res> {
  factory $ReviewDMCopyWith(ReviewDM value, $Res Function(ReviewDM) _then) =
      _$ReviewDMCopyWithImpl;
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
class _$ReviewDMCopyWithImpl<$Res> implements $ReviewDMCopyWith<$Res> {
  _$ReviewDMCopyWithImpl(this._self, this._then);

  final ReviewDM _self;
  final $Res Function(ReviewDM) _then;

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
    return _then(_self.copyWith(
      reviewId: freezed == reviewId
          ? _self.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewUuid: freezed == reviewUuid
          ? _self.reviewUuid
          : reviewUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewType: freezed == reviewType
          ? _self.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ReviewPhotoDM>,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _self.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userUuid: freezed == userUuid
          ? _self.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _self.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _self.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewDM].
extension ReviewDMPatterns on ReviewDM {
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
    TResult Function(_ReviewDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewDM() when $default != null:
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
    TResult Function(_ReviewDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewDM():
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
    TResult? Function(_ReviewDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewDM() when $default != null:
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
            @JsonKey(name: 'review_id') int? reviewId,
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
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewDM() when $default != null:
        return $default(
            _that.reviewId,
            _that.reviewUuid,
            _that.reviewType,
            _that.rating,
            _that.comment,
            _that.photos,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.businessVisitedAt,
            _that.createdAt,
            _that.updatedAt);
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
            @JsonKey(name: 'review_id') int? reviewId,
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
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewDM():
        return $default(
            _that.reviewId,
            _that.reviewUuid,
            _that.reviewType,
            _that.rating,
            _that.comment,
            _that.photos,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.businessVisitedAt,
            _that.createdAt,
            _that.updatedAt);
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
            @JsonKey(name: 'review_id') int? reviewId,
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
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewDM() when $default != null:
        return $default(
            _that.reviewId,
            _that.reviewUuid,
            _that.reviewType,
            _that.rating,
            _that.comment,
            _that.photos,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.businessVisitedAt,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewDM extends ReviewDM {
  const _ReviewDM(
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
  factory _ReviewDM.fromJson(Map<String, dynamic> json) =>
      _$ReviewDMFromJson(json);

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

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewDMCopyWith<_ReviewDM> get copyWith =>
      __$ReviewDMCopyWithImpl<_ReviewDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewDM &&
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

  @override
  String toString() {
    return 'ReviewDM(reviewId: $reviewId, reviewUuid: $reviewUuid, reviewType: $reviewType, rating: $rating, comment: $comment, photos: $photos, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, businessVisitedAt: $businessVisitedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ReviewDMCopyWith<$Res>
    implements $ReviewDMCopyWith<$Res> {
  factory _$ReviewDMCopyWith(_ReviewDM value, $Res Function(_ReviewDM) _then) =
      __$ReviewDMCopyWithImpl;
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
class __$ReviewDMCopyWithImpl<$Res> implements _$ReviewDMCopyWith<$Res> {
  __$ReviewDMCopyWithImpl(this._self, this._then);

  final _ReviewDM _self;
  final $Res Function(_ReviewDM) _then;

  /// Create a copy of ReviewDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ReviewDM(
      reviewId: freezed == reviewId
          ? _self.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewUuid: freezed == reviewUuid
          ? _self.reviewUuid
          : reviewUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewType: freezed == reviewType
          ? _self.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ReviewPhotoDM>,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _self.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userUuid: freezed == userUuid
          ? _self.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _self.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _self.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
