// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SocialVM {
  SocialPageViews get currentView =>
      throw _privateConstructorUsedError; // Posts state
  List<PostDM> get posts => throw _privateConstructorUsedError;
  PostsMetaDM? get postsMeta => throw _privateConstructorUsedError;
  bool get isLoadingMorePosts => throw _privateConstructorUsedError;
  bool get isCreatingPost => throw _privateConstructorUsedError;
  PostsFeedFilter get feedFilter =>
      throw _privateConstructorUsedError; // Users state
  List<NearbyUserDM> get nearbyUsers => throw _privateConstructorUsedError;
  NearbyUsersMetaDM? get usersMeta => throw _privateConstructorUsedError;
  bool get isLoadingMoreUsers => throw _privateConstructorUsedError;
  bool get isLoadingUsers => throw _privateConstructorUsedError;
  UserSortMode get userSortMode =>
      throw _privateConstructorUsedError; // Buzz state
  List<BuzzItemDM> get buzzItems => throw _privateConstructorUsedError;
  BuzzMetaDM? get buzzMeta => throw _privateConstructorUsedError;
  bool get isLoadingMoreBuzz => throw _privateConstructorUsedError;
  bool get isLoadingBuzz => throw _privateConstructorUsedError;
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey =>
      throw _privateConstructorUsedError;

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialVMCopyWith<SocialVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialVMCopyWith<$Res> {
  factory $SocialVMCopyWith(SocialVM value, $Res Function(SocialVM) then) =
      _$SocialVMCopyWithImpl<$Res, SocialVM>;
  @useResult
  $Res call(
      {SocialPageViews currentView,
      List<PostDM> posts,
      PostsMetaDM? postsMeta,
      bool isLoadingMorePosts,
      bool isCreatingPost,
      PostsFeedFilter feedFilter,
      List<NearbyUserDM> nearbyUsers,
      NearbyUsersMetaDM? usersMeta,
      bool isLoadingMoreUsers,
      bool isLoadingUsers,
      UserSortMode userSortMode,
      List<BuzzItemDM> buzzItems,
      BuzzMetaDM? buzzMeta,
      bool isLoadingMoreBuzz,
      bool isLoadingBuzz,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey});

  $PostsMetaDMCopyWith<$Res>? get postsMeta;
  $NearbyUsersMetaDMCopyWith<$Res>? get usersMeta;
  $BuzzMetaDMCopyWith<$Res>? get buzzMeta;
}

