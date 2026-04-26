import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';

/// Classifies an [AppRequestException] into a user-friendly category so
/// callers can present the right UX (inline form error, snackbar, or
/// silent — auth errors go through the Dio interceptor's session-expired
/// flow and need no extra dialog from us).
///
/// Why categories instead of strings: most cubits today emit
/// `_Error(e.errorMsg, vm)` and the listener pipes `errorMsg` into a
/// snackbar. That works for a happy-path generic error, but fails the
/// moment we want different presentation per error class:
///   * Validation (422) → inline near the offending field (no snackbar
///     stacking with a re-opened dialog).
///   * Server error (500) → generic snackbar "algo salió mal".
///   * Network outage → "sin conexión" snackbar, no scary tech text.
///   * Auth (401) → already handled by the Dio interceptor; the cubit
///     should NOT also show a snackbar (avoids the double-modal that
///     previously left users staring at two error messages).
enum FoodlyErrorCategory {
  /// Field-level validation. Surface inline next to the form field; do
  /// NOT use the global snackbar.
  validation,

  /// Authentication / session — the interceptor will handle it (clear
  /// session + redirect to /login). The cubit should swallow the error
  /// silently to avoid duplicate notifications.
  auth,

  /// Server-side failure (500-ish). Show the generic localized message;
  /// never leak the BE stack trace.
  server,

  /// No / flaky network. Show the localized "no connection" snackbar.
  network,

  /// Anything else — fall back to the localized generic retry message.
  unknown,
}

/// Static helper that maps an [AppRequestException] to a category and
/// renders the appropriate snackbar when the category is "global" (not
/// inline). For inline cases (validation errors that the form widget
/// will render next to the field), call [classify] and let the widget
/// decide.
class FoodlyErrorPresenter {
  const FoodlyErrorPresenter._();

  /// Pure classification — no UI side-effects. Call sites that render
  /// errors inline (e.g. a dialog showing per-field errors) use this to
  /// decide whether to fall through to [showGlobal].
  static FoodlyErrorCategory classify(AppRequestException e) {
    if (e.isOffline) return FoodlyErrorCategory.network;

    final status = e.statusCode;
    if (status == null) return FoodlyErrorCategory.unknown;

    if (status == 401 || status == 403) return FoodlyErrorCategory.auth;
    if (status == 422 || status == 400) return FoodlyErrorCategory.validation;
    if (status >= 500 && status < 600) return FoodlyErrorCategory.server;

    return FoodlyErrorCategory.unknown;
  }

  /// Show a global snackbar appropriate for this error. **Skips silently
  /// for auth errors** — those are owned by the Dio interceptor's
  /// session-expired flow; layering another snackbar on top is the
  /// double-modal bug we're fixing.
  ///
  /// [context] must be `mounted`; callers in cubits should still verify.
  /// Returns the category in case the caller wants to take additional
  /// action (e.g. log, navigate, retry).
  static FoodlyErrorCategory showGlobal(BuildContext context, AppRequestException e) {
    final category = classify(e);
    switch (category) {
      case FoodlyErrorCategory.auth:
        // Owned by AuthSessionService.notifyTokenExpired (interceptor).
        // Stay silent here.
        break;
      case FoodlyErrorCategory.network:
        FoodlySnackbars.errorGeneric(context, S.current.noConnection);
        break;
      case FoodlyErrorCategory.server:
      case FoodlyErrorCategory.unknown:
        FoodlySnackbars.errorGeneric(context, S.current.genericErrorRetry);
        break;
      case FoodlyErrorCategory.validation:
        // Validation errors are usually shown inline. If a caller funnels
        // a validation error through the global path (no inline target),
        // surface the BE message — it's already a user-readable string
        // (Laravel returns localized validators).
        FoodlySnackbars.errorGeneric(context, e.errorMsg);
        break;
    }
    return category;
  }
}
