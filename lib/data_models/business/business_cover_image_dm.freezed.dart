// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_cover_image_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessCoverImageDM _$BusinessCoverImageDMFromJson(Map<String, dynamic> json) {
  return _BusinessCoverImageDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessCoverImageDM {
  @JsonKey(name: 'id', fromJson: _intFromJson)
  int? get intId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_image_uuid')
  String? get imageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_image_path')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_id', fromJson: _intFromJson)
  int? get businessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get dateUpdated => throw _privateConstructorUsedError;

  /// Serializes this BusinessCoverImageDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessCoverImageDMCopyWith<BusinessCoverImageDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessCoverImageDMCopyWith<$Res> {
  factory $BusinessCoverImageDMCopyWith(BusinessCoverImageDM value,
          $Res Function(BusinessCoverImageDM) then) =
      _$BusinessCoverImageDMCopyWithImpl<$Res, BusinessCoverImageDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
      @JsonKey(name: 'business_image_uuid') String? imageId,
      @JsonKey(name: 'business_image_path') String? url,
      @JsonKey(name: 'business_id', fromJson: _intFromJson) int? businessId,
      @JsonKey(name: 'created_at') DateTime? dateCreated,
      @JsonKey(name: 'updated_at') DateTime? dateUpdated});
}

/// @nodoc
class _$BusinessCoverImageDMCopyWithImpl<$Res,
        $Val extends BusinessCoverImageDM>
    implements $BusinessCoverImageDMCopyWith<$Res> {
  _$BusinessCoverImageDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = freezed,
    Object? imageId = freezed,
    Object? url = freezed,
    Object? businessId = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      intId: freezed == intId
          ? _value.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessCoverImageDMImplCopyWith<$Res>
    implements $BusinessCoverImageDMCopyWith<$Res> {
  factory _$$BusinessCoverImageDMImplCopyWith(_$BusinessCoverImageDMImpl value,
          $Res Function(_$BusinessCoverImageDMImpl) then) =
      __$$BusinessCoverImageDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
      @JsonKey(name: 'business_image_uuid') String? imageId,
      @JsonKey(name: 'business_image_path') String? url,
      @JsonKey(name: 'business_id', fromJson: _intFromJson) int? businessId,
      @JsonKey(name: 'created_at') DateTime? dateCreated,
      @JsonKey(name: 'updated_at') DateTime? dateUpdated});
}

/// @nodoc
class __$$BusinessCoverImageDMImplCopyWithImpl<$Res>
    extends _$BusinessCoverImageDMCopyWithImpl<$Res, _$BusinessCoverImageDMImpl>
    implements _$$BusinessCoverImageDMImplCopyWith<$Res> {
  __$$BusinessCoverImageDMImplCopyWithImpl(_$BusinessCoverImageDMImpl _value,
      $Res Function(_$BusinessCoverImageDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = freezed,
    Object? imageId = freezed,
    Object? url = freezed,
    Object? businessId = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_$BusinessCoverImageDMImpl(
      intId: freezed == intId
          ? _value.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessCoverImageDMImpl extends _BusinessCoverImageDM {
  const _$BusinessCoverImageDMImpl(
      {@JsonKey(name: 'id', fromJson: _intFromJson) this.intId,
      @JsonKey(name: 'business_image_uuid') this.imageId,
      @JsonKey(name: 'business_image_path') this.url,
      @JsonKey(name: 'business_id', fromJson: _intFromJson) this.businessId,
      @JsonKey(name: 'created_at') this.dateCreated,
      @JsonKey(name: 'updated_at') this.dateUpdated})
      : super._();

  factory _$BusinessCoverImageDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessCoverImageDMImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: _intFromJson)
  final int? intId;
  @override
  @JsonKey(name: 'business_image_uuid')
  final String? imageId;
  @override
  @JsonKey(name: 'business_image_path')
  final String? url;
  @override
  @JsonKey(name: 'business_id', fromJson: _intFromJson)
  final int? businessId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? dateCreated;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? dateUpdated;

  @override
  String toString() {
    return 'BusinessCoverImageDM(intId: $intId, imageId: $imageId, url: $url, businessId: $businessId, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessCoverImageDMImpl &&
            (identical(other.intId, intId) || other.intId == intId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, intId, imageId, url, businessId, dateCreated, dateUpdated);

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessCoverImageDMImplCopyWith<_$BusinessCoverImageDMImpl>
      get copyWith =>
          __$$BusinessCoverImageDMImplCopyWithImpl<_$BusinessCoverImageDMImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessCoverImageDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessCoverImageDM extends BusinessCoverImageDM {
  const factory _BusinessCoverImageDM(
          {@JsonKey(name: 'id', fromJson: _intFromJson) final int? intId,
          @JsonKey(name: 'business_image_uuid') final String? imageId,
          @JsonKey(name: 'business_image_path') final String? url,
          @JsonKey(name: 'business_id', fromJson: _intFromJson)
          final int? businessId,
          @JsonKey(name: 'created_at') final DateTime? dateCreated,
          @JsonKey(name: 'updated_at') final DateTime? dateUpdated}) =
      _$BusinessCoverImageDMImpl;
  const _BusinessCoverImageDM._() : super._();

  factory _BusinessCoverImageDM.fromJson(Map<String, dynamic> json) =
      _$BusinessCoverImageDMImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: _intFromJson)
  int? get intId;
  @override
  @JsonKey(name: 'business_image_uuid')
  String? get imageId;
  @override
  @JsonKey(name: 'business_image_path')
  String? get url;
  @override
  @JsonKey(name: 'business_id', fromJson: _intFromJson)
  int? get businessId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get dateCreated;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get dateUpdated;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessCoverImageDMImplCopyWith<_$BusinessCoverImageDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
