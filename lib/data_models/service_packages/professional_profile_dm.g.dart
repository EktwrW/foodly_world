// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_profile_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfessionalProfileResponseDMImpl
    _$$ProfessionalProfileResponseDMImplFromJson(Map<String, dynamic> json) =>
        _$ProfessionalProfileResponseDMImpl(
          success: json['success'] as bool? ?? false,
          message: json['message'] as String? ?? '',
          professionalProfile: json['professional_profile'] == null
              ? null
              : ProfessionalProfileDM.fromJson(
                  json['professional_profile'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ProfessionalProfileResponseDMImplToJson(
        _$ProfessionalProfileResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.professionalProfile?.toJson() case final value?)
        'professional_profile': value,
    };

_$ProfessionalProfileDMImpl _$$ProfessionalProfileDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfessionalProfileDMImpl(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      businessId: (json['business_id'] as num?)?.toInt(),
      specialties: (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cuisines: (json['cuisines'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      yearsExperience: (json['years_experience'] as num?)?.toInt(),
      certifications: (json['certifications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      languagesSpoken: (json['languages_spoken'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      teamSize: $enumDecodeNullable(_$TeamSizeEnumMap, json['team_size']),
      serviceRadiusKm: (json['service_radius_km'] as num?)?.toDouble(),
      travelFeePerKm: (json['travel_fee_per_km'] as num?)?.toDouble(),
      minBookingAmount: (json['min_booking_amount'] as num?)?.toDouble(),
      minBookingCurrency: json['min_booking_currency'] as String?,
      depositRequired: json['deposit_required'] as bool? ?? false,
      depositPercentage: (json['deposit_percentage'] as num?)?.toDouble(),
      cancellationPolicy: $enumDecodeNullable(
          _$CancellationPolicyEnumMap, json['cancellation_policy']),
      cancellationPolicyText: json['cancellation_policy_text'] as String?,
      hasInsurance: json['has_insurance'] as bool? ?? false,
      isVerified: json['is_verified'] as bool? ?? false,
      verifiedAt: json['verified_at'] == null
          ? null
          : DateTime.parse(json['verified_at'] as String),
      portfolioVideoUrl: json['portfolio_video_url'] as String?,
      pressMentions: (json['press_mentions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ProfessionalProfileDMImplToJson(
        _$ProfessionalProfileDMImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.uuid case final value?) 'uuid': value,
      if (instance.businessId case final value?) 'business_id': value,
      'specialties': instance.specialties,
      'cuisines': instance.cuisines,
      if (instance.yearsExperience case final value?) 'years_experience': value,
      'certifications': instance.certifications,
      'languages_spoken': instance.languagesSpoken,
      if (_$TeamSizeEnumMap[instance.teamSize] case final value?)
        'team_size': value,
      if (instance.serviceRadiusKm case final value?)
        'service_radius_km': value,
      if (instance.travelFeePerKm case final value?) 'travel_fee_per_km': value,
      if (instance.minBookingAmount case final value?)
        'min_booking_amount': value,
      if (instance.minBookingCurrency case final value?)
        'min_booking_currency': value,
      'deposit_required': instance.depositRequired,
      if (instance.depositPercentage case final value?)
        'deposit_percentage': value,
      if (_$CancellationPolicyEnumMap[instance.cancellationPolicy]
          case final value?)
        'cancellation_policy': value,
      if (instance.cancellationPolicyText case final value?)
        'cancellation_policy_text': value,
      'has_insurance': instance.hasInsurance,
      'is_verified': instance.isVerified,
      if (instance.verifiedAt?.toIso8601String() case final value?)
        'verified_at': value,
      if (instance.portfolioVideoUrl case final value?)
        'portfolio_video_url': value,
      'press_mentions': instance.pressMentions,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

const _$TeamSizeEnumMap = {
  TeamSize.solo: 'solo',
  TeamSize.small2to4: 'small_2_4',
  TeamSize.medium5to10: 'medium_5_10',
  TeamSize.large11Plus: 'large_11_plus',
};

const _$CancellationPolicyEnumMap = {
  CancellationPolicy.flexible: 'flexible',
  CancellationPolicy.moderate: 'moderate',
  CancellationPolicy.strict: 'strict',
};
