import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/view_model/social_vm.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/widgets/nearby_user_card.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/widgets/user_profile_bottom_sheet.dart';

class UsersDiscoveryWidget extends StatefulWidget {
  const UsersDiscoveryWidget({super.key});

  @override
  State<UsersDiscoveryWidget> createState() => _UsersDiscoveryWidgetState();
}

class _UsersDiscoveryWidgetState extends State<UsersDiscoveryWidget> {
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
      context.read<SocialCubit>().loadMoreUsers();
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

        return Column(
          children: [
            _buildSortChips(vm),
            Expanded(
              child: vm.nearbyUsers.isEmpty && !vm.isLoadingUsers
                  ? _buildEmptyState()
                  : vm.isLoadingUsers && vm.nearbyUsers.isEmpty
                      ? const Center(child: CircularProgressIndicator.adaptive())
                      : RefreshIndicator(
                          color: FoodlyThemes.primaryFoodly,
                          onRefresh: () => context.read<SocialCubit>().loadNearbyUsers(refresh: true),
                          child: ListView.separated(
                            controller: _scrollController,
                            padding: const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 100),
                            itemCount: vm.nearbyUsers.length + (vm.isLoadingMoreUsers ? 1 : 0),
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              if (index >= vm.nearbyUsers.length) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ).paddingAll(16);
                              }

                              final user = vm.nearbyUsers[index];
                              return NearbyUserCard(
                                user: user,
                                onFollow: () => context.read<SocialCubit>().toggleFollowUser(user.uuid),
                                onTap: () => UserProfileBottomSheet.show(
                                  context,
                                  userUuid: user.uuid,
                                  userName: user.name,
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSortChips(SocialVM vm) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: UserSortMode.values.map((mode) {
          final isSelected = vm.userSortMode == mode;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                mode.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : FoodlyThemes.primaryFoodly,
                ),
              ),
              selected: isSelected,
              selectedColor: FoodlyThemes.primaryFoodly,
              backgroundColor: Colors.white,
              side: const BorderSide(color: FoodlyThemes.primaryFoodly, width: 0.5),
              onSelected: (_) => context.read<SocialCubit>().changeUserSortMode(mode),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No users nearby',
            style: FoodlyTextStyles.label.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            'Try increasing your search radius',
            style: FoodlyTextStyles.caption.copyWith(color: Colors.black38),
          ),
        ],
      ).paddingBottom(60),
    );
  }
}
