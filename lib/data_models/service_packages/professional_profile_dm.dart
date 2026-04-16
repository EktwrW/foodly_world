import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_profile_dm.freezed.dart';
part 'professional_profile_dm.g.dart';

// ── Response wrappers ────────────────────────────────────────

@freezed
class ProfessionalProfileResponseDM with _$ProfessionalProfileResponseDM {
  const factory ProfessionalProfileResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    @JsonKey(name: 'professional_profile') ProfessionalProfileDM? professionalProfile,
  }) = _ProfessionalProfileResponseDM;

  factory ProfessionalProfileResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalProfileResponseDMFromJson(json);
}

// ── Enums ────────────────────────────────────────────────────

enum TeamSize {
  @JsonValue('solo')
  solo,
  @JsonValue('small_2_4')
  small2to4,
  @JsonValue('medium_5_10')
  medium5to10,
  @JsonValue('large_11_plus')
  large11Plus;
}

enum CancellationPolicy {
  @JsonValue('flexible')
  flexible,
  @JsonValue('moderate')
  moderate,
  @JsonValue('strict')
  strict;
}

// ── Main data model ──────────────────────────────────────────

@freezed
class ProfessionalProfileDM with _$ProfessionalProfileDM {
  const ProfessionalProfileDM._();

  const factory ProfessionalProfileDM({
    int? id,
    String? uuid,
    @JsonKey(name: 'business_id') int? businessId,
    @Default([]) List<String> specialties,
    @Default([]) List<String> cuisines,
    @JsonKey(name: 'years_experience') int? yearsExperience,
    @Default([]) List<String> certifications,
    @JsonKey(name: 'languages_spoken') @Default([]) List<String> languagesSpoken,
    @JsonKey(name: 'team_size') TeamSize? teamSize,
    @JsonKey(name: 'service_radius_km') double? serviceRadiusKm,
    @JsonKey(name: 'travel_fee_per_km') double? travelFeePerKm,
    @JsonKey(name: 'min_booking_amount') double? minBookingAmount,
    @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
    @JsonKey(name: 'deposit_required') @Default(false) bool depositRequired,
    @JsonKey(name: 'deposit_percentage') double? depositPercentage,
    @JsonKey(name: 'cancellation_policy') CancellationPolicy? cancellationPolicy,
    @JsonKey(name: 'cancellation_policy_text') String? cancellationPolicyText,
    @JsonKey(name: 'has_insurance') @Default(false) bool hasInsurance,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'verified_at') DateTime? verifiedAt,
    @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
    @JsonKey(name: 'press_mentions') @Default([]) List<String> pressMentions,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProfessionalProfileDM;

  factory ProfessionalProfileDM.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalProfileDMFromJson(json);

  bool get isSolo => teamSize == TeamSize.solo;
  bool get hasPortfolioVideo => portfolioVideoUrl != null && portfolioVideoUrl!.isNotEmpty;
  bool get requiresDeposit => depositRequired && (depositPercentage ?? 0) > 0;
}
