// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationsResponseDM _$NotificationsResponseDMFromJson(
    Map<String, dynamic> json) {
  return _NotificationsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$NotificationsResponseDM {
  List<NotificationDM> get notifications => throw _privateConstructorUsedError;
  NotificationsMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this NotificationsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsResponseDMCopyWith<NotificationsResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsResponseDMCopyWith<$Res> {
  factory $NotificationsResponseDMCopyWith(NotificationsResponseDM value,
          $Res Function(NotificationsResponseDM) then) =
      _$NotificationsResponseDMCopyWithImpl<$Res, NotificationsResponseDM>;
  @useResult
  $Res call({List<NotificationDM> notifications, NotificationsMetaDM? meta});

  $NotificationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$NotificationsResponseDMCopyWithImpl<$Res,
        $Val extends NotificationsResponseDM>
    implements $NotificationsResponseDMCopyWith<$Res> {
  _$NotificationsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NotificationsMetaDM?,
    ) as $Val);
  }

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $NotificationsMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationsResponseDMImplCopyWith<$Res>
    implements $NotificationsResponseDMCopyWith<$Res> {
  factory _$$NotificationsResponseDMImplCopyWith(
          _$NotificationsResponseDMImpl value,
          $Res Function(_$NotificationsResponseDMImpl) then) =
      __$$NotificationsResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotificationDM> notifications, NotificationsMetaDM? meta});

  @override
  $NotificationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$NotificationsResponseDMImplCopyWithImpl<$Res>
    extends _$NotificationsResponseDMCopyWithImpl<$Res,
        _$NotificationsResponseDMImpl>
    implements _$$NotificationsResponseDMImplCopyWith<$Res> {
  __$$NotificationsResponseDMImplCopyWithImpl(
      _$NotificationsResponseDMImpl _value,
      $Res Function(_$NotificationsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? meta = freezed,
  }) {
    return _then(_$NotificationsResponseDMImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NotificationsMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsResponseDMImpl implements _NotificationsResponseDM {
  const _$NotificationsResponseDMImpl(
      {final List<NotificationDM> notifications = const [], this.meta})
      : _notifications = notifications;

  factory _$NotificationsResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NotificationsResponseDM(notifications: $notifications, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsResponseDMImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications), meta);

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsResponseDMImplCopyWith<_$NotificationsResponseDMImpl>
      get copyWith => __$$NotificationsResponseDMImplCopyWithImpl<
          _$NotificationsResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _NotificationsResponseDM implements NotificationsResponseDM {
  const factory _NotificationsResponseDM(
      {final List<NotificationDM> notifications,
      final NotificationsMetaDM? meta}) = _$NotificationsResponseDMImpl;

  factory _NotificationsResponseDM.fromJson(Map<String, dynamic> json) =
      _$NotificationsResponseDMImpl.fromJson;

  @override
  List<NotificationDM> get notifications;
  @override
  NotificationsMetaDM? get meta;

  /// Create a copy of NotificationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsResponseDMImplCopyWith<_$NotificationsResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationsMetaDM _$NotificationsMetaDMFromJson(Map<String, dynamic> json) {
  return _NotificationsMetaDM.fromJson(json);
}

/// @nodoc
mixin _$NotificationsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  int get unreadCount => throw _privateConstructorUsedError;

  /// Serializes this NotificationsMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsMetaDMCopyWith<NotificationsMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsMetaDMCopyWith<$Res> {
  factory $NotificationsMetaDMCopyWith(
          NotificationsMetaDM value, $Res Function(NotificationsMetaDM) then) =
      _$NotificationsMetaDMCopyWithImpl<$Res, NotificationsMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class _$NotificationsMetaDMCopyWithImpl<$Res, $Val extends NotificationsMetaDM>
    implements $NotificationsMetaDMCopyWith<$Res> {
  _$NotificationsMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsMetaDMImplCopyWith<$Res>
    implements $NotificationsMetaDMCopyWith<$Res> {
  factory _$$NotificationsMetaDMImplCopyWith(_$NotificationsMetaDMImpl value,
          $Res Function(_$NotificationsMetaDMImpl) then) =
      __$$NotificationsMetaDMImplCopyWithImpl<$Res>;
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
class __$$NotificationsMetaDMImplCopyWithImpl<$Res>
    extends _$NotificationsMetaDMCopyWithImpl<$Res, _$NotificationsMetaDMImpl>
    implements _$$NotificationsMetaDMImplCopyWith<$Res> {
  __$$NotificationsMetaDMImplCopyWithImpl(_$NotificationsMetaDMImpl _value,
      $Res Function(_$NotificationsMetaDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$NotificationsMetaDMImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsMetaDMImpl implements _NotificationsMetaDM {
  const _$NotificationsMetaDMImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0,
      @JsonKey(name: 'unread_count') this.unreadCount = 0});

  factory _$NotificationsMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsMetaDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NotificationsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsMetaDMImpl &&
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

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsMetaDMImplCopyWith<_$NotificationsMetaDMImpl> get copyWith =>
      __$$NotificationsMetaDMImplCopyWithImpl<_$NotificationsMetaDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsMetaDMImplToJson(
      this,
    );
  }
}

abstract class _NotificationsMetaDM implements NotificationsMetaDM {
  const factory _NotificationsMetaDM(
          {@JsonKey(name: 'current_page') final int currentPage,
          @JsonKey(name: 'last_page') final int lastPage,
          @JsonKey(name: 'per_page') final int perPage,
          final int total,
          @JsonKey(name: 'unread_count') final int unreadCount}) =
      _$NotificationsMetaDMImpl;

  factory _NotificationsMetaDM.fromJson(Map<String, dynamic> json) =
      _$NotificationsMetaDMImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;
  @override
  @JsonKey(name: 'unread_count')
  int get unreadCount;

  /// Create a copy of NotificationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsMetaDMImplCopyWith<_$NotificationsMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnreadCountResponseDM _$UnreadCountResponseDMFromJson(
    Map<String, dynamic> json) {
  return _UnreadCountResponseDM.fromJson(json);
}

/// @nodoc
mixin _$UnreadCountResponseDM {
  @JsonKey(name: 'unread_count')
  int get unreadCount => throw _privateConstructorUsedError;

  /// Serializes this UnreadCountResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnreadCountResponseDMCopyWith<UnreadCountResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadCountResponseDMCopyWith<$Res> {
  factory $UnreadCountResponseDMCopyWith(UnreadCountResponseDM value,
          $Res Function(UnreadCountResponseDM) then) =
      _$UnreadCountResponseDMCopyWithImpl<$Res, UnreadCountResponseDM>;
  @useResult
  $Res call({@JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class _$UnreadCountResponseDMCopyWithImpl<$Res,
        $Val extends UnreadCountResponseDM>
    implements $UnreadCountResponseDMCopyWith<$Res> {
  _$UnreadCountResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
  }) {
    return _then(_value.copyWith(
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnreadCountResponseDMImplCopyWith<$Res>
    implements $UnreadCountResponseDMCopyWith<$Res> {
  factory _$$UnreadCountResponseDMImplCopyWith(
          _$UnreadCountResponseDMImpl value,
          $Res Function(_$UnreadCountResponseDMImpl) then) =
      __$$UnreadCountResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'unread_count') int unreadCount});
}

/// @nodoc
class __$$UnreadCountResponseDMImplCopyWithImpl<$Res>
    extends _$UnreadCountResponseDMCopyWithImpl<$Res,
        _$UnreadCountResponseDMImpl>
    implements _$$UnreadCountResponseDMImplCopyWith<$Res> {
  __$$UnreadCountResponseDMImplCopyWithImpl(_$UnreadCountResponseDMImpl _value,
      $Res Function(_$UnreadCountResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
  }) {
    return _then(_$UnreadCountResponseDMImpl(
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnreadCountResponseDMImpl implements _UnreadCountResponseDM {
  const _$UnreadCountResponseDMImpl(
      {@JsonKey(name: 'unread_count') this.unreadCount = 0});

  factory _$UnreadCountResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadCountResponseDMImplFromJson(json);

  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;

  @override
  String toString() {
    return 'UnreadCountResponseDM(unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadCountResponseDMImpl &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unreadCount);

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadCountResponseDMImplCopyWith<_$UnreadCountResponseDMImpl>
      get copyWith => __$$UnreadCountResponseDMImplCopyWithImpl<
          _$UnreadCountResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadCountResponseDMImplToJson(
      this,
    );
  }
}

abstract class _UnreadCountResponseDM implements UnreadCountResponseDM {
  const factory _UnreadCountResponseDM(
          {@JsonKey(name: 'unread_count') final int unreadCount}) =
      _$UnreadCountResponseDMImpl;

  factory _UnreadCountResponseDM.fromJson(Map<String, dynamic> json) =
      _$UnreadCountResponseDMImpl.fromJson;

  @override
  @JsonKey(name: 'unread_count')
  int get unreadCount;

  /// Create a copy of UnreadCountResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnreadCountResponseDMImplCopyWith<_$UnreadCountResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationDataDM _$NotificationDataDMFromJson(Map<String, dynamic> json) {
  return _NotificationDataDM.fromJson(json);
}

/// @nodoc
mixin _$NotificationDataDM {
  @JsonKey(name: 'actor_id')
  int? get actorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'actor_uuid')
  String? get actorUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'actor_photo_url')
  String? get actorPhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_id')
  int? get businessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_id')
  int? get menuId => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_item_id')
  int? get foodItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_item_uuid')
  String? get foodItemUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'drink_item_id')
  int? get drinkItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'drink_item_uuid')
  String? get drinkItemUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'combo_id')
  int? get comboId => throw _privateConstructorUsedError;
  @JsonKey(name: 'combo_uuid')
  String? get comboUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotion_id')
  int? get promotionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotion_uuid')
  String? get promotionUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid => throw _privateConstructorUsedError;

  /// Serializes this NotificationDataDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationDataDMCopyWith<NotificationDataDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataDMCopyWith<$Res> {
  factory $NotificationDataDMCopyWith(
          NotificationDataDM value, $Res Function(NotificationDataDM) then) =
      _$NotificationDataDMCopyWithImpl<$Res, NotificationDataDM>;
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
      @JsonKey(name: 'reservation_uuid') String? reservationUuid});
}

/// @nodoc
class _$NotificationDataDMCopyWithImpl<$Res, $Val extends NotificationDataDM>
    implements $NotificationDataDMCopyWith<$Res> {
  _$NotificationDataDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
  }) {
    return _then(_value.copyWith(
      actorId: freezed == actorId
          ? _value.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as int?,
      actorUuid: freezed == actorUuid
          ? _value.actorUuid
          : actorUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actorPhotoUrl: freezed == actorPhotoUrl
          ? _value.actorPhotoUrl
          : actorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: freezed == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      menuUuid: freezed == menuUuid
          ? _value.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodItemId: freezed == foodItemId
          ? _value.foodItemId
          : foodItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      foodItemUuid: freezed == foodItemUuid
          ? _value.foodItemUuid
          : foodItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      drinkItemId: freezed == drinkItemId
          ? _value.drinkItemId
          : drinkItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkItemUuid: freezed == drinkItemUuid
          ? _value.drinkItemUuid
          : drinkItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      comboId: freezed == comboId
          ? _value.comboId
          : comboId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboUuid: freezed == comboUuid
          ? _value.comboUuid
          : comboUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: freezed == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionUuid: freezed == promotionUuid
          ? _value.promotionUuid
          : promotionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationUuid: freezed == reservationUuid
          ? _value.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDataDMImplCopyWith<$Res>
    implements $NotificationDataDMCopyWith<$Res> {
  factory _$$NotificationDataDMImplCopyWith(_$NotificationDataDMImpl value,
          $Res Function(_$NotificationDataDMImpl) then) =
      __$$NotificationDataDMImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'reservation_uuid') String? reservationUuid});
}

/// @nodoc
class __$$NotificationDataDMImplCopyWithImpl<$Res>
    extends _$NotificationDataDMCopyWithImpl<$Res, _$NotificationDataDMImpl>
    implements _$$NotificationDataDMImplCopyWith<$Res> {
  __$$NotificationDataDMImplCopyWithImpl(_$NotificationDataDMImpl _value,
      $Res Function(_$NotificationDataDMImpl) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$NotificationDataDMImpl(
      actorId: freezed == actorId
          ? _value.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as int?,
      actorUuid: freezed == actorUuid
          ? _value.actorUuid
          : actorUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actorPhotoUrl: freezed == actorPhotoUrl
          ? _value.actorPhotoUrl
          : actorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: freezed == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      menuUuid: freezed == menuUuid
          ? _value.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodItemId: freezed == foodItemId
          ? _value.foodItemId
          : foodItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      foodItemUuid: freezed == foodItemUuid
          ? _value.foodItemUuid
          : foodItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      drinkItemId: freezed == drinkItemId
          ? _value.drinkItemId
          : drinkItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkItemUuid: freezed == drinkItemUuid
          ? _value.drinkItemUuid
          : drinkItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      comboId: freezed == comboId
          ? _value.comboId
          : comboId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboUuid: freezed == comboUuid
          ? _value.comboUuid
          : comboUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: freezed == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionUuid: freezed == promotionUuid
          ? _value.promotionUuid
          : promotionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationUuid: freezed == reservationUuid
          ? _value.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataDMImpl implements _NotificationDataDM {
  const _$NotificationDataDMImpl(
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
      @JsonKey(name: 'reservation_uuid') this.reservationUuid});

  factory _$NotificationDataDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NotificationDataDM(actorId: $actorId, actorUuid: $actorUuid, actorPhotoUrl: $actorPhotoUrl, businessId: $businessId, businessUuid: $businessUuid, menuId: $menuId, menuUuid: $menuUuid, foodItemId: $foodItemId, foodItemUuid: $foodItemUuid, drinkItemId: $drinkItemId, drinkItemUuid: $drinkItemUuid, comboId: $comboId, comboUuid: $comboUuid, promotionId: $promotionId, promotionUuid: $promotionUuid, reservationUuid: $reservationUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataDMImpl &&
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
                other.reservationUuid == reservationUuid));
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
      reservationUuid);

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataDMImplCopyWith<_$NotificationDataDMImpl> get copyWith =>
      __$$NotificationDataDMImplCopyWithImpl<_$NotificationDataDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataDMImplToJson(
      this,
    );
  }
}

abstract class _NotificationDataDM implements NotificationDataDM {
  const factory _NotificationDataDM(
          {@JsonKey(name: 'actor_id') final int? actorId,
          @JsonKey(name: 'actor_uuid') final String? actorUuid,
          @JsonKey(name: 'actor_photo_url') final String? actorPhotoUrl,
          @JsonKey(name: 'business_id') final int? businessId,
          @JsonKey(name: 'business_uuid') final String? businessUuid,
          @JsonKey(name: 'menu_id') final int? menuId,
          @JsonKey(name: 'menu_uuid') final String? menuUuid,
          @JsonKey(name: 'food_item_id') final int? foodItemId,
          @JsonKey(name: 'food_item_uuid') final String? foodItemUuid,
          @JsonKey(name: 'drink_item_id') final int? drinkItemId,
          @JsonKey(name: 'drink_item_uuid') final String? drinkItemUuid,
          @JsonKey(name: 'combo_id') final int? comboId,
          @JsonKey(name: 'combo_uuid') final String? comboUuid,
          @JsonKey(name: 'promotion_id') final int? promotionId,
          @JsonKey(name: 'promotion_uuid') final String? promotionUuid,
          @JsonKey(name: 'reservation_uuid') final String? reservationUuid}) =
      _$NotificationDataDMImpl;

  factory _NotificationDataDM.fromJson(Map<String, dynamic> json) =
      _$NotificationDataDMImpl.fromJson;

  @override
  @JsonKey(name: 'actor_id')
  int? get actorId;
  @override
  @JsonKey(name: 'actor_uuid')
  String? get actorUuid;
  @override
  @JsonKey(name: 'actor_photo_url')
  String? get actorPhotoUrl;
  @override
  @JsonKey(name: 'business_id')
  int? get businessId;
  @override
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @override
  @JsonKey(name: 'menu_id')
  int? get menuId;
  @override
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid;
  @override
  @JsonKey(name: 'food_item_id')
  int? get foodItemId;
  @override
  @JsonKey(name: 'food_item_uuid')
  String? get foodItemUuid;
  @override
  @JsonKey(name: 'drink_item_id')
  int? get drinkItemId;
  @override
  @JsonKey(name: 'drink_item_uuid')
  String? get drinkItemUuid;
  @override
  @JsonKey(name: 'combo_id')
  int? get comboId;
  @override
  @JsonKey(name: 'combo_uuid')
  String? get comboUuid;
  @override
  @JsonKey(name: 'promotion_id')
  int? get promotionId;
  @override
  @JsonKey(name: 'promotion_uuid')
  String? get promotionUuid;
  @override
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid;

  /// Create a copy of NotificationDataDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationDataDMImplCopyWith<_$NotificationDataDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationDM _$NotificationDMFromJson(Map<String, dynamic> json) {
  return _NotificationDM.fromJson(json);
}

/// @nodoc
mixin _$NotificationDM {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  FoodlyNotificationType? get type =>
      throw _privateConstructorUsedError; // Defensive parsing: if the BE ships a subType the FE enum doesn't know
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
  FoodlyNotificationSubType? get subType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;
  NotificationDataDM? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this NotificationDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationDMCopyWith<NotificationDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDMCopyWith<$Res> {
  factory $NotificationDMCopyWith(
          NotificationDM value, $Res Function(NotificationDM) then) =
      _$NotificationDMCopyWithImpl<$Res, NotificationDM>;
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
class _$NotificationDMCopyWithImpl<$Res, $Val extends NotificationDM>
    implements $NotificationDMCopyWith<$Res> {
  _$NotificationDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationType?,
      subType: freezed == subType
          ? _value.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationSubType?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationDataDM?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDataDMCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NotificationDataDMCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationDMImplCopyWith<$Res>
    implements $NotificationDMCopyWith<$Res> {
  factory _$$NotificationDMImplCopyWith(_$NotificationDMImpl value,
          $Res Function(_$NotificationDMImpl) then) =
      __$$NotificationDMImplCopyWithImpl<$Res>;
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
class __$$NotificationDMImplCopyWithImpl<$Res>
    extends _$NotificationDMCopyWithImpl<$Res, _$NotificationDMImpl>
    implements _$$NotificationDMImplCopyWith<$Res> {
  __$$NotificationDMImplCopyWithImpl(
      _$NotificationDMImpl _value, $Res Function(_$NotificationDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$NotificationDMImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationType?,
      subType: freezed == subType
          ? _value.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as FoodlyNotificationSubType?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationDataDM?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDMImpl extends _NotificationDM {
  const _$NotificationDMImpl(
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

  factory _$NotificationDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NotificationDM(id: $id, uuid: $uuid, type: $type, subType: $subType, title: $title, message: $message, isRead: $isRead, data: $data, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDMImpl &&
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

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDMImplCopyWith<_$NotificationDMImpl> get copyWith =>
      __$$NotificationDMImplCopyWithImpl<_$NotificationDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDMImplToJson(
      this,
    );
  }
}

abstract class _NotificationDM extends NotificationDM {
  const factory _NotificationDM(
          {required final int id,
          required final String uuid,
          final FoodlyNotificationType? type,
          @JsonKey(
              name: 'sub_type',
              unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
          final FoodlyNotificationSubType? subType,
          final String title,
          final String message,
          @JsonKey(name: 'is_read') final bool isRead,
          final NotificationDataDM? data,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$NotificationDMImpl;
  const _NotificationDM._() : super._();

  factory _NotificationDM.fromJson(Map<String, dynamic> json) =
      _$NotificationDMImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  FoodlyNotificationType?
      get type; // Defensive parsing: if the BE ships a subType the FE enum doesn't know
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
  FoodlyNotificationSubType? get subType;
  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;
  @override
  NotificationDataDM? get data;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of NotificationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationDMImplCopyWith<_$NotificationDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
