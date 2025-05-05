import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_combo_items_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteComboItemsResponseDM {
  @JsonKey(name: 'favorite_combos', defaultValue: [])
  final List<ItemDM> favoriteCombos;

  const FavoriteComboItemsResponseDM({this.favoriteCombos = const []});

  factory FavoriteComboItemsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$FavoriteComboItemsResponseDMFromJson(json);
}
