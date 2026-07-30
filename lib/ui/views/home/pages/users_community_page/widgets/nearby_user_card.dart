import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, S;
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class NearbyUserCard extends StatelessWidget {
  final NearbyUserDM user;
  final VoidCallback? onFollow;
  final VoidCallback? onTap;

  const NearbyUserCard({
    super.key,
    required this.user,
    this.onFollow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            AvatarWidget(
              avatarUrl: user.photo,
              avatarType: AvatarType.user,
              width: 56,
              height: 56,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FoodlyTextStyles.labelBold,
                  ),
                  if (user.username != null)
                    Text(
                      '@${user.username}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 11),
                    ),
                  if (user.bio != null && user.bio!.isNotEmpty)
                    Text(
                      user.bio!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: FoodlyTextStyles.caption.copyWith(color: Colors.black54),
                    ).paddingOnly(top: 2),
                  const SizedBox(height: 6),
                  _buildStatsRow(),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _buildFollowButton(),
          ],
        ).paddingAll(14),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStat(Bootstrap.file_earmark_text, '${user.postsCount}'),
        const SizedBox(width: 12),
        _buildStat(Icons.favorite, '${user.likesReceived}'),
        const SizedBox(width: 12),
        _buildStat(Icons.people, '${user.followersCount}'),
        if (user.distance > 0) ...[
          const SizedBox(width: 12),
          _buildStat(Icons.location_on, '${user.distance.toStringAsFixed(1)} km'),
        ],
      ],
    );
  }

  Widget _buildStat(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: FoodlyThemes.secondaryFoodly),
        const SizedBox(width: 3),
        Text(
          value,
          style: const TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildFollowButton() {
    return SizedBox(
      height: 32,
      child: OutlinedButton(
        onPressed: onFollow,
        style: OutlinedButton.styleFrom(
          backgroundColor: user.isFollowing ? FoodlyThemes.primaryFoodly : Colors.white,
          side: const BorderSide(color: FoodlyThemes.primaryFoodly),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          user.isFollowing ? S.current.following : S.current.follow,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: user.isFollowing ? Colors.white : FoodlyThemes.primaryFoodly,
          ),
        ),
      ),
    );
  }
}
