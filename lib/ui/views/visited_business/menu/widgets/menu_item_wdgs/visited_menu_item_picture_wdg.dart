part of '../visited_menu_category_builder_wdg.dart';

class VisitedMenuItemPictureWdg extends StatelessWidget {
  const VisitedMenuItemPictureWdg({
    super.key,
    required this.item,
    required this.menuCategory,
  });

  final ItemDM item;
  final MenuCategory menuCategory;

  String get _imageSource {
    if (menuCategory.isFood) {
      return item.imagePaths.firstOrNull ?? item.referencePhotos?.lastOrNull?.businessFoodPhotoUrl ?? '';
    }
    if (menuCategory.isDrinks) {
      return item.imagePaths.firstOrNull ?? item.referencePhotos?.lastOrNull?.businessDrinkPhotoUrl ?? '';
    }
    return item.imagePaths.firstOrNull ?? item.referencePhotos?.lastOrNull?.businessComboPhotoUrl ?? '';
  }

  Widget get _buildImageWidget {
    if (_imageSource.isEmpty) return const SizedBox.shrink();

    if (_imageSource.startsWith('http://') || _imageSource.startsWith('https://')) {
      return CachedNetworkImage(
        imageUrl: _imageSource,
        fit: BoxFit.cover,
        placeholder: (context, url) => const LoadingWidgetFoodlyIso(height: 28),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }

    // Modificación aquí para manejar imágenes locales
    return _buildLocalImage();
  }

  Widget _buildLocalImage() {
    if (kIsWeb) {
      return Image.network(
        _imageSource,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      );
    }

    return Image.file(
      File(_imageSource),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        di<Logger>().e('Error loading image: $error');
        return const Icon(Icons.error);
      },
    );
  }

  Widget get _buildPlaceholder => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ui.NeumorphicIcon(
            Icons.dining_outlined,
            style: ui.NeumorphicStyle(
              shape: ui.NeumorphicShape.concave,
              color: FoodlyThemes.accentColor,
              depth: 2,
            ),
            size: 50,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: FoodlyThemes.primaryFoodly.withValues(alpha: .093)),
      clipBehavior: Clip.hardEdge,
      child:
          (item.referencePhotos?.isEmpty ?? true) && (item.imagePaths.isEmpty) ? _buildPlaceholder : _buildImageWidget,
    ).paddingOnly(top: 10, left: 10);
  }
}
