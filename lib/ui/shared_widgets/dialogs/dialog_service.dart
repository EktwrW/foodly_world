import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/ui/constants/ui_loading.dart';

part '../loading/loading_logo_wdg.dart';

class DialogService {
  var _isLoadingShown = false;

  void showLoading() {
    final context = rootNavigatorKey.currentContext;
    if (context != null && !_isLoadingShown) {
      _isLoadingShown = true;

      showDialog(
        context: context,
        barrierColor: Colors.black12,
        barrierDismissible: false,
        builder: (_) =>
            const Dialog(backgroundColor: Colors.transparent, elevation: 0, child: LoadingWidgetFoodlyLogo()),
      ).then((_) => _isLoadingShown = false);
    }
  }

  void hideLoading() {
    final context = rootNavigatorKey.currentContext;

    if (context != null && _isLoadingShown) {
      Navigator.of(context, rootNavigator: true).pop();
      _isLoadingShown = false;
    }
  }

  void showCustomDialog(Widget content, double? elevation, {EdgeInsets? insetPadding, VoidCallback? onDialogClose}) {
    final context = rootNavigatorKey.currentContext;

    if (context != null && !_isLoadingShown) {
      showDialog(
        context: context,
        barrierColor: Colors.black54,
        barrierDismissible: false,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: insetPadding,
          elevation: elevation ?? 0,
          child: PopScope(canPop: false, onPopInvoked: (_) => false, child: content),
        ),
      ).then((_) {
        _isLoadingShown = false;
        if (onDialogClose != null) {
          onDialogClose();
        }
      });
    }
  }
}
