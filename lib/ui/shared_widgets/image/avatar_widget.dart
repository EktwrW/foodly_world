import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

enum AvatarType { generic, user, business }

enum AvatarStyle { square, circle }

class AvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  final double width;
  final double height;
  final bool enabled;
  final AvatarType? avatarType;
  final BoxFit? boxFit;
  final AvatarStyle? avatarStyle;

  const AvatarWidget({
    super.key,
    required this.avatarUrl,
    this.width = 30,
    this.height = 30,
    this.enabled = true,
    this.avatarType = AvatarType.generic,
    this.boxFit,
    this.avatarStyle = AvatarStyle.circle,
  });

  static const _radius = Radius.circular(8);

  // Getters para mejorar legibilidad
  bool get _hasValidUrl => avatarUrl?.isNotEmpty ?? false;
  bool get isUser => avatarType == AvatarType.user;
  bool get isBusiness => avatarType == AvatarType.business;
  bool get isSquare => avatarStyle == AvatarStyle.square;

  // Decoración base según el estilo
  /// Ancho de decodificación: 3× el tamaño pintado. `null` cuando el ancho
  /// no es finito —las tarjetas en rejilla pasan `double.infinity`—, porque
  /// `(infinity * 3).ceil()` lanza y dejaba una caja de error en cada tarjeta
  /// (lo encontró la revisión de 2026-09-03).
  int? get _memCacheWidth => width.isFinite ? (width * 3).ceil() : null;

  /// El `imageBuilder` pinta el provider ORIGINAL: `memCacheWidth` solo
  /// afecta al `Image` interno que OctoImage descarta cuando hay builder. Para
  /// que la decodificación pequeña sea la que se pinta, hay que envolver acá
  /// con la misma clave (`ResizeImage` + mismo ancho): un solo decode.
  ImageProvider _resized(ImageProvider provider) =>
      _memCacheWidth == null ? provider : ResizeImage(provider, width: _memCacheWidth);

  BoxDecoration get _baseDecoration => BoxDecoration(
        shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSquare ? const BorderRadius.all(_radius) : null,
      );

  // Placeholders optimizados
  Widget get userAvatarPlaceholder => CachedNetworkImage(cacheManager: FoodlyImageCache.manager, memCacheWidth: _memCacheWidth, imageUrl: FoodlyStrings.USER_AVATAR_PLACEHOLDER,
        fit: boxFit,
        imageBuilder: (context, imageProvider) => Container(
          constraints: BoxConstraints.tight(Size(width, height)),
          decoration: _baseDecoration.copyWith(
            image: DecorationImage(image: _resized(imageProvider), fit: BoxFit.cover),
          ),
        ),
        fadeInDuration: Durations.medium3,
        fadeOutDuration: Durations.medium3,
      );

  Widget get businessPlaceholder => CachedNetworkImage(cacheManager: FoodlyImageCache.manager, memCacheWidth: _memCacheWidth, imageUrl: FoodlyStrings.LOGO_PLACEHOLDER,
        fit: boxFit,
        imageBuilder: (context, imageProvider) => Container(
          constraints: BoxConstraints.tight(Size(width, height)),
          decoration: _baseDecoration.copyWith(
            image: DecorationImage(image: _resized(imageProvider), fit: BoxFit.cover),
          ),
        ),
        fadeInDuration: Durations.medium3,
        fadeOutDuration: Durations.medium3,
      );

  Widget get _loadingPlaceholder => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox.square(
              dimension: height,
              child: const CircularProgressIndicator.adaptive(backgroundColor: FoodlyThemes.secondaryFoodly),
            ),
          ),
        ],
      );

  Widget _buildPlaceholder(BuildContext context, String? url) => isUser
      ? userAvatarPlaceholder
      : isBusiness
          ? businessPlaceholder
          : _loadingPlaceholder;

  @override
  Widget build(BuildContext context) {
    if (!_hasValidUrl) {
      return SizedBox(
        width: width,
        height: height,
        child: isBusiness ? businessPlaceholder : userAvatarPlaceholder,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(cacheManager: FoodlyImageCache.manager, memCacheWidth: _memCacheWidth, imageUrl: avatarUrl!,
        fit: boxFit,
        imageBuilder: (context, imageProvider) => Container(
          constraints: BoxConstraints.tight(Size(width, height)),
          decoration: _baseDecoration.copyWith(
            image: DecorationImage(
              image: _resized(imageProvider),
              fit: BoxFit.cover,
            ),
          ),
        ),
        errorWidget: (_, __, ___) => isBusiness ? businessPlaceholder : userAvatarPlaceholder,
        placeholder: _buildPlaceholder,
        fadeInDuration: Durations.medium3,
        fadeOutDuration: Durations.medium3,
        placeholderFadeInDuration: Durations.medium3,
      ),
    );
  }
}
