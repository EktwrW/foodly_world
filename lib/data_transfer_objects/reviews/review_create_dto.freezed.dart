// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_create_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewCreateDTO _$ReviewCreateDTOFromJson(Map<String, dynamic> json) {
  return _ReviewCreateDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewCreateDTO {
  @JsonKey(name: 'business_uuid')
  String get businessUuid => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_visited_at')
  String? get businessVisitedAt => throw _privateConstructorUsedError;

  /// Serializes this ReviewCreateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCreateDTOCopyWith<ReviewCreateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCreateDTOCopyWith<$Res> {
  factory $ReviewCreateDTOCopyWith(
          ReviewCreateDTO value, $Res Function(ReviewCreateDTO) then) =
      _$ReviewCreateDTOCopyWithImpl<$Res, ReviewCreateDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String businessUuid,
      int rating,
      @JsonKey(name: 'review_type') ReviewType? reviewType,
      String? comment,
      @JsonKey(name: 'business_visited_at') String? businessVisitedAt});
}

/// @nodoc
class _$ReviewCreateDTOCopyWithImpl<$Res, $Val extends ReviewCreateDTO>
    implements $ReviewCreateDTOCopyWith<$Res> {
  _$ReviewCreateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$ReviewCreateDTOImplCopyWith<$Res>
    implements $ReviewCreateDTOCopyWith<$Res> {
  factory _$$ReviewCreateDTOImplCopyWith(_$ReviewCreateDTOImpl value,
          $Res Function(_$ReviewCreateDTOImpl) then) =
      __$$ReviewCreateDTOImplCopyWithImpl<$Res>;
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
class __$$ReviewCreateDTOImplCopyWithImpl<$Res>
    extends _$ReviewCreateDTOCopyWithImpl<$Res, _$ReviewCreateDTOImpl>
    implements _$$ReviewCreateDTOImplCopyWith<$Res> {
  __$$ReviewCreateDTOImplCopyWithImpl(
      _$ReviewCreateDTOImpl _value, $Res Function(_$ReviewCreateDTOImpl) _then)
      : super(_value, _then);

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
    return _then(_$ReviewCreateDTOImpl(
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$ReviewCreateDTOImpl implements _ReviewCreateDTO {
  const _$ReviewCreateDTOImpl(
      {@JsonKey(name: 'business_uuid') required this.businessUuid,
      required this.rating,
      @JsonKey(name: 'review_type') this.reviewType,
      this.comment,
      @JsonKey(name: 'business_visited_at') this.businessVisitedAt});

  factory _$ReviewCreateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCreateDTOImplFromJson(json);

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

  @override
  String toString() {
    return 'ReviewCreateDTO(businessUuid: $businessUuid, rating: $rating, reviewType: $reviewType, comment: $comment, businessVisitedAt: $businessVisitedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCreateDTOImpl &&
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

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCreateDTOImplCopyWith<_$ReviewCreateDTOImpl> get copyWith =>
      __$$ReviewCreateDTOImplCopyWithImpl<_$ReviewCreateDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCreateDTOImplToJson(
      this,
    );
  }
}

abstract class _ReviewCreateDTO implements ReviewCreateDTO {
  const factory _ReviewCreateDTO(
      {@JsonKey(name: 'business_uuid') required final String businessUuid,
      required final int rating,
      @JsonKey(name: 'review_type') final ReviewType? reviewType,
      final String? comment,
      @JsonKey(name: 'business_visited_at')
      final String? businessVisitedAt}) = _$ReviewCreateDTOImpl;

  factory _ReviewCreateDTO.fromJson(Map<String, dynamic> json) =
      _$ReviewCreateDTOImpl.fromJson;

  @override
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @override
  int get rating;
  @override
  @JsonKey(name: 'review_type')
  ReviewType? get reviewType;
  @override
  String? get comment;
  @override
  @JsonKey(name: 'business_visited_at')
  String? get businessVisitedAt;

  /// Create a copy of ReviewCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCreateDTOImplCopyWith<_$ReviewCreateDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
