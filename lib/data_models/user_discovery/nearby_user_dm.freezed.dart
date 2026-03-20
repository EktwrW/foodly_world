// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_user_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbyUsersResponseDM _$NearbyUsersResponseDMFromJson(
    Map<String, dynamic> json) {
  return _NearbyUsersResponseDM.fromJson(json);
}

/// @nodoc
mixin _$NearbyUsersResponseDM {
  List<NearbyUserDM> get data => throw _privateConstructorUsedError;
  NearbyUsersMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this NearbyUsersResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyUsersResponseDMCopyWith<NearbyUsersResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyUsersResponseDMCopyWith<$Res> {
  factory $NearbyUsersResponseDMCopyWith(NearbyUsersResponseDM value,
          $Res Function(NearbyUsersResponseDM) then) =
      _$NearbyUsersResponseDMCopyWithImpl<$Res, NearbyUsersResponseDM>;
  @useResult
  $Res call({List<NearbyUserDM> data, NearbyUsersMetaDM? meta});

  $NearbyUsersMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$NearbyUsersResponseDMCopyWithImpl<$Res,
        $Val extends NearbyUsersResponseDM>
    implements $NearbyUsersResponseDMCopyWith<$Res> {
  _$NearbyUsersResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
    ) as $Val);
  }

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $NearbyUsersMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearbyUsersResponseDMImplCopyWith<$Res>
    implements $NearbyUsersResponseDMCopyWith<$Res> {
  factory _$$NearbyUsersResponseDMImplCopyWith(
          _$NearbyUsersResponseDMImpl value,
          $Res Function(_$NearbyUsersResponseDMImpl) then) =
      __$$NearbyUsersResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NearbyUserDM> data, NearbyUsersMetaDM? meta});

  @override
  $NearbyUsersMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$NearbyUsersResponseDMImplCopyWithImpl<$Res>
    extends _$NearbyUsersResponseDMCopyWithImpl<$Res,
        _$NearbyUsersResponseDMImpl>
    implements _$$NearbyUsersResponseDMImplCopyWith<$Res> {
  __$$NearbyUsersResponseDMImplCopyWithImpl(_$NearbyUsersResponseDMImpl _value,
      $Res Function(_$NearbyUsersResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_$NearbyUsersResponseDMImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyUsersResponseDMImpl implements _NearbyUsersResponseDM {
  const _$NearbyUsersResponseDMImpl(
      {final List<NearbyUserDM> data = const [], this.meta})
      : _data = data;

  factory _$NearbyUsersResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyUsersResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NearbyUsersResponseDM(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyUsersResponseDMImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyUsersResponseDMImplCopyWith<_$NearbyUsersResponseDMImpl>
      get copyWith => __$$NearbyUsersResponseDMImplCopyWithImpl<
          _$NearbyUsersResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyUsersResponseDMImplToJson(
      this,
    );
  }
}

abstract class _NearbyUsersResponseDM implements NearbyUsersResponseDM {
  const factory _NearbyUsersResponseDM(
      {final List<NearbyUserDM> data,
      final NearbyUsersMetaDM? meta}) = _$NearbyUsersResponseDMImpl;

  factory _NearbyUsersResponseDM.fromJson(Map<String, dynamic> json) =
      _$NearbyUsersResponseDMImpl.fromJson;

  @override
  List<NearbyUserDM> get data;
  @override
  NearbyUsersMetaDM? get meta;

  /// Create a copy of NearbyUsersResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyUsersResponseDMImplCopyWith<_$NearbyUsersResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NearbyUsersMetaDM _$NearbyUsersMetaDMFromJson(Map<String, dynamic> json) {
  return _NearbyUsersMetaDM.fromJson(json);
}

/// @nodoc
mixin _$NearbyUsersMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this NearbyUsersMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyUsersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyUsersMetaDMCopyWith<NearbyUsersMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyUsersMetaDMCopyWith<$Res> {
  factory $NearbyUsersMetaDMCopyWith(
          NearbyUsersMetaDM value, $Res Function(NearbyUsersMetaDM) then) =
      _$NearbyUsersMetaDMCopyWithImpl<$Res, NearbyUsersMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$NearbyUsersMetaDMCopyWithImpl<$Res, $Val extends NearbyUsersMetaDM>
    implements $NearbyUsersMetaDMCopyWith<$Res> {
  _$NearbyUsersMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyUsersMetaDMImplCopyWith<$Res>
    implements $NearbyUsersMetaDMCopyWith<$Res> {
  factory _$$NearbyUsersMetaDMImplCopyWith(_$NearbyUsersMetaDMImpl value,
          $Res Function(_$NearbyUsersMetaDMImpl) then) =
      __$$NearbyUsersMetaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$$NearbyUsersMetaDMImplCopyWithImpl<$Res>
    extends _$NearbyUsersMetaDMCopyWithImpl<$Res, _$NearbyUsersMetaDMImpl>
    implements _$$NearbyUsersMetaDMImplCopyWith<$Res> {
  __$$NearbyUsersMetaDMImplCopyWithImpl(_$NearbyUsersMetaDMImpl _value,
      $Res Function(_$NearbyUsersMetaDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$NearbyUsersMetaDMImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyUsersMetaDMImpl implements _NearbyUsersMetaDM {
  const _$NearbyUsersMetaDMImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});

  factory _$NearbyUsersMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyUsersMetaDMImplFromJson(json);

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
  String toString() {
    return 'NearbyUsersMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyUsersMetaDMImpl &&
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

  /// Create a copy of NearbyUsersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyUsersMetaDMImplCopyWith<_$NearbyUsersMetaDMImpl> get copyWith =>
      __$$NearbyUsersMetaDMImplCopyWithImpl<_$NearbyUsersMetaDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyUsersMetaDMImplToJson(
      this,
    );
  }
}

abstract class _NearbyUsersMetaDM implements NearbyUsersMetaDM {
  const factory _NearbyUsersMetaDM(
      {@JsonKey(name: 'current_page') final int currentPage,
      @JsonKey(name: 'last_page') final int lastPage,
      @JsonKey(name: 'per_page') final int perPage,
      final int total}) = _$NearbyUsersMetaDMImpl;

  factory _NearbyUsersMetaDM.fromJson(Map<String, dynamic> json) =
      _$NearbyUsersMetaDMImpl.fromJson;

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

  /// Create a copy of NearbyUsersMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyUsersMetaDMImplCopyWith<_$NearbyUsersMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearbyUserDM _$NearbyUserDMFromJson(Map<String, dynamic> json) {
  return _NearbyUserDM.fromJson(json);
}

/// @nodoc
mixin _$NearbyUserDM {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'posts_count')
  int get postsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_received')
  int get likesReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_count')
  int get reviewsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_score')
  int get activityScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool get isFollowing => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  /// Serializes this NearbyUserDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyUserDMCopyWith<NearbyUserDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyUserDMCopyWith<$Res> {
  factory $NearbyUserDMCopyWith(
          NearbyUserDM value, $Res Function(NearbyUserDM) then) =
      _$NearbyUserDMCopyWithImpl<$Res, NearbyUserDM>;
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
class _$NearbyUserDMCopyWithImpl<$Res, $Val extends NearbyUserDM>
    implements $NearbyUserDMCopyWith<$Res> {
  _$NearbyUserDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      postsCount: null == postsCount
          ? _value.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _value.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      activityScore: null == activityScore
          ? _value.activityScore
          : activityScore // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyUserDMImplCopyWith<$Res>
    implements $NearbyUserDMCopyWith<$Res> {
  factory _$$NearbyUserDMImplCopyWith(
          _$NearbyUserDMImpl value, $Res Function(_$NearbyUserDMImpl) then) =
      __$$NearbyUserDMImplCopyWithImpl<$Res>;
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
class __$$NearbyUserDMImplCopyWithImpl<$Res>
    extends _$NearbyUserDMCopyWithImpl<$Res, _$NearbyUserDMImpl>
    implements _$$NearbyUserDMImplCopyWith<$Res> {
  __$$NearbyUserDMImplCopyWithImpl(
      _$NearbyUserDMImpl _value, $Res Function(_$NearbyUserDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$NearbyUserDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      postsCount: null == postsCount
          ? _value.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _value.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      activityScore: null == activityScore
          ? _value.activityScore
          : activityScore // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyUserDMImpl extends _NearbyUserDM {
  const _$NearbyUserDMImpl(
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

  factory _$NearbyUserDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyUserDMImplFromJson(json);

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

  @override
  String toString() {
    return 'NearbyUserDM(uuid: $uuid, name: $name, username: $username, photo: $photo, bio: $bio, postsCount: $postsCount, likesReceived: $likesReceived, reviewsCount: $reviewsCount, activityScore: $activityScore, followersCount: $followersCount, isFollowing: $isFollowing, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyUserDMImpl &&
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

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyUserDMImplCopyWith<_$NearbyUserDMImpl> get copyWith =>
      __$$NearbyUserDMImplCopyWithImpl<_$NearbyUserDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyUserDMImplToJson(
      this,
    );
  }
}

abstract class _NearbyUserDM extends NearbyUserDM {
  const factory _NearbyUserDM(
      {required final String uuid,
      final String name,
      final String? username,
      final String? photo,
      final String? bio,
      @JsonKey(name: 'posts_count') final int postsCount,
      @JsonKey(name: 'likes_received') final int likesReceived,
      @JsonKey(name: 'reviews_count') final int reviewsCount,
      @JsonKey(name: 'activity_score') final int activityScore,
      @JsonKey(name: 'followers_count') final int followersCount,
      @JsonKey(name: 'is_following') final bool isFollowing,
      final double distance}) = _$NearbyUserDMImpl;
  const _NearbyUserDM._() : super._();

  factory _NearbyUserDM.fromJson(Map<String, dynamic> json) =
      _$NearbyUserDMImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String? get username;
  @override
  String? get photo;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'posts_count')
  int get postsCount;
  @override
  @JsonKey(name: 'likes_received')
  int get likesReceived;
  @override
  @JsonKey(name: 'reviews_count')
  int get reviewsCount;
  @override
  @JsonKey(name: 'activity_score')
  int get activityScore;
  @override
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @JsonKey(name: 'is_following')
  bool get isFollowing;
  @override
  double get distance;

  /// Create a copy of NearbyUserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyUserDMImplCopyWith<_$NearbyUserDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileDM _$UserProfileDMFromJson(Map<String, dynamic> json) {
  return _UserProfileDM.fromJson(json);
}

/// @nodoc
mixin _$UserProfileDM {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  UserProfileStatsDM? get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_posts')
  List<UserProfilePostDM> get recentPosts => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfileDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileDMCopyWith<UserProfileDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDMCopyWith<$Res> {
  factory $UserProfileDMCopyWith(
          UserProfileDM value, $Res Function(UserProfileDM) then) =
      _$UserProfileDMCopyWithImpl<$Res, UserProfileDM>;
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
class _$UserProfileDMCopyWithImpl<$Res, $Val extends UserProfileDM>
    implements $UserProfileDMCopyWith<$Res> {
  _$UserProfileDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStatsDM?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      recentPosts: null == recentPosts
          ? _value.recentPosts
          : recentPosts // ignore: cast_nullable_to_non_nullable
              as List<UserProfilePostDM>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileStatsDMCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $UserProfileStatsDMCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileDMImplCopyWith<$Res>
    implements $UserProfileDMCopyWith<$Res> {
  factory _$$UserProfileDMImplCopyWith(
          _$UserProfileDMImpl value, $Res Function(_$UserProfileDMImpl) then) =
      __$$UserProfileDMImplCopyWithImpl<$Res>;
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
class __$$UserProfileDMImplCopyWithImpl<$Res>
    extends _$UserProfileDMCopyWithImpl<$Res, _$UserProfileDMImpl>
    implements _$$UserProfileDMImplCopyWith<$Res> {
  __$$UserProfileDMImplCopyWithImpl(
      _$UserProfileDMImpl _value, $Res Function(_$UserProfileDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$UserProfileDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStatsDM?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      recentPosts: null == recentPosts
          ? _value._recentPosts
          : recentPosts // ignore: cast_nullable_to_non_nullable
              as List<UserProfilePostDM>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileDMImpl implements _UserProfileDM {
  const _$UserProfileDMImpl(
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

  factory _$UserProfileDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDMImplFromJson(json);

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

  @override
  String toString() {
    return 'UserProfileDM(uuid: $uuid, name: $name, username: $username, photo: $photo, bio: $bio, stats: $stats, isFollowing: $isFollowing, recentPosts: $recentPosts, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDMImpl &&
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

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileDMImplCopyWith<_$UserProfileDMImpl> get copyWith =>
      __$$UserProfileDMImplCopyWithImpl<_$UserProfileDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDMImplToJson(
      this,
    );
  }
}

abstract class _UserProfileDM implements UserProfileDM {
  const factory _UserProfileDM(
      {required final String uuid,
      final String name,
      final String? username,
      final String? photo,
      final String? bio,
      final UserProfileStatsDM? stats,
      @JsonKey(name: 'is_following') final bool isFollowing,
      @JsonKey(name: 'recent_posts') final List<UserProfilePostDM> recentPosts,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$UserProfileDMImpl;

  factory _UserProfileDM.fromJson(Map<String, dynamic> json) =
      _$UserProfileDMImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String? get username;
  @override
  String? get photo;
  @override
  String? get bio;
  @override
  UserProfileStatsDM? get stats;
  @override
  @JsonKey(name: 'is_following')
  bool get isFollowing;
  @override
  @JsonKey(name: 'recent_posts')
  List<UserProfilePostDM> get recentPosts;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of UserProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileDMImplCopyWith<_$UserProfileDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileStatsDM _$UserProfileStatsDMFromJson(Map<String, dynamic> json) {
  return _UserProfileStatsDM.fromJson(json);
}

/// @nodoc
mixin _$UserProfileStatsDM {
  @JsonKey(name: 'posts_count')
  int get postsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_received')
  int get likesReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviews_count')
  int get reviewsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_count')
  int get followingCount => throw _privateConstructorUsedError;

  /// Serializes this UserProfileStatsDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileStatsDMCopyWith<UserProfileStatsDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStatsDMCopyWith<$Res> {
  factory $UserProfileStatsDMCopyWith(
          UserProfileStatsDM value, $Res Function(UserProfileStatsDM) then) =
      _$UserProfileStatsDMCopyWithImpl<$Res, UserProfileStatsDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'posts_count') int postsCount,
      @JsonKey(name: 'likes_received') int likesReceived,
      @JsonKey(name: 'reviews_count') int reviewsCount,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount});
}

/// @nodoc
class _$UserProfileStatsDMCopyWithImpl<$Res, $Val extends UserProfileStatsDM>
    implements $UserProfileStatsDMCopyWith<$Res> {
  _$UserProfileStatsDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      postsCount: null == postsCount
          ? _value.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _value.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileStatsDMImplCopyWith<$Res>
    implements $UserProfileStatsDMCopyWith<$Res> {
  factory _$$UserProfileStatsDMImplCopyWith(_$UserProfileStatsDMImpl value,
          $Res Function(_$UserProfileStatsDMImpl) then) =
      __$$UserProfileStatsDMImplCopyWithImpl<$Res>;
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
class __$$UserProfileStatsDMImplCopyWithImpl<$Res>
    extends _$UserProfileStatsDMCopyWithImpl<$Res, _$UserProfileStatsDMImpl>
    implements _$$UserProfileStatsDMImplCopyWith<$Res> {
  __$$UserProfileStatsDMImplCopyWithImpl(_$UserProfileStatsDMImpl _value,
      $Res Function(_$UserProfileStatsDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$UserProfileStatsDMImpl(
      postsCount: null == postsCount
          ? _value.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _value.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileStatsDMImpl implements _UserProfileStatsDM {
  const _$UserProfileStatsDMImpl(
      {@JsonKey(name: 'posts_count') this.postsCount = 0,
      @JsonKey(name: 'likes_received') this.likesReceived = 0,
      @JsonKey(name: 'reviews_count') this.reviewsCount = 0,
      @JsonKey(name: 'followers_count') this.followersCount = 0,
      @JsonKey(name: 'following_count') this.followingCount = 0});

  factory _$UserProfileStatsDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileStatsDMImplFromJson(json);

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

  @override
  String toString() {
    return 'UserProfileStatsDM(postsCount: $postsCount, likesReceived: $likesReceived, reviewsCount: $reviewsCount, followersCount: $followersCount, followingCount: $followingCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileStatsDMImpl &&
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

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileStatsDMImplCopyWith<_$UserProfileStatsDMImpl> get copyWith =>
      __$$UserProfileStatsDMImplCopyWithImpl<_$UserProfileStatsDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileStatsDMImplToJson(
      this,
    );
  }
}

abstract class _UserProfileStatsDM implements UserProfileStatsDM {
  const factory _UserProfileStatsDM(
          {@JsonKey(name: 'posts_count') final int postsCount,
          @JsonKey(name: 'likes_received') final int likesReceived,
          @JsonKey(name: 'reviews_count') final int reviewsCount,
          @JsonKey(name: 'followers_count') final int followersCount,
          @JsonKey(name: 'following_count') final int followingCount}) =
      _$UserProfileStatsDMImpl;

  factory _UserProfileStatsDM.fromJson(Map<String, dynamic> json) =
      _$UserProfileStatsDMImpl.fromJson;

  @override
  @JsonKey(name: 'posts_count')
  int get postsCount;
  @override
  @JsonKey(name: 'likes_received')
  int get likesReceived;
  @override
  @JsonKey(name: 'reviews_count')
  int get reviewsCount;
  @override
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @JsonKey(name: 'following_count')
  int get followingCount;

  /// Create a copy of UserProfileStatsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileStatsDMImplCopyWith<_$UserProfileStatsDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfilePostDM _$UserProfilePostDMFromJson(Map<String, dynamic> json) {
  return _UserProfilePostDM.fromJson(json);
}

/// @nodoc
mixin _$UserProfilePostDM {
  String get uuid => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfilePostDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfilePostDMCopyWith<UserProfilePostDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfilePostDMCopyWith<$Res> {
  factory $UserProfilePostDMCopyWith(
          UserProfilePostDM value, $Res Function(UserProfilePostDM) then) =
      _$UserProfilePostDMCopyWithImpl<$Res, UserProfilePostDM>;
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
class _$UserProfilePostDMCopyWithImpl<$Res, $Val extends UserProfilePostDM>
    implements $UserProfilePostDMCopyWith<$Res> {
  _$UserProfilePostDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfilePostDMImplCopyWith<$Res>
    implements $UserProfilePostDMCopyWith<$Res> {
  factory _$$UserProfilePostDMImplCopyWith(_$UserProfilePostDMImpl value,
          $Res Function(_$UserProfilePostDMImpl) then) =
      __$$UserProfilePostDMImplCopyWithImpl<$Res>;
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
class __$$UserProfilePostDMImplCopyWithImpl<$Res>
    extends _$UserProfilePostDMCopyWithImpl<$Res, _$UserProfilePostDMImpl>
    implements _$$UserProfilePostDMImplCopyWith<$Res> {
  __$$UserProfilePostDMImplCopyWithImpl(_$UserProfilePostDMImpl _value,
      $Res Function(_$UserProfilePostDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$UserProfilePostDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfilePostDMImpl implements _UserProfilePostDM {
  const _$UserProfilePostDMImpl(
      {required this.uuid,
      required this.content,
      @JsonKey(name: 'photo_url') this.photoUrl,
      @JsonKey(name: 'likes_count') this.likesCount = 0,
      @JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$UserProfilePostDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfilePostDMImplFromJson(json);

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

  @override
  String toString() {
    return 'UserProfilePostDM(uuid: $uuid, content: $content, photoUrl: $photoUrl, likesCount: $likesCount, isLiked: $isLiked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfilePostDMImpl &&
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

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfilePostDMImplCopyWith<_$UserProfilePostDMImpl> get copyWith =>
      __$$UserProfilePostDMImplCopyWithImpl<_$UserProfilePostDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfilePostDMImplToJson(
      this,
    );
  }
}

abstract class _UserProfilePostDM implements UserProfilePostDM {
  const factory _UserProfilePostDM(
          {required final String uuid,
          required final String content,
          @JsonKey(name: 'photo_url') final String? photoUrl,
          @JsonKey(name: 'likes_count') final int likesCount,
          @JsonKey(name: 'is_liked') final bool isLiked,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$UserProfilePostDMImpl;

  factory _UserProfilePostDM.fromJson(Map<String, dynamic> json) =
      _$UserProfilePostDMImpl.fromJson;

  @override
  String get uuid;
  @override
  String get content;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  @JsonKey(name: 'likes_count')
  int get likesCount;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of UserProfilePostDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfilePostDMImplCopyWith<_$UserProfilePostDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
