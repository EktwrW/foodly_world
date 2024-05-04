class AssetUtils {
  const AssetUtils._();

  static const String ICONS_PATH = 'assets/icons/';
  static const String IMAGES_PATH = 'assets/images/';

  static String getIconPath(String imageName) {
    return '$ICONS_PATH$imageName';
  }

  static String getImagePath(String imageName) {
    return '$IMAGES_PATH$imageName';
  }
}
