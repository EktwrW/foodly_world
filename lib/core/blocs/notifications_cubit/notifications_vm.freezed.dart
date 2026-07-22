// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsVM {
  List<NotificationDM> get notifications;
  int get unreadCount;
  int get currentPage;
  int get lastPage;
  int get perPage;
  int get total;
  bool get isPolling;
  bool get hasMorePages;

  /// Create a copy of NotificationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsVMCopyWith<NotificationsVM> get copyWith =>
      _$NotificationsVMCopyWithImpl<NotificationsVM>(
          this as NotificationsVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsVM &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isPolling, isPolling) ||
                other.isPolling == isPolling) &&
            (identical(other.hasMorePages, hasMorePages) ||
                other.hasMorePages == hasMorePages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notifications),
      unreadCount,
      currentPage,
      lastPage,
      perPage,
      total,
      isPolling,
      hasMorePages);

  @override
  String toString() {
    return 'NotificationsVM(notifications: $notifications, unreadCount: $unreadCount, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, isPolling: $isPolling, hasMorePages: $hasMorePages)';
  }
}

/// @nodoc
abstract mixin class $NotificationsVMCopyWith<$Res> {
  factory $NotificationsVMCopyWith(
          NotificationsVM value, $Res Function(NotificationsVM) _then) =
      _$NotificationsVMCopyWithImpl;
  @useResult
  $Res call(
      {List<NotificationDM> notifications,
      int unreadCount,
      int currentPage,
      int lastPage,
      int perPage,
      int total,
      bool isPolling,
      bool hasMorePages});
}

/// @nodoc
class _$NotificationsVMCopyWithImpl<$Res>
    implements $NotificationsVMCopyWith<$Res> {
  _$NotificationsVMCopyWithImpl(this._self, this._then);

  final NotificationsVM _self;
  final $Res Function(NotificationsVM) _then;

  /// Create a copy of NotificationsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? isPolling = null,
    Object? hasMorePages = null,
  }) {
    return _then(_self.copyWith(
      notifications: null == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDM>,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isPolling: null == isPolling
          ? _self.isPolling
          : isPolling // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMorePages: null == hasMorePages
          ? _self.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationsVM].
extension NotificationsVMPatterns on NotificationsVM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NotificationsVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsVM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NotificationsVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsVM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NotificationsVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsVM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<NotificationDM> notifications,
            int unreadCount,
            int currentPage,
            int lastPage,
            int perPage,
            int total,
            bool isPolling,
            bool hasMorePages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsVM() when $default != null:
        return $default(
            _that.notifications,
            _that.unreadCount,
            _that.currentPage,
            _that.lastPage,
            _that.perPage,
            _that.total,
            _that.isPolling,
            _that.hasMorePages);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<NotificationDM> notifications,
            int unreadCount,
            int currentPage,
            int lastPage,
            int perPage,
            int total,
            bool isPolling,
            bool hasMorePages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsVM():
        return $default(
            _that.notifications,
            _that.unreadCount,
            _that.currentPage,
            _that.lastPage,
            _that.perPage,
            _that.total,
            _that.isPolling,
            _that.hasMorePages);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<NotificationDM> notifications,
            int unreadCount,
            int currentPage,
            int lastPage,
            int perPage,
            int total,
            bool isPolling,
            bool hasMorePages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsVM() when $default != null:
        return $default(
            _that.notifications,
            _that.unreadCount,
            _that.currentPage,
            _that.lastPage,
            _that.perPage,
            _that.total,
            _that.isPolling,
            _that.hasMorePages);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationsVM extends NotificationsVM {
  const _NotificationsVM(
      {final List<NotificationDM> notifications = const [],
      this.unreadCount = 0,
      this.currentPage = 1,
      this.lastPage = 1,
      this.perPage = 20,
      this.total = 0,
      this.isPolling = false,
      this.hasMorePages = false})
      : _notifications = notifications,
        super._();

  final List<NotificationDM> _notifications;
  @override
  @JsonKey()
  List<NotificationDM> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int lastPage;
  @override
  @JsonKey()
  final int perPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool isPolling;
  @override
  @JsonKey()
  final bool hasMorePages;

  /// Create a copy of NotificationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsVMCopyWith<_NotificationsVM> get copyWith =>
      __$NotificationsVMCopyWithImpl<_NotificationsVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsVM &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isPolling, isPolling) ||
                other.isPolling == isPolling) &&
            (identical(other.hasMorePages, hasMorePages) ||
                other.hasMorePages == hasMorePages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notifications),
      unreadCount,
      currentPage,
      lastPage,
      perPage,
      total,
      isPolling,
      hasMorePages);

  @override
  String toString() {
    return 'NotificationsVM(notifications: $notifications, unreadCount: $unreadCount, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, isPolling: $isPolling, hasMorePages: $hasMorePages)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsVMCopyWith<$Res>
    implements $NotificationsVMCopyWith<$Res> {
  factory _$NotificationsVMCopyWith(
          _NotificationsVM value, $Res Function(_NotificationsVM) _then) =
      __$NotificationsVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NotificationDM> notifications,
      int unreadCount,
      int currentPage,
      int lastPage,
      int perPage,
      int total,
      bool isPolling,
      bool hasMorePages});
}

/// @nodoc
class __$NotificationsVMCopyWithImpl<$Res>
    implements _$NotificationsVMCopyWith<$Res> {
  __$NotificationsVMCopyWithImpl(this._self, this._then);

  final _NotificationsVM _self;
  final $Res Function(_NotificationsVM) _then;

  /// Create a copy of NotificationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? isPolling = null,
    Object? hasMorePages = null,
  }) {
    return _then(_NotificationsVM(
      notifications: null == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDM>,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isPolling: null == isPolling
          ? _self.isPolling
          : isPolling // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMorePages: null == hasMorePages
          ? _self.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
