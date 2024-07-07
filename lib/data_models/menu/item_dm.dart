import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_dm.freezed.dart';
part 'item_dm.g.dart';

@freezed
class ItemDM with _$ItemDM {
  factory ItemDM({
    required String name,
    required String description,
    required List<Version> versions,
    required Prices prices,
    @JsonKey(name: 'reference_photos') required List<String> referencePhotos,
    @JsonKey(name: 'favorites_count') required int favoritesCount,
    required bool available,
  }) = _ItemDM;

  factory ItemDM.fromJson(Map<String, dynamic> json) => _$ItemDMFromJson(json);
}

@freezed
class Prices with _$Prices {
  factory Prices({
    required double regular,
    required double medium,
    required double big,
  }) = _Prices;

  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);
}

@freezed
class ComboDM with _$ComboDM {
  factory ComboDM({
    required String name,
    required String description,
    required List<Version> versions,
    required Prices prices,
    @JsonKey(name: 'reference_photos') required List<String> referencePhotos,
    @JsonKey(name: 'favorites_count') required int favoritesCount,
    required bool available,
  }) = _ComboDM;

  factory ComboDM.fromJson(Map<String, dynamic> json) => _$ComboDMFromJson(json);
}
