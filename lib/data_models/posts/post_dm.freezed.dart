// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostsResponseDM _$PostsResponseDMFromJson(Map<String, dynamic> json) {
  return _PostsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$PostsResponseDM {
  List<PostDM> get posts => throw _privateConstructorUsedError;
  PostsMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this PostsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsResponseDMCopyWith<PostsResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsResponseDMCopyWith<$Res> {
  factory $PostsResponseDMCopyWith(
          PostsResponseDM value, $Res Function(PostsResponseDM) then) =
      _$PostsResponseDMCopyWithImpl<$Res, PostsResponseDM>;
  @useResult
  $Res call({List<PostDM> posts, PostsMetaDM? meta});

  $PostsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$PostsResponseDMCopyWithImpl<$Res, $Val extends PostsResponseDM>
    implements $PostsResponseDMCopyWith<$Res> {
  _$PostsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
    ) as $Val);
  }

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PostsMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostsResponseDMImplCopyWith<$Res>
    implements $PostsResponseDMCopyWith<$Res> {
  factory _$$PostsResponseDMImplCopyWith(_$PostsResponseDMImpl value,
          $Res Function(_$PostsResponseDMImpl) then) =
      __$$PostsResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostDM> posts, PostsMetaDM? meta});

  @override
  $PostsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$PostsResponseDMImplCopyWithImpl<$Res>
    extends _$PostsResponseDMCopyWithImpl<$Res, _$PostsResponseDMImpl>
    implements _$$PostsResponseDMImplCopyWith<$Res> {
  __$$PostsResponseDMImplCopyWithImpl(
      _$PostsResponseDMImpl _value, $Res Function(_$PostsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? meta = freezed,
  }) {
    return _then(_$PostsResponseDMImpl(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsResponseDMImpl implements _PostsResponseDM {
  const _$PostsResponseDMImpl({final List<PostDM> posts = const [], this.meta})
      : _posts = posts;

  factory _$PostsResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'PostsResponseDM(posts: $posts, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsResponseDMImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), meta);

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsResponseDMImplCopyWith<_$PostsResponseDMImpl> get copyWith =>
      __$$PostsResponseDMImplCopyWithImpl<_$PostsResponseDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _PostsResponseDM implements PostsResponseDM {
  const factory _PostsResponseDM(
      {final List<PostDM> posts,
      final PostsMetaDM? meta}) = _$PostsResponseDMImpl;

  factory _PostsResponseDM.fromJson(Map<String, dynamic> json) =
      _$PostsResponseDMImpl.fromJson;

  @override
  List<PostDM> get posts;
  @override
  PostsMetaDM? get meta;

  /// Create a copy of PostsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsResponseDMImplCopyWith<_$PostsResponseDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostsMetaDM _$PostsMetaDMFromJson(Map<String, dynamic> json) {
  return _PostsMetaDM.fromJson(json);
}

/// @nodoc
mixin _$PostsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PostsMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsMetaDMCopyWith<PostsMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsMetaDMCopyWith<$Res> {
  factory $PostsMetaDMCopyWith(
          PostsMetaDM value, $Res Function(PostsMetaDM) then) =
      _$PostsMetaDMCopyWithImpl<$Res, PostsMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$PostsMetaDMCopyWithImpl<$Res, $Val extends PostsMetaDM>
    implements $PostsMetaDMCopyWith<$Res> {
  _$PostsMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$PostsMetaDMImplCopyWith<$Res>
    implements $PostsMetaDMCopyWith<$Res> {
  factory _$$PostsMetaDMImplCopyWith(
          _$PostsMetaDMImpl value, $Res Function(_$PostsMetaDMImpl) then) =
      __$$PostsMetaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$$PostsMetaDMImplCopyWithImpl<$Res>
    extends _$PostsMetaDMCopyWithImpl<$Res, _$PostsMetaDMImpl>
    implements _$$PostsMetaDMImplCopyWith<$Res> {
  __$$PostsMetaDMImplCopyWithImpl(
      _$PostsMetaDMImpl _value, $Res Function(_$PostsMetaDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$PostsMetaDMImpl(
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
class _$PostsMetaDMImpl implements _PostsMetaDM {
  const _$PostsMetaDMImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});

  factory _$PostsMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsMetaDMImplFromJson(json);

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
    return 'PostsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsMetaDMImpl &&
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

  /// Create a copy of PostsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsMetaDMImplCopyWith<_$PostsMetaDMImpl> get copyWith =>
      __$$PostsMetaDMImplCopyWithImpl<_$PostsMetaDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsMetaDMImplToJson(
      this,
    );
  }
}

abstract class _PostsMetaDM implements PostsMetaDM {
  const factory _PostsMetaDM(
      {@JsonKey(name: 'current_page') final int currentPage,
      @JsonKey(name: 'last_page') final int lastPage,
      @JsonKey(name: 'per_page') final int perPage,
      final int total}) = _$PostsMetaDMImpl;

  factory _PostsMetaDM.fromJson(Map<String, dynamic> json) =
      _$PostsMetaDMImpl.fromJson;

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

  /// Create a copy of PostsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsMetaDMImplCopyWith<_$PostsMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostDM _$PostDMFromJson(Map<String, dynamic> json) {
  return _PostDM.fromJson(json);
}

/// @nodoc
mixin _$PostDM {
  int? get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_uuid')
  String get userUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_photo')
  String? get userPhoto =>
      throw _privateConstructorUsedError; // Follow Loop (mayo 2026): true cuando el usuario actual sigue al
// autor. La PostCard pinta un anillo purple al avatar como cue
// visual de "esta persona ya está en tu red". Default false para
// que un BE viejo (sin la key) no rompa el parser.
  @JsonKey(name: 'is_followed_by_me')
  bool get isFollowedByMe => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PostDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDMCopyWith<PostDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDMCopyWith<$Res> {
  factory $PostDMCopyWith(PostDM value, $Res Function(PostDM) then) =
      _$PostDMCopyWithImpl<$Res, PostDM>;
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
class _$PostDMCopyWithImpl<$Res, $Val extends PostDM>
    implements $PostDMCopyWith<$Res> {
  _$PostDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhoto: freezed == userPhoto
          ? _value.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowedByMe: null == isFollowedByMe
          ? _value.isFollowedByMe
          : isFollowedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
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
}

/// @nodoc
abstract class _$$PostDMImplCopyWith<$Res> implements $PostDMCopyWith<$Res> {
  factory _$$PostDMImplCopyWith(
          _$PostDMImpl value, $Res Function(_$PostDMImpl) then) =
      __$$PostDMImplCopyWithImpl<$Res>;
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
class __$$PostDMImplCopyWithImpl<$Res>
    extends _$PostDMCopyWithImpl<$Res, _$PostDMImpl>
    implements _$$PostDMImplCopyWith<$Res> {
  __$$PostDMImplCopyWithImpl(
      _$PostDMImpl _value, $Res Function(_$PostDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$PostDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhoto: freezed == userPhoto
          ? _value.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowedByMe: null == isFollowedByMe
          ? _value.isFollowedByMe
          : isFollowedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$PostDMImpl extends _PostDM {
  const _$PostDMImpl(
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

  factory _$PostDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostDMImplFromJson(json);

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

  @override
  String toString() {
    return 'PostDM(id: $id, uuid: $uuid, content: $content, photoUrl: $photoUrl, likesCount: $likesCount, isLiked: $isLiked, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, isFollowedByMe: $isFollowedByMe, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDMImpl &&
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

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDMImplCopyWith<_$PostDMImpl> get copyWith =>
      __$$PostDMImplCopyWithImpl<_$PostDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostDMImplToJson(
      this,
    );
  }
}

abstract class _PostDM extends PostDM {
  const factory _PostDM(
      {final int? id,
      required final String uuid,
      required final String content,
      @JsonKey(name: 'photo_url') final String? photoUrl,
      @JsonKey(name: 'likes_count') final int likesCount,
      @JsonKey(name: 'is_liked') final bool isLiked,
      @JsonKey(name: 'user_uuid') required final String userUuid,
      @JsonKey(name: 'user_name') final String userName,
      @JsonKey(name: 'user_photo') final String? userPhoto,
      @JsonKey(name: 'is_followed_by_me') final bool isFollowedByMe,
      final double? latitude,
      final double? longitude,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$PostDMImpl;
  const _PostDM._() : super._();

  factory _PostDM.fromJson(Map<String, dynamic> json) = _$PostDMImpl.fromJson;

  @override
  int? get id;
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
  @JsonKey(name: 'user_uuid')
  String get userUuid;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'user_photo')
  String?
      get userPhoto; // Follow Loop (mayo 2026): true cuando el usuario actual sigue al
// autor. La PostCard pinta un anillo purple al avatar como cue
// visual de "esta persona ya está en tu red". Default false para
// que un BE viejo (sin la key) no rompa el parser.
  @override
  @JsonKey(name: 'is_followed_by_me')
  bool get isFollowedByMe;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PostDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDMImplCopyWith<_$PostDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToggleLikeResponseDM _$ToggleLikeResponseDMFromJson(Map<String, dynamic> json) {
  return _ToggleLikeResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ToggleLikeResponseDM {
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int get likesCount => throw _privateConstructorUsedError;

  /// Serializes this ToggleLikeResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToggleLikeResponseDMCopyWith<ToggleLikeResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleLikeResponseDMCopyWith<$Res> {
  factory $ToggleLikeResponseDMCopyWith(ToggleLikeResponseDM value,
          $Res Function(ToggleLikeResponseDM) then) =
      _$ToggleLikeResponseDMCopyWithImpl<$Res, ToggleLikeResponseDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount});
}

/// @nodoc
class _$ToggleLikeResponseDMCopyWithImpl<$Res,
        $Val extends ToggleLikeResponseDM>
    implements $ToggleLikeResponseDMCopyWith<$Res> {
  _$ToggleLikeResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? likesCount = null,
  }) {
    return _then(_value.copyWith(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToggleLikeResponseDMImplCopyWith<$Res>
    implements $ToggleLikeResponseDMCopyWith<$Res> {
  factory _$$ToggleLikeResponseDMImplCopyWith(_$ToggleLikeResponseDMImpl value,
          $Res Function(_$ToggleLikeResponseDMImpl) then) =
      __$$ToggleLikeResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount});
}

/// @nodoc
class __$$ToggleLikeResponseDMImplCopyWithImpl<$Res>
    extends _$ToggleLikeResponseDMCopyWithImpl<$Res, _$ToggleLikeResponseDMImpl>
    implements _$$ToggleLikeResponseDMImplCopyWith<$Res> {
  __$$ToggleLikeResponseDMImplCopyWithImpl(_$ToggleLikeResponseDMImpl _value,
      $Res Function(_$ToggleLikeResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? likesCount = null,
  }) {
    return _then(_$ToggleLikeResponseDMImpl(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToggleLikeResponseDMImpl implements _ToggleLikeResponseDM {
  const _$ToggleLikeResponseDMImpl(
      {@JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'likes_count') this.likesCount = 0});

  factory _$ToggleLikeResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToggleLikeResponseDMImplFromJson(json);

  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;

  @override
  String toString() {
    return 'ToggleLikeResponseDM(isLiked: $isLiked, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleLikeResponseDMImpl &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLiked, likesCount);

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleLikeResponseDMImplCopyWith<_$ToggleLikeResponseDMImpl>
      get copyWith =>
          __$$ToggleLikeResponseDMImplCopyWithImpl<_$ToggleLikeResponseDMImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToggleLikeResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ToggleLikeResponseDM implements ToggleLikeResponseDM {
  const factory _ToggleLikeResponseDM(
          {@JsonKey(name: 'is_liked') final bool isLiked,
          @JsonKey(name: 'likes_count') final int likesCount}) =
      _$ToggleLikeResponseDMImpl;

  factory _ToggleLikeResponseDM.fromJson(Map<String, dynamic> json) =
      _$ToggleLikeResponseDMImpl.fromJson;

  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @override
  @JsonKey(name: 'likes_count')
  int get likesCount;

  /// Create a copy of ToggleLikeResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleLikeResponseDMImplCopyWith<_$ToggleLikeResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
