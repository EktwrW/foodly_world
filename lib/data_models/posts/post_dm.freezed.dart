// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsResponseDM {
  List<PostDM> get posts;
  PostsMetaDM? get meta;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostsResponseDMCopyWith<PostsResponseDM> get copyWith =>
      _$PostsResponseDMCopyWithImpl<PostsResponseDM>(
          this as PostsResponseDM, _$identity);

  /// Serializes this PostsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostsResponseDM &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(posts), meta);

  @override
  String toString() {
    return 'PostsResponseDM(posts: $posts, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $PostsResponseDMCopyWith<$Res> {
  factory $PostsResponseDMCopyWith(
          PostsResponseDM value, $Res Function(PostsResponseDM) _then) =
      _$PostsResponseDMCopyWithImpl;
  @useResult
  $Res call({List<PostDM> posts, PostsMetaDM? meta});

  $PostsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$PostsResponseDMCopyWithImpl<$Res>
    implements $PostsResponseDMCopyWith<$Res> {
  _$PostsResponseDMCopyWithImpl(this._self, this._then);

  final PostsResponseDM _self;
  final $Res Function(PostsResponseDM) _then;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      posts: null == posts
          ? _self.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
    ));
  }

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $PostsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PostsResponseDM].
extension PostsResponseDMPatterns on PostsResponseDM {
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
    TResult Function(_PostsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostsResponseDM() when $default != null:
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
    TResult Function(_PostsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsResponseDM():
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
    TResult? Function(_PostsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsResponseDM() when $default != null:
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
    TResult Function(List<PostDM> posts, PostsMetaDM? meta)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostsResponseDM() when $default != null:
        return $default(_that.posts, _that.meta);
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
    TResult Function(List<PostDM> posts, PostsMetaDM? meta) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsResponseDM():
        return $default(_that.posts, _that.meta);
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
    TResult? Function(List<PostDM> posts, PostsMetaDM? meta)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsResponseDM() when $default != null:
        return $default(_that.posts, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostsResponseDM implements PostsResponseDM {
  const _PostsResponseDM({final List<PostDM> posts = const [], this.meta})
      : _posts = posts;
  factory _PostsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PostsResponseDMFromJson(json);

  final List<PostDM> _posts;
  @override
  @JsonKey()
  List<PostDM> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final PostsMetaDM? meta;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostsResponseDMCopyWith<_PostsResponseDM> get copyWith =>
      __$PostsResponseDMCopyWithImpl<_PostsResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostsResponseDM &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), meta);

  @override
  String toString() {
    return 'PostsResponseDM(posts: $posts, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$PostsResponseDMCopyWith<$Res>
    implements $PostsResponseDMCopyWith<$Res> {
  factory _$PostsResponseDMCopyWith(
          _PostsResponseDM value, $Res Function(_PostsResponseDM) _then) =
      __$PostsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<PostDM> posts, PostsMetaDM? meta});

  @override
  $PostsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$PostsResponseDMCopyWithImpl<$Res>
    implements _$PostsResponseDMCopyWith<$Res> {
  __$PostsResponseDMCopyWithImpl(this._self, this._then);

  final _PostsResponseDM _self;
  final $Res Function(_PostsResponseDM) _then;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? posts = null,
    Object? meta = freezed,
  }) {
    return _then(_PostsResponseDM(
      posts: null == posts
          ? _self._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
    ));
  }

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $PostsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$PostsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get total;

  /// Create a copy of PostsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<PostsMetaDM> get copyWith =>
      _$PostsMetaDMCopyWithImpl<PostsMetaDM>(this as PostsMetaDM, _$identity);

  /// Serializes this PostsMetaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostsMetaDM &&
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
    return 'PostsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class $PostsMetaDMCopyWith<$Res> {
  factory $PostsMetaDMCopyWith(
          PostsMetaDM value, $Res Function(PostsMetaDM) _then) =
      _$PostsMetaDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$PostsMetaDMCopyWithImpl<$Res> implements $PostsMetaDMCopyWith<$Res> {
  _$PostsMetaDMCopyWithImpl(this._self, this._then);

  final PostsMetaDM _self;
  final $Res Function(PostsMetaDM) _then;

  /// Create a copy of PostsMetaDM
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

/// Adds pattern-matching-related methods to [PostsMetaDM].
extension PostsMetaDMPatterns on PostsMetaDM {
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
    TResult Function(_PostsMetaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostsMetaDM() when $default != null:
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
    TResult Function(_PostsMetaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsMetaDM():
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
    TResult? Function(_PostsMetaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsMetaDM() when $default != null:
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
      case _PostsMetaDM() when $default != null:
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
      case _PostsMetaDM():
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
      case _PostsMetaDM() when $default != null:
        return $default(
            _that.currentPage, _that.lastPage, _that.perPage, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostsMetaDM implements PostsMetaDM {
  const _PostsMetaDM(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});
  factory _PostsMetaDM.fromJson(Map<String, dynamic> json) =>
      _$PostsMetaDMFromJson(json);

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

  /// Create a copy of PostsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostsMetaDMCopyWith<_PostsMetaDM> get copyWith =>
      __$PostsMetaDMCopyWithImpl<_PostsMetaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostsMetaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostsMetaDM &&
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
    return 'PostsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$PostsMetaDMCopyWith<$Res>
    implements $PostsMetaDMCopyWith<$Res> {
  factory _$PostsMetaDMCopyWith(
          _PostsMetaDM value, $Res Function(_PostsMetaDM) _then) =
      __$PostsMetaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$PostsMetaDMCopyWithImpl<$Res> implements _$PostsMetaDMCopyWith<$Res> {
  __$PostsMetaDMCopyWithImpl(this._self, this._then);

  final _PostsMetaDM _self;
  final $Res Function(_PostsMetaDM) _then;

  /// Create a copy of PostsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_PostsMetaDM(
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
mixin _$PostDM {
  int? get id;
  String get uuid;
  String get content;
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @JsonKey(name: 'likes_count')
  int get likesCount;
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @JsonKey(name: 'user_uuid')
  String get userUuid;
  @JsonKey(name: 'user_name')
  String get userName;
  @JsonKey(name: 'user_photo')
  String?
      get userPhoto; // Follow Loop (mayo 2026): true cuando el usuario actual sigue al
// autor. La PostCard pinta un anillo purple al avatar como cue
// visual de "esta persona ya está en tu red". Default false para
// que un BE viejo (sin la key) no rompa el parser.
  @JsonKey(name: 'is_followed_by_me')
  bool get isFollowedByMe;
  double? get latitude;
  double? get longitude;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostDMCopyWith<PostDM> get copyWith =>
      _$PostDMCopyWithImpl<PostDM>(this as PostDM, _$identity);

  /// Serializes this PostDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhoto, userPhoto) ||
                other.userPhoto == userPhoto) &&
            (identical(other.isFollowedByMe, isFollowedByMe) ||
                other.isFollowedByMe == isFollowedByMe) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      content,
      photoUrl,
      likesCount,
      isLiked,
      userUuid,
      userName,
      userPhoto,
      isFollowedByMe,
      latitude,
      longitude,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'PostDM(id: $id, uuid: $uuid, content: $content, photoUrl: $photoUrl, likesCount: $likesCount, isLiked: $isLiked, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, isFollowedByMe: $isFollowedByMe, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PostDMCopyWith<$Res> {
  factory $PostDMCopyWith(PostDM value, $Res Function(PostDM) _then) =
      _$PostDMCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String uuid,
      String content,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'user_uuid') String userUuid,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'is_followed_by_me') bool isFollowedByMe,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PostDMCopyWithImpl<$Res> implements $PostDMCopyWith<$Res> {
  _$PostDMCopyWithImpl(this._self, this._then);

  final PostDM _self;
  final $Res Function(PostDM) _then;

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = null,
    Object? content = null,
    Object? photoUrl = freezed,
    Object? likesCount = null,
    Object? isLiked = null,
    Object? userUuid = null,
    Object? userName = null,
    Object? userPhoto = freezed,
    Object? isFollowedByMe = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      userUuid: null == userUuid
          ? _self.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhoto: freezed == userPhoto
          ? _self.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowedByMe: null == isFollowedByMe
          ? _self.isFollowedByMe
          : isFollowedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
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
}

/// Adds pattern-matching-related methods to [PostDM].
extension PostDMPatterns on PostDM {
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
    TResult Function(_PostDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostDM() when $default != null:
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
    TResult Function(_PostDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostDM():
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
    TResult? Function(_PostDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostDM() when $default != null:
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
            int? id,
            String uuid,
            String content,
            @JsonKey(name: 'photo_url') String? photoUrl,
            @JsonKey(name: 'likes_count') int likesCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'user_uuid') String userUuid,
            @JsonKey(name: 'user_name') String userName,
            @JsonKey(name: 'user_photo') String? userPhoto,
            @JsonKey(name: 'is_followed_by_me') bool isFollowedByMe,
            double? latitude,
            double? longitude,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.content,
            _that.photoUrl,
            _that.likesCount,
            _that.isLiked,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.isFollowedByMe,
            _that.latitude,
            _that.longitude,
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
            int? id,
            String uuid,
            String content,
            @JsonKey(name: 'photo_url') String? photoUrl,
            @JsonKey(name: 'likes_count') int likesCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'user_uuid') String userUuid,
            @JsonKey(name: 'user_name') String userName,
            @JsonKey(name: 'user_photo') String? userPhoto,
            @JsonKey(name: 'is_followed_by_me') bool isFollowedByMe,
            double? latitude,
            double? longitude,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.content,
            _that.photoUrl,
            _that.likesCount,
            _that.isLiked,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.isFollowedByMe,
            _that.latitude,
            _that.longitude,
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
            int? id,
            String uuid,
            String content,
            @JsonKey(name: 'photo_url') String? photoUrl,
            @JsonKey(name: 'likes_count') int likesCount,
            @JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'user_uuid') String userUuid,
            @JsonKey(name: 'user_name') String userName,
            @JsonKey(name: 'user_photo') String? userPhoto,
            @JsonKey(name: 'is_followed_by_me') bool isFollowedByMe,
            double? latitude,
            double? longitude,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.content,
            _that.photoUrl,
            _that.likesCount,
            _that.isLiked,
            _that.userUuid,
            _that.userName,
            _that.userPhoto,
            _that.isFollowedByMe,
            _that.latitude,
            _that.longitude,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostDM extends PostDM {
  const _PostDM(
      {this.id,
      required this.uuid,
      required this.content,
      @JsonKey(name: 'photo_url') this.photoUrl,
      @JsonKey(name: 'likes_count') this.likesCount = 0,
      @JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'user_uuid') required this.userUuid,
      @JsonKey(name: 'user_name') this.userName = '',
      @JsonKey(name: 'user_photo') this.userPhoto,
      @JsonKey(name: 'is_followed_by_me') this.isFollowedByMe = false,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();
  factory _PostDM.fromJson(Map<String, dynamic> json) => _$PostDMFromJson(json);

  @override
  final int? id;
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
  @JsonKey(name: 'user_uuid')
  final String userUuid;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'user_photo')
  final String? userPhoto;
// Follow Loop (mayo 2026): true cuando el usuario actual sigue al
// autor. La PostCard pinta un anillo purple al avatar como cue
// visual de "esta persona ya está en tu red". Default false para
// que un BE viejo (sin la key) no rompa el parser.
  @override
  @JsonKey(name: 'is_followed_by_me')
  final bool isFollowedByMe;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostDMCopyWith<_PostDM> get copyWith =>
      __$PostDMCopyWithImpl<_PostDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhoto, userPhoto) ||
                other.userPhoto == userPhoto) &&
            (identical(other.isFollowedByMe, isFollowedByMe) ||
                other.isFollowedByMe == isFollowedByMe) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      content,
      photoUrl,
      likesCount,
      isLiked,
      userUuid,
      userName,
      userPhoto,
      isFollowedByMe,
      latitude,
      longitude,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'PostDM(id: $id, uuid: $uuid, content: $content, photoUrl: $photoUrl, likesCount: $likesCount, isLiked: $isLiked, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, isFollowedByMe: $isFollowedByMe, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PostDMCopyWith<$Res> implements $PostDMCopyWith<$Res> {
  factory _$PostDMCopyWith(_PostDM value, $Res Function(_PostDM) _then) =
      __$PostDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String uuid,
      String content,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'user_uuid') String userUuid,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'is_followed_by_me') bool isFollowedByMe,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$PostDMCopyWithImpl<$Res> implements _$PostDMCopyWith<$Res> {
  __$PostDMCopyWithImpl(this._self, this._then);

  final _PostDM _self;
  final $Res Function(_PostDM) _then;

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? uuid = null,
    Object? content = null,
    Object? photoUrl = freezed,
    Object? likesCount = null,
    Object? isLiked = null,
    Object? userUuid = null,
    Object? userName = null,
    Object? userPhoto = freezed,
    Object? isFollowedByMe = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_PostDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      userUuid: null == userUuid
          ? _self.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhoto: freezed == userPhoto
          ? _self.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowedByMe: null == isFollowedByMe
          ? _self.isFollowedByMe
          : isFollowedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
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
}

/// @nodoc
mixin _$ToggleLikeResponseDM {
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @JsonKey(name: 'likes_count')
  int get likesCount;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleLikeResponseDMCopyWith<ToggleLikeResponseDM> get copyWith =>
      _$ToggleLikeResponseDMCopyWithImpl<ToggleLikeResponseDM>(
          this as ToggleLikeResponseDM, _$identity);

  /// Serializes this ToggleLikeResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleLikeResponseDM &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLiked, likesCount);

  @override
  String toString() {
    return 'ToggleLikeResponseDM(isLiked: $isLiked, likesCount: $likesCount)';
  }
}

/// @nodoc
abstract mixin class $ToggleLikeResponseDMCopyWith<$Res> {
  factory $ToggleLikeResponseDMCopyWith(ToggleLikeResponseDM value,
          $Res Function(ToggleLikeResponseDM) _then) =
      _$ToggleLikeResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount});
}

/// @nodoc
class _$ToggleLikeResponseDMCopyWithImpl<$Res>
    implements $ToggleLikeResponseDMCopyWith<$Res> {
  _$ToggleLikeResponseDMCopyWithImpl(this._self, this._then);

  final ToggleLikeResponseDM _self;
  final $Res Function(ToggleLikeResponseDM) _then;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? likesCount = null,
  }) {
    return _then(_self.copyWith(
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ToggleLikeResponseDM].
extension ToggleLikeResponseDMPatterns on ToggleLikeResponseDM {
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
    TResult Function(_ToggleLikeResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ToggleLikeResponseDM() when $default != null:
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
    TResult Function(_ToggleLikeResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ToggleLikeResponseDM():
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
    TResult? Function(_ToggleLikeResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ToggleLikeResponseDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'likes_count') int likesCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ToggleLikeResponseDM() when $default != null:
        return $default(_that.isLiked, _that.likesCount);
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
    TResult Function(@JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'likes_count') int likesCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ToggleLikeResponseDM():
        return $default(_that.isLiked, _that.likesCount);
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
    TResult? Function(@JsonKey(name: 'is_liked') bool isLiked,
            @JsonKey(name: 'likes_count') int likesCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ToggleLikeResponseDM() when $default != null:
        return $default(_that.isLiked, _that.likesCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ToggleLikeResponseDM implements ToggleLikeResponseDM {
  const _ToggleLikeResponseDM(
      {@JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'likes_count') this.likesCount = 0});
  factory _ToggleLikeResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeResponseDMFromJson(json);

  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleLikeResponseDMCopyWith<_ToggleLikeResponseDM> get copyWith =>
      __$ToggleLikeResponseDMCopyWithImpl<_ToggleLikeResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ToggleLikeResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToggleLikeResponseDM &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLiked, likesCount);

  @override
  String toString() {
    return 'ToggleLikeResponseDM(isLiked: $isLiked, likesCount: $likesCount)';
  }
}

/// @nodoc
abstract mixin class _$ToggleLikeResponseDMCopyWith<$Res>
    implements $ToggleLikeResponseDMCopyWith<$Res> {
  factory _$ToggleLikeResponseDMCopyWith(_ToggleLikeResponseDM value,
          $Res Function(_ToggleLikeResponseDM) _then) =
      __$ToggleLikeResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount});
}

/// @nodoc
class __$ToggleLikeResponseDMCopyWithImpl<$Res>
    implements _$ToggleLikeResponseDMCopyWith<$Res> {
  __$ToggleLikeResponseDMCopyWithImpl(this._self, this._then);

  final _ToggleLikeResponseDM _self;
  final $Res Function(_ToggleLikeResponseDM) _then;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLiked = null,
    Object? likesCount = null,
  }) {
    return _then(_ToggleLikeResponseDM(
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
