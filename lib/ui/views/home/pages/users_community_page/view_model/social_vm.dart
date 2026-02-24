import 'package:foodly_world/data_models/posts/post_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_vm.freezed.dart';

enum SocialPageViews {
  posts,
  users;

  String get title {
    return switch (this) {
      SocialPageViews.posts => 'Posts',
      SocialPageViews.users => 'Users',
    };
  }
}

@freezed
class SocialVM with _$SocialVM {
  const SocialVM._();

  const factory SocialVM({
    @Default(SocialPageViews.posts) SocialPageViews currentView,
    @Default([]) List<PostDM> posts,
    PostsMetaDM? postsMeta,
    @Default(false) bool isLoadingMorePosts,
    @Default(false) bool isCreatingPost,
  }) = _SocialVM;

  bool get canLoadMorePosts =>
      !isLoadingMorePosts &&
      postsMeta != null &&
      postsMeta!.currentPage < postsMeta!.lastPage;

  int get currentPage => postsMeta?.currentPage ?? 1;
  int get lastPage => postsMeta?.lastPage ?? 1;
  int get totalPosts => postsMeta?.total ?? 0;
}
