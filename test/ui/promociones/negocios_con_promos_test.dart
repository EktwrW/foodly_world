import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/view_model/saved_promotions_view_model.dart';

/// Los dos getters de negocios se leen DENTRO de un `build`, así que corren en
/// cada reconstrucción. Al pasarlos de un bucle anidado a un índice por uuid
/// hay tres cosas que NO pueden cambiar, y son las que fija este banco: el
/// orden, que no se repita un negocio, y que una promoción cuyo negocio no
/// viene en la respuesta simplemente no aparezca.
void main() {
  NearbyPromotionDM promo(String uuid, String negocio) =>
      NearbyPromotionDM(uuid: uuid, title: 'Promo $uuid', businessUuid: negocio);

  const pizzeria = SavedPromoBusinessDM(uuid: 'n1', name: 'La Pizzeria');
  const taberna = SavedPromoBusinessDM(uuid: 'n2', name: 'La Taberna');

  test('manda el orden de las promociones, no el de los negocios', () {
    final vm = SavedPromotionsViewVM(
      currentPromos: [promo('p1', 'n2'), promo('p2', 'n1')],
      businesses: const [pizzeria, taberna],
    );

    expect(vm.businessesWithCurrentPromos.map((b) => b.uuid), ['n2', 'n1']);
  });

  test('un negocio con varias promociones sale UNA vez', () {
    final vm = SavedPromotionsViewVM(
      currentPromos: [promo('p1', 'n1'), promo('p2', 'n1'), promo('p3', 'n2')],
      businesses: const [pizzeria, taberna],
    );

    expect(vm.businessesWithCurrentPromos.map((b) => b.uuid), ['n1', 'n2']);
  });

  test('una promoción huérfana no inventa un negocio', () {
    // Pasa de verdad: el backend puede devolver una promo cuyo negocio no viene
    // en la misma respuesta.
    final vm = SavedPromotionsViewVM(
      currentPromos: [promo('p1', 'fantasma'), promo('p2', 'n1')],
      businesses: const [pizzeria],
    );

    expect(vm.businessesWithCurrentPromos.map((b) => b.uuid), ['n1']);
  });

  test('las dos secciones no se mezclan', () {
    final vm = SavedPromotionsViewVM(
      currentPromos: [promo('p1', 'n1')],
      upcomingPromos: [promo('p2', 'n2')],
      businesses: const [pizzeria, taberna],
    );

    expect(vm.businessesWithCurrentPromos.map((b) => b.uuid), ['n1']);
    expect(vm.businessesWithUpcomingPromos.map((b) => b.uuid), ['n2']);
  });

  test('sin promociones no hay negocios', () {
    const vm = SavedPromotionsViewVM(businesses: [pizzeria, taberna]);

    expect(vm.businessesWithCurrentPromos, isEmpty);
    expect(vm.businessesWithUpcomingPromos, isEmpty);
  });
}
