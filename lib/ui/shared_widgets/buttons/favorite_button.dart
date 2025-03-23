import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

/// Un enum que representa los diferentes tipos de elementos que pueden ser favoritos
enum FavoriteItemType {
  business,
  menu,
  foodItem,
  drinkItem,
  promotion,
}

/// Un widget que encapsula la funcionalidad de favoritos integrándose con el FavoritesCubit
class FavoriteButton extends StatelessWidget {
  /// El tipo de elemento que este botón representa
  final FavoriteItemType type;

  /// El ID del elemento
  final String itemId;

  /// El objeto completo (usado para añadir a favoritos si no existe)
  final Object item;

  /// Configuración visual
  final double iconSize;
  final double diameter;
  final Color likedBackgroundColor;
  final Color unlikedBackgroundColor;
  final String? tooltip;
  final Color likeColor;
  final Color unlikeColor;
  final bool enableShadows;
  final bool enableBackground;

  /// Constructor privado base
  const FavoriteButton._({
    super.key,
    required this.type,
    required this.itemId,
    required this.item,
    this.iconSize = 20,
    this.diameter = 34,
    this.likedBackgroundColor = Colors.white60,
    this.unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    this.tooltip,
    this.likeColor = FoodlyThemes.favourites,
    this.unlikeColor = Colors.white,
    this.enableShadows = true,
    this.enableBackground = true,
  });

  /// Factory constructor para negocio
  factory FavoriteButton.forBusiness({
    Key? key,
    required BusinessDM business,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.white60,
    Color unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    String? tooltip,
    Color likeColor = FoodlyThemes.favourites,
    Color unlikeColor = Colors.white,
    bool enableShadows = true,
    bool enableBackground = true,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.business,
      itemId: business.uuid,
      item: business,
      iconSize: iconSize,
      diameter: diameter,
      likedBackgroundColor: likedBackgroundColor,
      unlikedBackgroundColor: unlikedBackgroundColor,
      tooltip: tooltip,
      likeColor: likeColor,
      unlikeColor: unlikeColor,
      enableShadows: enableShadows,
      enableBackground: enableBackground,
    );
  }

  /// Factory constructor para menú
  factory FavoriteButton.forMenu({
    Key? key,
    required MenuDM menu,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.white60,
    required Color unlikedBackgroundColor,
    String? tooltip,
    required Color likeColor,
    Color unlikeColor = Colors.white,
    bool enableShadows = true,
    bool enableBackground = true,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.menu,
      itemId: menu.uuid,
      item: menu,
      iconSize: iconSize,
      diameter: diameter,
      likedBackgroundColor: likedBackgroundColor,
      unlikedBackgroundColor: unlikedBackgroundColor,
      tooltip: tooltip,
      likeColor: likeColor,
      unlikeColor: unlikeColor,
      enableShadows: enableShadows,
      enableBackground: enableBackground,
    );
  }

  /// Factory constructor para item de comida
  factory FavoriteButton.forFoodItem({
    Key? key,
    required ItemDM item,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.white60,
    Color unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    String? tooltip,
    Color likeColor = FoodlyThemes.favourites,
    Color unlikeColor = Colors.white,
    bool enableShadows = true,
    bool enableBackground = true,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.foodItem,
      itemId: item.uuid,
      item: item,
      iconSize: iconSize,
      diameter: diameter,
      likedBackgroundColor: likedBackgroundColor,
      unlikedBackgroundColor: unlikedBackgroundColor,
      tooltip: tooltip,
      likeColor: likeColor,
      unlikeColor: unlikeColor,
      enableShadows: enableShadows,
      enableBackground: enableBackground,
    );
  }

  /// Factory constructor para item de bebida
  factory FavoriteButton.forDrinkItem({
    Key? key,
    required ItemDM item,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.white60,
    Color unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    String? tooltip,
    Color likeColor = FoodlyThemes.favourites,
    Color unlikeColor = Colors.white,
    bool enableShadows = true,
    bool enableBackground = true,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.drinkItem,
      itemId: item.uuid,
      item: item,
      iconSize: iconSize,
      diameter: diameter,
      likedBackgroundColor: likedBackgroundColor,
      unlikedBackgroundColor: unlikedBackgroundColor,
      tooltip: tooltip,
      likeColor: likeColor,
      unlikeColor: unlikeColor,
      enableShadows: enableShadows,
      enableBackground: enableBackground,
    );
  }

