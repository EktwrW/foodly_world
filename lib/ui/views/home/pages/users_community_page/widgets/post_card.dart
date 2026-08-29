import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:foodly_world/core/core_exports.dart' show AuthSessionService, FoodlyThemes, PaddingExtension, di;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/network/moderation/moderation_repo.dart' show ReportableType;
import 'package:foodly_world/data_models/posts/post_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/link_preview/link_preview_card.dart';
import 'package:foodly_world/ui/shared_widgets/moderation/moderation_menu_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_io/io.dart' as uni_io;
import 'package:url_launcher/url_launcher.dart';

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

  /// First URL found in the post content (if any).
  String? get _linkUrl => extractFirstUrl(post.content);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Card(
        elevation: 1,
        color: Colors.white,
        shadowColor: Colors.black26,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildContent(context),
            if (_linkUrl != null) _buildLinkPreview(),
            if (post.hasPhoto) _buildPhoto(),
            const Divider(height: 1, indent: 14, endIndent: 14),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // ── Header ──

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        // Anillo purple cuando el autor es alguien que el user actual ya
        // sigue. Visual cue barato y consistente con el patrón Instagram /
        // X — comunica "esta persona ya está en tu red" sin ocupar texto
        // adicional en el header. Off cuando el autor es uno mismo (la
        // BE devuelve isFollowedByMe=false en ese caso) y cuando aún no
        // se sigue al autor (avatar normal).
        _AvatarWithFollowRing(
          avatarUrl: post.userPhoto,
          isFollowed: post.isFollowedByMe,
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
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.neutralTextGrey, fontSize: 11),
              ),
            ],
          ).paddingOnly(left: 10),
        ),
        if (_isAuthor)
          PopupMenuButton<String>(
            elevation: 3,
            icon: const Icon(Icons.more_vert, color: FoodlyThemes.primaryFoodly, size: 22),
            constraints: const BoxConstraints(maxWidth: 120),
            color: Colors.white.withValues(alpha: 0.95),
            padding: EdgeInsets.zero,
            onSelected: (value) {
              if (value == 'delete') onDelete?.call();
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                height: 36,
                value: 'delete',
                child: Row(
                  children: [
                    const Icon(Bootstrap.trash3, size: 16, color: FoodlyThemes.primaryFoodly),
                    Text(S.current.delete, style: const TextStyle(color: FoodlyThemes.primaryFoodly)).paddingLeft(8),
                  ],
                ),
              ),
            ],
          )
        else
          ModerationMenuButton(
            type: ReportableType.post,
            contentUuid: post.uuid,
            authorUuid: post.userUuid,
            authorName: post.userName,
            iconSize: 20,
            // Al bloquear, quita inmediatamente del feed local todos los posts
            // del usuario bloqueado, sin esperar refresh del servidor (1.2).
            onModerated: () => context.read<SocialCubit>().removeBlockedUserPosts(post.userUuid),
          ),
      ],
    ).paddingOnly(left: 14, right: 4, top: 12);
  }

  // ── Content (rendered as Markdown) ──

  Widget _buildContent(BuildContext context) {
    return MarkdownBody(
      // Compact long URLs into `domain.com/…` markdown links before
      // handing off to flutter_markdown. Without this the autolinker
      // renders the full URL on three lines, duplicating the info that
      // the LinkPreviewCard already shows below. Original URL is kept
      // as the link target — tap behaviour is unchanged. See
      // [shortenUrlsInMarkdown] in link_preview_card.dart for the rules.
      data: shortenUrlsInMarkdown(post.content),
      selectable: true,
      softLineBreak: true,
      styleSheet: MarkdownStyleSheet(
        p: FoodlyTextStyles.label.copyWith(height: 1.45),
        a: FoodlyTextStyles.label.copyWith(color: FoodlyThemes.primaryFoodly, decoration: TextDecoration.underline),
        strong: FoodlyTextStyles.labelBold,
        em: FoodlyTextStyles.label.copyWith(fontStyle: FontStyle.italic),
        blockquotePadding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
        blockquoteDecoration: BoxDecoration(
          border: Border(left: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.4), width: 3)),
        ),
        listBulletPadding: const EdgeInsets.only(right: 4),
      ),
      onTapLink: (_, href, __) {
        if (href == null) return;
        final uri = Uri.tryParse(href);
        if (uri != null) launchUrl(uri, mode: LaunchMode.externalApplication);
      },
    ).paddingSymmetric(horizontal: 14, vertical: 10);
  }

  // ── Link preview ──

  Widget _buildLinkPreview() {
    return LinkPreviewCard(url: _linkUrl!).paddingOnly(left: 14, right: 14, bottom: 10);
  }

  // ── Photo ──

  Widget _buildPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 280),
        child: CachedNetworkImage(
          imageUrl: post.photoUrl!,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (_, __) => Container(
            height: 140,
            color: Colors.grey.shade100,
            child: const Center(child: CircularProgressIndicator.adaptive(strokeWidth: 2)),
          ),
          errorWidget: (_, __, ___) => const SizedBox.shrink(),
        ),
      ),
    ).paddingOnly(left: 14, right: 14, bottom: 6);
  }

  // ── Footer: Like + Share ──

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        // Like button
        InkWell(
          onTap: onLike,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                child: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(post.isLiked),
                  color: FoodlyThemes.favourites,
                  size: 20,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '${post.likesCount}',
                style: FoodlyTextStyles.caption.copyWith(
                  color: FoodlyThemes.favourites,
                  fontWeight: post.isLiked ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 8, vertical: 8),
        ),

        const Spacer(),

        // Share button
        InkWell(
          onTap: () => _sharePost(context),
          borderRadius: BorderRadius.circular(20),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Icon(Icons.share_outlined, size: 18, color: FoodlyThemes.primaryFoodly),
          ),
        ),
      ],
    ).paddingOnly(left: 6, right: 6, top: 2, bottom: 4);
  }

  Future<void> _sharePost(BuildContext context) async {
    final text = post.content;
    final url = _linkUrl;
    final shareText = url != null ? '$text\n$url' : text;

    // If the post has a photo, download it to a temp file and share with image.
    if (post.hasPhoto) {
      try {
        final dir = await getTemporaryDirectory();
        final file = uni_io.File('${dir.path}/post_${post.uuid}.jpg');
        await Dio().download(post.photoUrl!, file.path);
        // ignore: deprecated_member_use
        await Share.shareXFiles([XFile(file.path)], text: shareText);
        file.deleteSync();
      } catch (_) {
        // Fallback to text-only if download fails.
        // ignore: deprecated_member_use
        await Share.share(shareText);
      }
      return;
    }

    // Text-only share.
    // ignore: deprecated_member_use
    await Share.share(shareText);
  }
}

/// Avatar 40×40 con un anillo `primaryFoodly` opcional alrededor.
///
/// Cuando `isFollowed` es false renderiza el avatar exactamente como antes
/// (sin overhead). Cuando es true envuelve al avatar en un Container con
/// border circular de 1.6 px en `primaryFoodly` y un padding de 2 px para
/// que el anillo quede separado del avatar y no parezca un bordeado.
///
/// El tamaño total del avatar (incluyendo anillo) se mantiene en 40 px
/// para no empujar el resto del header. El AvatarWidget interno se
/// reduce a 36 cuando hay anillo.
class _AvatarWithFollowRing extends StatelessWidget {
  final String? avatarUrl;
  final bool isFollowed;

  const _AvatarWithFollowRing({required this.avatarUrl, required this.isFollowed});

  @override
  Widget build(BuildContext context) {
    if (!isFollowed) {
      return AvatarWidget(
        avatarUrl: avatarUrl,
        avatarType: AvatarType.user,
        width: 40,
        height: 40,
      );
    }
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: FoodlyThemes.primaryFoodly, width: 1.6),
      ),
      child: AvatarWidget(
        avatarUrl: avatarUrl,
        avatarType: AvatarType.user,
        width: 36,
        height: 36,
      ),
    );
  }
}
