import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_menus_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteMenusResponseDM {
  @JsonKey(name: 'favorite_menus', defaultValue: [])
  final List<MenuDM> favoriteMenus;

  const FavoriteMenusResponseDM({this.favoriteMenus = const []});

  factory FavoriteMenusResponseDM.fromJson(Map<String, dynamic> json) => _$FavoriteMenusResponseDMFromJson(json);
}
