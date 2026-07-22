// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_create_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewCreateDTO {
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  int get rating;
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType;
  String? get comment;
  @JsonKey(name: 'business_visited_at')
  String? get businessVisitedAt;

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewCreateDTOCopyWith<ReviewCreateDTO> get copyWith =>
      _$ReviewCreateDTOCopyWithImpl<ReviewCreateDTO>(
          this as ReviewCreateDTO, _$identity);

  /// Serializes this ReviewCreateDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewCreateDTO &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.businessVisitedAt, businessVisitedAt) ||
                other.businessVisitedAt == businessVisitedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, businessUuid, rating, reviewType,
      comment, businessVisitedAt);

  @override
  String toString() {
    return 'ReviewCreateDTO(businessUuid: $businessUuid, rating: $rating, reviewType: $reviewType, comment: $comment, businessVisitedAt: $businessVisitedAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewCreateDTOCopyWith<$Res> {
  factory $ReviewCreateDTOCopyWith(
          ReviewCreateDTO value, $Res Function(ReviewCreateDTO) _then) =
      _$ReviewCreateDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String businessUuid,
      int rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class _$ReviewCreateDTOCopyWithImpl<$Res>
    implements $ReviewCreateDTOCopyWith<$Res> {
  _$ReviewCreateDTOCopyWithImpl(this._self, this._then);

  final ReviewCreateDTO _self;
  final $Res Function(ReviewCreateDTO) _then;

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = null,
    Object? rating = null,
    Object? reviewType = freezed,
    Object? comment = freezed,
    Object? businessVisitedAt = freezed,
  }) {
    return _then(_self.copyWith(
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
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

/// Adds pattern-matching-related methods to [ReviewCreateDTO].
extension ReviewCreateDTOPatterns on ReviewCreateDTO {
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
    TResult Function(_ReviewCreateDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateDTO() when $default != null:
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
    TResult Function(_ReviewCreateDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateDTO():
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
    TResult? Function(_ReviewCreateDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateDTO() when $default != null:
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
            @JsonKey(name: 'business_uuid') String businessUuid,
            int rating,
            @JsonKey(name: 'review_type') ReviewType? reviewType,
            String? comment,
            @JsonKey(name: 'business_visited_at') String? businessVisitedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateDTO() when $default != null:
        return $default(_that.businessUuid, _that.rating, _that.reviewType,
            _that.comment, _that.businessVisitedAt);
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
            @JsonKey(name: 'business_uuid') String businessUuid,
            int rating,
            @JsonKey(name: 'review_type') ReviewType? reviewType,
            String? comment,
            @JsonKey(name: 'business_visited_at') String? businessVisitedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateDTO():
        return $default(_that.businessUuid, _that.rating, _that.reviewType,
            _that.comment, _that.businessVisitedAt);
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
            @JsonKey(name: 'business_uuid') String businessUuid,
            int rating,
            @JsonKey(name: 'review_type') ReviewType? reviewType,
            String? comment,
            @JsonKey(name: 'business_visited_at') String? businessVisitedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewCreateDTO() when $default != null:
        return $default(_that.businessUuid, _that.rating, _that.reviewType,
            _that.comment, _that.businessVisitedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewCreateDTO implements ReviewCreateDTO {
  const _ReviewCreateDTO(
      {@JsonKey(name: 'business_uuid') required this.businessUuid,
      required this.rating,
      @JsonKey(name: 'review_type') this.reviewType,
      this.comment,
      @JsonKey(name: 'business_visited_at') this.businessVisitedAt});
  factory _ReviewCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewCreateDTOFromJson(json);

  @override
  @JsonKey(name: 'business_uuid')
  final String businessUuid;
  @override
  final int rating;
  @override
  @JsonKey(name: 'review_type')
  final ReviewType? reviewType;
  @override
  final String? comment;
  @override
  @JsonKey(name: 'business_visited_at')
  final String? businessVisitedAt;

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewCreateDTOCopyWith<_ReviewCreateDTO> get copyWith =>
      __$ReviewCreateDTOCopyWithImpl<_ReviewCreateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewCreateDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewCreateDTO &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.businessVisitedAt, businessVisitedAt) ||
                other.businessVisitedAt == businessVisitedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, businessUuid, rating, reviewType,
      comment, businessVisitedAt);

  @override
  String toString() {
    return 'ReviewCreateDTO(businessUuid: $businessUuid, rating: $rating, reviewType: $reviewType, comment: $comment, businessVisitedAt: $businessVisitedAt)';
  }
}

/// @nodoc
abstract mixin class _$ReviewCreateDTOCopyWith<$Res>
    implements $ReviewCreateDTOCopyWith<$Res> {
  factory _$ReviewCreateDTOCopyWith(
          _ReviewCreateDTO value, $Res Function(_ReviewCreateDTO) _then) =
      __$ReviewCreateDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String businessUuid,
      int rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class __$ReviewCreateDTOCopyWithImpl<$Res>
    implements _$ReviewCreateDTOCopyWith<$Res> {
  __$ReviewCreateDTOCopyWithImpl(this._self, this._then);

  final _ReviewCreateDTO _self;
  final $Res Function(_ReviewCreateDTO) _then;

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businessUuid = null,
    Object? rating = null,
    Object? reviewType = freezed,
    Object? comment = freezed,
    Object? businessVisitedAt = freezed,
  }) {
    return _then(_ReviewCreateDTO(
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
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
