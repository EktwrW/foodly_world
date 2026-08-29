import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, S;
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/core/utils/scroll_tracker.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/view_model/social_vm.dart'
    show PostsFeedFilter, SocialVM;
import 'package:foodly_world/ui/views/home/pages/users_community_page/widgets/post_card.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class PostsFeedWidget extends StatefulWidget {
  const PostsFeedWidget({super.key});

  @override
  State<PostsFeedWidget> createState() => _PostsFeedWidgetState();
}

class _PostsFeedWidgetState extends State<PostsFeedWidget> {
  final _scrollController = ScrollController();
  late final ScrollTracker _scrollTracker;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _scrollTracker = ScrollTracker(
      tracker: di<EventTrackingService>(),
      sourceModule: 'PostsFeedWidget',
      page: 'community',
    );
    _scrollTracker.attach(_scrollController);
  }

  @override
  void dispose() {
    _scrollTracker.dispose();
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

        // El SegmentedButton vive POR ENCIMA del ListView/empty-state para
        // que el usuario pueda salir de un empty-state ("no sigues a
        // nadie") sin tener que cambiar de tab y volver. Es la misma
        // razón por la que el filter de bookingType en MyReservations
        // queda fuera del listview vacío.
        return Column(
          children: [
            _buildFilterBar(context, vm.feedFilter),
            Expanded(child: _buildBody(context, vm, state)),
          ],
        );
      },
    );
  }

  Widget _buildFilterBar(BuildContext context, PostsFeedFilter current) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
      child: SizedBox(
        width: double.infinity,
        child: SegmentedButton<PostsFeedFilter>(
          segments: PostsFeedFilter.values
              .map((f) => ButtonSegment<PostsFeedFilter>(
                    value: f,
                    label: Text(f.label),
                    icon: Icon(f.icon, size: 14),
                  ))
              .toList(),
          selected: {current},
          showSelectedIcon: false,
          onSelectionChanged: (selection) {
            if (selection.isEmpty) return;
            context.read<SocialCubit>().changeFeedFilter(selection.first);
          },
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            textStyle: const WidgetStatePropertyAll(FoodlyTextStyles.labelBoldMini),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return FoodlyThemes.primaryFoodly.withValues(alpha: 0.10);
              }
              return Colors.white;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return FoodlyThemes.primaryFoodly;
              }
              return FoodlyThemes.secondaryFoodly;
            }),
            side: const WidgetStatePropertyAll(
              BorderSide(color: FoodlyThemes.secondaryFoodly, width: 0.6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, SocialVM vm, SocialState state) {
    if (vm.posts.isEmpty) {
      if (state == SocialState.loading(vm)) {
        return const PostsFeedShimmer();
      }
      return _buildEmptyState(context, vm.feedFilter);
    }

    return RefreshIndicator(
      color: FoodlyThemes.primaryFoodly,
      onRefresh: () => context.read<SocialCubit>().loadPosts(refresh: true),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 150),
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
  }

  Widget _buildEmptyState(BuildContext context, PostsFeedFilter filter) {
    // Mensaje contextual: el empty del feed nearby debe alentar a publicar
    // ("sé el primero"), pero el del feed following es un dead-end social
    // — la solución no es publicar, es seguir gente. Le decimos eso.
    final isFollowing = filter == PostsFeedFilter.following;
    final icon = isFollowing ? Bootstrap.person_check : Bootstrap.chat_square_text;
    final title = isFollowing ? S.current.feedFollowingEmptyTitle : S.current.postsFeedNoPosts;
    final subtitle = isFollowing ? S.current.feedFollowingEmptySubtitle : S.current.postsFeedBeFirst;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 56,
            color: FoodlyThemes.secondaryFoodly,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.label.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.neutralTextGrey),
          ).paddingSymmetric(horizontal: 24),
        ],
      ).paddingBottom(60),
    );
  }

  void _confirmDelete(BuildContext context, String uuid) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
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
