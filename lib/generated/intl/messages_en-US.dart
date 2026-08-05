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

  static String m0(current, total) => "Analyzing ${current} of ${total}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No items to import', one: '1 item will be added to your menu', other: '${count} items will be added to your menu')}";

  static String m2(count) =>
      "${Intl.plural(count, one: 'We detected 1 item', other: 'We detected ${count} items')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '1 photo selected', other: '${count} photos selected')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '1 combo', other: '${count} combos')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '1 drink', other: '${count} drinks')}";

  static String m6(count) =>
      "${Intl.plural(count, one: '1 dish', other: '${count} dishes')}";

  static String m7(items, categories) =>
      "We imported ${items} items in ${categories} categories.";

  static String m8(current, total) => "Uploading ${current} of ${total}";

  static String m9(count) =>
      "Generates title (max 36 chars), subtitle (max 99) and description (max 369) for your promotion. You have ${count} uses left this month.";

  static String m10(limit) =>
      "You have used all ${limit} AI-generated promotions for this month. Your quota will reset on the 1st of next month.";

  static String m11(name) =>
      "Block ${name}? You won\'t see their content anymore, and they won\'t see yours.";

  static String m12(businessName) => "New activity at ${businessName}";

  static String m13(actor, businessName) =>
      "${actor} interacted with ${businessName}";

  static String m14(businessName) =>
      "The menu at ${businessName} is getting attention!";

  static String m15(businessName) => "A dish at ${businessName} is trending!";

  static String m16(entityName, businessName) =>
      "\"${entityName}\" at ${businessName} is trending!";

  static String m17(actor, businessName) =>
      "${actor} liked a dish at ${businessName}";

  static String m18(actor, entityName, businessName) =>
      "${actor} liked \"${entityName}\" at ${businessName}";

  static String m19(entityName, businessName) =>
      "\"${entityName}\" at ${businessName} is getting attention!";

  static String m20(actor, businessName) =>
      "${actor} saved a menu from ${businessName}";

  static String m21(actor, entityName, businessName) =>
      "${actor} saved the \"${entityName}\" menu from ${businessName}";

  static String m22(businessName) =>
      "A promotion at ${businessName} is popular!";

  static String m23(entityName, businessName) =>
      "\"${entityName}\" at ${businessName} is popular!";

  static String m24(actor, businessName) =>
      "${actor} saved a promo from ${businessName}";

  static String m25(actor, entityName, businessName) =>
      "${actor} saved the \"${entityName}\" promo from ${businessName}";

  static String m26(businessName) => "${businessName} has a new follower!";

  static String m27(businessName) =>
      "${businessName} just posted a new promotion!";

  static String m28(businessName) => "New review at ${businessName}!";

  static String m29(actor, businessName) =>
      "${actor} left a review at ${businessName}";

  static String m30(businessName) => "${businessName} updated a promotion";

  static String m31(currentLabel) => "Rename \"${currentLabel}\" section";

  static String m32(year) => "Copyright © ${year} - All rights reserved";

  static String m33(businessName) => "Edit your review for ${businessName}";

  static String m34(phone) => "Enter the code sent to ${phone}";

  static String m35(errorMsg) => "Failed to delete item photos:\n\n${errorMsg}";

  static String m36(business) =>
      "${business} is already preparing it. Keep ordering — you pay it all at the end.";

  static String m37(name, amount) => "Pay ${name}\'s share (${amount})?";

  static String m38(amount) => "Extra time: ${amount} missing";

  static String m39(business, code) =>
      "Join our order at ${business}! Open Foodly, go to the restaurant menu and use code ${code}";

  static String m40(name) => "Paid by ${name}";

  static String m41(paid, total) => "${paid} of ${total} paid";

  static String m42(amount) => "Pay everything remaining (${amount})?";

  static String m43(amount) => "Pay all remaining · ${amount}";

  static String m44(amount) => "Pay the bill · ${amount}";

  static String m45(amount) => "Pay the order · ${amount}";

  static String m46(amount) => "Pay my share · ${amount}";

  static String m47(total) =>
      "All payments complete · ${total}. Receipt sent to your email.";

  static String m48(amount) =>
      "This flat ${amount} per-transaction fee goes to the platform that securely processes your card payment. It is not charged by Foodly or the restaurant.";

  static String m49(amount) => "Includes a ${amount} payment platform fee";

  static String m50(base, fee) =>
      "Your payment: ${base} + ${fee} processing fee";

  static String m51(name) => "Transfer ownership to ${name}?";

  static String m52(guests, items) => "${guests} guests · ${items} items";

  static String m53(count, total) => "${count} orders · ${total}";

  static String m54(delivered, total) =>
      "${delivered}/${total} items delivered";

  static String m55(n) => "ROUND ${n}";

  static String m56(size) => "max ${size}";

  static String m57(maxSize) => "Max Size: ${maxSize}";

  static String m58(count) => "${count} new messages";

  static String m59(radius) =>
      "No nearby businesses in this category within ${radius} km.";

  static String m60(text) => "Notes: ${text}";

  static String m61(count) => "Party size: ${count}";

  static String m62(count) => "You have ${count} pending reservations";

  static String m63(max) => "Maximum ${max} photos";

  static String m64(max) => "Photos (optional, up to ${max})";

  static String m65(action, errorMsg) =>
      "Something went wrong when ${action} the item photo(s): ${errorMsg}";

  static String m66(maxImages) =>
      "Press to add photos, up to a maximum of ${maxImages} images";

  static String m67(currency, price) => "from ${currency}${price}";

  static String m68(seconds) => "Resend in ${seconds}s";

  static String m69(businessName) => "Reserve a table at ${businessName}";

  static String m70(city) => "Search in ${city}...";

  static String m71(businessName, appName, menuUrl) =>
      "🍽️ Check out ${businessName}\'s menu on 🌟 ${appName}: \n${menuUrl}";

  static String m72(text) => "Special requests: ${text}";

  static String m73(count) => "${count}d ago";

  static String m74(count) => "${count}h ago";

  static String m75(count) => "${count}m ago";

  static String m76(date) => "Visited on ${date}";

  static String m77(businessName) => "Write a review for ${businessName}";

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
      "Foodly is free to use — for businesses and customers alike. A 3% commission applies only to orders customers pay through Foodly, and it already covers payment processing. Anything paid at the counter or in cash costs nothing. No subscriptions, no hidden fees, no surprises.",
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
      "Foodly Manifesto",
    ),
    "acceptAndContinue": MessageLookupByLibrary.simpleMessage(
      "Accept and continue",
    ),
    "acceptServiceRequests": MessageLookupByLibrary.simpleMessage(
      "Accept requests",
    ),
    "accessiblePMR": MessageLookupByLibrary.simpleMessage("Accessible PMR"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activePackageHint": MessageLookupByLibrary.simpleMessage(
      "Active packages are visible to customers",
    ),
    "addADescription": MessageLookupByLibrary.simpleMessage(
      "Add a description",
    ),
    "addANewTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Add a new time period",
    ),
    "addAdditionalInformation": MessageLookupByLibrary.simpleMessage(
      "Add additional information",
    ),
    "addAnotherBlock": MessageLookupByLibrary.simpleMessage(
      "Add another block",
    ),
    "addCertification": MessageLookupByLibrary.simpleMessage(
      "Add certification",
    ),
    "addContact": MessageLookupByLibrary.simpleMessage("Add contact channels"),
    "addCuisine": MessageLookupByLibrary.simpleMessage("Add cuisine"),
    "addItem": MessageLookupByLibrary.simpleMessage("Add item"),
    "addLanguage": MessageLookupByLibrary.simpleMessage("Add language"),
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
    "addPhoto": MessageLookupByLibrary.simpleMessage("Add photo"),
    "addServices": MessageLookupByLibrary.simpleMessage("Add Services"),
    "addSpecialtiesAndDetails": MessageLookupByLibrary.simpleMessage(
      "Add your specialties and details",
    ),
    "addSpecialty": MessageLookupByLibrary.simpleMessage("Add specialty"),
    "addTagline": MessageLookupByLibrary.simpleMessage("Add a catchy tagline"),
    "addTitle": MessageLookupByLibrary.simpleMessage("Add a title"),
    "addToCalendar": MessageLookupByLibrary.simpleMessage("Add to calendar"),
    "addToFavorites": MessageLookupByLibrary.simpleMessage(
      "Add to your favorites",
    ),
    "addYoutubeUrl": MessageLookupByLibrary.simpleMessage("Add YouTube URL"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "admin": MessageLookupByLibrary.simpleMessage("Administrator"),
    "aiMenuImportAnalyzeCta": MessageLookupByLibrary.simpleMessage(
      "Analyze with AI",
    ),
    "aiMenuImportCamera": MessageLookupByLibrary.simpleMessage("Camera"),
    "aiMenuImportDisclaimer": MessageLookupByLibrary.simpleMessage(
      "This feature uses AI to extract menu items from your photos. AI can make mistakes — review names, prices and descriptions before confirming.",
    ),
    "aiMenuImportEmptyStateCta": MessageLookupByLibrary.simpleMessage(
      "Import with AI",
    ),
    "aiMenuImportEmptyStateManualHint": MessageLookupByLibrary.simpleMessage(
      "To add them by hand, open the floating menu and tap Edit",
    ),
    "aiMenuImportEmptyStateSubtitle": MessageLookupByLibrary.simpleMessage(
      "Upload photos of your menu sections and AI extracts the items, categories and prices automatically.",
    ),
    "aiMenuImportEmptyStateTitle": MessageLookupByLibrary.simpleMessage(
      "Digitize your menu",
    ),
    "aiMenuImportGallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "aiMenuImportHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "Upload photos of your menu and AI extracts items, categories and prices automatically.",
    ),
    "aiMenuImportHeroTitle": MessageLookupByLibrary.simpleMessage(
      "Digitize your menu with AI",
    ),
    "aiMenuImportParsing": m0,
    "aiMenuImportParsingHint": MessageLookupByLibrary.simpleMessage(
      "AI may take a few seconds per photo",
    ),
    "aiMenuImportReviewConfidenceCheck": MessageLookupByLibrary.simpleMessage(
      "Review",
    ),
    "aiMenuImportReviewConfidenceOk": MessageLookupByLibrary.simpleMessage(
      "OK",
    ),
    "aiMenuImportReviewConfidenceVerify": MessageLookupByLibrary.simpleMessage(
      "Verify",
    ),
    "aiMenuImportReviewConfirmCta": MessageLookupByLibrary.simpleMessage(
      "Add to menu",
    ),
    "aiMenuImportReviewConfirming": MessageLookupByLibrary.simpleMessage(
      "Saving…",
    ),
    "aiMenuImportReviewDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Add description (optional)",
    ),
    "aiMenuImportReviewFooterCount": m1,
    "aiMenuImportReviewHeaderHint": MessageLookupByLibrary.simpleMessage(
      "Review names and prices. Tap the X to remove items you don\'t want.",
    ),
    "aiMenuImportReviewHeaderTitle": m2,
    "aiMenuImportReviewPending": MessageLookupByLibrary.simpleMessage(
      "Review screen coming soon — you\'ll be able to edit before confirming",
    ),
    "aiMenuImportReviewTitle": MessageLookupByLibrary.simpleMessage(
      "Review your menu",
    ),
    "aiMenuImportReviewVersionBig": MessageLookupByLibrary.simpleMessage(
      "Large",
    ),
    "aiMenuImportReviewVersionMedium": MessageLookupByLibrary.simpleMessage(
      "Medium",
    ),
    "aiMenuImportReviewVersionRegular": MessageLookupByLibrary.simpleMessage(
      "Regular",
    ),
    "aiMenuImportSelectedPhotosLabel": m3,
    "aiMenuImportSuccessCta": MessageLookupByLibrary.simpleMessage(
      "View my menu",
    ),
    "aiMenuImportSuccessHint": MessageLookupByLibrary.simpleMessage(
      "You can now add photos to each item, adjust prices or reorder them anytime.",
    ),
    "aiMenuImportSuccessStatCombos": m4,
    "aiMenuImportSuccessStatDrinks": m5,
    "aiMenuImportSuccessStatFood": m6,
    "aiMenuImportSuccessSubtitle": m7,
    "aiMenuImportSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Your menu is ready!",
    ),
    "aiMenuImportTips": MessageLookupByLibrary.simpleMessage(
      "For best results: one photo per section, good lighting, no glare, no parallel columns.",
    ),
    "aiMenuImportTitle": MessageLookupByLibrary.simpleMessage(
      "Import menu with AI",
    ),
    "aiMenuImportUploading": m8,
    "aiMenuImportUploadingHint": MessageLookupByLibrary.simpleMessage(
      "Securely uploading your photos to Foodly",
    ),
    "aiPromoContent": m9,
    "aiPromoGenerate": MessageLookupByLibrary.simpleMessage("Generate"),
    "aiPromoImageLabel": MessageLookupByLibrary.simpleMessage(
      "Include promotional image (16:9)",
    ),
    "aiPromoImageNatural": MessageLookupByLibrary.simpleMessage("Natural"),
    "aiPromoImageVivid": MessageLookupByLibrary.simpleMessage("Vivid"),
    "aiPromoQuotaExhaustedContent": m10,
    "aiPromoQuotaExhaustedTitle": MessageLookupByLibrary.simpleMessage(
      "Monthly Quota Reached",
    ),
    "aiPromoTitle": MessageLookupByLibrary.simpleMessage(
      "AI Promotion Generator",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allBookings": MessageLookupByLibrary.simpleMessage("All"),
    "allowLocationInSettings": MessageLookupByLibrary.simpleMessage(
      "Allow in Settings",
    ),
    "allowLocationInSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Tap to open app settings and enable location",
    ),
    "allowReservations": MessageLookupByLibrary.simpleMessage(
      "Allow Reservations",
    ),
    "alphabetical": MessageLookupByLibrary.simpleMessage("A-Z"),
    "alreadyReviewedPrompt": MessageLookupByLibrary.simpleMessage(
      "You already reviewed this business.\nWould you like to edit your review?",
    ),
    "analytics": MessageLookupByLibrary.simpleMessage("Analytics"),
    "analyticsAvailabilityChecks": MessageLookupByLibrary.simpleMessage(
      "Availability checks",
    ),
    "analyticsAvgResponseHours": MessageLookupByLibrary.simpleMessage(
      "Response time",
    ),
    "analyticsBookingSuccessRate": MessageLookupByLibrary.simpleMessage(
      "Success rate",
    ),
    "analyticsBookings": MessageLookupByLibrary.simpleMessage("Bookings"),
    "analyticsBookingsTotal": MessageLookupByLibrary.simpleMessage(
      "Service bookings",
    ),
    "analyticsComingSoon": MessageLookupByLibrary.simpleMessage(
      "Analytics Dashboard — Coming Soon\nGet deep insights into your traffic, top dishes, customer trends, and revenue — all in one place. Stay tuned.",
    ),
    "analyticsInquiryToBooking": MessageLookupByLibrary.simpleMessage(
      "Inquiry → Booking",
    ),
    "analyticsLabelBookingStarted": MessageLookupByLibrary.simpleMessage(
      "Booking started",
    ),
    "analyticsLabelBookingSubmitted": MessageLookupByLibrary.simpleMessage(
      "Booking submitted",
    ),
    "analyticsLabelBookingSucceeded": MessageLookupByLibrary.simpleMessage(
      "Booking confirmed",
    ),
    "analyticsLabelBusinessOpen": MessageLookupByLibrary.simpleMessage(
      "Business views",
    ),
    "analyticsLabelCtaClicked": MessageLookupByLibrary.simpleMessage(
      "Contact taps",
    ),
    "analyticsLabelCtaDirections": MessageLookupByLibrary.simpleMessage(
      "Get directions",
    ),
    "analyticsLabelCtaInstagram": MessageLookupByLibrary.simpleMessage(
      "Instagram",
    ),
    "analyticsLabelCtaPhone": MessageLookupByLibrary.simpleMessage(
      "Phone calls",
    ),
    "analyticsLabelCtaWebsite": MessageLookupByLibrary.simpleMessage(
      "Website visits",
    ),
    "analyticsLabelCtaWhatsapp": MessageLookupByLibrary.simpleMessage(
      "WhatsApp",
    ),
    "analyticsLabelFavoriteAdded": MessageLookupByLibrary.simpleMessage(
      "Added to favorites",
    ),
    "analyticsLabelFavoriteRemoved": MessageLookupByLibrary.simpleMessage(
      "Removed from favorites",
    ),
    "analyticsLabelMenuViewed": MessageLookupByLibrary.simpleMessage(
      "Menu views",
    ),
    "analyticsLabelPackageInquiry": MessageLookupByLibrary.simpleMessage(
      "Inquiries",
    ),
    "analyticsLabelPackageView": MessageLookupByLibrary.simpleMessage(
      "Package views",
    ),
    "analyticsLabelProfileView": MessageLookupByLibrary.simpleMessage(
      "Profile views",
    ),
    "analyticsLabelReservationStarted": MessageLookupByLibrary.simpleMessage(
      "Reservations started",
    ),
    "analyticsLabelReservationSubmitted": MessageLookupByLibrary.simpleMessage(
      "Reservations sent",
    ),
    "analyticsLabelReservationSucceeded": MessageLookupByLibrary.simpleMessage(
      "Reservations completed",
    ),
    "analyticsLabelReviewCreated": MessageLookupByLibrary.simpleMessage(
      "Reviews received",
    ),
    "analyticsLabelSearchResult": MessageLookupByLibrary.simpleMessage(
      "Search appearances",
    ),
    "analyticsLabelShare": MessageLookupByLibrary.simpleMessage("Shares"),
    "analyticsStatusCancelled": MessageLookupByLibrary.simpleMessage(
      "Cancelled",
    ),
    "analyticsStatusCompleted": MessageLookupByLibrary.simpleMessage(
      "Completed",
    ),
    "analyticsStatusConfirmed": MessageLookupByLibrary.simpleMessage(
      "Confirmed",
    ),
    "analyticsStatusNoShow": MessageLookupByLibrary.simpleMessage("No show"),
    "analyticsStatusPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "analyticsStatusRejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "analyticsTitle": MessageLookupByLibrary.simpleMessage("Analytics"),
    "analyticsTopPackagesTitle": MessageLookupByLibrary.simpleMessage(
      "Top packages",
    ),
    "analyticsViewToBooking": MessageLookupByLibrary.simpleMessage(
      "View → Booking",
    ),
    "analyticsViewToInquiry": MessageLookupByLibrary.simpleMessage(
      "View → Inquiry",
    ),
    "and": MessageLookupByLibrary.simpleMessage("and"),
    "andCreateContentToThese": MessageLookupByLibrary.simpleMessage(
      "and manage content, promotions, and more",
    ),
    "approveQuote": MessageLookupByLibrary.simpleMessage("Approve quote"),
    "april": MessageLookupByLibrary.simpleMessage("April"),
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
    "august": MessageLookupByLibrary.simpleMessage("August"),
    "availability": MessageLookupByLibrary.simpleMessage("Availability"),
    "availabilityCalendar": MessageLookupByLibrary.simpleMessage(
      "Availability calendar",
    ),
    "avgRating": MessageLookupByLibrary.simpleMessage("Avg. rating"),
    "awaitingQuote": MessageLookupByLibrary.simpleMessage("Awaiting quote"),
    "babyChangingStation": MessageLookupByLibrary.simpleMessage(
      "Baby Changing Station",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "bakeryAndDesserts": MessageLookupByLibrary.simpleMessage(
      "Bakery and Desserts",
    ),
    "barsAndPubs": MessageLookupByLibrary.simpleMessage("Bars & Pubs"),
    "big": MessageLookupByLibrary.simpleMessage("Big"),
    "biometricSnackbarTextSpanA": MessageLookupByLibrary.simpleMessage(
      "This device\'s operating system does not support or has not configured biometric or pattern accesses.",
    ),
    "biometricSnackbarTextSpanB": MessageLookupByLibrary.simpleMessage(
      "The session has expired, you must log in with your username and password, or access via Google Sign-In.",
    ),
    "birthday": MessageLookupByLibrary.simpleMessage("Birthday"),
    "blockAction": MessageLookupByLibrary.simpleMessage("Block"),
    "blockDate": MessageLookupByLibrary.simpleMessage("Block date"),
    "blockUser": MessageLookupByLibrary.simpleMessage("Block user"),
    "blockUserConfirm": m11,
    "blockedSuccess": MessageLookupByLibrary.simpleMessage("User blocked"),
    "blockedUsers": MessageLookupByLibrary.simpleMessage("Blocked users"),
    "blockedUsersEmpty": MessageLookupByLibrary.simpleMessage(
      "You haven\'t blocked anyone.",
    ),
    "blocksOn": MessageLookupByLibrary.simpleMessage("Blocks on"),
    "bookingDetail": MessageLookupByLibrary.simpleMessage("Booking detail"),
    "bookingMessages": MessageLookupByLibrary.simpleMessage("Messages"),
    "bookingPricing": MessageLookupByLibrary.simpleMessage("Booking & pricing"),
    "brands": MessageLookupByLibrary.simpleMessage("brands"),
    "brazilian": MessageLookupByLibrary.simpleMessage("Brazilian"),
    "brunch": MessageLookupByLibrary.simpleMessage("Brunch"),
    "budgetEstimate": MessageLookupByLibrary.simpleMessage("Budget estimate"),
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
    "businessNotAcceptingRequestsNow": MessageLookupByLibrary.simpleMessage(
      "This business isn\'t accepting requests right now",
    ),
    "businessRegister": MessageLookupByLibrary.simpleMessage(
      "Register Business",
    ),
    "businesses": MessageLookupByLibrary.simpleMessage("businesses"),
    "buzz": MessageLookupByLibrary.simpleMessage("Buzz"),
    "buzzDefaultActivity": m12,
    "buzzDefaultActivitySocial": m13,
    "buzzEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Community activity will appear here",
    ),
    "buzzEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "No buzz nearby yet",
    ),
    "buzzNewFavoriteMenu": m14,
    "buzzNewFavoriteMenuItem": m15,
    "buzzNewFavoriteMenuItemNamed": m16,
    "buzzNewFavoriteMenuItemSocial": m17,
    "buzzNewFavoriteMenuItemSocialNamed": m18,
    "buzzNewFavoriteMenuNamed": m19,
    "buzzNewFavoriteMenuSocial": m20,
    "buzzNewFavoriteMenuSocialNamed": m21,
    "buzzNewFavoritePromotion": m22,
    "buzzNewFavoritePromotionNamed": m23,
    "buzzNewFavoritePromotionSocial": m24,
    "buzzNewFavoritePromotionSocialNamed": m25,
    "buzzNewFollower": m26,
    "buzzNewPromotion": m27,
    "buzzNewReview": m28,
    "buzzNewReviewSocial": m29,
    "buzzPromotionUpdate": m30,
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
    "cancellationDetails": MessageLookupByLibrary.simpleMessage(
      "Cancellation details",
    ),
    "cancellationDetailsHint": MessageLookupByLibrary.simpleMessage(
      "Describe the cancellation terms",
    ),
    "cancellationPolicy": MessageLookupByLibrary.simpleMessage(
      "Cancellation policy",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "cannotReviewOwnBusiness": MessageLookupByLibrary.simpleMessage(
      "You cannot review your own business.",
    ),
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
    "cateringAndChefs": MessageLookupByLibrary.simpleMessage(
      "Catering & Chefs",
    ),
    "certificationExample": MessageLookupByLibrary.simpleMessage("E.g.: HACCP"),
    "certifications": MessageLookupByLibrary.simpleMessage("Certifications"),
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
    "cocktail": MessageLookupByLibrary.simpleMessage("Cocktail"),
    "combos": MessageLookupByLibrary.simpleMessage("Combos"),
    "combosLabelCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "combosLabelHint": MessageLookupByLibrary.simpleMessage(
      "Pick or create the label that best fits your business",
    ),
    "combosLabelMenus": MessageLookupByLibrary.simpleMessage("Menus"),
    "combosLabelPlatters": MessageLookupByLibrary.simpleMessage("Platters"),
    "combosLabelSetMeals": MessageLookupByLibrary.simpleMessage("Set Meals"),
    "combosLabelSpecials": MessageLookupByLibrary.simpleMessage("Specials"),
    "combosLabelTitle": m31,
    "communityGuidelinesNotice": MessageLookupByLibrary.simpleMessage(
      "By posting, you agree to our Community Guidelines.",
    ),
    "complete": MessageLookupByLibrary.simpleMessage("Complete"),
    "completeSignUp": MessageLookupByLibrary.simpleMessage(
      "Complete Registration",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "composure": MessageLookupByLibrary.simpleMessage("Composure"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmApproveQuote": MessageLookupByLibrary.simpleMessage(
      "Approve this quote?",
    ),
    "confirmApproveQuoteMessage": MessageLookupByLibrary.simpleMessage(
      "By approving, you confirm the booking. Payment is handled outside the platform.",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPasswordForEmailChange": MessageLookupByLibrary.simpleMessage(
      "For security, please enter your current password to change your email.",
    ),
    "confirmPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Confirm your password",
    ),
    "confirmPhoneForVerification": MessageLookupByLibrary.simpleMessage(
      "Confirm the phone number to receive your verification code.",
    ),
    "confirmRejectQuote": MessageLookupByLibrary.simpleMessage(
      "Reject this quote?",
    ),
    "confirmRejectQuoteMessage": MessageLookupByLibrary.simpleMessage(
      "Rejecting closes this request and notifies the business. This action can\'t be undone.",
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
    "cookingClass": MessageLookupByLibrary.simpleMessage("Cooking class"),
    "cookingSchools": MessageLookupByLibrary.simpleMessage("Cooking Schools"),
    "copyrightText": m32,
    "corporate": MessageLookupByLibrary.simpleMessage("Corporate"),
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
    "createPackage": MessageLookupByLibrary.simpleMessage("Create package"),
    "createPostTitle": MessageLookupByLibrary.simpleMessage("Create Post"),
    "createUser": MessageLookupByLibrary.simpleMessage("Create User"),
    "cropImage": MessageLookupByLibrary.simpleMessage("Crop Image"),
    "cuisineExample": MessageLookupByLibrary.simpleMessage(
      "E.g.: Mediterranean",
    ),
    "cuisines": MessageLookupByLibrary.simpleMessage("Cuisines"),
    "currency": MessageLookupByLibrary.simpleMessage("Currency"),
    "custom": MessageLookupByLibrary.simpleMessage("Custom"),
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
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "dateBlocked": MessageLookupByLibrary.simpleMessage("Date blocked"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "datePartiallyBlockedInfo": MessageLookupByLibrary.simpleMessage(
      "That day has partially booked time slots. We may ask you to adjust the time.",
    ),
    "dateUnavailable": MessageLookupByLibrary.simpleMessage(
      "That date was just blocked. Please pick another one.",
    ),
    "december": MessageLookupByLibrary.simpleMessage("December"),
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
    "deleteBlock": MessageLookupByLibrary.simpleMessage("Delete block"),
    "deleteBlockConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this block? This cannot be undone.",
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
    "deletePackage": MessageLookupByLibrary.simpleMessage("Delete package"),
    "deletePackageConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this package? This action cannot be undone.",
    ),
    "deletePostConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this post?",
    ),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage("Delete Post"),
    "delivery": MessageLookupByLibrary.simpleMessage("Delivery"),
    "depositPercentage": MessageLookupByLibrary.simpleMessage(
      "Deposit percentage",
    ),
    "depositRequired": MessageLookupByLibrary.simpleMessage("Deposit required"),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Description"),
    "dietaryNotes": MessageLookupByLibrary.simpleMessage("Dietary notes"),
    "dinner": MessageLookupByLibrary.simpleMessage("Dinner"),
    "doItLater": MessageLookupByLibrary.simpleMessage("I\'ll do it later"),
    "doYouWantToDeleteThisCoverImage": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this cover image?",
    ),
    "downloadApp": MessageLookupByLibrary.simpleMessage("Get the app"),
    "downloadQrImage": MessageLookupByLibrary.simpleMessage(
      "Download QR image",
    ),
    "drinks": MessageLookupByLibrary.simpleMessage("Drinks"),
    "durationHours": MessageLookupByLibrary.simpleMessage("Duration (hours)"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editCoverImages": MessageLookupByLibrary.simpleMessage(
      "Edit Cover Images",
    ),
    "editLocation": MessageLookupByLibrary.simpleMessage("Edit Location"),
    "editMenu": MessageLookupByLibrary.simpleMessage("Edit menu"),
    "editPackage": MessageLookupByLibrary.simpleMessage("Edit package"),
    "editReview": MessageLookupByLibrary.simpleMessage("Edit Review"),
    "editTitle": MessageLookupByLibrary.simpleMessage("Edit Title"),
    "editYourReviewFor": m33,
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailChangeBlockedForSocialUser": MessageLookupByLibrary.simpleMessage(
      "First set a password for your account, then you can change your email.",
    ),
    "emailSectionTitle1": MessageLookupByLibrary.simpleMessage("Your"),
    "emailSectionTitle2": MessageLookupByLibrary.simpleMessage("Email"),
    "emailUpdated": MessageLookupByLibrary.simpleMessage(
      "Your email was updated successfully.",
    ),
    "enableDigitalMenu": MessageLookupByLibrary.simpleMessage(
      "Enable digital menu",
    ),
    "enableDigitalMenuHint": MessageLookupByLibrary.simpleMessage(
      "Show a menu alongside your packages",
    ),
    "enableLocation": MessageLookupByLibrary.simpleMessage("Enable location"),
    "enableLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Tap to enable location access",
    ),
    "end": MessageLookupByLibrary.simpleMessage("End"),
    "endDate": MessageLookupByLibrary.simpleMessage("End date"),
    "endSession": MessageLookupByLibrary.simpleMessage("End Session"),
    "endTime": MessageLookupByLibrary.simpleMessage("End time"),
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
    "enterCodeSentTo": m34,
    "enterQuoteAmount": MessageLookupByLibrary.simpleMessage(
      "Enter quote amount",
    ),
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
    "eventAddress": MessageLookupByLibrary.simpleMessage("Event address"),
    "eventCity": MessageLookupByLibrary.simpleMessage("Event city"),
    "eventLocation": MessageLookupByLibrary.simpleMessage("Event location"),
    "eventType": MessageLookupByLibrary.simpleMessage("Event type"),
    "eventTypeBirthday": MessageLookupByLibrary.simpleMessage("Birthday"),
    "eventTypeBrunch": MessageLookupByLibrary.simpleMessage("Brunch"),
    "eventTypeCocktail": MessageLookupByLibrary.simpleMessage("Cocktail"),
    "eventTypeCookingClassPrivate": MessageLookupByLibrary.simpleMessage(
      "Private cooking class",
    ),
    "eventTypeCorporate": MessageLookupByLibrary.simpleMessage("Corporate"),
    "eventTypeCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "eventTypeDinner": MessageLookupByLibrary.simpleMessage("Dinner"),
    "eventTypeLunch": MessageLookupByLibrary.simpleMessage("Lunch"),
    "eventTypeWedding": MessageLookupByLibrary.simpleMessage("Wedding"),
    "exploreAsGuest": MessageLookupByLibrary.simpleMessage("Explore"),
    "failedDeletePhotos": m35,
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
    "featured": MessageLookupByLibrary.simpleMessage("Featured"),
    "featuredPackageHint": MessageLookupByLibrary.simpleMessage(
      "Featured packages appear first",
    ),
    "february": MessageLookupByLibrary.simpleMessage("February"),
    "feedFilterFollowing": MessageLookupByLibrary.simpleMessage("Following"),
    "feedFilterNearby": MessageLookupByLibrary.simpleMessage("Nearby"),
    "feedFollowingEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Follow users from the Users tab to see their posts here.",
    ),
    "feedFollowingEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "You\'re not following anyone yet",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "fieldRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "findAndCompleteAddress": MessageLookupByLibrary.simpleMessage(
      "Easily find and complete your address",
    ),
    "finishEdit": MessageLookupByLibrary.simpleMessage("Finish edit mode"),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "fixed": MessageLookupByLibrary.simpleMessage("Fixed"),
    "flexible": MessageLookupByLibrary.simpleMessage("Flexible"),
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
    "fromReservation": MessageLookupByLibrary.simpleMessage("Reservation"),
    "fullDay": MessageLookupByLibrary.simpleMessage("Full day"),
    "fusionCuisine": MessageLookupByLibrary.simpleMessage("Fusion"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "generateQR": MessageLookupByLibrary.simpleMessage("Generate QR code"),
    "generateWithAI": MessageLookupByLibrary.simpleMessage("Generate with AI"),
    "generatingQr": MessageLookupByLibrary.simpleMessage("Generating…"),
    "genericErrorRetry": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again.",
    ),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Good Afternoon"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Good Evening"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Good Morning"),
    "groupOrderAddFromMenu": MessageLookupByLibrary.simpleMessage(
      "Add dishes from the menu",
    ),
    "groupOrderBackHome": MessageLookupByLibrary.simpleMessage("Back to home"),
    "groupOrderBackToMenu": MessageLookupByLibrary.simpleMessage(
      "Back to menu",
    ),
    "groupOrderBatchSentBody": m36,
    "groupOrderBatchSentTitle": MessageLookupByLibrary.simpleMessage(
      "Order sent to the kitchen!",
    ),
    "groupOrderCoverConfirm": m37,
    "groupOrderCoverShare": MessageLookupByLibrary.simpleMessage(
      "Cover their share",
    ),
    "groupOrderCreating": MessageLookupByLibrary.simpleMessage("Creating…"),
    "groupOrderDeleteConfirm": MessageLookupByLibrary.simpleMessage(
      "Delete this empty order? This action cannot be undone.",
    ),
    "groupOrderDeleteCta": MessageLookupByLibrary.simpleMessage("Delete order"),
    "groupOrderEnterCodeManually": MessageLookupByLibrary.simpleMessage(
      "Enter code manually",
    ),
    "groupOrderEntryCta": MessageLookupByLibrary.simpleMessage(
      "Order as a group",
    ),
    "groupOrderGraceNotice": m38,
    "groupOrderHostBadge": MessageLookupByLibrary.simpleMessage("Host"),
    "groupOrderInviteCta": MessageLookupByLibrary.simpleMessage("Invite"),
    "groupOrderInviteHint": MessageLookupByLibrary.simpleMessage(
      "Share this code — valid for 24 hours",
    ),
    "groupOrderInviteShareCta": MessageLookupByLibrary.simpleMessage(
      "Share code",
    ),
    "groupOrderInviteShareMsg": m39,
    "groupOrderInviteTitle": MessageLookupByLibrary.simpleMessage(
      "Invite your table",
    ),
    "groupOrderItemsSection": MessageLookupByLibrary.simpleMessage("Items"),
    "groupOrderJoinCta": MessageLookupByLibrary.simpleMessage(
      "Got invited? Join with a code",
    ),
    "groupOrderJoinFailed": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t add you to the order",
    ),
    "groupOrderJoinHint": MessageLookupByLibrary.simpleMessage(
      "Invitation code",
    ),
    "groupOrderJoinTitle": MessageLookupByLibrary.simpleMessage(
      "Join an order",
    ),
    "groupOrderLeaveConfirm": MessageLookupByLibrary.simpleMessage(
      "Leave this order? You can rejoin by scanning the QR.",
    ),
    "groupOrderLeaveCta": MessageLookupByLibrary.simpleMessage(
      "Leave the order",
    ),
    "groupOrderLockConfirmSolo": MessageLookupByLibrary.simpleMessage(
      "Finish the order and proceed to payment? You won\'t be able to add more items.",
    ),
    "groupOrderLockCta": MessageLookupByLibrary.simpleMessage("Finish order"),
    "groupOrderNextRound": MessageLookupByLibrary.simpleMessage(
      "Order another round",
    ),
    "groupOrderNoBalanceDue": MessageLookupByLibrary.simpleMessage(
      "Nothing left to pay",
    ),
    "groupOrderNoItems": MessageLookupByLibrary.simpleMessage("No items yet"),
    "groupOrderOngoingChannelDesc": MessageLookupByLibrary.simpleMessage(
      "Status of your ongoing group order",
    ),
    "groupOrderOngoingChannelName": MessageLookupByLibrary.simpleMessage(
      "Active group order",
    ),
    "groupOrderOrderMore": MessageLookupByLibrary.simpleMessage("Order more"),
    "groupOrderPaidBy": m40,
    "groupOrderPaidProgress": m41,
    "groupOrderParticipants": MessageLookupByLibrary.simpleMessage(
      "Participants",
    ),
    "groupOrderPayAllConfirm": m42,
    "groupOrderPayAllRemaining": m43,
    "groupOrderPayBillCta": m44,
    "groupOrderPayBillHint": MessageLookupByLibrary.simpleMessage(
      "You can split it with the table however you like",
    ),
    "groupOrderPayBlockedHint": MessageLookupByLibrary.simpleMessage(
      "Payment unlocks once everything is served",
    ),
    "groupOrderPayFullOrder": m45,
    "groupOrderPayMyShare": m46,
    "groupOrderPaymentCanceled": MessageLookupByLibrary.simpleMessage(
      "Payment canceled",
    ),
    "groupOrderPaymentFailed": MessageLookupByLibrary.simpleMessage(
      "Payment couldn\'t be completed",
    ),
    "groupOrderPaymentSucceeded": MessageLookupByLibrary.simpleMessage(
      "Payment completed",
    ),
    "groupOrderPaymentSuccessBody": m47,
    "groupOrderPaymentSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Order confirmed!",
    ),
    "groupOrderRequestBillConfirm": MessageLookupByLibrary.simpleMessage(
      "Ask for the bill? You won\'t be able to add more items to this order.",
    ),
    "groupOrderScanHint": MessageLookupByLibrary.simpleMessage(
      "Ask the host to show the order\'s QR code",
    ),
    "groupOrderScanTitle": MessageLookupByLibrary.simpleMessage(
      "Scan your table\'s QR",
    ),
    "groupOrderSeeStatus": MessageLookupByLibrary.simpleMessage(
      "See order status",
    ),
    "groupOrderSendCta": MessageLookupByLibrary.simpleMessage("Send order"),
    "groupOrderSendHint": MessageLookupByLibrary.simpleMessage(
      "The kitchen gets it right away · you pay at the end",
    ),
    "groupOrderServiceFeeExplain": m48,
    "groupOrderServiceFeeNotice": m49,
    "groupOrderServiceFeeTitle": MessageLookupByLibrary.simpleMessage(
      "Processing fee",
    ),
    "groupOrderShareItemTooltip": MessageLookupByLibrary.simpleMessage(
      "Share with the table",
    ),
    "groupOrderSharedBadge": MessageLookupByLibrary.simpleMessage("Shared"),
    "groupOrderSharedBadgeTooltip": MessageLookupByLibrary.simpleMessage(
      "This item is split among everyone at the table",
    ),
    "groupOrderSplitByItems": MessageLookupByLibrary.simpleMessage("By items"),
    "groupOrderSplitByItemsDesc": MessageLookupByLibrary.simpleMessage(
      "Everyone pays for their own; shared items are split.",
    ),
    "groupOrderSplitEqual": MessageLookupByLibrary.simpleMessage("Equal parts"),
    "groupOrderSplitEqualDesc": MessageLookupByLibrary.simpleMessage(
      "The total is split evenly among everyone.",
    ),
    "groupOrderSplitModeTitle": MessageLookupByLibrary.simpleMessage(
      "How should we split the bill?",
    ),
    "groupOrderTipBaseSummary": m50,
    "groupOrderTipCustom": MessageLookupByLibrary.simpleMessage(
      "Custom amount",
    ),
    "groupOrderTipNone": MessageLookupByLibrary.simpleMessage("No tip"),
    "groupOrderTipTitle": MessageLookupByLibrary.simpleMessage(
      "Would you like to tip?",
    ),
    "groupOrderTitle": MessageLookupByLibrary.simpleMessage("Group order"),
    "groupOrderTotal": MessageLookupByLibrary.simpleMessage("Order total"),
    "groupOrderTrackConfirmed": MessageLookupByLibrary.simpleMessage(
      "The business got your order",
    ),
    "groupOrderTrackDelivered": MessageLookupByLibrary.simpleMessage(
      "Order delivered — enjoy!",
    ),
    "groupOrderTrackPreparing": MessageLookupByLibrary.simpleMessage(
      "Your order is being prepared",
    ),
    "groupOrderTrackReady": MessageLookupByLibrary.simpleMessage(
      "Your order is ready!",
    ),
    "groupOrderTransferHost": MessageLookupByLibrary.simpleMessage(
      "Transfer ownership",
    ),
    "groupOrderTransferHostConfirm": m51,
    "groupOrderUnlockConfirm": MessageLookupByLibrary.simpleMessage(
      "Reopen the order? Prices unfreeze and items can be edited again.",
    ),
    "groupOrderUnlockCta": MessageLookupByLibrary.simpleMessage("Reopen order"),
    "groupOrderViewOrder": MessageLookupByLibrary.simpleMessage("View order"),
    "groupOrderYourShare": MessageLookupByLibrary.simpleMessage("Your share"),
    "guestCount": MessageLookupByLibrary.simpleMessage("Guest count"),
    "guestGateCommunity": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to see the community.",
    ),
    "guestGateFaved": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to see your favorite businesses.",
    ),
    "guestGateFavorite": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to save favorites.",
    ),
    "guestGateGeneric": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to use this feature.",
    ),
    "guestGateGroupOrder": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to start a group order.",
    ),
    "guestGateNotifications": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to see your notifications.",
    ),
    "guestGatePost": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to post in the community.",
    ),
    "guestGateProfile": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to access your profile.",
    ),
    "guestGateReserve": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to book a table.",
    ),
    "guestGateReview": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to leave a review.",
    ),
    "guestGateSaved": MessageLookupByLibrary.simpleMessage(
      "Log in or sign up to see your saved promotions.",
    ),
    "guestGateTitle": MessageLookupByLibrary.simpleMessage(
      "Create your account",
    ),
    "guestUserName": MessageLookupByLibrary.simpleMessage("Guest"),
    "guests": MessageLookupByLibrary.simpleMessage("guests"),
    "happyBirthday": MessageLookupByLibrary.simpleMessage("Happy Birthday"),
    "happyHours": MessageLookupByLibrary.simpleMessage("Happy Hours"),
    "hasInsurance": MessageLookupByLibrary.simpleMessage("Has insurance"),
    "hi": MessageLookupByLibrary.simpleMessage("Hi"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "imageSizeLessThan10mb": MessageLookupByLibrary.simpleMessage(
      "Image size must be less than 10MB",
    ),
    "includeItemHint": MessageLookupByLibrary.simpleMessage(
      "E.g.: Starter, main course, dessert",
    ),
    "includes": MessageLookupByLibrary.simpleMessage("Includes"),
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
    "insuranceHint": MessageLookupByLibrary.simpleMessage(
      "Liability insurance coverage",
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
    "invalidValue": MessageLookupByLibrary.simpleMessage("Invalid value"),
    "invalidYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "Invalid YouTube URL",
    ),
    "iosComingSoonMessage": MessageLookupByLibrary.simpleMessage(
      "Coming very soon to iPhone! Foodly arrives on the App Store during June 2026.",
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
    "january": MessageLookupByLibrary.simpleMessage("January"),
    "july": MessageLookupByLibrary.simpleMessage("July"),
    "june": MessageLookupByLibrary.simpleMessage("June"),
    "kidChairs": MessageLookupByLibrary.simpleMessage("Kid Chairs"),
    "kidsMenu": MessageLookupByLibrary.simpleMessage("Kids menu"),
    "kidsPlayArea": MessageLookupByLibrary.simpleMessage("Kids Play Area"),
    "koreanCuisine": MessageLookupByLibrary.simpleMessage("Korean"),
    "languageExample": MessageLookupByLibrary.simpleMessage("E.g.: English"),
    "languages": MessageLookupByLibrary.simpleMessage("Languages"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "legendAutoReservation": MessageLookupByLibrary.simpleMessage(
      "Reservation",
    ),
    "legendFullDayBlock": MessageLookupByLibrary.simpleMessage("Full day"),
    "legendPartialBlock": MessageLookupByLibrary.simpleMessage("Partial"),
    "likes": MessageLookupByLibrary.simpleMessage("Likes"),
    "listening": MessageLookupByLibrary.simpleMessage("Listening"),
    "liveMusic": MessageLookupByLibrary.simpleMessage("Live Music"),
    "loadLogo": MessageLookupByLibrary.simpleMessage("Load Logo"),
    "loadingAvailability": MessageLookupByLibrary.simpleMessage(
      "Loading availability…",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Location permission denied. We need your location to show nearby restaurants.",
    ),
    "locationPermissionPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
      "Location permanently denied. Please enable it in app settings.",
    ),
    "locationPermissionWebInstructions": MessageLookupByLibrary.simpleMessage(
      "Enable location from the lock icon in your browser\'s address bar.",
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
    "longPressToDrag": MessageLookupByLibrary.simpleMessage(
      "Long press and drag to reorder",
    ),
    "lunch": MessageLookupByLibrary.simpleMessage("Lunch"),
    "mainPromos": MessageLookupByLibrary.simpleMessage("Featured Promotions"),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "manage": MessageLookupByLibrary.simpleMessage("Manage"),
    "manageReservations": MessageLookupByLibrary.simpleMessage(
      "Manage Reservations",
    ),
    "managerActivatePaymentsBody": MessageLookupByLibrary.simpleMessage(
      "Verify your business with Stripe to receive order payments straight to your bank account. Takes ~5 minutes.",
    ),
    "managerActivatePaymentsTitle": MessageLookupByLibrary.simpleMessage(
      "Activate payments for your business",
    ),
    "managerActivateWithStripe": MessageLookupByLibrary.simpleMessage(
      "Activate with Stripe →",
    ),
    "managerAssignTable": MessageLookupByLibrary.simpleMessage("Assign table"),
    "managerBadgeConfirmed": MessageLookupByLibrary.simpleMessage("CONFIRMED"),
    "managerBadgeDelivered": MessageLookupByLibrary.simpleMessage("DELIVERED"),
    "managerBadgePreparing": MessageLookupByLibrary.simpleMessage("PREPARING"),
    "managerBadgeReady": MessageLookupByLibrary.simpleMessage("READY"),
    "managerBucketAll": MessageLookupByLibrary.simpleMessage("All"),
    "managerBucketDelivered": MessageLookupByLibrary.simpleMessage("Delivered"),
    "managerBucketPending": MessageLookupByLibrary.simpleMessage("Active"),
    "managerBucketPreparing": MessageLookupByLibrary.simpleMessage("Preparing"),
    "managerBucketReady": MessageLookupByLibrary.simpleMessage("Ready"),
    "managerChecklistHint": MessageLookupByLibrary.simpleMessage(
      "Tap each item to mark it as delivered",
    ),
    "managerDeliverAll": MessageLookupByLibrary.simpleMessage("Check all"),
    "managerDeliverAllAndClose": MessageLookupByLibrary.simpleMessage(
      "Deliver everything at once",
    ),
    "managerGenericError": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t complete that action. Try again.",
    ),
    "managerGuestsMeta": m52,
    "managerHistoryDaySummary": m53,
    "managerHistoryEmpty": MessageLookupByLibrary.simpleMessage(
      "No past orders yet",
    ),
    "managerHistoryTitle": MessageLookupByLibrary.simpleMessage("History"),
    "managerHistoryYesterday": MessageLookupByLibrary.simpleMessage(
      "Yesterday",
    ),
    "managerItemsDelivered": m54,
    "managerLiveOrders": MessageLookupByLibrary.simpleMessage("Live orders"),
    "managerMarkDelivered": MessageLookupByLibrary.simpleMessage(
      "Mark as DELIVERED",
    ),
    "managerMarkPreparing": MessageLookupByLibrary.simpleMessage(
      "Mark as PREPARING",
    ),
    "managerMarkReady": MessageLookupByLibrary.simpleMessage("Mark as READY"),
    "managerNewOrderGo": MessageLookupByLibrary.simpleMessage("Go handle it"),
    "managerNewOrderLater": MessageLookupByLibrary.simpleMessage("Not now"),
    "managerNewOrderTitle": MessageLookupByLibrary.simpleMessage(
      "New paid order!",
    ),
    "managerNoOrders": MessageLookupByLibrary.simpleMessage("No orders yet"),
    "managerOrders": MessageLookupByLibrary.simpleMessage("Orders"),
    "managerPaidComplete": MessageLookupByLibrary.simpleMessage("Fully paid"),
    "managerPaymentsActive": MessageLookupByLibrary.simpleMessage(
      "Payments active",
    ),
    "managerPaymentsActiveSub": MessageLookupByLibrary.simpleMessage(
      "Verified with Stripe · payouts enabled",
    ),
    "managerPaymentsRefresh": MessageLookupByLibrary.simpleMessage(
      "Refresh status",
    ),
    "managerRound": m55,
    "managerTableHint": MessageLookupByLibrary.simpleMessage(
      "E.g.: 7, Bar 2, Terrace",
    ),
    "march": MessageLookupByLibrary.simpleMessage("March"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "markedNoShow": MessageLookupByLibrary.simpleMessage("Marked as no-show."),
    "marketsAndStores": MessageLookupByLibrary.simpleMessage(
      "Markets and Stores",
    ),
    "maxGuests": MessageLookupByLibrary.simpleMessage("Max. guests"),
    "maxPartySize": m56,
    "maxSize": m57,
    "maxSizeLabel": MessageLookupByLibrary.simpleMessage("Max"),
    "maximum": MessageLookupByLibrary.simpleMessage("Maximum"),
    "may": MessageLookupByLibrary.simpleMessage("May"),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "menu": MessageLookupByLibrary.simpleMessage("Menu"),
    "menus": MessageLookupByLibrary.simpleMessage("Menus"),
    "message": MessageLookupByLibrary.simpleMessage("Message"),
    "messageThread": MessageLookupByLibrary.simpleMessage("Message thread"),
    "mexicanCuisine": MessageLookupByLibrary.simpleMessage("Mexican"),
    "micPermissionDeniedMessage": MessageLookupByLibrary.simpleMessage(
      "Voice Search uses your microphone to find great places nearby. Grant microphone access in Settings to start exploring with your voice.",
    ),
    "minBookingAmount": MessageLookupByLibrary.simpleMessage("Minimum amount"),
    "minGuests": MessageLookupByLibrary.simpleMessage("Min. guests"),
    "minimum": MessageLookupByLibrary.simpleMessage("Minimum"),
    "mockTextNewReleasesCard": MessageLookupByLibrary.simpleMessage(
      "The Ramalha network across the city of Covilhã continues to grow. After expanding last year to the city of Fundão, this time the bakery/patisserie opened its second space in Covilhã Shopping, in an interior space in its front area, on floor 0 with a wide esplanade.",
    ),
    "moderate": MessageLookupByLibrary.simpleMessage("Moderate"),
    "more": MessageLookupByLibrary.simpleMessage("more"),
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
    "nNewMessages": m58,
    "needBestRecommendations": MessageLookupByLibrary.simpleMessage(
      "Need the best recommendations?",
    ),
    "newBranch": MessageLookupByLibrary.simpleMessage("New on Foodly"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "newReleasesEmptyErrorSubtitle": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t load new businesses. Try again.",
    ),
    "newReleasesEmptyErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Connection interrupted",
    ),
    "newReleasesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "The next discoveries in your area will show up here.",
    ),
    "newReleasesEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "New flavors on the way",
    ),
    "news": MessageLookupByLibrary.simpleMessage("News"),
    "nextMonth": MessageLookupByLibrary.simpleMessage("Next month"),
    "nickName": MessageLookupByLibrary.simpleMessage("Username"),
    "noAccessSection": MessageLookupByLibrary.simpleMessage(
      "You don\'t have access to that section",
    ),
    "noAudioDetected": MessageLookupByLibrary.simpleMessage(
      "No audio detected. Please try again.",
    ),
    "noConnection": MessageLookupByLibrary.simpleMessage(
      "No internet connection. Check your network and try again.",
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
    "noMessagesYet": MessageLookupByLibrary.simpleMessage("No messages yet"),
    "noNearbyBusinessesInCategory": m59,
    "noNewBranches": MessageLookupByLibrary.simpleMessage(
      "No new businesses in your area yet",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "No notifications yet!",
    ),
    "noPackagesYet": MessageLookupByLibrary.simpleMessage("No packages yet"),
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
    "noSavedAddress": MessageLookupByLibrary.simpleMessage(
      "You don\'t have a saved address. You can create one on your profile page.",
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
    "notesLabel": m60,
    "notification": MessageLookupByLibrary.simpleMessage("Notification"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "november": MessageLookupByLibrary.simpleMessage("November"),
    "october": MessageLookupByLibrary.simpleMessage("October"),
    "okGo": MessageLookupByLibrary.simpleMessage("Ok, Let\'s go!"),
    "onQuote": MessageLookupByLibrary.simpleMessage("On quote"),
    "onSite": MessageLookupByLibrary.simpleMessage("On site"),
    "oneNewMessage": MessageLookupByLibrary.simpleMessage("1 new message"),
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
    "orderingDistance": MessageLookupByLibrary.simpleMessage("Distance"),
    "orderingLabel": MessageLookupByLibrary.simpleMessage("Sort by"),
    "orderingPriceAsc": MessageLookupByLibrary.simpleMessage("Price"),
    "orderingRatingDesc": MessageLookupByLibrary.simpleMessage("Rating"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "outdoorSeating": MessageLookupByLibrary.simpleMessage("Outdoor Seating"),
    "outsideCoverage": MessageLookupByLibrary.simpleMessage(
      "Your location is outside Foodly\'s current coverage",
    ),
    "owner": MessageLookupByLibrary.simpleMessage("Owner"),
    "packageDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Describe what this package includes",
    ),
    "packageTitleHint": MessageLookupByLibrary.simpleMessage(
      "E.g.: Gourmet dinner for 20 guests",
    ),
    "packages": MessageLookupByLibrary.simpleMessage("Packages"),
    "parking": MessageLookupByLibrary.simpleMessage("Parking"),
    "partySize": MessageLookupByLibrary.simpleMessage("Party size:"),
    "partySizeCount": m61,
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordIncorrect": MessageLookupByLibrary.simpleMessage(
      "Incorrect password. Please try again.",
    ),
    "passwordInstructions": MessageLookupByLibrary.simpleMessage(
      "The password must be at least 8 characters long, include a number, a lowercase letter, and an uppercase letter",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Enter your password to continue.",
    ),
    "passwordSent": MessageLookupByLibrary.simpleMessage(
      "Temporary password sent",
    ),
    "paymentOffPlatform": MessageLookupByLibrary.simpleMessage(
      "Payment outside the platform",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "pendingReservationsAlertMany": m62,
    "pendingReservationsAlertOne": MessageLookupByLibrary.simpleMessage(
      "You have 1 pending reservation",
    ),
    "pendingReservationsContent": MessageLookupByLibrary.simpleMessage(
      "There are reservation requests waiting for your response.",
    ),
    "perHour": MessageLookupByLibrary.simpleMessage("Per hour"),
    "perPerson": MessageLookupByLibrary.simpleMessage("Per person"),
    "peruvian": MessageLookupByLibrary.simpleMessage("Peruvian"),
    "petFriendly": MessageLookupByLibrary.simpleMessage("Pet Friendly"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneSectionTitle1": MessageLookupByLibrary.simpleMessage("Your"),
    "phoneSectionTitle2": MessageLookupByLibrary.simpleMessage("Phone"),
    "photoLimitReached": m63,
    "photoUploadFailed": MessageLookupByLibrary.simpleMessage(
      "Some photos couldn\'t be uploaded. Edit the package to retry.",
    ),
    "photosDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item photos deleted successfully",
    ),
    "photosOptionalMax": m64,
    "photosSaveError": m65,
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
    "portfolio": MessageLookupByLibrary.simpleMessage("Portfolio"),
    "portfolioVideoUrl": MessageLookupByLibrary.simpleMessage(
      "Portfolio/video URL",
    ),
    "portugueseCuisine": MessageLookupByLibrary.simpleMessage("Portuguese"),
    "post": MessageLookupByLibrary.simpleMessage("Post"),
    "posts": MessageLookupByLibrary.simpleMessage("Posts"),
    "postsFeedBeFirst": MessageLookupByLibrary.simpleMessage(
      "Be the first to share something!",
    ),
    "postsFeedNoPosts": MessageLookupByLibrary.simpleMessage("No posts yet"),
    "poweredBy": MessageLookupByLibrary.simpleMessage("Powered by"),
    "preferNotToSay": MessageLookupByLibrary.simpleMessage("Prefer not to say"),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
    "pressToAddPhotosUpToMaxImages": m66,
    "previousMonth": MessageLookupByLibrary.simpleMessage("Previous month"),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "priceFromBadge": m67,
    "priceType": MessageLookupByLibrary.simpleMessage("Price type"),
    "priceValidation": MessageLookupByLibrary.simpleMessage(
      "Price value must be not null and greater than 0.09",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "professionalProfile": MessageLookupByLibrary.simpleMessage(
      "Professional profile",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileBirthdayText1": MessageLookupByLibrary.simpleMessage("Birthday"),
    "profileBirthdayText2": MessageLookupByLibrary.simpleMessage("Date"),
    "profileUserLocation1": MessageLookupByLibrary.simpleMessage("User"),
    "profileUserLocation2": MessageLookupByLibrary.simpleMessage("Location"),
    "promoTabActive": MessageLookupByLibrary.simpleMessage("Active"),
    "promoTabExpired": MessageLookupByLibrary.simpleMessage("Expired"),
    "promoTabUpcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "promosEmptyErrorSubtitle": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t load promos. Try again.",
    ),
    "promosEmptyErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Connection interrupted",
    ),
    "promosEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "We\'re cooking up the best deals for you.",
    ),
    "promosEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Flavors near you, soon",
    ),
    "promotionDays": MessageLookupByLibrary.simpleMessage("Promotion days"),
    "promotions": MessageLookupByLibrary.simpleMessage("Promotions"),
    "qrSavedToGallery": MessageLookupByLibrary.simpleMessage(
      "Saved to your photos",
    ),
    "quoteApproved": MessageLookupByLibrary.simpleMessage("Quote approved"),
    "quoteNotes": MessageLookupByLibrary.simpleMessage(
      "Quote notes (optional)",
    ),
    "quoteReceived": MessageLookupByLibrary.simpleMessage("Quote received"),
    "quoteRejected": MessageLookupByLibrary.simpleMessage("Quote rejected"),
    "quoteSent": MessageLookupByLibrary.simpleMessage("Quote sent"),
    "quoted": MessageLookupByLibrary.simpleMessage("Quoted"),
    "quotedAmount": MessageLookupByLibrary.simpleMessage("Quoted amount"),
    "quotedStatus": MessageLookupByLibrary.simpleMessage("Quote sent"),
    "radiusDistanceLabel": MessageLookupByLibrary.simpleMessage(
      "Distance radius:",
    ),
    "radiusKm": MessageLookupByLibrary.simpleMessage("Radius (km)"),
    "rateYourExperience": MessageLookupByLibrary.simpleMessage(
      "Rate your experience:",
    ),
    "ratingAvg": MessageLookupByLibrary.simpleMessage("Rating Avg:"),
    "readyToListen": MessageLookupByLibrary.simpleMessage("Ready to listen"),
    "reasonHint": MessageLookupByLibrary.simpleMessage(
      "E.g. Vacation, maintenance",
    ),
    "reasonOptional": MessageLookupByLibrary.simpleMessage("Reason (optional)"),
    "recentPosts": MessageLookupByLibrary.simpleMessage("Recent Posts"),
    "recommend": MessageLookupByLibrary.simpleMessage("Recommend"),
    "reconnecting": MessageLookupByLibrary.simpleMessage("Reconnecting…"),
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
    "rejectQuote": MessageLookupByLibrary.simpleMessage("Reject"),
    "rejectReservation": MessageLookupByLibrary.simpleMessage(
      "Reject Reservation",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "rejectionReasonHint": MessageLookupByLibrary.simpleMessage(
      "Help the business understand why the booking didn\'t go through",
    ),
    "rejectionReasonOptional": MessageLookupByLibrary.simpleMessage(
      "Reason (optional)",
    ),
    "removePhoto": MessageLookupByLibrary.simpleMessage("Remove photo"),
    "removePhotos": MessageLookupByLibrary.simpleMessage("Remove photos"),
    "removeThisTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Remove this time period",
    ),
    "removeVideo": MessageLookupByLibrary.simpleMessage("Remove video"),
    "reorder": MessageLookupByLibrary.simpleMessage("Reorder"),
    "reportContent": MessageLookupByLibrary.simpleMessage("Report"),
    "reportContentSubtitle": MessageLookupByLibrary.simpleMessage(
      "Why are you reporting this content?",
    ),
    "reportReasonHarassment": MessageLookupByLibrary.simpleMessage(
      "Harassment or bullying",
    ),
    "reportReasonHateSpeech": MessageLookupByLibrary.simpleMessage(
      "Hate speech",
    ),
    "reportReasonMisinformation": MessageLookupByLibrary.simpleMessage(
      "False information",
    ),
    "reportReasonOffensive": MessageLookupByLibrary.simpleMessage(
      "Offensive or inappropriate",
    ),
    "reportReasonOther": MessageLookupByLibrary.simpleMessage("Other"),
    "reportReasonSexual": MessageLookupByLibrary.simpleMessage(
      "Sexual content",
    ),
    "reportReasonSpam": MessageLookupByLibrary.simpleMessage("Spam or scam"),
    "reportReasonViolence": MessageLookupByLibrary.simpleMessage(
      "Violence or dangerous",
    ),
    "reportSentSuccess": MessageLookupByLibrary.simpleMessage(
      "Thanks for your report. Our team will review it.",
    ),
    "reportSubmit": MessageLookupByLibrary.simpleMessage("Submit report"),
    "request": MessageLookupByLibrary.simpleMessage("Request"),
    "requestQuote": MessageLookupByLibrary.simpleMessage("Request quote"),
    "requestReservation": MessageLookupByLibrary.simpleMessage(
      "Request Reservation",
    ),
    "requestService": MessageLookupByLibrary.simpleMessage("Request service"),
    "requested": MessageLookupByLibrary.simpleMessage("Requested"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "resendCodeIn": m68,
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
    "reservationContactBody": MessageLookupByLibrary.simpleMessage(
      "The business needs this to confirm your request.",
    ),
    "reservationContactTitle": MessageLookupByLibrary.simpleMessage(
      "Contact details",
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
    "reserveTableAt": m69,
    "reserveToComplete": MessageLookupByLibrary.simpleMessage(
      "Reserve → Complete",
    ),
    "resilience": MessageLookupByLibrary.simpleMessage("Resilience"),
    "resultsFor": MessageLookupByLibrary.simpleMessage("Results for"),
    "resumeSessionWithSecurity": MessageLookupByLibrary.simpleMessage(
      "Resume session with fingerprint/face or pattern",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "retryLocation": MessageLookupByLibrary.simpleMessage("Retry location"),
    "retryLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Tap to get your location again",
    ),
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
    "saveToProfileForReservations": MessageLookupByLibrary.simpleMessage(
      "Save to my profile for future reservations",
    ),
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
    "scanForMenu": MessageLookupByLibrary.simpleMessage(
      "Scan to view our menu",
    ),
    "scanQRCode": MessageLookupByLibrary.simpleMessage("Scan this QR code"),
    "seafood": MessageLookupByLibrary.simpleMessage("Seafood"),
    "searchBusinessOrAddress": MessageLookupByLibrary.simpleMessage(
      "Search Business or Address",
    ),
    "searchInCity": m70,
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
    "sendMessage": MessageLookupByLibrary.simpleMessage("Send message"),
    "sendQuote": MessageLookupByLibrary.simpleMessage("Send quote"),
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Send Verification Code",
    ),
    "september": MessageLookupByLibrary.simpleMessage("September"),
    "serviceArea": MessageLookupByLibrary.simpleMessage("Service area"),
    "serviceBookingDetail": MessageLookupByLibrary.simpleMessage(
      "Service request detail",
    ),
    "serviceBookingRequest": MessageLookupByLibrary.simpleMessage(
      "Service request",
    ),
    "servicePackages": MessageLookupByLibrary.simpleMessage("Service packages"),
    "serviceRequests": MessageLookupByLibrary.simpleMessage("Service requests"),
    "serviceType": MessageLookupByLibrary.simpleMessage("Service type"),
    "serviceTypeAll": MessageLookupByLibrary.simpleMessage("All"),
    "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
      "Your session has expired. Please log in again.",
    ),
    "setDate": MessageLookupByLibrary.simpleMessage("Set date"),
    "setPassword": MessageLookupByLibrary.simpleMessage("Set password"),
    "setPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Enable email + password sign-in in addition to your social account.",
    ),
    "setupProfessionalProfile": MessageLookupByLibrary.simpleMessage(
      "Set up your professional profile",
    ),
    "shareAppMessage": MessageLookupByLibrary.simpleMessage(
      "Discover the best food spots near you with Foodly — explore menus, grab promotions, and book tables, all in one app!",
    ),
    "shareMenu": MessageLookupByLibrary.simpleMessage("Share this menu"),
    "shareMenuError": MessageLookupByLibrary.simpleMessage(
      "Oops... Something went wrong! \n\nCouldn\'t share the menu.",
    ),
    "shareMenuMessage": m71,
    "shareMenuSubject": MessageLookupByLibrary.simpleMessage(
      "Sharing a menu with you!",
    ),
    "shareOnAndroid": MessageLookupByLibrary.simpleMessage("Share for Android"),
    "shareOnIOS": MessageLookupByLibrary.simpleMessage("Share for iOS"),
    "sharePromotion": MessageLookupByLibrary.simpleMessage("Share Promotion"),
    "signInWithApple": MessageLookupByLibrary.simpleMessage(
      "Sign in with Apple",
    ),
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
    "socialConsentTitle": MessageLookupByLibrary.simpleMessage("One last step"),
    "socialEmailMissing": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t get your email from Apple. Please try again or use another sign-in method.",
    ),
    "socials": MessageLookupByLibrary.simpleMessage("Socials"),
    "solo": MessageLookupByLibrary.simpleMessage("Solo"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "An error occurred",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
    "specialRequests": MessageLookupByLibrary.simpleMessage("Special requests"),
    "specialRequestsLabel": m72,
    "specialRequestsOptional": MessageLookupByLibrary.simpleMessage(
      "Special requests (optional)",
    ),
    "specialties": MessageLookupByLibrary.simpleMessage("Specialties"),
    "specialtyExample": MessageLookupByLibrary.simpleMessage(
      "E.g.: Molecular gastronomy",
    ),
    "speechRecognitionError": MessageLookupByLibrary.simpleMessage(
      "Error starting speech recognition.",
    ),
    "speechRecognitionUnavailable": MessageLookupByLibrary.simpleMessage(
      "Speech recognition is not available on this device.",
    ),
    "start": MessageLookupByLibrary.simpleMessage("Start"),
    "startDate": MessageLookupByLibrary.simpleMessage("Start date"),
    "startTime": MessageLookupByLibrary.simpleMessage("Start time"),
    "startups": MessageLookupByLibrary.simpleMessage("Startups"),
    "state": MessageLookupByLibrary.simpleMessage("State"),
    "steakhouse": MessageLookupByLibrary.simpleMessage("Steakhouse"),
    "stop": MessageLookupByLibrary.simpleMessage("Stop"),
    "stress": MessageLookupByLibrary.simpleMessage("Stress"),
    "strict": MessageLookupByLibrary.simpleMessage("Strict"),
    "stripeBridgeRefreshBody": MessageLookupByLibrary.simpleMessage(
      "Resume activation from the app: Orders → Activate payments with Stripe.",
    ),
    "stripeBridgeRefreshTitle": MessageLookupByLibrary.simpleMessage(
      "Setup incomplete",
    ),
    "stripeBridgeReturnBody": MessageLookupByLibrary.simpleMessage(
      "You can close this tab and go back to the Foodly app.",
    ),
    "stripeBridgeReturnTitle": MessageLookupByLibrary.simpleMessage(
      "Payments account set up",
    ),
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
    "tableReservations": MessageLookupByLibrary.simpleMessage(
      "Table reservations",
    ),
    "takeAway": MessageLookupByLibrary.simpleMessage("Take Away"),
    "tapPlusToCreate": MessageLookupByLibrary.simpleMessage(
      "Tap + to create your first package",
    ),
    "tapToAddPrompt": MessageLookupByLibrary.simpleMessage(
      "Tap here to add a new prompt",
    ),
    "tapToSelectTime": MessageLookupByLibrary.simpleMessage(
      "Tap to select time",
    ),
    "teamSize": MessageLookupByLibrary.simpleMessage("Team size"),
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
    "termsPrivacyTextSpan1forBusiness": MessageLookupByLibrary.simpleMessage(
      "By creating a business account, you acknowledge that you have read and agree to our",
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
    "thisUser": MessageLookupByLibrary.simpleMessage("this user"),
    "time": MessageLookupByLibrary.simpleMessage("Time"),
    "timeAgoDays": m73,
    "timeAgoHours": m74,
    "timeAgoJustNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "timeAgoMinutes": m75,
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "topEvents": MessageLookupByLibrary.simpleMessage("Top events"),
    "totalEvents": MessageLookupByLibrary.simpleMessage("Total events"),
    "travelFeeKm": MessageLookupByLibrary.simpleMessage("Travel fee/km"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "typeMessage": MessageLookupByLibrary.simpleMessage("Type a message..."),
    "unauthorizedAccess": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access.",
    ),
    "unavailableDaysHint": MessageLookupByLibrary.simpleMessage(
      "Days in grey are not available.",
    ),
    "unblock": MessageLookupByLibrary.simpleMessage("Unblock"),
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
    "visitedOn": m76,
    "visitor": MessageLookupByLibrary.simpleMessage("Visitor"),
    "vitality": MessageLookupByLibrary.simpleMessage("Vitality"),
    "weWillCheckAvailability": MessageLookupByLibrary.simpleMessage(
      "We\'ll check availability",
    ),
    "wedding": MessageLookupByLibrary.simpleMessage("Wedding"),
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
    "welcomeDialogSocialBusiness": MessageLookupByLibrary.simpleMessage(
      "Want to list your business on Foodly? Go to your profile and turn on the business account option to register it.",
    ),
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
    "writeReviewFor": m77,
    "writeYourReviewHint": MessageLookupByLibrary.simpleMessage(
      "Write your review here...",
    ),
    "yearsExperience": MessageLookupByLibrary.simpleMessage(
      "Years of experience",
    ),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Yes, cancel"),
    "zipCode": MessageLookupByLibrary.simpleMessage("Zip Code"),
    "zipCodeNotAvailable": MessageLookupByLibrary.simpleMessage(
      "This code is outside our current coverage area",
    ),
  };
}
