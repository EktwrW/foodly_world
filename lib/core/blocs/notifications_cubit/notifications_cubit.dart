import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart' show ImageConfiguration, ImageStreamListener;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/notifications_cubit/notifications_vm.dart';
import 'package:foodly_world/core/consts/foodly_locales.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/notifications/notifications_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/data_models/notifications/notifications_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'notifications_cubit.freezed.dart';
part 'notifications_state.dart';

/// Intervalo de polling en segundos (90 segundos recomendado)
const int _pollingIntervalSeconds = 90;

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsVM _vm;
  final NotificationsRepo _notificationsRepo;
  final AuthSessionService _authService;
  final Logger _logger;
  Timer? _pollingTimer;

  /// IDs of reservation notifications for which we have already shown (or
  /// attempted to show) a proactive dialog in this session.  Prevents the
  /// same notification from re-triggering the dialog on subsequent polls.
  final Set<int> _dialogShownForIds = {};

  /// Holds the most recent unread reservation notification that has not yet
  /// been shown in a proactive dialog.  The global BlocListener in
  /// FoodlyWrapper reads this, shows the dialog, then calls
  /// [clearPendingReservationNotification] to consume it.
  NotificationDM? _pendingReservationNotification;

  /// Getter for the pending reservation notification (read by UI).
  NotificationDM? get pendingReservationNotification =>
      _pendingReservationNotification;

  /// Called by the UI after it has shown the proactive dialog.
  void clearPendingReservationNotification() {
    _pendingReservationNotification = null;
  }

  NotificationsCubit({
    required NotificationsRepo notificationsRepo,
    required AuthSessionService authService,
    required Logger logger,
  })  : _notificationsRepo = notificationsRepo,
        _authService = authService,
        _logger = logger,
        _vm = const NotificationsVM(),
        super(const NotificationsState.initial(NotificationsVM()));

  /// Inicializa el cubit - llamar cuando el usuario se autentica
  Future<void> initialize() async {
    if (!_authService.isLoggedIn) {
      _logger.i('NotificationsCubit: User not logged in, skipping initialization');
      return;
    }

    await loadNotifications();
    _startPolling();
  }

  /// Carga las notificaciones del usuario
  Future<void> loadNotifications({bool showLoading = true}) async {
    if (!_authService.isLoggedIn) return;

    if (showLoading) {
      emit(NotificationsState.loading(_vm));
    }

    try {
      final result = await _notificationsRepo.getNotifications(
        perPage: _vm.perPage,
        page: 1,
        // El BE traduce title/message al leer, en este locale. Ver
        // FoodlyLocales.deviceLocaleTag.
        locale: FoodlyLocales.deviceLocaleTag,
      );

      List<NotificationDM>? toCache;
      result.when(
        success: (data) {
          _vm = _vm.copyWith(
            notifications: data.notifications,
            unreadCount: data.meta?.unreadCount ?? 0,
            currentPage: data.meta?.currentPage ?? 1,
            lastPage: data.meta?.lastPage ?? 1,
            total: data.meta?.total ?? 0,
            hasMorePages: (data.meta?.currentPage ?? 1) < (data.meta?.lastPage ?? 1),
          );
          toCache = data.notifications;
        },
        failure: (error) {
          _logger.e('Error loading notifications: ${error.errorMsg}');
          emit(NotificationsState.error(_vm, error.errorMsg));
        },
      );
      if (toCache != null) {
        // Detect unread reservation notifications we haven't shown a dialog for yet.
        // Works on first load AND subsequent polling cycles.
        final reservationNotifs = toCache!.where((n) => n.isReservationNotification).toList();
        _logger.i(
          'NotificationsCubit: ${toCache!.length} notifications loaded, '
          '${reservationNotifs.length} are reservation-type, '
          'dialogShownForIds=${_dialogShownForIds.length}',
        );
        for (final n in reservationNotifs) {
          _logger.i(
            '  → id=${n.id} subType=${n.subType} isRead=${n.isRead} '
            'alreadyShown=${_dialogShownForIds.contains(n.id)}',
          );
        }

        for (final n in toCache!) {
          // `deservesProactiveDialog` sustituye al viejo `isReservationNotification`:
          // exige además que el subtipo sea accionable y que el aviso sea de las
          // últimas 24 h. Sin eso, borrar una cuenta con reservas viejas generaba
          // un modal bloqueante por cada una, sesión tras sesión, sobre fechas ya
          // pasadas (2026-08-13). La segunda mitad del filtro —fecha futura y
          // estado vivo— la aplica FoodlyWrapper con la reserva ya cargada.
          //
          // Lo filtrado NO desaparece: sigue en la campana, sin leer y contando
          // en el badge.
          if (n.deservesProactiveDialog() &&
              !n.isRead &&
              !_dialogShownForIds.contains(n.id)) {
            _pendingReservationNotification = n;
            _dialogShownForIds.add(n.id);
            _logger.i('NotificationsCubit: SET pendingReservationNotification id=${n.id}');
            break; // show one at a time
          }
        }

        if (_pendingReservationNotification == null) {
          _logger.i('NotificationsCubit: No pending reservation notification to show');
        }

        await _precacheNotificationImages(toCache!);
        emit(NotificationsState.loaded(_vm));
      }
    } catch (e) {
      _logger.e('Exception loading notifications: $e');
      emit(NotificationsState.error(_vm, e.toString()));
    }
  }

  /// Carga más notificaciones (paginación)
  Future<void> loadMoreNotifications() async {
    if (!_authService.isLoggedIn || !_vm.hasMorePages) return;

    final nextPage = _vm.currentPage + 1;

    try {
      final result = await _notificationsRepo.getNotifications(
        perPage: _vm.perPage,
        page: nextPage,
        locale: FoodlyLocales.deviceLocaleTag,
      );

      result.when(
        success: (data) {
          final allNotifications = [..._vm.notifications, ...data.notifications];
          _vm = _vm.copyWith(
            notifications: allNotifications,
            currentPage: data.meta?.currentPage ?? nextPage,
            lastPage: data.meta?.lastPage ?? _vm.lastPage,
            hasMorePages: (data.meta?.currentPage ?? nextPage) < (data.meta?.lastPage ?? _vm.lastPage),
          );
          emit(NotificationsState.loaded(_vm));
          _precacheNotificationImages(data.notifications);
        },
        failure: (error) {
          _logger.e('Error loading more notifications: ${error.errorMsg}');
        },
      );
    } catch (e) {
      _logger.e('Exception loading more notifications: $e');
    }
  }

  /// Actualiza solo el contador de no leídas (ligero, para polling)
  Future<void> refreshUnreadCount() async {
    if (!_authService.isLoggedIn) return;

    try {
      final result = await _notificationsRepo.getUnreadCount();

      result.when(
        success: (count) {
          if (count != _vm.unreadCount) {
            final oldCount = _vm.unreadCount;
            _vm = _vm.copyWith(unreadCount: count);
            emit(NotificationsState.loaded(_vm));

            // Si hay nuevas notificaciones, refrescamos la lista completa
            if (count > oldCount) {
              loadNotifications(showLoading: false);
            }
          }
        },
        failure: (error) {
          _logger.w('Error refreshing unread count: ${error.errorMsg}');
        },
      );
    } catch (e) {
      _logger.w('Exception refreshing unread count: $e');
    }
  }

  /// Marca una notificación como leída
  Future<void> markAsRead(String uuid) async {
    if (!_authService.isLoggedIn) return;

    // Optimistic update
    final updatedNotifications = _vm.notifications.map((n) {
      if (n.uuid == uuid) {
        return NotificationDM(
          id: n.id,
          uuid: n.uuid,
          type: n.type,
          subType: n.subType,
          title: n.title,
          message: n.message,
          isRead: true,
          data: n.data,
          createdAt: n.createdAt,
          updatedAt: n.updatedAt,
        );
      }
      return n;
    }).toList();

    final newUnreadCount = _vm.unreadCount > 0 ? _vm.unreadCount - 1 : 0;
    _vm = _vm.copyWith(
      notifications: updatedNotifications,
      unreadCount: newUnreadCount,
    );
    emit(NotificationsState.loaded(_vm));

    try {
      final result = await _notificationsRepo.markAsRead(uuid);

      result.when(
        success: (_) {
          _logger.i('Notification $uuid marked as read');
        },
        failure: (error) {
          _logger.e('Error marking notification as read: ${error.errorMsg}');
          // Revert on error
          loadNotifications(showLoading: false);
        },
      );
    } catch (e) {
      _logger.e('Exception marking notification as read: $e');
      loadNotifications(showLoading: false);
    }
  }

  /// Marca todas las notificaciones como leídas
  Future<void> markAllAsRead() async {
    if (!_authService.isLoggedIn || _vm.unreadCount == 0) return;

    emit(NotificationsState.loading(_vm));

    // Optimistic update
    final updatedNotifications = _vm.notifications.map((n) {
      return NotificationDM(
        id: n.id,
        uuid: n.uuid,
        type: n.type,
        subType: n.subType,
        title: n.title,
        message: n.message,
        isRead: true,
        data: n.data,
        createdAt: n.createdAt,
        updatedAt: n.updatedAt,
      );
    }).toList();

    _vm = _vm.copyWith(
      notifications: updatedNotifications,
      unreadCount: 0,
    );
    emit(NotificationsState.loaded(_vm));

    try {
      final result = await _notificationsRepo.markAllAsRead();

      result.when(
        success: (_) {
          _logger.i('All notifications marked as read');
        },
        failure: (error) {
          _logger.e('Error marking all notifications as read: ${error.errorMsg}');
          loadNotifications(showLoading: false);
        },
      );
    } catch (e) {
      _logger.e('Exception marking all notifications as read: $e');
      loadNotifications(showLoading: false);
    }
  }

  /// Elimina una notificación
  Future<void> deleteNotification(String uuid) async {
    if (!_authService.isLoggedIn) return;

    // Optimistic update
    final wasUnread = _vm.notifications.any((n) => n.uuid == uuid && !n.isRead);
    final updatedNotifications = _vm.notifications.where((n) => n.uuid != uuid).toList();
    final newUnreadCount = wasUnread && _vm.unreadCount > 0 ? _vm.unreadCount - 1 : _vm.unreadCount;

    _vm = _vm.copyWith(
      notifications: updatedNotifications,
      unreadCount: newUnreadCount,
      total: _vm.total > 0 ? _vm.total - 1 : 0,
    );
    emit(NotificationsState.loaded(_vm));

    try {
      final result = await _notificationsRepo.deleteNotification(uuid);

      result.when(
        success: (_) {
          _logger.i('Notification $uuid deleted');
        },
        failure: (error) {
          _logger.e('Error deleting notification: ${error.errorMsg}');
          loadNotifications(showLoading: false);
        },
      );
    } catch (e) {
      _logger.e('Exception deleting notification: $e');
      loadNotifications(showLoading: false);
    }
  }

  /// Inicia el polling periódico
  void _startPolling() {
    _stopPolling();
    _vm = _vm.copyWith(isPolling: true);

    _pollingTimer = Timer.periodic(
      const Duration(seconds: _pollingIntervalSeconds),
      (_) => refreshUnreadCount(),
    );

    _logger.i('NotificationsCubit: Polling started (every $_pollingIntervalSeconds seconds)');
  }

  /// Detiene el polling
  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _vm = _vm.copyWith(isPolling: false);
  }

  /// Pausa el polling (cuando la app va a background)
  void pausePolling() {
    _stopPolling();
    _logger.i('NotificationsCubit: Polling paused');
  }

  /// Reanuda el polling (cuando la app vuelve a foreground)
  void resumePolling() {
    if (_authService.isLoggedIn) {
      refreshUnreadCount();
      _startPolling();
      _logger.i('NotificationsCubit: Polling resumed');
    }
  }

  /// Limpia el estado (logout)
  void clear() {
    _stopPolling();
    _dialogShownForIds.clear();
    _pendingReservationNotification = null;
    _vm = const NotificationsVM();
    emit(const NotificationsState.initial(NotificationsVM()));
    _logger.i('NotificationsCubit: State cleared');
  }

  Future<void> _precacheNotificationImages(List<NotificationDM> notifications) {
    final futures = <Future<void>>[];
    for (final n in notifications) {
      final f = _precacheUrlFuture(n.actorPhotoUrl);
      if (f != null) futures.add(f);
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url, cacheManager: FoodlyImageCache.manager).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) { if (!completer.isCompleted) completer.complete(); },
      onError: (_, __) { if (!completer.isCompleted) completer.complete(); },
    ));
    return completer.future;
  }

  /// Getter para el contador de no leídas (útil para badges)
  int get unreadCount => _vm.unreadCount;

  /// Getter para verificar si hay notificaciones no leídas
  bool get hasUnread => _vm.hasUnread;

  @override
  Future<void> close() {
    _stopPolling();
    return super.close();
  }
}
