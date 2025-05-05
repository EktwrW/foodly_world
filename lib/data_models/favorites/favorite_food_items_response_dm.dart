import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_food_items_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteFoodItemsResponseDM {
  /// Lista de ítems de comida favoritos
  @JsonKey(name: 'favorite_food_items', defaultValue: [])
  final List<ItemDM> favoriteFoodItems;

  const FavoriteFoodItemsResponseDM({this.favoriteFoodItems = const []});

  factory FavoriteFoodItemsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFoodItemsResponseDMFromJson(json);
}
