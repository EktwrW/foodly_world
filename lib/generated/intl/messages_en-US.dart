// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(count) =>
      "Generates title (max 36 chars), subtitle (max 99) and description (max 369) for your promotion. You have ${count} uses left this month.";

  static String m1(limit) =>
      "You have used all ${limit} AI-generated promotions for this month. Your quota will reset on the 1st of next month.";

  static String m2(businessName) => "New activity at ${businessName}";

  static String m3(businessName) =>
      "The menu at ${businessName} is getting attention!";

  static String m4(businessName) => "A dish at ${businessName} is trending!";

  static String m5(entityName, businessName) =>
      "\"${entityName}\" at ${businessName} is trending!";

  static String m6(entityName, businessName) =>
      "\"${entityName}\" at ${businessName} is getting attention!";

  static String m7(businessName) =>
      "A promotion at ${businessName} is popular!";

  static String m8(entityName, businessName) =>
      "\"${entityName}\" at ${businessName} is popular!";

  static String m9(businessName) => "${businessName} has a new follower!";

  static String m10(businessName) =>
      "${businessName} just posted a new promotion!";

  static String m11(businessName) => "New review at ${businessName}!";

  static String m12(businessName) => "${businessName} updated a promotion";

  static String m13(currentLabel) => "Rename \"${currentLabel}\" section";

  static String m14(year) => "Copyright © ${year} - All rights reserved";

  static String m15(businessName) => "Edit your review for ${businessName}";

  static String m16(phone) => "Enter the code sent to ${phone}";

  static String m17(errorMsg) => "Failed to delete item photos:\n\n${errorMsg}";

  static String m18(size) => "max ${size}";

  static String m19(maxSize) => "Max Size: ${maxSize}";

  static String m20(radius) =>
      "No nearby businesses in this category within ${radius} km.";

  static String m21(text) => "Notes: ${text}";

  static String m22(count) => "Party size: ${count}";

  static String m23(count) => "You have ${count} pending reservations";

  static String m24(action, errorMsg) =>
      "Something went wrong when ${action} the item photo(s): ${errorMsg}";

  static String m25(maxImages) =>
      "Press to add photos, up to a maximum of ${maxImages} images";

  static String m26(seconds) => "Resend in ${seconds}s";

  static String m27(businessName) => "Reserve a table at ${businessName}";

  static String m28(city) => "Search in ${city}...";

  static String m29(businessName, appName, menuUrl) =>
      "🍽️ Check out ${businessName}\'s menu on 🌟 ${appName}: \n${menuUrl}";

  static String m30(text) => "Special requests: ${text}";

  static String m31(count) => "${count}d ago";

  static String m32(count) => "${count}h ago";

  static String m33(count) => "${count}m ago";

  static String m34(date) => "Visited on ${date}";

  static String m35(businessName) => "Write a review for ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "aboutEvolving": MessageLookupByLibrary.simpleMessage(
      "We\'re just getting started. Foodly is designed to evolve alongside the businesses and communities it serves. Your feedback shapes what comes next.",
    ),
    "aboutEvolvingTitle": MessageLookupByLibrary.simpleMessage(
      "Built to Evolve",
    ),
    "aboutForBusiness": MessageLookupByLibrary.simpleMessage(
      "Showcase your menu, launch promotions, manage reservations, build a loyal following, and let your customers discover you naturally — all from one place, at no cost.\n\nFoodly grows with you. Metrics, insights, and in-app ordering are coming soon.",
    ),
    "aboutForBusinessTitle": MessageLookupByLibrary.simpleMessage(
      "For Businesses",
    ),
    "aboutForCustomers": MessageLookupByLibrary.simpleMessage(
      "Explore what\'s nearby, find new favorites, save the best promotions, reserve a table in seconds, and support the businesses that make your city unique.",
    ),
    "aboutForCustomersTitle": MessageLookupByLibrary.simpleMessage(
      "For Customers",
    ),
    "aboutFree": MessageLookupByLibrary.simpleMessage(
      "Foodly is free to use — for businesses and customers alike. In the future, a small commission on in-app orders will be the only cost. No subscriptions, no hidden fees.",
    ),
    "aboutFreeTitle": MessageLookupByLibrary.simpleMessage("Free for Everyone"),
    "aboutMission": MessageLookupByLibrary.simpleMessage(
      "Foodly was born from a simple belief: every business — whether a family kitchen, a growing franchise, or a neighborhood bakery — deserves powerful tools to connect with its community.\n\nWe\'re building the bridge between businesses and the people who love what they offer.",
    ),
    "aboutMissionTitle": MessageLookupByLibrary.simpleMessage("Why Foodly?"),
    "aboutTagline": MessageLookupByLibrary.simpleMessage(
      "Where every flavor finds its audience.",
    ),
    "aboutVideoPlaceholder": MessageLookupByLibrary.simpleMessage(
      "App Guide — Coming Soon",
    ),
    "accessiblePMR": MessageLookupByLibrary.simpleMessage("Accessible PMR"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "addADescription": MessageLookupByLibrary.simpleMessage(
      "Add a description",
    ),
    "addANewTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Add a new time period",
    ),
    "addAdditionalInformation": MessageLookupByLibrary.simpleMessage(
      "Add additional information",
    ),
    "addContact": MessageLookupByLibrary.simpleMessage("Add contact channels"),
    "addName": MessageLookupByLibrary.simpleMessage("Add a name"),
    "addNewCategory": MessageLookupByLibrary.simpleMessage(
      "Add a new category",
    ),
    "addNewItem": MessageLookupByLibrary.simpleMessage("Add New Item"),
    "addNoteOptional": MessageLookupByLibrary.simpleMessage(
      "Add a note (optional)",
    ),
    "addOpeningHours": MessageLookupByLibrary.simpleMessage(
      "Add Opening Hours",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Add a photo"),
    "addServices": MessageLookupByLibrary.simpleMessage("Add Services"),
    "addTagline": MessageLookupByLibrary.simpleMessage("Add a catchy tagline"),
    "addTitle": MessageLookupByLibrary.simpleMessage("Add a title"),
    "addToCalendar": MessageLookupByLibrary.simpleMessage("Add to calendar"),
    "addToFavorites": MessageLookupByLibrary.simpleMessage(
      "Add to your favorites",
    ),
    "addYoutubeUrl": MessageLookupByLibrary.simpleMessage("Add YouTube URL"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "admin": MessageLookupByLibrary.simpleMessage("Administrator"),
    "aiPromoContent": m0,
    "aiPromoGenerate": MessageLookupByLibrary.simpleMessage("Generate"),
    "aiPromoImageLabel": MessageLookupByLibrary.simpleMessage(
      "Include promotional image (16:9)",
    ),
    "aiPromoImageNatural": MessageLookupByLibrary.simpleMessage("Natural"),
    "aiPromoImageVivid": MessageLookupByLibrary.simpleMessage("Vivid"),
    "aiPromoQuotaExhaustedContent": m1,
    "aiPromoQuotaExhaustedTitle": MessageLookupByLibrary.simpleMessage(
      "Monthly Quota Reached",
    ),
    "aiPromoTitle": MessageLookupByLibrary.simpleMessage(
      "AI Promotion Generator",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allowReservations": MessageLookupByLibrary.simpleMessage(
      "Allow Reservations",
    ),
    "alphabetical": MessageLookupByLibrary.simpleMessage("A-Z"),
    "alreadyReviewedPrompt": MessageLookupByLibrary.simpleMessage(
      "You already reviewed this business.\nWould you like to edit your review?",
    ),
    "analytics": MessageLookupByLibrary.simpleMessage("Analytics"),
    "analyticsComingSoon": MessageLookupByLibrary.simpleMessage(
      "Analytics Dashboard — Coming Soon\nGet deep insights into your traffic, top dishes, customer trends, and revenue — all in one place. Stay tuned.",
    ),
    "analyticsTitle": MessageLookupByLibrary.simpleMessage("Analytics"),
    "and": MessageLookupByLibrary.simpleMessage("and"),
    "andCreateContentToThese": MessageLookupByLibrary.simpleMessage(
      "and manage content, promotions, and more",
    ),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "areYouSureCancelReservation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this reservation?",
    ),
    "argentinian": MessageLookupByLibrary.simpleMessage("Argentinian"),
    "asian": MessageLookupByLibrary.simpleMessage("Asian"),
    "askRecommendationsByTextSmart": MessageLookupByLibrary.simpleMessage(
      "Ask for smart text recommendations",
    ),
    "askRecommendationsByYourVoice": MessageLookupByLibrary.simpleMessage(
      "Ask for recommendations using your voice",
    ),
    "at": MessageLookupByLibrary.simpleMessage("at"),
    "attachVideo": MessageLookupByLibrary.simpleMessage("Attach video"),
    "audioNotUnderstood": MessageLookupByLibrary.simpleMessage(
      "Could not understand audio. Please try again.",
    ),
    "audioProcessingError": MessageLookupByLibrary.simpleMessage(
      "Error processing audio. Please try again.",
    ),
    "avgRating": MessageLookupByLibrary.simpleMessage("Avg. rating"),
    "babyChangingStation": MessageLookupByLibrary.simpleMessage(
      "Baby Changing Station",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "bakeryAndDesserts": MessageLookupByLibrary.simpleMessage(
      "Bakery and Desserts",
    ),
    "big": MessageLookupByLibrary.simpleMessage("Big"),
    "biometricSnackbarTextSpanA": MessageLookupByLibrary.simpleMessage(
      "This device\'s operating system does not support or has not configured biometric or pattern accesses.",
    ),
    "biometricSnackbarTextSpanB": MessageLookupByLibrary.simpleMessage(
      "The session has expired, you must log in with your username and password, or access via your preferred social network.",
    ),
    "brands": MessageLookupByLibrary.simpleMessage("brands"),
    "business": MessageLookupByLibrary.simpleMessage("Business"),
    "businessAccountUpgradeInfo": MessageLookupByLibrary.simpleMessage(
      "We\'ll redirect you to the business registration form. Your submission will be reviewed for platform verification. Please note that creating false businesses, misappropriation, or impersonation of brands and establishments may result in legal consequences.",
    ),
    "businessCategory": MessageLookupByLibrary.simpleMessage(
      "Business Category",
    ),
    "businessDisclaimer": MessageLookupByLibrary.simpleMessage(
      "acts only as a display platform. Prices, availability, content and quality of products, as well as nutritional and allergen information in this menu, are the sole responsibility of the business establishment. Foodly is not responsible for any discrepancies, inaccuracies or changes in the information provided by the business.",
    ),
    "businessInfoNote": MessageLookupByLibrary.simpleMessage(
      "Note about business information:",
    ),
    "businessInformationNotFound": MessageLookupByLibrary.simpleMessage(
      "Business information not found",
    ),
    "businessName": MessageLookupByLibrary.simpleMessage("Business Name"),
    "businessRegister": MessageLookupByLibrary.simpleMessage(
      "Register Business",
    ),
    "businesses": MessageLookupByLibrary.simpleMessage("businesses"),
    "buzz": MessageLookupByLibrary.simpleMessage("Buzz"),
    "buzzDefaultActivity": m2,
    "buzzEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Community activity will appear here",
    ),
    "buzzEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "No buzz nearby yet",
    ),
    "buzzNewFavoriteMenu": m3,
    "buzzNewFavoriteMenuItem": m4,
    "buzzNewFavoriteMenuItemNamed": m5,
    "buzzNewFavoriteMenuNamed": m6,
    "buzzNewFavoritePromotion": m7,
    "buzzNewFavoritePromotionNamed": m8,
    "buzzNewFollower": m9,
    "buzzNewPromotion": m10,
    "buzzNewReview": m11,
    "buzzPromotionUpdate": m12,
    "cafesAndBreakfasts": MessageLookupByLibrary.simpleMessage(
      "Cafés and Breakfasts",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "canNotContainSpecialCharactersBut_": MessageLookupByLibrary.simpleMessage(
      "Cannot contain spaces or special characters except \'_\'",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelEdit": MessageLookupByLibrary.simpleMessage("Cancel Edit"),
    "cancelReservation": MessageLookupByLibrary.simpleMessage(
      "Cancel Reservation",
    ),
    "cancelReservationConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this reservation?",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "cannotUndone": MessageLookupByLibrary.simpleMessage(
      "\nThis action cannot be undone.",
    ),
    "categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "categoryDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Category deleted successfully",
    ),
    "categoryNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Category name can not be empty",
    ),
    "categoryTitleUpdated": MessageLookupByLibrary.simpleMessage(
      "Category Title updated successfully",
    ),
    "catering": MessageLookupByLibrary.simpleMessage("Catering"),
    "changeLocation": MessageLookupByLibrary.simpleMessage("Change Location"),
    "changeSearchPoint": MessageLookupByLibrary.simpleMessage(
      "Change the search point for recommendations",
    ),
    "changeUsername": MessageLookupByLibrary.simpleMessage("Change username"),
    "checkBackLater": MessageLookupByLibrary.simpleMessage("Check back soon!"),
    "checkingLocation": MessageLookupByLibrary.simpleMessage(
      "Checking location...",
    ),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "clear": MessageLookupByLibrary.simpleMessage("Clear"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "closed": MessageLookupByLibrary.simpleMessage("Closed"),
    "combos": MessageLookupByLibrary.simpleMessage("Combos"),
    "combosLabelCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "combosLabelHint": MessageLookupByLibrary.simpleMessage(
      "Pick or create the label that best fits your business",
    ),
    "combosLabelMenus": MessageLookupByLibrary.simpleMessage("Menus"),
    "combosLabelPlatters": MessageLookupByLibrary.simpleMessage("Platters"),
    "combosLabelSetMeals": MessageLookupByLibrary.simpleMessage("Set Meals"),
    "combosLabelSpecials": MessageLookupByLibrary.simpleMessage("Specials"),
    "combosLabelTitle": m13,
    "complete": MessageLookupByLibrary.simpleMessage("Complete"),
    "completeSignUp": MessageLookupByLibrary.simpleMessage(
      "Complete Registration",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "composure": MessageLookupByLibrary.simpleMessage("Composure"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPhoneForVerification": MessageLookupByLibrary.simpleMessage(
      "Confirm the phone number to receive your verification code.",
    ),
    "confirmed": MessageLookupByLibrary.simpleMessage("Confirmed"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Connection error. Check your internet connection and try again.",
    ),
    "contactAdmin": MessageLookupByLibrary.simpleMessage(
      "An error occurred, please contact admin.",
    ),
    "contactAttachImage": MessageLookupByLibrary.simpleMessage(
      "Attach image (optional, max 3 MB)",
    ),
    "contactEmail": MessageLookupByLibrary.simpleMessage("Contact Email"),
    "contactFileTooLarge": MessageLookupByLibrary.simpleMessage(
      "The image must be less than 3 MB",
    ),
    "contactImageAttached": MessageLookupByLibrary.simpleMessage(
      "Image attached",
    ),
    "contactMessageHint": MessageLookupByLibrary.simpleMessage(
      "Write your message here...",
    ),
    "contactNumber": MessageLookupByLibrary.simpleMessage("Contact Number"),
    "contactPrivacyNotice": MessageLookupByLibrary.simpleMessage(
      "Only visible to you and businesses where you have an active reservation.",
    ),
    "contactRecipientHello": MessageLookupByLibrary.simpleMessage(
      "General Inquiries",
    ),
    "contactRecipientPrivacy": MessageLookupByLibrary.simpleMessage(
      "Privacy & Data",
    ),
    "contactRemoveImage": MessageLookupByLibrary.simpleMessage("Remove"),
    "contactSelectRecipient": MessageLookupByLibrary.simpleMessage(
      "Select recipient",
    ),
    "contactSentSuccess": MessageLookupByLibrary.simpleMessage(
      "Your message has been sent successfully!",
    ),
    "contactSubjectHint": MessageLookupByLibrary.simpleMessage(
      "Subject of your message",
    ),
    "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "conversionFunnel": MessageLookupByLibrary.simpleMessage(
      "Conversion funnel",
    ),
    "cookingSchools": MessageLookupByLibrary.simpleMessage("Cooking Schools"),
    "copyrightText": m14,
    "couldNotLoadAnalytics": MessageLookupByLibrary.simpleMessage(
      "Could not load analytics",
    ),
    "couldNotLoadNewReleases": MessageLookupByLibrary.simpleMessage(
      "Could not load new openings",
    ),
    "couldNotLoadProfile": MessageLookupByLibrary.simpleMessage(
      "Could not load profile",
    ),
    "couldNotLoadPromotions": MessageLookupByLibrary.simpleMessage(
      "Could not load promotions",
    ),
    "couldNotLoadReservationDetails": MessageLookupByLibrary.simpleMessage(
      "Could not load reservation details.",
    ),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "countryArgentina": MessageLookupByLibrary.simpleMessage("Argentina"),
    "countryEcuador": MessageLookupByLibrary.simpleMessage("Ecuador"),
    "countryElSalvador": MessageLookupByLibrary.simpleMessage("El Salvador"),
    "countryPortugal": MessageLookupByLibrary.simpleMessage("Portugal"),
    "countrySpain": MessageLookupByLibrary.simpleMessage("Spain"),
    "countryUsa": MessageLookupByLibrary.simpleMessage("USA"),
    "countryVenezuela": MessageLookupByLibrary.simpleMessage("Venezuela"),
    "coverImagesSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
      "Cover Images successfully updated!",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "createNewPromotion": MessageLookupByLibrary.simpleMessage(
      "Create new promotion",
    ),
    "createPostTitle": MessageLookupByLibrary.simpleMessage("Create Post"),
    "createUser": MessageLookupByLibrary.simpleMessage("Create User"),
    "cropImage": MessageLookupByLibrary.simpleMessage("Crop Image"),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "dailyTrends": MessageLookupByLibrary.simpleMessage("Daily trends"),
    "dangerZone": MessageLookupByLibrary.simpleMessage("Danger Zone"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dashboardAdditionalInformationText1": MessageLookupByLibrary.simpleMessage(
      "Additional",
    ),
    "dashboardAdditionalInformationText2": MessageLookupByLibrary.simpleMessage(
      "Info",
    ),
    "dashboardContactText1": MessageLookupByLibrary.simpleMessage("Contact"),
    "dashboardContactText2": MessageLookupByLibrary.simpleMessage(
      "Information",
    ),
    "dashboardOpeningHoursText1": MessageLookupByLibrary.simpleMessage(
      "Opening",
    ),
    "dashboardOpeningHoursText2": MessageLookupByLibrary.simpleMessage("Hours"),
    "dashboardReviewsOfOurCustomersText1": MessageLookupByLibrary.simpleMessage(
      "Reviews of Our",
    ),
    "dashboardReviewsOfOurCustomersText2": MessageLookupByLibrary.simpleMessage(
      "Customers",
    ),
    "dashboardServicesAtText1": MessageLookupByLibrary.simpleMessage(
      "Services at",
    ),
    "dashboardServicesAtText2": MessageLookupByLibrary.simpleMessage(
      "Establishment",
    ),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deleteAccountBusinessWarning": MessageLookupByLibrary.simpleMessage(
      "You have an active business that will also be permanently deleted and cannot be recovered.",
    ),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "Yes, delete my account",
    ),
    "deleteAccountTitle": MessageLookupByLibrary.simpleMessage(
      "Delete your account?",
    ),
    "deleteAccountWarning": MessageLookupByLibrary.simpleMessage(
      "This action is permanent. Your personal data will be erased and all your businesses will be removed. You will be logged out immediately.",
    ),
    "deleteAllCategoryItems": MessageLookupByLibrary.simpleMessage(
      "\n\nThis action will permanently delete all items in this category.",
    ),
    "deleteBusiness": MessageLookupByLibrary.simpleMessage("Delete Business"),
    "deleteBusinessConfirm": MessageLookupByLibrary.simpleMessage(
      "Yes, delete business",
    ),
    "deleteBusinessSuccess": MessageLookupByLibrary.simpleMessage(
      "Business deleted successfully",
    ),
    "deleteBusinessTitle": MessageLookupByLibrary.simpleMessage(
      "Delete this business?",
    ),
    "deleteBusinessWarning": MessageLookupByLibrary.simpleMessage(
      "This action is permanent. The business and all its content (menu, promotions, reservations) will be removed.",
    ),
    "deleteCategory": MessageLookupByLibrary.simpleMessage("Delete Category"),
    "deletePostConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this post?",
    ),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage("Delete Post"),
    "delivery": MessageLookupByLibrary.simpleMessage("Delivery"),
    "doItLater": MessageLookupByLibrary.simpleMessage("I\'ll do it later"),
    "doYouWantToDeleteThisCoverImage": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this cover image?",
    ),
    "downloadApp": MessageLookupByLibrary.simpleMessage("Get the app"),
    "drinks": MessageLookupByLibrary.simpleMessage("Drinks"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editCoverImages": MessageLookupByLibrary.simpleMessage(
      "Edit Cover Images",
    ),
    "editLocation": MessageLookupByLibrary.simpleMessage("Edit Location"),
    "editMenu": MessageLookupByLibrary.simpleMessage("Edit menu"),
    "editReview": MessageLookupByLibrary.simpleMessage("Edit Review"),
    "editTitle": MessageLookupByLibrary.simpleMessage("Edit Title"),
    "editYourReviewFor": m15,
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enableLocation": MessageLookupByLibrary.simpleMessage("Enable location"),
    "enableLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Tap to enable location access",
    ),
    "end": MessageLookupByLibrary.simpleMessage("End"),
    "endDate": MessageLookupByLibrary.simpleMessage("End date"),
    "endSession": MessageLookupByLibrary.simpleMessage("End Session"),
    "enterAValidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "enterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "enterAValidPostalCode": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid postal code",
    ),
    "enterCategoryName": MessageLookupByLibrary.simpleMessage(
      "Enter a name for this category",
    ),
    "enterCodeSentTo": m16,
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorLoadingVideo": MessageLookupByLibrary.simpleMessage(
      "Error loading video",
    ),
    "errorUpdatingPromotionMedia": MessageLookupByLibrary.simpleMessage(
      "Error updating promotion media",
    ),
    "errorUploadingPromotionMedia": MessageLookupByLibrary.simpleMessage(
      "Error uploading promotion media",
    ),
    "failedDeletePhotos": m17,
    "failedToCancelReservation": MessageLookupByLibrary.simpleMessage(
      "Failed to cancel reservation.",
    ),
    "failedToCompleteReservation": MessageLookupByLibrary.simpleMessage(
      "Failed to complete reservation.",
    ),
    "failedToConfirmReservation": MessageLookupByLibrary.simpleMessage(
      "Failed to confirm reservation.",
    ),
    "failedToLoadPromotionDetails": MessageLookupByLibrary.simpleMessage(
      "Failed to load promotion details",
    ),
    "failedToMarkNoShow": MessageLookupByLibrary.simpleMessage(
      "Failed to mark no-show.",
    ),
    "failedToRejectReservation": MessageLookupByLibrary.simpleMessage(
      "Failed to reject reservation.",
    ),
    "fastFood": MessageLookupByLibrary.simpleMessage("Fast Food"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "findAndCompleteAddress": MessageLookupByLibrary.simpleMessage(
      "Easily find and complete your address",
    ),
    "finishEdit": MessageLookupByLibrary.simpleMessage("Finish edit mode"),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "follow": MessageLookupByLibrary.simpleMessage("Follow"),
    "followers": MessageLookupByLibrary.simpleMessage("Followers"),
    "following": MessageLookupByLibrary.simpleMessage("Following"),
    "food": MessageLookupByLibrary.simpleMessage("Food"),
    "foodTrucks": MessageLookupByLibrary.simpleMessage("Food Trucks & Stalls"),
    "foodlyCoverage": MessageLookupByLibrary.simpleMessage("Foodly Coverage"),
    "foodlyCoverageDescription": MessageLookupByLibrary.simpleMessage(
      "Foodly is currently available in the following countries:",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "fusionCuisine": MessageLookupByLibrary.simpleMessage("Fusion"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "generateQR": MessageLookupByLibrary.simpleMessage("Generate QR code"),
    "generateWithAI": MessageLookupByLibrary.simpleMessage("Generate with AI"),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Good Afternoon"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Good Evening"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Good Morning"),
    "guests": MessageLookupByLibrary.simpleMessage("guests"),
    "happyBirthday": MessageLookupByLibrary.simpleMessage("Happy Birthday"),
    "happyHours": MessageLookupByLibrary.simpleMessage("Happy Hours"),
    "hi": MessageLookupByLibrary.simpleMessage("Hi"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "imageSizeLessThan10mb": MessageLookupByLibrary.simpleMessage(
      "Image size must be less than 10MB",
    ),
    "incompletePromotionCreateInfo": MessageLookupByLibrary.simpleMessage(
      "Incomplete information to create promotion",
    ),
    "incompletePromotionUpdateInfo": MessageLookupByLibrary.simpleMessage(
      "Incomplete information to update promotion",
    ),
    "informationNotYetProvidedByTheBusiness":
        MessageLookupByLibrary.simpleMessage(
          "Information not yet provided by the business.",
        ),
    "interactToReserve": MessageLookupByLibrary.simpleMessage(
      "Interact → Reserve",
    ),
    "internalErrorEmptyPrompt": MessageLookupByLibrary.simpleMessage(
      "Internal error processing request. Prompt text is empty",
    ),
    "internationalCuisine": MessageLookupByLibrary.simpleMessage(
      "International",
    ),
    "introMessage": MessageLookupByLibrary.simpleMessage(
      "Brief intro for new visitors",
    ),
    "introMessageTooltip": MessageLookupByLibrary.simpleMessage(
      "You can use this space to welcome customers and highlight what makes your business special.\nWe\'ll promote it on the main page for about 30 days.",
    ),
    "invalidMenuCategory": MessageLookupByLibrary.simpleMessage(
      "Invalid menu category",
    ),
    "invalidPromoDates": MessageLookupByLibrary.simpleMessage(
      "Start date is after end date",
    ),
    "invalidYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "Invalid YouTube URL",
    ),
    "italian": MessageLookupByLibrary.simpleMessage("Italian"),
    "itemAvailable": MessageLookupByLibrary.simpleMessage("Available Item"),
    "itemCreatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item created successfully",
    ),
    "itemDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item deleted successfully",
    ),
    "itemUnavailable": MessageLookupByLibrary.simpleMessage(
      "Temporarily Unavailable Item",
    ),
    "itemUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item updated successfully",
    ),
    "items": MessageLookupByLibrary.simpleMessage("Items"),
    "kidChairs": MessageLookupByLibrary.simpleMessage("Kid Chairs"),
    "kidsMenu": MessageLookupByLibrary.simpleMessage("Kids menu"),
    "kidsPlayArea": MessageLookupByLibrary.simpleMessage("Kids Play Area"),
    "koreanCuisine": MessageLookupByLibrary.simpleMessage("Korean"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "likes": MessageLookupByLibrary.simpleMessage("Likes"),
    "listening": MessageLookupByLibrary.simpleMessage("Listening"),
    "liveMusic": MessageLookupByLibrary.simpleMessage("Live Music"),
    "loadLogo": MessageLookupByLibrary.simpleMessage("Load Logo"),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Location permission denied. We need your location to show nearby restaurants.",
    ),
    "locationPermissionPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
      "Location permanently denied. Please enable it in app settings.",
    ),
    "locationRationaleBody": MessageLookupByLibrary.simpleMessage(
      "Foodly uses your location to find restaurants near you. Your location is never shared with other users.",
    ),
    "locationRationaleTitle": MessageLookupByLibrary.simpleMessage(
      "Location access needed",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Location services are disabled. Please enable them in settings.",
    ),
    "locationSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
      "Location successfully updated.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Log In"),
    "loginError": MessageLookupByLibrary.simpleMessage("Error during login"),
    "loginTo": MessageLookupByLibrary.simpleMessage("Log in to"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutDialogTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Ending the session will require you to log in again with your email and password or any social network associated with your account.",
    ),
    "logoutDialogTextSpan2": MessageLookupByLibrary.simpleMessage(
      "If you opt for",
    ),
    "logoutDialogTextSpan3": MessageLookupByLibrary.simpleMessage(
      "Save and Close",
    ),
    "logoutDialogTextSpan4": MessageLookupByLibrary.simpleMessage(
      ", you will finish the activity, maintaining the option to access quickly and securely via biometric or pattern authentication.",
    ),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Do you want to log out?",
    ),
    "mainPromos": MessageLookupByLibrary.simpleMessage("Featured Promotions"),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "manageReservations": MessageLookupByLibrary.simpleMessage(
      "Manage Reservations",
    ),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "markedNoShow": MessageLookupByLibrary.simpleMessage("Marked as no-show."),
    "marketsAndStores": MessageLookupByLibrary.simpleMessage(
      "Markets and Stores",
    ),
    "maxPartySize": m18,
    "maxSize": m19,
    "maxSizeLabel": MessageLookupByLibrary.simpleMessage("Max"),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "menu": MessageLookupByLibrary.simpleMessage("Menu"),
    "menus": MessageLookupByLibrary.simpleMessage("Menus"),
    "message": MessageLookupByLibrary.simpleMessage("Message"),
    "mexicanCuisine": MessageLookupByLibrary.simpleMessage("Mexican"),
    "micPermissionDeniedMessage": MessageLookupByLibrary.simpleMessage(
      "Voice Search uses your microphone to find great places nearby. Grant microphone access in Settings to start exploring with your voice.",
    ),
    "mockTextNewReleasesCard": MessageLookupByLibrary.simpleMessage(
      "The Ramalha network across the city of Covilhã continues to grow. After expanding last year to the city of Fundão, this time the bakery/patisserie opened its second space in Covilhã Shopping, in an interior space in its front area, on floor 0 with a wide esplanade.",
    ),
    "moreInfo": MessageLookupByLibrary.simpleMessage("+ info"),
    "moveDown": MessageLookupByLibrary.simpleMessage("Move Down"),
    "moveUp": MessageLookupByLibrary.simpleMessage("Move Up"),
    "multilanguage": MessageLookupByLibrary.simpleMessage("Multilanguage"),
    "mustContainAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
      "Must contain at least 3 characters",
    ),
    "mustContainAtLeastTwoCharacters": MessageLookupByLibrary.simpleMessage(
      "Must contain at least 2 characters",
    ),
    "myFavorites": MessageLookupByLibrary.simpleMessage("My Favorites"),
    "myHistory": MessageLookupByLibrary.simpleMessage("My History"),
    "myReservations": MessageLookupByLibrary.simpleMessage("My Reservations"),
    "needBestRecommendations": MessageLookupByLibrary.simpleMessage(
      "Need the best recommendations?",
    ),
    "newBranch": MessageLookupByLibrary.simpleMessage("New on Foodly"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "news": MessageLookupByLibrary.simpleMessage("News"),
    "nickName": MessageLookupByLibrary.simpleMessage("Username"),
    "noAudioDetected": MessageLookupByLibrary.simpleMessage(
      "No audio detected. Please try again.",
    ),
    "noFavoriteBusinesses": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any businesses in your favorites list yet",
    ),
    "noFavoriteItems": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any items in your favorites list yet",
    ),
    "noFavoriteMenus": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any menus in your favorites list yet",
    ),
    "noItemsYet": MessageLookupByLibrary.simpleMessage(
      "There are no items added yet",
    ),
    "noNearbyBusinessesInCategory": m20,
    "noNewBranches": MessageLookupByLibrary.simpleMessage(
      "No new businesses in your area yet",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "No notifications yet!",
    ),
    "noPromotionsInSection": MessageLookupByLibrary.simpleMessage(
      "There are no promotions in this section",
    ),
    "noPromotionsNearby": MessageLookupByLibrary.simpleMessage(
      "No promotions nearby",
    ),
    "noRecommendationsFound": MessageLookupByLibrary.simpleMessage(
      "We didn\'t find any recommendations for your search. \nTry other terms or try a different location.",
    ),
    "noReservationsFound": MessageLookupByLibrary.simpleMessage(
      "No reservations found.",
    ),
    "noReservationsYet": MessageLookupByLibrary.simpleMessage(
      "No reservations yet.",
    ),
    "noSavedPromotions": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any saved promotions yet",
    ),
    "noSavedPromotionsInSection": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any saved promotions in this section",
    ),
    "noShow": MessageLookupByLibrary.simpleMessage("No Show"),
    "nonEspecified": MessageLookupByLibrary.simpleMessage("Not Specified"),
    "notFoundPageText": MessageLookupByLibrary.simpleMessage(
      "The requested route does not exist, or you do not have permission to access it.",
    ),
    "notInYourCountry": MessageLookupByLibrary.simpleMessage(
      "Not in your country yet?",
    ),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "notesLabel": m21,
    "notification": MessageLookupByLibrary.simpleMessage("Notification"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "okGo": MessageLookupByLibrary.simpleMessage("Ok, Let\'s go!"),
    "onSite": MessageLookupByLibrary.simpleMessage("On site"),
    "onlyContainLetters": MessageLookupByLibrary.simpleMessage(
      "Can only contain letters and one space between words",
    ),
    "onlyYouPrivacyNotice": MessageLookupByLibrary.simpleMessage(
      "Visible only to you.",
    ),
    "open": MessageLookupByLibrary.simpleMessage("Open"),
    "openMenuAnyDevice": MessageLookupByLibrary.simpleMessage(
      "\nto open the menu in any device",
    ),
    "openSettings": MessageLookupByLibrary.simpleMessage("Open Settings"),
    "openSoon": MessageLookupByLibrary.simpleMessage("Open soon"),
    "optional": MessageLookupByLibrary.simpleMessage("Optional"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "outdoorSeating": MessageLookupByLibrary.simpleMessage("Outdoor Seating"),
    "outsideCoverage": MessageLookupByLibrary.simpleMessage(
      "Your location is outside Foodly\'s current coverage",
    ),
    "owner": MessageLookupByLibrary.simpleMessage("Owner"),
    "parking": MessageLookupByLibrary.simpleMessage("Parking"),
    "partySize": MessageLookupByLibrary.simpleMessage("Party size:"),
    "partySizeCount": m22,
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordInstructions": MessageLookupByLibrary.simpleMessage(
      "The password must be at least 8 characters long, include a number, a lowercase letter, and an uppercase letter",
    ),
    "passwordSent": MessageLookupByLibrary.simpleMessage(
      "Temporary password sent",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "pendingReservationsAlertMany": m23,
    "pendingReservationsAlertOne": MessageLookupByLibrary.simpleMessage(
      "You have 1 pending reservation",
    ),
    "pendingReservationsContent": MessageLookupByLibrary.simpleMessage(
      "There are reservation requests waiting for your response.",
    ),
    "peruvian": MessageLookupByLibrary.simpleMessage("Peruvian"),
    "petFriendly": MessageLookupByLibrary.simpleMessage("Pet Friendly"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "photosDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item photos deleted successfully",
    ),
    "photosSaveError": m24,
    "pizzerias": MessageLookupByLibrary.simpleMessage("Pizzerias"),
    "platformError": MessageLookupByLibrary.simpleMessage("Platform Error"),
    "pleaseAddYourBusinessAddress": MessageLookupByLibrary.simpleMessage(
      "Please add your business address",
    ),
    "pleaseAddYourBusinessCountry": MessageLookupByLibrary.simpleMessage(
      "Please indicate the country of your business",
    ),
    "pleaseAddYourBusinessName": MessageLookupByLibrary.simpleMessage(
      "Please add the name of your business",
    ),
    "pleaseEnterEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter your email address",
    ),
    "pleaseEnterNickName": MessageLookupByLibrary.simpleMessage(
      "Please enter a username",
    ),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "pleaseEnterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "pleaseEnterPostalCode": MessageLookupByLibrary.simpleMessage(
      "Please enter your postal code",
    ),
    "pleaseEnterYourLastName": MessageLookupByLibrary.simpleMessage(
      "Please enter your last name",
    ),
    "pleaseEnterYourName": MessageLookupByLibrary.simpleMessage(
      "Please enter your name",
    ),
    "pleaseSelectAnOption": MessageLookupByLibrary.simpleMessage(
      "Please select an option",
    ),
    "pleaseSelectBusinessCategory": MessageLookupByLibrary.simpleMessage(
      "Please select the category of your business",
    ),
    "portugueseCuisine": MessageLookupByLibrary.simpleMessage("Portuguese"),
    "post": MessageLookupByLibrary.simpleMessage("Post"),
    "posts": MessageLookupByLibrary.simpleMessage("Posts"),
    "postsFeedBeFirst": MessageLookupByLibrary.simpleMessage(
      "Be the first to share something!",
    ),
    "postsFeedNoPosts": MessageLookupByLibrary.simpleMessage("No posts yet"),
    "preferNotToSay": MessageLookupByLibrary.simpleMessage("Prefer not to say"),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
    "pressToAddPhotosUpToMaxImages": m25,
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "priceValidation": MessageLookupByLibrary.simpleMessage(
      "Price value must be not null and greater than 0.09",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileBirthdayText1": MessageLookupByLibrary.simpleMessage("Birthday"),
    "profileBirthdayText2": MessageLookupByLibrary.simpleMessage("Date"),
    "profileUserLocation1": MessageLookupByLibrary.simpleMessage("User"),
    "profileUserLocation2": MessageLookupByLibrary.simpleMessage("Location"),
    "promoTabActive": MessageLookupByLibrary.simpleMessage("Active"),
    "promoTabExpired": MessageLookupByLibrary.simpleMessage("Expired"),
    "promoTabUpcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "promotionDays": MessageLookupByLibrary.simpleMessage("Promotion days"),
    "promotions": MessageLookupByLibrary.simpleMessage("Promotions"),
    "pubsAndWineBars": MessageLookupByLibrary.simpleMessage(
      "Pubs and Wine Bars",
    ),
    "radiusDistanceLabel": MessageLookupByLibrary.simpleMessage(
      "Distance radius:",
    ),
    "rateYourExperience": MessageLookupByLibrary.simpleMessage(
      "Rate your experience:",
    ),
    "ratingAvg": MessageLookupByLibrary.simpleMessage("Rating Avg:"),
    "readyToListen": MessageLookupByLibrary.simpleMessage("Ready to listen"),
    "recentPosts": MessageLookupByLibrary.simpleMessage("Recent Posts"),
    "recommend": MessageLookupByLibrary.simpleMessage("Recommend"),
    "recoverPassword": MessageLookupByLibrary.simpleMessage("Recover Password"),
    "recoverPasswordErrorMsg": MessageLookupByLibrary.simpleMessage(
      "Oops, something went wrong. Please try again, and if the error persists, check if the email is correct or try later.",
    ),
    "recoverPasswordTextSpan1": MessageLookupByLibrary.simpleMessage(
      "We sent a",
    ),
    "recoverPasswordTextSpan2": MessageLookupByLibrary.simpleMessage(
      "temporary password",
    ),
    "recoverPasswordTextSpan3": MessageLookupByLibrary.simpleMessage(
      "to your email, valid for 30 minutes. Log in with it and update it in your profile",
    ),
    "regular": MessageLookupByLibrary.simpleMessage("Regular"),
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "rejectReservation": MessageLookupByLibrary.simpleMessage(
      "Reject Reservation",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "removePhotos": MessageLookupByLibrary.simpleMessage("Remove photos"),
    "removeThisTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Remove this time period",
    ),
    "removeVideo": MessageLookupByLibrary.simpleMessage("Remove video"),
    "request": MessageLookupByLibrary.simpleMessage("Request"),
    "requestReservation": MessageLookupByLibrary.simpleMessage(
      "Request Reservation",
    ),
    "requested": MessageLookupByLibrary.simpleMessage("Requested"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "resendCodeIn": m26,
    "reservation": MessageLookupByLibrary.simpleMessage("Reservation"),
    "reservationCancelled": MessageLookupByLibrary.simpleMessage(
      "Reservation cancelled.",
    ),
    "reservationCompleted": MessageLookupByLibrary.simpleMessage(
      "Reservation completed.",
    ),
    "reservationConfirmed": MessageLookupByLibrary.simpleMessage(
      "Reservation confirmed.",
    ),
    "reservationDetails": MessageLookupByLibrary.simpleMessage(
      "Reservation Details",
    ),
    "reservationRejected": MessageLookupByLibrary.simpleMessage(
      "Reservation rejected.",
    ),
    "reservationRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to send reservation request.",
    ),
    "reservationRequestSent": MessageLookupByLibrary.simpleMessage(
      "Reservation request sent!",
    ),
    "reservations": MessageLookupByLibrary.simpleMessage("Reservations"),
    "reservationsForToday": MessageLookupByLibrary.simpleMessage(
      "Today\'s Reservations",
    ),
    "reserveTableAt": m27,
    "reserveToComplete": MessageLookupByLibrary.simpleMessage(
      "Reserve → Complete",
    ),
    "resilience": MessageLookupByLibrary.simpleMessage("Resilience"),
    "resultsFor": MessageLookupByLibrary.simpleMessage("Results for"),
    "resumeSessionWithSecurity": MessageLookupByLibrary.simpleMessage(
      "Resume session with fingerprint/face or pattern",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "retryRecording": MessageLookupByLibrary.simpleMessage("Retry recording"),
    "review": MessageLookupByLibrary.simpleMessage("Review"),
    "reviewDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Review deleted successfully!",
    ),
    "reviewSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Review submitted successfully!",
    ),
    "reviewUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Review updated successfully!",
    ),
    "reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveAndClose": MessageLookupByLibrary.simpleMessage("Save and Close"),
    "saveMenu": MessageLookupByLibrary.simpleMessage("Save this menu"),
    "savedPromotions": MessageLookupByLibrary.simpleMessage("Saved Promotions"),
    "savedPromotionsCurrent": MessageLookupByLibrary.simpleMessage(
      "These are your current promotions",
    ),
    "savedPromotionsTabCurrent": MessageLookupByLibrary.simpleMessage(
      "Current",
    ),
    "savedPromotionsTabUpcoming": MessageLookupByLibrary.simpleMessage(
      "Upcoming",
    ),
    "savedPromotionsUpcoming": MessageLookupByLibrary.simpleMessage(
      "These are your upcoming promotions",
    ),
    "scanQRCode": MessageLookupByLibrary.simpleMessage("Scan this QR code"),
    "seafood": MessageLookupByLibrary.simpleMessage("Seafood"),
    "searchBusinessOrAddress": MessageLookupByLibrary.simpleMessage(
      "Search Business or Address",
    ),
    "searchInCity": m28,
    "searchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Discover great places to eat and drink nearby...",
    ),
    "secureAuthentication": MessageLookupByLibrary.simpleMessage(
      "Let OS provide secure authentication.",
    ),
    "selectADate": MessageLookupByLibrary.simpleMessage("Select a date:"),
    "selectATime": MessageLookupByLibrary.simpleMessage("Select a time:"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select a date:"),
    "selectTime": MessageLookupByLibrary.simpleMessage("Select a time:"),
    "selectUserType": MessageLookupByLibrary.simpleMessage("Select User Type"),
    "selectedPlace": MessageLookupByLibrary.simpleMessage("Selected place"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Send Verification Code",
    ),
    "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
      "Your session has expired. Please log in again.",
    ),
    "setDate": MessageLookupByLibrary.simpleMessage("Set date"),
    "shareAppMessage": MessageLookupByLibrary.simpleMessage(
      "Discover the best food spots near you with Foodly — explore menus, grab promotions, and book tables, all in one app!",
    ),
    "shareMenu": MessageLookupByLibrary.simpleMessage("Share this menu"),
    "shareMenuError": MessageLookupByLibrary.simpleMessage(
      "Oops... Something went wrong! \n\nCouldn\'t share the menu.",
    ),
    "shareMenuMessage": m29,
    "shareMenuSubject": MessageLookupByLibrary.simpleMessage(
      "Sharing a menu with you!",
    ),
    "shareOnAndroid": MessageLookupByLibrary.simpleMessage("Share for Android"),
    "shareOnIOS": MessageLookupByLibrary.simpleMessage("Share for iOS"),
    "sharePromotion": MessageLookupByLibrary.simpleMessage("Share Promotion"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "signUpBusinessTooltipTextSpan1": MessageLookupByLibrary.simpleMessage(
      "We recommend locating your business or commercial address on Google, thus providing us with data, including coordinates, that allow us to give you",
    ),
    "signUpBusinessTooltipTextSpan2": MessageLookupByLibrary.simpleMessage(
      "greater relevance",
    ),
    "signUpBusinessTooltipTextSpan3": MessageLookupByLibrary.simpleMessage(
      "in our",
    ),
    "signUpBusinessTooltipTextSpan4": MessageLookupByLibrary.simpleMessage(
      "search engines and maps",
    ),
    "signUpBusinessTooltipTextSpan5": MessageLookupByLibrary.simpleMessage(
      "for",
    ),
    "signUpBusinessTooltipTextSpan6": MessageLookupByLibrary.simpleMessage(
      "users",
    ),
    "signUpBusinessTooltipTextSpan7": MessageLookupByLibrary.simpleMessage(
      "consumers and visitors, as well as if you decide to include services like delivery and take away. This way we will provide a",
    ),
    "signUpBusinessTooltipTextSpan8": MessageLookupByLibrary.simpleMessage(
      "better user experience",
    ),
    "signUpBusinessTooltipTextSpan9": MessageLookupByLibrary.simpleMessage(
      "to your customers.",
    ),
    "signup": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "smokingArea": MessageLookupByLibrary.simpleMessage("Smoking Area"),
    "socials": MessageLookupByLibrary.simpleMessage("Socials"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "An error occurred",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
    "specialRequestsLabel": m30,
    "specialRequestsOptional": MessageLookupByLibrary.simpleMessage(
      "Special requests (optional)",
    ),
    "speechRecognitionError": MessageLookupByLibrary.simpleMessage(
      "Error starting speech recognition.",
    ),
    "speechRecognitionUnavailable": MessageLookupByLibrary.simpleMessage(
      "Speech recognition is not available on this device.",
    ),
    "start": MessageLookupByLibrary.simpleMessage("Start"),
    "startDate": MessageLookupByLibrary.simpleMessage("Start date"),
    "startups": MessageLookupByLibrary.simpleMessage("Startups"),
    "state": MessageLookupByLibrary.simpleMessage("State"),
    "steakhouse": MessageLookupByLibrary.simpleMessage("Steakhouse"),
    "stop": MessageLookupByLibrary.simpleMessage("Stop"),
    "stress": MessageLookupByLibrary.simpleMessage("Stress"),
    "subject": MessageLookupByLibrary.simpleMessage("Subject"),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "submitReview": MessageLookupByLibrary.simpleMessage("Submit Review"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "successRate": MessageLookupByLibrary.simpleMessage("Success rate"),
    "successfullyDeleted": MessageLookupByLibrary.simpleMessage(
      "Successfully deleted!",
    ),
    "suggestFoodlyInYourCountry": MessageLookupByLibrary.simpleMessage(
      "Suggest Foodly in your country",
    ),
    "suggestFoodlySubject": MessageLookupByLibrary.simpleMessage(
      "Bring Foodly to my country",
    ),
    "sushi": MessageLookupByLibrary.simpleMessage("Sushi"),
    "switchToManagerRole": MessageLookupByLibrary.simpleMessage(
      "Switch to Business Account",
    ),
    "switchUserCategoryTextSpan1": MessageLookupByLibrary.simpleMessage(
      "If you wish to reclassify as",
    ),
    "switchUserCategoryTextSpan2": MessageLookupByLibrary.simpleMessage(
      "click",
    ),
    "switchUserCategoryTextSpan3": MessageLookupByLibrary.simpleMessage("here"),
    "takeAway": MessageLookupByLibrary.simpleMessage("Take Away"),
    "tapToAddPrompt": MessageLookupByLibrary.simpleMessage(
      "Tap here to add a new prompt",
    ),
    "tapToSelectTime": MessageLookupByLibrary.simpleMessage(
      "Tap to select time",
    ),
    "temporarilyUnavailable": MessageLookupByLibrary.simpleMessage(
      "Temporarily unavailable",
    ),
    "tendencies": MessageLookupByLibrary.simpleMessage("Trends"),
    "termsConditions": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "termsConditionsShort": MessageLookupByLibrary.simpleMessage("T&C"),
    "termsPrivacyTextSpan1": MessageLookupByLibrary.simpleMessage(
      "By creating an account, you acknowledge that you have read and agree to our",
    ),
    "termsPrivacyTextSpan2": MessageLookupByLibrary.simpleMessage(
      "Terms and Conditions",
    ),
    "termsPrivacyTextSpan3": MessageLookupByLibrary.simpleMessage("and the"),
    "termsPrivacyTextSpan4": MessageLookupByLibrary.simpleMessage(
      "Privacy Policy",
    ),
    "thereAreNoCustomerReviewsYet": MessageLookupByLibrary.simpleMessage(
      "There are no customer reviews yet",
    ),
    "thisBusiness": MessageLookupByLibrary.simpleMessage("this business"),
    "timeAgoDays": m31,
    "timeAgoHours": m32,
    "timeAgoJustNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "timeAgoMinutes": m33,
    "topEvents": MessageLookupByLibrary.simpleMessage("Top events"),
    "totalEvents": MessageLookupByLibrary.simpleMessage("Total events"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "unauthorizedAccess": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access.",
    ),
    "uniqueUsers": MessageLookupByLibrary.simpleMessage("Unique users"),
    "updateReview": MessageLookupByLibrary.simpleMessage("Update Review"),
    "uploadImage": MessageLookupByLibrary.simpleMessage("Upload Image"),
    "uploadPromotionalMediaContent": MessageLookupByLibrary.simpleMessage(
      "Upload promotional image or video",
    ),
    "uploadVideo": MessageLookupByLibrary.simpleMessage("Upload Video"),
    "us": MessageLookupByLibrary.simpleMessage("Us"),
    "useDeviceLocation": MessageLookupByLibrary.simpleMessage(
      "Use device location",
    ),
    "useSavedLocation": MessageLookupByLibrary.simpleMessage(
      "Use saved location",
    ),
    "userGender1": MessageLookupByLibrary.simpleMessage("User"),
    "userGender2": MessageLookupByLibrary.simpleMessage("Gender"),
    "userPassword1": MessageLookupByLibrary.simpleMessage("Change"),
    "userPassword2": MessageLookupByLibrary.simpleMessage("Password"),
    "userPasswordUpdated": MessageLookupByLibrary.simpleMessage(
      "Password successfully updated",
    ),
    "userProfileUpdated": MessageLookupByLibrary.simpleMessage(
      "User data successfully updated",
    ),
    "userReviews1": MessageLookupByLibrary.simpleMessage("My"),
    "userReviews2": MessageLookupByLibrary.simpleMessage("Reviews"),
    "userReviewsPlaceholder": MessageLookupByLibrary.simpleMessage(
      "You haven\'t left any reviews yet. Remember to rate your experience when visiting a business to improve everyone\'s experience and stand out in our community.",
    ),
    "userSortMostActive": MessageLookupByLibrary.simpleMessage("Most Active"),
    "userSortMostFollowed": MessageLookupByLibrary.simpleMessage(
      "Most Followed",
    ),
    "userSortNearest": MessageLookupByLibrary.simpleMessage("Nearest"),
    "userSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
      "User successfully created",
    ),
    "userTypeSnackbarTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Please select the",
    ),
    "userTypeSnackbarTextSpan2": MessageLookupByLibrary.simpleMessage(
      "user type",
    ),
    "userTypeSnackbarTextSpan3": MessageLookupByLibrary.simpleMessage(
      "to activate and be able to complete the form",
    ),
    "usernameAvailable": MessageLookupByLibrary.simpleMessage(
      "Username available",
    ),
    "usernameNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Username not available",
    ),
    "users": MessageLookupByLibrary.simpleMessage("Users"),
    "usersHaveTheAbilityToCreateAndManage":
        MessageLookupByLibrary.simpleMessage(
          "are users who have the ability to create and manage",
        ),
    "valid": MessageLookupByLibrary.simpleMessage("Valid"),
    "validCategoryRequired": MessageLookupByLibrary.simpleMessage(
      "A valid category is required",
    ),
    "vegetarianCuisine": MessageLookupByLibrary.simpleMessage("Vegetarian"),
    "venezuelan": MessageLookupByLibrary.simpleMessage("Venezuelan"),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "verifyPhone": MessageLookupByLibrary.simpleMessage("Verify Phone"),
    "verifyingAvailability": MessageLookupByLibrary.simpleMessage(
      "Checking availability",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "videoIsTooLong": MessageLookupByLibrary.simpleMessage(
      "Video is too long. Maximum duration is 20 seconds.",
    ),
    "view": MessageLookupByLibrary.simpleMessage("View"),
    "viewEdit": MessageLookupByLibrary.simpleMessage("View/Edit"),
    "viewMenuOf": MessageLookupByLibrary.simpleMessage("View menu of"),
    "viewPromotion": MessageLookupByLibrary.simpleMessage("View promotion"),
    "viewToInteract": MessageLookupByLibrary.simpleMessage("View → Interact"),
    "visitBusinessPage": MessageLookupByLibrary.simpleMessage(
      "Visit Business Page",
    ),
    "visitedOn": m34,
    "visitor": MessageLookupByLibrary.simpleMessage("Visitor"),
    "vitality": MessageLookupByLibrary.simpleMessage("Vitality"),
    "weWillCheckAvailability": MessageLookupByLibrary.simpleMessage(
      "We\'ll check availability",
    ),
    "weekday1": MessageLookupByLibrary.simpleMessage("Sunday"),
    "weekday2": MessageLookupByLibrary.simpleMessage("Monday"),
    "weekday3": MessageLookupByLibrary.simpleMessage("Tuesday"),
    "weekday4": MessageLookupByLibrary.simpleMessage("Wednesday"),
    "weekday5": MessageLookupByLibrary.simpleMessage("Thursday"),
    "weekday6": MessageLookupByLibrary.simpleMessage("Friday"),
    "weekday7": MessageLookupByLibrary.simpleMessage("Saturday"),
    "weekdayShort1": MessageLookupByLibrary.simpleMessage("Sun"),
    "weekdayShort2": MessageLookupByLibrary.simpleMessage("Mon"),
    "weekdayShort3": MessageLookupByLibrary.simpleMessage("Tue"),
    "weekdayShort4": MessageLookupByLibrary.simpleMessage("Wed"),
    "weekdayShort5": MessageLookupByLibrary.simpleMessage("Thu"),
    "weekdayShort6": MessageLookupByLibrary.simpleMessage("Fri"),
    "weekdayShort7": MessageLookupByLibrary.simpleMessage("Sat"),
    "welcomeDialogTextSpan1": MessageLookupByLibrary.simpleMessage("At"),
    "welcomeDialogTextSpan2": MessageLookupByLibrary.simpleMessage(
      "we warmly welcome you",
    ),
    "welcomeDialogTextSpan3": MessageLookupByLibrary.simpleMessage(
      "you have registered as",
    ),
    "welcomeDialogTextSpanClient1": MessageLookupByLibrary.simpleMessage(
      "We are now your digital gastronomic guide in your city and our coverage areas. We invite you to actively participate in our community, rate and comment on businesses and products, always from a line of respect, constructively criticize, support the efforts of small, medium, and large merchants, and mainly, enjoy the",
    ),
    "welcomeDialogTextSpanClient2": MessageLookupByLibrary.simpleMessage(
      "promotions, contents, services, and advantages",
    ),
    "welcomeDialogTextSpanClient3": MessageLookupByLibrary.simpleMessage(
      "that being our user offers you.",
    ),
    "welcomeDialogTextSpanOwner": MessageLookupByLibrary.simpleMessage(
      "The next step is to complete the registration of your business, we will initially ask for basic data and then you can add more relevant information from your business dashboard, and of course, start creating content, menus, promotions, and everything you wish through your new digital tool",
    ),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("Welcome"),
    "whatAreYouCravingToday": MessageLookupByLibrary.simpleMessage(
      "What are you craving today?",
    ),
    "whatsOnYourMind": MessageLookupByLibrary.simpleMessage(
      "What\'s on your mind?",
    ),
    "whenDidYouVisit": MessageLookupByLibrary.simpleMessage(
      "When did you visit?",
    ),
    "wifi": MessageLookupByLibrary.simpleMessage("Wifi"),
    "writeReviewFor": m35,
    "writeYourReviewHint": MessageLookupByLibrary.simpleMessage(
      "Write your review here...",
    ),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Yes, cancel"),
    "zipCode": MessageLookupByLibrary.simpleMessage("Zip Code"),
    "zipCodeNotAvailable": MessageLookupByLibrary.simpleMessage(
      "This code is outside our current coverage area",
    ),
  };
}
