enum AppRoutes {
  start('/', 'start'),
  //
  signUp('/sign-up', 'signUp'),
  signUpBusiness('/sign-up-business', 'signUpBusiness'),
  login('/login', 'login'),
  //
  profileScreen('$_accountSettingsRoot/profile', 'profileScreen'),
  // Home routes
  home('$mainRoute/home', 'home'),
  foodlyMainPage('$_routeIdParam/foodly-main-page', 'foodlyMainPage'),
  usersCommunity('$_routeIdParam/users-community', 'usersCommunity'),
  savedPromotions('$_routeIdParam/saved-promotions', 'savedPromotions'),
  favedBusiness('$_routeIdParam/faved-business', 'favedBusiness'),
  notifications('$_routeIdParam/notifications', 'notifications'),
  //
  businessPanel('$mainRoute/$_routeIdParam/business-panel', 'businessPanel'),
  chatRoom('$mainRoute/$_routeIdParam/chat-room', 'chatRoom'),
  //
  noAccess('/no-access', 'noAccess'),
  notFoundScreen('/not-found', 'notFoundScreen'),
  error('/error', 'error'),
  error500('/500/$_routeExtraParam', 'error500');

  static const String mainRoute = '/main';
  static const String _accountSettingsRoot = '$mainRoute/$_routeIdParam/account-settings';
  static const String _routeIdParam = ':id';

  /// Note that when passing extra data as path param the encoded string should be less then url's max length limit
  /// https://stackoverflow.com/questions/417142/what-is-the-maximum-length-of-a-url-in-different-browsers
  static const String _routeExtraParam = ':extra';

  static String get routeIdParam => _routeIdParam.replaceFirst(':', '');
  static String get routeExtraParam => _routeExtraParam.replaceFirst(':', '');

  final String path;
  final String name;

  const AppRoutes(this.path, this.name);
}
