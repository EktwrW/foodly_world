import 'package:json_annotation/json_annotation.dart';

part 'item_register_dto.g.dart';

@JsonSerializable(createFactory: false)
abstract class ItemRegisterDTO {
  final String name;
  final String description;
  final List<String> versions;
  final Map<String, double> prices;
  @JsonKey(name: 'favorites_count')
  final int favoritesCount;
  final bool available;

  const ItemRegisterDTO({
    required this.name,
    required this.description,
    required this.versions,
    required this.prices,
    required this.favoritesCount,
    required this.available,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  int get categoryId;

  static ItemRegisterDTO fromJson(Map<String, dynamic> json) {
    if (json.containsKey('business_food_category_id')) {
      return FoodItemRegisterDTO.fromJson(json);
    } else if (json.containsKey('business_drink_category_id')) {
      return DrinkItemRegisterDTO.fromJson(json);
    } else if (json.containsKey('business_menu_id')) {
      return ComboItemRegisterDTO.fromJson(json);
    } else {
      throw const FormatException('Invalid JSON: missing category ID');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class FoodItemRegisterDTO extends ItemRegisterDTO {
  @JsonKey(name: 'business_food_category_id')
  final int businessFoodCategoryId;

  const FoodItemRegisterDTO({
    required this.businessFoodCategoryId,
    required super.name,
    required super.description,
    required super.versions,
    required super.prices,
    required super.favoritesCount,
    required super.available,
  });

  @override
  int get categoryId => businessFoodCategoryId;

  factory FoodItemRegisterDTO.fromJson(Map<String, dynamic> json) => _$FoodItemRegisterDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FoodItemRegisterDTOToJson(this);
}

@JsonSerializable()
class DrinkItemRegisterDTO extends ItemRegisterDTO {
  @JsonKey(name: 'business_drink_category_id')
  final int businessDrinkCategoryId;

  const DrinkItemRegisterDTO({
    required this.businessDrinkCategoryId,
    required super.name,
    required super.description,
    required super.versions,
    required super.prices,
    required super.favoritesCount,
    required super.available,
  });

  @override
  int get categoryId => businessDrinkCategoryId;

  factory DrinkItemRegisterDTO.fromJson(Map<String, dynamic> json) => _$DrinkItemRegisterDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DrinkItemRegisterDTOToJson(this);
}

@JsonSerializable()
class ComboItemRegisterDTO extends ItemRegisterDTO {
  @JsonKey(name: 'business_menu_id')
  final int businessMenuId;

  const ComboItemRegisterDTO({
    required this.businessMenuId,
    required super.name,
    required super.description,
    required super.versions,
    required super.prices,
    required super.favoritesCount,
    required super.available,
  });

  @override
  int get categoryId => businessMenuId;

  factory ComboItemRegisterDTO.fromJson(Map<String, dynamic> json) => _$ComboItemRegisterDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ComboItemRegisterDTOToJson(this);
}
