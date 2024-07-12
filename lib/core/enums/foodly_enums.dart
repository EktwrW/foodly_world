import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/utils/assets_utils.dart';
import 'package:foodly_world/generated/l10n.dart';
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
  nickName(icon: Icon(Bootstrap.at), textInputType: TextInputType.text),
  firstName(icon: Icon(Bootstrap.person_fill), textInputType: TextInputType.name),
  lastName(icon: Icon(Bootstrap.person_lines_fill), textInputType: TextInputType.name),
  email(icon: Icon(Bootstrap.envelope_at), textInputType: TextInputType.emailAddress),
  password(icon: Icon(Bootstrap.lock), textInputType: TextInputType.visiblePassword),
  confirmPassword(icon: Icon(Bootstrap.lock_fill), textInputType: TextInputType.visiblePassword),
  dateOfBirth(icon: Icon(Bootstrap.cake2), textInputType: TextInputType.datetime),
  phone(icon: Icon(Bootstrap.telephone), textInputType: TextInputType.phone),
  country(icon: Icon(Clarity.map_line), textInputType: TextInputType.name),
  city(icon: Icon(Clarity.map_outline_badged), textInputType: TextInputType.name),
  address(icon: Icon(Bootstrap.house_add), textInputType: TextInputType.streetAddress),
  zipCode(icon: Icon(Bootstrap.postage), textInputType: TextInputType.text),

  // business form
  businessName(icon: Icon(Bootstrap.shop_window), textInputType: TextInputType.text),
  businessEmail(icon: Icon(Bootstrap.envelope_at_fill), textInputType: TextInputType.emailAddress),
  businessPhone(icon: Icon(Bootstrap.telephone_fill), textInputType: TextInputType.phone),
  businessCountry(icon: Icon(Clarity.map_solid), textInputType: TextInputType.name),
  businessCity(icon: Icon(Clarity.map_solid_badged), textInputType: TextInputType.name),
  businessAddress(icon: Icon(Clarity.map_marker_solid), textInputType: TextInputType.streetAddress),
  businessZipCode(icon: Icon(Bootstrap.postage_fill), textInputType: TextInputType.text),

  // dashboard
  businessAboutUs(icon: null, textInputType: TextInputType.text),
  businessAdditionalInfo(icon: null, textInputType: TextInputType.text),

  // generic
  generic(icon: Icon(Bootstrap.person), textInputType: TextInputType.text);

  final Widget? icon;
  final TextInputType textInputType;

  const FoodlyInputType({required this.icon, required this.textInputType});

  static final _texts = {
    email: S.current.email,
    phone: S.current.phoneNumber,
    password: S.current.password,
    confirmPassword: S.current.confirmPassword,
    address: S.current.address,
    country: S.current.country,
    city: S.current.city,
    zipCode: S.current.zipCode,
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
    businessAboutUs: S.current.addADescription,
    businessAdditionalInfo: S.current.addAdditionalInformation,
  };

  String get text => _texts[this] ?? '';
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

  String get text => _texts[this] ?? '';
}

enum MenuCategory {
  food,
  drinks,
  combos;

  static final _texts = {
    food: S.current.dishes,
    drinks: S.current.drinks,
    combos: S.current.combos,
  };

  String get text => _texts[this] ?? '';
}
