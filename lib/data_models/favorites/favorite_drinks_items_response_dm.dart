import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_drinks_items_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteDrinksItemsResponseDM {
  @JsonKey(name: 'favorite_drinks_items', defaultValue: [])
  final List<ItemDM> favoriteDrinksItems;

  const FavoriteDrinksItemsResponseDM({this.favoriteDrinksItems = const []});

  factory FavoriteDrinksItemsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDrinksItemsResponseDMFromJson(json);
}
