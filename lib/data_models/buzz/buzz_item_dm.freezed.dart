// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buzz_item_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuzzResponseDM {
  List<BuzzItemDM> get data;
  BuzzMetaDM? get meta;

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuzzResponseDMCopyWith<BuzzResponseDM> get copyWith =>
      _$BuzzResponseDMCopyWithImpl<BuzzResponseDM>(
          this as BuzzResponseDM, _$identity);

  /// Serializes this BuzzResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuzzResponseDM &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), meta);

  @override
  String toString() {
    return 'BuzzResponseDM(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $BuzzResponseDMCopyWith<$Res> {
  factory $BuzzResponseDMCopyWith(
          BuzzResponseDM value, $Res Function(BuzzResponseDM) _then) =
      _$BuzzResponseDMCopyWithImpl;
  @useResult
  $Res call({List<BuzzItemDM> data, BuzzMetaDM? meta});

  $BuzzMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$BuzzResponseDMCopyWithImpl<$Res>
    implements $BuzzResponseDMCopyWith<$Res> {
  _$BuzzResponseDMCopyWithImpl(this._self, this._then);

  final BuzzResponseDM _self;
  final $Res Function(BuzzResponseDM) _then;

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
    ));
  }

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $BuzzMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BuzzResponseDM].
extension BuzzResponseDMPatterns on BuzzResponseDM {
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
    TResult Function(_BuzzResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuzzResponseDM() when $default != null:
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
    TResult Function(_BuzzResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzResponseDM():
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
    TResult? Function(_BuzzResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzResponseDM() when $default != null:
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
    TResult Function(List<BuzzItemDM> data, BuzzMetaDM? meta)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuzzResponseDM() when $default != null:
        return $default(_that.data, _that.meta);
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
    TResult Function(List<BuzzItemDM> data, BuzzMetaDM? meta) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzResponseDM():
        return $default(_that.data, _that.meta);
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
    TResult? Function(List<BuzzItemDM> data, BuzzMetaDM? meta)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzResponseDM() when $default != null:
        return $default(_that.data, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BuzzResponseDM implements BuzzResponseDM {
  const _BuzzResponseDM({final List<BuzzItemDM> data = const [], this.meta})
      : _data = data;
  factory _BuzzResponseDM.fromJson(Map<String, dynamic> json) =>
      _$BuzzResponseDMFromJson(json);

  final List<BuzzItemDM> _data;
  @override
  @JsonKey()
  List<BuzzItemDM> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final BuzzMetaDM? meta;

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuzzResponseDMCopyWith<_BuzzResponseDM> get copyWith =>
      __$BuzzResponseDMCopyWithImpl<_BuzzResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuzzResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuzzResponseDM &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @override
  String toString() {
    return 'BuzzResponseDM(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$BuzzResponseDMCopyWith<$Res>
    implements $BuzzResponseDMCopyWith<$Res> {
  factory _$BuzzResponseDMCopyWith(
          _BuzzResponseDM value, $Res Function(_BuzzResponseDM) _then) =
      __$BuzzResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<BuzzItemDM> data, BuzzMetaDM? meta});

  @override
  $BuzzMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$BuzzResponseDMCopyWithImpl<$Res>
    implements _$BuzzResponseDMCopyWith<$Res> {
  __$BuzzResponseDMCopyWithImpl(this._self, this._then);

  final _BuzzResponseDM _self;
  final $Res Function(_BuzzResponseDM) _then;

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_BuzzResponseDM(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
    ));
  }

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $BuzzMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$BuzzMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get total;

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<BuzzMetaDM> get copyWith =>
      _$BuzzMetaDMCopyWithImpl<BuzzMetaDM>(this as BuzzMetaDM, _$identity);

  /// Serializes this BuzzMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuzzMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  @override
  String toString() {
    return 'BuzzMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class $BuzzMetaDMCopyWith<$Res> {
  factory $BuzzMetaDMCopyWith(
          BuzzMetaDM value, $Res Function(BuzzMetaDM) _then) =
      _$BuzzMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$BuzzMetaDMCopyWithImpl<$Res> implements $BuzzMetaDMCopyWith<$Res> {
  _$BuzzMetaDMCopyWithImpl(this._self, this._then);

  final BuzzMetaDM _self;
  final $Res Function(BuzzMetaDM) _then;

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [BuzzMetaDM].
extension BuzzMetaDMPatterns on BuzzMetaDM {
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
    TResult Function(_BuzzMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuzzMetaDM() when $default != null:
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
    TResult Function(_BuzzMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzMetaDM():
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
    TResult? Function(_BuzzMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzMetaDM() when $default != null:
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
            int total)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuzzMetaDM() when $default != null:
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
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
            int total)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzMetaDM():
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
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
            int total)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzMetaDM() when $default != null:
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BuzzMetaDM implements BuzzMetaDM {
  const _BuzzMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});
  factory _BuzzMetaDM.fromJson(Map<String, dynamic> json) =>
      _$BuzzMetaDMFromJson(json);

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

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuzzMetaDMCopyWith<_BuzzMetaDM> get copyWith =>
      __$BuzzMetaDMCopyWithImpl<_BuzzMetaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuzzMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuzzMetaDM &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  @override
  String toString() {
    return 'BuzzMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$BuzzMetaDMCopyWith<$Res>
    implements $BuzzMetaDMCopyWith<$Res> {
  factory _$BuzzMetaDMCopyWith(
          _BuzzMetaDM value, $Res Function(_BuzzMetaDM) _then) =
      __$BuzzMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$BuzzMetaDMCopyWithImpl<$Res> implements _$BuzzMetaDMCopyWith<$Res> {
  __$BuzzMetaDMCopyWithImpl(this._self, this._then);

  final _BuzzMetaDM _self;
  final $Res Function(_BuzzMetaDM) _then;

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_BuzzMetaDM(
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
    ));
  }
}

/// @nodoc
mixin _$BuzzItemDM {
  String get uuid;
  String get message;
  @JsonKey(name: 'sub_type')
  String get subType;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @JsonKey(name: 'business_name')
  String get businessName;
  @JsonKey(name: 'business_photo')
  String? get businessPhoto;
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid;
  @JsonKey(name: 'entity_name')
  String? get entityName;
  @JsonKey(name: 'created_at')
  DateTime?
      get createdAt; // Follow Loop (mayo 2026): social attribution. Cuando el actor de
// la notif está en la red del usuario actual, el BE popula estos
// campos y `from_following=true`; el FE renderiza al actor en el
// copy y un avatar pequeño. Si false, mostramos la copy genérica.
  @JsonKey(name: 'from_following')
  bool get fromFollowing;
  @JsonKey(name: 'actor_uuid')
  String? get actorUuid;
  @JsonKey(name: 'actor_name')
  String? get actorName;
  @JsonKey(name: 'actor_photo_url')
  String? get actorPhotoUrl;

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuzzItemDMCopyWith<BuzzItemDM> get copyWith =>
      _$BuzzItemDMCopyWithImpl<BuzzItemDM>(this as BuzzItemDM, _$identity);

  /// Serializes this BuzzItemDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuzzItemDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessPhoto, businessPhoto) ||
                other.businessPhoto == businessPhoto) &&
            (identical(other.menuUuid, menuUuid) ||
                other.menuUuid == menuUuid) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.fromFollowing, fromFollowing) ||
                other.fromFollowing == fromFollowing) &&
            (identical(other.actorUuid, actorUuid) ||
                other.actorUuid == actorUuid) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.actorPhotoUrl, actorPhotoUrl) ||
                other.actorPhotoUrl == actorPhotoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      message,
      subType,
      businessUuid,
      businessName,
      businessPhoto,
      menuUuid,
      entityName,
      createdAt,
      fromFollowing,
      actorUuid,
      actorName,
      actorPhotoUrl);

  @override
  String toString() {
    return 'BuzzItemDM(uuid: $uuid, message: $message, subType: $subType, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, menuUuid: $menuUuid, entityName: $entityName, createdAt: $createdAt, fromFollowing: $fromFollowing, actorUuid: $actorUuid, actorName: $actorName, actorPhotoUrl: $actorPhotoUrl)';
  }
}

/// @nodoc
abstract mixin class $BuzzItemDMCopyWith<$Res> {
  factory $BuzzItemDMCopyWith(
          BuzzItemDM value, $Res Function(BuzzItemDM) _then) =
      _$BuzzItemDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String message,
      @JsonKey(name: 'sub_type') String subType,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'menu_uuid') String? menuUuid,
      @JsonKey(name: 'entity_name') String? entityName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'from_following') bool fromFollowing,
      @JsonKey(name: 'actor_uuid') String? actorUuid,
      @JsonKey(name: 'actor_name') String? actorName,
      @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl});
}

