import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart';

enum AvatarType { generic, user, business }

class AvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  final double? width;
  final double? height;
  final bool enabled;
  final AvatarType? avatarType;

  const AvatarWidget({
    super.key,
    required this.avatarUrl,
    this.width = 30,
    this.height = 30,
    this.enabled = true,
    this.avatarType = AvatarType.generic,
  });

  static const _duration = Duration(milliseconds: 300);

  Widget get userAvatarPlaceholder => Icon(
        Bootstrap.person_circle,
        color: enabled ? FoodlyThemes.accentColor : NeumorphicColors.disabled,
        size: height,
      );

  Widget get businessPlaceholder => DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
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

  bool get isUser => avatarType == AvatarType.user;
  bool get isBusiness => avatarType == AvatarType.business;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl ?? '',
      imageBuilder: (context, imageProvider) => Container(
        constraints: BoxConstraints.tight(Size(width!, height!)),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CircleAvatar(foregroundImage: imageProvider, radius: 100),
      ),
      errorWidget: (p0, p1, p2) => isBusiness ? businessPlaceholder : userAvatarPlaceholder,
      placeholder: (context, __) => isUser
          ? userAvatarPlaceholder
          : isBusiness
              ? businessPlaceholder
              : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox.square(
                        dimension: 40,
                        child: CircularProgressIndicator.adaptive(backgroundColor: FoodlyThemes.secondaryFoodly)),
                  ],
                ),
      fadeInDuration: _duration,
      fadeOutDuration: _duration,
      placeholderFadeInDuration: _duration,
    );
  }
}
