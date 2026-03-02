import 'package:flutter/material.dart' show BoxFit, ClipOval, Image, Widget;
import 'package:foodly_world/generated/l10n.dart';
import 'package:json_annotation/json_annotation.dart';

enum FoodlyCategories {
  @JsonValue(1)
  international(1),

  @JsonValue(2)
  fastFood(2),

  @JsonValue(3)
  pizza(3),

  @JsonValue(4)
  sushi(4),

  @JsonValue(5)
  steakhouse(5),

  @JsonValue(6)
  fusion(6),

  @JsonValue(7)
  vegetarian(7),

  @JsonValue(8)
  mexican(8),

  @JsonValue(9)
  korean(9),

  @JsonValue(10)
  portuguese(10),

  @JsonValue(11)
  bakery(11),

  @JsonValue(12)
  drinkHouse(12),

  @JsonValue(13)
  coffee(13),

  @JsonValue(14)
  stores(14),

  @JsonValue(15)
  academy(15),

  @JsonValue(16)
  italian(16),

  @JsonValue(17)
  argentinian(17),

  @JsonValue(18)
  peruvian(18),

  @JsonValue(19)
  seaFood(19),

  @JsonValue(20)
  asian(20),

  @JsonValue(21)
  arabic(21),

  @JsonValue(22)
  venezuelan(22);

  final int value;
  const FoodlyCategories(this.value);

  bool get isDrinkHouse => this == drinkHouse;
  bool get isAcademy => this == academy;
  bool get isBakeryOrCoffee => this == coffee || this == bakery;
  bool get isRestaurant => !isDrinkHouse && !isAcademy && !isBakeryOrCoffee;

  // TODO: Localizar Strings en .arb files
  String get text => switch (this) {
        international => S.current.internationalCuisine,
        fastFood => S.current.fastFood,
        pizza => S.current.pizzerias,
        sushi => S.current.sushi,
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
        italian => S.current.italian,
        argentinian => S.current.argentinian,
        peruvian => S.current.peruvian,
        seaFood => S.current.seafood,
        asian => S.current.asian,
        arabic => S.current.arabic,
        venezuelan => S.current.venezuelan,
      };

  Widget get avatar => ClipOval(child: Image.asset(assetPath, fit: BoxFit.contain));

  String get assetPath => switch (this) {
        international => 'assets/images/international.jpg',
        fastFood => 'assets/images/fast_food.jpg',
        pizza => 'assets/images/pizzas.jpg',
        sushi => 'assets/images/sushi_food.jpg',
        steakhouse => 'assets/images/steakhouse.jpg',
        fusion => 'assets/images/fusion.jpg',
        vegetarian => 'assets/images/vegetarian.jpg',
        mexican => 'assets/images/mexican.jpg',
        korean => 'assets/images/korean.jpg',
        portuguese => 'assets/images/portuguese.jpg',
        bakery => 'assets/images/bakery.jpg',
        drinkHouse => 'assets/images/drink_house.jpg',
        coffee => 'assets/images/coffee.jpg',
        stores => 'assets/images/stores.jpg',
        academy => 'assets/images/academy.jpg',
        italian => 'assets/images/italiana.png',
        argentinian => 'assets/images/argentina.png',
        peruvian => 'assets/images/peruana.png',
        seaFood => 'assets/images/seafood.png',
        asian => 'assets/images/asian.png',
        arabic => 'assets/images/arabe.png',
        venezuelan => 'assets/images/venezuelan.png',
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
