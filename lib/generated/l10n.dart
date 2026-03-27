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

  /// `Add a photo`
  String get addPhoto {
    return Intl.message('Add a photo', name: 'addPhoto', desc: '', args: []);
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

  /// `The session has expired, you must log in with your username and password, or access via your preferred social network.`
  String get biometricSnackbarTextSpanB {
    return Intl.message(
      'The session has expired, you must log in with your username and password, or access via your preferred social network.',
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

  /// `Pubs and Wine Bars`
  String get pubsAndWineBars {
    return Intl.message(
      'Pubs and Wine Bars',
      name: 'pubsAndWineBars',
      desc: '',
      args: [],
    );
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

  /// `Foodly is free to use — for businesses and customers alike. In the future, a small commission on in-app orders will be the only cost. No subscriptions, no hidden fees.`
  String get aboutFree {
    return Intl.message(
      'Foodly is free to use — for businesses and customers alike. In the future, a small commission on in-app orders will be the only cost. No subscriptions, no hidden fees.',
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

  /// `App Guide — Coming Soon`
  String get aboutVideoPlaceholder {
    return Intl.message(
      'App Guide — Coming Soon',
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
