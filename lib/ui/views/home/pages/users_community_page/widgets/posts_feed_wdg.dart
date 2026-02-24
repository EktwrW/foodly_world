import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/widgets/post_card.dart';

class PostsFeedWidget extends StatefulWidget {
  const PostsFeedWidget({super.key});

  @override
  State<PostsFeedWidget> createState() => _PostsFeedWidgetState();
}

class _PostsFeedWidgetState extends State<PostsFeedWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isNearBottom) {
      context.read<SocialCubit>().loadMorePosts();
    }
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialCubit, SocialState>(
      builder: (context, state) {
        final vm = state.vm;

        if (vm.posts.isEmpty) {
          return _buildEmptyState(context);
        }

        return RefreshIndicator(
          color: FoodlyThemes.primaryFoodly,
          onRefresh: () => context.read<SocialCubit>().loadPosts(refresh: true),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 100),
            itemCount: vm.posts.length + (vm.isLoadingMorePosts ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index >= vm.posts.length) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                ).paddingAll(16);
              }

              final post = vm.posts[index];
              return PostCard(
                post: post,
                onLike: () => context.read<SocialCubit>().toggleLike(post.uuid),
                onDelete: () => _confirmDelete(context, post.uuid),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: 64,
            color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No posts yet',
            style: FoodlyTextStyles.label.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            'Be the first to share something!',
            style: FoodlyTextStyles.caption.copyWith(color: Colors.black38),
          ),
        ],
      ).paddingBottom(60),
    );
  }

  void _confirmDelete(BuildContext context, String uuid) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Post'),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<SocialCubit>().deletePost(uuid);
            },
            child: const Text('Delete', style: TextStyle(color: FoodlyThemes.error)),
          ),
        ],
      ),
    );
  }
}
