import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/business/business_item_photo_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/menu_precache.dart';

/// La precarga solo cubre la primera pantalla: en móvil 6–8 fotos, en tablet
/// 10–12, en escritorio hasta 16. Antes eran TODAS con tope de 4 s, y el tope
/// se agotaba casi siempre.
void main() {
  ItemDM plato(int i, {String? foto}) => ItemDM(
        name: 'Plato $i',
        versions: const [],
        prices: const Prices(),
        id: i,
        uuid: 'item-$i',
        foodPhotos: foto == null ? null : [MenuItemPhotoDM(id: i, uuid: 'p-$i', businessFoodPhotoUrl: foto)],
      );
  ItemDM bebida(int i) => ItemDM(
        name: 'Bebida $i',
        versions: const [],
        prices: const Prices(),
        id: 100 + i,
        uuid: 'drink-$i',
        drinkPhotos: [MenuItemPhotoDM(id: 100 + i, uuid: 'dp-$i', businessDrinkPhotoUrl: 'https://cdn/drink-$i.jpg')],
      );

  MenuDM menu({int platos = 30, int bebidas = 5}) => MenuDM(
        uuid: 'menu',
        businessUuid: 'biz',
        foodCategories: [
          CategoryDM(name: 'Pizzas', uuid: 'c1', items: [for (var i = 0; i < platos; i++) plato(i, foto: 'https://cdn/food-$i.jpg')]),
        ],
        drinkCategories: [
          CategoryDM(name: 'Bebidas', uuid: 'c2', items: [for (var i = 0; i < bebidas; i++) bebida(i)]),
        ],
      );

  test('un móvil (800 px de alto) precarga la primera pantalla: 10 fotos, en orden', () {
    final urls = menuPhotosToPrecache(menu(), drinksFirst: false, viewportHeight: 800);

    // ceil(800/110) + 2 = 10
    expect(urls, hasLength(10));
    expect(urls.first, 'https://cdn/food-0.jpg');
    expect(urls.last, 'https://cdn/food-9.jpg');
  });

  test('una pantalla enorme se acota a 16 y una minúscula sube a 6', () {
    expect(menuPhotosToPrecache(menu(), drinksFirst: false, viewportHeight: 4000), hasLength(16));
    expect(menuPhotosToPrecache(menu(), drinksFirst: false, viewportHeight: 200), hasLength(6));
  });

  test('en una casa de bebidas la página inicial son las bebidas: van primero', () {
    final urls = menuPhotosToPrecache(menu(bebidas: 3), drinksFirst: true, viewportHeight: 800);

    expect(urls.take(3), ['https://cdn/drink-0.jpg', 'https://cdn/drink-1.jpg', 'https://cdn/drink-2.jpg']);
    // Sobró cupo: se completa con la página siguiente.
    expect(urls[3], 'https://cdn/food-0.jpg');
    expect(urls, hasLength(10));
  });

  test('los platos sin foto no ocupan cupo', () {
    final m = MenuDM(
      uuid: 'menu',
      businessUuid: 'biz',
      foodCategories: [
        CategoryDM(name: 'Sin fotos', uuid: 'c0', items: [for (var i = 0; i < 20; i++) plato(i)]),
        CategoryDM(name: 'Con fotos', uuid: 'c1', items: [for (var i = 0; i < 4; i++) plato(50 + i, foto: 'https://cdn/f-$i.jpg')]),
      ],
    );

    expect(menuPhotosToPrecache(m, drinksFirst: false, viewportHeight: 800), hasLength(4));
  });

  test('un menú sin fotos no precarga nada', () {
    expect(menuPhotosToPrecache(menu(platos: 0, bebidas: 0), drinksFirst: false, viewportHeight: 800), isEmpty);
  });
}
