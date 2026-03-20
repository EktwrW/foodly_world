// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_update_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewUpdateDTO _$ReviewUpdateDTOFromJson(Map<String, dynamic> json) {
  return _ReviewUpdateDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewUpdateDTO {
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_visited_at')
  String? get businessVisitedAt => throw _privateConstructorUsedError;

  /// Serializes this ReviewUpdateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewUpdateDTOCopyWith<ReviewUpdateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUpdateDTOCopyWith<$Res> {
  factory $ReviewUpdateDTOCopyWith(
          ReviewUpdateDTO value, $Res Function(ReviewUpdateDTO) then) =
      _$ReviewUpdateDTOCopyWithImpl<$Res, ReviewUpdateDTO>;
  @useResult
  $Res call(
      {int? rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class _$ReviewUpdateDTOCopyWithImpl<$Res, $Val extends ReviewUpdateDTO>
    implements $ReviewUpdateDTOCopyWith<$Res> {
  _$ReviewUpdateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewType: freezed == reviewType
          ? _value.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _value.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewUpdateDTOImplCopyWith<$Res>
    implements $ReviewUpdateDTOCopyWith<$Res> {
  factory _$$ReviewUpdateDTOImplCopyWith(_$ReviewUpdateDTOImpl value,
          $Res Function(_$ReviewUpdateDTOImpl) then) =
      __$$ReviewUpdateDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class __$$ReviewUpdateDTOImplCopyWithImpl<$Res>
    extends _$ReviewUpdateDTOCopyWithImpl<$Res, _$ReviewUpdateDTOImpl>
    implements _$$ReviewUpdateDTOImplCopyWith<$Res> {
  __$$ReviewUpdateDTOImplCopyWithImpl(
      _$ReviewUpdateDTOImpl _value, $Res Function(_$ReviewUpdateDTOImpl) _then)
      : super(_value, _then);

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
    return _then(_$ReviewUpdateDTOImpl(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewType: freezed == reviewType
          ? _value.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewType?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      businessVisitedAt: freezed == businessVisitedAt
          ? _value.businessVisitedAt
          : businessVisitedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewUpdateDTOImpl implements _ReviewUpdateDTO {
  const _$ReviewUpdateDTOImpl(
      {this.rating,
      @JsonKey(name: 'review_type') this.reviewType,
      this.comment,
      @JsonKey(name: 'business_visited_at') this.businessVisitedAt});

  factory _$ReviewUpdateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewUpdateDTOImplFromJson(json);

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

  @override
  String toString() {
    return 'ReviewUpdateDTO(rating: $rating, reviewType: $reviewType, comment: $comment, businessVisitedAt: $businessVisitedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewUpdateDTOImpl &&
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

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewUpdateDTOImplCopyWith<_$ReviewUpdateDTOImpl> get copyWith =>
      __$$ReviewUpdateDTOImplCopyWithImpl<_$ReviewUpdateDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewUpdateDTOImplToJson(
      this,
    );
  }
}

abstract class _ReviewUpdateDTO implements ReviewUpdateDTO {
  const factory _ReviewUpdateDTO(
      {final int? rating,
      @JsonKey(name: 'review_type') final ReviewType? reviewType,
      final String? comment,
      @JsonKey(name: 'business_visited_at')
      final String? businessVisitedAt}) = _$ReviewUpdateDTOImpl;

  factory _ReviewUpdateDTO.fromJson(Map<String, dynamic> json) =
      _$ReviewUpdateDTOImpl.fromJson;

  @override
  int? get rating;
  @override
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType;
  @override
  String? get comment;
  @override
  @JsonKey(name: 'business_visited_at')
  String? get businessVisitedAt;

  /// Create a copy of ReviewUpdateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewUpdateDTOImplCopyWith<_$ReviewUpdateDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
