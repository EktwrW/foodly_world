import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_profile_dm.freezed.dart';
part 'professional_profile_dm.g.dart';

// ── JSON helpers ─────────────────────────────────────────────
//
// Defensive double parser: tolerates num, String, and null payloads.
// Rationale: some BE deploys still use Laravel's `decimal:N` cast which
// serializes numerics as strings in JSON (e.g. `"1.00"`). The default
// json_serializable deserializer does `(json[...] as num?)?.toDouble()`
// which throws `type 'String' is not a subtype of type 'num?'` on strings.
// Wrapping the field with `@JsonKey(fromJson: _doubleFromJson)` lets the
// FE survive either representation, so a stale BE or a cached response
// doesn't crash the profile fetch / `fetchAll`.
double? _doubleFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) {
    if (value.isEmpty) return null;
    return double.tryParse(value);
  }
  return null;
}

// ── Response wrappers ────────────────────────────────────────

@freezed
abstract class ProfessionalProfileResponseDM with _$ProfessionalProfileResponseDM {
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
abstract class ProfessionalProfileDM with _$ProfessionalProfileDM {
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
    @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson) double? serviceRadiusKm,
    @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson) double? travelFeePerKm,
    @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson) double? minBookingAmount,
    @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
    @JsonKey(name: 'deposit_required') @Default(false) bool depositRequired,
    @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson) double? depositPercentage,
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
