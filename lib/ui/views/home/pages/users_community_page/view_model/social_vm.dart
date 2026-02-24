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
