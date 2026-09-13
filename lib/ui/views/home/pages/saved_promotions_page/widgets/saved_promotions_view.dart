part of '../saved_promotions_page.dart';

/// Una de las dos pestañas de promociones guardadas.
///
/// Es publica solo para poder medirla: su vacio decide entre «no tienes
/// promociones» y «no hay ninguna en esta pestaña», y esa rama —con el salto a
/// la otra pestaña— es justo lo que hay que fijar.
class SavedPromotionsView extends StatelessWidget {
  final List<SavedPromoBusinessDM> businesses;
  final List<NearbyPromotionDM> promos;
  final SavedPromotionsIndexView seccion;

  const SavedPromotionsView({
    super.key,
    required this.businesses,
    required this.promos,
    required this.seccion,
  });

  /// El vacio de una pestaña NO es el vacio de la pagina: si la otra tiene
  /// promociones, esto es un vacio por filtro y la salida es cambiar de
  /// pestaña. El conmutador se pinta desde `vm.indexView`, asi que moverlo
  /// desde aqui lo deja sincronizado.
  Widget _vacio(BuildContext context) {
    final cubit = context.read<SavedPromotionsViewCubit>();
    final vm = cubit.state.vm;
    final otra = seccion.otra;
    final promosDeLaOtra = otra == SavedPromotionsIndexView.currentPromos ? vm.currentPromos : vm.upcomingPromos;

    // Sin nada en ninguna de las dos no hay pestaña a la que mandar a nadie.
    // Pasa cuando una promo pasa el filtro de la pagina pero su negocio no
    // viene en la respuesta.
    if (promosDeLaOtra.isEmpty) {
      return FoodlyEmptyView(
        title: S.current.noSavedPromotions,
        subtitle: S.current.savedPromosEmptyBody,
        icon: const Icon(Bootstrap.bookmark_heart, size: 40, color: FoodlyThemes.primaryFoodly),
      );
    }

    return FoodlyEmptyView(
      intent: FoodlyEmptyIntent.filtro,
      title: seccion.emptyTitle,
      subtitle: S.current.savedPromosSectionEmptyBody,
      actionLabel: S.current.savedPromosSeeOther(otra.label),
      onAction: () {
        cubit.changeView(otra.index);
        // `animateToPage` REVIENTA si el controlador no esta enganchado a un
        // PageView todavia. En la pagina siempre lo esta, pero el indice del
        // cubit es lo que decide que pestaña se marca, asi que el salto visual
        // puede fallar sin llevarse por delante el cambio de pestaña.
        if (vm.controller?.hasClients ?? false) {
          vm.controller!.animateToPage(otra.index, duration: Durations.short4, curve: Curves.decelerate);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (businesses.isEmpty || promos.isEmpty) return _vacio(context);

    // Filtramos los negocios para mostrar solo aquellos que tienen promociones
    final List<SavedPromoBusinessDM> businessesWithPromos = [];
    final Map<String, List<NearbyPromotionDM>> businessPromosMap = {};

    // Agrupamos las promociones por negocio
    for (final business in businesses) {
      final businessPromos = promos.where((p) => p.businessUuid == business.uuid).toList();

      // Solo incluimos negocios que tienen al menos una promoción
      if (businessPromos.isNotEmpty) {
        businessesWithPromos.add(business);
        businessPromosMap[business.uuid] = businessPromos;
      }
    }

    if (businessesWithPromos.isEmpty) return _vacio(context);

    return Column(
      spacing: 12,
      children: [
        ClayText(
          seccion.sectionTitle,
          textColor: FoodlyThemes.primaryFoodly,
          style: FoodlyTextStyles.sectionsTitle.copyWith(fontSize: 15),
        ).paddingTop(16),
        Expanded(
          // Tarjetas de negocio: en tableta caben mas columnas, no tarjetas
          // mas anchas (2026-09-12). Ver [ListaAdaptativa].
          child: ListaAdaptativa(
            padding: const EdgeInsets.only(bottom: 160),
            separacion: 16,
            elementos: businessesWithPromos.length,
            constructor: (_, i) {
              final business = businessesWithPromos[i];
              final businessPromos = businessPromosMap[business.uuid] ?? [];

              return _BusinessWithPromosCard(
                key: Key('business-with-promos-${business.uuid}'),
                business: business,
                promos: businessPromos,
              );
            },
          ),
        ),
      ],
    );
  }
}
