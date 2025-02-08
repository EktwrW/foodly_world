import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart';

enum AvatarType { generic, user, business }

enum AvatarStyle { square, circle }

class AvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  final double? width;
  final double? height;
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
  BoxDecoration get _baseDecoration => BoxDecoration(
        shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSquare ? const BorderRadius.all(_radius) : null,
      );

  // Placeholders optimizados
  Widget get userAvatarPlaceholder => Icon(
        Bootstrap.person_circle,
        color: enabled ? FoodlyThemes.accentColor : NeumorphicColors.disabled,
        size: height,
      );

  Widget get businessPlaceholder => DecoratedBox(
        decoration: _baseDecoration.copyWith(color: Colors.grey[200]),
        child: SizedBox.square(
          dimension: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicIcon(
                FontAwesome.store_solid,
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  color: NeumorphicColors.disabled,
                  depth: enabled ? 2 : 0,
                ),
                size: (height ?? 30) / 2,
              ),
            ],
          ),
        ),
      );

  Widget get _loadingPlaceholder => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: height ?? 40,
            child: const CircularProgressIndicator.adaptive(backgroundColor: FoodlyThemes.secondaryFoodly),
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
      return isBusiness ? businessPlaceholder : userAvatarPlaceholder;
    }

    return CachedNetworkImage(
      imageUrl: avatarUrl!,
      fit: boxFit,
      imageBuilder: (context, imageProvider) => Container(
        constraints: BoxConstraints.tight(Size(width!, height!)),
        decoration: _baseDecoration.copyWith(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (_, __, ___) => isBusiness ? businessPlaceholder : userAvatarPlaceholder,
      placeholder: _buildPlaceholder,
      fadeInDuration: Durations.medium3,
      fadeOutDuration: Durations.medium3,
      placeholderFadeInDuration: Durations.medium3,
    );
  }
}
