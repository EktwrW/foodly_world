import 'package:flutter/cupertino.dart';

import 'package:foodly_world/core/utils/assets_utils.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:responsive_framework/responsive_framework.dart';

@JsonEnum()
enum TokenType {
  @JsonValue('Bearer')
  bearer,
  @JsonValue('Refresh')
  refresh,
  unknown;
}

/// Identifies the platform from which an NLP search request originates.
@JsonEnum(valueField: 'value')
enum NlpSearchPlatform {
  android('android'),
  ios('ios'),
  web('web'),
  desktop('desktop'),
  unknown('unknown');

  final String value;

  const NlpSearchPlatform(this.value);
}

enum DeviceSize {
  mobile(start: 0, end: 450, name: MOBILE),
  smallTablet(start: 451, end: 720, name: 'SMALL_TABLET'),
  tablet(start: 721, end: 960, name: TABLET),
  smallDesktop(start: 961, end: 1200, name: 'SMALL_DESKTOP'),
  desktop(start: 1201, end: double.infinity, name: DESKTOP);

  final double start;
  final double end;
  final String name;

  const DeviceSize({required this.start, required this.end, required this.name});

  static double get maxWidth => 1440;
  static List<Breakpoint> get breakpoints => [
        Breakpoint(start: mobile.start, end: mobile.end, name: mobile.name),
        Breakpoint(start: smallTablet.start, end: smallTablet.end, name: smallTablet.name),
        Breakpoint(start: tablet.start, end: tablet.end, name: tablet.name),
        Breakpoint(start: smallDesktop.start, end: smallDesktop.end, name: smallDesktop.name),
        Breakpoint(start: desktop.start, end: desktop.end, name: desktop.name),
      ];
}

enum FoodlyInputType {
  // user form
  nickName(icon: Icon(Bootstrap.at, size: 22), textInputType: TextInputType.text),
  firstName(icon: Icon(Bootstrap.person_fill, size: 22), textInputType: TextInputType.name),
  lastName(icon: Icon(Bootstrap.person_lines_fill, size: 22), textInputType: TextInputType.name),
  email(icon: Icon(Bootstrap.envelope_at, size: 22), textInputType: TextInputType.emailAddress),
  password(icon: Icon(LineAwesome.user_lock_solid, size: 22), textInputType: TextInputType.visiblePassword),
  newPassword(icon: Icon(LineAwesome.user_lock_solid, size: 22), textInputType: TextInputType.visiblePassword),
  dateOfBirth(icon: Icon(Bootstrap.cake2, size: 22), textInputType: TextInputType.datetime),
  phone(icon: Icon(Bootstrap.telephone, size: 22), textInputType: TextInputType.phone),
  country(icon: Icon(Clarity.map_line, size: 22), textInputType: TextInputType.name),
  city(icon: Icon(Clarity.map_outline_badged, size: 22), textInputType: TextInputType.name),
  address(icon: Icon(Bootstrap.house_add, size: 22), textInputType: TextInputType.streetAddress),
  zipCode(icon: Icon(Bootstrap.postage, size: 22), textInputType: TextInputType.text),

