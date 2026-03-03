import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart' show AuthSessionService, FoodlyThemes, PaddingExtension, di;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/data_models/posts/post_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class PostCard extends StatelessWidget {
  final PostDM post;
  final VoidCallback? onLike;
  final VoidCallback? onDelete;

  const PostCard({
    super.key,
    required this.post,
    this.onLike,
    this.onDelete,
  });

  bool get _isAuthor => post.userUuid == di<AuthSessionService>().uuid;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildContent(),
            if (post.hasPhoto) _buildPhoto(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        AvatarWidget(
          avatarUrl: post.userPhoto,
          avatarType: AvatarType.user,
          width: 40,
          height: 40,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.labelBold,
              ),
              Text(
                post.createdAt?.timeAgo ?? '',
                style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 11),
              ),
            ],
          ).paddingOnly(left: 10),
        ),
        if (_isAuthor)
          PopupMenuButton<String>(
            elevation: 3,
            icon: const Icon(Icons.more_vert, color: FoodlyThemes.primaryFoodly, size: 22),
            constraints: const BoxConstraints(maxWidth: 120),
            color: Colors.white.withValues(alpha: 0.9),
            padding: EdgeInsets.zero,
            onSelected: (value) {
              if (value == 'delete') onDelete?.call();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 36,
                value: 'delete',
                child: Row(
                  children: [
                    const Icon(Bootstrap.trash3, size: 16, color: FoodlyThemes.primaryFoodly),
                    Text(
                      S.current.delete,
                      style: const TextStyle(color: FoodlyThemes.primaryFoodly),
                    ).paddingLeft(8),
                  ],
                ),
              ),
            ],
          ),
      ],
    ).paddingOnly(left: 14, right: 4, top: 12);
  }

  Widget _buildContent() {
    return Text(
      post.content,
      style: FoodlyTextStyles.label,
    ).paddingSymmetric(horizontal: 14, vertical: 10);
  }

  Widget _buildPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: post.photoUrl!,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (_, __) => const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator.adaptive()),
        ),
        errorWidget: (_, __, ___) => const SizedBox.shrink(),
      ),
    ).paddingSymmetric(horizontal: 14);
  }

  Widget _buildFooter() {
    return Row(
      children: [
        InkWell(
          onTap: onLike,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                child: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(post.isLiked),
                  color: post.isLiked ? Colors.redAccent : FoodlyThemes.secondaryFoodly,
                  size: 22,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '${post.likesCount}',
                style: FoodlyTextStyles.captionBold.copyWith(
                  color: post.isLiked ? Colors.redAccent : Colors.black54,
                ),
              ),
            ],
          ).paddingAll(8),
        ),
      ],
    ).paddingOnly(left: 6, bottom: 4);
  }
}
