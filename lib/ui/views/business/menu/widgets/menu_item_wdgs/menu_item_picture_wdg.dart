part of '../menu_category_builder_wdg.dart';

class MenuItemPictureWdg extends StatelessWidget {
  const MenuItemPictureWdg({
    super.key,
    required this.isEditing,
    required this.item,
    required this.menuCategory,
    required this.subCategory,
  });

  final bool isEditing;
  final ItemDM item;
  final MenuCategory menuCategory;
  final CategoryDM subCategory;

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
            isEditing ? Icons.image_search_rounded : Icons.dining_outlined,
            style: ui.NeumorphicStyle(
              shape: ui.NeumorphicShape.concave,
              color: FoodlyThemes.accentColor,
              depth: 2,
            ),
            size: 50,
          ),
          if (isEditing)
            Text(
              S.current.addPhoto,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: FoodlyTextStyles.editableAvatarText,
            ).paddingSymmetric(horizontal: 10, vertical: 4),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.isEditing
          ? () async {
              FocusScope.of(context).unfocus();
              await Future.delayed(Durations.medium1);
              if (context.mounted) {
                await pickImage(
                  context,
                  cropStyle: CropStyle.rectangle,
                  aspectRatioPresets: [CropAspectRatioPreset.square],
                ).then((path) => (context.mounted && path.isNotEmpty)
                    ? context.read<MenuCubit>().updateItemPhotoPath(
                          item,
                          menuCategory,
                          subCategory.uuid,
                          path,
                        )
                    : null);
              }
            }
          : null,
      child: Container(
        width: 110,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: FoodlyThemes.primaryFoodly.withValues(alpha: isEditing ? .036 : .093)),
        clipBehavior: Clip.hardEdge,
        child: (item.referencePhotos?.isEmpty ?? true) && (item.imagePaths.isEmpty)
            ? _buildPlaceholder
            : _buildImageWidget,
      ),
    ).paddingOnly(top: 10, left: 10);
  }
}
