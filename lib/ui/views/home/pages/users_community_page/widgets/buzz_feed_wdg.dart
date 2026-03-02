import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show AppRouter, AppRoutes, FoodlyThemes, PaddingExtension;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/buzz/buzz_item_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';

class BuzzFeedWidget extends StatefulWidget {
  const BuzzFeedWidget({super.key});

  @override
  State<BuzzFeedWidget> createState() => _BuzzFeedWidgetState();
}

class _BuzzFeedWidgetState extends State<BuzzFeedWidget> {
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
      context.read<SocialCubit>().loadMoreBuzz();
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

        if (vm.isLoadingBuzz && vm.buzzItems.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (vm.buzzItems.isEmpty) {
          return _buildEmptyState();
        }

        return RefreshIndicator(
          color: FoodlyThemes.primaryFoodly,
          onRefresh: () => context.read<SocialCubit>().loadBuzz(refresh: true),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 100),
            itemCount: vm.buzzItems.length + (vm.isLoadingMoreBuzz ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              if (index >= vm.buzzItems.length) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                ).paddingAll(16);
              }

              return _BuzzItemCard(item: vm.buzzItems[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.campaign_outlined,
            size: 64,
            color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            S.current.buzzEmptyTitle,
            style: FoodlyTextStyles.label.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            S.current.buzzEmptySubtitle,
            style: FoodlyTextStyles.caption.copyWith(color: Colors.black38),
          ),
        ],
      ).paddingBottom(60),
    );
  }
}

class _BuzzItemCard extends StatelessWidget {
  final BuzzItemDM item;

  const _BuzzItemCard({required this.item});

  String _buzzMessage() {
    final name = item.businessName.isNotEmpty ? item.businessName : '?';
    return switch (item.subType) {
      'new_review' => S.current.buzzNewReview(name),
      'new_follower' => S.current.buzzNewFollower(name),
      'new_promotion' => S.current.buzzNewPromotion(name),
      'promotion_update' => S.current.buzzPromotionUpdate(name),
      'new_favorite_menu_item' => S.current.buzzNewFavoriteMenuItem(name),
      'new_favorite_menu' => S.current.buzzNewFavoriteMenu(name),
      'new_favorite_promotion' => S.current.buzzNewFavoritePromotion(name),
      _ => S.current.buzzDefaultActivity(name),
    };
  }

  void _navigateToBusiness() {
    if (item.businessUuid == null) return;
    di<AppRouter>().appRouter.goNamed(
      AppRoutes.visitBusiness.name,
      pathParameters: {AppRoutes.routeIdParam: item.businessUuid!},
    );
  }

  @override
  Widget build(BuildContext context) {
    final canNavigate = item.businessUuid != null;

    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: canNavigate ? _navigateToBusiness : null,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _buzzMessage(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (item.businessName.isNotEmpty) ...[
                        const Icon(Icons.store, size: 12, color: FoodlyThemes.secondaryFoodly),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            item.businessName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 11),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      if (item.createdAt != null)
                        Text(
                          item.createdAt!.timeAgo,
                          style: const TextStyle(fontSize: 10, color: Colors.black38),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (item.businessPhoto != null)
              AvatarWidget(
                avatarUrl: item.businessPhoto,
                avatarType: AvatarType.business,
                width: 40,
                height: 40,
              ),
            if (canNavigate) const Icon(Icons.chevron_right, size: 18, color: Colors.black26),
          ],
        ).paddingAll(12),
      ),
    );
  }

  Widget _buildIcon() {
    final (IconData icon, Color color) = switch (item.subType) {
      'new_review' => (Icons.star, Colors.amber),
      'new_follower' => (Icons.favorite, Colors.redAccent),
      'new_promotion' || 'promotion_update' => (Icons.local_offer, FoodlyThemes.tertiaryFoodly),
      'new_favorite_menu_item' || 'new_favorite_menu' => (Icons.restaurant_menu, Colors.orange),
      'new_favorite_promotion' => (Icons.bookmark, FoodlyThemes.primaryFoodly),
      _ => (Icons.campaign, FoodlyThemes.secondaryFoodly),
    };

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }
}
