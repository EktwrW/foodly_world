// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'professional_profile_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfessionalProfileResponseDM _$ProfessionalProfileResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ProfessionalProfileResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ProfessionalProfileResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_profile')
  ProfessionalProfileDM? get professionalProfile =>
      throw _privateConstructorUsedError;

  /// Serializes this ProfessionalProfileResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessionalProfileResponseDMCopyWith<ProfessionalProfileResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionalProfileResponseDMCopyWith<$Res> {
  factory $ProfessionalProfileResponseDMCopyWith(
          ProfessionalProfileResponseDM value,
          $Res Function(ProfessionalProfileResponseDM) then) =
      _$ProfessionalProfileResponseDMCopyWithImpl<$Res,
          ProfessionalProfileResponseDM>;
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'professional_profile')
      ProfessionalProfileDM? professionalProfile});

  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile;
}

/// @nodoc
class _$ProfessionalProfileResponseDMCopyWithImpl<$Res,
        $Val extends ProfessionalProfileResponseDM>
    implements $ProfessionalProfileResponseDMCopyWith<$Res> {
  _$ProfessionalProfileResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? professionalProfile = freezed,
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
      professionalProfile: freezed == professionalProfile
          ? _value.professionalProfile
          : professionalProfile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
    ) as $Val);
  }

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile {
    if (_value.professionalProfile == null) {
      return null;
    }

    return $ProfessionalProfileDMCopyWith<$Res>(_value.professionalProfile!,
        (value) {
      return _then(_value.copyWith(professionalProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfessionalProfileResponseDMImplCopyWith<$Res>
    implements $ProfessionalProfileResponseDMCopyWith<$Res> {
  factory _$$ProfessionalProfileResponseDMImplCopyWith(
          _$ProfessionalProfileResponseDMImpl value,
          $Res Function(_$ProfessionalProfileResponseDMImpl) then) =
      __$$ProfessionalProfileResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'professional_profile')
      ProfessionalProfileDM? professionalProfile});

  @override
  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile;
}

/// @nodoc
class __$$ProfessionalProfileResponseDMImplCopyWithImpl<$Res>
    extends _$ProfessionalProfileResponseDMCopyWithImpl<$Res,
        _$ProfessionalProfileResponseDMImpl>
    implements _$$ProfessionalProfileResponseDMImplCopyWith<$Res> {
  __$$ProfessionalProfileResponseDMImplCopyWithImpl(
      _$ProfessionalProfileResponseDMImpl _value,
      $Res Function(_$ProfessionalProfileResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? professionalProfile = freezed,
  }) {
    return _then(_$ProfessionalProfileResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      professionalProfile: freezed == professionalProfile
          ? _value.professionalProfile
          : professionalProfile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfessionalProfileResponseDMImpl
    implements _ProfessionalProfileResponseDM {
  const _$ProfessionalProfileResponseDMImpl(
      {this.success = false,
      this.message = '',
      @JsonKey(name: 'professional_profile') this.professionalProfile});

  factory _$ProfessionalProfileResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProfessionalProfileResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'professional_profile')
  final ProfessionalProfileDM? professionalProfile;

  @override
  String toString() {
    return 'ProfessionalProfileResponseDM(success: $success, message: $message, professionalProfile: $professionalProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessionalProfileResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.professionalProfile, professionalProfile) ||
                other.professionalProfile == professionalProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, professionalProfile);

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessionalProfileResponseDMImplCopyWith<
          _$ProfessionalProfileResponseDMImpl>
      get copyWith => __$$ProfessionalProfileResponseDMImplCopyWithImpl<
          _$ProfessionalProfileResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessionalProfileResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ProfessionalProfileResponseDM
    implements ProfessionalProfileResponseDM {
  const factory _ProfessionalProfileResponseDM(
          {final bool success,
          final String message,
          @JsonKey(name: 'professional_profile')
          final ProfessionalProfileDM? professionalProfile}) =
      _$ProfessionalProfileResponseDMImpl;

  factory _ProfessionalProfileResponseDM.fromJson(Map<String, dynamic> json) =
      _$ProfessionalProfileResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  @JsonKey(name: 'professional_profile')
  ProfessionalProfileDM? get professionalProfile;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessionalProfileResponseDMImplCopyWith<
          _$ProfessionalProfileResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProfessionalProfileDM _$ProfessionalProfileDMFromJson(
    Map<String, dynamic> json) {
  return _ProfessionalProfileDM.fromJson(json);
}

/// @nodoc
mixin _$ProfessionalProfileDM {
  int? get id => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_id')
  int? get businessId => throw _privateConstructorUsedError;
  List<String> get specialties => throw _privateConstructorUsedError;
  List<String> get cuisines => throw _privateConstructorUsedError;
  @JsonKey(name: 'years_experience')
  int? get yearsExperience => throw _privateConstructorUsedError;
  List<String> get certifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'languages_spoken')
  List<String> get languagesSpoken => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_size')
  TeamSize? get teamSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
  double? get serviceRadiusKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
  double? get travelFeePerKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
  double? get minBookingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_booking_currency')
  String? get minBookingCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_required')
  bool get depositRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
  double? get depositPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_policy')
  CancellationPolicy? get cancellationPolicy =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_policy_text')
  String? get cancellationPolicyText => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_insurance')
  bool get hasInsurance => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'portfolio_video_url')
  String? get portfolioVideoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'press_mentions')
  List<String> get pressMentions => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProfessionalProfileDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessionalProfileDMCopyWith<ProfessionalProfileDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionalProfileDMCopyWith<$Res> {
  factory $ProfessionalProfileDMCopyWith(ProfessionalProfileDM value,
          $Res Function(ProfessionalProfileDM) then) =
      _$ProfessionalProfileDMCopyWithImpl<$Res, ProfessionalProfileDM>;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      List<String> specialties,
      List<String> cuisines,
      @JsonKey(name: 'years_experience') int? yearsExperience,
      List<String> certifications,
      @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
      @JsonKey(name: 'team_size') TeamSize? teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      double? serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      double? travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      double? minBookingAmount,
      @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
      @JsonKey(name: 'deposit_required') bool depositRequired,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      double? depositPercentage,
      @JsonKey(name: 'cancellation_policy')
      CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text') String? cancellationPolicyText,
      @JsonKey(name: 'has_insurance') bool hasInsurance,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
      @JsonKey(name: 'press_mentions') List<String> pressMentions,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ProfessionalProfileDMCopyWithImpl<$Res,
        $Val extends ProfessionalProfileDM>
    implements $ProfessionalProfileDMCopyWith<$Res> {
  _$ProfessionalProfileDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? businessId = freezed,
    Object? specialties = null,
    Object? cuisines = null,
    Object? yearsExperience = freezed,
    Object? certifications = null,
    Object? languagesSpoken = null,
    Object? teamSize = freezed,
    Object? serviceRadiusKm = freezed,
    Object? travelFeePerKm = freezed,
    Object? minBookingAmount = freezed,
    Object? minBookingCurrency = freezed,
    Object? depositRequired = null,
    Object? depositPercentage = freezed,
    Object? cancellationPolicy = freezed,
    Object? cancellationPolicyText = freezed,
    Object? hasInsurance = null,
    Object? isVerified = null,
    Object? verifiedAt = freezed,
    Object? portfolioVideoUrl = freezed,
    Object? pressMentions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      specialties: null == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cuisines: null == cuisines
          ? _value.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      yearsExperience: freezed == yearsExperience
          ? _value.yearsExperience
          : yearsExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      certifications: null == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languagesSpoken: null == languagesSpoken
          ? _value.languagesSpoken
          : languagesSpoken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamSize: freezed == teamSize
          ? _value.teamSize
          : teamSize // ignore: cast_nullable_to_non_nullable
              as TeamSize?,
      serviceRadiusKm: freezed == serviceRadiusKm
          ? _value.serviceRadiusKm
          : serviceRadiusKm // ignore: cast_nullable_to_non_nullable
              as double?,
      travelFeePerKm: freezed == travelFeePerKm
          ? _value.travelFeePerKm
          : travelFeePerKm // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingAmount: freezed == minBookingAmount
          ? _value.minBookingAmount
          : minBookingAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingCurrency: freezed == minBookingCurrency
          ? _value.minBookingCurrency
          : minBookingCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      depositRequired: null == depositRequired
          ? _value.depositRequired
          : depositRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      depositPercentage: freezed == depositPercentage
          ? _value.depositPercentage
          : depositPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      cancellationPolicy: freezed == cancellationPolicy
          ? _value.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as CancellationPolicy?,
      cancellationPolicyText: freezed == cancellationPolicyText
          ? _value.cancellationPolicyText
          : cancellationPolicyText // ignore: cast_nullable_to_non_nullable
              as String?,
      hasInsurance: null == hasInsurance
          ? _value.hasInsurance
          : hasInsurance // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      portfolioVideoUrl: freezed == portfolioVideoUrl
          ? _value.portfolioVideoUrl
          : portfolioVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pressMentions: null == pressMentions
          ? _value.pressMentions
          : pressMentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$ProfessionalProfileDMImplCopyWith<$Res>
    implements $ProfessionalProfileDMCopyWith<$Res> {
  factory _$$ProfessionalProfileDMImplCopyWith(
          _$ProfessionalProfileDMImpl value,
          $Res Function(_$ProfessionalProfileDMImpl) then) =
      __$$ProfessionalProfileDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      List<String> specialties,
      List<String> cuisines,
      @JsonKey(name: 'years_experience') int? yearsExperience,
      List<String> certifications,
      @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
      @JsonKey(name: 'team_size') TeamSize? teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      double? serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      double? travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      double? minBookingAmount,
      @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
      @JsonKey(name: 'deposit_required') bool depositRequired,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      double? depositPercentage,
      @JsonKey(name: 'cancellation_policy')
      CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text') String? cancellationPolicyText,
      @JsonKey(name: 'has_insurance') bool hasInsurance,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
      @JsonKey(name: 'press_mentions') List<String> pressMentions,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$ProfessionalProfileDMImplCopyWithImpl<$Res>
    extends _$ProfessionalProfileDMCopyWithImpl<$Res,
        _$ProfessionalProfileDMImpl>
    implements _$$ProfessionalProfileDMImplCopyWith<$Res> {
  __$$ProfessionalProfileDMImplCopyWithImpl(_$ProfessionalProfileDMImpl _value,
      $Res Function(_$ProfessionalProfileDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? businessId = freezed,
    Object? specialties = null,
    Object? cuisines = null,
    Object? yearsExperience = freezed,
    Object? certifications = null,
    Object? languagesSpoken = null,
    Object? teamSize = freezed,
    Object? serviceRadiusKm = freezed,
    Object? travelFeePerKm = freezed,
    Object? minBookingAmount = freezed,
    Object? minBookingCurrency = freezed,
    Object? depositRequired = null,
    Object? depositPercentage = freezed,
    Object? cancellationPolicy = freezed,
    Object? cancellationPolicyText = freezed,
    Object? hasInsurance = null,
    Object? isVerified = null,
    Object? verifiedAt = freezed,
    Object? portfolioVideoUrl = freezed,
    Object? pressMentions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProfessionalProfileDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      specialties: null == specialties
          ? _value._specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cuisines: null == cuisines
          ? _value._cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      yearsExperience: freezed == yearsExperience
          ? _value.yearsExperience
          : yearsExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      certifications: null == certifications
          ? _value._certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languagesSpoken: null == languagesSpoken
          ? _value._languagesSpoken
          : languagesSpoken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamSize: freezed == teamSize
          ? _value.teamSize
          : teamSize // ignore: cast_nullable_to_non_nullable
              as TeamSize?,
      serviceRadiusKm: freezed == serviceRadiusKm
          ? _value.serviceRadiusKm
          : serviceRadiusKm // ignore: cast_nullable_to_non_nullable
              as double?,
      travelFeePerKm: freezed == travelFeePerKm
          ? _value.travelFeePerKm
          : travelFeePerKm // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingAmount: freezed == minBookingAmount
          ? _value.minBookingAmount
          : minBookingAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingCurrency: freezed == minBookingCurrency
          ? _value.minBookingCurrency
          : minBookingCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      depositRequired: null == depositRequired
          ? _value.depositRequired
          : depositRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      depositPercentage: freezed == depositPercentage
          ? _value.depositPercentage
          : depositPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      cancellationPolicy: freezed == cancellationPolicy
          ? _value.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as CancellationPolicy?,
      cancellationPolicyText: freezed == cancellationPolicyText
          ? _value.cancellationPolicyText
          : cancellationPolicyText // ignore: cast_nullable_to_non_nullable
              as String?,
      hasInsurance: null == hasInsurance
          ? _value.hasInsurance
          : hasInsurance // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      portfolioVideoUrl: freezed == portfolioVideoUrl
          ? _value.portfolioVideoUrl
          : portfolioVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pressMentions: null == pressMentions
          ? _value._pressMentions
          : pressMentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$ProfessionalProfileDMImpl extends _ProfessionalProfileDM {
  const _$ProfessionalProfileDMImpl(
      {this.id,
      this.uuid,
      @JsonKey(name: 'business_id') this.businessId,
      final List<String> specialties = const [],
      final List<String> cuisines = const [],
      @JsonKey(name: 'years_experience') this.yearsExperience,
      final List<String> certifications = const [],
      @JsonKey(name: 'languages_spoken')
      final List<String> languagesSpoken = const [],
      @JsonKey(name: 'team_size') this.teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      this.serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      this.travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      this.minBookingAmount,
      @JsonKey(name: 'min_booking_currency') this.minBookingCurrency,
      @JsonKey(name: 'deposit_required') this.depositRequired = false,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      this.depositPercentage,
      @JsonKey(name: 'cancellation_policy') this.cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text') this.cancellationPolicyText,
      @JsonKey(name: 'has_insurance') this.hasInsurance = false,
      @JsonKey(name: 'is_verified') this.isVerified = false,
      @JsonKey(name: 'verified_at') this.verifiedAt,
      @JsonKey(name: 'portfolio_video_url') this.portfolioVideoUrl,
      @JsonKey(name: 'press_mentions')
      final List<String> pressMentions = const [],
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _specialties = specialties,
        _cuisines = cuisines,
        _certifications = certifications,
        _languagesSpoken = languagesSpoken,
        _pressMentions = pressMentions,
        super._();

  factory _$ProfessionalProfileDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessionalProfileDMImplFromJson(json);

  @override
  final int? id;
  @override
  final String? uuid;
  @override
  @JsonKey(name: 'business_id')
  final int? businessId;
  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  final List<String> _cuisines;
  @override
  @JsonKey()
  List<String> get cuisines {
    if (_cuisines is EqualUnmodifiableListView) return _cuisines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cuisines);
  }

  @override
  @JsonKey(name: 'years_experience')
  final int? yearsExperience;
  final List<String> _certifications;
  @override
  @JsonKey()
  List<String> get certifications {
    if (_certifications is EqualUnmodifiableListView) return _certifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certifications);
  }

  final List<String> _languagesSpoken;
  @override
  @JsonKey(name: 'languages_spoken')
  List<String> get languagesSpoken {
    if (_languagesSpoken is EqualUnmodifiableListView) return _languagesSpoken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languagesSpoken);
  }

  @override
  @JsonKey(name: 'team_size')
  final TeamSize? teamSize;
  @override
  @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
  final double? serviceRadiusKm;
  @override
  @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
  final double? travelFeePerKm;
  @override
  @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
  final double? minBookingAmount;
  @override
  @JsonKey(name: 'min_booking_currency')
  final String? minBookingCurrency;
  @override
  @JsonKey(name: 'deposit_required')
  final bool depositRequired;
  @override
  @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
  final double? depositPercentage;
  @override
  @JsonKey(name: 'cancellation_policy')
  final CancellationPolicy? cancellationPolicy;
  @override
  @JsonKey(name: 'cancellation_policy_text')
  final String? cancellationPolicyText;
  @override
  @JsonKey(name: 'has_insurance')
  final bool hasInsurance;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;
  @override
  @JsonKey(name: 'portfolio_video_url')
  final String? portfolioVideoUrl;
  final List<String> _pressMentions;
  @override
  @JsonKey(name: 'press_mentions')
  List<String> get pressMentions {
    if (_pressMentions is EqualUnmodifiableListView) return _pressMentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pressMentions);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ProfessionalProfileDM(id: $id, uuid: $uuid, businessId: $businessId, specialties: $specialties, cuisines: $cuisines, yearsExperience: $yearsExperience, certifications: $certifications, languagesSpoken: $languagesSpoken, teamSize: $teamSize, serviceRadiusKm: $serviceRadiusKm, travelFeePerKm: $travelFeePerKm, minBookingAmount: $minBookingAmount, minBookingCurrency: $minBookingCurrency, depositRequired: $depositRequired, depositPercentage: $depositPercentage, cancellationPolicy: $cancellationPolicy, cancellationPolicyText: $cancellationPolicyText, hasInsurance: $hasInsurance, isVerified: $isVerified, verifiedAt: $verifiedAt, portfolioVideoUrl: $portfolioVideoUrl, pressMentions: $pressMentions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessionalProfileDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            const DeepCollectionEquality()
                .equals(other._specialties, _specialties) &&
            const DeepCollectionEquality().equals(other._cuisines, _cuisines) &&
            (identical(other.yearsExperience, yearsExperience) ||
                other.yearsExperience == yearsExperience) &&
            const DeepCollectionEquality()
                .equals(other._certifications, _certifications) &&
            const DeepCollectionEquality()
                .equals(other._languagesSpoken, _languagesSpoken) &&
            (identical(other.teamSize, teamSize) ||
                other.teamSize == teamSize) &&
            (identical(other.serviceRadiusKm, serviceRadiusKm) ||
                other.serviceRadiusKm == serviceRadiusKm) &&
            (identical(other.travelFeePerKm, travelFeePerKm) ||
                other.travelFeePerKm == travelFeePerKm) &&
            (identical(other.minBookingAmount, minBookingAmount) ||
                other.minBookingAmount == minBookingAmount) &&
            (identical(other.minBookingCurrency, minBookingCurrency) ||
                other.minBookingCurrency == minBookingCurrency) &&
            (identical(other.depositRequired, depositRequired) ||
                other.depositRequired == depositRequired) &&
            (identical(other.depositPercentage, depositPercentage) ||
                other.depositPercentage == depositPercentage) &&
            (identical(other.cancellationPolicy, cancellationPolicy) ||
                other.cancellationPolicy == cancellationPolicy) &&
            (identical(other.cancellationPolicyText, cancellationPolicyText) ||
                other.cancellationPolicyText == cancellationPolicyText) &&
            (identical(other.hasInsurance, hasInsurance) ||
                other.hasInsurance == hasInsurance) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.portfolioVideoUrl, portfolioVideoUrl) ||
                other.portfolioVideoUrl == portfolioVideoUrl) &&
            const DeepCollectionEquality()
                .equals(other._pressMentions, _pressMentions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        businessId,
        const DeepCollectionEquality().hash(_specialties),
        const DeepCollectionEquality().hash(_cuisines),
        yearsExperience,
        const DeepCollectionEquality().hash(_certifications),
        const DeepCollectionEquality().hash(_languagesSpoken),
        teamSize,
        serviceRadiusKm,
        travelFeePerKm,
        minBookingAmount,
        minBookingCurrency,
        depositRequired,
        depositPercentage,
        cancellationPolicy,
        cancellationPolicyText,
        hasInsurance,
        isVerified,
        verifiedAt,
        portfolioVideoUrl,
        const DeepCollectionEquality().hash(_pressMentions),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessionalProfileDMImplCopyWith<_$ProfessionalProfileDMImpl>
      get copyWith => __$$ProfessionalProfileDMImplCopyWithImpl<
          _$ProfessionalProfileDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessionalProfileDMImplToJson(
      this,
    );
  }
}

abstract class _ProfessionalProfileDM extends ProfessionalProfileDM {
  const factory _ProfessionalProfileDM(
      {final int? id,
      final String? uuid,
      @JsonKey(name: 'business_id') final int? businessId,
      final List<String> specialties,
      final List<String> cuisines,
      @JsonKey(name: 'years_experience') final int? yearsExperience,
      final List<String> certifications,
      @JsonKey(name: 'languages_spoken') final List<String> languagesSpoken,
      @JsonKey(name: 'team_size') final TeamSize? teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      final double? serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      final double? travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      final double? minBookingAmount,
      @JsonKey(name: 'min_booking_currency') final String? minBookingCurrency,
      @JsonKey(name: 'deposit_required') final bool depositRequired,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      final double? depositPercentage,
      @JsonKey(name: 'cancellation_policy')
      final CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text')
      final String? cancellationPolicyText,
      @JsonKey(name: 'has_insurance') final bool hasInsurance,
      @JsonKey(name: 'is_verified') final bool isVerified,
      @JsonKey(name: 'verified_at') final DateTime? verifiedAt,
      @JsonKey(name: 'portfolio_video_url') final String? portfolioVideoUrl,
      @JsonKey(name: 'press_mentions') final List<String> pressMentions,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$ProfessionalProfileDMImpl;
  const _ProfessionalProfileDM._() : super._();

  factory _ProfessionalProfileDM.fromJson(Map<String, dynamic> json) =
      _$ProfessionalProfileDMImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uuid;
  @override
  @JsonKey(name: 'business_id')
  int? get businessId;
  @override
  List<String> get specialties;
  @override
  List<String> get cuisines;
  @override
  @JsonKey(name: 'years_experience')
  int? get yearsExperience;
  @override
  List<String> get certifications;
  @override
  @JsonKey(name: 'languages_spoken')
  List<String> get languagesSpoken;
  @override
  @JsonKey(name: 'team_size')
  TeamSize? get teamSize;
  @override
  @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
  double? get serviceRadiusKm;
  @override
  @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
  double? get travelFeePerKm;
  @override
  @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
  double? get minBookingAmount;
  @override
  @JsonKey(name: 'min_booking_currency')
  String? get minBookingCurrency;
  @override
  @JsonKey(name: 'deposit_required')
  bool get depositRequired;
  @override
  @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
  double? get depositPercentage;
  @override
  @JsonKey(name: 'cancellation_policy')
  CancellationPolicy? get cancellationPolicy;
  @override
  @JsonKey(name: 'cancellation_policy_text')
  String? get cancellationPolicyText;
  @override
  @JsonKey(name: 'has_insurance')
  bool get hasInsurance;
  @override
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @override
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;
  @override
  @JsonKey(name: 'portfolio_video_url')
  String? get portfolioVideoUrl;
  @override
  @JsonKey(name: 'press_mentions')
  List<String> get pressMentions;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessionalProfileDMImplCopyWith<_$ProfessionalProfileDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
