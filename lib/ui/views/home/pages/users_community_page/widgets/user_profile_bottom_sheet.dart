import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension;
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class UserProfileBottomSheet extends StatefulWidget {
  final String userUuid;
  final String userName;

  const UserProfileBottomSheet({
    super.key,
    required this.userUuid,
    required this.userName,
  });

  static Future<void> show(BuildContext context, {required String userUuid, required String userName}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<SocialCubit>(),
        child: UserProfileBottomSheet(userUuid: userUuid, userName: userName),
      ),
    );
  }

  @override
  State<UserProfileBottomSheet> createState() => _UserProfileBottomSheetState();
}

class _UserProfileBottomSheetState extends State<UserProfileBottomSheet> {
  UserProfileDM? _profile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await context.read<SocialCubit>().loadUserProfile(widget.userUuid);
    if (mounted) {
      setState(() {
        _profile = profile;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : _profile == null
                  ? _buildErrorState()
                  : _buildProfileContent(scrollController),
        );
      },
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          Text('Could not load profile', style: FoodlyTextStyles.label.copyWith(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildProfileContent(ScrollController scrollController) {
    final profile = _profile!;
    final stats = profile.stats;

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Drag handle
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 12, bottom: 20),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),

        // Avatar + Name + Username
        Center(
          child: AvatarWidget(
            avatarUrl: profile.photo,
            avatarType: AvatarType.user,
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            profile.name,
            style: FoodlyTextStyles.labelBold.copyWith(fontSize: 18),
          ),
        ),
        if (profile.username != null)
          Center(
            child: Text(
              '@${profile.username}',
              style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 13),
            ).paddingOnly(top: 2),
          ),
        if (profile.bio != null && profile.bio!.isNotEmpty)
          Center(
            child: Text(
              profile.bio!,
              textAlign: TextAlign.center,
              style: FoodlyTextStyles.caption.copyWith(color: Colors.black54),
            ).paddingOnly(top: 8),
          ),

        const SizedBox(height: 16),

        // Follow button
        Center(child: _buildFollowButton(profile)),

        const SizedBox(height: 20),

        // Stats row
        if (stats != null) _buildStatsGrid(stats),

        const SizedBox(height: 24),

        // Recent posts
        if (profile.recentPosts.isNotEmpty) ...[
          Text(
            'Recent Posts',
            style: FoodlyTextStyles.labelBold.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 12),
          _buildRecentPostsGrid(profile.recentPosts),
          const SizedBox(height: 24),
        ],
      ],
    );
  }

  Widget _buildFollowButton(UserProfileDM profile) {
    return BlocBuilder<SocialCubit, SocialState>(
      builder: (context, state) {
        // Check the latest isFollowing state from the nearby users list
        final isFollowing =
            state.vm.nearbyUsers.where((u) => u.uuid == widget.userUuid).map((u) => u.isFollowing).firstOrNull ??
                profile.isFollowing;

        return SizedBox(
          height: 36,
          width: 130,
          child: OutlinedButton(
            onPressed: () => context.read<SocialCubit>().toggleFollowUser(widget.userUuid),
            style: OutlinedButton.styleFrom(
              backgroundColor: isFollowing ? FoodlyThemes.primaryFoodly : Colors.white,
              side: const BorderSide(color: FoodlyThemes.primaryFoodly),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            child: Text(
              isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isFollowing ? Colors.white : FoodlyThemes.primaryFoodly,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatsGrid(UserProfileStatsDM stats) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatColumn(Bootstrap.file_earmark_text, '${stats.postsCount}', 'Posts'),
        _buildStatColumn(Icons.favorite, '${stats.likesReceived}', 'Likes'),
        _buildStatColumn(Icons.star, '${stats.reviewsCount}', 'Reviews'),
        _buildStatColumn(Icons.people, '${stats.followersCount}', 'Followers'),
        _buildStatColumn(Icons.person_add, '${stats.followingCount}', 'Following'),
      ],
    );
  }

  Widget _buildStatColumn(IconData icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: FoodlyThemes.primaryFoodly),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildRecentPostsGrid(List<UserProfilePostDM> posts) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        if (post.photoUrl != null && post.photoUrl!.isNotEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: post.photoUrl!,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: Colors.grey[200]),
              errorWidget: (_, __, ___) => _buildTextPostTile(post),
            ),
          );
        }
        return _buildTextPostTile(post);
      },
    );
  }

  Widget _buildTextPostTile(UserProfilePostDM post) {
    return Container(
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            post.content,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, size: 10, color: FoodlyThemes.secondaryFoodly),
              const SizedBox(width: 2),
              Text(
                '${post.likesCount}',
                style: const TextStyle(fontSize: 9, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
