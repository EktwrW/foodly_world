import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, S;
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
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
            _buildSortUsersDropdown(vm),
            Expanded(
              child: vm.nearbyUsers.isEmpty && !vm.isLoadingUsers
                  ? _buildEmptyState()
                  : vm.isLoadingUsers && vm.nearbyUsers.isEmpty
                      ? const UsersDiscoveryShimmer()
                      : RefreshIndicator(
                          color: FoodlyThemes.primaryFoodly,
                          onRefresh: () => context.read<SocialCubit>().loadNearbyUsers(refresh: true),
                          child: ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _scrollController,
                            padding: const EdgeInsets.only(left: 14, right: 14, top: 16, bottom: 150),
                            itemCount: vm.nearbyUsers.length + (vm.isLoadingMoreUsers ? 1 : 0),
                            separatorBuilder: (_, __) => const SizedBox(height: 16),
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

  Widget _buildSortUsersDropdown(SocialVM vm) {
    return FoodlyDropdownButtonFormField<UserSortMode>(
      height: 40,
      items: UserSortMode.values.map((mode) => DropdownMenuItem(value: mode, child: Text(mode.label))).toList(),
      value: vm.userSortMode,
      onChanged: (mode) => context.read<SocialCubit>().changeUserSortMode(mode!),
      enabled: vm.totalUsers > 0,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        labelText: S.current.sortBy,
        labelStyle: FoodlyTextStyles.caption.copyWith(color: Colors.black54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly)),
      ),
    ).paddingAll(16);
  }

  Widget _buildEmptyState() {
    // El texto estaba EN INGLES Y A PELO, sin pasar por l10n, y ademas decia
    // «prueba a ampliar tu radio de busqueda»: aqui no hay ningun control de
    // radio — lo filtra el servidor desde la ubicacion. Mandaba a hacer algo
    // que no se puede hacer.
    return FoodlyEmptyView(
      title: S.current.usersDiscoveryEmptyTitle,
      subtitle: S.current.usersDiscoveryEmptyBody,
      icon: const Icon(Icons.people_outline, size: 40, color: FoodlyThemes.primaryFoodly),
    ).paddingBottom(60);
  }
}
