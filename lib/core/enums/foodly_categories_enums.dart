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
  venezuelan(22),

  @JsonValue(23)
  brazilian(23),

  @JsonValue(25)
  foodTrucks(25),

  @JsonValue(26)
  cateringAndChefs(26);

  final int value;
  const FoodlyCategories(this.value);

  bool get isDrinkHouse => this == drinkHouse;
  bool get isAcademy => this == academy;
  bool get isBakeryOrCoffee => this == coffee || this == bakery;
  bool get isRestaurant => !isDrinkHouse && !isAcademy && !isBakeryOrCoffee && !isCateringOrChefs;
  bool get isCateringOrChefs => this == cateringAndChefs;

  /// Categories currently active in the product — shown in both
  /// business-picking UIs (sign-up, edit-category) AND discovery surfaces
  /// (home carousel, categories page).
  ///
  /// TEMPORARY: [stores] (markets) and [academy] (cooking schools) are
  /// hidden for the initial launch because their vertical-specific Showcase
  /// feature (product catalog / class schedule) is not yet implemented —
  /// a business onboarding under these categories today would not have a
  /// usable menu equivalent, and browsing them would only show empty pages.
  ///
  /// Restore to [values] once Phase 2/3 of the expansion plan ships.
  /// See `be-foodly/docs/markets-academies-expansion-plan.md`.
  ///
  /// NOTE: JSON-parsing and display-of-existing-category code paths (business
  /// DM deserializer, favorites mini-card) MUST keep using [values] — this
  /// getter is only for UI-level listing/picking surfaces.
  static List<FoodlyCategories> get activeCategories =>
      values.where((c) => c != stores && c != academy).toList(growable: false);

  /// Lista de [activeCategories] **reordenada** para priorizar la cocina
  /// local del país detectado en la geolocalización del usuario.
  ///
  /// **Motivación UX** (2026-05-19): cuando un usuario abre el home, si
  /// está en Portugal queremos que "Portuguesa" aparezca primero en el
  /// carousel — la cocina local es de los descubrimientos más relevantes
  /// y el patrón se repite en Uber Eats / Deliveroo / Glovo. Si está en
  /// Brasil, "Brasilera" primero; en Argentina, "Argentina"; en
  /// Venezuela, "Venezolana". Resto de países: orden default
  /// ([activeCategories] tal cual).
  ///
  /// **Contrato:** la lista resultante tiene los MISMOS items que
  /// [activeCategories], solo reordenados. El `e.index` posicional de
  /// cada enum value NO se ve afectado (ese sigue siendo el orden de
  /// declaración del enum, no el orden visual) — así el router
  /// `categories` que hace `FoodlyCategories.values[categoryIndex]` para
  /// resolver el index del extra path-param sigue funcionando.
  ///
  /// **`countryCode`** se espera en formato ISO 3166-1 alfa-2 (`PT`,
  /// `BR`, `VE`, `AR`, ...) tal como lo retorna Google Geocoding API en
  /// el `short_name` del componente `country` (ver `LocationBloc`
  /// línea ~436). Si llega null o un código no mapeado, retorna
  /// [activeCategories] sin modificar.
  ///
  /// **Performance:** O(N) sobre una lista de ~24 elementos — irrelevante
  /// dentro del build de un widget que ya pinta 24 InkWell + 24
  /// AnimatedContainer. La operación es trivial vs el costo de layout.
  static List<FoodlyCategories> activeCategoriesForCountry(String? countryCode) {
    final priority = _priorityCategoryForCountry(countryCode);
    if (priority == null) return activeCategories;
    return <FoodlyCategories>[
      priority,
      ...activeCategories.where((c) => c != priority),
    ];
  }

  /// Mapeo país → categoría local prioritaria. Sólo incluye los países
  /// donde Foodly tiene mercado activo (Phase 1: PT, AR, VE; Phase 2: ES,
  /// USA; Phase 3: EU, BR — ver project_instructions). BR se incluye ya
  /// por la migración reciente que agregó la categoría Brasilera.
  ///
  /// Si en el futuro se agrega un nuevo país de mercado (ej. España con
  /// una categoría "Cocina Española"), agregar acá la rama del switch.
  /// Es la única edit point — el resto del código consume vía
  /// [activeCategoriesForCountry].
  static FoodlyCategories? _priorityCategoryForCountry(String? code) {
    if (code == null || code.isEmpty) return null;
    return switch (code.toUpperCase()) {
      'PT' => portuguese,
      'BR' => brazilian,
      'VE' => venezuelan,
      'AR' => argentinian,
      _ => null,
    };
  }

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
        drinkHouse => S.current.barsAndPubs,
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
        foodTrucks => S.current.foodTrucks,
        cateringAndChefs => S.current.cateringAndChefs,
        brazilian => S.current.brazilian,
      };

  Widget get avatar => ClipOval(child: Image.asset(assetPath, fit: BoxFit.contain));

  String get assetPath => switch (this) {
        international => 'assets/images/international.jpg',
        fastFood => 'assets/images/fast_food.jpg',
        pizza => 'assets/images/pizzas.jpg',
        sushi => 'assets/images/sushi.jpg',
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
        seaFood => 'assets/images/seafood.png',
        italian => 'assets/images/italiana.png',
        asian => 'assets/images/asian.png',
        argentinian => 'assets/images/argentina.png',
        peruvian => 'assets/images/peruana.png',
        venezuelan => 'assets/images/venezuelan.png',
        arabic => 'assets/images/arabe.png',
        foodTrucks => 'assets/images/stand.png',
        cateringAndChefs => 'assets/images/catering_chefs.png',
        brazilian => 'assets/images/brasilera.png',
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
