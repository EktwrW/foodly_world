import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:json_annotation/json_annotation.dart';

enum FoodlyCategories {
  @JsonValue(1)
  international(Asset(FoodlyAssets.international), 1),

  @JsonValue(2)
  american(Asset(FoodlyAssets.american), 2),

  @JsonValue(3)
  pizza(Asset(FoodlyAssets.pizza), 3),

  @JsonValue(4)
  japanese(Asset(FoodlyAssets.sushi), 4),

  @JsonValue(5)
  steakhouse(Asset(FoodlyAssets.steakhouse), 5),

  @JsonValue(6)
  fusion(Asset(FoodlyAssets.fusion), 6),

  @JsonValue(7)
  vegetarian(Asset(FoodlyAssets.vegetarian), 7),

  @JsonValue(8)
  mexican(Asset(FoodlyAssets.mexican), 8),

  @JsonValue(9)
  korean(Asset(FoodlyAssets.korean), 9),

  @JsonValue(10)
  portuguese(Asset(FoodlyAssets.portuguese), 10),

  @JsonValue(11)
  bakery(Asset(FoodlyAssets.bakery), 11),

  @JsonValue(12)
  drinkHouse(Asset(FoodlyAssets.pubs), 12),

  @JsonValue(13)
  coffee(Asset(FoodlyAssets.coffee), 13),

  @JsonValue(14)
  stores(Asset(FoodlyAssets.stores), 14),

  @JsonValue(15)
  academy(Asset(FoodlyAssets.chef), 15);

  final Widget icon;
  final int value;
  const FoodlyCategories(this.icon, this.value);

  bool get isDrinkHouse => this == drinkHouse;
  bool get isAcademy => this == academy;
  bool get isBakeryOrCoffee => this == coffee || this == bakery;
  bool get isRestaurant => !isDrinkHouse && !isAcademy && !isBakeryOrCoffee;

  String get text => switch (this) {
        international => S.current.internationalCuisine,
        american => S.current.fastFood,
        pizza => S.current.pizzerias,
        japanese => S.current.japaneseCuisine,
        steakhouse => S.current.steakhouse,
        fusion => S.current.fusionCuisine,
        vegetarian => S.current.vegetarianCuisine,
        mexican => S.current.mexicanCuisine,
        korean => S.current.koreanCuisine,
        portuguese => S.current.portugueseCuisine,
        bakery => S.current.bakeryAndDesserts,
        drinkHouse => S.current.pubsAndWineBars,
        coffee => S.current.cafesAndBreakfasts,
        stores => S.current.marketsAndStores,
        academy => S.current.cookingSchools,
      };
}

//pescados: MingCute.fish_fill LineAwesome.fish_solid
// pollo: MingCute.chicken_fill
// helado: MingCute.ice_cream_fill
// té: Icons.emoji_food_beverage_rounded
// hamburguesa: Icons.lunch_dining_rounded LineAwesome.hamburger_solid
// sopa: Icons.soup_kitchen_rounded
// tocineta: LineAwesome.bacon_solid
// cerveza: LineAwesome.beer_solid
// pan: LineAwesome.bread_slice_solid
// torta: Iconsax.cake_bold
// quesos: LineAwesome.cheese_solid
// cocteles: LineAwesome.cocktail_solid
// gattelas: LineAwesome.cookie_bite_solid
// whiskey: LineAwesome.glass_whiskey_solid esta libreria tiene varias bebidas en glass
// tarjetas de credito: LineAwesome.cc_stripe esta libreria tiene todas las tarjetas
// campanita de llamado: FontAwesome.bell_concierge_solid
