// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Import menu with AI`
  String get aiMenuImportTitle {
    return Intl.message(
      'Import menu with AI',
      name: 'aiMenuImportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Digitize your menu with AI`
  String get aiMenuImportHeroTitle {
    return Intl.message(
      'Digitize your menu with AI',
      name: 'aiMenuImportHeroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload photos of your menu and AI extracts items, categories and prices automatically.`
  String get aiMenuImportHeroSubtitle {
    return Intl.message(
      'Upload photos of your menu and AI extracts items, categories and prices automatically.',
      name: 'aiMenuImportHeroSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `This feature uses AI to extract menu items from your photos. AI can make mistakes — review names, prices and descriptions before confirming.`
  String get aiMenuImportDisclaimer {
    return Intl.message(
      'This feature uses AI to extract menu items from your photos. AI can make mistakes — review names, prices and descriptions before confirming.',
      name: 'aiMenuImportDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `For best results: one photo per section, good lighting, no glare, no parallel columns.`
  String get aiMenuImportTips {
    return Intl.message(
      'For best results: one photo per section, good lighting, no glare, no parallel columns.',
      name: 'aiMenuImportTips',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get aiMenuImportCamera {
    return Intl.message(
      'Camera',
      name: 'aiMenuImportCamera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get aiMenuImportGallery {
    return Intl.message(
      'Gallery',
      name: 'aiMenuImportGallery',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{1 photo selected} other{{count} photos selected}}`
  String aiMenuImportSelectedPhotosLabel(int count) {
    return Intl.plural(
      count,
      one: '1 photo selected',
      other: '$count photos selected',
      name: 'aiMenuImportSelectedPhotosLabel',
      desc: '',
      args: [count],
    );
  }

  /// `Analyze with AI`
  String get aiMenuImportAnalyzeCta {
    return Intl.message(
      'Analyze with AI',
      name: 'aiMenuImportAnalyzeCta',
      desc: '',
      args: [],
    );
  }

  /// `Uploading {current} of {total}`
  String aiMenuImportUploading(int current, int total) {
    return Intl.message(
      'Uploading $current of $total',
      name: 'aiMenuImportUploading',
      desc: '',
      args: [current, total],
    );
  }

  /// `Analyzing {current} of {total}`
  String aiMenuImportParsing(int current, int total) {
    return Intl.message(
      'Analyzing $current of $total',
      name: 'aiMenuImportParsing',
      desc: '',
      args: [current, total],
    );
  }

  /// `Securely uploading your photos to Foodly`
  String get aiMenuImportUploadingHint {
    return Intl.message(
      'Securely uploading your photos to Foodly',
      name: 'aiMenuImportUploadingHint',
      desc: '',
      args: [],
    );
  }

  /// `AI may take a few seconds per photo`
  String get aiMenuImportParsingHint {
    return Intl.message(
      'AI may take a few seconds per photo',
      name: 'aiMenuImportParsingHint',
      desc: '',
      args: [],
    );
  }

  /// `Review screen coming soon — you'll be able to edit before confirming`
  String get aiMenuImportReviewPending {
    return Intl.message(
      'Review screen coming soon — you\'ll be able to edit before confirming',
      name: 'aiMenuImportReviewPending',
      desc: '',
      args: [],
    );
  }

  /// `Review your menu`
  String get aiMenuImportReviewTitle {
    return Intl.message(
      'Review your menu',
      name: 'aiMenuImportReviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{We detected 1 item} other{We detected {count} items}}`
  String aiMenuImportReviewHeaderTitle(int count) {
    return Intl.plural(
      count,
      one: 'We detected 1 item',
      other: 'We detected $count items',
      name: 'aiMenuImportReviewHeaderTitle',
      desc: '',
      args: [count],
    );
  }

  /// `Review names and prices. Tap the X to remove items you don't want.`
  String get aiMenuImportReviewHeaderHint {
    return Intl.message(
      'Review names and prices. Tap the X to remove items you don\'t want.',
      name: 'aiMenuImportReviewHeaderHint',
      desc: '',
      args: [],
    );
  }

  /// `Add description (optional)`
  String get aiMenuImportReviewDescriptionHint {
    return Intl.message(
      'Add description (optional)',
      name: 'aiMenuImportReviewDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get aiMenuImportReviewConfidenceOk {
    return Intl.message(
      'OK',
      name: 'aiMenuImportReviewConfidenceOk',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get aiMenuImportReviewConfidenceCheck {
    return Intl.message(
      'Review',
      name: 'aiMenuImportReviewConfidenceCheck',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get aiMenuImportReviewConfidenceVerify {
    return Intl.message(
      'Verify',
      name: 'aiMenuImportReviewConfidenceVerify',
      desc: '',
      args: [],
    );
  }

  /// `Regular`
  String get aiMenuImportReviewVersionRegular {
    return Intl.message(
      'Regular',
      name: 'aiMenuImportReviewVersionRegular',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get aiMenuImportReviewVersionMedium {
    return Intl.message(
      'Medium',
      name: 'aiMenuImportReviewVersionMedium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get aiMenuImportReviewVersionBig {
    return Intl.message(
      'Large',
      name: 'aiMenuImportReviewVersionBig',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{No items to import} =1{1 item will be added to your menu} other{{count} items will be added to your menu}}`
  String aiMenuImportReviewFooterCount(int count) {
    return Intl.plural(
      count,
      zero: 'No items to import',
      one: '1 item will be added to your menu',
      other: '$count items will be added to your menu',
      name: 'aiMenuImportReviewFooterCount',
      desc: '',
      args: [count],
    );
  }

  /// `Add to menu`
  String get aiMenuImportReviewConfirmCta {
    return Intl.message(
      'Add to menu',
      name: 'aiMenuImportReviewConfirmCta',
      desc: '',
      args: [],
    );
  }

  /// `Saving…`
  String get aiMenuImportReviewConfirming {
    return Intl.message(
      'Saving…',
      name: 'aiMenuImportReviewConfirming',
      desc: '',
      args: [],
    );
  }

  /// `Your menu is ready!`
  String get aiMenuImportSuccessTitle {
    return Intl.message(
      'Your menu is ready!',
      name: 'aiMenuImportSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `We imported {items} items in {categories} categories.`
  String aiMenuImportSuccessSubtitle(int items, int categories) {
    return Intl.message(
      'We imported $items items in $categories categories.',
      name: 'aiMenuImportSuccessSubtitle',
      desc: '',
      args: [items, categories],
    );
  }

  /// `You can now add photos to each item, adjust prices or reorder them anytime.`
  String get aiMenuImportSuccessHint {
    return Intl.message(
      'You can now add photos to each item, adjust prices or reorder them anytime.',
      name: 'aiMenuImportSuccessHint',
      desc: '',
      args: [],
    );
  }

  /// `View my menu`
  String get aiMenuImportSuccessCta {
    return Intl.message(
      'View my menu',
      name: 'aiMenuImportSuccessCta',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{1 dish} other{{count} dishes}}`
  String aiMenuImportSuccessStatFood(int count) {
    return Intl.plural(
      count,
      one: '1 dish',
      other: '$count dishes',
      name: 'aiMenuImportSuccessStatFood',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =1{1 drink} other{{count} drinks}}`
  String aiMenuImportSuccessStatDrinks(int count) {
    return Intl.plural(
      count,
      one: '1 drink',
      other: '$count drinks',
      name: 'aiMenuImportSuccessStatDrinks',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =1{1 combo} other{{count} combos}}`
  String aiMenuImportSuccessStatCombos(int count) {
    return Intl.plural(
      count,
      one: '1 combo',
      other: '$count combos',
      name: 'aiMenuImportSuccessStatCombos',
      desc: '',
      args: [count],
    );
  }

  /// `Digitize your menu`
  String get aiMenuImportEmptyStateTitle {
    return Intl.message(
      'Digitize your menu',
      name: 'aiMenuImportEmptyStateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload photos of your menu sections and AI extracts the items, categories and prices automatically.`
  String get aiMenuImportEmptyStateSubtitle {
    return Intl.message(
      'Upload photos of your menu sections and AI extracts the items, categories and prices automatically.',
      name: 'aiMenuImportEmptyStateSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Import with AI`
  String get aiMenuImportEmptyStateCta {
    return Intl.message(
      'Import with AI',
      name: 'aiMenuImportEmptyStateCta',
      desc: '',
      args: [],
    );
  }

  /// `To add them by hand, open the floating menu and tap Edit`
  String get aiMenuImportEmptyStateManualHint {
    return Intl.message(
      'To add them by hand, open the floating menu and tap Edit',
      name: 'aiMenuImportEmptyStateManualHint',
      desc: '',
      args: [],
    );
  }

  /// `Enable digital menu`
  String get enableDigitalMenu {
    return Intl.message(
      'Enable digital menu',
      name: 'enableDigitalMenu',
      desc: '',
      args: [],
    );
  }

  /// `Show a menu alongside your packages`
  String get enableDigitalMenuHint {
    return Intl.message(
      'Show a menu alongside your packages',
      name: 'enableDigitalMenuHint',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Accessible PMR`
  String get accessiblePMR {
    return Intl.message(
      'Accessible PMR',
      name: 'accessiblePMR',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Add a description`
  String get addADescription {
    return Intl.message(
      'Add a description',
      name: 'addADescription',
      desc: '',
      args: [],
    );
  }

  /// `Add additional information`
  String get addAdditionalInformation {
    return Intl.message(
      'Add additional information',
      name: 'addAdditionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Add a new time period`
  String get addANewTimePeriod {
    return Intl.message(
      'Add a new time period',
      name: 'addANewTimePeriod',
      desc: '',
      args: [],
    );
  }

  /// `Add contact channels`
  String get addContact {
    return Intl.message(
      'Add contact channels',
      name: 'addContact',
      desc: '',
      args: [],
    );
  }

  /// `Add a name`
  String get addName {
    return Intl.message('Add a name', name: 'addName', desc: '', args: []);
  }

  /// `Add a new category`
  String get addNewCategory {
    return Intl.message(
      'Add a new category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add New Item`
  String get addNewItem {
    return Intl.message('Add New Item', name: 'addNewItem', desc: '', args: []);
  }

  /// `Add Opening Hours`
  String get addOpeningHours {
    return Intl.message(
      'Add Opening Hours',
      name: 'addOpeningHours',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Add Services`
  String get addServices {
    return Intl.message(
      'Add Services',
      name: 'addServices',
      desc: '',
      args: [],
    );
  }

  /// `Add a catchy tagline`
  String get addTagline {
    return Intl.message(
      'Add a catchy tagline',
      name: 'addTagline',
      desc: '',
      args: [],
    );
  }

  /// `Add a title`
  String get addTitle {
    return Intl.message('Add a title', name: 'addTitle', desc: '', args: []);
  }

  /// `Add to your favorites`
  String get addToFavorites {
    return Intl.message(
      'Add to your favorites',
      name: 'addToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Add YouTube URL`
  String get addYoutubeUrl {
    return Intl.message(
      'Add YouTube URL',
      name: 'addYoutubeUrl',
      desc: '',
      args: [],
    );
  }

  /// `Administrator`
  String get admin {
    return Intl.message('Administrator', name: 'admin', desc: '', args: []);
  }

  /// `Generates title (max 36 chars), subtitle (max 99) and description (max 369) for your promotion. You have {count} uses left this month.`
  String aiPromoContent(int count) {
    return Intl.message(
      'Generates title (max 36 chars), subtitle (max 99) and description (max 369) for your promotion. You have $count uses left this month.',
      name: 'aiPromoContent',
      desc: '',
      args: [count],
    );
  }

  /// `Generate`
  String get aiPromoGenerate {
    return Intl.message(
      'Generate',
      name: 'aiPromoGenerate',
      desc: '',
      args: [],
    );
  }

  /// `Include promotional image (16:9)`
  String get aiPromoImageLabel {
    return Intl.message(
      'Include promotional image (16:9)',
      name: 'aiPromoImageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Natural`
  String get aiPromoImageNatural {
    return Intl.message(
      'Natural',
      name: 'aiPromoImageNatural',
      desc: '',
      args: [],
    );
  }

  /// `Vivid`
  String get aiPromoImageVivid {
    return Intl.message('Vivid', name: 'aiPromoImageVivid', desc: '', args: []);
  }

  /// `Monthly Quota Reached`
  String get aiPromoQuotaExhaustedTitle {
    return Intl.message(
      'Monthly Quota Reached',
      name: 'aiPromoQuotaExhaustedTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have used all {limit} AI-generated promotions for this month. Your quota will reset on the 1st of next month.`
  String aiPromoQuotaExhaustedContent(int limit) {
    return Intl.message(
      'You have used all $limit AI-generated promotions for this month. Your quota will reset on the 1st of next month.',
      name: 'aiPromoQuotaExhaustedContent',
      desc: '',
      args: [limit],
    );
  }

  /// `AI Promotion Generator`
  String get aiPromoTitle {
    return Intl.message(
      'AI Promotion Generator',
      name: 'aiPromoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message('Analytics', name: 'analytics', desc: '', args: []);
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `and manage content, promotions, and more`
  String get andCreateContentToThese {
    return Intl.message(
      'and manage content, promotions, and more',
      name: 'andCreateContentToThese',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Argentinian`
  String get argentinian {
    return Intl.message('Argentinian', name: 'argentinian', desc: '', args: []);
  }

  /// `Brazilian`
  String get brazilian {
    return Intl.message('Brazilian', name: 'brazilian', desc: '', args: []);
  }

  /// `Asian`
  String get asian {
    return Intl.message('Asian', name: 'asian', desc: '', args: []);
  }

  /// `Ask for smart text recommendations`
  String get askRecommendationsByTextSmart {
    return Intl.message(
      'Ask for smart text recommendations',
      name: 'askRecommendationsByTextSmart',
      desc: '',
      args: [],
    );
  }

  /// `Ask for recommendations using your voice`
  String get askRecommendationsByYourVoice {
    return Intl.message(
      'Ask for recommendations using your voice',
      name: 'askRecommendationsByYourVoice',
      desc: '',
      args: [],
    );
  }

  /// `at`
  String get at {
    return Intl.message('at', name: 'at', desc: '', args: []);
  }

  /// `Attach video`
  String get attachVideo {
    return Intl.message(
      'Attach video',
      name: 'attachVideo',
      desc: '',
      args: [],
    );
  }

  /// `Could not understand audio. Please try again.`
  String get audioNotUnderstood {
    return Intl.message(
      'Could not understand audio. Please try again.',
      name: 'audioNotUnderstood',
      desc: '',
      args: [],
    );
  }

  /// `Error processing audio. Please try again.`
  String get audioProcessingError {
    return Intl.message(
      'Error processing audio. Please try again.',
      name: 'audioProcessingError',
      desc: '',
      args: [],
    );
  }

  /// `Baby Changing Station`
  String get babyChangingStation {
    return Intl.message(
      'Baby Changing Station',
      name: 'babyChangingStation',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Bakery and Desserts`
  String get bakeryAndDesserts {
    return Intl.message(
      'Bakery and Desserts',
      name: 'bakeryAndDesserts',
      desc: '',
      args: [],
    );
  }

  /// `Big`
  String get big {
    return Intl.message('Big', name: 'big', desc: '', args: []);
  }

  /// `This device's operating system does not support or has not configured biometric or pattern accesses.`
  String get biometricSnackbarTextSpanA {
    return Intl.message(
      'This device\'s operating system does not support or has not configured biometric or pattern accesses.',
      name: 'biometricSnackbarTextSpanA',
      desc: '',
      args: [],
    );
  }

  /// `The session has expired, you must log in with your username and password, or access via Google Sign-In.`
  String get biometricSnackbarTextSpanB {
    return Intl.message(
      'The session has expired, you must log in with your username and password, or access via Google Sign-In.',
      name: 'biometricSnackbarTextSpanB',
      desc: '',
      args: [],
    );
  }

  /// `brands`
  String get brands {
    return Intl.message('brands', name: 'brands', desc: '', args: []);
  }

  /// `Business`
  String get business {
    return Intl.message('Business', name: 'business', desc: '', args: []);
  }

  /// `We'll redirect you to the business registration form. Your submission will be reviewed for platform verification. Please note that creating false businesses, misappropriation, or impersonation of brands and establishments may result in legal consequences.`
  String get businessAccountUpgradeInfo {
    return Intl.message(
      'We\'ll redirect you to the business registration form. Your submission will be reviewed for platform verification. Please note that creating false businesses, misappropriation, or impersonation of brands and establishments may result in legal consequences.',
      name: 'businessAccountUpgradeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Business Category`
  String get businessCategory {
    return Intl.message(
      'Business Category',
      name: 'businessCategory',
      desc: '',
      args: [],
    );
  }

  /// `Note about business information:`
  String get businessInfoNote {
    return Intl.message(
      'Note about business information:',
      name: 'businessInfoNote',
      desc: '',
      args: [],
    );
  }

  /// `Business information not found`
  String get businessInformationNotFound {
    return Intl.message(
      'Business information not found',
      name: 'businessInformationNotFound',
      desc: '',
      args: [],
    );
  }

  /// `acts only as a display platform. Prices, availability, content and quality of products, as well as nutritional and allergen information in this menu, are the sole responsibility of the business establishment. Foodly is not responsible for any discrepancies, inaccuracies or changes in the information provided by the business.`
  String get businessDisclaimer {
    return Intl.message(
      'acts only as a display platform. Prices, availability, content and quality of products, as well as nutritional and allergen information in this menu, are the sole responsibility of the business establishment. Foodly is not responsible for any discrepancies, inaccuracies or changes in the information provided by the business.',
      name: 'businessDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `businesses`
  String get businesses {
    return Intl.message('businesses', name: 'businesses', desc: '', args: []);
  }

  /// `Business Name`
  String get businessName {
    return Intl.message(
      'Business Name',
      name: 'businessName',
      desc: '',
      args: [],
    );
  }

  /// `Register Business`
  String get businessRegister {
    return Intl.message(
      'Register Business',
      name: 'businessRegister',
      desc: '',
      args: [],
    );
  }

  /// `New activity at {businessName}`
  String buzzDefaultActivity(Object businessName) {
    return Intl.message(
      'New activity at $businessName',
      name: 'buzzDefaultActivity',
      desc: '',
      args: [businessName],
    );
  }

  /// `Distance radius:`
  String get radiusDistanceLabel {
    return Intl.message(
      'Distance radius:',
      name: 'radiusDistanceLabel',
      desc: '',
      args: [],
    );
  }

  /// `No nearby businesses in this category within {radius} km.`
  String noNearbyBusinessesInCategory(double radius) {
    return Intl.message(
      'No nearby businesses in this category within $radius km.',
      name: 'noNearbyBusinessesInCategory',
      desc: '',
      args: [radius],
    );
  }

  /// `Community activity will appear here`
  String get buzzEmptySubtitle {
    return Intl.message(
      'Community activity will appear here',
      name: 'buzzEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No buzz nearby yet`
  String get buzzEmptyTitle {
    return Intl.message(
      'No buzz nearby yet',
      name: 'buzzEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `The menu at {businessName} is getting attention!`
  String buzzNewFavoriteMenu(Object businessName) {
    return Intl.message(
      'The menu at $businessName is getting attention!',
      name: 'buzzNewFavoriteMenu',
      desc: '',
      args: [businessName],
    );
  }

  /// `"{entityName}" at {businessName} is getting attention!`
  String buzzNewFavoriteMenuNamed(Object entityName, Object businessName) {
    return Intl.message(
      '"$entityName" at $businessName is getting attention!',
      name: 'buzzNewFavoriteMenuNamed',
      desc: '',
      args: [entityName, businessName],
    );
  }

  /// `A dish at {businessName} is trending!`
  String buzzNewFavoriteMenuItem(Object businessName) {
    return Intl.message(
      'A dish at $businessName is trending!',
      name: 'buzzNewFavoriteMenuItem',
      desc: '',
      args: [businessName],
    );
  }

  /// `"{entityName}" at {businessName} is trending!`
  String buzzNewFavoriteMenuItemNamed(Object entityName, Object businessName) {
    return Intl.message(
      '"$entityName" at $businessName is trending!',
      name: 'buzzNewFavoriteMenuItemNamed',
      desc: '',
      args: [entityName, businessName],
    );
  }

  /// `A promotion at {businessName} is popular!`
  String buzzNewFavoritePromotion(Object businessName) {
    return Intl.message(
      'A promotion at $businessName is popular!',
      name: 'buzzNewFavoritePromotion',
      desc: '',
      args: [businessName],
    );
  }

  /// `"{entityName}" at {businessName} is popular!`
  String buzzNewFavoritePromotionNamed(Object entityName, Object businessName) {
    return Intl.message(
      '"$entityName" at $businessName is popular!',
      name: 'buzzNewFavoritePromotionNamed',
      desc: '',
      args: [entityName, businessName],
    );
  }

  /// `{businessName} has a new follower!`
  String buzzNewFollower(Object businessName) {
    return Intl.message(
      '$businessName has a new follower!',
      name: 'buzzNewFollower',
      desc: '',
      args: [businessName],
    );
  }

  /// `{businessName} just posted a new promotion!`
  String buzzNewPromotion(Object businessName) {
    return Intl.message(
      '$businessName just posted a new promotion!',
      name: 'buzzNewPromotion',
      desc: '',
      args: [businessName],
    );
  }

  /// `New review at {businessName}!`
  String buzzNewReview(Object businessName) {
    return Intl.message(
      'New review at $businessName!',
      name: 'buzzNewReview',
      desc: '',
      args: [businessName],
    );
  }

  /// `{businessName} updated a promotion`
  String buzzPromotionUpdate(Object businessName) {
    return Intl.message(
      '$businessName updated a promotion',
      name: 'buzzPromotionUpdate',
      desc: '',
      args: [businessName],
    );
  }

  /// `{actor} left a review at {businessName}`
  String buzzNewReviewSocial(Object actor, Object businessName) {
    return Intl.message(
      '$actor left a review at $businessName',
      name: 'buzzNewReviewSocial',
      desc: '',
      args: [actor, businessName],
    );
  }

  /// `{actor} liked a dish at {businessName}`
  String buzzNewFavoriteMenuItemSocial(Object actor, Object businessName) {
    return Intl.message(
      '$actor liked a dish at $businessName',
      name: 'buzzNewFavoriteMenuItemSocial',
      desc: '',
      args: [actor, businessName],
    );
  }

  /// `{actor} liked "{entityName}" at {businessName}`
  String buzzNewFavoriteMenuItemSocialNamed(
    Object actor,
    Object entityName,
    Object businessName,
  ) {
    return Intl.message(
      '$actor liked "$entityName" at $businessName',
      name: 'buzzNewFavoriteMenuItemSocialNamed',
      desc: '',
      args: [actor, entityName, businessName],
    );
  }

  /// `{actor} saved a menu from {businessName}`
  String buzzNewFavoriteMenuSocial(Object actor, Object businessName) {
    return Intl.message(
      '$actor saved a menu from $businessName',
      name: 'buzzNewFavoriteMenuSocial',
      desc: '',
      args: [actor, businessName],
    );
  }

  /// `{actor} saved the "{entityName}" menu from {businessName}`
  String buzzNewFavoriteMenuSocialNamed(
    Object actor,
    Object entityName,
    Object businessName,
  ) {
    return Intl.message(
      '$actor saved the "$entityName" menu from $businessName',
      name: 'buzzNewFavoriteMenuSocialNamed',
      desc: '',
      args: [actor, entityName, businessName],
    );
  }

  /// `{actor} saved a promo from {businessName}`
  String buzzNewFavoritePromotionSocial(Object actor, Object businessName) {
    return Intl.message(
      '$actor saved a promo from $businessName',
      name: 'buzzNewFavoritePromotionSocial',
      desc: '',
      args: [actor, businessName],
    );
  }

  /// `{actor} saved the "{entityName}" promo from {businessName}`
  String buzzNewFavoritePromotionSocialNamed(
    Object actor,
    Object entityName,
    Object businessName,
  ) {
    return Intl.message(
      '$actor saved the "$entityName" promo from $businessName',
      name: 'buzzNewFavoritePromotionSocialNamed',
      desc: '',
      args: [actor, entityName, businessName],
    );
  }

  /// `{actor} interacted with {businessName}`
  String buzzDefaultActivitySocial(Object actor, Object businessName) {
    return Intl.message(
      '$actor interacted with $businessName',
      name: 'buzzDefaultActivitySocial',
      desc: '',
      args: [actor, businessName],
    );
  }

  /// `Cafés and Breakfasts`
  String get cafesAndBreakfasts {
    return Intl.message(
      'Cafés and Breakfasts',
      name: 'cafesAndBreakfasts',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Cancel Edit`
  String get cancelEdit {
    return Intl.message('Cancel Edit', name: 'cancelEdit', desc: '', args: []);
  }

  /// `Cannot contain spaces or special characters except '_'`
  String get canNotContainSpecialCharactersBut_ {
    return Intl.message(
      'Cannot contain spaces or special characters except \'_\'',
      name: 'canNotContainSpecialCharactersBut_',
      desc: '',
      args: [],
    );
  }

  /// `\nThis action cannot be undone.`
  String get cannotUndone {
    return Intl.message(
      '\nThis action cannot be undone.',
      name: 'cannotUndone',
      desc: '',
      args: [],
    );
  }

  /// `You cannot review your own business.`
  String get cannotReviewOwnBusiness {
    return Intl.message(
      'You cannot review your own business.',
      name: 'cannotReviewOwnBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Category deleted successfully`
  String get categoryDeletedSuccess {
    return Intl.message(
      'Category deleted successfully',
      name: 'categoryDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Category name can not be empty`
  String get categoryNameEmpty {
    return Intl.message(
      'Category name can not be empty',
      name: 'categoryNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Category Title updated successfully`
  String get categoryTitleUpdated {
    return Intl.message(
      'Category Title updated successfully',
      name: 'categoryTitleUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Catering`
  String get catering {
    return Intl.message('Catering', name: 'catering', desc: '', args: []);
  }

  /// `Change Location`
  String get changeLocation {
    return Intl.message(
      'Change Location',
      name: 'changeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Change the search point for recommendations`
  String get changeSearchPoint {
    return Intl.message(
      'Change the search point for recommendations',
      name: 'changeSearchPoint',
      desc: '',
      args: [],
    );
  }

  /// `Change username`
  String get changeUsername {
    return Intl.message(
      'Change username',
      name: 'changeUsername',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Closed`
  String get closed {
    return Intl.message('Closed', name: 'closed', desc: '', args: []);
  }

  /// `Combos`
  String get combos {
    return Intl.message('Combos', name: 'combos', desc: '', args: []);
  }

  /// `Composure`
  String get composure {
    return Intl.message('Composure', name: 'composure', desc: '', args: []);
  }

  /// `Complete`
  String get complete {
    return Intl.message('Complete', name: 'complete', desc: '', args: []);
  }

  /// `Complete Registration`
  String get completeSignUp {
    return Intl.message(
      'Complete Registration',
      name: 'completeSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Connection error. Check your internet connection and try again.`
  String get connectionError {
    return Intl.message(
      'Connection error. Check your internet connection and try again.',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Contact Email`
  String get contactEmail {
    return Intl.message(
      'Contact Email',
      name: 'contactEmail',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contactNumber {
    return Intl.message(
      'Contact Number',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }

  /// `Only visible to you and businesses where you have an active reservation.`
  String get contactPrivacyNotice {
    return Intl.message(
      'Only visible to you and businesses where you have an active reservation.',
      name: 'contactPrivacyNotice',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Select recipient`
  String get contactSelectRecipient {
    return Intl.message(
      'Select recipient',
      name: 'contactSelectRecipient',
      desc: '',
      args: [],
    );
  }

  /// `General Inquiries`
  String get contactRecipientHello {
    return Intl.message(
      'General Inquiries',
      name: 'contactRecipientHello',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Data`
  String get contactRecipientPrivacy {
    return Intl.message(
      'Privacy & Data',
      name: 'contactRecipientPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Subject of your message`
  String get contactSubjectHint {
    return Intl.message(
      'Subject of your message',
      name: 'contactSubjectHint',
      desc: '',
      args: [],
    );
  }

  /// `Write your message here...`
  String get contactMessageHint {
    return Intl.message(
      'Write your message here...',
      name: 'contactMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `Attach image (optional, max 3 MB)`
  String get contactAttachImage {
    return Intl.message(
      'Attach image (optional, max 3 MB)',
      name: 'contactAttachImage',
      desc: '',
      args: [],
    );
  }

  /// `Image attached`
  String get contactImageAttached {
    return Intl.message(
      'Image attached',
      name: 'contactImageAttached',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get contactRemoveImage {
    return Intl.message(
      'Remove',
      name: 'contactRemoveImage',
      desc: '',
      args: [],
    );
  }

  /// `Your message has been sent successfully!`
  String get contactSentSuccess {
    return Intl.message(
      'Your message has been sent successfully!',
      name: 'contactSentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The image must be less than 3 MB`
  String get contactFileTooLarge {
    return Intl.message(
      'The image must be less than 3 MB',
      name: 'contactFileTooLarge',
      desc: '',
      args: [],
    );
  }

  /// `Foodly Coverage`
  String get foodlyCoverage {
    return Intl.message(
      'Foodly Coverage',
      name: 'foodlyCoverage',
      desc: '',
      args: [],
    );
  }

  /// `Foodly is currently available in the following countries:`
  String get foodlyCoverageDescription {
    return Intl.message(
      'Foodly is currently available in the following countries:',
      name: 'foodlyCoverageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Not in your country yet?`
  String get notInYourCountry {
    return Intl.message(
      'Not in your country yet?',
      name: 'notInYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Suggest Foodly in your country`
  String get suggestFoodlyInYourCountry {
    return Intl.message(
      'Suggest Foodly in your country',
      name: 'suggestFoodlyInYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Bring Foodly to my country`
  String get suggestFoodlySubject {
    return Intl.message(
      'Bring Foodly to my country',
      name: 'suggestFoodlySubject',
      desc: '',
      args: [],
    );
  }

  /// `Your location is outside Foodly's current coverage`
  String get outsideCoverage {
    return Intl.message(
      'Your location is outside Foodly\'s current coverage',
      name: 'outsideCoverage',
      desc: '',
      args: [],
    );
  }

  /// `Cooking Schools`
  String get cookingSchools {
    return Intl.message(
      'Cooking Schools',
      name: 'cookingSchools',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © {year} - All rights reserved`
  String copyrightText(int year) {
    return Intl.message(
      'Copyright © $year - All rights reserved',
      name: 'copyrightText',
      desc: '',
      args: [year],
    );
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Argentina`
  String get countryArgentina {
    return Intl.message(
      'Argentina',
      name: 'countryArgentina',
      desc: '',
      args: [],
    );
  }

  /// `Ecuador`
  String get countryEcuador {
    return Intl.message('Ecuador', name: 'countryEcuador', desc: '', args: []);
  }

  /// `El Salvador`
  String get countryElSalvador {
    return Intl.message(
      'El Salvador',
      name: 'countryElSalvador',
      desc: '',
      args: [],
    );
  }

  /// `Portugal`
  String get countryPortugal {
    return Intl.message(
      'Portugal',
      name: 'countryPortugal',
      desc: '',
      args: [],
    );
  }

  /// `Spain`
  String get countrySpain {
    return Intl.message('Spain', name: 'countrySpain', desc: '', args: []);
  }

  /// `USA`
  String get countryUsa {
    return Intl.message('USA', name: 'countryUsa', desc: '', args: []);
  }

  /// `Venezuela`
  String get countryVenezuela {
    return Intl.message(
      'Venezuela',
      name: 'countryVenezuela',
      desc: '',
      args: [],
    );
  }

  /// `Cover Images successfully updated!`
  String get coverImagesSuccessfullyUpdated {
    return Intl.message(
      'Cover Images successfully updated!',
      name: 'coverImagesSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Create new promotion`
  String get createNewPromotion {
    return Intl.message(
      'Create new promotion',
      name: 'createNewPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Create User`
  String get createUser {
    return Intl.message('Create User', name: 'createUser', desc: '', args: []);
  }

  /// `Crop Image`
  String get cropImage {
    return Intl.message('Crop Image', name: 'cropImage', desc: '', args: []);
  }

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Additional`
  String get dashboardAdditionalInformationText1 {
    return Intl.message(
      'Additional',
      name: 'dashboardAdditionalInformationText1',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get dashboardAdditionalInformationText2 {
    return Intl.message(
      'Info',
      name: 'dashboardAdditionalInformationText2',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get dashboardContactText1 {
    return Intl.message(
      'Contact',
      name: 'dashboardContactText1',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get dashboardContactText2 {
    return Intl.message(
      'Information',
      name: 'dashboardContactText2',
      desc: '',
      args: [],
    );
  }

  /// `Opening`
  String get dashboardOpeningHoursText1 {
    return Intl.message(
      'Opening',
      name: 'dashboardOpeningHoursText1',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get dashboardOpeningHoursText2 {
    return Intl.message(
      'Hours',
      name: 'dashboardOpeningHoursText2',
      desc: '',
      args: [],
    );
  }

  /// `Reviews of Our`
  String get dashboardReviewsOfOurCustomersText1 {
    return Intl.message(
      'Reviews of Our',
      name: 'dashboardReviewsOfOurCustomersText1',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get dashboardReviewsOfOurCustomersText2 {
    return Intl.message(
      'Customers',
      name: 'dashboardReviewsOfOurCustomersText2',
      desc: '',
      args: [],
    );
  }

  /// `Services at`
  String get dashboardServicesAtText1 {
    return Intl.message(
      'Services at',
      name: 'dashboardServicesAtText1',
      desc: '',
      args: [],
    );
  }

  /// `Establishment`
  String get dashboardServicesAtText2 {
    return Intl.message(
      'Establishment',
      name: 'dashboardServicesAtText2',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `\n\nThis action will permanently delete all items in this category.`
  String get deleteAllCategoryItems {
    return Intl.message(
      '\n\nThis action will permanently delete all items in this category.',
      name: 'deleteAllCategoryItems',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get deleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'deleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Move Up`
  String get moveUp {
    return Intl.message('Move Up', name: 'moveUp', desc: '', args: []);
  }

  /// `Move Down`
  String get moveDown {
    return Intl.message('Move Down', name: 'moveDown', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Do you want to delete this cover image?`
  String get doYouWantToDeleteThisCoverImage {
    return Intl.message(
      'Do you want to delete this cover image?',
      name: 'doYouWantToDeleteThisCoverImage',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get drinks {
    return Intl.message('Drinks', name: 'drinks', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Edit Cover Images`
  String get editCoverImages {
    return Intl.message(
      'Edit Cover Images',
      name: 'editCoverImages',
      desc: '',
      args: [],
    );
  }

  /// `Edit Location`
  String get editLocation {
    return Intl.message(
      'Edit Location',
      name: 'editLocation',
      desc: '',
      args: [],
    );
  }

  /// `Edit menu`
  String get editMenu {
    return Intl.message('Edit menu', name: 'editMenu', desc: '', args: []);
  }

  /// `Edit Title`
  String get editTitle {
    return Intl.message('Edit Title', name: 'editTitle', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enable location`
  String get enableLocation {
    return Intl.message(
      'Enable location',
      name: 'enableLocation',
      desc: '',
      args: [],
    );
  }

  /// `Tap to enable location access`
  String get enableLocationDescription {
    return Intl.message(
      'Tap to enable location access',
      name: 'enableLocationDescription',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message('End', name: 'end', desc: '', args: []);
  }

  /// `End date`
  String get endDate {
    return Intl.message('End date', name: 'endDate', desc: '', args: []);
  }

  /// `End Session`
  String get endSession {
    return Intl.message('End Session', name: 'endSession', desc: '', args: []);
  }

  /// `Please enter a valid email address`
  String get enterAValidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'enterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get enterAValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'enterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid postal code`
  String get enterAValidPostalCode {
    return Intl.message(
      'Please enter a valid postal code',
      name: 'enterAValidPostalCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter a name for this category`
  String get enterCategoryName {
    return Intl.message(
      'Enter a name for this category',
      name: 'enterCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Error loading video`
  String get errorLoadingVideo {
    return Intl.message(
      'Error loading video',
      name: 'errorLoadingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Error updating promotion media`
  String get errorUpdatingPromotionMedia {
    return Intl.message(
      'Error updating promotion media',
      name: 'errorUpdatingPromotionMedia',
      desc: '',
      args: [],
    );
  }

  /// `Error uploading promotion media`
  String get errorUploadingPromotionMedia {
    return Intl.message(
      'Error uploading promotion media',
      name: 'errorUploadingPromotionMedia',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete item photos:\n\n{errorMsg}`
  String failedDeletePhotos(Object errorMsg) {
    return Intl.message(
      'Failed to delete item photos:\n\n$errorMsg',
      name: 'failedDeletePhotos',
      desc: '',
      args: [errorMsg],
    );
  }

  /// `Fast Food`
  String get fastFood {
    return Intl.message('Fast Food', name: 'fastFood', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Easily find and complete your address`
  String get findAndCompleteAddress {
    return Intl.message(
      'Easily find and complete your address',
      name: 'findAndCompleteAddress',
      desc: '',
      args: [],
    );
  }

  /// `Finish edit mode`
  String get finishEdit {
    return Intl.message(
      'Finish edit mode',
      name: 'finishEdit',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Food`
  String get food {
    return Intl.message('Food', name: 'food', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Fusion`
  String get fusionCuisine {
    return Intl.message('Fusion', name: 'fusionCuisine', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Generate QR code`
  String get generateQR {
    return Intl.message(
      'Generate QR code',
      name: 'generateQR',
      desc: '',
      args: [],
    );
  }

  /// `Download QR image`
  String get downloadQrImage {
    return Intl.message(
      'Download QR image',
      name: 'downloadQrImage',
      desc: '',
      args: [],
    );
  }

  /// `Generating…`
  String get generatingQr {
    return Intl.message(
      'Generating…',
      name: 'generatingQr',
      desc: '',
      args: [],
    );
  }

  /// `Scan to view our menu`
  String get scanForMenu {
    return Intl.message(
      'Scan to view our menu',
      name: 'scanForMenu',
      desc: '',
      args: [],
    );
  }

  /// `Powered by`
  String get poweredBy {
    return Intl.message('Powered by', name: 'poweredBy', desc: '', args: []);
  }

  /// `Saved to your photos`
  String get qrSavedToGallery {
    return Intl.message(
      'Saved to your photos',
      name: 'qrSavedToGallery',
      desc: '',
      args: [],
    );
  }

  /// `Generate with AI`
  String get generateWithAI {
    return Intl.message(
      'Generate with AI',
      name: 'generateWithAI',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'Good Evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Happy Birthday`
  String get happyBirthday {
    return Intl.message(
      'Happy Birthday',
      name: 'happyBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Happy Hours`
  String get happyHours {
    return Intl.message('Happy Hours', name: 'happyHours', desc: '', args: []);
  }

  /// `Hi`
  String get hi {
    return Intl.message('Hi', name: 'hi', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Image size must be less than 10MB`
  String get imageSizeLessThan10mb {
    return Intl.message(
      'Image size must be less than 10MB',
      name: 'imageSizeLessThan10mb',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete information to create promotion`
  String get incompletePromotionCreateInfo {
    return Intl.message(
      'Incomplete information to create promotion',
      name: 'incompletePromotionCreateInfo',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete information to update promotion`
  String get incompletePromotionUpdateInfo {
    return Intl.message(
      'Incomplete information to update promotion',
      name: 'incompletePromotionUpdateInfo',
      desc: '',
      args: [],
    );
  }

  /// `Information not yet provided by the business.`
  String get informationNotYetProvidedByTheBusiness {
    return Intl.message(
      'Information not yet provided by the business.',
      name: 'informationNotYetProvidedByTheBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Internal error processing request. Prompt text is empty`
  String get internalErrorEmptyPrompt {
    return Intl.message(
      'Internal error processing request. Prompt text is empty',
      name: 'internalErrorEmptyPrompt',
      desc: '',
      args: [],
    );
  }

  /// `International`
  String get internationalCuisine {
    return Intl.message(
      'International',
      name: 'internationalCuisine',
      desc: '',
      args: [],
    );
  }

  /// `Brief intro for new visitors`
  String get introMessage {
    return Intl.message(
      'Brief intro for new visitors',
      name: 'introMessage',
      desc: '',
      args: [],
    );
  }

  /// `You can use this space to welcome customers and highlight what makes your business special.\nWe'll promote it on the main page for about 30 days.`
  String get introMessageTooltip {
    return Intl.message(
      'You can use this space to welcome customers and highlight what makes your business special.\nWe\'ll promote it on the main page for about 30 days.',
      name: 'introMessageTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Start date is after end date`
  String get invalidPromoDates {
    return Intl.message(
      'Start date is after end date',
      name: 'invalidPromoDates',
      desc: '',
      args: [],
    );
  }

  /// `Invalid menu category`
  String get invalidMenuCategory {
    return Intl.message(
      'Invalid menu category',
      name: 'invalidMenuCategory',
      desc: '',
      args: [],
    );
  }

  /// `Invalid YouTube URL`
  String get invalidYoutubeUrl {
    return Intl.message(
      'Invalid YouTube URL',
      name: 'invalidYoutubeUrl',
      desc: '',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message('Italian', name: 'italian', desc: '', args: []);
  }

  /// `Available Item`
  String get itemAvailable {
    return Intl.message(
      'Available Item',
      name: 'itemAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Item created successfully`
  String get itemCreatedSuccess {
    return Intl.message(
      'Item created successfully',
      name: 'itemCreatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted successfully`
  String get itemDeletedSuccess {
    return Intl.message(
      'Item deleted successfully',
      name: 'itemDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Item updated successfully`
  String get itemUpdatedSuccess {
    return Intl.message(
      'Item updated successfully',
      name: 'itemUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Temporarily Unavailable Item`
  String get itemUnavailable {
    return Intl.message(
      'Temporarily Unavailable Item',
      name: 'itemUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Kid Chairs`
  String get kidChairs {
    return Intl.message('Kid Chairs', name: 'kidChairs', desc: '', args: []);
  }

  /// `Kids menu`
  String get kidsMenu {
    return Intl.message('Kids menu', name: 'kidsMenu', desc: '', args: []);
  }

  /// `Kids Play Area`
  String get kidsPlayArea {
    return Intl.message(
      'Kids Play Area',
      name: 'kidsPlayArea',
      desc: '',
      args: [],
    );
  }

  /// `Korean`
  String get koreanCuisine {
    return Intl.message('Korean', name: 'koreanCuisine', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Listening`
  String get listening {
    return Intl.message('Listening', name: 'listening', desc: '', args: []);
  }

  /// `Live Music`
  String get liveMusic {
    return Intl.message('Live Music', name: 'liveMusic', desc: '', args: []);
  }

  /// `Load Logo`
  String get loadLogo {
    return Intl.message('Load Logo', name: 'loadLogo', desc: '', args: []);
  }

  /// `Location permission denied. We need your location to show nearby restaurants.`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied. We need your location to show nearby restaurants.',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permanently denied. Please enable it in app settings.`
  String get locationPermissionPermanentlyDenied {
    return Intl.message(
      'Location permanently denied. Please enable it in app settings.',
      name: 'locationPermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Foodly uses your location to find restaurants near you. Your location is never shared with other users.`
  String get locationRationaleBody {
    return Intl.message(
      'Foodly uses your location to find restaurants near you. Your location is never shared with other users.',
      name: 'locationRationaleBody',
      desc: '',
      args: [],
    );
  }

  /// `Location access needed`
  String get locationRationaleTitle {
    return Intl.message(
      'Location access needed',
      name: 'locationRationaleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled. Please enable them in settings.`
  String get locationServicesDisabled {
    return Intl.message(
      'Location services are disabled. Please enable them in settings.',
      name: 'locationServicesDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location successfully updated.`
  String get locationSuccessfullyUpdated {
    return Intl.message(
      'Location successfully updated.',
      name: 'locationSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Allow in Settings`
  String get allowLocationInSettings {
    return Intl.message(
      'Allow in Settings',
      name: 'allowLocationInSettings',
      desc: '',
      args: [],
    );
  }

  /// `Tap to open app settings and enable location`
  String get allowLocationInSettingsDescription {
    return Intl.message(
      'Tap to open app settings and enable location',
      name: 'allowLocationInSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Retry location`
  String get retryLocation {
    return Intl.message(
      'Retry location',
      name: 'retryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Tap to get your location again`
  String get retryLocationDescription {
    return Intl.message(
      'Tap to get your location again',
      name: 'retryLocationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Error during login`
  String get loginError {
    return Intl.message(
      'Error during login',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Log in to`
  String get loginTo {
    return Intl.message('Log in to', name: 'loginTo', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Ending the session will require you to log in again with your email and password or any social network associated with your account.`
  String get logoutDialogTextSpan1 {
    return Intl.message(
      'Ending the session will require you to log in again with your email and password or any social network associated with your account.',
      name: 'logoutDialogTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `If you opt for`
  String get logoutDialogTextSpan2 {
    return Intl.message(
      'If you opt for',
      name: 'logoutDialogTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `Save and Close`
  String get logoutDialogTextSpan3 {
    return Intl.message(
      'Save and Close',
      name: 'logoutDialogTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `, you will finish the activity, maintaining the option to access quickly and securely via biometric or pattern authentication.`
  String get logoutDialogTextSpan4 {
    return Intl.message(
      ', you will finish the activity, maintaining the option to access quickly and securely via biometric or pattern authentication.',
      name: 'logoutDialogTextSpan4',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get logoutDialogTitle {
    return Intl.message(
      'Do you want to log out?',
      name: 'logoutDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Featured Promotions`
  String get mainPromos {
    return Intl.message(
      'Featured Promotions',
      name: 'mainPromos',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Markets and Stores`
  String get marketsAndStores {
    return Intl.message(
      'Markets and Stores',
      name: 'marketsAndStores',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Menus`
  String get menus {
    return Intl.message('Menus', name: 'menus', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Items`
  String get items {
    return Intl.message('Items', name: 'items', desc: '', args: []);
  }

  /// `A-Z`
  String get alphabetical {
    return Intl.message('A-Z', name: 'alphabetical', desc: '', args: []);
  }

  /// `View menu of`
  String get viewMenuOf {
    return Intl.message('View menu of', name: 'viewMenuOf', desc: '', args: []);
  }

  /// `Mexican`
  String get mexicanCuisine {
    return Intl.message('Mexican', name: 'mexicanCuisine', desc: '', args: []);
  }

  /// `The Ramalha network across the city of Covilhã continues to grow. After expanding last year to the city of Fundão, this time the bakery/patisserie opened its second space in Covilhã Shopping, in an interior space in its front area, on floor 0 with a wide esplanade.`
  String get mockTextNewReleasesCard {
    return Intl.message(
      'The Ramalha network across the city of Covilhã continues to grow. After expanding last year to the city of Fundão, this time the bakery/patisserie opened its second space in Covilhã Shopping, in an interior space in its front area, on floor 0 with a wide esplanade.',
      name: 'mockTextNewReleasesCard',
      desc: '',
      args: [],
    );
  }

  /// `Multilanguage`
  String get multilanguage {
    return Intl.message(
      'Multilanguage',
      name: 'multilanguage',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least 3 characters`
  String get mustContainAtLeast3Characters {
    return Intl.message(
      'Must contain at least 3 characters',
      name: 'mustContainAtLeast3Characters',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least 2 characters`
  String get mustContainAtLeastTwoCharacters {
    return Intl.message(
      'Must contain at least 2 characters',
      name: 'mustContainAtLeastTwoCharacters',
      desc: '',
      args: [],
    );
  }

  /// `My History`
  String get myHistory {
    return Intl.message('My History', name: 'myHistory', desc: '', args: []);
  }

  /// `My Reservations`
  String get myReservations {
    return Intl.message(
      'My Reservations',
      name: 'myReservations',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites`
  String get myFavorites {
    return Intl.message(
      'My Favorites',
      name: 'myFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Need the best recommendations?`
  String get needBestRecommendations {
    return Intl.message(
      'Need the best recommendations?',
      name: 'needBestRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message('News', name: 'news', desc: '', args: []);
  }

  /// `New on Foodly`
  String get newBranch {
    return Intl.message('New on Foodly', name: 'newBranch', desc: '', args: []);
  }

  /// `No new businesses in your area yet`
  String get noNewBranches {
    return Intl.message(
      'No new businesses in your area yet',
      name: 'noNewBranches',
      desc: '',
      args: [],
    );
  }

  /// `Check back soon!`
  String get checkBackLater {
    return Intl.message(
      'Check back soon!',
      name: 'checkBackLater',
      desc: '',
      args: [],
    );
  }

  /// `Checking location...`
  String get checkingLocation {
    return Intl.message(
      'Checking location...',
      name: 'checkingLocation',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get nickName {
    return Intl.message('Username', name: 'nickName', desc: '', args: []);
  }

  /// `No audio detected. Please try again.`
  String get noAudioDetected {
    return Intl.message(
      'No audio detected. Please try again.',
      name: 'noAudioDetected',
      desc: '',
      args: [],
    );
  }

  /// `There are no items added yet`
  String get noItemsYet {
    return Intl.message(
      'There are no items added yet',
      name: 'noItemsYet',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any items in your favorites list yet`
  String get noFavoriteItems {
    return Intl.message(
      'You don\'t have any items in your favorites list yet',
      name: 'noFavoriteItems',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any menus in your favorites list yet`
  String get noFavoriteMenus {
    return Intl.message(
      'You don\'t have any menus in your favorites list yet',
      name: 'noFavoriteMenus',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any businesses in your favorites list yet`
  String get noFavoriteBusinesses {
    return Intl.message(
      'You don\'t have any businesses in your favorites list yet',
      name: 'noFavoriteBusinesses',
      desc: '',
      args: [],
    );
  }

  /// `Not Specified`
  String get nonEspecified {
    return Intl.message(
      'Not Specified',
      name: 'nonEspecified',
      desc: '',
      args: [],
    );
  }

  /// `There are no promotions in this section`
  String get noPromotionsInSection {
    return Intl.message(
      'There are no promotions in this section',
      name: 'noPromotionsInSection',
      desc: '',
      args: [],
    );
  }

  /// `Could not load promotions`
  String get couldNotLoadPromotions {
    return Intl.message(
      'Could not load promotions',
      name: 'couldNotLoadPromotions',
      desc: '',
      args: [],
    );
  }

  /// `Could not load new openings`
  String get couldNotLoadNewReleases {
    return Intl.message(
      'Could not load new openings',
      name: 'couldNotLoadNewReleases',
      desc: '',
      args: [],
    );
  }

  /// `No promotions nearby`
  String get noPromotionsNearby {
    return Intl.message(
      'No promotions nearby',
      name: 'noPromotionsNearby',
      desc: '',
      args: [],
    );
  }

  /// `Flavors near you, soon`
  String get promosEmptyTitle {
    return Intl.message(
      'Flavors near you, soon',
      name: 'promosEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `We're cooking up the best deals for you.`
  String get promosEmptySubtitle {
    return Intl.message(
      'We\'re cooking up the best deals for you.',
      name: 'promosEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Connection interrupted`
  String get promosEmptyErrorTitle {
    return Intl.message(
      'Connection interrupted',
      name: 'promosEmptyErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't load promos. Try again.`
  String get promosEmptyErrorSubtitle {
    return Intl.message(
      'We couldn\'t load promos. Try again.',
      name: 'promosEmptyErrorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New flavors on the way`
  String get newReleasesEmptyTitle {
    return Intl.message(
      'New flavors on the way',
      name: 'newReleasesEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `The next discoveries in your area will show up here.`
  String get newReleasesEmptySubtitle {
    return Intl.message(
      'The next discoveries in your area will show up here.',
      name: 'newReleasesEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Connection interrupted`
  String get newReleasesEmptyErrorTitle {
    return Intl.message(
      'Connection interrupted',
      name: 'newReleasesEmptyErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't load new businesses. Try again.`
  String get newReleasesEmptyErrorSubtitle {
    return Intl.message(
      'We couldn\'t load new businesses. Try again.',
      name: 'newReleasesEmptyErrorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Failed to load promotion details`
  String get failedToLoadPromotionDetails {
    return Intl.message(
      'Failed to load promotion details',
      name: 'failedToLoadPromotionDetails',
      desc: '',
      args: [],
    );
  }

  /// `We didn't find any recommendations for your search. \nTry other terms or try a different location.`
  String get noRecommendationsFound {
    return Intl.message(
      'We didn\'t find any recommendations for your search. \nTry other terms or try a different location.',
      name: 'noRecommendationsFound',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message('Note', name: 'note', desc: '', args: []);
  }

  /// `The requested route does not exist, or you do not have permission to access it.`
  String get notFoundPageText {
    return Intl.message(
      'The requested route does not exist, or you do not have permission to access it.',
      name: 'notFoundPageText',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Ok, Let's go!`
  String get okGo {
    return Intl.message('Ok, Let\'s go!', name: 'okGo', desc: '', args: []);
  }

  /// `Can only contain letters and one space between words`
  String get onlyContainLetters {
    return Intl.message(
      'Can only contain letters and one space between words',
      name: 'onlyContainLetters',
      desc: '',
      args: [],
    );
  }

  /// `Visible only to you.`
  String get onlyYouPrivacyNotice {
    return Intl.message(
      'Visible only to you.',
      name: 'onlyYouPrivacyNotice',
      desc: '',
      args: [],
    );
  }

  /// `On site`
  String get onSite {
    return Intl.message('On site', name: 'onSite', desc: '', args: []);
  }

  /// `\nto open the menu in any device`
  String get openMenuAnyDevice {
    return Intl.message(
      '\nto open the menu in any device',
      name: 'openMenuAnyDevice',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Enable location from the lock icon in your browser's address bar.`
  String get locationPermissionWebInstructions {
    return Intl.message(
      'Enable location from the lock icon in your browser\'s address bar.',
      name: 'locationPermissionWebInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message('Open', name: 'open', desc: '', args: []);
  }

  /// `Open soon`
  String get openSoon {
    return Intl.message('Open soon', name: 'openSoon', desc: '', args: []);
  }

  /// `Optional`
  String get optional {
    return Intl.message('Optional', name: 'optional', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Outdoor Seating`
  String get outdoorSeating {
    return Intl.message(
      'Outdoor Seating',
      name: 'outdoorSeating',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message('Owner', name: 'owner', desc: '', args: []);
  }

  /// `Parking`
  String get parking {
    return Intl.message('Parking', name: 'parking', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `The password must be at least 8 characters long, include a number, a lowercase letter, and an uppercase letter`
  String get passwordInstructions {
    return Intl.message(
      'The password must be at least 8 characters long, include a number, a lowercase letter, and an uppercase letter',
      name: 'passwordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Temporary password sent`
  String get passwordSent {
    return Intl.message(
      'Temporary password sent',
      name: 'passwordSent',
      desc: '',
      args: [],
    );
  }

  /// `Peruvian`
  String get peruvian {
    return Intl.message('Peruvian', name: 'peruvian', desc: '', args: []);
  }

  /// `Pet Friendly`
  String get petFriendly {
    return Intl.message(
      'Pet Friendly',
      name: 'petFriendly',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Item photos deleted successfully`
  String get photosDeletedSuccess {
    return Intl.message(
      'Item photos deleted successfully',
      name: 'photosDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong when {action} the item photo(s): {errorMsg}`
  String photosSaveError(Object action, Object errorMsg) {
    return Intl.message(
      'Something went wrong when $action the item photo(s): $errorMsg',
      name: 'photosSaveError',
      desc: '',
      args: [action, errorMsg],
    );
  }

  /// `Pizzerias`
  String get pizzerias {
    return Intl.message('Pizzerias', name: 'pizzerias', desc: '', args: []);
  }

  /// `Platform Error`
  String get platformError {
    return Intl.message(
      'Platform Error',
      name: 'platformError',
      desc: '',
      args: [],
    );
  }

  /// `Please add your business address`
  String get pleaseAddYourBusinessAddress {
    return Intl.message(
      'Please add your business address',
      name: 'pleaseAddYourBusinessAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please indicate the country of your business`
  String get pleaseAddYourBusinessCountry {
    return Intl.message(
      'Please indicate the country of your business',
      name: 'pleaseAddYourBusinessCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please add the name of your business`
  String get pleaseAddYourBusinessName {
    return Intl.message(
      'Please add the name of your business',
      name: 'pleaseAddYourBusinessName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter your email address',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a username`
  String get pleaseEnterNickName {
    return Intl.message(
      'Please enter a username',
      name: 'pleaseEnterNickName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your postal code`
  String get pleaseEnterPostalCode {
    return Intl.message(
      'Please enter your postal code',
      name: 'pleaseEnterPostalCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterYourLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please select an option`
  String get pleaseSelectAnOption {
    return Intl.message(
      'Please select an option',
      name: 'pleaseSelectAnOption',
      desc: '',
      args: [],
    );
  }

  /// `Please select the category of your business`
  String get pleaseSelectBusinessCategory {
    return Intl.message(
      'Please select the category of your business',
      name: 'pleaseSelectBusinessCategory',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portugueseCuisine {
    return Intl.message(
      'Portuguese',
      name: 'portugueseCuisine',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message('Preferences', name: 'preferences', desc: '', args: []);
  }

  /// `Prefer not to say`
  String get preferNotToSay {
    return Intl.message(
      'Prefer not to say',
      name: 'preferNotToSay',
      desc: '',
      args: [],
    );
  }

  /// `Press to add photos, up to a maximum of {maxImages} images`
  String pressToAddPhotosUpToMaxImages(Object maxImages) {
    return Intl.message(
      'Press to add photos, up to a maximum of $maxImages images',
      name: 'pressToAddPhotosUpToMaxImages',
      desc: '',
      args: [maxImages],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Price value must be not null and greater than 0.09`
  String get priceValidation {
    return Intl.message(
      'Price value must be not null and greater than 0.09',
      name: 'priceValidation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `T&C`
  String get termsConditionsShort {
    return Intl.message(
      'T&C',
      name: 'termsConditionsShort',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get profileBirthdayText1 {
    return Intl.message(
      'Birthday',
      name: 'profileBirthdayText1',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get profileBirthdayText2 {
    return Intl.message(
      'Date',
      name: 'profileBirthdayText2',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get profileUserLocation1 {
    return Intl.message(
      'User',
      name: 'profileUserLocation1',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get profileUserLocation2 {
    return Intl.message(
      'Location',
      name: 'profileUserLocation2',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get promoTabActive {
    return Intl.message('Active', name: 'promoTabActive', desc: '', args: []);
  }

  /// `Upcoming`
  String get promoTabUpcoming {
    return Intl.message(
      'Upcoming',
      name: 'promoTabUpcoming',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get promoTabExpired {
    return Intl.message('Expired', name: 'promoTabExpired', desc: '', args: []);
  }

  /// `Promotion days`
  String get promotionDays {
    return Intl.message(
      'Promotion days',
      name: 'promotionDays',
      desc: '',
      args: [],
    );
  }

  /// `Promotions`
  String get promotions {
    return Intl.message('Promotions', name: 'promotions', desc: '', args: []);
  }

  /// `Saved Promotions`
  String get savedPromotions {
    return Intl.message(
      'Saved Promotions',
      name: 'savedPromotions',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any saved promotions yet`
  String get noSavedPromotions {
    return Intl.message(
      'You don\'t have any saved promotions yet',
      name: 'noSavedPromotions',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any saved promotions in this section`
  String get noSavedPromotionsInSection {
    return Intl.message(
      'You don\'t have any saved promotions in this section',
      name: 'noSavedPromotionsInSection',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get savedPromotionsTabCurrent {
    return Intl.message(
      'Current',
      name: 'savedPromotionsTabCurrent',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get savedPromotionsTabUpcoming {
    return Intl.message(
      'Upcoming',
      name: 'savedPromotionsTabUpcoming',
      desc: '',
      args: [],
    );
  }

  /// `These are your current promotions`
  String get savedPromotionsCurrent {
    return Intl.message(
      'These are your current promotions',
      name: 'savedPromotionsCurrent',
      desc: '',
      args: [],
    );
  }

  /// `These are your upcoming promotions`
  String get savedPromotionsUpcoming {
    return Intl.message(
      'These are your upcoming promotions',
      name: 'savedPromotionsUpcoming',
      desc: '',
      args: [],
    );
  }

  /// `Food Trucks & Stalls`
  String get foodTrucks {
    return Intl.message(
      'Food Trucks & Stalls',
      name: 'foodTrucks',
      desc: '',
      args: [],
    );
  }

  /// `Bars & Pubs`
  String get barsAndPubs {
    return Intl.message('Bars & Pubs', name: 'barsAndPubs', desc: '', args: []);
  }

  /// `Ready to listen`
  String get readyToListen {
    return Intl.message(
      'Ready to listen',
      name: 'readyToListen',
      desc: '',
      args: [],
    );
  }

  /// `Retry recording`
  String get retryRecording {
    return Intl.message(
      'Retry recording',
      name: 'retryRecording',
      desc: '',
      args: [],
    );
  }

  /// `Recommend`
  String get recommend {
    return Intl.message('Recommend', name: 'recommend', desc: '', args: []);
  }

  /// `Recover Password`
  String get recoverPassword {
    return Intl.message(
      'Recover Password',
      name: 'recoverPassword',
      desc: '',
      args: [],
    );
  }

  /// `Oops, something went wrong. Please try again, and if the error persists, check if the email is correct or try later.`
  String get recoverPasswordErrorMsg {
    return Intl.message(
      'Oops, something went wrong. Please try again, and if the error persists, check if the email is correct or try later.',
      name: 'recoverPasswordErrorMsg',
      desc: '',
      args: [],
    );
  }

  /// `We sent a`
  String get recoverPasswordTextSpan1 {
    return Intl.message(
      'We sent a',
      name: 'recoverPasswordTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `temporary password`
  String get recoverPasswordTextSpan2 {
    return Intl.message(
      'temporary password',
      name: 'recoverPasswordTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `to your email, valid for 30 minutes. Log in with it and update it in your profile`
  String get recoverPasswordTextSpan3 {
    return Intl.message(
      'to your email, valid for 30 minutes. Log in with it and update it in your profile',
      name: 'recoverPasswordTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `Regular`
  String get regular {
    return Intl.message('Regular', name: 'regular', desc: '', args: []);
  }

  /// `Remove this time period`
  String get removeThisTimePeriod {
    return Intl.message(
      'Remove this time period',
      name: 'removeThisTimePeriod',
      desc: '',
      args: [],
    );
  }

  /// `Remove photos`
  String get removePhotos {
    return Intl.message(
      'Remove photos',
      name: 'removePhotos',
      desc: '',
      args: [],
    );
  }

  /// `Remove video`
  String get removeVideo {
    return Intl.message(
      'Remove video',
      name: 'removeVideo',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message('Request', name: 'request', desc: '', args: []);
  }

  /// `Requested`
  String get requested {
    return Intl.message('Requested', name: 'requested', desc: '', args: []);
  }

  /// `Reservation`
  String get reservation {
    return Intl.message('Reservation', name: 'reservation', desc: '', args: []);
  }

  /// `Reservations`
  String get reservations {
    return Intl.message(
      'Reservations',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `Resilience`
  String get resilience {
    return Intl.message('Resilience', name: 'resilience', desc: '', args: []);
  }

  /// `Results for`
  String get resultsFor {
    return Intl.message('Results for', name: 'resultsFor', desc: '', args: []);
  }

  /// `Resume session with fingerprint/face or pattern`
  String get resumeSessionWithSecurity {
    return Intl.message(
      'Resume session with fingerprint/face or pattern',
      name: 'resumeSessionWithSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Save and Close`
  String get saveAndClose {
    return Intl.message(
      'Save and Close',
      name: 'saveAndClose',
      desc: '',
      args: [],
    );
  }

  /// `Save this menu`
  String get saveMenu {
    return Intl.message('Save this menu', name: 'saveMenu', desc: '', args: []);
  }

  /// `Scan this QR code`
  String get scanQRCode {
    return Intl.message(
      'Scan this QR code',
      name: 'scanQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Seafood`
  String get seafood {
    return Intl.message('Seafood', name: 'seafood', desc: '', args: []);
  }

  /// `Search Business or Address`
  String get searchBusinessOrAddress {
    return Intl.message(
      'Search Business or Address',
      name: 'searchBusinessOrAddress',
      desc: '',
      args: [],
    );
  }

  /// `Search in {city}...`
  String searchInCity(Object city) {
    return Intl.message(
      'Search in $city...',
      name: 'searchInCity',
      desc: '',
      args: [city],
    );
  }

  /// `Discover great places to eat and drink nearby...`
  String get searchPlaceholder {
    return Intl.message(
      'Discover great places to eat and drink nearby...',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Let OS provide secure authentication.`
  String get secureAuthentication {
    return Intl.message(
      'Let OS provide secure authentication.',
      name: 'secureAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again.`
  String get sessionExpiredMessage {
    return Intl.message(
      'Your session has expired. Please log in again.',
      name: 'sessionExpiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Selected place`
  String get selectedPlace {
    return Intl.message(
      'Selected place',
      name: 'selectedPlace',
      desc: '',
      args: [],
    );
  }

  /// `Select User Type`
  String get selectUserType {
    return Intl.message(
      'Select User Type',
      name: 'selectUserType',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Set date`
  String get setDate {
    return Intl.message('Set date', name: 'setDate', desc: '', args: []);
  }

  /// `Share this menu`
  String get shareMenu {
    return Intl.message(
      'Share this menu',
      name: 'shareMenu',
      desc: '',
      args: [],
    );
  }

  /// `Oops... Something went wrong! \n\nCouldn't share the menu.`
  String get shareMenuError {
    return Intl.message(
      'Oops... Something went wrong! \n\nCouldn\'t share the menu.',
      name: 'shareMenuError',
      desc: '',
      args: [],
    );
  }

  /// `🍽️ Check out {businessName}'s menu on 🌟 {appName}: \n{menuUrl}`
  String shareMenuMessage(Object businessName, Object appName, Object menuUrl) {
    return Intl.message(
      '🍽️ Check out $businessName\'s menu on 🌟 $appName: \n$menuUrl',
      name: 'shareMenuMessage',
      desc: '',
      args: [businessName, appName, menuUrl],
    );
  }

  /// `Sharing a menu with you!`
  String get shareMenuSubject {
    return Intl.message(
      'Sharing a menu with you!',
      name: 'shareMenuSubject',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get exploreAsGuest {
    return Intl.message('Explore', name: 'exploreAsGuest', desc: '', args: []);
  }

  /// `Guest`
  String get guestUserName {
    return Intl.message('Guest', name: 'guestUserName', desc: '', args: []);
  }

  /// `Report`
  String get reportContent {
    return Intl.message('Report', name: 'reportContent', desc: '', args: []);
  }

  /// `Why are you reporting this content?`
  String get reportContentSubtitle {
    return Intl.message(
      'Why are you reporting this content?',
      name: 'reportContentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Submit report`
  String get reportSubmit {
    return Intl.message(
      'Submit report',
      name: 'reportSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for your report. Our team will review it.`
  String get reportSentSuccess {
    return Intl.message(
      'Thanks for your report. Our team will review it.',
      name: 'reportSentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Spam or scam`
  String get reportReasonSpam {
    return Intl.message(
      'Spam or scam',
      name: 'reportReasonSpam',
      desc: '',
      args: [],
    );
  }

  /// `Offensive or inappropriate`
  String get reportReasonOffensive {
    return Intl.message(
      'Offensive or inappropriate',
      name: 'reportReasonOffensive',
      desc: '',
      args: [],
    );
  }

  /// `Harassment or bullying`
  String get reportReasonHarassment {
    return Intl.message(
      'Harassment or bullying',
      name: 'reportReasonHarassment',
      desc: '',
      args: [],
    );
  }

  /// `Hate speech`
  String get reportReasonHateSpeech {
    return Intl.message(
      'Hate speech',
      name: 'reportReasonHateSpeech',
      desc: '',
      args: [],
    );
  }

  /// `Sexual content`
  String get reportReasonSexual {
    return Intl.message(
      'Sexual content',
      name: 'reportReasonSexual',
      desc: '',
      args: [],
    );
  }

  /// `Violence or dangerous`
  String get reportReasonViolence {
    return Intl.message(
      'Violence or dangerous',
      name: 'reportReasonViolence',
      desc: '',
      args: [],
    );
  }

  /// `False information`
  String get reportReasonMisinformation {
    return Intl.message(
      'False information',
      name: 'reportReasonMisinformation',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get reportReasonOther {
    return Intl.message('Other', name: 'reportReasonOther', desc: '', args: []);
  }

  /// `Block user`
  String get blockUser {
    return Intl.message('Block user', name: 'blockUser', desc: '', args: []);
  }

  /// `Block {name}? You won't see their content anymore, and they won't see yours.`
  String blockUserConfirm(String name) {
    return Intl.message(
      'Block $name? You won\'t see their content anymore, and they won\'t see yours.',
      name: 'blockUserConfirm',
      desc: '',
      args: [name],
    );
  }

  /// `User blocked`
  String get blockedSuccess {
    return Intl.message(
      'User blocked',
      name: 'blockedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `this user`
  String get thisUser {
    return Intl.message('this user', name: 'thisUser', desc: '', args: []);
  }

  /// `Blocked users`
  String get blockedUsers {
    return Intl.message(
      'Blocked users',
      name: 'blockedUsers',
      desc: '',
      args: [],
    );
  }

  /// `You haven't blocked anyone.`
  String get blockedUsersEmpty {
    return Intl.message(
      'You haven\'t blocked anyone.',
      name: 'blockedUsersEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Unblock`
  String get unblock {
    return Intl.message('Unblock', name: 'unblock', desc: '', args: []);
  }

  /// `By posting, you agree to our Community Guidelines.`
  String get communityGuidelinesNotice {
    return Intl.message(
      'By posting, you agree to our Community Guidelines.',
      name: 'communityGuidelinesNotice',
      desc: '',
      args: [],
    );
  }

  /// `You don't have a saved address. You can create one on your profile page.`
  String get noSavedAddress {
    return Intl.message(
      'You don\'t have a saved address. You can create one on your profile page.',
      name: 'noSavedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get guestGateTitle {
    return Intl.message(
      'Create your account',
      name: 'guestGateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to book a table.`
  String get guestGateReserve {
    return Intl.message(
      'Log in or sign up to book a table.',
      name: 'guestGateReserve',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to save favorites.`
  String get guestGateFavorite {
    return Intl.message(
      'Log in or sign up to save favorites.',
      name: 'guestGateFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to leave a review.`
  String get guestGateReview {
    return Intl.message(
      'Log in or sign up to leave a review.',
      name: 'guestGateReview',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to post in the community.`
  String get guestGatePost {
    return Intl.message(
      'Log in or sign up to post in the community.',
      name: 'guestGatePost',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to see your saved promotions.`
  String get guestGateSaved {
    return Intl.message(
      'Log in or sign up to see your saved promotions.',
      name: 'guestGateSaved',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to see your favorite businesses.`
  String get guestGateFaved {
    return Intl.message(
      'Log in or sign up to see your favorite businesses.',
      name: 'guestGateFaved',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to see the community.`
  String get guestGateCommunity {
    return Intl.message(
      'Log in or sign up to see the community.',
      name: 'guestGateCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to see your notifications.`
  String get guestGateNotifications {
    return Intl.message(
      'Log in or sign up to see your notifications.',
      name: 'guestGateNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to access your profile.`
  String get guestGateProfile {
    return Intl.message(
      'Log in or sign up to access your profile.',
      name: 'guestGateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Log in or sign up to use this feature.`
  String get guestGateGeneric {
    return Intl.message(
      'Log in or sign up to use this feature.',
      name: 'guestGateGeneric',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `We recommend locating your business or commercial address on Google, thus providing us with data, including coordinates, that allow us to give you`
  String get signUpBusinessTooltipTextSpan1 {
    return Intl.message(
      'We recommend locating your business or commercial address on Google, thus providing us with data, including coordinates, that allow us to give you',
      name: 'signUpBusinessTooltipTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `greater relevance`
  String get signUpBusinessTooltipTextSpan2 {
    return Intl.message(
      'greater relevance',
      name: 'signUpBusinessTooltipTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `in our`
  String get signUpBusinessTooltipTextSpan3 {
    return Intl.message(
      'in our',
      name: 'signUpBusinessTooltipTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `search engines and maps`
  String get signUpBusinessTooltipTextSpan4 {
    return Intl.message(
      'search engines and maps',
      name: 'signUpBusinessTooltipTextSpan4',
      desc: '',
      args: [],
    );
  }

  /// `for`
  String get signUpBusinessTooltipTextSpan5 {
    return Intl.message(
      'for',
      name: 'signUpBusinessTooltipTextSpan5',
      desc: '',
      args: [],
    );
  }

  /// `users`
  String get signUpBusinessTooltipTextSpan6 {
    return Intl.message(
      'users',
      name: 'signUpBusinessTooltipTextSpan6',
      desc: '',
      args: [],
    );
  }

  /// `consumers and visitors, as well as if you decide to include services like delivery and take away. This way we will provide a`
  String get signUpBusinessTooltipTextSpan7 {
    return Intl.message(
      'consumers and visitors, as well as if you decide to include services like delivery and take away. This way we will provide a',
      name: 'signUpBusinessTooltipTextSpan7',
      desc: '',
      args: [],
    );
  }

  /// `better user experience`
  String get signUpBusinessTooltipTextSpan8 {
    return Intl.message(
      'better user experience',
      name: 'signUpBusinessTooltipTextSpan8',
      desc: '',
      args: [],
    );
  }

  /// `to your customers.`
  String get signUpBusinessTooltipTextSpan9 {
    return Intl.message(
      'to your customers.',
      name: 'signUpBusinessTooltipTextSpan9',
      desc: '',
      args: [],
    );
  }

  /// `Smoking Area`
  String get smokingArea {
    return Intl.message(
      'Smoking Area',
      name: 'smokingArea',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get somethingWentWrong {
    return Intl.message(
      'An error occurred',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Voice Search uses your microphone to find great places nearby. Grant microphone access in Settings to start exploring with your voice.`
  String get micPermissionDeniedMessage {
    return Intl.message(
      'Voice Search uses your microphone to find great places nearby. Grant microphone access in Settings to start exploring with your voice.',
      name: 'micPermissionDeniedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error starting speech recognition.`
  String get speechRecognitionError {
    return Intl.message(
      'Error starting speech recognition.',
      name: 'speechRecognitionError',
      desc: '',
      args: [],
    );
  }

  /// `Speech recognition is not available on this device.`
  String get speechRecognitionUnavailable {
    return Intl.message(
      'Speech recognition is not available on this device.',
      name: 'speechRecognitionUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Start date`
  String get startDate {
    return Intl.message('Start date', name: 'startDate', desc: '', args: []);
  }

  /// `Startups`
  String get startups {
    return Intl.message('Startups', name: 'startups', desc: '', args: []);
  }

  /// `Steakhouse`
  String get steakhouse {
    return Intl.message('Steakhouse', name: 'steakhouse', desc: '', args: []);
  }

  /// `Stop`
  String get stop {
    return Intl.message('Stop', name: 'stop', desc: '', args: []);
  }

  /// `Stress`
  String get stress {
    return Intl.message('Stress', name: 'stress', desc: '', args: []);
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Successfully deleted!`
  String get successfullyDeleted {
    return Intl.message(
      'Successfully deleted!',
      name: 'successfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Sushi`
  String get sushi {
    return Intl.message('Sushi', name: 'sushi', desc: '', args: []);
  }

  /// `Switch to Business Account`
  String get switchToManagerRole {
    return Intl.message(
      'Switch to Business Account',
      name: 'switchToManagerRole',
      desc: '',
      args: [],
    );
  }

  /// `If you wish to reclassify as`
  String get switchUserCategoryTextSpan1 {
    return Intl.message(
      'If you wish to reclassify as',
      name: 'switchUserCategoryTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `click`
  String get switchUserCategoryTextSpan2 {
    return Intl.message(
      'click',
      name: 'switchUserCategoryTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `here`
  String get switchUserCategoryTextSpan3 {
    return Intl.message(
      'here',
      name: 'switchUserCategoryTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `Take Away`
  String get takeAway {
    return Intl.message('Take Away', name: 'takeAway', desc: '', args: []);
  }

  /// `Temporarily unavailable`
  String get temporarilyUnavailable {
    return Intl.message(
      'Temporarily unavailable',
      name: 'temporarilyUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Tap here to add a new prompt`
  String get tapToAddPrompt {
    return Intl.message(
      'Tap here to add a new prompt',
      name: 'tapToAddPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get tendencies {
    return Intl.message('Trends', name: 'tendencies', desc: '', args: []);
  }

  /// `By creating an account, you acknowledge that you have read and agree to our`
  String get termsPrivacyTextSpan1 {
    return Intl.message(
      'By creating an account, you acknowledge that you have read and agree to our',
      name: 'termsPrivacyTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `By creating a business account, you acknowledge that you have read and agree to our`
  String get termsPrivacyTextSpan1forBusiness {
    return Intl.message(
      'By creating a business account, you acknowledge that you have read and agree to our',
      name: 'termsPrivacyTextSpan1forBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsPrivacyTextSpan2 {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsPrivacyTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `and the`
  String get termsPrivacyTextSpan3 {
    return Intl.message(
      'and the',
      name: 'termsPrivacyTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get termsPrivacyTextSpan4 {
    return Intl.message(
      'Privacy Policy',
      name: 'termsPrivacyTextSpan4',
      desc: '',
      args: [],
    );
  }

  /// `One last step`
  String get socialConsentTitle {
    return Intl.message(
      'One last step',
      name: 'socialConsentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Accept and continue`
  String get acceptAndContinue {
    return Intl.message(
      'Accept and continue',
      name: 'acceptAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't get your email from Apple. Please try again or use another sign-in method.`
  String get socialEmailMissing {
    return Intl.message(
      'We couldn\'t get your email from Apple. Please try again or use another sign-in method.',
      name: 'socialEmailMissing',
      desc: '',
      args: [],
    );
  }

  /// `Contact details`
  String get reservationContactTitle {
    return Intl.message(
      'Contact details',
      name: 'reservationContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `The business needs this to confirm your request.`
  String get reservationContactBody {
    return Intl.message(
      'The business needs this to confirm your request.',
      name: 'reservationContactBody',
      desc: '',
      args: [],
    );
  }

  /// `Save to my profile for future reservations`
  String get saveToProfileForReservations {
    return Intl.message(
      'Save to my profile for future reservations',
      name: 'saveToProfileForReservations',
      desc: '',
      args: [],
    );
  }

  /// `Want to list your business on Foodly? Go to your profile and turn on the business account option to register it.`
  String get welcomeDialogSocialBusiness {
    return Intl.message(
      'Want to list your business on Foodly? Go to your profile and turn on the business account option to register it.',
      name: 'welcomeDialogSocialBusiness',
      desc: '',
      args: [],
    );
  }

  /// `There are no customer reviews yet`
  String get thereAreNoCustomerReviewsYet {
    return Intl.message(
      'There are no customer reviews yet',
      name: 'thereAreNoCustomerReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Unauthorized access.`
  String get unauthorizedAccess {
    return Intl.message(
      'Unauthorized access.',
      name: 'unauthorizedAccess',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Upload promotional image or video`
  String get uploadPromotionalMediaContent {
    return Intl.message(
      'Upload promotional image or video',
      name: 'uploadPromotionalMediaContent',
      desc: '',
      args: [],
    );
  }

  /// `Upload Video`
  String get uploadVideo {
    return Intl.message(
      'Upload Video',
      name: 'uploadVideo',
      desc: '',
      args: [],
    );
  }

  /// `Us`
  String get us {
    return Intl.message('Us', name: 'us', desc: '', args: []);
  }

  /// `Use device location`
  String get useDeviceLocation {
    return Intl.message(
      'Use device location',
      name: 'useDeviceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Use saved location`
  String get useSavedLocation {
    return Intl.message(
      'Use saved location',
      name: 'useSavedLocation',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get userGender1 {
    return Intl.message('User', name: 'userGender1', desc: '', args: []);
  }

  /// `Gender`
  String get userGender2 {
    return Intl.message('Gender', name: 'userGender2', desc: '', args: []);
  }

  /// `Username available`
  String get usernameAvailable {
    return Intl.message(
      'Username available',
      name: 'usernameAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Username not available`
  String get usernameNotAvailable {
    return Intl.message(
      'Username not available',
      name: 'usernameNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get userPassword1 {
    return Intl.message('Change', name: 'userPassword1', desc: '', args: []);
  }

  /// `Password`
  String get userPassword2 {
    return Intl.message('Password', name: 'userPassword2', desc: '', args: []);
  }

  /// `Password successfully updated`
  String get userPasswordUpdated {
    return Intl.message(
      'Password successfully updated',
      name: 'userPasswordUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Set password`
  String get setPassword {
    return Intl.message(
      'Set password',
      name: 'setPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enable email + password sign-in in addition to your social account.`
  String get setPasswordSubtitle {
    return Intl.message(
      'Enable email + password sign-in in addition to your social account.',
      name: 'setPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your`
  String get emailSectionTitle1 {
    return Intl.message('Your', name: 'emailSectionTitle1', desc: '', args: []);
  }

  /// `Email`
  String get emailSectionTitle2 {
    return Intl.message(
      'Email',
      name: 'emailSectionTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Your`
  String get phoneSectionTitle1 {
    return Intl.message('Your', name: 'phoneSectionTitle1', desc: '', args: []);
  }

  /// `Phone`
  String get phoneSectionTitle2 {
    return Intl.message(
      'Phone',
      name: 'phoneSectionTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordTitle {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `For security, please enter your current password to change your email.`
  String get confirmPasswordForEmailChange {
    return Intl.message(
      'For security, please enter your current password to change your email.',
      name: 'confirmPasswordForEmailChange',
      desc: '',
      args: [],
    );
  }

  /// `First set a password for your account, then you can change your email.`
  String get emailChangeBlockedForSocialUser {
    return Intl.message(
      'First set a password for your account, then you can change your email.',
      name: 'emailChangeBlockedForSocialUser',
      desc: '',
      args: [],
    );
  }

  /// `User data successfully updated`
  String get userProfileUpdated {
    return Intl.message(
      'User data successfully updated',
      name: 'userProfileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get userReviews1 {
    return Intl.message('My', name: 'userReviews1', desc: '', args: []);
  }

  /// `Reviews`
  String get userReviews2 {
    return Intl.message('Reviews', name: 'userReviews2', desc: '', args: []);
  }

  /// `You haven't left any reviews yet. Remember to rate your experience when visiting a business to improve everyone's experience and stand out in our community.`
  String get userReviewsPlaceholder {
    return Intl.message(
      'You haven\'t left any reviews yet. Remember to rate your experience when visiting a business to improve everyone\'s experience and stand out in our community.',
      name: 'userReviewsPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Review updated successfully!`
  String get reviewUpdatedSuccessfully {
    return Intl.message(
      'Review updated successfully!',
      name: 'reviewUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Review submitted successfully!`
  String get reviewSubmittedSuccessfully {
    return Intl.message(
      'Review submitted successfully!',
      name: 'reviewSubmittedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Update Review`
  String get updateReview {
    return Intl.message(
      'Update Review',
      name: 'updateReview',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submitReview {
    return Intl.message(
      'Submit Review',
      name: 'submitReview',
      desc: '',
      args: [],
    );
  }

  /// `Edit your review for {businessName}`
  String editYourReviewFor(String businessName) {
    return Intl.message(
      'Edit your review for $businessName',
      name: 'editYourReviewFor',
      desc: '',
      args: [businessName],
    );
  }

  /// `Write a review for {businessName}`
  String writeReviewFor(String businessName) {
    return Intl.message(
      'Write a review for $businessName',
      name: 'writeReviewFor',
      desc: '',
      args: [businessName],
    );
  }

  /// `this business`
  String get thisBusiness {
    return Intl.message(
      'this business',
      name: 'thisBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Write your review here...`
  String get writeYourReviewHint {
    return Intl.message(
      'Write your review here...',
      name: 'writeYourReviewHint',
      desc: '',
      args: [],
    );
  }

  /// `Rate your experience:`
  String get rateYourExperience {
    return Intl.message(
      'Rate your experience:',
      name: 'rateYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `When did you visit?`
  String get whenDidYouVisit {
    return Intl.message(
      'When did you visit?',
      name: 'whenDidYouVisit',
      desc: '',
      args: [],
    );
  }

  /// `Review deleted successfully!`
  String get reviewDeletedSuccessfully {
    return Intl.message(
      'Review deleted successfully!',
      name: 'reviewDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Review`
  String get editReview {
    return Intl.message('Edit Review', name: 'editReview', desc: '', args: []);
  }

  /// `You already reviewed this business.\nWould you like to edit your review?`
  String get alreadyReviewedPrompt {
    return Intl.message(
      'You already reviewed this business.\nWould you like to edit your review?',
      name: 'alreadyReviewedPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Reservation request sent!`
  String get reservationRequestSent {
    return Intl.message(
      'Reservation request sent!',
      name: 'reservationRequestSent',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send reservation request.`
  String get reservationRequestFailed {
    return Intl.message(
      'Failed to send reservation request.',
      name: 'reservationRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Request Reservation`
  String get requestReservation {
    return Intl.message(
      'Request Reservation',
      name: 'requestReservation',
      desc: '',
      args: [],
    );
  }

  /// `Reserve a table at {businessName}`
  String reserveTableAt(Object businessName) {
    return Intl.message(
      'Reserve a table at $businessName',
      name: 'reserveTableAt',
      desc: '',
      args: [businessName],
    );
  }

  /// `Select a date:`
  String get selectADate {
    return Intl.message(
      'Select a date:',
      name: 'selectADate',
      desc: '',
      args: [],
    );
  }

  /// `Select a time:`
  String get selectATime {
    return Intl.message(
      'Select a time:',
      name: 'selectATime',
      desc: '',
      args: [],
    );
  }

  /// `Party size:`
  String get partySize {
    return Intl.message('Party size:', name: 'partySize', desc: '', args: []);
  }

  /// `Max Size: {maxSize}`
  String maxSize(int maxSize) {
    return Intl.message(
      'Max Size: $maxSize',
      name: 'maxSize',
      desc: '',
      args: [maxSize],
    );
  }

  /// `Max`
  String get maxSizeLabel {
    return Intl.message('Max', name: 'maxSizeLabel', desc: '', args: []);
  }

  /// `Special requests (optional)`
  String get specialRequestsOptional {
    return Intl.message(
      'Special requests (optional)',
      name: 'specialRequestsOptional',
      desc: '',
      args: [],
    );
  }

  /// `User successfully created`
  String get userSuccessfullyCreated {
    return Intl.message(
      'User successfully created',
      name: 'userSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Please select the`
  String get userTypeSnackbarTextSpan1 {
    return Intl.message(
      'Please select the',
      name: 'userTypeSnackbarTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `user type`
  String get userTypeSnackbarTextSpan2 {
    return Intl.message(
      'user type',
      name: 'userTypeSnackbarTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `to activate and be able to complete the form`
  String get userTypeSnackbarTextSpan3 {
    return Intl.message(
      'to activate and be able to complete the form',
      name: 'userTypeSnackbarTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `are users who have the ability to create and manage`
  String get usersHaveTheAbilityToCreateAndManage {
    return Intl.message(
      'are users who have the ability to create and manage',
      name: 'usersHaveTheAbilityToCreateAndManage',
      desc: '',
      args: [],
    );
  }

  /// `Valid`
  String get valid {
    return Intl.message('Valid', name: 'valid', desc: '', args: []);
  }

  /// `A valid category is required`
  String get validCategoryRequired {
    return Intl.message(
      'A valid category is required',
      name: 'validCategoryRequired',
      desc: '',
      args: [],
    );
  }

  /// `Vegetarian`
  String get vegetarianCuisine {
    return Intl.message(
      'Vegetarian',
      name: 'vegetarianCuisine',
      desc: '',
      args: [],
    );
  }

  /// `Venezuelan`
  String get venezuelan {
    return Intl.message('Venezuelan', name: 'venezuelan', desc: '', args: []);
  }

  /// `Checking availability`
  String get verifyingAvailability {
    return Intl.message(
      'Checking availability',
      name: 'verifyingAvailability',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Video is too long. Maximum duration is 20 seconds.`
  String get videoIsTooLong {
    return Intl.message(
      'Video is too long. Maximum duration is 20 seconds.',
      name: 'videoIsTooLong',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `View promotion`
  String get viewPromotion {
    return Intl.message(
      'View promotion',
      name: 'viewPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Visit Business Page`
  String get visitBusinessPage {
    return Intl.message(
      'Visit Business Page',
      name: 'visitBusinessPage',
      desc: '',
      args: [],
    );
  }

  /// `View/Edit`
  String get viewEdit {
    return Intl.message('View/Edit', name: 'viewEdit', desc: '', args: []);
  }

  /// `Visitor`
  String get visitor {
    return Intl.message('Visitor', name: 'visitor', desc: '', args: []);
  }

  /// `Vitality`
  String get vitality {
    return Intl.message('Vitality', name: 'vitality', desc: '', args: []);
  }

  /// `Sunday`
  String get weekday1 {
    return Intl.message('Sunday', name: 'weekday1', desc: '', args: []);
  }

  /// `Monday`
  String get weekday2 {
    return Intl.message('Monday', name: 'weekday2', desc: '', args: []);
  }

  /// `Tuesday`
  String get weekday3 {
    return Intl.message('Tuesday', name: 'weekday3', desc: '', args: []);
  }

  /// `Wednesday`
  String get weekday4 {
    return Intl.message('Wednesday', name: 'weekday4', desc: '', args: []);
  }

  /// `Thursday`
  String get weekday5 {
    return Intl.message('Thursday', name: 'weekday5', desc: '', args: []);
  }

  /// `Friday`
  String get weekday6 {
    return Intl.message('Friday', name: 'weekday6', desc: '', args: []);
  }

  /// `Saturday`
  String get weekday7 {
    return Intl.message('Saturday', name: 'weekday7', desc: '', args: []);
  }

  /// `Sun`
  String get weekdayShort1 {
    return Intl.message('Sun', name: 'weekdayShort1', desc: '', args: []);
  }

  /// `Mon`
  String get weekdayShort2 {
    return Intl.message('Mon', name: 'weekdayShort2', desc: '', args: []);
  }

  /// `Tue`
  String get weekdayShort3 {
    return Intl.message('Tue', name: 'weekdayShort3', desc: '', args: []);
  }

  /// `Wed`
  String get weekdayShort4 {
    return Intl.message('Wed', name: 'weekdayShort4', desc: '', args: []);
  }

  /// `Thu`
  String get weekdayShort5 {
    return Intl.message('Thu', name: 'weekdayShort5', desc: '', args: []);
  }

  /// `Fri`
  String get weekdayShort6 {
    return Intl.message('Fri', name: 'weekdayShort6', desc: '', args: []);
  }

  /// `Sat`
  String get weekdayShort7 {
    return Intl.message('Sat', name: 'weekdayShort7', desc: '', args: []);
  }

  /// `At`
  String get welcomeDialogTextSpan1 {
    return Intl.message(
      'At',
      name: 'welcomeDialogTextSpan1',
      desc: '',
      args: [],
    );
  }

  /// `we warmly welcome you`
  String get welcomeDialogTextSpan2 {
    return Intl.message(
      'we warmly welcome you',
      name: 'welcomeDialogTextSpan2',
      desc: '',
      args: [],
    );
  }

  /// `you have registered as`
  String get welcomeDialogTextSpan3 {
    return Intl.message(
      'you have registered as',
      name: 'welcomeDialogTextSpan3',
      desc: '',
      args: [],
    );
  }

  /// `We are now your digital gastronomic guide in your city and our coverage areas. We invite you to actively participate in our community, rate and comment on businesses and products, always from a line of respect, constructively criticize, support the efforts of small, medium, and large merchants, and mainly, enjoy the`
  String get welcomeDialogTextSpanClient1 {
    return Intl.message(
      'We are now your digital gastronomic guide in your city and our coverage areas. We invite you to actively participate in our community, rate and comment on businesses and products, always from a line of respect, constructively criticize, support the efforts of small, medium, and large merchants, and mainly, enjoy the',
      name: 'welcomeDialogTextSpanClient1',
      desc: '',
      args: [],
    );
  }

  /// `promotions, contents, services, and advantages`
  String get welcomeDialogTextSpanClient2 {
    return Intl.message(
      'promotions, contents, services, and advantages',
      name: 'welcomeDialogTextSpanClient2',
      desc: '',
      args: [],
    );
  }

  /// `that being our user offers you.`
  String get welcomeDialogTextSpanClient3 {
    return Intl.message(
      'that being our user offers you.',
      name: 'welcomeDialogTextSpanClient3',
      desc: '',
      args: [],
    );
  }

  /// `The next step is to complete the registration of your business, we will initially ask for basic data and then you can add more relevant information from your business dashboard, and of course, start creating content, menus, promotions, and everything you wish through your new digital tool`
  String get welcomeDialogTextSpanOwner {
    return Intl.message(
      'The next step is to complete the registration of your business, we will initially ask for basic data and then you can add more relevant information from your business dashboard, and of course, start creating content, menus, promotions, and everything you wish through your new digital tool',
      name: 'welcomeDialogTextSpanOwner',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeTo {
    return Intl.message('Welcome', name: 'welcomeTo', desc: '', args: []);
  }

  /// `We'll check availability`
  String get weWillCheckAvailability {
    return Intl.message(
      'We\'ll check availability',
      name: 'weWillCheckAvailability',
      desc: '',
      args: [],
    );
  }

  /// `What are you craving today?`
  String get whatAreYouCravingToday {
    return Intl.message(
      'What are you craving today?',
      name: 'whatAreYouCravingToday',
      desc: '',
      args: [],
    );
  }

  /// `Wifi`
  String get wifi {
    return Intl.message('Wifi', name: 'wifi', desc: '', args: []);
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message('Zip Code', name: 'zipCode', desc: '', args: []);
  }

  /// `This code is outside our current coverage area`
  String get zipCodeNotAvailable {
    return Intl.message(
      'This code is outside our current coverage area',
      name: 'zipCodeNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Manage Reservations`
  String get manageReservations {
    return Intl.message(
      'Manage Reservations',
      name: 'manageReservations',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message('Sort by', name: 'sortBy', desc: '', args: []);
  }

  /// `Socials`
  String get socials {
    return Intl.message('Socials', name: 'socials', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications yet!`
  String get noNotificationsYet {
    return Intl.message(
      'No notifications yet!',
      name: 'noNotificationsYet',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read`
  String get markAllAsRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Details`
  String get reservationDetails {
    return Intl.message(
      'Reservation Details',
      name: 'reservationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Reservation confirmed.`
  String get reservationConfirmed {
    return Intl.message(
      'Reservation confirmed.',
      name: 'reservationConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to confirm reservation.`
  String get failedToConfirmReservation {
    return Intl.message(
      'Failed to confirm reservation.',
      name: 'failedToConfirmReservation',
      desc: '',
      args: [],
    );
  }

  /// `Reservation rejected.`
  String get reservationRejected {
    return Intl.message(
      'Reservation rejected.',
      name: 'reservationRejected',
      desc: '',
      args: [],
    );
  }

  /// `Failed to reject reservation.`
  String get failedToRejectReservation {
    return Intl.message(
      'Failed to reject reservation.',
      name: 'failedToRejectReservation',
      desc: '',
      args: [],
    );
  }

  /// `Failed to cancel reservation.`
  String get failedToCancelReservation {
    return Intl.message(
      'Failed to cancel reservation.',
      name: 'failedToCancelReservation',
      desc: '',
      args: [],
    );
  }

  /// `Marked as no-show.`
  String get markedNoShow {
    return Intl.message(
      'Marked as no-show.',
      name: 'markedNoShow',
      desc: '',
      args: [],
    );
  }

  /// `Failed to mark no-show.`
  String get failedToMarkNoShow {
    return Intl.message(
      'Failed to mark no-show.',
      name: 'failedToMarkNoShow',
      desc: '',
      args: [],
    );
  }

  /// `Reservation completed.`
  String get reservationCompleted {
    return Intl.message(
      'Reservation completed.',
      name: 'reservationCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Failed to complete reservation.`
  String get failedToCompleteReservation {
    return Intl.message(
      'Failed to complete reservation.',
      name: 'failedToCompleteReservation',
      desc: '',
      args: [],
    );
  }

  /// `Could not load reservation details.`
  String get couldNotLoadReservationDetails {
    return Intl.message(
      'Could not load reservation details.',
      name: 'couldNotLoadReservationDetails',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Reject Reservation`
  String get rejectReservation {
    return Intl.message(
      'Reject Reservation',
      name: 'rejectReservation',
      desc: '',
      args: [],
    );
  }

  /// `Add a note (optional)`
  String get addNoteOptional {
    return Intl.message(
      'Add a note (optional)',
      name: 'addNoteOptional',
      desc: '',
      args: [],
    );
  }

  /// `You have 1 pending reservation`
  String get pendingReservationsAlertOne {
    return Intl.message(
      'You have 1 pending reservation',
      name: 'pendingReservationsAlertOne',
      desc: '',
      args: [],
    );
  }

  /// `You have {count} pending reservations`
  String pendingReservationsAlertMany(int count) {
    return Intl.message(
      'You have $count pending reservations',
      name: 'pendingReservationsAlertMany',
      desc: '',
      args: [count],
    );
  }

  /// `Could not load profile`
  String get couldNotLoadProfile {
    return Intl.message(
      'Could not load profile',
      name: 'couldNotLoadProfile',
      desc: '',
      args: [],
    );
  }

  /// `Recent Posts`
  String get recentPosts {
    return Intl.message(
      'Recent Posts',
      name: 'recentPosts',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message('Follow', name: 'follow', desc: '', args: []);
  }

  /// `Following`
  String get following {
    return Intl.message('Following', name: 'following', desc: '', args: []);
  }

  /// `Posts`
  String get posts {
    return Intl.message('Posts', name: 'posts', desc: '', args: []);
  }

  /// `Likes`
  String get likes {
    return Intl.message('Likes', name: 'likes', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Followers`
  String get followers {
    return Intl.message('Followers', name: 'followers', desc: '', args: []);
  }

  /// `No posts yet`
  String get postsFeedNoPosts {
    return Intl.message(
      'No posts yet',
      name: 'postsFeedNoPosts',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to share something!`
  String get postsFeedBeFirst {
    return Intl.message(
      'Be the first to share something!',
      name: 'postsFeedBeFirst',
      desc: '',
      args: [],
    );
  }

  /// `Nearby`
  String get feedFilterNearby {
    return Intl.message('Nearby', name: 'feedFilterNearby', desc: '', args: []);
  }

  /// `Following`
  String get feedFilterFollowing {
    return Intl.message(
      'Following',
      name: 'feedFilterFollowing',
      desc: '',
      args: [],
    );
  }

  /// `You're not following anyone yet`
  String get feedFollowingEmptyTitle {
    return Intl.message(
      'You\'re not following anyone yet',
      name: 'feedFollowingEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Follow users from the Users tab to see their posts here.`
  String get feedFollowingEmptySubtitle {
    return Intl.message(
      'Follow users from the Users tab to see their posts here.',
      name: 'feedFollowingEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePostTitle {
    return Intl.message(
      'Delete Post',
      name: 'deletePostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this post?`
  String get deletePostConfirm {
    return Intl.message(
      'Are you sure you want to delete this post?',
      name: 'deletePostConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPostTitle {
    return Intl.message(
      'Create Post',
      name: 'createPostTitle',
      desc: '',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get whatsOnYourMind {
    return Intl.message(
      'What\'s on your mind?',
      name: 'whatsOnYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message('Post', name: 'post', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Buzz`
  String get buzz {
    return Intl.message('Buzz', name: 'buzz', desc: '', args: []);
  }

  /// `Most Active`
  String get userSortMostActive {
    return Intl.message(
      'Most Active',
      name: 'userSortMostActive',
      desc: '',
      args: [],
    );
  }

  /// `Nearest`
  String get userSortNearest {
    return Intl.message('Nearest', name: 'userSortNearest', desc: '', args: []);
  }

  /// `Most Followed`
  String get userSortMostFollowed {
    return Intl.message(
      'Most Followed',
      name: 'userSortMostFollowed',
      desc: '',
      args: [],
    );
  }

  /// `There are reservation requests waiting for your response.`
  String get pendingReservationsContent {
    return Intl.message(
      'There are reservation requests waiting for your response.',
      name: 'pendingReservationsContent',
      desc: '',
      args: [],
    );
  }

  /// `I'll do it later`
  String get doItLater {
    return Intl.message(
      'I\'ll do it later',
      name: 'doItLater',
      desc: '',
      args: [],
    );
  }

  /// `No reservations yet.`
  String get noReservationsYet {
    return Intl.message(
      'No reservations yet.',
      name: 'noReservationsYet',
      desc: '',
      args: [],
    );
  }

  /// `No reservations found.`
  String get noReservationsFound {
    return Intl.message(
      'No reservations found.',
      name: 'noReservationsFound',
      desc: '',
      args: [],
    );
  }

  /// `Today's Reservations`
  String get reservationsForToday {
    return Intl.message(
      'Today\'s Reservations',
      name: 'reservationsForToday',
      desc: '',
      args: [],
    );
  }

  /// `Reservation cancelled.`
  String get reservationCancelled {
    return Intl.message(
      'Reservation cancelled.',
      name: 'reservationCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Reservation`
  String get cancelReservation {
    return Intl.message(
      'Cancel Reservation',
      name: 'cancelReservation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this reservation?`
  String get cancelReservationConfirm {
    return Intl.message(
      'Are you sure you want to cancel this reservation?',
      name: 'cancelReservationConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Select a date:`
  String get selectDate {
    return Intl.message(
      'Select a date:',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Select a time:`
  String get selectTime {
    return Intl.message(
      'Select a time:',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Tap to select time`
  String get tapToSelectTime {
    return Intl.message(
      'Tap to select time',
      name: 'tapToSelectTime',
      desc: '',
      args: [],
    );
  }

  /// `max {size}`
  String maxPartySize(Object size) {
    return Intl.message(
      'max $size',
      name: 'maxPartySize',
      desc: '',
      args: [size],
    );
  }

  /// `Allow Reservations`
  String get allowReservations {
    return Intl.message(
      'Allow Reservations',
      name: 'allowReservations',
      desc: '',
      args: [],
    );
  }

  /// `Accept requests`
  String get acceptServiceRequests {
    return Intl.message(
      'Accept requests',
      name: 'acceptServiceRequests',
      desc: '',
      args: [],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message('Manage', name: 'manage', desc: '', args: []);
  }

  /// `This business isn't accepting requests right now`
  String get businessNotAcceptingRequestsNow {
    return Intl.message(
      'This business isn\'t accepting requests right now',
      name: 'businessNotAcceptingRequestsNow',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message('Confirmed', name: 'confirmed', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message('Cancelled', name: 'cancelled', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `No Show`
  String get noShow {
    return Intl.message('No Show', name: 'noShow', desc: '', args: []);
  }

  /// `guests`
  String get guests {
    return Intl.message('guests', name: 'guests', desc: '', args: []);
  }

  /// `Verify Phone`
  String get verifyPhone {
    return Intl.message(
      'Verify Phone',
      name: 'verifyPhone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the phone number to receive your verification code.`
  String get confirmPhoneForVerification {
    return Intl.message(
      'Confirm the phone number to receive your verification code.',
      name: 'confirmPhoneForVerification',
      desc: '',
      args: [],
    );
  }

  /// `Send Verification Code`
  String get sendVerificationCode {
    return Intl.message(
      'Send Verification Code',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to {phone}`
  String enterCodeSentTo(Object phone) {
    return Intl.message(
      'Enter the code sent to $phone',
      name: 'enterCodeSentTo',
      desc: '',
      args: [phone],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Resend in {seconds}s`
  String resendCodeIn(Object seconds) {
    return Intl.message(
      'Resend in ${seconds}s',
      name: 'resendCodeIn',
      desc: '',
      args: [seconds],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete your account?`
  String get deleteAccountTitle {
    return Intl.message(
      'Delete your account?',
      name: 'deleteAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `This action is permanent. Your personal data will be erased and all your businesses will be removed. You will be logged out immediately.`
  String get deleteAccountWarning {
    return Intl.message(
      'This action is permanent. Your personal data will be erased and all your businesses will be removed. You will be logged out immediately.',
      name: 'deleteAccountWarning',
      desc: '',
      args: [],
    );
  }

  /// `Yes, delete my account`
  String get deleteAccountConfirm {
    return Intl.message(
      'Yes, delete my account',
      name: 'deleteAccountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `You have an active business that will also be permanently deleted and cannot be recovered.`
  String get deleteAccountBusinessWarning {
    return Intl.message(
      'You have an active business that will also be permanently deleted and cannot be recovered.',
      name: 'deleteAccountBusinessWarning',
      desc: '',
      args: [],
    );
  }

  /// `Delete Business`
  String get deleteBusiness {
    return Intl.message(
      'Delete Business',
      name: 'deleteBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Delete this business?`
  String get deleteBusinessTitle {
    return Intl.message(
      'Delete this business?',
      name: 'deleteBusinessTitle',
      desc: '',
      args: [],
    );
  }

  /// `This action is permanent. The business and all its content (menu, promotions, reservations) will be removed.`
  String get deleteBusinessWarning {
    return Intl.message(
      'This action is permanent. The business and all its content (menu, promotions, reservations) will be removed.',
      name: 'deleteBusinessWarning',
      desc: '',
      args: [],
    );
  }

  /// `Yes, delete business`
  String get deleteBusinessConfirm {
    return Intl.message(
      'Yes, delete business',
      name: 'deleteBusinessConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Business deleted successfully`
  String get deleteBusinessSuccess {
    return Intl.message(
      'Business deleted successfully',
      name: 'deleteBusinessSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Danger Zone`
  String get dangerZone {
    return Intl.message('Danger Zone', name: 'dangerZone', desc: '', args: []);
  }

  /// `Get the app`
  String get downloadApp {
    return Intl.message('Get the app', name: 'downloadApp', desc: '', args: []);
  }

  /// `Where every flavor finds its audience.`
  String get aboutTagline {
    return Intl.message(
      'Where every flavor finds its audience.',
      name: 'aboutTagline',
      desc: '',
      args: [],
    );
  }

  /// `Why Foodly?`
  String get aboutMissionTitle {
    return Intl.message(
      'Why Foodly?',
      name: 'aboutMissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Foodly was born from a simple belief: every business — whether a family kitchen, a growing franchise, or a neighborhood bakery — deserves powerful tools to connect with its community.\n\nWe're building the bridge between businesses and the people who love what they offer.`
  String get aboutMission {
    return Intl.message(
      'Foodly was born from a simple belief: every business — whether a family kitchen, a growing franchise, or a neighborhood bakery — deserves powerful tools to connect with its community.\n\nWe\'re building the bridge between businesses and the people who love what they offer.',
      name: 'aboutMission',
      desc: '',
      args: [],
    );
  }

  /// `For Businesses`
  String get aboutForBusinessTitle {
    return Intl.message(
      'For Businesses',
      name: 'aboutForBusinessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Showcase your menu, launch promotions, manage reservations, build a loyal following, and let your customers discover you naturally — all from one place, at no cost.\n\nFoodly grows with you. Metrics, insights, and in-app ordering are coming soon.`
  String get aboutForBusiness {
    return Intl.message(
      'Showcase your menu, launch promotions, manage reservations, build a loyal following, and let your customers discover you naturally — all from one place, at no cost.\n\nFoodly grows with you. Metrics, insights, and in-app ordering are coming soon.',
      name: 'aboutForBusiness',
      desc: '',
      args: [],
    );
  }

  /// `For Customers`
  String get aboutForCustomersTitle {
    return Intl.message(
      'For Customers',
      name: 'aboutForCustomersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore what's nearby, find new favorites, save the best promotions, reserve a table in seconds, and support the businesses that make your city unique.`
  String get aboutForCustomers {
    return Intl.message(
      'Explore what\'s nearby, find new favorites, save the best promotions, reserve a table in seconds, and support the businesses that make your city unique.',
      name: 'aboutForCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Free for Everyone`
  String get aboutFreeTitle {
    return Intl.message(
      'Free for Everyone',
      name: 'aboutFreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Foodly is free to use — for businesses and customers alike. A 3% commission applies only to orders customers pay through Foodly, and it already covers payment processing. Anything paid at the counter or in cash costs nothing. No subscriptions, no hidden fees, no surprises.`
  String get aboutFree {
    return Intl.message(
      'Foodly is free to use — for businesses and customers alike. A 3% commission applies only to orders customers pay through Foodly, and it already covers payment processing. Anything paid at the counter or in cash costs nothing. No subscriptions, no hidden fees, no surprises.',
      name: 'aboutFree',
      desc: '',
      args: [],
    );
  }

  /// `Built to Evolve`
  String get aboutEvolvingTitle {
    return Intl.message(
      'Built to Evolve',
      name: 'aboutEvolvingTitle',
      desc: '',
      args: [],
    );
  }

  /// `We're just getting started. Foodly is designed to evolve alongside the businesses and communities it serves. Your feedback shapes what comes next.`
  String get aboutEvolving {
    return Intl.message(
      'We\'re just getting started. Foodly is designed to evolve alongside the businesses and communities it serves. Your feedback shapes what comes next.',
      name: 'aboutEvolving',
      desc: '',
      args: [],
    );
  }

  /// `Foodly Manifesto`
  String get aboutVideoPlaceholder {
    return Intl.message(
      'Foodly Manifesto',
      name: 'aboutVideoPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Discover the best food spots near you with Foodly — explore menus, grab promotions, and book tables, all in one app!`
  String get shareAppMessage {
    return Intl.message(
      'Discover the best food spots near you with Foodly — explore menus, grab promotions, and book tables, all in one app!',
      name: 'shareAppMessage',
      desc: '',
      args: [],
    );
  }

  /// `Share for Android`
  String get shareOnAndroid {
    return Intl.message(
      'Share for Android',
      name: 'shareOnAndroid',
      desc: '',
      args: [],
    );
  }

  /// `Share for iOS`
  String get shareOnIOS {
    return Intl.message(
      'Share for iOS',
      name: 'shareOnIOS',
      desc: '',
      args: [],
    );
  }

  /// `Coming very soon to iPhone! Foodly arrives on the App Store during June 2026.`
  String get iosComingSoonMessage {
    return Intl.message(
      'Coming very soon to iPhone! Foodly arrives on the App Store during June 2026.',
      name: 'iosComingSoonMessage',
      desc: '',
      args: [],
    );
  }

  /// `Rename "{currentLabel}" section`
  String combosLabelTitle(String currentLabel) {
    return Intl.message(
      'Rename "$currentLabel" section',
      name: 'combosLabelTitle',
      desc: '',
      args: [currentLabel],
    );
  }

  /// `Pick or create the label that best fits your business`
  String get combosLabelHint {
    return Intl.message(
      'Pick or create the label that best fits your business',
      name: 'combosLabelHint',
      desc: '',
      args: [],
    );
  }

  /// `Menus`
  String get combosLabelMenus {
    return Intl.message('Menus', name: 'combosLabelMenus', desc: '', args: []);
  }

  /// `Specials`
  String get combosLabelSpecials {
    return Intl.message(
      'Specials',
      name: 'combosLabelSpecials',
      desc: '',
      args: [],
    );
  }

  /// `Set Meals`
  String get combosLabelSetMeals {
    return Intl.message(
      'Set Meals',
      name: 'combosLabelSetMeals',
      desc: '',
      args: [],
    );
  }

  /// `Platters`
  String get combosLabelPlatters {
    return Intl.message(
      'Platters',
      name: 'combosLabelPlatters',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get combosLabelCustom {
    return Intl.message(
      'Custom',
      name: 'combosLabelCustom',
      desc: '',
      args: [],
    );
  }

  /// `Analytics Dashboard — Coming Soon\nGet deep insights into your traffic, top dishes, customer trends, and revenue — all in one place. Stay tuned.`
  String get analyticsComingSoon {
    return Intl.message(
      'Analytics Dashboard — Coming Soon\nGet deep insights into your traffic, top dishes, customer trends, and revenue — all in one place. Stay tuned.',
      name: 'analyticsComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Visited on {date}`
  String visitedOn(String date) {
    return Intl.message(
      'Visited on $date',
      name: 'visitedOn',
      desc: '',
      args: [date],
    );
  }

  /// `Rating Avg:`
  String get ratingAvg {
    return Intl.message('Rating Avg:', name: 'ratingAvg', desc: '', args: []);
  }

  /// `+ info`
  String get moreInfo {
    return Intl.message('+ info', name: 'moreInfo', desc: '', args: []);
  }

  /// `Share Promotion`
  String get sharePromotion {
    return Intl.message(
      'Share Promotion',
      name: 'sharePromotion',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this reservation?`
  String get areYouSureCancelReservation {
    return Intl.message(
      'Are you sure you want to cancel this reservation?',
      name: 'areYouSureCancelReservation',
      desc: '',
      args: [],
    );
  }

  /// `Yes, cancel`
  String get yesCancel {
    return Intl.message('Yes, cancel', name: 'yesCancel', desc: '', args: []);
  }

  /// `An error occurred, please contact admin.`
  String get contactAdmin {
    return Intl.message(
      'An error occurred, please contact admin.',
      name: 'contactAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get timeAgoJustNow {
    return Intl.message('Just now', name: 'timeAgoJustNow', desc: '', args: []);
  }

  /// `{count}m ago`
  String timeAgoMinutes(int count) {
    return Intl.message(
      '${count}m ago',
      name: 'timeAgoMinutes',
      desc: '',
      args: [count],
    );
  }

  /// `{count}h ago`
  String timeAgoHours(int count) {
    return Intl.message(
      '${count}h ago',
      name: 'timeAgoHours',
      desc: '',
      args: [count],
    );
  }

  /// `{count}d ago`
  String timeAgoDays(int count) {
    return Intl.message(
      '${count}d ago',
      name: 'timeAgoDays',
      desc: '',
      args: [count],
    );
  }

  /// `Analytics`
  String get analyticsTitle {
    return Intl.message(
      'Analytics',
      name: 'analyticsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Daily trends`
  String get dailyTrends {
    return Intl.message(
      'Daily trends',
      name: 'dailyTrends',
      desc: '',
      args: [],
    );
  }

  /// `Conversion funnel`
  String get conversionFunnel {
    return Intl.message(
      'Conversion funnel',
      name: 'conversionFunnel',
      desc: '',
      args: [],
    );
  }

  /// `Top events`
  String get topEvents {
    return Intl.message('Top events', name: 'topEvents', desc: '', args: []);
  }

  /// `Success rate`
  String get successRate {
    return Intl.message(
      'Success rate',
      name: 'successRate',
      desc: '',
      args: [],
    );
  }

  /// `Avg. rating`
  String get avgRating {
    return Intl.message('Avg. rating', name: 'avgRating', desc: '', args: []);
  }

  /// `Unique users`
  String get uniqueUsers {
    return Intl.message(
      'Unique users',
      name: 'uniqueUsers',
      desc: '',
      args: [],
    );
  }

  /// `Total events`
  String get totalEvents {
    return Intl.message(
      'Total events',
      name: 'totalEvents',
      desc: '',
      args: [],
    );
  }

  /// `Could not load analytics`
  String get couldNotLoadAnalytics {
    return Intl.message(
      'Could not load analytics',
      name: 'couldNotLoadAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `Service bookings`
  String get analyticsBookingsTotal {
    return Intl.message(
      'Service bookings',
      name: 'analyticsBookingsTotal',
      desc: '',
      args: [],
    );
  }

  /// `Success rate`
  String get analyticsBookingSuccessRate {
    return Intl.message(
      'Success rate',
      name: 'analyticsBookingSuccessRate',
      desc: '',
      args: [],
    );
  }

  /// `Response time`
  String get analyticsAvgResponseHours {
    return Intl.message(
      'Response time',
      name: 'analyticsAvgResponseHours',
      desc: '',
      args: [],
    );
  }

  /// `Availability checks`
  String get analyticsAvailabilityChecks {
    return Intl.message(
      'Availability checks',
      name: 'analyticsAvailabilityChecks',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get analyticsBookings {
    return Intl.message(
      'Bookings',
      name: 'analyticsBookings',
      desc: '',
      args: [],
    );
  }

  /// `Top packages`
  String get analyticsTopPackagesTitle {
    return Intl.message(
      'Top packages',
      name: 'analyticsTopPackagesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile views`
  String get analyticsLabelProfileView {
    return Intl.message(
      'Profile views',
      name: 'analyticsLabelProfileView',
      desc: '',
      args: [],
    );
  }

  /// `Package views`
  String get analyticsLabelPackageView {
    return Intl.message(
      'Package views',
      name: 'analyticsLabelPackageView',
      desc: '',
      args: [],
    );
  }

  /// `Inquiries`
  String get analyticsLabelPackageInquiry {
    return Intl.message(
      'Inquiries',
      name: 'analyticsLabelPackageInquiry',
      desc: '',
      args: [],
    );
  }

  /// `Booking started`
  String get analyticsLabelBookingStarted {
    return Intl.message(
      'Booking started',
      name: 'analyticsLabelBookingStarted',
      desc: '',
      args: [],
    );
  }

  /// `Booking submitted`
  String get analyticsLabelBookingSubmitted {
    return Intl.message(
      'Booking submitted',
      name: 'analyticsLabelBookingSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Booking confirmed`
  String get analyticsLabelBookingSucceeded {
    return Intl.message(
      'Booking confirmed',
      name: 'analyticsLabelBookingSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `View → Inquiry`
  String get analyticsViewToInquiry {
    return Intl.message(
      'View → Inquiry',
      name: 'analyticsViewToInquiry',
      desc: '',
      args: [],
    );
  }

  /// `Inquiry → Booking`
  String get analyticsInquiryToBooking {
    return Intl.message(
      'Inquiry → Booking',
      name: 'analyticsInquiryToBooking',
      desc: '',
      args: [],
    );
  }

  /// `View → Booking`
  String get analyticsViewToBooking {
    return Intl.message(
      'View → Booking',
      name: 'analyticsViewToBooking',
      desc: '',
      args: [],
    );
  }

  /// `Add to calendar`
  String get addToCalendar {
    return Intl.message(
      'Add to calendar',
      name: 'addToCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Party size: {count}`
  String partySizeCount(int count) {
    return Intl.message(
      'Party size: $count',
      name: 'partySizeCount',
      desc: '',
      args: [count],
    );
  }

  /// `Special requests: {text}`
  String specialRequestsLabel(String text) {
    return Intl.message(
      'Special requests: $text',
      name: 'specialRequestsLabel',
      desc: '',
      args: [text],
    );
  }

  /// `Notes: {text}`
  String notesLabel(String text) {
    return Intl.message(
      'Notes: $text',
      name: 'notesLabel',
      desc: '',
      args: [text],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `View → Interact`
  String get viewToInteract {
    return Intl.message(
      'View → Interact',
      name: 'viewToInteract',
      desc: '',
      args: [],
    );
  }

  /// `Interact → Reserve`
  String get interactToReserve {
    return Intl.message(
      'Interact → Reserve',
      name: 'interactToReserve',
      desc: '',
      args: [],
    );
  }

  /// `Reserve → Complete`
  String get reserveToComplete {
    return Intl.message(
      'Reserve → Complete',
      name: 'reserveToComplete',
      desc: '',
      args: [],
    );
  }

  /// `Business views`
  String get analyticsLabelBusinessOpen {
    return Intl.message(
      'Business views',
      name: 'analyticsLabelBusinessOpen',
      desc: '',
      args: [],
    );
  }

  /// `Contact taps`
  String get analyticsLabelCtaClicked {
    return Intl.message(
      'Contact taps',
      name: 'analyticsLabelCtaClicked',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get analyticsLabelCtaWhatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'analyticsLabelCtaWhatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Phone calls`
  String get analyticsLabelCtaPhone {
    return Intl.message(
      'Phone calls',
      name: 'analyticsLabelCtaPhone',
      desc: '',
      args: [],
    );
  }

  /// `Website visits`
  String get analyticsLabelCtaWebsite {
    return Intl.message(
      'Website visits',
      name: 'analyticsLabelCtaWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Get directions`
  String get analyticsLabelCtaDirections {
    return Intl.message(
      'Get directions',
      name: 'analyticsLabelCtaDirections',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get analyticsLabelCtaInstagram {
    return Intl.message(
      'Instagram',
      name: 'analyticsLabelCtaInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Search appearances`
  String get analyticsLabelSearchResult {
    return Intl.message(
      'Search appearances',
      name: 'analyticsLabelSearchResult',
      desc: '',
      args: [],
    );
  }

  /// `Reservations started`
  String get analyticsLabelReservationStarted {
    return Intl.message(
      'Reservations started',
      name: 'analyticsLabelReservationStarted',
      desc: '',
      args: [],
    );
  }

  /// `Reservations sent`
  String get analyticsLabelReservationSubmitted {
    return Intl.message(
      'Reservations sent',
      name: 'analyticsLabelReservationSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Reservations completed`
  String get analyticsLabelReservationSucceeded {
    return Intl.message(
      'Reservations completed',
      name: 'analyticsLabelReservationSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Added to favorites`
  String get analyticsLabelFavoriteAdded {
    return Intl.message(
      'Added to favorites',
      name: 'analyticsLabelFavoriteAdded',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites`
  String get analyticsLabelFavoriteRemoved {
    return Intl.message(
      'Removed from favorites',
      name: 'analyticsLabelFavoriteRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Reviews received`
  String get analyticsLabelReviewCreated {
    return Intl.message(
      'Reviews received',
      name: 'analyticsLabelReviewCreated',
      desc: '',
      args: [],
    );
  }

  /// `Menu views`
  String get analyticsLabelMenuViewed {
    return Intl.message(
      'Menu views',
      name: 'analyticsLabelMenuViewed',
      desc: '',
      args: [],
    );
  }

  /// `Shares`
  String get analyticsLabelShare {
    return Intl.message(
      'Shares',
      name: 'analyticsLabelShare',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get analyticsStatusConfirmed {
    return Intl.message(
      'Confirmed',
      name: 'analyticsStatusConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get analyticsStatusCompleted {
    return Intl.message(
      'Completed',
      name: 'analyticsStatusCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get analyticsStatusPending {
    return Intl.message(
      'Pending',
      name: 'analyticsStatusPending',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get analyticsStatusCancelled {
    return Intl.message(
      'Cancelled',
      name: 'analyticsStatusCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get analyticsStatusRejected {
    return Intl.message(
      'Rejected',
      name: 'analyticsStatusRejected',
      desc: '',
      args: [],
    );
  }

  /// `No show`
  String get analyticsStatusNoShow {
    return Intl.message(
      'No show',
      name: 'analyticsStatusNoShow',
      desc: '',
      args: [],
    );
  }

  /// `Catering & Chefs`
  String get cateringAndChefs {
    return Intl.message(
      'Catering & Chefs',
      name: 'cateringAndChefs',
      desc: '',
      args: [],
    );
  }

  /// `Service packages`
  String get servicePackages {
    return Intl.message(
      'Service packages',
      name: 'servicePackages',
      desc: '',
      args: [],
    );
  }

  /// `Packages`
  String get packages {
    return Intl.message('Packages', name: 'packages', desc: '', args: []);
  }

  /// `No packages yet`
  String get noPackagesYet {
    return Intl.message(
      'No packages yet',
      name: 'noPackagesYet',
      desc: '',
      args: [],
    );
  }

  /// `Tap + to create your first package`
  String get tapPlusToCreate {
    return Intl.message(
      'Tap + to create your first package',
      name: 'tapPlusToCreate',
      desc: '',
      args: [],
    );
  }

  /// `Set up your professional profile`
  String get setupProfessionalProfile {
    return Intl.message(
      'Set up your professional profile',
      name: 'setupProfessionalProfile',
      desc: '',
      args: [],
    );
  }

  /// `Add your specialties and details`
  String get addSpecialtiesAndDetails {
    return Intl.message(
      'Add your specialties and details',
      name: 'addSpecialtiesAndDetails',
      desc: '',
      args: [],
    );
  }

  /// `Professional profile`
  String get professionalProfile {
    return Intl.message(
      'Professional profile',
      name: 'professionalProfile',
      desc: '',
      args: [],
    );
  }

  /// `Create package`
  String get createPackage {
    return Intl.message(
      'Create package',
      name: 'createPackage',
      desc: '',
      args: [],
    );
  }

  /// `Edit package`
  String get editPackage {
    return Intl.message(
      'Edit package',
      name: 'editPackage',
      desc: '',
      args: [],
    );
  }

  /// `Delete package`
  String get deletePackage {
    return Intl.message(
      'Delete package',
      name: 'deletePackage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this package? This action cannot be undone.`
  String get deletePackageConfirmation {
    return Intl.message(
      'Are you sure you want to delete this package? This action cannot be undone.',
      name: 'deletePackageConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Long press and drag to reorder`
  String get longPressToDrag {
    return Intl.message(
      'Long press and drag to reorder',
      name: 'longPressToDrag',
      desc: '',
      args: [],
    );
  }

  /// `Reorder`
  String get reorder {
    return Intl.message('Reorder', name: 'reorder', desc: '', args: []);
  }

  /// `Featured`
  String get featured {
    return Intl.message('Featured', name: 'featured', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Active packages are visible to customers`
  String get activePackageHint {
    return Intl.message(
      'Active packages are visible to customers',
      name: 'activePackageHint',
      desc: '',
      args: [],
    );
  }

  /// `Featured packages appear first`
  String get featuredPackageHint {
    return Intl.message(
      'Featured packages appear first',
      name: 'featuredPackageHint',
      desc: '',
      args: [],
    );
  }

  /// `Service type`
  String get serviceType {
    return Intl.message(
      'Service type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Price type`
  String get priceType {
    return Intl.message('Price type', name: 'priceType', desc: '', args: []);
  }

  /// `Dinner`
  String get dinner {
    return Intl.message('Dinner', name: 'dinner', desc: '', args: []);
  }

  /// `Lunch`
  String get lunch {
    return Intl.message('Lunch', name: 'lunch', desc: '', args: []);
  }

  /// `Brunch`
  String get brunch {
    return Intl.message('Brunch', name: 'brunch', desc: '', args: []);
  }

  /// `Cocktail`
  String get cocktail {
    return Intl.message('Cocktail', name: 'cocktail', desc: '', args: []);
  }

  /// `Wedding`
  String get wedding {
    return Intl.message('Wedding', name: 'wedding', desc: '', args: []);
  }

  /// `Corporate`
  String get corporate {
    return Intl.message('Corporate', name: 'corporate', desc: '', args: []);
  }

  /// `Birthday`
  String get birthday {
    return Intl.message('Birthday', name: 'birthday', desc: '', args: []);
  }

  /// `Cooking class`
  String get cookingClass {
    return Intl.message(
      'Cooking class',
      name: 'cookingClass',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get custom {
    return Intl.message('Custom', name: 'custom', desc: '', args: []);
  }

  /// `Fixed`
  String get fixed {
    return Intl.message('Fixed', name: 'fixed', desc: '', args: []);
  }

  /// `Per person`
  String get perPerson {
    return Intl.message('Per person', name: 'perPerson', desc: '', args: []);
  }

  /// `Per hour`
  String get perHour {
    return Intl.message('Per hour', name: 'perHour', desc: '', args: []);
  }

  /// `On quote`
  String get onQuote {
    return Intl.message('On quote', name: 'onQuote', desc: '', args: []);
  }

  /// `Includes`
  String get includes {
    return Intl.message('Includes', name: 'includes', desc: '', args: []);
  }

  /// `more`
  String get more {
    return Intl.message('more', name: 'more', desc: '', args: []);
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `Duration (hours)`
  String get durationHours {
    return Intl.message(
      'Duration (hours)',
      name: 'durationHours',
      desc: '',
      args: [],
    );
  }

  /// `Min. guests`
  String get minGuests {
    return Intl.message('Min. guests', name: 'minGuests', desc: '', args: []);
  }

  /// `Max. guests`
  String get maxGuests {
    return Intl.message('Max. guests', name: 'maxGuests', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid value`
  String get invalidValue {
    return Intl.message(
      'Invalid value',
      name: 'invalidValue',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: Gourmet dinner for 20 guests`
  String get packageTitleHint {
    return Intl.message(
      'E.g.: Gourmet dinner for 20 guests',
      name: 'packageTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Describe what this package includes`
  String get packageDescriptionHint {
    return Intl.message(
      'Describe what this package includes',
      name: 'packageDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Add item`
  String get addItem {
    return Intl.message('Add item', name: 'addItem', desc: '', args: []);
  }

  /// `E.g.: Starter, main course, dessert`
  String get includeItemHint {
    return Intl.message(
      'E.g.: Starter, main course, dessert',
      name: 'includeItemHint',
      desc: '',
      args: [],
    );
  }

  /// `Specialties`
  String get specialties {
    return Intl.message('Specialties', name: 'specialties', desc: '', args: []);
  }

  /// `Cuisines`
  String get cuisines {
    return Intl.message('Cuisines', name: 'cuisines', desc: '', args: []);
  }

  /// `Certifications`
  String get certifications {
    return Intl.message(
      'Certifications',
      name: 'certifications',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `Add specialty`
  String get addSpecialty {
    return Intl.message(
      'Add specialty',
      name: 'addSpecialty',
      desc: '',
      args: [],
    );
  }

  /// `Add cuisine`
  String get addCuisine {
    return Intl.message('Add cuisine', name: 'addCuisine', desc: '', args: []);
  }

  /// `Add certification`
  String get addCertification {
    return Intl.message(
      'Add certification',
      name: 'addCertification',
      desc: '',
      args: [],
    );
  }

  /// `Add language`
  String get addLanguage {
    return Intl.message(
      'Add language',
      name: 'addLanguage',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: Molecular gastronomy`
  String get specialtyExample {
    return Intl.message(
      'E.g.: Molecular gastronomy',
      name: 'specialtyExample',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: Mediterranean`
  String get cuisineExample {
    return Intl.message(
      'E.g.: Mediterranean',
      name: 'cuisineExample',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: HACCP`
  String get certificationExample {
    return Intl.message(
      'E.g.: HACCP',
      name: 'certificationExample',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: English`
  String get languageExample {
    return Intl.message(
      'E.g.: English',
      name: 'languageExample',
      desc: '',
      args: [],
    );
  }

  /// `Years of experience`
  String get yearsExperience {
    return Intl.message(
      'Years of experience',
      name: 'yearsExperience',
      desc: '',
      args: [],
    );
  }

  /// `Team size`
  String get teamSize {
    return Intl.message('Team size', name: 'teamSize', desc: '', args: []);
  }

  /// `Solo`
  String get solo {
    return Intl.message('Solo', name: 'solo', desc: '', args: []);
  }

  /// `Service area`
  String get serviceArea {
    return Intl.message(
      'Service area',
      name: 'serviceArea',
      desc: '',
      args: [],
    );
  }

  /// `Radius (km)`
  String get radiusKm {
    return Intl.message('Radius (km)', name: 'radiusKm', desc: '', args: []);
  }

  /// `Travel fee/km`
  String get travelFeeKm {
    return Intl.message(
      'Travel fee/km',
      name: 'travelFeeKm',
      desc: '',
      args: [],
    );
  }

  /// `Booking & pricing`
  String get bookingPricing {
    return Intl.message(
      'Booking & pricing',
      name: 'bookingPricing',
      desc: '',
      args: [],
    );
  }

  /// `Minimum amount`
  String get minBookingAmount {
    return Intl.message(
      'Minimum amount',
      name: 'minBookingAmount',
      desc: '',
      args: [],
    );
  }

  /// `Deposit required`
  String get depositRequired {
    return Intl.message(
      'Deposit required',
      name: 'depositRequired',
      desc: '',
      args: [],
    );
  }

  /// `Deposit percentage`
  String get depositPercentage {
    return Intl.message(
      'Deposit percentage',
      name: 'depositPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation policy`
  String get cancellationPolicy {
    return Intl.message(
      'Cancellation policy',
      name: 'cancellationPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation details`
  String get cancellationDetails {
    return Intl.message(
      'Cancellation details',
      name: 'cancellationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Describe the cancellation terms`
  String get cancellationDetailsHint {
    return Intl.message(
      'Describe the cancellation terms',
      name: 'cancellationDetailsHint',
      desc: '',
      args: [],
    );
  }

  /// `Flexible`
  String get flexible {
    return Intl.message('Flexible', name: 'flexible', desc: '', args: []);
  }

  /// `Moderate`
  String get moderate {
    return Intl.message('Moderate', name: 'moderate', desc: '', args: []);
  }

  /// `Strict`
  String get strict {
    return Intl.message('Strict', name: 'strict', desc: '', args: []);
  }

  /// `Has insurance`
  String get hasInsurance {
    return Intl.message(
      'Has insurance',
      name: 'hasInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Liability insurance coverage`
  String get insuranceHint {
    return Intl.message(
      'Liability insurance coverage',
      name: 'insuranceHint',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio/video URL`
  String get portfolioVideoUrl {
    return Intl.message(
      'Portfolio/video URL',
      name: 'portfolioVideoUrl',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get portfolio {
    return Intl.message('Portfolio', name: 'portfolio', desc: '', args: []);
  }

  /// `Photos (optional, up to {max})`
  String photosOptionalMax(int max) {
    return Intl.message(
      'Photos (optional, up to $max)',
      name: 'photosOptionalMax',
      desc: '',
      args: [max],
    );
  }

  /// `Add photo`
  String get addPhoto {
    return Intl.message('Add photo', name: 'addPhoto', desc: '', args: []);
  }

  /// `Maximum {max} photos`
  String photoLimitReached(int max) {
    return Intl.message(
      'Maximum $max photos',
      name: 'photoLimitReached',
      desc: '',
      args: [max],
    );
  }

  /// `Remove photo`
  String get removePhoto {
    return Intl.message(
      'Remove photo',
      name: 'removePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Some photos couldn't be uploaded. Edit the package to retry.`
  String get photoUploadFailed {
    return Intl.message(
      'Some photos couldn\'t be uploaded. Edit the package to retry.',
      name: 'photoUploadFailed',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password. Please try again.`
  String get passwordIncorrect {
    return Intl.message(
      'Incorrect password. Please try again.',
      name: 'passwordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password to continue.`
  String get passwordRequired {
    return Intl.message(
      'Enter your password to continue.',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Your email was updated successfully.`
  String get emailUpdated {
    return Intl.message(
      'Your email was updated successfully.',
      name: 'emailUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get genericErrorRetry {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'genericErrorRetry',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Check your network and try again.`
  String get noConnection {
    return Intl.message(
      'No internet connection. Check your network and try again.',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Description`
  String get descriptionLabel {
    return Intl.message(
      'Description',
      name: 'descriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Service request`
  String get serviceBookingRequest {
    return Intl.message(
      'Service request',
      name: 'serviceBookingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Table reservations`
  String get tableReservations {
    return Intl.message(
      'Table reservations',
      name: 'tableReservations',
      desc: '',
      args: [],
    );
  }

  /// `Service requests`
  String get serviceRequests {
    return Intl.message(
      'Service requests',
      name: 'serviceRequests',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get allBookings {
    return Intl.message('All', name: 'allBookings', desc: '', args: []);
  }

  /// `Quoted`
  String get quoted {
    return Intl.message('Quoted', name: 'quoted', desc: '', args: []);
  }

  /// `Quote sent`
  String get quotedStatus {
    return Intl.message('Quote sent', name: 'quotedStatus', desc: '', args: []);
  }

  /// `Send quote`
  String get sendQuote {
    return Intl.message('Send quote', name: 'sendQuote', desc: '', args: []);
  }

  /// `Approve quote`
  String get approveQuote {
    return Intl.message(
      'Approve quote',
      name: 'approveQuote',
      desc: '',
      args: [],
    );
  }

  /// `Quoted amount`
  String get quotedAmount {
    return Intl.message(
      'Quoted amount',
      name: 'quotedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Budget estimate`
  String get budgetEstimate {
    return Intl.message(
      'Budget estimate',
      name: 'budgetEstimate',
      desc: '',
      args: [],
    );
  }

  /// `Guest count`
  String get guestCount {
    return Intl.message('Guest count', name: 'guestCount', desc: '', args: []);
  }

  /// `Event address`
  String get eventAddress {
    return Intl.message(
      'Event address',
      name: 'eventAddress',
      desc: '',
      args: [],
    );
  }

  /// `Event city`
  String get eventCity {
    return Intl.message('Event city', name: 'eventCity', desc: '', args: []);
  }

  /// `Event type`
  String get eventType {
    return Intl.message('Event type', name: 'eventType', desc: '', args: []);
  }

  /// `Dietary notes`
  String get dietaryNotes {
    return Intl.message(
      'Dietary notes',
      name: 'dietaryNotes',
      desc: '',
      args: [],
    );
  }

  /// `Dinner`
  String get eventTypeDinner {
    return Intl.message('Dinner', name: 'eventTypeDinner', desc: '', args: []);
  }

  /// `Lunch`
  String get eventTypeLunch {
    return Intl.message('Lunch', name: 'eventTypeLunch', desc: '', args: []);
  }

  /// `Wedding`
  String get eventTypeWedding {
    return Intl.message(
      'Wedding',
      name: 'eventTypeWedding',
      desc: '',
      args: [],
    );
  }

  /// `Corporate`
  String get eventTypeCorporate {
    return Intl.message(
      'Corporate',
      name: 'eventTypeCorporate',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get eventTypeBirthday {
    return Intl.message(
      'Birthday',
      name: 'eventTypeBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Brunch`
  String get eventTypeBrunch {
    return Intl.message('Brunch', name: 'eventTypeBrunch', desc: '', args: []);
  }

  /// `Cocktail`
  String get eventTypeCocktail {
    return Intl.message(
      'Cocktail',
      name: 'eventTypeCocktail',
      desc: '',
      args: [],
    );
  }

  /// `Private cooking class`
  String get eventTypeCookingClassPrivate {
    return Intl.message(
      'Private cooking class',
      name: 'eventTypeCookingClassPrivate',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get eventTypeCustom {
    return Intl.message('Custom', name: 'eventTypeCustom', desc: '', args: []);
  }

  /// `All`
  String get serviceTypeAll {
    return Intl.message('All', name: 'serviceTypeAll', desc: '', args: []);
  }

  /// `Sort by`
  String get orderingLabel {
    return Intl.message('Sort by', name: 'orderingLabel', desc: '', args: []);
  }

  /// `Distance`
  String get orderingDistance {
    return Intl.message(
      'Distance',
      name: 'orderingDistance',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get orderingPriceAsc {
    return Intl.message('Price', name: 'orderingPriceAsc', desc: '', args: []);
  }

  /// `Rating`
  String get orderingRatingDesc {
    return Intl.message(
      'Rating',
      name: 'orderingRatingDesc',
      desc: '',
      args: [],
    );
  }

  /// `from {currency}{price}`
  String priceFromBadge(String currency, String price) {
    return Intl.message(
      'from $currency$price',
      name: 'priceFromBadge',
      desc:
          'Shown on catering business cards in the nearby discovery. {currency} is the symbol derived from the business\'s country (€, \$, ARS, Bs, etc.) and {price} is the cheapest active package price.',
      args: [currency, price],
    );
  }

  /// `Request service`
  String get requestService {
    return Intl.message(
      'Request service',
      name: 'requestService',
      desc: '',
      args: [],
    );
  }

  /// `Request quote`
  String get requestQuote {
    return Intl.message(
      'Request quote',
      name: 'requestQuote',
      desc: '',
      args: [],
    );
  }

  /// `Quote approved`
  String get quoteApproved {
    return Intl.message(
      'Quote approved',
      name: 'quoteApproved',
      desc: '',
      args: [],
    );
  }

  /// `Quote received`
  String get quoteReceived {
    return Intl.message(
      'Quote received',
      name: 'quoteReceived',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting quote`
  String get awaitingQuote {
    return Intl.message(
      'Awaiting quote',
      name: 'awaitingQuote',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get bookingMessages {
    return Intl.message(
      'Messages',
      name: 'bookingMessages',
      desc: '',
      args: [],
    );
  }

  /// `Send message`
  String get sendMessage {
    return Intl.message(
      'Send message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Type a message...`
  String get typeMessage {
    return Intl.message(
      'Type a message...',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet`
  String get noMessagesYet {
    return Intl.message(
      'No messages yet',
      name: 'noMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `Message thread`
  String get messageThread {
    return Intl.message(
      'Message thread',
      name: 'messageThread',
      desc: '',
      args: [],
    );
  }

  /// `Reconnecting…`
  String get reconnecting {
    return Intl.message(
      'Reconnecting…',
      name: 'reconnecting',
      desc: '',
      args: [],
    );
  }

  /// `1 new message`
  String get oneNewMessage {
    return Intl.message(
      '1 new message',
      name: 'oneNewMessage',
      desc: '',
      args: [],
    );
  }

  /// `{count} new messages`
  String nNewMessages(int count) {
    return Intl.message(
      '$count new messages',
      name: 'nNewMessages',
      desc: '',
      args: [count],
    );
  }

  /// `Enter quote amount`
  String get enterQuoteAmount {
    return Intl.message(
      'Enter quote amount',
      name: 'enterQuoteAmount',
      desc: '',
      args: [],
    );
  }

  /// `Quote notes (optional)`
  String get quoteNotes {
    return Intl.message(
      'Quote notes (optional)',
      name: 'quoteNotes',
      desc: '',
      args: [],
    );
  }

  /// `Approve this quote?`
  String get confirmApproveQuote {
    return Intl.message(
      'Approve this quote?',
      name: 'confirmApproveQuote',
      desc: '',
      args: [],
    );
  }

  /// `By approving, you confirm the booking. Payment is handled outside the platform.`
  String get confirmApproveQuoteMessage {
    return Intl.message(
      'By approving, you confirm the booking. Payment is handled outside the platform.',
      name: 'confirmApproveQuoteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get rejectQuote {
    return Intl.message('Reject', name: 'rejectQuote', desc: '', args: []);
  }

  /// `Quote rejected`
  String get quoteRejected {
    return Intl.message(
      'Quote rejected',
      name: 'quoteRejected',
      desc: '',
      args: [],
    );
  }

  /// `Reject this quote?`
  String get confirmRejectQuote {
    return Intl.message(
      'Reject this quote?',
      name: 'confirmRejectQuote',
      desc: '',
      args: [],
    );
  }

  /// `Rejecting closes this request and notifies the business. This action can't be undone.`
  String get confirmRejectQuoteMessage {
    return Intl.message(
      'Rejecting closes this request and notifies the business. This action can\'t be undone.',
      name: 'confirmRejectQuoteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reason (optional)`
  String get rejectionReasonOptional {
    return Intl.message(
      'Reason (optional)',
      name: 'rejectionReasonOptional',
      desc: '',
      args: [],
    );
  }

  /// `Help the business understand why the booking didn't go through`
  String get rejectionReasonHint {
    return Intl.message(
      'Help the business understand why the booking didn\'t go through',
      name: 'rejectionReasonHint',
      desc: '',
      args: [],
    );
  }

  /// `Payment outside the platform`
  String get paymentOffPlatform {
    return Intl.message(
      'Payment outside the platform',
      name: 'paymentOffPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Event location`
  String get eventLocation {
    return Intl.message(
      'Event location',
      name: 'eventLocation',
      desc: '',
      args: [],
    );
  }

  /// `Booking detail`
  String get bookingDetail {
    return Intl.message(
      'Booking detail',
      name: 'bookingDetail',
      desc: '',
      args: [],
    );
  }

  /// `Service request detail`
  String get serviceBookingDetail {
    return Intl.message(
      'Service request detail',
      name: 'serviceBookingDetail',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Minimum`
  String get minimum {
    return Intl.message('Minimum', name: 'minimum', desc: '', args: []);
  }

  /// `Maximum`
  String get maximum {
    return Intl.message('Maximum', name: 'maximum', desc: '', args: []);
  }

  /// `Special requests`
  String get specialRequests {
    return Intl.message(
      'Special requests',
      name: 'specialRequests',
      desc: '',
      args: [],
    );
  }

  /// `Quote sent`
  String get quoteSent {
    return Intl.message('Quote sent', name: 'quoteSent', desc: '', args: []);
  }

  /// `Availability calendar`
  String get availabilityCalendar {
    return Intl.message(
      'Availability calendar',
      name: 'availabilityCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Availability`
  String get availability {
    return Intl.message(
      'Availability',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `Block date`
  String get blockDate {
    return Intl.message('Block date', name: 'blockDate', desc: '', args: []);
  }

  /// `Block`
  String get blockAction {
    return Intl.message('Block', name: 'blockAction', desc: '', args: []);
  }

  /// `Date blocked`
  String get dateBlocked {
    return Intl.message(
      'Date blocked',
      name: 'dateBlocked',
      desc: '',
      args: [],
    );
  }

  /// `Full day`
  String get fullDay {
    return Intl.message('Full day', name: 'fullDay', desc: '', args: []);
  }

  /// `Start time`
  String get startTime {
    return Intl.message('Start time', name: 'startTime', desc: '', args: []);
  }

  /// `End time`
  String get endTime {
    return Intl.message('End time', name: 'endTime', desc: '', args: []);
  }

  /// `Reason (optional)`
  String get reasonOptional {
    return Intl.message(
      'Reason (optional)',
      name: 'reasonOptional',
      desc: '',
      args: [],
    );
  }

  /// `E.g. Vacation, maintenance`
  String get reasonHint {
    return Intl.message(
      'E.g. Vacation, maintenance',
      name: 'reasonHint',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Previous month`
  String get previousMonth {
    return Intl.message(
      'Previous month',
      name: 'previousMonth',
      desc: '',
      args: [],
    );
  }

  /// `Next month`
  String get nextMonth {
    return Intl.message('Next month', name: 'nextMonth', desc: '', args: []);
  }

  /// `Blocks on`
  String get blocksOn {
    return Intl.message('Blocks on', name: 'blocksOn', desc: '', args: []);
  }

  /// `Add another block`
  String get addAnotherBlock {
    return Intl.message(
      'Add another block',
      name: 'addAnotherBlock',
      desc: '',
      args: [],
    );
  }

  /// `Delete block`
  String get deleteBlock {
    return Intl.message(
      'Delete block',
      name: 'deleteBlock',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this block? This cannot be undone.`
  String get deleteBlockConfirm {
    return Intl.message(
      'Are you sure you want to delete this block? This cannot be undone.',
      name: 'deleteBlockConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Full day`
  String get legendFullDayBlock {
    return Intl.message(
      'Full day',
      name: 'legendFullDayBlock',
      desc: '',
      args: [],
    );
  }

  /// `Partial`
  String get legendPartialBlock {
    return Intl.message(
      'Partial',
      name: 'legendPartialBlock',
      desc: '',
      args: [],
    );
  }

  /// `Reservation`
  String get legendAutoReservation {
    return Intl.message(
      'Reservation',
      name: 'legendAutoReservation',
      desc: '',
      args: [],
    );
  }

  /// `Reservation`
  String get fromReservation {
    return Intl.message(
      'Reservation',
      name: 'fromReservation',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get january {
    return Intl.message('January', name: 'january', desc: '', args: []);
  }

  /// `February`
  String get february {
    return Intl.message('February', name: 'february', desc: '', args: []);
  }

  /// `March`
  String get march {
    return Intl.message('March', name: 'march', desc: '', args: []);
  }

  /// `April`
  String get april {
    return Intl.message('April', name: 'april', desc: '', args: []);
  }

  /// `May`
  String get may {
    return Intl.message('May', name: 'may', desc: '', args: []);
  }

  /// `June`
  String get june {
    return Intl.message('June', name: 'june', desc: '', args: []);
  }

  /// `July`
  String get july {
    return Intl.message('July', name: 'july', desc: '', args: []);
  }

  /// `August`
  String get august {
    return Intl.message('August', name: 'august', desc: '', args: []);
  }

  /// `September`
  String get september {
    return Intl.message('September', name: 'september', desc: '', args: []);
  }

  /// `October`
  String get october {
    return Intl.message('October', name: 'october', desc: '', args: []);
  }

  /// `November`
  String get november {
    return Intl.message('November', name: 'november', desc: '', args: []);
  }

  /// `December`
  String get december {
    return Intl.message('December', name: 'december', desc: '', args: []);
  }

  /// `Loading availability…`
  String get loadingAvailability {
    return Intl.message(
      'Loading availability…',
      name: 'loadingAvailability',
      desc: '',
      args: [],
    );
  }

  /// `Days in grey are not available.`
  String get unavailableDaysHint {
    return Intl.message(
      'Days in grey are not available.',
      name: 'unavailableDaysHint',
      desc: '',
      args: [],
    );
  }

  /// `That date was just blocked. Please pick another one.`
  String get dateUnavailable {
    return Intl.message(
      'That date was just blocked. Please pick another one.',
      name: 'dateUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `That day has partially booked time slots. We may ask you to adjust the time.`
  String get datePartiallyBlockedInfo {
    return Intl.message(
      'That day has partially booked time slots. We may ask you to adjust the time.',
      name: 'datePartiallyBlockedInfo',
      desc: '',
      args: [],
    );
  }

  /// `Group order`
  String get groupOrderTitle {
    return Intl.message(
      'Group order',
      name: 'groupOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Participants`
  String get groupOrderParticipants {
    return Intl.message(
      'Participants',
      name: 'groupOrderParticipants',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get groupOrderItemsSection {
    return Intl.message(
      'Items',
      name: 'groupOrderItemsSection',
      desc: '',
      args: [],
    );
  }

  /// `No items yet`
  String get groupOrderNoItems {
    return Intl.message(
      'No items yet',
      name: 'groupOrderNoItems',
      desc: '',
      args: [],
    );
  }

  /// `Order total`
  String get groupOrderTotal {
    return Intl.message(
      'Order total',
      name: 'groupOrderTotal',
      desc: '',
      args: [],
    );
  }

  /// `Your share`
  String get groupOrderYourShare {
    return Intl.message(
      'Your share',
      name: 'groupOrderYourShare',
      desc: '',
      args: [],
    );
  }

  /// `Pay my share · {amount}`
  String groupOrderPayMyShare(String amount) {
    return Intl.message(
      'Pay my share · $amount',
      name: 'groupOrderPayMyShare',
      desc: '',
      args: [amount],
    );
  }

  /// `Nothing left to pay`
  String get groupOrderNoBalanceDue {
    return Intl.message(
      'Nothing left to pay',
      name: 'groupOrderNoBalanceDue',
      desc: '',
      args: [],
    );
  }

  /// `This order expired — the payment window ran out and nothing was charged. You can order again from the menu.`
  String get groupOrderExpiredNotice {
    return Intl.message(
      'This order expired — the payment window ran out and nothing was charged. You can order again from the menu.',
      name: 'groupOrderExpiredNotice',
      desc: '',
      args: [],
    );
  }

  /// `This order was cancelled. Nothing was charged.`
  String get groupOrderCancelledNotice {
    return Intl.message(
      'This order was cancelled. Nothing was charged.',
      name: 'groupOrderCancelledNotice',
      desc: '',
      args: [],
    );
  }

  /// `This order is already closed.`
  String get groupOrderCompletedNotice {
    return Intl.message(
      'This order is already closed.',
      name: 'groupOrderCompletedNotice',
      desc: '',
      args: [],
    );
  }

  /// `We are confirming your payment. It may take a few seconds.`
  String get groupOrderConfirmingPayment {
    return Intl.message(
      'We are confirming your payment. It may take a few seconds.',
      name: 'groupOrderConfirmingPayment',
      desc: '',
      args: [],
    );
  }

  /// `{paid} of {total} paid`
  String groupOrderPaidProgress(int paid, int total) {
    return Intl.message(
      '$paid of $total paid',
      name: 'groupOrderPaidProgress',
      desc: '',
      args: [paid, total],
    );
  }

  /// `Host`
  String get groupOrderHostBadge {
    return Intl.message(
      'Host',
      name: 'groupOrderHostBadge',
      desc: '',
      args: [],
    );
  }

  /// `Payment completed`
  String get groupOrderPaymentSucceeded {
    return Intl.message(
      'Payment completed',
      name: 'groupOrderPaymentSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Payment canceled`
  String get groupOrderPaymentCanceled {
    return Intl.message(
      'Payment canceled',
      name: 'groupOrderPaymentCanceled',
      desc: '',
      args: [],
    );
  }

  /// `We opened your browser to finish the payment`
  String get groupOrderPaymentInBrowser {
    return Intl.message(
      'We opened your browser to finish the payment',
      name: 'groupOrderPaymentInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Other payment methods`
  String get groupOrderPayOtherMethods {
    return Intl.message(
      'Other payment methods',
      name: 'groupOrderPayOtherMethods',
      desc: '',
      args: [],
    );
  }

  /// `Looking for another way to pay?`
  String get groupOrderOtherMethodsTitle {
    return Intl.message(
      'Looking for another way to pay?',
      name: 'groupOrderOtherMethodsTitle',
      desc: '',
      args: [],
    );
  }

  /// `In your browser you can pay with MB WAY and other methods that do not show up here.`
  String get groupOrderOtherMethodsBody {
    return Intl.message(
      'In your browser you can pay with MB WAY and other methods that do not show up here.',
      name: 'groupOrderOtherMethodsBody',
      desc: '',
      args: [],
    );
  }

  /// `Pay in the browser`
  String get groupOrderPayInBrowser {
    return Intl.message(
      'Pay in the browser',
      name: 'groupOrderPayInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Not now`
  String get groupOrderNotNow {
    return Intl.message(
      'Not now',
      name: 'groupOrderNotNow',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't load this. Check your connection and try again.`
  String get loadFailedMessage {
    return Intl.message(
      'We couldn\'t load this. Check your connection and try again.',
      name: 'loadFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get loadFailedRetry {
    return Intl.message(
      'Try again',
      name: 'loadFailedRetry',
      desc: '',
      args: [],
    );
  }

  /// `Payment couldn't be completed`
  String get groupOrderPaymentFailed {
    return Intl.message(
      'Payment couldn\'t be completed',
      name: 'groupOrderPaymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Order as a group`
  String get groupOrderEntryCta {
    return Intl.message(
      'Order as a group',
      name: 'groupOrderEntryCta',
      desc: '',
      args: [],
    );
  }

  /// `Creating…`
  String get groupOrderCreating {
    return Intl.message(
      'Creating…',
      name: 'groupOrderCreating',
      desc: '',
      args: [],
    );
  }

  /// `View order`
  String get groupOrderViewOrder {
    return Intl.message(
      'View order',
      name: 'groupOrderViewOrder',
      desc: '',
      args: [],
    );
  }

  /// `Add dishes from the menu`
  String get groupOrderAddFromMenu {
    return Intl.message(
      'Add dishes from the menu',
      name: 'groupOrderAddFromMenu',
      desc: '',
      args: [],
    );
  }

  /// `Finish order`
  String get groupOrderLockCta {
    return Intl.message(
      'Finish order',
      name: 'groupOrderLockCta',
      desc: '',
      args: [],
    );
  }

  /// `Reopen order`
  String get groupOrderUnlockCta {
    return Intl.message(
      'Reopen order',
      name: 'groupOrderUnlockCta',
      desc: '',
      args: [],
    );
  }

  /// `Reopen the order? Prices unfreeze and items can be edited again.`
  String get groupOrderUnlockConfirm {
    return Intl.message(
      'Reopen the order? Prices unfreeze and items can be edited again.',
      name: 'groupOrderUnlockConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Transfer ownership`
  String get groupOrderTransferHost {
    return Intl.message(
      'Transfer ownership',
      name: 'groupOrderTransferHost',
      desc: '',
      args: [],
    );
  }

  /// `Transfer ownership to {name}?`
  String groupOrderTransferHostConfirm(String name) {
    return Intl.message(
      'Transfer ownership to $name?',
      name: 'groupOrderTransferHostConfirm',
      desc: '',
      args: [name],
    );
  }

  /// `Cover their share`
  String get groupOrderCoverShare {
    return Intl.message(
      'Cover their share',
      name: 'groupOrderCoverShare',
      desc: '',
      args: [],
    );
  }

  /// `Pay {name}'s share ({amount})?`
  String groupOrderCoverConfirm(String name, String amount) {
    return Intl.message(
      'Pay $name\'s share ($amount)?',
      name: 'groupOrderCoverConfirm',
      desc: '',
      args: [name, amount],
    );
  }

  /// `Pay all remaining · {amount}`
  String groupOrderPayAllRemaining(String amount) {
    return Intl.message(
      'Pay all remaining · $amount',
      name: 'groupOrderPayAllRemaining',
      desc: '',
      args: [amount],
    );
  }

  /// `Pay everything remaining ({amount})?`
  String groupOrderPayAllConfirm(String amount) {
    return Intl.message(
      'Pay everything remaining ($amount)?',
      name: 'groupOrderPayAllConfirm',
      desc: '',
      args: [amount],
    );
  }

  /// `Paid by {name}`
  String groupOrderPaidBy(String name) {
    return Intl.message(
      'Paid by $name',
      name: 'groupOrderPaidBy',
      desc: '',
      args: [name],
    );
  }

  /// `Extra time: {amount} missing`
  String groupOrderGraceNotice(String amount) {
    return Intl.message(
      'Extra time: $amount missing',
      name: 'groupOrderGraceNotice',
      desc: '',
      args: [amount],
    );
  }

  /// `Shared`
  String get groupOrderSharedBadge {
    return Intl.message(
      'Shared',
      name: 'groupOrderSharedBadge',
      desc: '',
      args: [],
    );
  }

  /// `Share with the table`
  String get groupOrderShareItemTooltip {
    return Intl.message(
      'Share with the table',
      name: 'groupOrderShareItemTooltip',
      desc: '',
      args: [],
    );
  }

  /// `How should we split the bill?`
  String get groupOrderSplitModeTitle {
    return Intl.message(
      'How should we split the bill?',
      name: 'groupOrderSplitModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `By items`
  String get groupOrderSplitByItems {
    return Intl.message(
      'By items',
      name: 'groupOrderSplitByItems',
      desc: '',
      args: [],
    );
  }

  /// `Everyone pays for their own; shared items are split.`
  String get groupOrderSplitByItemsDesc {
    return Intl.message(
      'Everyone pays for their own; shared items are split.',
      name: 'groupOrderSplitByItemsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Equal parts`
  String get groupOrderSplitEqual {
    return Intl.message(
      'Equal parts',
      name: 'groupOrderSplitEqual',
      desc: '',
      args: [],
    );
  }

  /// `The total is split evenly among everyone.`
  String get groupOrderSplitEqualDesc {
    return Intl.message(
      'The total is split evenly among everyone.',
      name: 'groupOrderSplitEqualDesc',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to tip?`
  String get groupOrderTipTitle {
    return Intl.message(
      'Would you like to tip?',
      name: 'groupOrderTipTitle',
      desc: '',
      args: [],
    );
  }

  /// `No tip`
  String get groupOrderTipNone {
    return Intl.message(
      'No tip',
      name: 'groupOrderTipNone',
      desc: '',
      args: [],
    );
  }

  /// `Custom amount`
  String get groupOrderTipCustom {
    return Intl.message(
      'Custom amount',
      name: 'groupOrderTipCustom',
      desc: '',
      args: [],
    );
  }

  /// `Includes a {amount} payment platform fee`
  String groupOrderServiceFeeNotice(String amount) {
    return Intl.message(
      'Includes a $amount payment platform fee',
      name: 'groupOrderServiceFeeNotice',
      desc: '',
      args: [amount],
    );
  }

  /// `Processing fee`
  String get groupOrderServiceFeeTitle {
    return Intl.message(
      'Processing fee',
      name: 'groupOrderServiceFeeTitle',
      desc: '',
      args: [],
    );
  }

  /// `This flat {amount} per-transaction fee goes to the platform that securely processes your card payment. It is not charged by Foodly or the restaurant.`
  String groupOrderServiceFeeExplain(String amount) {
    return Intl.message(
      'This flat $amount per-transaction fee goes to the platform that securely processes your card payment. It is not charged by Foodly or the restaurant.',
      name: 'groupOrderServiceFeeExplain',
      desc: '',
      args: [amount],
    );
  }

  /// `Invite`
  String get groupOrderInviteCta {
    return Intl.message(
      'Invite',
      name: 'groupOrderInviteCta',
      desc: '',
      args: [],
    );
  }

  /// `Invite your table`
  String get groupOrderInviteTitle {
    return Intl.message(
      'Invite your table',
      name: 'groupOrderInviteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share this code — valid for 24 hours`
  String get groupOrderInviteHint {
    return Intl.message(
      'Share this code — valid for 24 hours',
      name: 'groupOrderInviteHint',
      desc: '',
      args: [],
    );
  }

  /// `Share code`
  String get groupOrderInviteShareCta {
    return Intl.message(
      'Share code',
      name: 'groupOrderInviteShareCta',
      desc: '',
      args: [],
    );
  }

  /// `Join our order at {business}! Open Foodly, go to the restaurant menu and use code {code}`
  String groupOrderInviteShareMsg(String business, String code) {
    return Intl.message(
      'Join our order at $business! Open Foodly, go to the restaurant menu and use code $code',
      name: 'groupOrderInviteShareMsg',
      desc: '',
      args: [business, code],
    );
  }

  /// `Scan your table's QR`
  String get groupOrderScanTitle {
    return Intl.message(
      'Scan your table\'s QR',
      name: 'groupOrderScanTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ask the host to show the order's QR code`
  String get groupOrderScanHint {
    return Intl.message(
      'Ask the host to show the order\'s QR code',
      name: 'groupOrderScanHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter code manually`
  String get groupOrderEnterCodeManually {
    return Intl.message(
      'Enter code manually',
      name: 'groupOrderEnterCodeManually',
      desc: '',
      args: [],
    );
  }

  /// `Delete order`
  String get groupOrderDeleteCta {
    return Intl.message(
      'Delete order',
      name: 'groupOrderDeleteCta',
      desc: '',
      args: [],
    );
  }

  /// `Delete this empty order? This action cannot be undone.`
  String get groupOrderDeleteConfirm {
    return Intl.message(
      'Delete this empty order? This action cannot be undone.',
      name: 'groupOrderDeleteConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Leave the order`
  String get groupOrderLeaveCta {
    return Intl.message(
      'Leave the order',
      name: 'groupOrderLeaveCta',
      desc: '',
      args: [],
    );
  }

  /// `Leave this order? You can rejoin by scanning the QR.`
  String get groupOrderLeaveConfirm {
    return Intl.message(
      'Leave this order? You can rejoin by scanning the QR.',
      name: 'groupOrderLeaveConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Order confirmed!`
  String get groupOrderPaymentSuccessTitle {
    return Intl.message(
      'Order confirmed!',
      name: 'groupOrderPaymentSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `All payments complete · {total}. Receipt sent to your email.`
  String groupOrderPaymentSuccessBody(String total) {
    return Intl.message(
      'All payments complete · $total. Receipt sent to your email.',
      name: 'groupOrderPaymentSuccessBody',
      desc: '',
      args: [total],
    );
  }

  /// `Back to menu`
  String get groupOrderBackToMenu {
    return Intl.message(
      'Back to menu',
      name: 'groupOrderBackToMenu',
      desc: '',
      args: [],
    );
  }

  /// `Finish the order and proceed to payment? You won't be able to add more items.`
  String get groupOrderLockConfirmSolo {
    return Intl.message(
      'Finish the order and proceed to payment? You won\'t be able to add more items.',
      name: 'groupOrderLockConfirmSolo',
      desc: '',
      args: [],
    );
  }

  /// `This item is split among everyone at the table`
  String get groupOrderSharedBadgeTooltip {
    return Intl.message(
      'This item is split among everyone at the table',
      name: 'groupOrderSharedBadgeTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Activate payments for your business`
  String get managerActivatePaymentsTitle {
    return Intl.message(
      'Activate payments for your business',
      name: 'managerActivatePaymentsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify your business with Stripe to receive order payments straight to your bank account. Takes ~5 minutes.`
  String get managerActivatePaymentsBody {
    return Intl.message(
      'Verify your business with Stripe to receive order payments straight to your bank account. Takes ~5 minutes.',
      name: 'managerActivatePaymentsBody',
      desc: '',
      args: [],
    );
  }

  /// `Activate with Stripe →`
  String get managerActivateWithStripe {
    return Intl.message(
      'Activate with Stripe →',
      name: 'managerActivateWithStripe',
      desc: '',
      args: [],
    );
  }

  /// `Payments active`
  String get managerPaymentsActive {
    return Intl.message(
      'Payments active',
      name: 'managerPaymentsActive',
      desc: '',
      args: [],
    );
  }

  /// `Verified with Stripe · payouts enabled`
  String get managerPaymentsActiveSub {
    return Intl.message(
      'Verified with Stripe · payouts enabled',
      name: 'managerPaymentsActiveSub',
      desc: '',
      args: [],
    );
  }

  /// `Refresh status`
  String get managerPaymentsRefresh {
    return Intl.message(
      'Refresh status',
      name: 'managerPaymentsRefresh',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't complete that action. Try again.`
  String get managerGenericError {
    return Intl.message(
      'We couldn\'t complete that action. Try again.',
      name: 'managerGenericError',
      desc: '',
      args: [],
    );
  }

  /// `Live orders`
  String get managerLiveOrders {
    return Intl.message(
      'Live orders',
      name: 'managerLiveOrders',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get managerOrders {
    return Intl.message('Orders', name: 'managerOrders', desc: '', args: []);
  }

  /// `All`
  String get managerBucketAll {
    return Intl.message('All', name: 'managerBucketAll', desc: '', args: []);
  }

  /// `Active`
  String get managerBucketPending {
    return Intl.message(
      'Active',
      name: 'managerBucketPending',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get managerBucketPreparing {
    return Intl.message(
      'Preparing',
      name: 'managerBucketPreparing',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get managerBucketReady {
    return Intl.message(
      'Ready',
      name: 'managerBucketReady',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get managerBucketDelivered {
    return Intl.message(
      'Delivered',
      name: 'managerBucketDelivered',
      desc: '',
      args: [],
    );
  }

  /// `CONFIRMED`
  String get managerBadgeConfirmed {
    return Intl.message(
      'CONFIRMED',
      name: 'managerBadgeConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `PREPARING`
  String get managerBadgePreparing {
    return Intl.message(
      'PREPARING',
      name: 'managerBadgePreparing',
      desc: '',
      args: [],
    );
  }

  /// `READY`
  String get managerBadgeReady {
    return Intl.message('READY', name: 'managerBadgeReady', desc: '', args: []);
  }

  /// `DELIVERED`
  String get managerBadgeDelivered {
    return Intl.message(
      'DELIVERED',
      name: 'managerBadgeDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Mark as PREPARING`
  String get managerMarkPreparing {
    return Intl.message(
      'Mark as PREPARING',
      name: 'managerMarkPreparing',
      desc: '',
      args: [],
    );
  }

  /// `Mark as READY`
  String get managerMarkReady {
    return Intl.message(
      'Mark as READY',
      name: 'managerMarkReady',
      desc: '',
      args: [],
    );
  }

  /// `Mark as DELIVERED`
  String get managerMarkDelivered {
    return Intl.message(
      'Mark as DELIVERED',
      name: 'managerMarkDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Deliver everything at once`
  String get managerDeliverAllAndClose {
    return Intl.message(
      'Deliver everything at once',
      name: 'managerDeliverAllAndClose',
      desc: '',
      args: [],
    );
  }

  /// `Check all`
  String get managerDeliverAll {
    return Intl.message(
      'Check all',
      name: 'managerDeliverAll',
      desc: '',
      args: [],
    );
  }

  /// `{delivered}/{total} items delivered`
  String managerItemsDelivered(int delivered, int total) {
    return Intl.message(
      '$delivered/$total items delivered',
      name: 'managerItemsDelivered',
      desc: '',
      args: [delivered, total],
    );
  }

  /// `ROUND {n}`
  String managerRound(int n) {
    return Intl.message('ROUND $n', name: 'managerRound', desc: '', args: [n]);
  }

  /// `Assign table`
  String get managerAssignTable {
    return Intl.message(
      'Assign table',
      name: 'managerAssignTable',
      desc: '',
      args: [],
    );
  }

  /// `E.g.: 7, Bar 2, Terrace`
  String get managerTableHint {
    return Intl.message(
      'E.g.: 7, Bar 2, Terrace',
      name: 'managerTableHint',
      desc: '',
      args: [],
    );
  }

  /// `{guests} guests · {items} items`
  String managerGuestsMeta(int guests, int items) {
    return Intl.message(
      '$guests guests · $items items',
      name: 'managerGuestsMeta',
      desc: '',
      args: [guests, items],
    );
  }

  /// `Fully paid`
  String get managerPaidComplete {
    return Intl.message(
      'Fully paid',
      name: 'managerPaidComplete',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get managerNoOrders {
    return Intl.message(
      'No orders yet',
      name: 'managerNoOrders',
      desc: '',
      args: [],
    );
  }

  /// `Showing {shown} of {total}. Clear these and the rest will move up.`
  String managerOrdersTruncated(int shown, int total) {
    return Intl.message(
      'Showing $shown of $total. Clear these and the rest will move up.',
      name: 'managerOrdersTruncated',
      desc: '',
      args: [shown, total],
    );
  }

  /// `You don't have access to that section`
  String get noAccessSection {
    return Intl.message(
      'You don\'t have access to that section',
      name: 'noAccessSection',
      desc: '',
      args: [],
    );
  }

  /// `Payments account set up`
  String get stripeBridgeReturnTitle {
    return Intl.message(
      'Payments account set up',
      name: 'stripeBridgeReturnTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can close this tab and go back to the Foodly app.`
  String get stripeBridgeReturnBody {
    return Intl.message(
      'You can close this tab and go back to the Foodly app.',
      name: 'stripeBridgeReturnBody',
      desc: '',
      args: [],
    );
  }

  /// `Setup incomplete`
  String get stripeBridgeRefreshTitle {
    return Intl.message(
      'Setup incomplete',
      name: 'stripeBridgeRefreshTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resume activation from the app: Orders → Activate payments with Stripe.`
  String get stripeBridgeRefreshBody {
    return Intl.message(
      'Resume activation from the app: Orders → Activate payments with Stripe.',
      name: 'stripeBridgeRefreshBody',
      desc: '',
      args: [],
    );
  }

  /// `Tap each item to mark it as delivered`
  String get managerChecklistHint {
    return Intl.message(
      'Tap each item to mark it as delivered',
      name: 'managerChecklistHint',
      desc: '',
      args: [],
    );
  }

  /// `UNPAID`
  String get managerUnpaidBadge {
    return Intl.message(
      'UNPAID',
      name: 'managerUnpaidBadge',
      desc: '',
      args: [],
    );
  }

  /// `Don't charge`
  String get managerVoidItemCta {
    return Intl.message(
      'Don\'t charge',
      name: 'managerVoidItemCta',
      desc: '',
      args: [],
    );
  }

  /// `REMOVED · not charged`
  String get managerVoidedItemTag {
    return Intl.message(
      'REMOVED · not charged',
      name: 'managerVoidedItemTag',
      desc: '',
      args: [],
    );
  }

  /// `Remove "{item}" from the bill? It stays visible to the guest, marked as removed by the business.`
  String managerVoidItemConfirm(String item) {
    return Intl.message(
      'Remove "$item" from the bill? It stays visible to the guest, marked as removed by the business.',
      name: 'managerVoidItemConfirm',
      desc: '',
      args: [item],
    );
  }

  /// `Removed by the business · not charged`
  String get groupOrderItemVoided {
    return Intl.message(
      'Removed by the business · not charged',
      name: 'groupOrderItemVoided',
      desc: '',
      args: [],
    );
  }

  /// `BATCH {n}`
  String managerBatchLabel(int n) {
    return Intl.message(
      'BATCH $n',
      name: 'managerBatchLabel',
      desc: '',
      args: [n],
    );
  }

  /// `How does your business charge?`
  String get paymentModeTitle {
    return Intl.message(
      'How does your business charge?',
      name: 'paymentModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can change this anytime from your panel`
  String get paymentModeSubtitle {
    return Intl.message(
      'You can change this anytime from your panel',
      name: 'paymentModeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Open tab`
  String get paymentModeOpenTabTitle {
    return Intl.message(
      'Open tab',
      name: 'paymentModeOpenTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `The table orders in batches and pays ONCE at the end. Ideal for table-service restaurants.`
  String get paymentModeOpenTabBody {
    return Intl.message(
      'The table orders in batches and pays ONCE at the end. Ideal for table-service restaurants.',
      name: 'paymentModeOpenTabBody',
      desc: '',
      args: [],
    );
  }

  /// `order → eat → pay`
  String get paymentModeOpenTabFlow {
    return Intl.message(
      'order → eat → pay',
      name: 'paymentModeOpenTabFlow',
      desc: '',
      args: [],
    );
  }

  /// `Prepaid per round`
  String get paymentModePerRoundTitle {
    return Intl.message(
      'Prepaid per round',
      name: 'paymentModePerRoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `Each order is paid before it's prepared. Ideal for bars, food trucks and counters.`
  String get paymentModePerRoundBody {
    return Intl.message(
      'Each order is paid before it\'s prepared. Ideal for bars, food trucks and counters.',
      name: 'paymentModePerRoundBody',
      desc: '',
      args: [],
    );
  }

  /// `order → pay → deliver`
  String get paymentModePerRoundFlow {
    return Intl.message(
      'order → pay → deliver',
      name: 'paymentModePerRoundFlow',
      desc: '',
      args: [],
    );
  }

  /// `Charging mode updated`
  String get paymentModeUpdated {
    return Intl.message(
      'Charging mode updated',
      name: 'paymentModeUpdated',
      desc: '',
      args: [],
    );
  }

  /// `New order!`
  String get managerNewOrderTitle {
    return Intl.message(
      'New order!',
      name: 'managerNewOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Go handle it`
  String get managerNewOrderGo {
    return Intl.message(
      'Go handle it',
      name: 'managerNewOrderGo',
      desc: '',
      args: [],
    );
  }

  /// `Not now`
  String get managerNewOrderLater {
    return Intl.message(
      'Not now',
      name: 'managerNewOrderLater',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get managerHistoryTitle {
    return Intl.message(
      'History',
      name: 'managerHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get managerHistoryYesterday {
    return Intl.message(
      'Yesterday',
      name: 'managerHistoryYesterday',
      desc: '',
      args: [],
    );
  }

  /// `No past orders yet`
  String get managerHistoryEmpty {
    return Intl.message(
      'No past orders yet',
      name: 'managerHistoryEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Fix the closure`
  String get managerAmendTitle {
    return Intl.message(
      'Fix the closure',
      name: 'managerAmendTitle',
      desc: '',
      args: [],
    );
  }

  /// `It was paid, at the counter`
  String get managerAmendToPaidOffline {
    return Intl.message(
      'It was paid, at the counter',
      name: 'managerAmendToPaidOffline',
      desc: '',
      args: [],
    );
  }

  /// `It was never paid`
  String get managerAmendToUnpaid {
    return Intl.message(
      'It was never paid',
      name: 'managerAmendToUnpaid',
      desc: '',
      args: [],
    );
  }

  /// `Foodly didn't process this money — fixing it only changes your own record.`
  String get managerAmendHint {
    return Intl.message(
      'Foodly didn\'t process this money — fixing it only changes your own record.',
      name: 'managerAmendHint',
      desc: '',
      args: [],
    );
  }

  /// `Closure updated`
  String get managerAmendDone {
    return Intl.message(
      'Closure updated',
      name: 'managerAmendDone',
      desc: '',
      args: [],
    );
  }

  /// `Closed order — read only`
  String get managerHistoryReadOnly {
    return Intl.message(
      'Closed order — read only',
      name: 'managerHistoryReadOnly',
      desc: '',
      args: [],
    );
  }

  /// `{count} orders · {total}`
  String managerHistoryDaySummary(int count, String total) {
    return Intl.message(
      '$count orders · $total',
      name: 'managerHistoryDaySummary',
      desc: '',
      args: [count, total],
    );
  }

  /// `Order sent`
  String get groupOrderChipSent {
    return Intl.message(
      'Order sent',
      name: 'groupOrderChipSent',
      desc: '',
      args: [],
    );
  }

  /// `Preparing your order`
  String get groupOrderChipPreparing {
    return Intl.message(
      'Preparing your order',
      name: 'groupOrderChipPreparing',
      desc: '',
      args: [],
    );
  }

  /// `Your order is ready!`
  String get groupOrderChipReady {
    return Intl.message(
      'Your order is ready!',
      name: 'groupOrderChipReady',
      desc: '',
      args: [],
    );
  }

  /// `Pay the bill · {amount}`
  String groupOrderChipToPay(String amount) {
    return Intl.message(
      'Pay the bill · $amount',
      name: 'groupOrderChipToPay',
      desc: '',
      args: [amount],
    );
  }

  /// `Send order`
  String get groupOrderSendCta {
    return Intl.message(
      'Send order',
      name: 'groupOrderSendCta',
      desc: '',
      args: [],
    );
  }

  /// `The kitchen gets it right away · you pay at the end`
  String get groupOrderSendHint {
    return Intl.message(
      'The kitchen gets it right away · you pay at the end',
      name: 'groupOrderSendHint',
      desc: '',
      args: [],
    );
  }

  /// `Payment unlocks once everything is served`
  String get groupOrderPayBlockedHint {
    return Intl.message(
      'Payment unlocks once everything is served',
      name: 'groupOrderPayBlockedHint',
      desc: '',
      args: [],
    );
  }

  /// `Pay the bill · {amount}`
  String groupOrderPayBillCta(String amount) {
    return Intl.message(
      'Pay the bill · $amount',
      name: 'groupOrderPayBillCta',
      desc: '',
      args: [amount],
    );
  }

  /// `You can split it with the table however you like`
  String get groupOrderPayBillHint {
    return Intl.message(
      'You can split it with the table however you like',
      name: 'groupOrderPayBillHint',
      desc: '',
      args: [],
    );
  }

  /// `Ask for the bill? You won't be able to add more items to this order.`
  String get groupOrderRequestBillConfirm {
    return Intl.message(
      'Ask for the bill? You won\'t be able to add more items to this order.',
      name: 'groupOrderRequestBillConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Order sent to the kitchen!`
  String get groupOrderBatchSentTitle {
    return Intl.message(
      'Order sent to the kitchen!',
      name: 'groupOrderBatchSentTitle',
      desc: '',
      args: [],
    );
  }

  /// `{business} is already preparing it. Keep ordering — you pay it all at the end.`
  String groupOrderBatchSentBody(String business) {
    return Intl.message(
      '$business is already preparing it. Keep ordering — you pay it all at the end.',
      name: 'groupOrderBatchSentBody',
      desc: '',
      args: [business],
    );
  }

  /// `Order more`
  String get groupOrderOrderMore {
    return Intl.message(
      'Order more',
      name: 'groupOrderOrderMore',
      desc: '',
      args: [],
    );
  }

  /// `See order status`
  String get groupOrderSeeStatus {
    return Intl.message(
      'See order status',
      name: 'groupOrderSeeStatus',
      desc: '',
      args: [],
    );
  }

  /// `The business got your order`
  String get groupOrderTrackConfirmed {
    return Intl.message(
      'The business got your order',
      name: 'groupOrderTrackConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Your order is being prepared`
  String get groupOrderTrackPreparing {
    return Intl.message(
      'Your order is being prepared',
      name: 'groupOrderTrackPreparing',
      desc: '',
      args: [],
    );
  }

  /// `Your order is ready!`
  String get groupOrderTrackReady {
    return Intl.message(
      'Your order is ready!',
      name: 'groupOrderTrackReady',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered — enjoy!`
  String get groupOrderTrackDelivered {
    return Intl.message(
      'Order delivered — enjoy!',
      name: 'groupOrderTrackDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Order another round`
  String get groupOrderNextRound {
    return Intl.message(
      'Order another round',
      name: 'groupOrderNextRound',
      desc: '',
      args: [],
    );
  }

  /// `Pay the order · {amount}`
  String groupOrderPayFullOrder(String amount) {
    return Intl.message(
      'Pay the order · $amount',
      name: 'groupOrderPayFullOrder',
      desc: '',
      args: [amount],
    );
  }

  /// `Back to home`
  String get groupOrderBackHome {
    return Intl.message(
      'Back to home',
      name: 'groupOrderBackHome',
      desc: '',
      args: [],
    );
  }

  /// `Got invited? Join with a code`
  String get groupOrderJoinCta {
    return Intl.message(
      'Got invited? Join with a code',
      name: 'groupOrderJoinCta',
      desc: '',
      args: [],
    );
  }

  /// `Join an order`
  String get groupOrderJoinTitle {
    return Intl.message(
      'Join an order',
      name: 'groupOrderJoinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code`
  String get groupOrderJoinHint {
    return Intl.message(
      'Invitation code',
      name: 'groupOrderJoinHint',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't add you to the order`
  String get groupOrderJoinFailed {
    return Intl.message(
      'We couldn\'t add you to the order',
      name: 'groupOrderJoinFailed',
      desc: '',
      args: [],
    );
  }

  /// `Active group order`
  String get groupOrderOngoingChannelName {
    return Intl.message(
      'Active group order',
      name: 'groupOrderOngoingChannelName',
      desc: '',
      args: [],
    );
  }

  /// `Status of your ongoing group order`
  String get groupOrderOngoingChannelDesc {
    return Intl.message(
      'Status of your ongoing group order',
      name: 'groupOrderOngoingChannelDesc',
      desc: '',
      args: [],
    );
  }

  /// `Your payment: {base} + {fee} processing fee`
  String groupOrderTipBaseSummary(String base, String fee) {
    return Intl.message(
      'Your payment: $base + $fee processing fee',
      name: 'groupOrderTipBaseSummary',
      desc: '',
      args: [base, fee],
    );
  }

  /// `Log in or sign up to start a group order.`
  String get guestGateGroupOrder {
    return Intl.message(
      'Log in or sign up to start a group order.',
      name: 'guestGateGroupOrder',
      desc: '',
      args: [],
    );
  }

  /// `Tab closed!`
  String get groupOrderTabClosedTitle {
    return Intl.message(
      'Tab closed!',
      name: 'groupOrderTabClosedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bill settled · {total}. Receipt sent to your email.`
  String groupOrderTabClosedBody(String total) {
    return Intl.message(
      'Bill settled · $total. Receipt sent to your email.',
      name: 'groupOrderTabClosedBody',
      desc: '',
      args: [total],
    );
  }

  /// `Open another tab`
  String get groupOrderNewTab {
    return Intl.message(
      'Open another tab',
      name: 'groupOrderNewTab',
      desc: '',
      args: [],
    );
  }

  /// `The table ordered more`
  String get managerMoreItemsTitle {
    return Intl.message(
      'The table ordered more',
      name: 'managerMoreItemsTitle',
      desc: '',
      args: [],
    );
  }

  /// `New paid order!`
  String get managerPaidOrderTitle {
    return Intl.message(
      'New paid order!',
      name: 'managerPaidOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tab closed`
  String get managerTabClosedTitle {
    return Intl.message(
      'Tab closed',
      name: 'managerTabClosedTitle',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get managerViewOrderGo {
    return Intl.message(
      'View details',
      name: 'managerViewOrderGo',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts in a row. Try again in a moment.`
  String get tooManyAttempts {
    return Intl.message(
      'Too many attempts in a row. Try again in a moment.',
      name: 'tooManyAttempts',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts in a row. Try again in {seconds}s.`
  String tooManyAttemptsIn(int seconds) {
    return Intl.message(
      'Too many attempts in a row. Try again in ${seconds}s.',
      name: 'tooManyAttemptsIn',
      desc: '',
      args: [seconds],
    );
  }

  /// `Close tab`
  String get managerCloseTab {
    return Intl.message(
      'Close tab',
      name: 'managerCloseTab',
      desc: '',
      args: [],
    );
  }

  /// `Close this tab`
  String get managerCloseTabTitle {
    return Intl.message(
      'Close this tab',
      name: 'managerCloseTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `The table ordered {total}. Foodly didn't process this payment, so there's no commission.`
  String managerCloseTabBody(String total) {
    return Intl.message(
      'The table ordered $total. Foodly didn\'t process this payment, so there\'s no commission.',
      name: 'managerCloseTabBody',
      desc: '',
      args: [total],
    );
  }

  /// `Paid at the counter`
  String get managerCloseTabPaidOffline {
    return Intl.message(
      'Paid at the counter',
      name: 'managerCloseTabPaidOffline',
      desc: '',
      args: [],
    );
  }

  /// `They left without paying`
  String get managerCloseTabUnpaid {
    return Intl.message(
      'They left without paying',
      name: 'managerCloseTabUnpaid',
      desc: '',
      args: [],
    );
  }

  /// `Paid at counter`
  String get managerClosedPaidOffline {
    return Intl.message(
      'Paid at counter',
      name: 'managerClosedPaidOffline',
      desc: '',
      args: [],
    );
  }

  /// `I collected the rest in person`
  String get managerCloseTabPartiallyPaid {
    return Intl.message(
      'I collected the rest in person',
      name: 'managerCloseTabPartiallyPaid',
      desc: '',
      args: [],
    );
  }

  /// `PART IN PERSON`
  String get managerClosedPartiallyPaid {
    return Intl.message(
      'PART IN PERSON',
      name: 'managerClosedPartiallyPaid',
      desc: '',
      args: [],
    );
  }

  /// `{paid} was already collected in the app. {remaining} left for you to collect in person.`
  String managerCloseTabAlreadyPaid(String paid, String remaining) {
    return Intl.message(
      '$paid was already collected in the app. $remaining left for you to collect in person.',
      name: 'managerCloseTabAlreadyPaid',
      desc: '',
      args: [paid, remaining],
    );
  }

  /// `Unpaid`
  String get managerClosedUnpaid {
    return Intl.message(
      'Unpaid',
      name: 'managerClosedUnpaid',
      desc: '',
      args: [],
    );
  }

  /// `Never closed`
  String get managerClosedAbandoned {
    return Intl.message(
      'Never closed',
      name: 'managerClosedAbandoned',
      desc: '',
      args: [],
    );
  }

  /// `All served — the bill is still open`
  String get groupOrderTrackToPay {
    return Intl.message(
      'All served — the bill is still open',
      name: 'groupOrderTrackToPay',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't generate the invite code`
  String get groupOrderInviteFailed {
    return Intl.message(
      'We couldn\'t generate the invite code',
      name: 'groupOrderInviteFailed',
      desc: '',
      args: [],
    );
  }

  /// `Pay at the counter`
  String get groupOrderPayAtRegister {
    return Intl.message(
      'Pay at the counter',
      name: 'groupOrderPayAtRegister',
      desc: '',
      args: [],
    );
  }

  /// `We'll let the venue know and you pay at the counter. No Foodly fee.`
  String get groupOrderPayAtRegisterHint {
    return Intl.message(
      'We\'ll let the venue know and you pay at the counter. No Foodly fee.',
      name: 'groupOrderPayAtRegisterHint',
      desc: '',
      args: [],
    );
  }

  /// `The venue has been notified`
  String get groupOrderCashRequestedCta {
    return Intl.message(
      'The venue has been notified',
      name: 'groupOrderCashRequestedCta',
      desc: '',
      args: [],
    );
  }

  /// `Head to the counter to pay. Staff will confirm once they receive it.`
  String get groupOrderCashRequestedHint {
    return Intl.message(
      'Head to the counter to pay. Staff will confirm once they receive it.',
      name: 'groupOrderCashRequestedHint',
      desc: '',
      args: [],
    );
  }

  /// `I'd rather pay in the app`
  String get groupOrderCashRequestUndo {
    return Intl.message(
      'I\'d rather pay in the app',
      name: 'groupOrderCashRequestUndo',
      desc: '',
      args: [],
    );
  }

  /// `Let the venue know you're paying at the counter? You won't be able to add more items to this order.`
  String get groupOrderPayAtRegisterConfirm {
    return Intl.message(
      'Let the venue know you\'re paying at the counter? You won\'t be able to add more items to this order.',
      name: 'groupOrderPayAtRegisterConfirm',
      desc: '',
      args: [],
    );
  }

  /// `PAYING AT COUNTER`
  String get managerAwaitingCashBadge {
    return Intl.message(
      'PAYING AT COUNTER',
      name: 'managerAwaitingCashBadge',
      desc: '',
      args: [],
    );
  }

  /// `The table said they're paying at the counter. Confirm once you receive the money.`
  String get managerAwaitingCashNotice {
    return Intl.message(
      'The table said they\'re paying at the counter. Confirm once you receive the money.',
      name: 'managerAwaitingCashNotice',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
