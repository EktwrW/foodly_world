import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_drinks_items_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteDrinkItemsResponseDM {
  @JsonKey(name: 'favorite_drink_items', defaultValue: [])
  final List<ItemDM> favoriteDrinkItems;

  const FavoriteDrinkItemsResponseDM({this.favoriteDrinkItems = const []});

  factory FavoriteDrinkItemsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDrinkItemsResponseDMFromJson(json);
}