  /// Factory constructor para promoción
  factory FavoriteButton.forPromotion({
    Key? key,
    required PromotionDM promotion,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.white60,
    Color unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    String? tooltip,
    Color likeColor = FoodlyThemes.favourites,
    Color unlikeColor = Colors.white,
    bool enableShadows = true,
    bool enableBackground = true,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.promotion,
      itemId: promotion.uuid,
      item: promotion,
      iconSize: iconSize,
      diameter: diameter,
      likedBackgroundColor: likedBackgroundColor,
      unlikedBackgroundColor: unlikedBackgroundColor,
      tooltip: tooltip,
      likeColor: likeColor,
      unlikeColor: unlikeColor,
      enableShadows: enableShadows,
      enableBackground: enableBackground,
    );
  }

  /// Determina si el elemento actual es favorito basado en su tipo
  bool _isFavorite(FavoritesState state) {
    if (itemId.isEmpty) return false;

    return state.maybeWhen(
      loaded: (vm) => switch (type) {
        FavoriteItemType.business => vm.favoriteBusinessIds.contains(itemId),
        FavoriteItemType.menu => vm.favoriteMenuIds.contains(itemId),
        FavoriteItemType.promotion => vm.savedPromotionIds.contains(itemId),
        _ => vm.favoriteItemIds.contains(itemId),
      },
      orElse: () => false,
    );
  }

  /// Ejecuta la acción de toggle basada en el tipo de elemento
  void _toggleFavorite(FavoritesCubit favoritesCubit) => switch (type) {
        FavoriteItemType.business => favoritesCubit.toggleBusinessFavorite(item as BusinessDM),
        FavoriteItemType.menu => favoritesCubit.toggleMenuFavorite(item as MenuDM),
        FavoriteItemType.foodItem => favoritesCubit.toggleFoodItemFavorite(item as ItemDM),
        FavoriteItemType.drinkItem => favoritesCubit.toggleDrinkItemFavorite(item as ItemDM),
        FavoriteItemType.promotion => favoritesCubit.togglePromotionFavorite(item as PromotionDM),
      };

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = context.read<FavoritesCubit>();

    return BlocSelector<FavoritesCubit, FavoritesState, bool>(
      selector: (state) => _isFavorite(state),
      builder: (context, isFavorite) {
        return UIFavoriteWidget(
          liked: isFavorite,
          onPressed: () => _toggleFavorite(favoritesCubit),
          iconSize: iconSize,
          diameter: diameter,
          likedBackgroundColor: likedBackgroundColor,
          unlikedBackgroundColor: unlikedBackgroundColor,
          tooltip: tooltip ?? S.current.addToFavorites,
          likeColor: likeColor,
          unlikeColor: unlikeColor,
          enableShadows: enableShadows,
          enableBackground: enableBackground,
        );
      },
    );
  }
}

class UIFavoriteWidget extends StatelessWidget {
  final void Function()? onPressed;
  final bool liked;
  final double iconSize;
  final double diameter;
  final Color? likedBackgroundColor;
  final Color? unlikedBackgroundColor;
  final String? tooltip;
  final Color? likeColor;
  final Color? unlikeColor;
  final bool enableShadows;
  final bool enableBackground;

  const UIFavoriteWidget({
    super.key,
    this.onPressed,
    required this.liked,
    this.iconSize = 20,
    this.diameter = 34,
    this.likedBackgroundColor = Colors.white60,
    this.unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    this.tooltip,
    this.likeColor = FoodlyThemes.favourites,
    this.unlikeColor = Colors.white,
    this.enableShadows = true,
    this.enableBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? S.current.addToFavorites,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.square(
              dimension: diameter,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: enableBackground
                    ? (liked ? likedBackgroundColor : unlikedBackgroundColor?.withValues(alpha: .15))
                    : Colors.transparent,
              )),
            ),
            !liked
                ? FadeIn(
                    child: Icon(
                      FontAwesome.heart_circle_plus_solid,
                      color: unlikeColor,
                      shadows: enableShadows
                          ? [
                              Shadow(
                                  color: FoodlyThemes.primaryFoodly.withValues(alpha: .39),
                                  offset: const Offset(1, 2),
                                  blurRadius: 4.0),
                            ]
                          : [],
                      size: iconSize,
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      ZoomOut(
                        from: 1.6,
                        child: Icon(
                          FontAwesome.heart_circle_bolt_solid,
                          color: likeColor,
                          size: iconSize,
                        ),
                      ),
                      ElasticIn(
                        child: Icon(
                          FontAwesome.heart_circle_check_solid,
                          color: likeColor,
                          size: iconSize,
                          shadows: enableShadows
                              ? [
                                  const Shadow(color: Colors.white30, offset: Offset(1, 2), blurRadius: 4.0),
                                ]
                              : [],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
