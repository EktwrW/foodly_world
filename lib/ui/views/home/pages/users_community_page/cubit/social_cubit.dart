import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/buzz/buzz_repo.dart';
import 'package:foodly_world/core/network/posts/post_repo.dart';
import 'package:foodly_world/core/network/users/user_discovery_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/view_model/social_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:universal_io/io.dart';

part 'social_cubit.freezed.dart';
part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialVM _vm;
  final PostRepo _postRepo;
  final UserDiscoveryRepo _userDiscoveryRepo;
  final BuzzRepo _buzzRepo;
  final AuthSessionService _authService;
  final LocationService _locationService;
  final Logger _logger;

  SocialCubit({
    required PostRepo postRepo,
    required UserDiscoveryRepo userDiscoveryRepo,
    required BuzzRepo buzzRepo,
    required AuthSessionService authService,
    required LocationService locationService,
    required Logger logger,
  })  : _postRepo = postRepo,
        _userDiscoveryRepo = userDiscoveryRepo,
        _buzzRepo = buzzRepo,
        _authService = authService,
        _locationService = locationService,
        _logger = logger,
        _vm = const SocialVM(),
        super(const SocialState.initial(SocialVM()));

  /// Carga el feed de posts (con ubicación si está disponible)
  Future<void> loadPosts({bool refresh = false}) async {
    if (!_authService.isLoggedIn) return;

    if (refresh) {
      emit(SocialState.loading(_vm));
    }

    final position = _locationService.currentLocation.position;
    final latitude = position?.latitude;
    final longitude = position?.longitude;

    try {
      final result = await _postRepo.getPosts(
        page: 1,
        perPage: 20,
        latitude: latitude,
        longitude: longitude,
      );

      result.when(
        success: (data) {
          _vm = _vm.copyWith(
            posts: data.posts,
            postsMeta: data.meta,
          );
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error loading posts: ${error.errorMsg}');
          emit(SocialState.error(_vm, error.errorMsg));
        },
      );
    } catch (e) {
      _logger.e('Exception loading posts: $e');
      emit(SocialState.error(_vm, e.toString()));
    }
  }

  /// Carga más posts (paginación)
  Future<void> loadMorePosts() async {
    if (!_authService.isLoggedIn || !_vm.canLoadMorePosts) return;

    _vm = _vm.copyWith(isLoadingMorePosts: true);
    emit(SocialState.loaded(_vm));

    final nextPage = _vm.currentPage + 1;
    final position = _locationService.currentLocation.position;

    try {
      final result = await _postRepo.getPosts(
        page: nextPage,
        perPage: 20,
        latitude: position?.latitude,
        longitude: position?.longitude,
      );

      result.when(
        success: (data) {
          final allPosts = [..._vm.posts, ...data.posts];
          _vm = _vm.copyWith(
            posts: allPosts,
            postsMeta: data.meta,
            isLoadingMorePosts: false,
          );
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error loading more posts: ${error.errorMsg}');
          _vm = _vm.copyWith(isLoadingMorePosts: false);
          emit(SocialState.loaded(_vm));
        },
      );
    } catch (e) {
      _logger.e('Exception loading more posts: $e');
      _vm = _vm.copyWith(isLoadingMorePosts: false);
      emit(SocialState.loaded(_vm));
    }
  }

  /// Crea un nuevo post con foto opcional
  Future<void> createPost(String content, {File? photo}) async {
    if (!_authService.isLoggedIn) return;

    _vm = _vm.copyWith(isCreatingPost: true);
    emit(SocialState.loading(_vm));

    final position = _locationService.currentLocation.position;

    try {
      final result = await _postRepo.createPost(
        content: content,
        photoPath: photo?.path,
        latitude: position?.latitude,
        longitude: position?.longitude,
      );

      result.when(
        success: (post) {
          final updatedPosts = [post, ..._vm.posts];
          _vm = _vm.copyWith(
            posts: updatedPosts,
            isCreatingPost: false,
          );
          emit(SocialState.loaded(_vm));
          _logger.i('Post created: ${post.uuid}');
        },
        failure: (error) {
          _logger.e('Error creating post: ${error.errorMsg}');
          _vm = _vm.copyWith(isCreatingPost: false);
          emit(SocialState.error(_vm, error.errorMsg));
        },
      );
    } catch (e) {
      _logger.e('Exception creating post: $e');
      _vm = _vm.copyWith(isCreatingPost: false);
      emit(SocialState.error(_vm, e.toString()));
    }
  }

  /// Elimina un post (optimistic update)
  Future<void> deletePost(String uuid) async {
    if (!_authService.isLoggedIn) return;

    // Optimistic remove
    final removedPost = _vm.posts.firstWhere((p) => p.uuid == uuid);
    final updatedPosts = _vm.posts.where((p) => p.uuid != uuid).toList();
    _vm = _vm.copyWith(posts: updatedPosts);
    emit(SocialState.loaded(_vm));

    try {
      final result = await _postRepo.deletePost(uuid);

      result.when(
        success: (_) {
          _logger.i('Post deleted: $uuid');
        },
        failure: (error) {
          _logger.e('Error deleting post: ${error.errorMsg}');
          // Revert on error
          final revertedPosts = [..._vm.posts];
          final originalIndex = _vm.posts.length;
          revertedPosts.insert(
            originalIndex > 0 ? 0 : 0,
            removedPost,
          );
          _vm = _vm.copyWith(posts: revertedPosts);
          emit(SocialState.loaded(_vm));
        },
      );
    } catch (e) {
      _logger.e('Exception deleting post: $e');
      loadPosts();
    }
  }

  /// Toggle like (optimistic update)
  Future<void> toggleLike(String uuid) async {
    if (!_authService.isLoggedIn) return;

    // Optimistic toggle
    final updatedPosts = _vm.posts.map((post) {
      if (post.uuid == uuid) {
        final newIsLiked = !post.isLiked;
        final newLikesCount = newIsLiked ? post.likesCount + 1 : post.likesCount - 1;
        return post.copyWith(
          isLiked: newIsLiked,
          likesCount: newLikesCount < 0 ? 0 : newLikesCount,
        );
      }
      return post;
    }).toList();

    _vm = _vm.copyWith(posts: updatedPosts);
    emit(SocialState.loaded(_vm));

    try {
      final result = await _postRepo.toggleLike(uuid);

      result.when(
        success: (response) {
          // Sync with server response
          final syncedPosts = _vm.posts.map((post) {
            if (post.uuid == uuid) {
              return post.copyWith(
                isLiked: response.isLiked,
                likesCount: response.likesCount,
              );
            }
            return post;
          }).toList();
          _vm = _vm.copyWith(posts: syncedPosts);
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error toggling like: ${error.errorMsg}');
          // Revert on error
          loadPosts();
        },
      );
    } catch (e) {
      _logger.e('Exception toggling like: $e');
      loadPosts();
    }
  }

  /// Cambia la vista actual (Posts / Users)
  void changeView(SocialPageViews view) {
    _vm = _vm.copyWith(currentView: view);
    emit(SocialState.loaded(_vm));

    // Auto-load data when switching tabs for the first time
    if (view == SocialPageViews.users && _vm.nearbyUsers.isEmpty && !_vm.isLoadingUsers) {
      loadNearbyUsers();
    } else if (view == SocialPageViews.buzz && _vm.buzzItems.isEmpty && !_vm.isLoadingBuzz) {
      loadBuzz();
    }
  }

  // ─── User Discovery ───

  /// Carga usuarios cercanos
  Future<void> loadNearbyUsers({bool refresh = false}) async {
    if (!_authService.isLoggedIn) return;

    final position = _locationService.currentLocation.position;
    if (position == null) {
      emit(SocialState.error(_vm, 'Location not available'));
      return;
    }

    _vm = _vm.copyWith(isLoadingUsers: true);
    if (refresh) {
      emit(SocialState.loading(_vm));
    } else {
      emit(SocialState.loaded(_vm));
    }

    try {
      final result = await _userDiscoveryRepo.getNearbyUsers(
        latitude: position.latitude,
        longitude: position.longitude,
        sort: _vm.userSortMode.name,
        page: 1,
        perPage: 20,
      );

      result.when(
        success: (data) {
          _vm = _vm.copyWith(
            nearbyUsers: data.data,
            usersMeta: data.meta,
            isLoadingUsers: false,
          );
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error loading nearby users: ${error.errorMsg}');
          _vm = _vm.copyWith(isLoadingUsers: false);
          emit(SocialState.error(_vm, error.errorMsg));
        },
      );
    } catch (e) {
      _logger.e('Exception loading nearby users: $e');
      _vm = _vm.copyWith(isLoadingUsers: false);
      emit(SocialState.error(_vm, e.toString()));
    }
  }

  /// Carga más usuarios (paginación)
  Future<void> loadMoreUsers() async {
    if (!_authService.isLoggedIn || !_vm.canLoadMoreUsers) return;

    final position = _locationService.currentLocation.position;
    if (position == null) return;

    _vm = _vm.copyWith(isLoadingMoreUsers: true);
    emit(SocialState.loaded(_vm));

    final nextPage = _vm.usersCurrentPage + 1;

    try {
      final result = await _userDiscoveryRepo.getNearbyUsers(
        latitude: position.latitude,
        longitude: position.longitude,
        sort: _vm.userSortMode.name,
        page: nextPage,
        perPage: 20,
      );

      result.when(
        success: (data) {
          _vm = _vm.copyWith(
            nearbyUsers: [..._vm.nearbyUsers, ...data.data],
            usersMeta: data.meta,
            isLoadingMoreUsers: false,
          );
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error loading more users: ${error.errorMsg}');
          _vm = _vm.copyWith(isLoadingMoreUsers: false);
          emit(SocialState.loaded(_vm));
        },
      );
    } catch (e) {
      _logger.e('Exception loading more users: $e');
      _vm = _vm.copyWith(isLoadingMoreUsers: false);
      emit(SocialState.loaded(_vm));
    }
  }

  /// Cambia el modo de ordenamiento y recarga
  void changeUserSortMode(UserSortMode mode) {
    if (mode == _vm.userSortMode) return;
    _vm = _vm.copyWith(userSortMode: mode, nearbyUsers: []);
    emit(SocialState.loaded(_vm));
    loadNearbyUsers();
  }

  /// Toggle follow de un usuario (optimistic)
  Future<void> toggleFollowUser(String userUuid) async {
    // Optimistic update
    final updatedUsers = _vm.nearbyUsers.map((user) {
      if (user.uuid == userUuid) {
        final newIsFollowing = !user.isFollowing;
        return user.copyWith(
          isFollowing: newIsFollowing,
          followersCount: newIsFollowing ? user.followersCount + 1 : user.followersCount - 1,
        );
      }
      return user;
    }).toList();

    _vm = _vm.copyWith(nearbyUsers: updatedUsers);
    emit(SocialState.loaded(_vm));

    // The actual follow/unfollow is done via UserFollowerController (existing endpoint)
    // The frontend already has the user-followers toggle endpoint wired up
  }

  /// Carga perfil público de un usuario
  Future<UserProfileDM?> loadUserProfile(String uuid) async {
    try {
      final result = await _userDiscoveryRepo.getUserProfile(uuid);
      return result.when(
        success: (profile) => profile,
        failure: (error) {
          _logger.e('Error loading user profile: ${error.errorMsg}');
          return null;
        },
      );
    } catch (e) {
      _logger.e('Exception loading user profile: $e');
      return null;
    }
  }

  // ─── Buzz Feed ───

  /// Carga el feed de buzz (actividad comunitaria)
  Future<void> loadBuzz({bool refresh = false}) async {
    if (!_authService.isLoggedIn) return;

    final position = _locationService.currentLocation.position;
    if (position == null) {
      emit(SocialState.error(_vm, 'Location not available'));
      return;
    }

    _vm = _vm.copyWith(isLoadingBuzz: true);
    if (refresh) {
      emit(SocialState.loading(_vm));
    } else {
      emit(SocialState.loaded(_vm));
    }

    try {
      final result = await _buzzRepo.getBuzz(
        latitude: position.latitude,
        longitude: position.longitude,
        page: 1,
      );

      result.when(
        success: (data) {
          _vm = _vm.copyWith(
            buzzItems: data.data,
            buzzMeta: data.meta,
            isLoadingBuzz: false,
          );
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error loading buzz: ${error.errorMsg}');
          _vm = _vm.copyWith(isLoadingBuzz: false);
          emit(SocialState.error(_vm, error.errorMsg));
        },
      );
    } catch (e) {
      _logger.e('Exception loading buzz: $e');
      _vm = _vm.copyWith(isLoadingBuzz: false);
      emit(SocialState.error(_vm, e.toString()));
    }
  }

  /// Carga más items de buzz (paginación)
  Future<void> loadMoreBuzz() async {
    if (!_authService.isLoggedIn || !_vm.canLoadMoreBuzz) return;

    final position = _locationService.currentLocation.position;
    if (position == null) return;

    _vm = _vm.copyWith(isLoadingMoreBuzz: true);
    emit(SocialState.loaded(_vm));

    final nextPage = _vm.buzzCurrentPage + 1;

    try {
      final result = await _buzzRepo.getBuzz(
        latitude: position.latitude,
        longitude: position.longitude,
        page: nextPage,
      );

      result.when(
        success: (data) {
          _vm = _vm.copyWith(
            buzzItems: [..._vm.buzzItems, ...data.data],
            buzzMeta: data.meta,
            isLoadingMoreBuzz: false,
          );
          emit(SocialState.loaded(_vm));
        },
        failure: (error) {
          _logger.e('Error loading more buzz: ${error.errorMsg}');
          _vm = _vm.copyWith(isLoadingMoreBuzz: false);
          emit(SocialState.loaded(_vm));
        },
      );
    } catch (e) {
      _logger.e('Exception loading more buzz: $e');
      _vm = _vm.copyWith(isLoadingMoreBuzz: false);
      emit(SocialState.loaded(_vm));
    }
  }

  /// Limpia el estado (logout)
  void clear() {
    _vm = const SocialVM();
    emit(const SocialState.initial(SocialVM()));
  }

  /// Getter para el user uuid actual
  String get currentUserUuid => _authService.uuid;
}
