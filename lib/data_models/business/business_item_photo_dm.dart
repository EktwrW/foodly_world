import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_item_photo_dm.freezed.dart';
part 'business_item_photo_dm.g.dart';

@freezed
abstract class MenuItemPhotoDM with _$MenuItemPhotoDM {
  const factory MenuItemPhotoDM({
    required int id,
    required String uuid,
    @JsonKey(name: 'business_food_photo_url') String? businessFoodPhotoUrl,
    @JsonKey(name: 'business_food_item_id') int? businessFoodItemId,
    @JsonKey(name: 'business_drink_photo_url') String? businessDrinkPhotoUrl,
    @JsonKey(name: 'business_drink_item_id') int? businessDrinkItemId,
    @JsonKey(name: 'business_combos_photo_url') String? businessComboPhotoUrl,
    @JsonKey(name: 'business_combos_id') int? businessComboItemId,
  }) = _MenuItemPhotoDMDM;

  factory MenuItemPhotoDM.fromJson(Map<String, dynamic> json) => _$MenuItemPhotoDMFromJson(json);
}

@freezed
abstract class MenuItemPhotoResponse with _$MenuItemPhotoResponse {
  const factory MenuItemPhotoResponse({
    @JsonKey(name: 'business_food_reference_photos') List<MenuItemPhotoDM>? foodReferencePhotos,
    @JsonKey(name: 'business_drink_reference_photos') List<MenuItemPhotoDM>? drinkReferencePhotos,
    @JsonKey(name: 'business_combo_photos') List<MenuItemPhotoDM>? comboReferencePhotos,
  }) = _MenuItemPhotoResponse;

  factory MenuItemPhotoResponse.fromJson(Map<String, dynamic> json) => _$MenuItemPhotoResponseFromJson(json);
}
