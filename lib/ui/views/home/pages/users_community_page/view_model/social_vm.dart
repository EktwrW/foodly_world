import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart' show FabCircularMenuPlusState;
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/buzz/buzz_item_dm.dart';
import 'package:foodly_world/data_models/posts/post_dm.dart';
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;

part 'social_vm.freezed.dart';

enum SocialPageViews {
  posts,
  users,
  buzz;

  String get title {
    return switch (this) {
      SocialPageViews.posts => S.current.posts,
      SocialPageViews.users => S.current.users,
      SocialPageViews.buzz => S.current.buzz,
    };
  }
}

/// Filtros para el feed de posts de la pestaña Sociales.
///
/// `nearby`   → comportamiento histórico: posts ordenados por fecha y
///              filtrados por radio geográfico desde la ubicación actual.
/// `following`→ Follow Loop (mayo 2026): posts SOLO de usuarios que el
///              user actual sigue, sin filtro geográfico (la red social es
///              global). Si el user no sigue a nadie el BE devuelve lista
///              vacía y la UI muestra un empty-state explicativo.
///
/// El `value` se serializa como ?filter=... en el query del endpoint.
enum PostsFeedFilter {
  nearby('nearby'),
  following('following');

  final String value;
  const PostsFeedFilter(this.value);

  String get label => switch (this) {
        PostsFeedFilter.nearby => S.current.feedFilterNearby,
        PostsFeedFilter.following => S.current.feedFilterFollowing,
      };

  IconData get icon => switch (this) {
        PostsFeedFilter.nearby => Bootstrap.geo_alt_fill,
        PostsFeedFilter.following => Bootstrap.person_check_fill,
      };
}

enum UserSortMode {
  active,
  nearest,
  followers;

  String get label {
    return switch (this) {
      UserSortMode.active => S.current.userSortMostActive,
      UserSortMode.nearest => S.current.userSortNearest,
      UserSortMode.followers => S.current.userSortMostFollowed,
    };
  }

  IconData get icon {
    return switch (this) {
      UserSortMode.active => FontAwesome.people_group_solid,
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
    @Default(PostsFeedFilter.nearby) PostsFeedFilter feedFilter,

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
