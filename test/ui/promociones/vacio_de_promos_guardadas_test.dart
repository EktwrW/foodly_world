import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/cubit/saved_promotions_view_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/saved_promotions_page.dart';

/// Promociones guardadas tiene DOS pestañas —vigentes y proximas— y su vacio
/// decia lo mismo en las dos: «aun no tienes promociones guardadas en esta
/// seccion». Con promociones en la otra pestaña eso es falso, y ademas deja al
/// usuario sin saber que la otra existe.
///
/// Lo que se fija aqui:
///   1. que el vacio de una pestaña diga CUAL esta vacia y lleve a la otra;
///   2. que si la otra tambien esta vacia no haya boton a ninguna parte;
///   3. que el salto mueva el indice del cubit, que es de donde el conmutador
///      saca cual esta marcada.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  NearbyPromotionDM promo(String uuid) => NearbyPromotionDM(uuid: uuid, title: 'Promo $uuid', businessUuid: 'n1');
  const negocio = SavedPromoBusinessDM(uuid: 'n1', name: 'La Pizzeria');

  /// Pinta UNA pestaña con el cubit real por detras.
  Future<SavedPromotionsViewCubit> pintar(
    WidgetTester tester, {
    required SavedPromotionsIndexView seccion,
    required List<NearbyPromotionDM> vigentes,
    required List<NearbyPromotionDM> proximas,
  }) async {
    final cubit = SavedPromotionsViewCubit(vigentes, proximas, const [negocio]);
    final deEstaSeccion = seccion == SavedPromotionsIndexView.currentPromos ? vigentes : proximas;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<SavedPromotionsViewCubit>.value(
          value: cubit,
          child: SavedPromotionsView(
            businesses: const [negocio],
            promos: deEstaSeccion,
            seccion: seccion,
          ),
        ),
      ),
    ));
    await tester.pump();
    return cubit;
  }

  FoodlyEmptyView vacio(WidgetTester tester) => tester.widget<FoodlyEmptyView>(find.byType(FoodlyEmptyView));

  testWidgets('sin vigentes pero con proximas: dice cual falta y lleva a la otra', (tester) async {
    await pintar(
      tester,
      seccion: SavedPromotionsIndexView.currentPromos,
      vigentes: const [],
      proximas: [promo('p1')],
    );

    final v = vacio(tester);
    expect(v.intent, FoodlyEmptyIntent.filtro);
    expect(v.title, S.current.savedPromosNoCurrentTitle);
    expect(v.subtitle, S.current.savedPromosSectionEmptyBody);
    expect(find.text(S.current.savedPromosSeeOther(S.current.savedPromotionsTabUpcoming)), findsOneWidget);
  });

  testWidgets('sin proximas pero con vigentes: el titulo es el OTRO', (tester) async {
    await pintar(
      tester,
      seccion: SavedPromotionsIndexView.upcomingPromos,
      vigentes: [promo('p1')],
      proximas: const [],
    );

    final v = vacio(tester);
    expect(v.title, S.current.savedPromosNoUpcomingTitle);
    expect(find.text(S.current.savedPromosSeeOther(S.current.savedPromotionsTabCurrent)), findsOneWidget);
  });

  testWidgets('el boton mueve el indice del cubit, que es de donde el conmutador saca cual esta marcada',
      (tester) async {
    final cubit = await pintar(
      tester,
      seccion: SavedPromotionsIndexView.currentPromos,
      vigentes: const [],
      proximas: [promo('p1')],
    );
    expect(cubit.state.vm.indexView, 0);

    await tester.tap(find.text(S.current.savedPromosSeeOther(S.current.savedPromotionsTabUpcoming)));
    await tester.pump();

    expect(cubit.state.vm.indexView, SavedPromotionsIndexView.upcomingPromos.index);
  });

  testWidgets('con las dos vacias no hay pestaña a la que mandar a nadie: sin boton', (tester) async {
    await pintar(
      tester,
      seccion: SavedPromotionsIndexView.currentPromos,
      vigentes: const [],
      proximas: const [],
    );

    final v = vacio(tester);
    expect(v.intent, FoodlyEmptyIntent.nuevo);
    expect(v.title, S.current.noSavedPromotions);
    expect(v.onAction, isNull);
  });

  testWidgets('con promociones que no casan con ningun negocio, tambien es un vacio', (tester) async {
    // La vista cruza promos con negocios: una promo de un negocio que no viene
    // en la respuesta no se puede pintar. Antes esto caia en el mismo texto
    // ambiguo que todo lo demas.
    const huerfana = NearbyPromotionDM(uuid: 'p9', title: 'Sin negocio', businessUuid: 'otro');
    await pintar(
      tester,
      seccion: SavedPromotionsIndexView.currentPromos,
      vigentes: [huerfana],
      proximas: [promo('p1')],
    );

    expect(vacio(tester).intent, FoodlyEmptyIntent.filtro);
  });
}
