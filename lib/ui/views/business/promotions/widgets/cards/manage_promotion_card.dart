part of '../../manage_promotions_page.dart';

/// La card de promo en modo dueño.
///
/// El diseño vive en [PromotionCardView]; acá solo se decide qué va arriba a
/// la derecha de la foto — el menú de editar/borrar, o el corazón si quien
/// mira no puede editar este negocio.
class PromotionCard extends StatelessWidget {
  final PromotionDM promo;

  /// Sin usar desde antes del rediseño; ningún llamador lo pasa.
  final Size? size;

  const PromotionCard({super.key, required this.promo, this.size});

  @override
  Widget build(BuildContext context) {
    return PromotionCardView(
      promo: promo,
      placeholderFit: BoxFit.none,
      trailingAction: _LikeOrEditWidget(key: Key('like-or-edit-promo: ${promo.uuid}'), promo: promo),
    );
  }
}

class _LikeOrEditWidget extends StatelessWidget {
  const _LikeOrEditWidget({
    super.key,
    required this.promo,
  });

  final PromotionDM promo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePromotionsCubit, ManagePromotionsState>(
      builder: (context, state) {
        final vm = state.vm;

        if (vm.loggedUserCanEdit) {
          // El icono va blanco siempre: el vidrio oscuro más el degradado de
          // la foto le dan fondo, tenga la promo imagen o el placeholder.
          // Antes el color dependía de `vm.hasMediaContent` y con placeholder
          // quedaba morado sobre gris claro.
          return FoodlyGlassButton(
            child: PopupMenuButton<String>(
              elevation: 3,
              padding: EdgeInsets.zero,
              tooltip: S.current.edit,
              icon: const Icon(Bootstrap.three_dots_vertical, color: Colors.white),
              onSelected: (value) {
                final cubit = context.read<ManagePromotionsCubit>();

                if (value == 'edit') {
                  cubit
                    ..setControllers(promo: promo)
                    ..updateEditMode(PromotionEditing.title);

                  if (vm.indexView != 1) {
                    vm.controller?.animateToPage(1, duration: Durations.short4, curve: Curves.decelerate);
                    cubit.updateView(1);
                  }
                }

                if (value == 'delete') {
                  cubit.deletePromotion(promo.uuid);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      const Icon(Bootstrap.pencil_square, color: FoodlyThemes.primaryFoodly),
                      Text(S.current.edit).paddingLeft(14)
                    ],
                  ),
                ),
                if (promo.uuid.isNotEmpty)
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        const Icon(Bootstrap.trash3, color: FoodlyThemes.primaryFoodly),
                        Text(S.current.delete).paddingLeft(14)
                      ],
                    ),
                  ),
              ],
            ),
          );
        }

        return PromoFavoriteButton(promo: promo, favoriteKey: Key(promo.uuid));
      },
    );
  }
}
