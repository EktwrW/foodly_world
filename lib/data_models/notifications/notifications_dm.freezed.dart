// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsResponseDM {
  List<NotificationDM> get notifications;
  NotificationsMetaDM? get meta;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsResponseDMCopyWith<NotificationsResponseDM> get copyWith =>
      _$NotificationsResponseDMCopyWithImpl<NotificationsResponseDM>(
          this as NotificationsResponseDM, _$identity);

  /// Serializes this NotificationsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsResponseDM &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(notifications), meta);

  @override
  String toString() {
    return 'NotificationsResponseDM(notifications: $notifications, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $NotificationsResponseDMCopyWith<$Res> {
  factory $NotificationsResponseDMCopyWith(NotificationsResponseDM value,
          $Res Function(NotificationsResponseDM) _then) =
      _$NotificationsResponseDMCopyWithImpl;
  @useResult
  $Res call({List<NotificationDM> notifications, NotificationsMetaDM? meta});

  $NotificationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$NotificationsResponseDMCopyWithImpl<$Res>
    implements $NotificationsResponseDMCopyWith<$Res> {
  _$NotificationsResponseDMCopyWithImpl(this._self, this._then);

  final NotificationsResponseDM _self;
  final $Res Function(NotificationsResponseDM) _then;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      notifications: null == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NotificationsMetaDM?,
    ));
  }

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $NotificationsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NotificationsResponseDM].
extension NotificationsResponseDMPatterns on NotificationsResponseDM {
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
    TResult Function(_NotificationsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsResponseDM() when $default != null:
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
    TResult Function(_NotificationsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsResponseDM():
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
    TResult? Function(_NotificationsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsResponseDM() when $default != null:
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
            List<NotificationDM> notifications, NotificationsMetaDM? meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsResponseDM() when $default != null:
        return $default(_that.notifications, _that.meta);
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
            List<NotificationDM> notifications, NotificationsMetaDM? meta)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsResponseDM():
        return $default(_that.notifications, _that.meta);
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
            List<NotificationDM> notifications, NotificationsMetaDM? meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsResponseDM() when $default != null:
        return $default(_that.notifications, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationsResponseDM implements NotificationsResponseDM {
  const _NotificationsResponseDM(
      {final List<NotificationDM> notifications = const [], this.meta})
      : _notifications = notifications;
  factory _NotificationsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseDMFromJson(json);

  final List<NotificationDM> _notifications;
  @override
  @JsonKey()
  List<NotificationDM> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final NotificationsMetaDM? meta;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsResponseDMCopyWith<_NotificationsResponseDM> get copyWith =>
      __$NotificationsResponseDMCopyWithImpl<_NotificationsResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsResponseDM &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications), meta);

  @override
  String toString() {
    return 'NotificationsResponseDM(notifications: $notifications, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsResponseDMCopyWith<$Res>
    implements $NotificationsResponseDMCopyWith<$Res> {
  factory _$NotificationsResponseDMCopyWith(_NotificationsResponseDM value,
          $Res Function(_NotificationsResponseDM) _then) =
      __$NotificationsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<NotificationDM> notifications, NotificationsMetaDM? meta});

  @override
  $NotificationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$NotificationsResponseDMCopyWithImpl<$Res>
    implements _$NotificationsResponseDMCopyWith<$Res> {
  __$NotificationsResponseDMCopyWithImpl(this._self, this._then);

  final _NotificationsResponseDM _self;
  final $Res Function(_NotificationsResponseDM) _then;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notifications = null,
    Object? meta = freezed,
  }) {
    return _then(_NotificationsResponseDM(
      notifications: null == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NotificationsMetaDM?,
    ));
  }

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $NotificationsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$NotificationsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get total;
  @JsonKey(name: 'unread_count')
  int get unreadCount;

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsMetaDMCopyWith<NotificationsMetaDM> get copyWith =>
      _$NotificationsMetaDMCopyWithImpl<NotificationsMetaDM>(
          this as NotificationsMetaDM, _$identity);

  /// Serializes this NotificationsMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, lastPage, perPage, total, unreadCount);

  @override
  String toString() {
    return 'NotificationsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class $NotificationsMetaDMCopyWith<$Res> {
  factory $NotificationsMetaDMCopyWith(
          NotificationsMetaDM value, $Res Function(NotificationsMetaDM) _then) =
      _$NotificationsMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class _$NotificationsMetaDMCopyWithImpl<$Res>
    implements $NotificationsMetaDMCopyWith<$Res> {
  _$NotificationsMetaDMCopyWithImpl(this._self, this._then);

  final NotificationsMetaDM _self;
  final $Res Function(NotificationsMetaDM) _then;

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? unreadCount = null,
  }) {
    return _then(_self.copyWith(
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
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationsMetaDM].
extension NotificationsMetaDMPatterns on NotificationsMetaDM {
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
    TResult Function(_NotificationsMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsMetaDM() when $default != null:
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
    TResult Function(_NotificationsMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsMetaDM():
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
    TResult? Function(_NotificationsMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsMetaDM() when $default != null:
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total,
            @JsonKey(name: 'unread_count') int unreadCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsMetaDM() when $default != null:
        return $default(_that.currentPage, _that.lastPage, _that.perPage,
            _that.total, _that.unreadCount);
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total,
            @JsonKey(name: 'unread_count') int unreadCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsMetaDM():
        return $default(_that.currentPage, _that.lastPage, _that.perPage,
            _that.total, _that.unreadCount);
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
            @JsonKey(name: 'current_page') int currentPage,
            @JsonKey(name: 'last_page') int lastPage,
            @JsonKey(name: 'per_page') int perPage,
            int total,
            @JsonKey(name: 'unread_count') int unreadCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsMetaDM() when $default != null:
        return $default(_that.currentPage, _that.lastPage, _that.perPage,
            _that.total, _that.unreadCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationsMetaDM implements NotificationsMetaDM {
  const _NotificationsMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0,
      @JsonKey(name: 'unread_count') this.unreadCount = 0});
  factory _NotificationsMetaDM.fromJson(Map<String, dynamic> json) =>
      _$NotificationsMetaDMFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsMetaDMCopyWith<_NotificationsMetaDM> get copyWith =>
      __$NotificationsMetaDMCopyWithImpl<_NotificationsMetaDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationsMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, lastPage, perPage, total, unreadCount);

  @override
  String toString() {
    return 'NotificationsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsMetaDMCopyWith<$Res>
    implements $NotificationsMetaDMCopyWith<$Res> {
  factory _$NotificationsMetaDMCopyWith(_NotificationsMetaDM value,
          $Res Function(_NotificationsMetaDM) _then) =
      __$NotificationsMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class __$NotificationsMetaDMCopyWithImpl<$Res>
    implements _$NotificationsMetaDMCopyWith<$Res> {
  __$NotificationsMetaDMCopyWithImpl(this._self, this._then);

  final _NotificationsMetaDM _self;
  final $Res Function(_NotificationsMetaDM) _then;

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? unreadCount = null,
  }) {
    return _then(_NotificationsMetaDM(
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
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$UnreadCountResponseDM {
  @JsonKey(name: 'unread_count')
  int get unreadCount;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnreadCountResponseDMCopyWith<UnreadCountResponseDM> get copyWith =>
      _$UnreadCountResponseDMCopyWithImpl<UnreadCountResponseDM>(
          this as UnreadCountResponseDM, _$identity);

  /// Serializes this UnreadCountResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnreadCountResponseDM &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unreadCount);

  @override
  String toString() {
    return 'UnreadCountResponseDM(unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class $UnreadCountResponseDMCopyWith<$Res> {
  factory $UnreadCountResponseDMCopyWith(UnreadCountResponseDM value,
          $Res Function(UnreadCountResponseDM) _then) =
      _$UnreadCountResponseDMCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class _$UnreadCountResponseDMCopyWithImpl<$Res>
    implements $UnreadCountResponseDMCopyWith<$Res> {
  _$UnreadCountResponseDMCopyWithImpl(this._self, this._then);

  final UnreadCountResponseDM _self;
  final $Res Function(UnreadCountResponseDM) _then;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
  }) {
    return _then(_self.copyWith(
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UnreadCountResponseDM].
extension UnreadCountResponseDMPatterns on UnreadCountResponseDM {
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
    TResult Function(_UnreadCountResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnreadCountResponseDM() when $default != null:
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
    TResult Function(_UnreadCountResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnreadCountResponseDM():
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
    TResult? Function(_UnreadCountResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnreadCountResponseDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'unread_count') int unreadCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnreadCountResponseDM() when $default != null:
        return $default(_that.unreadCount);
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
    TResult Function(@JsonKey(name: 'unread_count') int unreadCount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnreadCountResponseDM():
        return $default(_that.unreadCount);
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
    TResult? Function(@JsonKey(name: 'unread_count') int unreadCount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnreadCountResponseDM() when $default != null:
        return $default(_that.unreadCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UnreadCountResponseDM implements UnreadCountResponseDM {
  const _UnreadCountResponseDM(
      {@JsonKey(name: 'unread_count') this.unreadCount = 0});
  factory _UnreadCountResponseDM.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountResponseDMFromJson(json);

  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnreadCountResponseDMCopyWith<_UnreadCountResponseDM> get copyWith =>
      __$UnreadCountResponseDMCopyWithImpl<_UnreadCountResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UnreadCountResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnreadCountResponseDM &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unreadCount);

  @override
  String toString() {
    return 'UnreadCountResponseDM(unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class _$UnreadCountResponseDMCopyWith<$Res>
    implements $UnreadCountResponseDMCopyWith<$Res> {
  factory _$UnreadCountResponseDMCopyWith(_UnreadCountResponseDM value,
          $Res Function(_UnreadCountResponseDM) _then) =
      __$UnreadCountResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class __$UnreadCountResponseDMCopyWithImpl<$Res>
    implements _$UnreadCountResponseDMCopyWith<$Res> {
  __$UnreadCountResponseDMCopyWithImpl(this._self, this._then);

  final _UnreadCountResponseDM _self;
  final $Res Function(_UnreadCountResponseDM) _then;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unreadCount = null,
  }) {
    return _then(_UnreadCountResponseDM(
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$NotificationDataDM {
  @JsonKey(name: 'actor_id')
  int? get actorId;
  @JsonKey(name: 'actor_uuid')
  String? get actorUuid;
  @JsonKey(name: 'actor_photo_url')
  String? get actorPhotoUrl;
  @JsonKey(name: 'business_id')
  int? get businessId;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @JsonKey(name: 'menu_id')
  int? get menuId;
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid;
  @JsonKey(name: 'food_item_id')
  int? get foodItemId;
  @JsonKey(name: 'food_item_uuid')
  String? get foodItemUuid;
  @JsonKey(name: 'drink_item_id')
  int? get drinkItemId;
  @JsonKey(name: 'drink_item_uuid')
  String? get drinkItemUuid;
  @JsonKey(name: 'combo_id')
  int? get comboId;
  @JsonKey(name: 'combo_uuid')
  String? get comboUuid;
  @JsonKey(name: 'promotion_id')
  int? get promotionId;
  @JsonKey(name: 'promotion_uuid')
  String? get promotionUuid;
  @JsonKey(name: 'reservation_uuid')
  String?
      get reservationUuid; // Social graph: post creado por un user seguido (Follow Loop). Lo
// poblamos por completitud aunque hoy el tap-target del switch de
// entityUuid es el perfil del actor (no hay aún una ruta a un post
// individual). Si más adelante agregamos PostDetailPage, basta con
// cambiar el case del switch a data?.postUuid.
  @JsonKey(name: 'post_uuid')
  String? get postUuid;

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationDataDMCopyWith<NotificationDataDM> get copyWith =>
      _$NotificationDataDMCopyWithImpl<NotificationDataDM>(
          this as NotificationDataDM, _$identity);

  /// Serializes this NotificationDataDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationDataDM &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.actorUuid, actorUuid) ||
                other.actorUuid == actorUuid) &&
            (identical(other.actorPhotoUrl, actorPhotoUrl) ||
                other.actorPhotoUrl == actorPhotoUrl) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.menuUuid, menuUuid) ||
                other.menuUuid == menuUuid) &&
            (identical(other.foodItemId, foodItemId) ||
                other.foodItemId == foodItemId) &&
            (identical(other.foodItemUuid, foodItemUuid) ||
                other.foodItemUuid == foodItemUuid) &&
            (identical(other.drinkItemId, drinkItemId) ||
                other.drinkItemId == drinkItemId) &&
            (identical(other.drinkItemUuid, drinkItemUuid) ||
                other.drinkItemUuid == drinkItemUuid) &&
            (identical(other.comboId, comboId) || other.comboId == comboId) &&
            (identical(other.comboUuid, comboUuid) ||
                other.comboUuid == comboUuid) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.promotionUuid, promotionUuid) ||
                other.promotionUuid == promotionUuid) &&
            (identical(other.reservationUuid, reservationUuid) ||
                other.reservationUuid == reservationUuid) &&
            (identical(other.postUuid, postUuid) ||
                other.postUuid == postUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      actorId,
      actorUuid,
      actorPhotoUrl,
      businessId,
      businessUuid,
      menuId,
      menuUuid,
      foodItemId,
      foodItemUuid,
      drinkItemId,
      drinkItemUuid,
      comboId,
      comboUuid,
      promotionId,
      promotionUuid,
      reservationUuid,
      postUuid);

  @override
  String toString() {
    return 'NotificationDataDM(actorId: $actorId, actorUuid: $actorUuid, actorPhotoUrl: $actorPhotoUrl, businessId: $businessId, businessUuid: $businessUuid, menuId: $menuId, menuUuid: $menuUuid, foodItemId: $foodItemId, foodItemUuid: $foodItemUuid, drinkItemId: $drinkItemId, drinkItemUuid: $drinkItemUuid, comboId: $comboId, comboUuid: $comboUuid, promotionId: $promotionId, promotionUuid: $promotionUuid, reservationUuid: $reservationUuid, postUuid: $postUuid)';
  }
}

/// @nodoc
abstract mixin class $NotificationDataDMCopyWith<$Res> {
  factory $NotificationDataDMCopyWith(
          NotificationDataDM value, $Res Function(NotificationDataDM) _then) =
      _$NotificationDataDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'actor_id') int? actorId,
      @JsonKey(name: 'actor_uuid') String? actorUuid,
      @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl,
      @JsonKey(name: 'business_id') int? businessId,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'menu_id') int? menuId,
      @JsonKey(name: 'menu_uuid') String? menuUuid,
      @JsonKey(name: 'food_item_id') int? foodItemId,
      @JsonKey(name: 'food_item_uuid') String? foodItemUuid,
      @JsonKey(name: 'drink_item_id') int? drinkItemId,
      @JsonKey(name: 'drink_item_uuid') String? drinkItemUuid,
      @JsonKey(name: 'combo_id') int? comboId,
      @JsonKey(name: 'combo_uuid') String? comboUuid,
      @JsonKey(name: 'promotion_id') int? promotionId,
      @JsonKey(name: 'promotion_uuid') String? promotionUuid,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      @JsonKey(name: 'post_uuid') String? postUuid});
}

/// @nodoc
class _$NotificationDataDMCopyWithImpl<$Res>
    implements $NotificationDataDMCopyWith<$Res> {
  _$NotificationDataDMCopyWithImpl(this._self, this._then);

  final NotificationDataDM _self;
  final $Res Function(NotificationDataDM) _then;

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actorId = freezed,
    Object? actorUuid = freezed,
    Object? actorPhotoUrl = freezed,
    Object? businessId = freezed,
    Object? businessUuid = freezed,
    Object? menuId = freezed,
    Object? menuUuid = freezed,
    Object? foodItemId = freezed,
    Object? foodItemUuid = freezed,
    Object? drinkItemId = freezed,
    Object? drinkItemUuid = freezed,
    Object? comboId = freezed,
    Object? comboUuid = freezed,
    Object? promotionId = freezed,
    Object? promotionUuid = freezed,
    Object? reservationUuid = freezed,
    Object? postUuid = freezed,
  }) {
    return _then(_self.copyWith(
      actorId: freezed == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as int?,
      actorUuid: freezed == actorUuid
          ? _self.actorUuid
          : actorUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actorPhotoUrl: freezed == actorPhotoUrl
          ? _self.actorPhotoUrl
          : actorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: freezed == menuId
          ? _self.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      menuUuid: freezed == menuUuid
          ? _self.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodItemId: freezed == foodItemId
          ? _self.foodItemId
          : foodItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      foodItemUuid: freezed == foodItemUuid
          ? _self.foodItemUuid
          : foodItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      drinkItemId: freezed == drinkItemId
          ? _self.drinkItemId
          : drinkItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkItemUuid: freezed == drinkItemUuid
          ? _self.drinkItemUuid
          : drinkItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      comboId: freezed == comboId
          ? _self.comboId
          : comboId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboUuid: freezed == comboUuid
          ? _self.comboUuid
          : comboUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: freezed == promotionId
          ? _self.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionUuid: freezed == promotionUuid
          ? _self.promotionUuid
          : promotionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationUuid: freezed == reservationUuid
          ? _self.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      postUuid: freezed == postUuid
          ? _self.postUuid
          : postUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationDataDM].
extension NotificationDataDMPatterns on NotificationDataDM {
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
    TResult Function(_NotificationDataDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationDataDM() when $default != null:
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
    TResult Function(_NotificationDataDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDataDM():
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
    TResult? Function(_NotificationDataDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDataDM() when $default != null:
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
            @JsonKey(name: 'actor_id') int? actorId,
            @JsonKey(name: 'actor_uuid') String? actorUuid,
            @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl,
            @JsonKey(name: 'business_id') int? businessId,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'menu_id') int? menuId,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'food_item_id') int? foodItemId,
            @JsonKey(name: 'food_item_uuid') String? foodItemUuid,
            @JsonKey(name: 'drink_item_id') int? drinkItemId,
            @JsonKey(name: 'drink_item_uuid') String? drinkItemUuid,
            @JsonKey(name: 'combo_id') int? comboId,
            @JsonKey(name: 'combo_uuid') String? comboUuid,
            @JsonKey(name: 'promotion_id') int? promotionId,
            @JsonKey(name: 'promotion_uuid') String? promotionUuid,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            @JsonKey(name: 'post_uuid') String? postUuid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationDataDM() when $default != null:
        return $default(
            _that.actorId,
            _that.actorUuid,
            _that.actorPhotoUrl,
            _that.businessId,
            _that.businessUuid,
            _that.menuId,
            _that.menuUuid,
            _that.foodItemId,
            _that.foodItemUuid,
            _that.drinkItemId,
            _that.drinkItemUuid,
            _that.comboId,
            _that.comboUuid,
            _that.promotionId,
            _that.promotionUuid,
            _that.reservationUuid,
            _that.postUuid);
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
            @JsonKey(name: 'actor_id') int? actorId,
            @JsonKey(name: 'actor_uuid') String? actorUuid,
            @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl,
            @JsonKey(name: 'business_id') int? businessId,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'menu_id') int? menuId,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'food_item_id') int? foodItemId,
            @JsonKey(name: 'food_item_uuid') String? foodItemUuid,
            @JsonKey(name: 'drink_item_id') int? drinkItemId,
            @JsonKey(name: 'drink_item_uuid') String? drinkItemUuid,
            @JsonKey(name: 'combo_id') int? comboId,
            @JsonKey(name: 'combo_uuid') String? comboUuid,
            @JsonKey(name: 'promotion_id') int? promotionId,
            @JsonKey(name: 'promotion_uuid') String? promotionUuid,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            @JsonKey(name: 'post_uuid') String? postUuid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDataDM():
        return $default(
            _that.actorId,
            _that.actorUuid,
            _that.actorPhotoUrl,
            _that.businessId,
            _that.businessUuid,
            _that.menuId,
            _that.menuUuid,
            _that.foodItemId,
            _that.foodItemUuid,
            _that.drinkItemId,
            _that.drinkItemUuid,
            _that.comboId,
            _that.comboUuid,
            _that.promotionId,
            _that.promotionUuid,
            _that.reservationUuid,
            _that.postUuid);
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
            @JsonKey(name: 'actor_id') int? actorId,
            @JsonKey(name: 'actor_uuid') String? actorUuid,
            @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl,
            @JsonKey(name: 'business_id') int? businessId,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'menu_id') int? menuId,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'food_item_id') int? foodItemId,
            @JsonKey(name: 'food_item_uuid') String? foodItemUuid,
            @JsonKey(name: 'drink_item_id') int? drinkItemId,
            @JsonKey(name: 'drink_item_uuid') String? drinkItemUuid,
            @JsonKey(name: 'combo_id') int? comboId,
            @JsonKey(name: 'combo_uuid') String? comboUuid,
            @JsonKey(name: 'promotion_id') int? promotionId,
            @JsonKey(name: 'promotion_uuid') String? promotionUuid,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            @JsonKey(name: 'post_uuid') String? postUuid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDataDM() when $default != null:
        return $default(
            _that.actorId,
            _that.actorUuid,
            _that.actorPhotoUrl,
            _that.businessId,
            _that.businessUuid,
            _that.menuId,
            _that.menuUuid,
            _that.foodItemId,
            _that.foodItemUuid,
            _that.drinkItemId,
            _that.drinkItemUuid,
            _that.comboId,
            _that.comboUuid,
            _that.promotionId,
            _that.promotionUuid,
            _that.reservationUuid,
            _that.postUuid);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationDataDM implements NotificationDataDM {
  const _NotificationDataDM(
      {@JsonKey(name: 'actor_id') this.actorId,
      @JsonKey(name: 'actor_uuid') this.actorUuid,
      @JsonKey(name: 'actor_photo_url') this.actorPhotoUrl,
      @JsonKey(name: 'business_id') this.businessId,
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'menu_id') this.menuId,
      @JsonKey(name: 'menu_uuid') this.menuUuid,
      @JsonKey(name: 'food_item_id') this.foodItemId,
      @JsonKey(name: 'food_item_uuid') this.foodItemUuid,
      @JsonKey(name: 'drink_item_id') this.drinkItemId,
      @JsonKey(name: 'drink_item_uuid') this.drinkItemUuid,
      @JsonKey(name: 'combo_id') this.comboId,
      @JsonKey(name: 'combo_uuid') this.comboUuid,
      @JsonKey(name: 'promotion_id') this.promotionId,
      @JsonKey(name: 'promotion_uuid') this.promotionUuid,
      @JsonKey(name: 'reservation_uuid') this.reservationUuid,
      @JsonKey(name: 'post_uuid') this.postUuid});
  factory _NotificationDataDM.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataDMFromJson(json);

  @override
  @JsonKey(name: 'actor_id')
  final int? actorId;
  @override
  @JsonKey(name: 'actor_uuid')
  final String? actorUuid;
  @override
  @JsonKey(name: 'actor_photo_url')
  final String? actorPhotoUrl;
  @override
  @JsonKey(name: 'business_id')
  final int? businessId;
  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  @JsonKey(name: 'menu_id')
  final int? menuId;
  @override
  @JsonKey(name: 'menu_uuid')
  final String? menuUuid;
  @override
  @JsonKey(name: 'food_item_id')
  final int? foodItemId;
  @override
  @JsonKey(name: 'food_item_uuid')
  final String? foodItemUuid;
  @override
  @JsonKey(name: 'drink_item_id')
  final int? drinkItemId;
  @override
  @JsonKey(name: 'drink_item_uuid')
  final String? drinkItemUuid;
  @override
  @JsonKey(name: 'combo_id')
  final int? comboId;
  @override
  @JsonKey(name: 'combo_uuid')
  final String? comboUuid;
  @override
  @JsonKey(name: 'promotion_id')
  final int? promotionId;
  @override
  @JsonKey(name: 'promotion_uuid')
  final String? promotionUuid;
  @override
  @JsonKey(name: 'reservation_uuid')
  final String? reservationUuid;
// Social graph: post creado por un user seguido (Follow Loop). Lo
// poblamos por completitud aunque hoy el tap-target del switch de
// entityUuid es el perfil del actor (no hay aún una ruta a un post
// individual). Si más adelante agregamos PostDetailPage, basta con
// cambiar el case del switch a data?.postUuid.
  @override
  @JsonKey(name: 'post_uuid')
  final String? postUuid;

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationDataDMCopyWith<_NotificationDataDM> get copyWith =>
      __$NotificationDataDMCopyWithImpl<_NotificationDataDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationDataDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationDataDM &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.actorUuid, actorUuid) ||
                other.actorUuid == actorUuid) &&
            (identical(other.actorPhotoUrl, actorPhotoUrl) ||
                other.actorPhotoUrl == actorPhotoUrl) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.menuUuid, menuUuid) ||
                other.menuUuid == menuUuid) &&
            (identical(other.foodItemId, foodItemId) ||
                other.foodItemId == foodItemId) &&
            (identical(other.foodItemUuid, foodItemUuid) ||
                other.foodItemUuid == foodItemUuid) &&
            (identical(other.drinkItemId, drinkItemId) ||
                other.drinkItemId == drinkItemId) &&
            (identical(other.drinkItemUuid, drinkItemUuid) ||
                other.drinkItemUuid == drinkItemUuid) &&
            (identical(other.comboId, comboId) || other.comboId == comboId) &&
            (identical(other.comboUuid, comboUuid) ||
                other.comboUuid == comboUuid) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.promotionUuid, promotionUuid) ||
                other.promotionUuid == promotionUuid) &&
            (identical(other.reservationUuid, reservationUuid) ||
                other.reservationUuid == reservationUuid) &&
            (identical(other.postUuid, postUuid) ||
                other.postUuid == postUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      actorId,
      actorUuid,
      actorPhotoUrl,
      businessId,
      businessUuid,
      menuId,
      menuUuid,
      foodItemId,
      foodItemUuid,
      drinkItemId,
      drinkItemUuid,
      comboId,
      comboUuid,
      promotionId,
      promotionUuid,
      reservationUuid,
      postUuid);

  @override
  String toString() {
    return 'NotificationDataDM(actorId: $actorId, actorUuid: $actorUuid, actorPhotoUrl: $actorPhotoUrl, businessId: $businessId, businessUuid: $businessUuid, menuId: $menuId, menuUuid: $menuUuid, foodItemId: $foodItemId, foodItemUuid: $foodItemUuid, drinkItemId: $drinkItemId, drinkItemUuid: $drinkItemUuid, comboId: $comboId, comboUuid: $comboUuid, promotionId: $promotionId, promotionUuid: $promotionUuid, reservationUuid: $reservationUuid, postUuid: $postUuid)';
  }
}

/// @nodoc
abstract mixin class _$NotificationDataDMCopyWith<$Res>
    implements $NotificationDataDMCopyWith<$Res> {
  factory _$NotificationDataDMCopyWith(
          _NotificationDataDM value, $Res Function(_NotificationDataDM) _then) =
      __$NotificationDataDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'actor_id') int? actorId,
      @JsonKey(name: 'actor_uuid') String? actorUuid,
      @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl,
      @JsonKey(name: 'business_id') int? businessId,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'menu_id') int? menuId,
      @JsonKey(name: 'menu_uuid') String? menuUuid,
      @JsonKey(name: 'food_item_id') int? foodItemId,
      @JsonKey(name: 'food_item_uuid') String? foodItemUuid,
      @JsonKey(name: 'drink_item_id') int? drinkItemId,
      @JsonKey(name: 'drink_item_uuid') String? drinkItemUuid,
      @JsonKey(name: 'combo_id') int? comboId,
      @JsonKey(name: 'combo_uuid') String? comboUuid,
      @JsonKey(name: 'promotion_id') int? promotionId,
      @JsonKey(name: 'promotion_uuid') String? promotionUuid,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      @JsonKey(name: 'post_uuid') String? postUuid});
}

/// @nodoc
class __$NotificationDataDMCopyWithImpl<$Res>
    implements _$NotificationDataDMCopyWith<$Res> {
  __$NotificationDataDMCopyWithImpl(this._self, this._then);

  final _NotificationDataDM _self;
  final $Res Function(_NotificationDataDM) _then;

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? actorId = freezed,
    Object? actorUuid = freezed,
    Object? actorPhotoUrl = freezed,
    Object? businessId = freezed,
    Object? businessUuid = freezed,
    Object? menuId = freezed,
    Object? menuUuid = freezed,
    Object? foodItemId = freezed,
    Object? foodItemUuid = freezed,
    Object? drinkItemId = freezed,
    Object? drinkItemUuid = freezed,
    Object? comboId = freezed,
    Object? comboUuid = freezed,
    Object? promotionId = freezed,
    Object? promotionUuid = freezed,
    Object? reservationUuid = freezed,
    Object? postUuid = freezed,
  }) {
    return _then(_NotificationDataDM(
      actorId: freezed == actorId
          ? _self.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as int?,
      actorUuid: freezed == actorUuid
          ? _self.actorUuid
          : actorUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actorPhotoUrl: freezed == actorPhotoUrl
          ? _self.actorPhotoUrl
          : actorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: freezed == menuId
          ? _self.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      menuUuid: freezed == menuUuid
          ? _self.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodItemId: freezed == foodItemId
          ? _self.foodItemId
          : foodItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      foodItemUuid: freezed == foodItemUuid
          ? _self.foodItemUuid
          : foodItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      drinkItemId: freezed == drinkItemId
          ? _self.drinkItemId
          : drinkItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkItemUuid: freezed == drinkItemUuid
          ? _self.drinkItemUuid
          : drinkItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      comboId: freezed == comboId
          ? _self.comboId
          : comboId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboUuid: freezed == comboUuid
          ? _self.comboUuid
          : comboUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: freezed == promotionId
          ? _self.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionUuid: freezed == promotionUuid
          ? _self.promotionUuid
          : promotionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationUuid: freezed == reservationUuid
          ? _self.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      postUuid: freezed == postUuid
          ? _self.postUuid
          : postUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$NotificationDM {
  int get id;
  String get uuid;
  FoodlyNotificationType?
      get type; // Defensive parsing: if the BE ships a subType the FE enum doesn't know
// about (e.g. a new vertical rolled out ahead of the FE patch), fall
// back to `generalUpdate` instead of throwing ArgumentError. Without
// this, a single unknown subtype in a page of results aborts the whole
// `fromJson` of NotificationsResponseDM and the user sees an empty
// list + the generic Dio error modal. Seen live on 2026-04-20 when the
// BE started emitting service_booking_* subtypes for the Catering &
// Chefs vertical before this enum was updated.
  @JsonKey(
      name: 'sub_type',
      unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
  FoodlyNotificationSubType? get subType;
  String get title;
  String get message;
  @JsonKey(name: 'is_read')
  bool get isRead;
  NotificationDataDM? get data;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationDMCopyWith<NotificationDM> get copyWith =>
      _$NotificationDMCopyWithImpl<NotificationDM>(
          this as NotificationDM, _$identity);

  /// Serializes this NotificationDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, type, subType, title,
      message, isRead, data, createdAt, updatedAt);

  @override
  String toString() {
    return 'NotificationDM(id: $id, uuid: $uuid, type: $type, subType: $subType, title: $title, message: $message, isRead: $isRead, data: $data, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $NotificationDMCopyWith<$Res> {
  factory $NotificationDMCopyWith(
          NotificationDM value, $Res Function(NotificationDM) _then) =
      _$NotificationDMCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String uuid,
      FoodlyNotificationType? type,
      @JsonKey(
          name: 'sub_type',
          unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
      FoodlyNotificationSubType? subType,
      String title,
      String message,
      @JsonKey(name: 'is_read') bool isRead,
      NotificationDataDM? data,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $NotificationDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$NotificationDMCopyWithImpl<$Res>
    implements $NotificationDMCopyWith<$Res> {
  _$NotificationDMCopyWithImpl(this._self, this._then);

  final NotificationDM _self;
  final $Res Function(NotificationDM) _then;

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? type = freezed,
    Object? subType = freezed,
    Object? title = null,
    Object? message = null,
    Object? isRead = null,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationType?,
      subType: freezed == subType
          ? _self.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationSubType?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationDataDM?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDataDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $NotificationDataDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NotificationDM].
extension NotificationDMPatterns on NotificationDM {
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
    TResult Function(_NotificationDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationDM() when $default != null:
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
    TResult Function(_NotificationDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDM():
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
    TResult? Function(_NotificationDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDM() when $default != null:
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
            int id,
            String uuid,
            FoodlyNotificationType? type,
            @JsonKey(
                name: 'sub_type',
                unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
            FoodlyNotificationSubType? subType,
            String title,
            String message,
            @JsonKey(name: 'is_read') bool isRead,
            NotificationDataDM? data,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.type,
            _that.subType,
            _that.title,
            _that.message,
            _that.isRead,
            _that.data,
            _that.createdAt,
            _that.updatedAt);
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
            int id,
            String uuid,
            FoodlyNotificationType? type,
            @JsonKey(
                name: 'sub_type',
                unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
            FoodlyNotificationSubType? subType,
            String title,
            String message,
            @JsonKey(name: 'is_read') bool isRead,
            NotificationDataDM? data,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.type,
            _that.subType,
            _that.title,
            _that.message,
            _that.isRead,
            _that.data,
            _that.createdAt,
            _that.updatedAt);
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
            int id,
            String uuid,
            FoodlyNotificationType? type,
            @JsonKey(
                name: 'sub_type',
                unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
            FoodlyNotificationSubType? subType,
            String title,
            String message,
            @JsonKey(name: 'is_read') bool isRead,
            NotificationDataDM? data,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.type,
            _that.subType,
            _that.title,
            _that.message,
            _that.isRead,
            _that.data,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationDM extends NotificationDM {
  const _NotificationDM(
      {required this.id,
      required this.uuid,
      this.type,
      @JsonKey(
          name: 'sub_type',
          unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
      this.subType,
      this.title = '',
      this.message = '',
      @JsonKey(name: 'is_read') this.isRead = false,
      this.data,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();
  factory _NotificationDM.fromJson(Map<String, dynamic> json) =>
      _$NotificationDMFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final FoodlyNotificationType? type;
// Defensive parsing: if the BE ships a subType the FE enum doesn't know
// about (e.g. a new vertical rolled out ahead of the FE patch), fall
// back to `generalUpdate` instead of throwing ArgumentError. Without
// this, a single unknown subtype in a page of results aborts the whole
// `fromJson` of NotificationsResponseDM and the user sees an empty
// list + the generic Dio error modal. Seen live on 2026-04-20 when the
// BE started emitting service_booking_* subtypes for the Catering &
// Chefs vertical before this enum was updated.
  @override
  @JsonKey(
      name: 'sub_type',
      unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
  final FoodlyNotificationSubType? subType;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;
  @override
  final NotificationDataDM? data;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationDMCopyWith<_NotificationDM> get copyWith =>
      __$NotificationDMCopyWithImpl<_NotificationDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, type, subType, title,
      message, isRead, data, createdAt, updatedAt);

  @override
  String toString() {
    return 'NotificationDM(id: $id, uuid: $uuid, type: $type, subType: $subType, title: $title, message: $message, isRead: $isRead, data: $data, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationDMCopyWith<$Res>
    implements $NotificationDMCopyWith<$Res> {
  factory _$NotificationDMCopyWith(
          _NotificationDM value, $Res Function(_NotificationDM) _then) =
      __$NotificationDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      FoodlyNotificationType? type,
      @JsonKey(
          name: 'sub_type',
          unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
      FoodlyNotificationSubType? subType,
      String title,
      String message,
      @JsonKey(name: 'is_read') bool isRead,
      NotificationDataDM? data,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $NotificationDataDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$NotificationDMCopyWithImpl<$Res>
    implements _$NotificationDMCopyWith<$Res> {
  __$NotificationDMCopyWithImpl(this._self, this._then);

  final _NotificationDM _self;
  final $Res Function(_NotificationDM) _then;

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? type = freezed,
    Object? subType = freezed,
    Object? title = null,
    Object? message = null,
    Object? isRead = null,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_NotificationDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationType?,
      subType: freezed == subType
          ? _self.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationSubType?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationDataDM?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDataDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $NotificationDataDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
