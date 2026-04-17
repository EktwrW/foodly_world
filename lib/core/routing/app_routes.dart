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
  categories('$mainRoute/categories', 'categories'),
  foodlyMainPage('$_routeIdParam/foodly-main-page', 'foodlyMainPage'),
  usersCommunity('$_routeIdParam/users-community', 'usersCommunity'),
  savedPromotions('$_routeIdParam/saved-promotions', 'savedPromotions'),
  favedBusiness('$_routeIdParam/faved-business', 'favedBusiness'),
  notifications('$_routeIdParam/notifications', 'notifications'),
  privacyPolicy('/privacy', 'privacyPolicy'),
  termsConditions('/terms', 'termsConditions'),
  myReservations('/my-reservations', 'myReservations'),
  about('/about', 'about'),
  manageReservations('$mainRoute/$_routeIdParam/my-business/manage-reservations', 'manageReservations'),
  // Business routes
  myBusiness('$mainRoute/$_routeIdParam/my-business', 'myBusiness'),
  manageMenu('/manage-menu/$_routeIdParam', 'manageMenu'),
  managePromotions('$mainRoute/$_routeIdParam/my-business/manage-promotions', 'managePromotions'),
  manageServicePackages('$mainRoute/$_routeIdParam/my-business/service-packages', 'manageServicePackages'),
  businessAnalytics('$mainRoute/$_routeIdParam/my-business/analytics', 'businessAnalytics'),
  visitBusiness('$mainRoute/$_routeIdParam/visit-business', 'visitBusiness'),
  visitMenu('/visit-menu/$_routeIdParam', 'visitMenu'),
  visitServicePackages('$mainRoute/$_routeIdParam/visit-business/visit-service-packages', 'visitServicePackages'),
  visitPromotions('$mainRoute/$_routeIdParam/visit-business/visit-promotions', 'visitPromotions'),
  // Chat room
  chatRoom('$mainRoute/$_routeIdParam/chat-room', 'chatRoom'),
  //
  publicMenu('/:businessUuid', 'publicMenu'),
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
