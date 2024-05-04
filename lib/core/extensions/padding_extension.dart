import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingVertical(double vertical) => Padding(
        padding: EdgeInsets.symmetric(vertical: vertical),
        child: this,
      );

  Widget paddingHorizontal(double horizontal) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: this,
      );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget paddingLeft(double left) => paddingOnly(left: left);

  Widget paddingRight(double right) => paddingOnly(right: right);

  Widget paddingTop(double top) => paddingOnly(top: top);

  Widget paddingBottom(double bottom) => paddingOnly(bottom: bottom);
}
