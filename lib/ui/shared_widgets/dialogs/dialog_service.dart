import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart' show rootNavigatorKey;
import 'package:foodly_world/ui/constants/ui_loading.dart';

part '../loading/loading_logo_wdg.dart';
part '../loading/loading_iso_wdg.dart';

class DialogService {
  var _isLoadingShown = false;

  bool get isDialogShown => _isLoadingShown;

  void showLoading() {
    final context = rootNavigatorKey.currentContext;
    if (context != null && !_isLoadingShown) {
      _isLoadingShown = true;
      LoadingOverlay.show(context);
    }
  }

  void showLoadingIso() {
    final context = rootNavigatorKey.currentContext;
    if (context != null && !_isLoadingShown) {
      _isLoadingShown = true;
      LoadingOverlay.showIso(context);
    }
  }

  void hideLoading() {
    if (_isLoadingShown) {
      LoadingOverlay.hide();
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
        builder: (_) => PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: insetPadding ?? EdgeInsets.zero,
            elevation: elevation ?? 0,
            child: content,
          ),
        ),
      ).then((_) {
        _isLoadingShown = false;
        if (onDialogClose != null) {
          onDialogClose();
        }
      });
      _isLoadingShown = true;
    }
  }
}

enum LoadingType { iso, logo }

class LoadingOverlay extends StatefulWidget {
  final LoadingType type;

  const LoadingOverlay._({required this.type});

  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show(BuildContext context) {
    if (_isVisible) return;

    _overlayEntry = OverlayEntry(builder: (context) => const LoadingOverlay._(type: LoadingType.logo));

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    _isVisible = true;
  }

  static void showIso(BuildContext context) {
    if (_isVisible) return;

    _overlayEntry = OverlayEntry(builder: (context) => const LoadingOverlay._(type: LoadingType.iso));

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    _isVisible = true;
  }

  static void hide() {
    if (!_isVisible) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isVisible = false;
  }

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: ColoredBox(
          color: Colors.black12,
          child: Center(
            // child: (switch (widget.type) {
            //   LoadingType.iso => const LoadingWidgetFoodlyIso(),
            //   LoadingType.logo => const LoadingWidgetFoodlyLogo(),
            // })
            child: const LoadingWidgetFoodlyIso().paddingAll(36),
          ),
        ),
      ),
    );
  }
}
