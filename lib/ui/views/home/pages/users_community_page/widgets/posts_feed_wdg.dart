import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, S;
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
          if (state != SocialState.loading(vm)) {
            return _buildEmptyState(context);
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            ).paddingBottom(60);
          }
        }

        return RefreshIndicator(
          color: FoodlyThemes.primaryFoodly,
          onRefresh: () => context.read<SocialCubit>().loadPosts(refresh: true),
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            padding: const EdgeInsets.only(left: 14, right: 14, top: 16, bottom: 100),
            itemCount: vm.posts.length + (vm.isLoadingMorePosts ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
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
          const Icon(
            Icons.article_outlined,
            size: 64,
            color: FoodlyThemes.secondaryFoodly,
          ),
          const SizedBox(height: 16),
          Text(
            S.current.postsFeedNoPosts,
            style: FoodlyTextStyles.label.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            S.current.postsFeedBeFirst,
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
        title: Text(S.current.deletePostTitle),
        content: Text(S.current.deletePostConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(S.current.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<SocialCubit>().deletePost(uuid);
            },
            child: Text(S.current.delete, style: const TextStyle(color: FoodlyThemes.error)),
          ),
        ],
      ),
    );
  }
}
