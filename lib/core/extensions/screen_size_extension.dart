import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ScreenSizeExtension on BuildContext {
  double get screenWidth => ResponsiveBreakpoints.of(this).screenWidth;
  double get screenHeight => ResponsiveBreakpoints.of(this).screenHeight;
  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;
  bool get isSmallTablet => !isMobile & isScreenSmallerOrEqualTo(DeviceSize.smallTablet.name);
  bool get isTablet => ResponsiveBreakpoints.of(this).equals(TABLET);
  bool get isSmallDesktop => isScreenLargerThan(DeviceSize.tablet.name) & isScreenSmallerThan(DeviceSize.desktop.name);
  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;
  bool get isSmallerOrEqualsToTablet => isScreenSmallerOrEqualTo(DeviceSize.tablet.name);
  bool isDeviceType(String deviceType) => ResponsiveBreakpoints.of(this).equals(deviceType);
  Orientation get orientation => ResponsiveBreakpoints.of(this).orientation;
  static const double Z_FOLD_UNFOLDED_WIDTH = 344.0;
  bool get isFoldableInHalfView =>
      ResponsiveBreakpoints.of(this).screenWidth <= Z_FOLD_UNFOLDED_WIDTH && ((screenHeight / screenWidth) > 2.0);

  /// Is the [screenWidth] larger than [name]?
  /// Defaults to false if the [name] cannot be found.
  bool isScreenLargerThan(String name) =>
      screenWidth >
      (ResponsiveBreakpoints.of(this).breakpoints.firstWhereOrNull((element) => element.name == name)?.end ??
          double.infinity);

  /// Is the [screenWidth] larger than or equal to [name]?
  /// Defaults to false if the [name] cannot be found.
  bool isScreenLargerOrEqualTo(String name) =>
      screenWidth >=
      (ResponsiveBreakpoints.of(this).breakpoints.firstWhereOrNull((element) => element.name == name)?.start ??
          double.infinity);

  /// Is the [screenWidth] smaller than the [name]?
  /// Defaults to false if the [name] cannot be found.
  bool isScreenSmallerThan(String name) =>
      screenWidth <
      (ResponsiveBreakpoints.of(this).breakpoints.firstWhereOrNull((element) => element.name == name)?.start ?? 0);

  /// Is the [screenWidth] smaller than or equal to the [name]?
  /// Defaults to false if the [name] cannot be found.
  bool isScreenSmallerOrEqualTo(String name) =>
      screenWidth <=
      (ResponsiveBreakpoints.of(this).breakpoints.firstWhereOrNull((element) => element.name == name)?.end ?? 0);

  /// Is the [screenWidth] smaller than or equal to the [name]?
  /// Defaults to false if the [name] cannot be found.
  bool isScreenSizeBetween(String name, String name1) {
    return (screenWidth >=
            (ResponsiveBreakpoints.of(this).breakpoints.firstWhereOrNull((element) => element.name == name)?.start ??
                0) &&
        screenWidth <=
            (ResponsiveBreakpoints.of(this).breakpoints.firstWhereOrNull((element) => element.name == name1)?.end ??
                0));
  }
}
