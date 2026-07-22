// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewUpdateDTO {
  int? get rating;
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType;
  String? get comment;
  @JsonKey(name: 'business_visited_at')
  String? get businessVisitedAt;

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewUpdateDTOCopyWith<ReviewUpdateDTO> get copyWith =>
      _$ReviewUpdateDTOCopyWithImpl<ReviewUpdateDTO>(
          this as ReviewUpdateDTO, _$identity);

  /// Serializes this ReviewUpdateDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewUpdateDTO &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.businessVisitedAt, businessVisitedAt) ||
                other.businessVisitedAt == businessVisitedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rating, reviewType, comment, businessVisitedAt);

  @override
  String toString() {
    return 'ReviewUpdateDTO(rating: $rating, reviewType: $reviewType, comment: $comment, businessVisitedAt: $businessVisitedAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewUpdateDTOCopyWith<$Res> {
  factory $ReviewUpdateDTOCopyWith(
          ReviewUpdateDTO value, $Res Function(ReviewUpdateDTO) _then) =
      _$ReviewUpdateDTOCopyWithImpl;
  @useResult
  $Res call(
      {int? rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class _$ReviewUpdateDTOCopyWithImpl<$Res>
    implements $ReviewUpdateDTOCopyWith<$Res> {
  _$ReviewUpdateDTOCopyWithImpl(this._self, this._then);

  final ReviewUpdateDTO _self;
  final $Res Function(ReviewUpdateDTO) _then;

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? reviewType = freezed,
    Object? comment = freezed,
    Object? businessVisitedAt = freezed,
  }) {
    return _then(_self.copyWith(
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewType: freezed == reviewType
          ? _self.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _self.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewUpdateDTO].
extension ReviewUpdateDTOPatterns on ReviewUpdateDTO {
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
    TResult Function(_ReviewUpdateDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateDTO() when $default != null:
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
    TResult Function(_ReviewUpdateDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateDTO():
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
    TResult? Function(_ReviewUpdateDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateDTO() when $default != null:
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
            int? rating,
            @JsonKey(name: 'review_type') ReviewType? reviewType,
            String? comment,
            @JsonKey(name: 'business_visited_at') String? businessVisitedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateDTO() when $default != null:
        return $default(_that.rating, _that.reviewType, _that.comment,
            _that.businessVisitedAt);
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
            int? rating,
            @JsonKey(name: 'review_type') ReviewType? reviewType,
            String? comment,
            @JsonKey(name: 'business_visited_at') String? businessVisitedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateDTO():
        return $default(_that.rating, _that.reviewType, _that.comment,
            _that.businessVisitedAt);
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
            int? rating,
            @JsonKey(name: 'review_type') ReviewType? reviewType,
            String? comment,
            @JsonKey(name: 'business_visited_at') String? businessVisitedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUpdateDTO() when $default != null:
        return $default(_that.rating, _that.reviewType, _that.comment,
            _that.businessVisitedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewUpdateDTO implements ReviewUpdateDTO {
  const _ReviewUpdateDTO(
      {this.rating,
      @JsonKey(name: 'review_type') this.reviewType,
      this.comment,
      @JsonKey(name: 'business_visited_at') this.businessVisitedAt});
  factory _ReviewUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewUpdateDTOFromJson(json);

  @override
  final int? rating;
  @override
  @JsonKey(name: 'review_type')
  final ReviewType? reviewType;
  @override
  final String? comment;
  @override
  @JsonKey(name: 'business_visited_at')
  final String? businessVisitedAt;

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewUpdateDTOCopyWith<_ReviewUpdateDTO> get copyWith =>
      __$ReviewUpdateDTOCopyWithImpl<_ReviewUpdateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewUpdateDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewUpdateDTO &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.businessVisitedAt, businessVisitedAt) ||
                other.businessVisitedAt == businessVisitedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rating, reviewType, comment, businessVisitedAt);

  @override
  String toString() {
    return 'ReviewUpdateDTO(rating: $rating, reviewType: $reviewType, comment: $comment, businessVisitedAt: $businessVisitedAt)';
  }
}

/// @nodoc
abstract mixin class _$ReviewUpdateDTOCopyWith<$Res>
    implements $ReviewUpdateDTOCopyWith<$Res> {
  factory _$ReviewUpdateDTOCopyWith(
          _ReviewUpdateDTO value, $Res Function(_ReviewUpdateDTO) _then) =
      __$ReviewUpdateDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class __$ReviewUpdateDTOCopyWithImpl<$Res>
    implements _$ReviewUpdateDTOCopyWith<$Res> {
  __$ReviewUpdateDTOCopyWithImpl(this._self, this._then);

  final _ReviewUpdateDTO _self;
  final $Res Function(_ReviewUpdateDTO) _then;

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rating = freezed,
    Object? reviewType = freezed,
    Object? comment = freezed,
    Object? businessVisitedAt = freezed,
  }) {
    return _then(_ReviewUpdateDTO(
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewType: freezed == reviewType
          ? _self.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _self.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
