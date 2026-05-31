class FoodlyStrings {
  const FoodlyStrings._();

  // Api provider keys:
  static const AUTHORIZATION = 'Authorization';
  static const APPLICATION_JSON = 'application/json';
  static const CONTENT_TYPE = 'content-type';
  static const ACCEPT = 'accept';

  // Media types:
  static const PNG = 'png';
  static const IMAGE = 'image';

  // Uri schemes:
  static const MAILTO = 'mailto';
  static const TEL = 'tel';

  // Local storage keys:
  static const LAST_PATH = 'lastPath';
  static const LAST_VISITED_BUSINESS_UUID = 'lastVisitedBusinessUuid';

  // Utils strings:
  static const FIRST_NAME = 'firstName';
  static const LAST_NAME = 'lastName';

  // Localization string KEYS:
  static const COUNTRY = 'country';
  static const ADDRESS_COMPONENTS = 'address_components';
  static const TYPES = 'types';
  static const LONG_NAME = 'long_name';
  static const SHORT_NAME = 'short_name';
  static const ADMIN_AREA_LEVEL_1 = 'administrative_area_level_1';
  static const LOCALITY = 'locality';
  static const ROUTE = 'route';
  static const POSTAL_CODE = 'postal_code';

  // View port types:
  static const CIRCLE = 'circle';
  static const SQUARE = 'square';

  // Google sign in:
  static const GOOGLE_SIGN_IN_SCOPES = ['email', 'https://www.googleapis.com/auth/userinfo.profile'];

  // Supported Languages
  static const EN = 'en';
  static const ES = 'es';
  static const PT = 'pt';

  // Default id for new menu:
  static const NEW_MENU = 'new_menu';
  static const NEW_CATEGORY = 'new_category';
  static const NEW_ITEM = 'new_item';

  // AI models for service configuration:
  static const GPT_4_MODEL = 'gpt-4';
  static const GPT_4O_MINI_MODEL = 'gpt-4o-mini';

  // Avatar placeholders
  static const LOGO_PLACEHOLDER = 'https://foodly.s3.us-east-1.amazonaws.com/images/business-placeholder.png';
  static const USER_AVATAR_PLACEHOLDER = 'https://foodly.s3.us-east-1.amazonaws.com/images/users-placeholder.png';
  static const USER_AVATAR_PLACEHOLDER_ALTERNATIVE_1 = 'https://foodly.s3.us-east-1.amazonaws.com/images/user.png';
  static const USER_AVATAR_PLACEHOLDER_ALTERNATIVE_2 = 'https://foodly.s3.us-east-1.amazonaws.com/images/user-2.png';

  // Categories
  static const LAST_CATEGORY_VISITED = 'last_category_visited';

  // View mode preference
  static const PREFERRED_VIEW_MODE = 'preferred_view_mode';

  // Store URLs (producción).
  //
  // Ambas son DETERMINÍSTICAS y no dependen de que la store ya haya
  // publicado para conocerlas:
  //  - Play Store usa el `applicationId` de Android
  //    (`com.foodlysolutions.app`, ver `android/app/build.gradle`).
  //  - App Store usa el App ID numérico de App Store Connect
  //    (`6761689908`, visible en la URL de la ficha de la app).
  //
  // Funcionan globalmente en cuanto cada store apruebe y publique la
  // release; antes de eso devuelven "page not found". Si más adelante
  // migramos a un short link bajo `foodly.solutions` que redirija por
  // User-Agent, éste es el único lugar que cambia.
  static const PLAY_STORE_URL = 'https://play.google.com/store/apps/details?id=com.foodlysolutions.app';
  static const APP_STORE_URL = 'https://apps.apple.com/app/id6761689908';

  /// Switch global de visibilidad del CTA de App Store en la UI (botón de
  /// descarga en el menú público, share en About Us, etc.). Mientras Apple
  /// no apruebe Foodly, dejar a `false` para no exponer un link que
  /// devuelve "page not found". Al aprobarse la primera versión iOS,
  /// flipear a `true` y todas las superficies que lo consultan habilitan
  /// el path de App Store sin más cambios.
  static const IOS_APP_LIVE = false;
}
