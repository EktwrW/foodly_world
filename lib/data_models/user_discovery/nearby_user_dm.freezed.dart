// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_user_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyUsersResponseDM {
  List<NearbyUserDM> get data;
  NearbyUsersMetaDM? get meta;

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyUsersResponseDMCopyWith<NearbyUsersResponseDM> get copyWith =>
      _$NearbyUsersResponseDMCopyWithImpl<NearbyUsersResponseDM>(
          this as NearbyUsersResponseDM, _$identity);

  /// Serializes this NearbyUsersResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyUsersResponseDM &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), meta);

  @override
  String toString() {
    return 'NearbyUsersResponseDM(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $NearbyUsersResponseDMCopyWith<$Res> {
  factory $NearbyUsersResponseDMCopyWith(NearbyUsersResponseDM value,
          $Res Function(NearbyUsersResponseDM) _then) =
      _$NearbyUsersResponseDMCopyWithImpl;
  @useResult
  $Res call({List<NearbyUserDM> data, NearbyUsersMetaDM? meta});

  $NearbyUsersMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$NearbyUsersResponseDMCopyWithImpl<$Res>
    implements $NearbyUsersResponseDMCopyWith<$Res> {
  _$NearbyUsersResponseDMCopyWithImpl(this._self, this._then);

  final NearbyUsersResponseDM _self;
  final $Res Function(NearbyUsersResponseDM) _then;

  /// Create a copy of NearbyUsersResponseDM
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
              as List<NearbyUserDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
    ));
  }

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $NearbyUsersMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NearbyUsersResponseDM].
extension NearbyUsersResponseDMPatterns on NearbyUsersResponseDM {
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
    TResult Function(_NearbyUsersResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersResponseDM() when $default != null:
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
    TResult Function(_NearbyUsersResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersResponseDM():
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
    TResult? Function(_NearbyUsersResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersResponseDM() when $default != null:
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
    TResult Function(List<NearbyUserDM> data, NearbyUsersMetaDM? meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersResponseDM() when $default != null:
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
    TResult Function(List<NearbyUserDM> data, NearbyUsersMetaDM? meta) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersResponseDM():
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
    TResult? Function(List<NearbyUserDM> data, NearbyUsersMetaDM? meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersResponseDM() when $default != null:
        return $default(_that.data, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyUsersResponseDM implements NearbyUsersResponseDM {
  const _NearbyUsersResponseDM(
      {final List<NearbyUserDM> data = const [], this.meta})
      : _data = data;
  factory _NearbyUsersResponseDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyUsersResponseDMFromJson(json);

  final List<NearbyUserDM> _data;
  @override
  @JsonKey()
  List<NearbyUserDM> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final NearbyUsersMetaDM? meta;

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyUsersResponseDMCopyWith<_NearbyUsersResponseDM> get copyWith =>
      __$NearbyUsersResponseDMCopyWithImpl<_NearbyUsersResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyUsersResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyUsersResponseDM &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @override
  String toString() {
    return 'NearbyUsersResponseDM(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$NearbyUsersResponseDMCopyWith<$Res>
    implements $NearbyUsersResponseDMCopyWith<$Res> {
  factory _$NearbyUsersResponseDMCopyWith(_NearbyUsersResponseDM value,
          $Res Function(_NearbyUsersResponseDM) _then) =
      __$NearbyUsersResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<NearbyUserDM> data, NearbyUsersMetaDM? meta});

  @override
  $NearbyUsersMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$NearbyUsersResponseDMCopyWithImpl<$Res>
    implements _$NearbyUsersResponseDMCopyWith<$Res> {
  __$NearbyUsersResponseDMCopyWithImpl(this._self, this._then);

  final _NearbyUsersResponseDM _self;
  final $Res Function(_NearbyUsersResponseDM) _then;

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_NearbyUsersResponseDM(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
    ));
  }

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $NearbyUsersMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$NearbyUsersMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get total;

  /// Create a copy of NearbyUsersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<NearbyUsersMetaDM> get copyWith =>
      _$NearbyUsersMetaDMCopyWithImpl<NearbyUsersMetaDM>(
          this as NearbyUsersMetaDM, _$identity);

  /// Serializes this NearbyUsersMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyUsersMetaDM &&
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
    return 'NearbyUsersMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class $NearbyUsersMetaDMCopyWith<$Res> {
  factory $NearbyUsersMetaDMCopyWith(
          NearbyUsersMetaDM value, $Res Function(NearbyUsersMetaDM) _then) =
      _$NearbyUsersMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$NearbyUsersMetaDMCopyWithImpl<$Res>
    implements $NearbyUsersMetaDMCopyWith<$Res> {
  _$NearbyUsersMetaDMCopyWithImpl(this._self, this._then);

  final NearbyUsersMetaDM _self;
  final $Res Function(NearbyUsersMetaDM) _then;

  /// Create a copy of NearbyUsersMetaDM
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

/// Adds pattern-matching-related methods to [NearbyUsersMetaDM].
extension NearbyUsersMetaDMPatterns on NearbyUsersMetaDM {
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
    TResult Function(_NearbyUsersMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersMetaDM() when $default != null:
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
    TResult Function(_NearbyUsersMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersMetaDM():
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
    TResult? Function(_NearbyUsersMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUsersMetaDM() when $default != null:
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
      case _NearbyUsersMetaDM() when $default != null:
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
      case _NearbyUsersMetaDM():
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
      case _NearbyUsersMetaDM() when $default != null:
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyUsersMetaDM implements NearbyUsersMetaDM {
  const _NearbyUsersMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});
  factory _NearbyUsersMetaDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyUsersMetaDMFromJson(json);

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

  /// Create a copy of NearbyUsersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyUsersMetaDMCopyWith<_NearbyUsersMetaDM> get copyWith =>
      __$NearbyUsersMetaDMCopyWithImpl<_NearbyUsersMetaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyUsersMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyUsersMetaDM &&
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
    return 'NearbyUsersMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$NearbyUsersMetaDMCopyWith<$Res>
    implements $NearbyUsersMetaDMCopyWith<$Res> {
  factory _$NearbyUsersMetaDMCopyWith(
          _NearbyUsersMetaDM value, $Res Function(_NearbyUsersMetaDM) _then) =
      __$NearbyUsersMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$NearbyUsersMetaDMCopyWithImpl<$Res>
    implements _$NearbyUsersMetaDMCopyWith<$Res> {
  __$NearbyUsersMetaDMCopyWithImpl(this._self, this._then);

  final _NearbyUsersMetaDM _self;
  final $Res Function(_NearbyUsersMetaDM) _then;

  /// Create a copy of NearbyUsersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_NearbyUsersMetaDM(
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
mixin _$NearbyUserDM {
  String get uuid;
  String get name;
  String? get username;
  String? get photo;
  String? get bio;
  @JsonKey(name: 'posts_count')
  int get postsCount;
  @JsonKey(name: 'likes_received')
  int get likesReceived;
  @JsonKey(name: 'reviews_count')
  int get reviewsCount;
  @JsonKey(name: 'activity_score')
  int get activityScore;
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @JsonKey(name: 'is_following')
  bool get isFollowing;
  double get distance;

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyUserDMCopyWith<NearbyUserDM> get copyWith =>
      _$NearbyUserDMCopyWithImpl<NearbyUserDM>(
          this as NearbyUserDM, _$identity);

  /// Serializes this NearbyUserDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyUserDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.postsCount, postsCount) ||
                other.postsCount == postsCount) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.activityScore, activityScore) ||
                other.activityScore == activityScore) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      username,
      photo,
      bio,
      postsCount,
      likesReceived,
      reviewsCount,
      activityScore,
      followersCount,
      isFollowing,
      distance);

  @override
  String toString() {
    return 'NearbyUserDM(uuid: $uuid, name: $name, username: $username, photo: $photo, bio: $bio, postsCount: $postsCount, likesReceived: $likesReceived, reviewsCount: $reviewsCount, activityScore: $activityScore, followersCount: $followersCount, isFollowing: $isFollowing, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class $NearbyUserDMCopyWith<$Res> {
  factory $NearbyUserDMCopyWith(
          NearbyUserDM value, $Res Function(NearbyUserDM) _then) =
      _$NearbyUserDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? username,
      String? photo,
      String? bio,
      @JsonKey(name: 'posts_count') int postsCount,
      @JsonKey(name: 'likes_received') int likesReceived,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'activity_score') int activityScore,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'is_following') bool isFollowing,
      double distance});
}

/// @nodoc
class _$NearbyUserDMCopyWithImpl<$Res> implements $NearbyUserDMCopyWith<$Res> {
  _$NearbyUserDMCopyWithImpl(this._self, this._then);

  final NearbyUserDM _self;
  final $Res Function(NearbyUserDM) _then;

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? username = freezed,
    Object? photo = freezed,
    Object? bio = freezed,
    Object? postsCount = null,
    Object? likesReceived = null,
    Object? reviewsCount = null,
    Object? activityScore = null,
    Object? followersCount = null,
    Object? isFollowing = null,
    Object? distance = null,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      postsCount: null == postsCount
          ? _self.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _self.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _self.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      activityScore: null == activityScore
          ? _self.activityScore
          : activityScore // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _self.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [NearbyUserDM].
extension NearbyUserDMPatterns on NearbyUserDM {
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
    TResult Function(_NearbyUserDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyUserDM() when $default != null:
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
    TResult Function(_NearbyUserDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUserDM():
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
    TResult? Function(_NearbyUserDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUserDM() when $default != null:
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
            String name,
            String? username,
            String? photo,
            String? bio,
            @JsonKey(name: 'posts_count') int postsCount,
            @JsonKey(name: 'likes_received') int likesReceived,
            @JsonKey(name: 'reviews_count') int reviewsCount,
            @JsonKey(name: 'activity_score') int activityScore,
            @JsonKey(name: 'followers_count') int followersCount,
            @JsonKey(name: 'is_following') bool isFollowing,
            double distance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyUserDM() when $default != null:
        return $default(
            _that.uuid,
            _that.name,
            _that.username,
            _that.photo,
            _that.bio,
            _that.postsCount,
            _that.likesReceived,
            _that.reviewsCount,
            _that.activityScore,
            _that.followersCount,
            _that.isFollowing,
            _that.distance);
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
            String name,
            String? username,
            String? photo,
            String? bio,
            @JsonKey(name: 'posts_count') int postsCount,
            @JsonKey(name: 'likes_received') int likesReceived,
            @JsonKey(name: 'reviews_count') int reviewsCount,
            @JsonKey(name: 'activity_score') int activityScore,
            @JsonKey(name: 'followers_count') int followersCount,
            @JsonKey(name: 'is_following') bool isFollowing,
            double distance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUserDM():
        return $default(
            _that.uuid,
            _that.name,
            _that.username,
            _that.photo,
            _that.bio,
            _that.postsCount,
            _that.likesReceived,
            _that.reviewsCount,
            _that.activityScore,
            _that.followersCount,
            _that.isFollowing,
            _that.distance);
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
            String name,
            String? username,
            String? photo,
            String? bio,
            @JsonKey(name: 'posts_count') int postsCount,
            @JsonKey(name: 'likes_received') int likesReceived,
            @JsonKey(name: 'reviews_count') int reviewsCount,
            @JsonKey(name: 'activity_score') int activityScore,
            @JsonKey(name: 'followers_count') int followersCount,
            @JsonKey(name: 'is_following') bool isFollowing,
            double distance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyUserDM() when $default != null:
        return $default(
            _that.uuid,
            _that.name,
            _that.username,
            _that.photo,
            _that.bio,
            _that.postsCount,
            _that.likesReceived,
            _that.reviewsCount,
            _that.activityScore,
            _that.followersCount,
            _that.isFollowing,
            _that.distance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyUserDM extends NearbyUserDM {
  const _NearbyUserDM(
      {required this.uuid,
      this.name = '',
      this.username,
      this.photo,
      this.bio,
      @JsonKey(name: 'posts_count') this.postsCount = 0,
      @JsonKey(name: 'likes_received') this.likesReceived = 0,
      @JsonKey(name: 'reviews_count') this.reviewsCount = 0,
      @JsonKey(name: 'activity_score') this.activityScore = 0,
      @JsonKey(name: 'followers_count') this.followersCount = 0,
      @JsonKey(name: 'is_following') this.isFollowing = false,
      this.distance = 0.0})
      : super._();
  factory _NearbyUserDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyUserDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey()
  final String name;
  @override
  final String? username;
  @override
  final String? photo;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'posts_count')
  final int postsCount;
  @override
  @JsonKey(name: 'likes_received')
  final int likesReceived;
  @override
  @JsonKey(name: 'reviews_count')
  final int reviewsCount;
  @override
  @JsonKey(name: 'activity_score')
  final int activityScore;
  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'is_following')
  final bool isFollowing;
  @override
  @JsonKey()
  final double distance;

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyUserDMCopyWith<_NearbyUserDM> get copyWith =>
      __$NearbyUserDMCopyWithImpl<_NearbyUserDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyUserDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyUserDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.postsCount, postsCount) ||
                other.postsCount == postsCount) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.activityScore, activityScore) ||
                other.activityScore == activityScore) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      username,
      photo,
      bio,
      postsCount,
      likesReceived,
      reviewsCount,
      activityScore,
      followersCount,
      isFollowing,
      distance);

  @override
  String toString() {
    return 'NearbyUserDM(uuid: $uuid, name: $name, username: $username, photo: $photo, bio: $bio, postsCount: $postsCount, likesReceived: $likesReceived, reviewsCount: $reviewsCount, activityScore: $activityScore, followersCount: $followersCount, isFollowing: $isFollowing, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class _$NearbyUserDMCopyWith<$Res>
    implements $NearbyUserDMCopyWith<$Res> {
  factory _$NearbyUserDMCopyWith(
          _NearbyUserDM value, $Res Function(_NearbyUserDM) _then) =
      __$NearbyUserDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? username,
      String? photo,
      String? bio,
      @JsonKey(name: 'posts_count') int postsCount,
      @JsonKey(name: 'likes_received') int likesReceived,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'activity_score') int activityScore,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'is_following') bool isFollowing,
      double distance});
}

/// @nodoc
class __$NearbyUserDMCopyWithImpl<$Res>
    implements _$NearbyUserDMCopyWith<$Res> {
  __$NearbyUserDMCopyWithImpl(this._self, this._then);

  final _NearbyUserDM _self;
  final $Res Function(_NearbyUserDM) _then;

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? username = freezed,
    Object? photo = freezed,
    Object? bio = freezed,
    Object? postsCount = null,
    Object? likesReceived = null,
    Object? reviewsCount = null,
    Object? activityScore = null,
    Object? followersCount = null,
    Object? isFollowing = null,
    Object? distance = null,
  }) {
    return _then(_NearbyUserDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      postsCount: null == postsCount
          ? _self.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _self.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _self.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      activityScore: null == activityScore
          ? _self.activityScore
          : activityScore // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _self.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$UserProfileDM {
  String get uuid;
  String get name;
  String? get username;
  String? get photo;
  String? get bio;
  UserProfileStatsDM? get stats;
  @JsonKey(name: 'is_following')
  bool get isFollowing;
  @JsonKey(name: 'recent_posts')
  List<UserProfilePostDM> get recentPosts;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileDMCopyWith<UserProfileDM> get copyWith =>
      _$UserProfileDMCopyWithImpl<UserProfileDM>(
          this as UserProfileDM, _$identity);

  /// Serializes this UserProfileDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            const DeepCollectionEquality()
                .equals(other.recentPosts, recentPosts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      username,
      photo,
      bio,
      stats,
      isFollowing,
      const DeepCollectionEquality().hash(recentPosts),
      createdAt);

  @override
  String toString() {
    return 'UserProfileDM(uuid: $uuid, name: $name, username: $username, photo: $photo, bio: $bio, stats: $stats, isFollowing: $isFollowing, recentPosts: $recentPosts, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserProfileDMCopyWith<$Res> {
  factory $UserProfileDMCopyWith(
          UserProfileDM value, $Res Function(UserProfileDM) _then) =
      _$UserProfileDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? username,
      String? photo,
      String? bio,
      UserProfileStatsDM? stats,
      @JsonKey(name: 'is_following') bool isFollowing,
      @JsonKey(name: 'recent_posts') List<UserProfilePostDM> recentPosts,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $UserProfileStatsDMCopyWith<$Res>? get stats;
}

/// @nodoc
class _$UserProfileDMCopyWithImpl<$Res>
    implements $UserProfileDMCopyWith<$Res> {
  _$UserProfileDMCopyWithImpl(this._self, this._then);

  final UserProfileDM _self;
  final $Res Function(UserProfileDM) _then;

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? username = freezed,
    Object? photo = freezed,
    Object? bio = freezed,
    Object? stats = freezed,
    Object? isFollowing = null,
    Object? recentPosts = null,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: freezed == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStatsDM?,
      isFollowing: null == isFollowing
          ? _self.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      recentPosts: null == recentPosts
          ? _self.recentPosts
          : recentPosts // ignore: cast_nullable_to_non_nullable
              as List<UserProfilePostDM>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileStatsDMCopyWith<$Res>? get stats {
    if (_self.stats == null) {
      return null;
    }

    return $UserProfileStatsDMCopyWith<$Res>(_self.stats!, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserProfileDM].
extension UserProfileDMPatterns on UserProfileDM {
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
    TResult Function(_UserProfileDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfileDM() when $default != null:
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
    TResult Function(_UserProfileDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileDM():
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
    TResult? Function(_UserProfileDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileDM() when $default != null:
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
            String name,
            String? username,
            String? photo,
            String? bio,
            UserProfileStatsDM? stats,
            @JsonKey(name: 'is_following') bool isFollowing,
            @JsonKey(name: 'recent_posts') List<UserProfilePostDM> recentPosts,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfileDM() when $default != null:
        return $default(
            _that.uuid,
            _that.name,
            _that.username,
            _that.photo,
            _that.bio,
            _that.stats,
            _that.isFollowing,
            _that.recentPosts,
            _that.createdAt);
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
            String name,
            String? username,
            String? photo,
            String? bio,
            UserProfileStatsDM? stats,
            @JsonKey(name: 'is_following') bool isFollowing,
            @JsonKey(name: 'recent_posts') List<UserProfilePostDM> recentPosts,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileDM():
        return $default(
            _that.uuid,
            _that.name,
            _that.username,
            _that.photo,
            _that.bio,
            _that.stats,
            _that.isFollowing,
            _that.recentPosts,
            _that.createdAt);
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
            String name,
            String? username,
            String? photo,
            String? bio,
            UserProfileStatsDM? stats,
            @JsonKey(name: 'is_following') bool isFollowing,
            @JsonKey(name: 'recent_posts') List<UserProfilePostDM> recentPosts,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileDM() when $default != null:
        return $default(
            _that.uuid,
            _that.name,
            _that.username,
            _that.photo,
            _that.bio,
            _that.stats,
            _that.isFollowing,
            _that.recentPosts,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfileDM implements UserProfileDM {
  const _UserProfileDM(
      {required this.uuid,
      this.name = '',
      this.username,
      this.photo,
      this.bio,
      this.stats,
      @JsonKey(name: 'is_following') this.isFollowing = false,
      @JsonKey(name: 'recent_posts')
      final List<UserProfilePostDM> recentPosts = const [],
      @JsonKey(name: 'created_at') this.createdAt})
      : _recentPosts = recentPosts;
  factory _UserProfileDM.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey()
  final String name;
  @override
  final String? username;
  @override
  final String? photo;
  @override
  final String? bio;
  @override
  final UserProfileStatsDM? stats;
  @override
  @JsonKey(name: 'is_following')
  final bool isFollowing;
  final List<UserProfilePostDM> _recentPosts;
  @override
  @JsonKey(name: 'recent_posts')
  List<UserProfilePostDM> get recentPosts {
    if (_recentPosts is EqualUnmodifiableListView) return _recentPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentPosts);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileDMCopyWith<_UserProfileDM> get copyWith =>
      __$UserProfileDMCopyWithImpl<_UserProfileDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            const DeepCollectionEquality()
                .equals(other._recentPosts, _recentPosts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      username,
      photo,
      bio,
      stats,
      isFollowing,
      const DeepCollectionEquality().hash(_recentPosts),
      createdAt);

  @override
  String toString() {
    return 'UserProfileDM(uuid: $uuid, name: $name, username: $username, photo: $photo, bio: $bio, stats: $stats, isFollowing: $isFollowing, recentPosts: $recentPosts, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileDMCopyWith<$Res>
    implements $UserProfileDMCopyWith<$Res> {
  factory _$UserProfileDMCopyWith(
          _UserProfileDM value, $Res Function(_UserProfileDM) _then) =
      __$UserProfileDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? username,
      String? photo,
      String? bio,
      UserProfileStatsDM? stats,
      @JsonKey(name: 'is_following') bool isFollowing,
      @JsonKey(name: 'recent_posts') List<UserProfilePostDM> recentPosts,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $UserProfileStatsDMCopyWith<$Res>? get stats;
}

/// @nodoc
class __$UserProfileDMCopyWithImpl<$Res>
    implements _$UserProfileDMCopyWith<$Res> {
  __$UserProfileDMCopyWithImpl(this._self, this._then);

  final _UserProfileDM _self;
  final $Res Function(_UserProfileDM) _then;

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? username = freezed,
    Object? photo = freezed,
    Object? bio = freezed,
    Object? stats = freezed,
    Object? isFollowing = null,
    Object? recentPosts = null,
    Object? createdAt = freezed,
  }) {
    return _then(_UserProfileDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: freezed == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStatsDM?,
      isFollowing: null == isFollowing
          ? _self.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      recentPosts: null == recentPosts
          ? _self._recentPosts
          : recentPosts // ignore: cast_nullable_to_non_nullable
              as List<UserProfilePostDM>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileStatsDMCopyWith<$Res>? get stats {
    if (_self.stats == null) {
      return null;
    }

    return $UserProfileStatsDMCopyWith<$Res>(_self.stats!, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// @nodoc
mixin _$UserProfileStatsDM {
  @JsonKey(name: 'posts_count')
  int get postsCount;
  @JsonKey(name: 'likes_received')
  int get likesReceived;
  @JsonKey(name: 'reviews_count')
  int get reviewsCount;
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @JsonKey(name: 'following_count')
  int get followingCount;

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileStatsDMCopyWith<UserProfileStatsDM> get copyWith =>
      _$UserProfileStatsDMCopyWithImpl<UserProfileStatsDM>(
          this as UserProfileStatsDM, _$identity);

  /// Serializes this UserProfileStatsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileStatsDM &&
            (identical(other.postsCount, postsCount) ||
                other.postsCount == postsCount) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postsCount, likesReceived,
      reviewsCount, followersCount, followingCount);

  @override
  String toString() {
    return 'UserProfileStatsDM(postsCount: $postsCount, likesReceived: $likesReceived, reviewsCount: $reviewsCount, followersCount: $followersCount, followingCount: $followingCount)';
  }
}

/// @nodoc
abstract mixin class $UserProfileStatsDMCopyWith<$Res> {
  factory $UserProfileStatsDMCopyWith(
          UserProfileStatsDM value, $Res Function(UserProfileStatsDM) _then) =
      _$UserProfileStatsDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'posts_count') int postsCount,
      @JsonKey(name: 'likes_received') int likesReceived,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount});
}

/// @nodoc
class _$UserProfileStatsDMCopyWithImpl<$Res>
    implements $UserProfileStatsDMCopyWith<$Res> {
  _$UserProfileStatsDMCopyWithImpl(this._self, this._then);

  final UserProfileStatsDM _self;
  final $Res Function(UserProfileStatsDM) _then;

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsCount = null,
    Object? likesReceived = null,
    Object? reviewsCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
  }) {
    return _then(_self.copyWith(
      postsCount: null == postsCount
          ? _self.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _self.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _self.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _self.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserProfileStatsDM].
extension UserProfileStatsDMPatterns on UserProfileStatsDM {
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
    TResult Function(_UserProfileStatsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfileStatsDM() when $default != null:
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
    TResult Function(_UserProfileStatsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileStatsDM():
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
    TResult? Function(_UserProfileStatsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileStatsDM() when $default != null:
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
            @JsonKey(name: 'posts_count') int postsCount,
            @JsonKey(name: 'likes_received') int likesReceived,
            @JsonKey(name: 'reviews_count') int reviewsCount,
            @JsonKey(name: 'followers_count') int followersCount,
            @JsonKey(name: 'following_count') int followingCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfileStatsDM() when $default != null:
        return $default(_that.postsCount, _that.likesReceived,
            _that.reviewsCount, _that.followersCount, _that.followingCount);
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
            @JsonKey(name: 'posts_count') int postsCount,
            @JsonKey(name: 'likes_received') int likesReceived,
            @JsonKey(name: 'reviews_count') int reviewsCount,
            @JsonKey(name: 'followers_count') int followersCount,
            @JsonKey(name: 'following_count') int followingCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileStatsDM():
        return $default(_that.postsCount, _that.likesReceived,
            _that.reviewsCount, _that.followersCount, _that.followingCount);
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
            @JsonKey(name: 'posts_count') int postsCount,
            @JsonKey(name: 'likes_received') int likesReceived,
            @JsonKey(name: 'reviews_count') int reviewsCount,
            @JsonKey(name: 'followers_count') int followersCount,
            @JsonKey(name: 'following_count') int followingCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfileStatsDM() when $default != null:
        return $default(_that.postsCount, _that.likesReceived,
            _that.reviewsCount, _that.followersCount, _that.followingCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfileStatsDM implements UserProfileStatsDM {
  const _UserProfileStatsDM(
      {@JsonKey(name: 'posts_count') this.postsCount = 0,
      @JsonKey(name: 'likes_received') this.likesReceived = 0,
      @JsonKey(name: 'reviews_count') this.reviewsCount = 0,
      @JsonKey(name: 'followers_count') this.followersCount = 0,
      @JsonKey(name: 'following_count') this.followingCount = 0});
  factory _UserProfileStatsDM.fromJson(Map<String, dynamic> json) =>
      _$UserProfileStatsDMFromJson(json);

  @override
  @JsonKey(name: 'posts_count')
  final int postsCount;
  @override
  @JsonKey(name: 'likes_received')
  final int likesReceived;
  @override
  @JsonKey(name: 'reviews_count')
  final int reviewsCount;
  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'following_count')
  final int followingCount;

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileStatsDMCopyWith<_UserProfileStatsDM> get copyWith =>
      __$UserProfileStatsDMCopyWithImpl<_UserProfileStatsDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileStatsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileStatsDM &&
            (identical(other.postsCount, postsCount) ||
                other.postsCount == postsCount) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postsCount, likesReceived,
      reviewsCount, followersCount, followingCount);

  @override
  String toString() {
    return 'UserProfileStatsDM(postsCount: $postsCount, likesReceived: $likesReceived, reviewsCount: $reviewsCount, followersCount: $followersCount, followingCount: $followingCount)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileStatsDMCopyWith<$Res>
    implements $UserProfileStatsDMCopyWith<$Res> {
  factory _$UserProfileStatsDMCopyWith(
          _UserProfileStatsDM value, $Res Function(_UserProfileStatsDM) _then) =
      __$UserProfileStatsDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'posts_count') int postsCount,
      @JsonKey(name: 'likes_received') int likesReceived,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount});
}

/// @nodoc
class __$UserProfileStatsDMCopyWithImpl<$Res>
    implements _$UserProfileStatsDMCopyWith<$Res> {
  __$UserProfileStatsDMCopyWithImpl(this._self, this._then);

  final _UserProfileStatsDM _self;
  final $Res Function(_UserProfileStatsDM) _then;

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postsCount = null,
    Object? likesReceived = null,
    Object? reviewsCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
  }) {
    return _then(_UserProfileStatsDM(
      postsCount: null == postsCount
          ? _self.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _self.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _self.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _self.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$UserProfilePostDM {
  String get uuid;
  String get content;
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @JsonKey(name: 'likes_count')
  int get likesCount;
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfilePostDMCopyWith<UserProfilePostDM> get copyWith =>
      _$UserProfilePostDMCopyWithImpl<UserProfilePostDM>(
          this as UserProfilePostDM, _$identity);

  /// Serializes this UserProfilePostDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfilePostDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, content, photoUrl, likesCount, isLiked, createdAt);

  @override
  String toString() {
    return 'UserProfilePostDM(uuid: $uuid, content: $content, photoUrl: $photoUrl, likesCount: $likesCount, isLiked: $isLiked, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserProfilePostDMCopyWith<$Res> {
  factory $UserProfilePostDMCopyWith(
          UserProfilePostDM value, $Res Function(UserProfilePostDM) _then) =
      _$UserProfilePostDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String content,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$UserProfilePostDMCopyWithImpl<$Res>
    implements $UserProfilePostDMCopyWith<$Res> {
  _$UserProfilePostDMCopyWithImpl(this._self, this._then);

  final UserProfilePostDM _self;
  final $Res Function(UserProfilePostDM) _then;

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? content = null,
    Object? photoUrl = freezed,
    Object? likesCount = null,
    Object? isLiked = null,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserProfilePostDM].
extension UserProfilePostDMPatterns on UserProfilePostDM {
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
    TResult Function(_UserProfilePostDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfilePostDM() when $default != null:
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
    TResult Function(_UserProfilePostDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfilePostDM():
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
    TResult? Function(_UserProfilePostDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfilePostDM() when $default != null:
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
            String content,
            @JsonKey(name: 'photo_url') String? photoUrl,
            @JsonKey(name: 'likes_count') int likesCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserProfilePostDM() when $default != null:
        return $default(_that.uuid, _that.content, _that.photoUrl,
            _that.likesCount, _that.isLiked, _that.createdAt);
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
            String content,
            @JsonKey(name: 'photo_url') String? photoUrl,
            @JsonKey(name: 'likes_count') int likesCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfilePostDM():
        return $default(_that.uuid, _that.content, _that.photoUrl,
            _that.likesCount, _that.isLiked, _that.createdAt);
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
            String content,
            @JsonKey(name: 'photo_url') String? photoUrl,
            @JsonKey(name: 'likes_count') int likesCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserProfilePostDM() when $default != null:
        return $default(_that.uuid, _that.content, _that.photoUrl,
            _that.likesCount, _that.isLiked, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfilePostDM implements UserProfilePostDM {
  const _UserProfilePostDM(
      {required this.uuid,
      required this.content,
      @JsonKey(name: 'photo_url') this.photoUrl,
      @JsonKey(name: 'likes_count') this.likesCount = 0,
      @JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'created_at') this.createdAt});
  factory _UserProfilePostDM.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePostDMFromJson(json);

  @override
  final String uuid;
  @override
  final String content;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfilePostDMCopyWith<_UserProfilePostDM> get copyWith =>
      __$UserProfilePostDMCopyWithImpl<_UserProfilePostDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfilePostDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfilePostDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, content, photoUrl, likesCount, isLiked, createdAt);

  @override
  String toString() {
    return 'UserProfilePostDM(uuid: $uuid, content: $content, photoUrl: $photoUrl, likesCount: $likesCount, isLiked: $isLiked, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserProfilePostDMCopyWith<$Res>
    implements $UserProfilePostDMCopyWith<$Res> {
  factory _$UserProfilePostDMCopyWith(
          _UserProfilePostDM value, $Res Function(_UserProfilePostDM) _then) =
      __$UserProfilePostDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String content,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$UserProfilePostDMCopyWithImpl<$Res>
    implements _$UserProfilePostDMCopyWith<$Res> {
  __$UserProfilePostDMCopyWithImpl(this._self, this._then);

  final _UserProfilePostDM _self;
  final $Res Function(_UserProfilePostDM) _then;

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? content = null,
    Object? photoUrl = freezed,
    Object? likesCount = null,
    Object? isLiked = null,
    Object? createdAt = freezed,
  }) {
    return _then(_UserProfilePostDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