/// @nodoc
class _$BuzzItemDMCopyWithImpl<$Res> implements $BuzzItemDMCopyWith<$Res> {
  _$BuzzItemDMCopyWithImpl(this._self, this._then);

  final BuzzItemDM _self;
  final $Res Function(BuzzItemDM) _then;

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? message = null,
    Object? subType = null,
    Object? businessUuid = freezed,
    Object? businessName = null,
    Object? businessPhoto = freezed,
    Object? menuUuid = freezed,
    Object? entityName = freezed,
    Object? createdAt = freezed,
    Object? fromFollowing = null,
    Object? actorUuid = freezed,
    Object? actorName = freezed,
    Object? actorPhotoUrl = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      subType: null == subType
          ? _self.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as String,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPhoto: freezed == businessPhoto
          ? _self.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      menuUuid: freezed == menuUuid
          ? _self.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _self.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromFollowing: null == fromFollowing
          ? _self.fromFollowing
          : fromFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      actorUuid: freezed == actorUuid
          ? _self.actorUuid
          : actorUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actorName: freezed == actorName
          ? _self.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String?,
      actorPhotoUrl: freezed == actorPhotoUrl
          ? _self.actorPhotoUrl
          : actorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BuzzItemDM].
extension BuzzItemDMPatterns on BuzzItemDM {
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
    TResult Function(_BuzzItemDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuzzItemDM() when $default != null:
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
    TResult Function(_BuzzItemDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzItemDM():
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
    TResult? Function(_BuzzItemDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzItemDM() when $default != null:
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
            String uuid,
            String message,
            @JsonKey(name: 'sub_type') String subType,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_photo') String? businessPhoto,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'entity_name') String? entityName,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'from_following') bool fromFollowing,
            @JsonKey(name: 'actor_uuid') String? actorUuid,
            @JsonKey(name: 'actor_name') String? actorName,
            @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuzzItemDM() when $default != null:
        return $default(
            _that.uuid,
            _that.message,
            _that.subType,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.menuUuid,
            _that.entityName,
            _that.createdAt,
            _that.fromFollowing,
            _that.actorUuid,
            _that.actorName,
            _that.actorPhotoUrl);
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
            String uuid,
            String message,
            @JsonKey(name: 'sub_type') String subType,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_photo') String? businessPhoto,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'entity_name') String? entityName,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'from_following') bool fromFollowing,
            @JsonKey(name: 'actor_uuid') String? actorUuid,
            @JsonKey(name: 'actor_name') String? actorName,
            @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzItemDM():
        return $default(
            _that.uuid,
            _that.message,
            _that.subType,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.menuUuid,
            _that.entityName,
            _that.createdAt,
            _that.fromFollowing,
            _that.actorUuid,
            _that.actorName,
            _that.actorPhotoUrl);
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
            String uuid,
            String message,
            @JsonKey(name: 'sub_type') String subType,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_photo') String? businessPhoto,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'entity_name') String? entityName,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'from_following') bool fromFollowing,
            @JsonKey(name: 'actor_uuid') String? actorUuid,
            @JsonKey(name: 'actor_name') String? actorName,
            @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuzzItemDM() when $default != null:
        return $default(
            _that.uuid,
            _that.message,
            _that.subType,
            _that.businessUuid,
            _that.businessName,
            _that.businessPhoto,
            _that.menuUuid,
            _that.entityName,
            _that.createdAt,
            _that.fromFollowing,
            _that.actorUuid,
            _that.actorName,
            _that.actorPhotoUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BuzzItemDM extends BuzzItemDM {
  const _BuzzItemDM(
      {required this.uuid,
      this.message = '',
      @JsonKey(name: 'sub_type') this.subType = '',
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_photo') this.businessPhoto,
      @JsonKey(name: 'menu_uuid') this.menuUuid,
      @JsonKey(name: 'entity_name') this.entityName,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'from_following') this.fromFollowing = false,
      @JsonKey(name: 'actor_uuid') this.actorUuid,
      @JsonKey(name: 'actor_name') this.actorName,
      @JsonKey(name: 'actor_photo_url') this.actorPhotoUrl})
      : super._();
  factory _BuzzItemDM.fromJson(Map<String, dynamic> json) =>
      _$BuzzItemDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'sub_type')
  final String subType;
  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_photo')
  final String? businessPhoto;
  @override
  @JsonKey(name: 'menu_uuid')
  final String? menuUuid;
  @override
  @JsonKey(name: 'entity_name')
  final String? entityName;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
// Follow Loop (mayo 2026): social attribution. Cuando el actor de
// la notif está en la red del usuario actual, el BE popula estos
// campos y `from_following=true`; el FE renderiza al actor en el
// copy y un avatar pequeño. Si false, mostramos la copy genérica.
  @override
  @JsonKey(name: 'from_following')
  final bool fromFollowing;
  @override
  @JsonKey(name: 'actor_uuid')
  final String? actorUuid;
  @override
  @JsonKey(name: 'actor_name')
  final String? actorName;
  @override
  @JsonKey(name: 'actor_photo_url')
  final String? actorPhotoUrl;

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuzzItemDMCopyWith<_BuzzItemDM> get copyWith =>
      __$BuzzItemDMCopyWithImpl<_BuzzItemDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuzzItemDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuzzItemDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessPhoto, businessPhoto) ||
                other.businessPhoto == businessPhoto) &&
            (identical(other.menuUuid, menuUuid) ||
                other.menuUuid == menuUuid) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.fromFollowing, fromFollowing) ||
                other.fromFollowing == fromFollowing) &&
            (identical(other.actorUuid, actorUuid) ||
                other.actorUuid == actorUuid) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.actorPhotoUrl, actorPhotoUrl) ||
                other.actorPhotoUrl == actorPhotoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      message,
      subType,
      businessUuid,
      businessName,
      businessPhoto,
      menuUuid,
      entityName,
      createdAt,
      fromFollowing,
      actorUuid,
      actorName,
      actorPhotoUrl);

  @override
  String toString() {
    return 'BuzzItemDM(uuid: $uuid, message: $message, subType: $subType, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, menuUuid: $menuUuid, entityName: $entityName, createdAt: $createdAt, fromFollowing: $fromFollowing, actorUuid: $actorUuid, actorName: $actorName, actorPhotoUrl: $actorPhotoUrl)';
  }
}