/// @nodoc
class _$SocialVMCopyWithImpl<$Res, $Val extends SocialVM>
    implements $SocialVMCopyWith<$Res> {
  _$SocialVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentView = null,
    Object? posts = null,
    Object? postsMeta = freezed,
    Object? isLoadingMorePosts = null,
    Object? isCreatingPost = null,
    Object? feedFilter = null,
    Object? nearbyUsers = null,
    Object? usersMeta = freezed,
    Object? isLoadingMoreUsers = null,
    Object? isLoadingUsers = null,
    Object? userSortMode = null,
    Object? buzzItems = null,
    Object? buzzMeta = freezed,
    Object? isLoadingMoreBuzz = null,
    Object? isLoadingBuzz = null,
    Object? floatingButtonKey = freezed,
  }) {
    return _then(_value.copyWith(
      currentView: null == currentView
          ? _value.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as SocialPageViews,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      postsMeta: freezed == postsMeta
          ? _value.postsMeta
          : postsMeta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
      isLoadingMorePosts: null == isLoadingMorePosts
          ? _value.isLoadingMorePosts
          : isLoadingMorePosts // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingPost: null == isCreatingPost
          ? _value.isCreatingPost
          : isCreatingPost // ignore: cast_nullable_to_non_nullable
              as bool,
      feedFilter: null == feedFilter
          ? _value.feedFilter
          : feedFilter // ignore: cast_nullable_to_non_nullable
              as PostsFeedFilter,
      nearbyUsers: null == nearbyUsers
          ? _value.nearbyUsers
          : nearbyUsers // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      usersMeta: freezed == usersMeta
          ? _value.usersMeta
          : usersMeta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
      isLoadingMoreUsers: null == isLoadingMoreUsers
          ? _value.isLoadingMoreUsers
          : isLoadingMoreUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUsers: null == isLoadingUsers
          ? _value.isLoadingUsers
          : isLoadingUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      userSortMode: null == userSortMode
          ? _value.userSortMode
          : userSortMode // ignore: cast_nullable_to_non_nullable
              as UserSortMode,
      buzzItems: null == buzzItems
          ? _value.buzzItems
          : buzzItems // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      buzzMeta: freezed == buzzMeta
          ? _value.buzzMeta
          : buzzMeta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
      isLoadingMoreBuzz: null == isLoadingMoreBuzz
          ? _value.isLoadingMoreBuzz
          : isLoadingMoreBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBuzz: null == isLoadingBuzz
          ? _value.isLoadingBuzz
          : isLoadingBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      floatingButtonKey: freezed == floatingButtonKey
          ? _value.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ) as $Val);
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<$Res>? get postsMeta {
    if (_value.postsMeta == null) {
      return null;
    }

    return $PostsMetaDMCopyWith<$Res>(_value.postsMeta!, (value) {
      return _then(_value.copyWith(postsMeta: value) as $Val);
    });
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<$Res>? get usersMeta {
    if (_value.usersMeta == null) {
      return null;
    }

    return $NearbyUsersMetaDMCopyWith<$Res>(_value.usersMeta!, (value) {
      return _then(_value.copyWith(usersMeta: value) as $Val);
    });
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<$Res>? get buzzMeta {
    if (_value.buzzMeta == null) {
      return null;
    }

    return $BuzzMetaDMCopyWith<$Res>(_value.buzzMeta!, (value) {
      return _then(_value.copyWith(buzzMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SocialVMImplCopyWith<$Res>
    implements $SocialVMCopyWith<$Res> {
  factory _$$SocialVMImplCopyWith(
          _$SocialVMImpl value, $Res Function(_$SocialVMImpl) then) =
      __$$SocialVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SocialPageViews currentView,
      List<PostDM> posts,
      PostsMetaDM? postsMeta,
      bool isLoadingMorePosts,
      bool isCreatingPost,
      PostsFeedFilter feedFilter,
      List<NearbyUserDM> nearbyUsers,
      NearbyUsersMetaDM? usersMeta,
      bool isLoadingMoreUsers,
      bool isLoadingUsers,
      UserSortMode userSortMode,
      List<BuzzItemDM> buzzItems,
      BuzzMetaDM? buzzMeta,
      bool isLoadingMoreBuzz,
      bool isLoadingBuzz,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey});

  @override
  $PostsMetaDMCopyWith<$Res>? get postsMeta;
  @override
  $NearbyUsersMetaDMCopyWith<$Res>? get usersMeta;
  @override
  $BuzzMetaDMCopyWith<$Res>? get buzzMeta;
}

/// @nodoc
class __$$SocialVMImplCopyWithImpl<$Res>
    extends _$SocialVMCopyWithImpl<$Res, _$SocialVMImpl>
    implements _$$SocialVMImplCopyWith<$Res> {
  __$$SocialVMImplCopyWithImpl(
      _$SocialVMImpl _value, $Res Function(_$SocialVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentView = null,
    Object? posts = null,
    Object? postsMeta = freezed,
    Object? isLoadingMorePosts = null,
    Object? isCreatingPost = null,
    Object? feedFilter = null,
    Object? nearbyUsers = null,
    Object? usersMeta = freezed,
    Object? isLoadingMoreUsers = null,
    Object? isLoadingUsers = null,
    Object? userSortMode = null,
    Object? buzzItems = null,
    Object? buzzMeta = freezed,
    Object? isLoadingMoreBuzz = null,
    Object? isLoadingBuzz = null,
    Object? floatingButtonKey = freezed,
  }) {
    return _then(_$SocialVMImpl(
      currentView: null == currentView
          ? _value.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as SocialPageViews,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      postsMeta: freezed == postsMeta
          ? _value.postsMeta
          : postsMeta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
      isLoadingMorePosts: null == isLoadingMorePosts
          ? _value.isLoadingMorePosts
          : isLoadingMorePosts // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingPost: null == isCreatingPost
          ? _value.isCreatingPost
          : isCreatingPost // ignore: cast_nullable_to_non_nullable
              as bool,
      feedFilter: null == feedFilter
          ? _value.feedFilter
          : feedFilter // ignore: cast_nullable_to_non_nullable
              as PostsFeedFilter,
      nearbyUsers: null == nearbyUsers
          ? _value._nearbyUsers
          : nearbyUsers // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      usersMeta: freezed == usersMeta
          ? _value.usersMeta
          : usersMeta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
      isLoadingMoreUsers: null == isLoadingMoreUsers
          ? _value.isLoadingMoreUsers
          : isLoadingMoreUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUsers: null == isLoadingUsers
          ? _value.isLoadingUsers
          : isLoadingUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      userSortMode: null == userSortMode
          ? _value.userSortMode
          : userSortMode // ignore: cast_nullable_to_non_nullable
              as UserSortMode,
      buzzItems: null == buzzItems
          ? _value._buzzItems
          : buzzItems // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      buzzMeta: freezed == buzzMeta
          ? _value.buzzMeta
          : buzzMeta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
      isLoadingMoreBuzz: null == isLoadingMoreBuzz
          ? _value.isLoadingMoreBuzz
          : isLoadingMoreBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBuzz: null == isLoadingBuzz
          ? _value.isLoadingBuzz
          : isLoadingBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      floatingButtonKey: freezed == floatingButtonKey
          ? _value.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ));
  }
}

/// @nodoc

class _$SocialVMImpl extends _SocialVM {
  const _$SocialVMImpl(
      {this.currentView = SocialPageViews.posts,
      final List<PostDM> posts = const [],
      this.postsMeta,
      this.isLoadingMorePosts = false,
      this.isCreatingPost = false,
      this.feedFilter = PostsFeedFilter.nearby,
      final List<NearbyUserDM> nearbyUsers = const [],
      this.usersMeta,
      this.isLoadingMoreUsers = false,
      this.isLoadingUsers = false,
      this.userSortMode = UserSortMode.active,
      final List<BuzzItemDM> buzzItems = const [],
      this.buzzMeta,
      this.isLoadingMoreBuzz = false,
      this.isLoadingBuzz = false,
      this.floatingButtonKey})
      : _posts = posts,
        _nearbyUsers = nearbyUsers,
        _buzzItems = buzzItems,
        super._();

  @override
  @JsonKey()
  final SocialPageViews currentView;
// Posts state
  final List<PostDM> _posts;
// Posts state
  @override
  @JsonKey()
  List<PostDM> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final PostsMetaDM? postsMeta;
  @override
  @JsonKey()
  final bool isLoadingMorePosts;
  @override
  @JsonKey()
  final bool isCreatingPost;
  @override
  @JsonKey()
  final PostsFeedFilter feedFilter;
// Users state
  final List<NearbyUserDM> _nearbyUsers;
// Users state
  @override
  @JsonKey()
  List<NearbyUserDM> get nearbyUsers {
    if (_nearbyUsers is EqualUnmodifiableListView) return _nearbyUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nearbyUsers);
  }

  @override
  final NearbyUsersMetaDM? usersMeta;
  @override
  @JsonKey()
  final bool isLoadingMoreUsers;
  @override
  @JsonKey()
  final bool isLoadingUsers;
  @override
  @JsonKey()
  final UserSortMode userSortMode;
// Buzz state
  final List<BuzzItemDM> _buzzItems;
// Buzz state
  @override
  @JsonKey()
  List<BuzzItemDM> get buzzItems {
    if (_buzzItems is EqualUnmodifiableListView) return _buzzItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buzzItems);
  }

  @override
  final BuzzMetaDM? buzzMeta;
  @override
  @JsonKey()
  final bool isLoadingMoreBuzz;
  @override
  @JsonKey()
  final bool isLoadingBuzz;
  @override
  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;

  @override
  String toString() {
    return 'SocialVM(currentView: $currentView, posts: $posts, postsMeta: $postsMeta, isLoadingMorePosts: $isLoadingMorePosts, isCreatingPost: $isCreatingPost, feedFilter: $feedFilter, nearbyUsers: $nearbyUsers, usersMeta: $usersMeta, isLoadingMoreUsers: $isLoadingMoreUsers, isLoadingUsers: $isLoadingUsers, userSortMode: $userSortMode, buzzItems: $buzzItems, buzzMeta: $buzzMeta, isLoadingMoreBuzz: $isLoadingMoreBuzz, isLoadingBuzz: $isLoadingBuzz, floatingButtonKey: $floatingButtonKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialVMImpl &&
            (identical(other.currentView, currentView) ||
                other.currentView == currentView) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.postsMeta, postsMeta) ||
                other.postsMeta == postsMeta) &&
            (identical(other.isLoadingMorePosts, isLoadingMorePosts) ||
                other.isLoadingMorePosts == isLoadingMorePosts) &&
            (identical(other.isCreatingPost, isCreatingPost) ||
                other.isCreatingPost == isCreatingPost) &&
            (identical(other.feedFilter, feedFilter) ||
                other.feedFilter == feedFilter) &&
            const DeepCollectionEquality()
                .equals(other._nearbyUsers, _nearbyUsers) &&
            (identical(other.usersMeta, usersMeta) ||
                other.usersMeta == usersMeta) &&
            (identical(other.isLoadingMoreUsers, isLoadingMoreUsers) ||
                other.isLoadingMoreUsers == isLoadingMoreUsers) &&
            (identical(other.isLoadingUsers, isLoadingUsers) ||
                other.isLoadingUsers == isLoadingUsers) &&
            (identical(other.userSortMode, userSortMode) ||
                other.userSortMode == userSortMode) &&
            const DeepCollectionEquality()
                .equals(other._buzzItems, _buzzItems) &&
            (identical(other.buzzMeta, buzzMeta) ||
                other.buzzMeta == buzzMeta) &&
            (identical(other.isLoadingMoreBuzz, isLoadingMoreBuzz) ||
                other.isLoadingMoreBuzz == isLoadingMoreBuzz) &&
            (identical(other.isLoadingBuzz, isLoadingBuzz) ||
                other.isLoadingBuzz == isLoadingBuzz) &&
            (identical(other.floatingButtonKey, floatingButtonKey) ||
                other.floatingButtonKey == floatingButtonKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentView,
      const DeepCollectionEquality().hash(_posts),
      postsMeta,
      isLoadingMorePosts,
      isCreatingPost,
      feedFilter,
      const DeepCollectionEquality().hash(_nearbyUsers),
      usersMeta,
      isLoadingMoreUsers,
      isLoadingUsers,
      userSortMode,
      const DeepCollectionEquality().hash(_buzzItems),
      buzzMeta,
      isLoadingMoreBuzz,
      isLoadingBuzz,
      floatingButtonKey);

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialVMImplCopyWith<_$SocialVMImpl> get copyWith =>
      __$$SocialVMImplCopyWithImpl<_$SocialVMImpl>(this, _$identity);
}

abstract class _SocialVM extends SocialVM {
  const factory _SocialVM(
          {final SocialPageViews currentView,
          final List<PostDM> posts,
          final PostsMetaDM? postsMeta,
          final bool isLoadingMorePosts,
          final bool isCreatingPost,
          final PostsFeedFilter feedFilter,
          final List<NearbyUserDM> nearbyUsers,
          final NearbyUsersMetaDM? usersMeta,
          final bool isLoadingMoreUsers,
          final bool isLoadingUsers,
          final UserSortMode userSortMode,
          final List<BuzzItemDM> buzzItems,
          final BuzzMetaDM? buzzMeta,
          final bool isLoadingMoreBuzz,
          final bool isLoadingBuzz,
          final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey}) =
      _$SocialVMImpl;
  const _SocialVM._() : super._();

  @override
  SocialPageViews get currentView; // Posts state
  @override
  List<PostDM> get posts;
  @override
  PostsMetaDM? get postsMeta;
  @override
  bool get isLoadingMorePosts;
  @override
  bool get isCreatingPost;
  @override
  PostsFeedFilter get feedFilter; // Users state
  @override
  List<NearbyUserDM> get nearbyUsers;
  @override
  NearbyUsersMetaDM? get usersMeta;
  @override
  bool get isLoadingMoreUsers;
  @override
  bool get isLoadingUsers;
  @override
  UserSortMode get userSortMode; // Buzz state
  @override
  List<BuzzItemDM> get buzzItems;
  @override
  BuzzMetaDM? get buzzMeta;
  @override
  bool get isLoadingMoreBuzz;
  @override
  bool get isLoadingBuzz;
  @override
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey;

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialVMImplCopyWith<_$SocialVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
