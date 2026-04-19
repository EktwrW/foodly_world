import 'package:flutter/widgets.dart' show IconData;
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

part 'service_package_dm.freezed.dart';
part 'service_package_dm.g.dart';

// ── JSON helpers ─────────────────────────────────────────────
//
// Defensive double parser — see professional_profile_dm.dart for the full
// rationale. Tolerates num, String (e.g. "99.00" from Laravel decimal cast),
// empty strings, and null without throwing.
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
class ServicePackagesResponseDM with _$ServicePackagesResponseDM {
  const factory ServicePackagesResponseDM({
    @Default(false) bool success,
    @JsonKey(name: 'service_packages') @Default([]) List<ServicePackageDM> servicePackages,
  }) = _ServicePackagesResponseDM;

  factory ServicePackagesResponseDM.fromJson(Map<String, dynamic> json) => _$ServicePackagesResponseDMFromJson(json);
}

@freezed
class ServicePackageActionResponseDM with _$ServicePackageActionResponseDM {
  const factory ServicePackageActionResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    @JsonKey(name: 'service_package') ServicePackageDM? servicePackage,
  }) = _ServicePackageActionResponseDM;

  factory ServicePackageActionResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ServicePackageActionResponseDMFromJson(json);
}

@freezed
class GenericSuccessResponseDM with _$GenericSuccessResponseDM {
  const factory GenericSuccessResponseDM({
    @Default(false) bool success,
    @Default('') String message,
  }) = _GenericSuccessResponseDM;

  factory GenericSuccessResponseDM.fromJson(Map<String, dynamic> json) => _$GenericSuccessResponseDMFromJson(json);
}

@freezed
class PhotoUploadResponseDM with _$PhotoUploadResponseDM {
  const factory PhotoUploadResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    @Default([]) List<ServicePackagePhotoDM> photos,
  }) = _PhotoUploadResponseDM;

  factory PhotoUploadResponseDM.fromJson(Map<String, dynamic> json) => _$PhotoUploadResponseDMFromJson(json);
}

// ── Enums ────────────────────────────────────────────────────

enum ServiceType {
  @JsonValue('dinner')
  dinner,
  @JsonValue('lunch')
  lunch,
  @JsonValue('brunch')
  brunch,
  @JsonValue('cocktail')
  cocktail,
  @JsonValue('wedding')
  wedding,
  @JsonValue('corporate')
  corporate,
  @JsonValue('birthday')
  birthday,
  @JsonValue('cooking_class_private')
  cookingClassPrivate,
  @JsonValue('custom')
  custom;

  /// Localized label for display in the UI (chips, badges, list items).
  String get label => switch (this) {
        dinner => S.current.eventTypeDinner,
        lunch => S.current.eventTypeLunch,
        brunch => S.current.eventTypeBrunch,
        cocktail => S.current.eventTypeCocktail,
        wedding => S.current.eventTypeWedding,
        corporate => S.current.eventTypeCorporate,
        birthday => S.current.eventTypeBirthday,
        cookingClassPrivate => S.current.eventTypeCookingClassPrivate,
        custom => S.current.eventTypeCustom,
      };

  /// Distinctive Bootstrap icon per service type — used alongside [label]
  /// in chips/pills throughout the app.
  IconData get icon => switch (this) {
        dinner => Bootstrap.moon_stars,
        lunch => Bootstrap.sun,
        brunch => Bootstrap.cup_hot,
        cocktail => Bootstrap.cup_straw,
        wedding => Bootstrap.heart,
        corporate => Bootstrap.briefcase,
        birthday => Bootstrap.gift,
        cookingClassPrivate => Bootstrap.mortarboard,
        custom => Bootstrap.stars,
      };
}

enum PriceType {
  @JsonValue('fixed')
  fixed,
  @JsonValue('per_person')
  perPerson,
  @JsonValue('per_hour')
  perHour,
  @JsonValue('on_quote')
  onQuote;

  String get priceTypeLabel {
    return switch (this) {
      PriceType.fixed => '',
      PriceType.perPerson => '/ ${S.current.perPerson.toLowerCase()}',
      PriceType.perHour => '/ ${S.current.perHour.toLowerCase()}',
      PriceType.onQuote => '',
    };
  }
}

// ── Main data model ──────────────────────────────────────────

@freezed
class ServicePackageDM with _$ServicePackageDM {
  const ServicePackageDM._();

  const factory ServicePackageDM({
    int? id,
    String? uuid,
    @JsonKey(name: 'business_id') int? businessId,
    @Default('') String title,
    String? description,
    @JsonKey(name: 'service_type') @Default(ServiceType.custom) ServiceType serviceType,
    @JsonKey(name: 'price_type') @Default(PriceType.onQuote) PriceType priceType,
    @JsonKey(fromJson: _doubleFromJson) double? price,
    String? currency,
    @JsonKey(name: 'min_guests') int? minGuests,
    @JsonKey(name: 'max_guests') int? maxGuests,
    @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson) double? durationHours,
    @Default([]) List<String> includes,
    @JsonKey(name: 'add_ons') @Default([]) List<String> addOns,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @Default([]) List<ServicePackagePhotoDM> photos,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ServicePackageDM;

  factory ServicePackageDM.fromJson(Map<String, dynamic> json) => _$ServicePackageDMFromJson(json);

  bool get hasPrice => price != null && price! > 0;
  bool get isOnQuote => priceType == PriceType.onQuote;
  bool get hasGuestRange => minGuests != null || maxGuests != null;
  String get guestRangeText {
    if (minGuests != null && maxGuests != null) return '$minGuests–$maxGuests';
    if (minGuests != null) return '$minGuests+';
    if (maxGuests != null) return '≤$maxGuests';
    return '';
  }
}

// ── Photo model ──────────────────────────────────────────────

@freezed
class ServicePackagePhotoDM with _$ServicePackagePhotoDM {
  const factory ServicePackagePhotoDM({
    int? id,
    String? uuid,
    @JsonKey(name: 'service_package_id') int? servicePackageId,
    @JsonKey(name: 'photo_path') String? photoPath,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _ServicePackagePhotoDM;

  factory ServicePackagePhotoDM.fromJson(Map<String, dynamic> json) => _$ServicePackagePhotoDMFromJson(json);
}
