import 'package:flutter/material.dart' show BoxFit, Widget;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:json_annotation/json_annotation.dart';

enum FoodlyCategories {
  @JsonValue(1)
  international(1),

  @JsonValue(2)
  american(2),

  @JsonValue(3)
  pizza(3),

  @JsonValue(4)
  japanese(4),

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
  academy(15);

  final int value;
  const FoodlyCategories(this.value);

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

  Widget get avatar => AvatarWidget(avatarUrl: avatarUrl, boxFit: BoxFit.contain);

  String get avatarUrl => switch (this) {
        international =>
          'https://foodly.s3.amazonaws.com/public/categories_images/oMAAZvmiXpRoIXhPMUgan7o4m6GS0VngGzuExxF4.jpg',
        american =>
          'https://foodly.s3.amazonaws.com/public/categories_images/3R7zsx7VXzFekjM2qFz0pktxpYeMnhT6b7fKmTo5.jpg',
        pizza =>
          'https://foodly.s3.amazonaws.com/public/categories_images/zy66xbwjltRgitojWuzbUoOxX4OpLfQUmlotimVi.jpg',
        japanese =>
          'https://foodly.s3.amazonaws.com/public/categories_images/rEvbOnKbTYnpoz7Qc1Vu0jHXSDt8YMer2WaxqyOz.jpg',
        steakhouse =>
          'https://foodly.s3.amazonaws.com/public/categories_images/DXj6PxsVPe9inTs8eDh2u47b1LhgwOpOXyYNV7Gp.jpg',
        fusion =>
          'https://foodly.s3.amazonaws.com/public/categories_images/6uT3gxrcugQPiMIxICRVG06cHQbYBOCnPKolRqIh.jpg',
        vegetarian =>
          'https://foodly.s3.amazonaws.com/public/categories_images/BpIS39yEA6lpcIRjSbkWC3Tt4lgrp2Pk4NclnMKn.jpg',
        mexican =>
          'https://foodly.s3.amazonaws.com/public/categories_images/6rvuMCOXDbQm08Xf5D2snlnBj5sfTIcMF5PeLtcB.jpg',
        korean =>
          'https://foodly.s3.amazonaws.com/public/categories_images/FoJ3Uycii6zgFHelMfU6rR5w0A0PHnjcKv8jvMuy.jpg',
        portuguese =>
          'https://foodly.s3.amazonaws.com/public/categories_images/OKZVzDcXq0csGYOsBZiSPa16oMrovNzQBr8sYmAT.jpg',
        bakery =>
          'https://foodly.s3.amazonaws.com/public/categories_images/eo6lgLdLH87PCLbwjyNVTTuNeXzxW4Jx67EGNDaS.jpg',
        drinkHouse =>
          'https://foodly.s3.amazonaws.com/public/categories_images/31DbV0wNR6topTeaVpBBlD8AdtJrSxD26XgC16hQ.jpg',
        coffee =>
          'https://foodly.s3.amazonaws.com/public/categories_images/NC2D2vwB28ReT6E9HyBaq1rkJJLGCBodBLdNLvee.jpg',
        stores =>
          'https://foodly.s3.amazonaws.com/public/categories_images/9UrhIE91n2kbClChH8d0zAJ3WHdKv4cQ06fqq2NU.jpg',
        academy =>
          'https://foodly.s3.amazonaws.com/public/categories_images/sck0rO2HlaBnXzHMAaYPLuIJhYkTlqmMauOrZZYM.jpg',
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
