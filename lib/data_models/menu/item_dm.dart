import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/core/enums/foodly_enums.dart';

part 'item_dm.freezed.dart';
part 'item_dm.g.dart';

@freezed
class ItemDM with _$ItemDM {
  const ItemDM._();

  factory ItemDM({
    required String name,
    required String description,
    required List<Version> versions,
    required Prices prices,
    @JsonKey(name: 'reference_photos') required List<String> referencePhotos,
    @JsonKey(name: 'favorites_count') required int favoritesCount,
    required bool available,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(Version.regular) Version selectedVersion,
  }) = _ItemDM;

  factory ItemDM.fromJson(Map<String, dynamic> json) => _$ItemDMFromJson(json);

  Map<Version, double> get _priceMap => {
        Version.regular: prices.regular,
        Version.medium: prices.medium,
        Version.big: prices.big,
      };

  double get currentPrice => _priceMap[selectedVersion] ?? 0.0;
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
