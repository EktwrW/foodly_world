import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart' show FabCircularMenuPlusState;
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/buzz/buzz_item_dm.dart';
import 'package:foodly_world/data_models/posts/post_dm.dart';
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

part 'social_vm.freezed.dart';

enum SocialPageViews {
  posts,
  users,
  buzz;

  String get title {
    return switch (this) {
      SocialPageViews.posts => 'Posts',
      SocialPageViews.users => 'Users',
      SocialPageViews.buzz => 'Buzz',
    };
  }
}

enum UserSortMode {
  active,
  nearest,
  followers;

  String get label {
    return switch (this) {
      UserSortMode.active => 'Most Active',
      UserSortMode.nearest => 'Nearest',
      UserSortMode.followers => 'Most Followed',
    };
  }

  IconData get icon {
    return switch (this) {
      UserSortMode.active => Bootstrap.people_fill,
      UserSortMode.nearest => Bootstrap.geo_alt_fill,
      UserSortMode.followers => Bootstrap.star_fill,
    };
  }
}

@freezed
class SocialVM with _$SocialVM {
  const SocialVM._();

  const factory SocialVM({
    @Default(SocialPageViews.posts) SocialPageViews currentView,

    // Posts state
    @Default([]) List<PostDM> posts,
    PostsMetaDM? postsMeta,
    @Default(false) bool isLoadingMorePosts,
    @Default(false) bool isCreatingPost,

    // Users state
    @Default([]) List<NearbyUserDM> nearbyUsers,
    NearbyUsersMetaDM? usersMeta,
    @Default(false) bool isLoadingMoreUsers,
    @Default(false) bool isLoadingUsers,
    @Default(UserSortMode.active) UserSortMode userSortMode,

    // Buzz state
    @Default([]) List<BuzzItemDM> buzzItems,
    BuzzMetaDM? buzzMeta,
    @Default(false) bool isLoadingMoreBuzz,
    @Default(false) bool isLoadingBuzz,
    GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
  }) = _SocialVM;

  // Posts pagination
  bool get canLoadMorePosts => !isLoadingMorePosts && postsMeta != null && postsMeta!.currentPage < postsMeta!.lastPage;

  int get currentPage => postsMeta?.currentPage ?? 1;
  int get lastPage => postsMeta?.lastPage ?? 1;
  int get totalPosts => postsMeta?.total ?? 0;

  // Users pagination
  bool get canLoadMoreUsers => !isLoadingMoreUsers && usersMeta != null && usersMeta!.currentPage < usersMeta!.lastPage;

  int get usersCurrentPage => usersMeta?.currentPage ?? 1;
  int get usersLastPage => usersMeta?.lastPage ?? 1;
  int get totalUsers => usersMeta?.total ?? 0;

  // Buzz pagination
  bool get canLoadMoreBuzz => !isLoadingMoreBuzz && buzzMeta != null && buzzMeta!.currentPage < buzzMeta!.lastPage;

  int get buzzCurrentPage => buzzMeta?.currentPage ?? 1;
  int get buzzLastPage => buzzMeta?.lastPage ?? 1;
  int get totalBuzz => buzzMeta?.total ?? 0;
}
