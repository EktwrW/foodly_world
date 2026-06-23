import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart' show FoodlyAssets;
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show AssetData;
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/core/enums/business_enums.dart';
export 'package:foodly_world/core/enums/foodly_categories_enums.dart';
export 'package:foodly_world/data_models/business/business_cover_image_dm.dart';
export 'package:foodly_world/data_models/business/opening_hours_dm.dart';

part 'business_dm.freezed.dart';
part 'business_dm.g.dart';

FoodlyCategories? _safeCategoryFromJson(dynamic value) {
  if (value == null) return null;
  final id = value is int ? value : int.tryParse(value.toString());
  if (id == null) return null;
  return FoodlyCategories.values.cast<FoodlyCategories?>().firstWhere(
        (c) => c?.value == id,
        orElse: () => null,
      );
}

/// Same defensive helper used in ServicePackageDM/ProfessionalProfileDM:
/// the BE can serialise decimals as either floats ("65.0") or — for edge
/// cases like column casts or an old row — strings ("65.00"). The default
/// json_serializable `(json as num?)?.toDouble()` throws on strings.
double? _doubleFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}

@freezed
class BusinessDM with _$BusinessDM {
  const BusinessDM._();

  const factory BusinessDM({
    @JsonKey(name: 'id') int? intId,
    @JsonKey(name: 'business_logo') @Default(FoodlyStrings.LOGO_PLACEHOLDER) String logo,
    @JsonKey(name: 'cover_images') @Default([]) List<BusinessCoverImageDM> coverImages,
    @JsonKey(name: 'branches') @Default([]) List<BusinessDM> branches,
    @JsonKey(name: 'business_uuid') @Default('') String uuid,
    @JsonKey(name: 'business_name') String? name,
    @JsonKey(name: 'business_about_us') String? aboutUs,
    @JsonKey(name: 'business_services') List<BusinessServicesDM>? services,
    @JsonKey(name: 'business_promotions') List<PromotionDM>? promotions,
    @JsonKey(name: 'business_additional_info') String? additionalInfo,
    @JsonKey(name: 'business_email') String? email,
    @JsonKey(name: 'business_phone') String? phoneNumber,
    @JsonKey(name: 'business_address') String? address,
    @JsonKey(name: 'business_zipcode') String? zipCode,
    @JsonKey(name: 'business_city') String? city,
    @JsonKey(name: 'business_country') FoodlyCountries? country,
    @JsonKey(name: 'business_menus') @Default([]) List<MenuDM> menus,
    @JsonKey(name: 'business_latitude') double? latitude,
    @JsonKey(name: 'business_longitude') double? longitude,
    @JsonKey(name: 'category_id', fromJson: _safeCategoryFromJson) FoodlyCategories? categoryId,
    @JsonKey(name: 'category') CategoryDM? category,
    @JsonKey(name: 'rating_avg') double? rating,
    @JsonKey(name: 'ratings_count') int? ratingsCount,
    @JsonKey(name: 'business_opening_hours') @Default(BusinessDays()) BusinessDays businessDays,
    // Server-computed open/closed status using the BUSINESS's local
    // timezone (derived from `business_country` in `BusinessStatusHelper`
    // on the BE). The FE no longer computes this — see [currentStatus]
    // getter below for the parsed enum, and `BusinessStatusHelper.php` for
    // the rationale (single source of truth, correct for cross-timezone
    // viewers, kills the "My Pizzeria looks closed" bug).
    // Values: 'open' | 'closed' | 'opening_soon'. Null only on payloads
    // from controllers that haven't been updated yet (defensive).
    @JsonKey(name: 'status') String? status,
    // Human-readable hours for TODAY in the business's local time, e.g.
    // "09:00 – 22:00" or "09:00 – 14:00 / 18:00 – 23:00" for split shifts.
    // Server-side string ready to render. Null when no hours configured
    // for today.
    @JsonKey(name: 'hours_display') String? hoursDisplay,
    @JsonKey(name: 'followers_length') @Default(0) int followersLength,
    @JsonKey(name: 'intro_message') String? introMessage,
    @JsonKey(name: 'allow_reservations') @Default(false) bool allowReservations,
    @JsonKey(name: 'reservations_count') @Default(6) int reservationsSizeLimit,
    // Catering & Chefs vertical — opt-in digital menu. Other verticals always
    // show their menu; catering shows it only when the manager enables it.
    @JsonKey(name: 'menu_enabled') @Default(false) bool menuEnabled,
    @JsonKey(name: 'combos_label') String? combosLabel,
    @JsonKey(name: 'ai_promo_monthly_limit') @Default(6) int aiPromoMonthlyLimit,
    @JsonKey(name: 'ai_promos_used_this_month') @Default(0) int aiPromosUsedThisMonth,
    // Catering & Chefs vertical — MIN price across ACTIVE service_packages
    // for this business (EUR). Only populated by endpoints that join the
    // subselect (currently: GET /business/nearby). Null when the business has
    // no priced active package (restaurants without packages, or catering
    // providers that only offer on-quote packages).
    @JsonKey(name: 'min_service_price', fromJson: _doubleFromJson) double? minServicePrice,

    // This field is not from the API, it's used to store the reviews of the business when fetching them together with the business details
    @Default([]) List<ReviewDM> reviews,
  }) = _BusinessDM;

