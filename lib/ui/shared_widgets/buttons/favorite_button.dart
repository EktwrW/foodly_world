import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;

/// Un enum que representa los diferentes tipos de elementos que pueden ser favoritos
enum FavoriteItemType {
  businessPage,
  businessCard,
  menu,
  foodItem,
  drinkItem,
  comboItem,
  promotion;

  bool get isMenuOrBusinessPage => this == menu || this == businessPage;
  bool get isBusinessCard => this == businessCard;
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
  final IconData addFavoriteIcon;
  final IconData isFavoriteIcon;
  final double? alphaOpacity;

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
    this.addFavoriteIcon = FontAwesome.heart_circle_plus_solid,
    this.isFavoriteIcon = FontAwesome.heart_circle_check_solid,
    this.alphaOpacity = .15,
  });

  /// Factory constructor para negocio
  factory FavoriteButton.forBusinessPage({
    Key? key,
    required BusinessDM business,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.transparent,
    Color unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    String? tooltip,
    Color likeColor = FoodlyThemes.primaryFoodly,
    Color unlikeColor = Colors.white,
    bool enableShadows = true,
    bool enableBackground = true,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.businessPage,
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
      addFavoriteIcon: Bootstrap.bookmark_plus,
      isFavoriteIcon: Bootstrap.bookmark_heart_fill,
    );
  }

  /// Factory constructor para tarjeta de negocio
  factory FavoriteButton.forBusinessCard({
    Key? key,
    required BusinessDM business,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.white70,
    Color unlikedBackgroundColor = Colors.white,
    String? tooltip,
    Color likeColor = FoodlyThemes.primaryFoodly,
    Color unlikeColor = FoodlyThemes.primaryFoodly,
    bool enableShadows = true,
    bool enableBackground = true,
    double? alphaOpacity = .69,
  }) {
    return FavoriteButton._(
      key: key,
      type: FavoriteItemType.businessCard,
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
      addFavoriteIcon: Bootstrap.bookmark_plus,
      isFavoriteIcon: Bootstrap.bookmark_heart_fill,
      alphaOpacity: alphaOpacity,
    );
  }

  /// Factory constructor para menú
  factory FavoriteButton.forMenu({
    Key? key,
    required MenuDM menu,
    double iconSize = 20,
    double diameter = 34,
    Color likedBackgroundColor = Colors.transparent,
    Color unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    String? tooltip,
    Color likeColor = FoodlyThemes.primaryFoodly,
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
      addFavoriteIcon: Bootstrap.bookmark_plus,
      isFavoriteIcon: Bootstrap.bookmark_heart_fill,
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

  /// Factory constructor para item de combo
  factory FavoriteButton.forComboItem({
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
      type: FavoriteItemType.comboItem,
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
        FavoriteItemType.businessPage || FavoriteItemType.businessCard => vm.favoriteBusinessIds.contains(itemId),
        FavoriteItemType.menu => vm.favoriteMenuIds.contains(itemId),
        FavoriteItemType.promotion => vm.savedPromotionIds.contains(itemId),
        _ => vm.favoriteItemIds.contains(itemId),
      },
      orElse: () => false,
    );
  }

  /// Ejecuta la acción de toggle basada en el tipo de elemento
  void _toggleFavorite(FavoritesCubit favoritesCubit) => switch (type) {
        FavoriteItemType.businessPage ||
        FavoriteItemType.businessCard =>
          favoritesCubit.toggleBusinessFavorite(item as BusinessDM),
        FavoriteItemType.menu => favoritesCubit.toggleMenuFavorite(item as MenuDM),
        FavoriteItemType.foodItem => favoritesCubit.toggleFoodItemFavorite(item as ItemDM),
        FavoriteItemType.drinkItem => favoritesCubit.toggleDrinkItemFavorite(item as ItemDM),
        FavoriteItemType.comboItem => favoritesCubit.toggleComboItemFavorite(item as ItemDM),
        FavoriteItemType.promotion => favoritesCubit.togglePromotionFavorite(item as PromotionDM),
      };

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = context.read<FavoritesCubit>();

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) {
        final prevFavorite = previous.maybeWhen(
          loaded: (vm) => _isFavorite(previous),
          orElse: () => false,
        );
        final currFavorite = current.maybeWhen(
          loaded: (vm) => _isFavorite(current),
          orElse: () => false,
        );

        return prevFavorite != currFavorite;
      },
      builder: (context, state) {
        final isFavorite = _isFavorite(state);
        final isInitialBuild = context.mounted && !state.vm.hasBeenToggled(itemId);

        final shouldAnimate = isFavorite && !isInitialBuild;

        return UIFavoriteWidget(
          key: key,
          addFavoriteIcon: addFavoriteIcon,
          isFavoriteIcon: isFavoriteIcon,
          liked: isFavorite,
          onPressed: () {
            _toggleFavorite(favoritesCubit);
          },
          iconSize: iconSize,
          diameter: diameter,
          likedBackgroundColor: likedBackgroundColor,
          unlikedBackgroundColor: unlikedBackgroundColor,
          tooltip: tooltip ?? S.current.addToFavorites,
          likeColor: likeColor,
          unlikeColor: unlikeColor,
          enableShadows: enableShadows,
          enableBackground: enableBackground,
          useMenuOrBusinessStyle: type.isMenuOrBusinessPage,
          shouldAnimate: shouldAnimate,
          alphaOpacity: alphaOpacity,
          neumorphicDepth: type.isMenuOrBusinessPage ? 2 : 4,
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
  final bool shouldAnimate;
  final bool useMenuOrBusinessStyle;
  final double neumorphicDepth;
  final IconData addFavoriteIcon;
  final IconData isFavoriteIcon;
  final double? alphaOpacity;

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
    this.useMenuOrBusinessStyle = false,
    this.neumorphicDepth = 4,
    required this.addFavoriteIcon,
    required this.isFavoriteIcon,
    this.shouldAnimate = false,
    this.alphaOpacity = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    // Si estamos utilizando el estilo de menú, renderizar el botón neumórfico
    if (useMenuOrBusinessStyle) {
      return CustomRoundedNeumorphicButton(
        onPressed: onPressed,
        tooltip: tooltip ?? S.current.saveMenu,
        iconSize: 25,
        depth: neumorphicDepth,
        child: _buildMenuContent(),
      );
    }

    // Si no, renderizar el botón circular estándar
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
                      ? (liked ? likedBackgroundColor : unlikedBackgroundColor?.withValues(alpha: alphaOpacity))
                      : Colors.transparent,
                ),
              ),
            ),
            _buildStandardContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        !liked
            ? FadeIn(
                child: Icon(
                  addFavoriteIcon,
                  color: FoodlyThemes.primaryFoodly,
                  size: iconSize,
                ),
              )
            : _BuildAnimatedFavoriteContentWdg(
                key: key,
                likeColor: likeColor,
                iconSize: iconSize,
                enableShadows: enableShadows,
                addFavoriteIcon: addFavoriteIcon,
                isFavoriteIcon: isFavoriteIcon,
                shouldAnimate: shouldAnimate,
              ),
      ],
    );
  }

  Widget _buildStandardContent() {
    return !liked
        ? FadeIn(
            child: Icon(
              addFavoriteIcon,
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
        : _BuildAnimatedFavoriteContentWdg(
            key: key,
            likeColor: likeColor,
            iconSize: iconSize,
            enableShadows: enableShadows,
            addFavoriteIcon: addFavoriteIcon,
            isFavoriteIcon: isFavoriteIcon,
            shouldAnimate: shouldAnimate,
          );
  }
}

class _BuildAnimatedFavoriteContentWdg extends StatelessWidget {
  const _BuildAnimatedFavoriteContentWdg({
    super.key,
    required this.likeColor,
    required this.iconSize,
    required this.enableShadows,
    required this.addFavoriteIcon,
    required this.isFavoriteIcon,
    this.shouldAnimate = false,
  });

  final Color? likeColor;
  final double iconSize;
  final bool enableShadows;
  final IconData addFavoriteIcon;
  final IconData isFavoriteIcon;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ZoomOut(
          animate: shouldAnimate,
          from: 1.6,
          child: Icon(shouldAnimate ? addFavoriteIcon : isFavoriteIcon, color: likeColor, size: iconSize),
        ),
        ElasticIn(
          animate: shouldAnimate,
          child: Icon(
            isFavoriteIcon,
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
    );
  }
}