/// @nodoc
abstract mixin class _$BuzzItemDMCopyWith<$Res>
    implements $BuzzItemDMCopyWith<$Res> {
  factory _$BuzzItemDMCopyWith(
          _BuzzItemDM value, $Res Function(_BuzzItemDM) _then) =
      __$BuzzItemDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String message,
      @JsonKey(name: 'sub_type') String subType,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'menu_uuid') String? menuUuid,
      @JsonKey(name: 'entity_name') String? entityName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'from_following') bool fromFollowing,
      @JsonKey(name: 'actor_uuid') String? actorUuid,
      @JsonKey(name: 'actor_name') String? actorName,
      @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl});
}

/// @nodoc
class __$BuzzItemDMCopyWithImpl<$Res> implements _$BuzzItemDMCopyWith<$Res> {
  __$BuzzItemDMCopyWithImpl(this._self, this._then);

  final _BuzzItemDM _self;
  final $Res Function(_BuzzItemDM) _then;

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? message = null,
    Object? subType = null,
    Object? businessUuid = freezed,
    Object? businessName = null,
    Object? businessPhoto = freezed,
    Object? menuUuid = freezed,
    Object? entityName = freezed,
    Object? createdAt = freezed,
    Object? fromFollowing = null,
    Object? actorUuid = freezed,
    Object? actorName = freezed,
    Object? actorPhotoUrl = freezed,
  }) {
    return _then(_BuzzItemDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      subType: null == subType
          ? _self.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as String,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPhoto: freezed == businessPhoto
          ? _self.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      menuUuid: freezed == menuUuid
          ? _self.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _self.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromFollowing: null == fromFollowing
          ? _self.fromFollowing
          : fromFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      actorUuid: freezed == actorUuid
          ? _self.actorUuid
          : actorUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actorName: freezed == actorName
          ? _self.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String?,
      actorPhotoUrl: freezed == actorPhotoUrl
          ? _self.actorPhotoUrl
          : actorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