  factory BusinessDM.fromJson(Map<String, dynamic> json) => _$BusinessDMFromJson(json);

  String get fullAddress {
    return [
      address,
      city,
      zipCode,
      country?.value,
    ].where((element) => element != null && element.isNotEmpty).join(', ');
  }

  List<String> get coverImageUrls {
    if (coverImages.isNotEmpty) {
      return coverImages.map((e) => e.url ?? '').toList();
    }
    return [];
  }

  int get aiPromoRemaining => (aiPromoMonthlyLimit - aiPromosUsedThisMonth).clamp(0, aiPromoMonthlyLimit);
  bool get aiPromoQuotaExhausted => aiPromoRemaining <= 0;

  List<BusinessServices> get businessServices =>
      (services?.isEmpty ?? true) ? [] : services!.where((s) => s.service != null).map((s) => s.service!).toList()
        ..sort((a, b) => a.value.compareTo(b.value));

  Widget get categoryAvatar => SizedBox.square(
        dimension: 28,
        child: categoryId?.avatar ?? category?.id?.avatar ?? const SizedBox.shrink(),
      );

  /// Parses the server's `status` string into the [BusinessStatus] enum.
  /// The BE computes the status in the business's local timezone, so this
  /// getter is the SINGLE source of truth for "is this business open right
  /// now?" — never compute it locally with `DateTime.now()` because that
  /// uses the device's timezone, which doesn't match the business's for
  /// any cross-zone viewer.
  ///
  /// Defensive default `closed` when the BE didn't ship `status` (legacy
  /// payloads from controllers that haven't been redeployed yet, or in
  /// freezed-default `BusinessDM()` instances). All endpoints in the
  /// codebase are wired to populate this after the timezone-aware refactor;
  /// see `BusinessStatusHelper.php`.
  BusinessStatus get currentStatus => switch (status) {
        'open' => BusinessStatus.open,
        'opening_soon' => BusinessStatus.openingSoon,
        'closed' => BusinessStatus.closed,
        _ => BusinessStatus.closed,
      };

  /// Convenience boolean for callers that only care about open vs not-open
  /// (e.g. sort: open first, closed last). `opening_soon` reads as NOT
  /// open here — the business literally isn't accepting customers right
  /// now, even if it will in 30 min.
  bool get isOpen => currentStatus == BusinessStatus.open;

  AssetData get bussinessReservationImage {
    return switch (categoryId) {
      FoodlyCategories.coffee || FoodlyCategories.bakery => FoodlyAssets.reserveCoffeeTable,
      FoodlyCategories.drinkHouse => FoodlyAssets.reserveBar,
      _ => FoodlyAssets.reserveTable,
    };
  }

  /// Tab inicial del `PageView` del menú (manager y customer).
  ///
  /// Bares (`FoodlyCategories.drinkHouse`) → tab 1 (bebidas), porque es
  /// el caso de uso dominante del tipo de negocio. El resto arranca en
  /// tab 0 (platos). Si en el futuro se suman más overrides por categoría
  /// (e.g. `bakery` → postres), esta es la función donde concentrarlos
  /// para mantener a los dos cubits alineados (`ManageMenuCubit` y
  /// `VisitedMenuCubit`).
  ///
  /// Resolvemos vía `categoryId` primero — es el enum parseado desde
  /// `category_id` del JSON con `_safeCategoryFromJson` y es el que usa
  /// el resto del código (`categoryAvatar`, `bussinessReservationImage`).
  /// Fallback a `category?.id` por si el endpoint hidrata el objeto
  /// relacional pero no el scalar (más robusto contra drift del BE).
  int get menuInitialPageIndex {
    final cat = categoryId ?? category?.id;
    return cat?.isDrinkHouse == true ? 1 : 0;
  }
}

@freezed
class CategoryDM with _$CategoryDM {
  const factory CategoryDM({
    @JsonKey(name: 'id', fromJson: _safeCategoryFromJson) FoodlyCategories? id,
    @JsonKey(name: 'category_uuid') String? categoryUuid,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_image_path') String? categoryImagePath,
  }) = _CategoryDM;

  factory CategoryDM.fromJson(Map<String, dynamic> json) => _$CategoryDMFromJson(json);
}

@freezed
class BusinessServicesDM with _$BusinessServicesDM {
  const BusinessServicesDM._();
  const factory BusinessServicesDM({
    @JsonKey(name: 'id', unknownEnumValue: JsonKey.nullForUndefinedEnumValue) BusinessServices? service,
    @JsonKey(name: 'service_uuid') String? uuid,
    @JsonKey(name: 'service_name') String? serviceName,
    @JsonKey(name: 'service_description') String? serviceDescriptio,
    @JsonKey(name: 'service_image_path') String? serviceImagePath,
  }) = _BusinessServiceDM;

  factory BusinessServicesDM.fromJson(Map<String, dynamic> json) => _$BusinessServicesDMFromJson(json);
}