  // business form
  businessName(icon: Icon(Bootstrap.shop_window, size: 22), textInputType: TextInputType.text),
  businessEmail(icon: Icon(Bootstrap.envelope_at_fill, size: 22), textInputType: TextInputType.emailAddress),
  businessPhone(icon: Icon(Bootstrap.telephone_fill, size: 22), textInputType: TextInputType.phone),
  businessCountry(icon: Icon(Clarity.map_solid, size: 22), textInputType: TextInputType.name),
  businessCity(icon: Icon(Clarity.map_solid_badged, size: 22), textInputType: TextInputType.name),
  businessAddress(icon: Icon(Clarity.map_marker_solid, size: 22), textInputType: TextInputType.streetAddress),
  businessZipCode(icon: Icon(Bootstrap.postage_fill, size: 22), textInputType: TextInputType.text),
  businessIntroMessage(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Bootstrap.text_paragraph, size: 22),
        ],
      ),
      textInputType: TextInputType.multiline),

  // dashboard
  businessAboutUs(icon: null, textInputType: TextInputType.text),
  businessAdditionalInfo(icon: null, textInputType: TextInputType.text),

  // search
  search(icon: FoodlyIsoIconBehavior(height: 14, version: FoodlyLogoVersion.black), textInputType: TextInputType.text),

  // common
  prices(icon: null, textInputType: TextInputType.number),
  reservationSize(icon: null, textInputType: TextInputType.number),
  youtubeUrl(icon: Icon(Bootstrap.youtube, size: 22), textInputType: TextInputType.url),
  generic(icon: null, textInputType: TextInputType.text);

  final Widget? icon;
  final TextInputType textInputType;

  const FoodlyInputType({required this.icon, required this.textInputType});

  static final _texts = {
    email: S.current.email,
    phone: S.current.phoneNumber,
    password: S.current.password,
    newPassword: S.current.newPassword,
    address: S.current.address,
    country: S.current.country,
    city: S.current.city,
    zipCode: S.current.zipCode,
    prices: '0.0',
    generic: '',
    nickName: S.current.nickName,
    firstName: S.current.firstName,
    lastName: S.current.lastName,
    dateOfBirth: S.current.dateOfBirth,
    businessName: S.current.businessName,
    businessPhone: S.current.contactNumber,
    businessCountry: S.current.country,
    businessCity: S.current.city,
    businessAddress: S.current.address,
    businessZipCode: S.current.zipCode,
    businessEmail: S.current.contactEmail,
    businessIntroMessage: S.current.introMessage,
    businessAboutUs: S.current.addADescription,
    businessAdditionalInfo: S.current.addAdditionalInformation,
    youtubeUrl: 'https://www.youtube.com/watch?v=...',
    search: S.current.searchPlaceholder,
  };

  String get text => _texts[this] ?? '';

  bool get isPassword => this == FoodlyInputType.password || this == FoodlyInputType.newPassword;
}

enum ImageResourceType { vector, raster }

enum AssetType { icon, image }

extension AssetTypeExtension on AssetType {
  Function get pathMethod {
    switch (this) {
      case AssetType.icon:
        return AssetUtils.getIconPath;
      case AssetType.image:
        return AssetUtils.getImagePath;
    }
  }
}

@JsonEnum()
enum Version {
  @JsonValue('regular')
  regular('regular'),
  @JsonValue('medium')
  medium('medium'),
  @JsonValue('big')
  big('big');

  final String value;
  const Version(this.value);

  static final _texts = {
    regular: S.current.regular,
    medium: S.current.medium,
    big: S.current.big,
  };

  static final _focusNode = {
    regular: FocusNode(),
    medium: FocusNode(),
    big: FocusNode(),
  };

  String get text => _texts[this] ?? '';
  FocusNode get focusNode => _focusNode[this] ?? FocusNode();
}

enum MenuCategory {
  food,
  drinks,
  combos;

  String get text => switch (this) {
        food => S.current.food,
        drinks => S.current.drinks,
        combos => S.current.combos,
      };

  /// Returns [combosLabel] for the combos tab when non-null/non-empty,
  /// otherwise falls back to the default l10n text.
  String textWith({String? combosLabel}) =>
      (this == combos && combosLabel != null && combosLabel.isNotEmpty) ? combosLabel : text;

  bool get isFood => this == food;
  bool get isDrinks => this == drinks;
  bool get isCombos => this == combos;
}

enum PrimaryEditButtonStyle { rounded, rectangular }

enum ItemEditing { name, description, pictures, versions, none, prices }

enum PromotionStatus {
  active,
  next,
  expired;

  static final _texts = {
    active: S.current.promoTabActive,
    next: S.current.promoTabUpcoming,
    expired: S.current.promoTabExpired,
  };

  String get text => _texts[this] ?? '';

  bool get isActive => this == active;
  bool get isNext => this == next;
  bool get isExpired => this == expired;
}

enum BusinessResultsViewMode {
  grid,
  list;

  bool get isGrid => this == grid;
}
