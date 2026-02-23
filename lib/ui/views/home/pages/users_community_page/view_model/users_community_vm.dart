enum UsersCommunityViews {
  posts,
  users,
  notifications;

  String get title {
    return switch (this) {
      UsersCommunityViews.posts => 'Posts',
      UsersCommunityViews.users => 'Users',
      UsersCommunityViews.notifications => 'Notifications',
    };
  }
}
