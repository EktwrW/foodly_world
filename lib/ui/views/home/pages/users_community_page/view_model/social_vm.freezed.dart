// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialVM {
  SocialPageViews get currentView; // Posts state
  List<PostDM> get posts;
  PostsMetaDM? get postsMeta;
  bool get isLoadingMorePosts;
  bool get isCreatingPost;
  PostsFeedFilter get feedFilter; // Users state
  List<NearbyUserDM> get nearbyUsers;
  NearbyUsersMetaDM? get usersMeta;
  bool get isLoadingMoreUsers;
  bool get isLoadingUsers;
  UserSortMode get userSortMode; // Buzz state
  List<BuzzItemDM> get buzzItems;
  BuzzMetaDM? get buzzMeta;
  bool get isLoadingMoreBuzz;
  bool get isLoadingBuzz;
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey;

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialVMCopyWith<SocialVM> get copyWith =>
      _$SocialVMCopyWithImpl<SocialVM>(this as SocialVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialVM &&
            (identical(other.currentView, currentView) ||
                other.currentView == currentView) &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            (identical(other.postsMeta, postsMeta) ||
                other.postsMeta == postsMeta) &&
            (identical(other.isLoadingMorePosts, isLoadingMorePosts) ||
                other.isLoadingMorePosts == isLoadingMorePosts) &&
            (identical(other.isCreatingPost, isCreatingPost) ||
                other.isCreatingPost == isCreatingPost) &&
            (identical(other.feedFilter, feedFilter) ||
                other.feedFilter == feedFilter) &&
            const DeepCollectionEquality()
                .equals(other.nearbyUsers, nearbyUsers) &&
            (identical(other.usersMeta, usersMeta) ||
                other.usersMeta == usersMeta) &&
            (identical(other.isLoadingMoreUsers, isLoadingMoreUsers) ||
                other.isLoadingMoreUsers == isLoadingMoreUsers) &&
            (identical(other.isLoadingUsers, isLoadingUsers) ||
                other.isLoadingUsers == isLoadingUsers) &&
            (identical(other.userSortMode, userSortMode) ||
                other.userSortMode == userSortMode) &&
            const DeepCollectionEquality().equals(other.buzzItems, buzzItems) &&
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
      const DeepCollectionEquality().hash(posts),
      postsMeta,
      isLoadingMorePosts,
      isCreatingPost,
      feedFilter,
      const DeepCollectionEquality().hash(nearbyUsers),
      usersMeta,
      isLoadingMoreUsers,
      isLoadingUsers,
      userSortMode,
      const DeepCollectionEquality().hash(buzzItems),
      buzzMeta,
      isLoadingMoreBuzz,
      isLoadingBuzz,
      floatingButtonKey);

  @override
  String toString() {
    return 'SocialVM(currentView: $currentView, posts: $posts, postsMeta: $postsMeta, isLoadingMorePosts: $isLoadingMorePosts, isCreatingPost: $isCreatingPost, feedFilter: $feedFilter, nearbyUsers: $nearbyUsers, usersMeta: $usersMeta, isLoadingMoreUsers: $isLoadingMoreUsers, isLoadingUsers: $isLoadingUsers, userSortMode: $userSortMode, buzzItems: $buzzItems, buzzMeta: $buzzMeta, isLoadingMoreBuzz: $isLoadingMoreBuzz, isLoadingBuzz: $isLoadingBuzz, floatingButtonKey: $floatingButtonKey)';
  }
}

/// @nodoc
abstract mixin class $SocialVMCopyWith<$Res> {
  factory $SocialVMCopyWith(SocialVM value, $Res Function(SocialVM) _then) =
      _$SocialVMCopyWithImpl;
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
class _$SocialVMCopyWithImpl<$Res> implements $SocialVMCopyWith<$Res> {
  _$SocialVMCopyWithImpl(this._self, this._then);

  final SocialVM _self;
  final $Res Function(SocialVM) _then;

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
    return _then(_self.copyWith(
      currentView: null == currentView
          ? _self.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as SocialPageViews,
      posts: null == posts
          ? _self.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      postsMeta: freezed == postsMeta
          ? _self.postsMeta
          : postsMeta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
      isLoadingMorePosts: null == isLoadingMorePosts
          ? _self.isLoadingMorePosts
          : isLoadingMorePosts // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingPost: null == isCreatingPost
          ? _self.isCreatingPost
          : isCreatingPost // ignore: cast_nullable_to_non_nullable
              as bool,
      feedFilter: null == feedFilter
          ? _self.feedFilter
          : feedFilter // ignore: cast_nullable_to_non_nullable
              as PostsFeedFilter,
      nearbyUsers: null == nearbyUsers
          ? _self.nearbyUsers
          : nearbyUsers // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      usersMeta: freezed == usersMeta
          ? _self.usersMeta
          : usersMeta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
      isLoadingMoreUsers: null == isLoadingMoreUsers
          ? _self.isLoadingMoreUsers
          : isLoadingMoreUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUsers: null == isLoadingUsers
          ? _self.isLoadingUsers
          : isLoadingUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      userSortMode: null == userSortMode
          ? _self.userSortMode
          : userSortMode // ignore: cast_nullable_to_non_nullable
              as UserSortMode,
      buzzItems: null == buzzItems
          ? _self.buzzItems
          : buzzItems // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      buzzMeta: freezed == buzzMeta
          ? _self.buzzMeta
          : buzzMeta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
      isLoadingMoreBuzz: null == isLoadingMoreBuzz
          ? _self.isLoadingMoreBuzz
          : isLoadingMoreBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBuzz: null == isLoadingBuzz
          ? _self.isLoadingBuzz
          : isLoadingBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      floatingButtonKey: freezed == floatingButtonKey
          ? _self.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ));
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<$Res>? get postsMeta {
    if (_self.postsMeta == null) {
      return null;
    }

    return $PostsMetaDMCopyWith<$Res>(_self.postsMeta!, (value) {
      return _then(_self.copyWith(postsMeta: value));
    });
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<$Res>? get usersMeta {
    if (_self.usersMeta == null) {
      return null;
    }

    return $NearbyUsersMetaDMCopyWith<$Res>(_self.usersMeta!, (value) {
      return _then(_self.copyWith(usersMeta: value));
    });
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<$Res>? get buzzMeta {
    if (_self.buzzMeta == null) {
      return null;
    }

    return $BuzzMetaDMCopyWith<$Res>(_self.buzzMeta!, (value) {
      return _then(_self.copyWith(buzzMeta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SocialVM].
extension SocialVMPatterns on SocialVM {
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
    TResult Function(_SocialVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialVM() when $default != null:
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
    TResult Function(_SocialVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialVM():
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
    TResult? Function(_SocialVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialVM() when $default != null:
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
            SocialPageViews currentView,
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
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SocialVM() when $default != null:
        return $default(
            _that.currentView,
            _that.posts,
            _that.postsMeta,
            _that.isLoadingMorePosts,
            _that.isCreatingPost,
            _that.feedFilter,
            _that.nearbyUsers,
            _that.usersMeta,
            _that.isLoadingMoreUsers,
            _that.isLoadingUsers,
            _that.userSortMode,
            _that.buzzItems,
            _that.buzzMeta,
            _that.isLoadingMoreBuzz,
            _that.isLoadingBuzz,
            _that.floatingButtonKey);
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
            SocialPageViews currentView,
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
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialVM():
        return $default(
            _that.currentView,
            _that.posts,
            _that.postsMeta,
            _that.isLoadingMorePosts,
            _that.isCreatingPost,
            _that.feedFilter,
            _that.nearbyUsers,
            _that.usersMeta,
            _that.isLoadingMoreUsers,
            _that.isLoadingUsers,
            _that.userSortMode,
            _that.buzzItems,
            _that.buzzMeta,
            _that.isLoadingMoreBuzz,
            _that.isLoadingBuzz,
            _that.floatingButtonKey);
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
            SocialPageViews currentView,
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
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SocialVM() when $default != null:
        return $default(
            _that.currentView,
            _that.posts,
            _that.postsMeta,
            _that.isLoadingMorePosts,
            _that.isCreatingPost,
            _that.feedFilter,
            _that.nearbyUsers,
            _that.usersMeta,
            _that.isLoadingMoreUsers,
            _that.isLoadingUsers,
            _that.userSortMode,
            _that.buzzItems,
            _that.buzzMeta,
            _that.isLoadingMoreBuzz,
            _that.isLoadingBuzz,
            _that.floatingButtonKey);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SocialVM extends SocialVM {
  const _SocialVM(
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

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialVMCopyWith<_SocialVM> get copyWith =>
      __$SocialVMCopyWithImpl<_SocialVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialVM &&
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

  @override
  String toString() {
    return 'SocialVM(currentView: $currentView, posts: $posts, postsMeta: $postsMeta, isLoadingMorePosts: $isLoadingMorePosts, isCreatingPost: $isCreatingPost, feedFilter: $feedFilter, nearbyUsers: $nearbyUsers, usersMeta: $usersMeta, isLoadingMoreUsers: $isLoadingMoreUsers, isLoadingUsers: $isLoadingUsers, userSortMode: $userSortMode, buzzItems: $buzzItems, buzzMeta: $buzzMeta, isLoadingMoreBuzz: $isLoadingMoreBuzz, isLoadingBuzz: $isLoadingBuzz, floatingButtonKey: $floatingButtonKey)';
  }
}

/// @nodoc
abstract mixin class _$SocialVMCopyWith<$Res>
    implements $SocialVMCopyWith<$Res> {
  factory _$SocialVMCopyWith(_SocialVM value, $Res Function(_SocialVM) _then) =
      __$SocialVMCopyWithImpl;
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
class __$SocialVMCopyWithImpl<$Res> implements _$SocialVMCopyWith<$Res> {
  __$SocialVMCopyWithImpl(this._self, this._then);

  final _SocialVM _self;
  final $Res Function(_SocialVM) _then;

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_SocialVM(
      currentView: null == currentView
          ? _self.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as SocialPageViews,
      posts: null == posts
          ? _self._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostDM>,
      postsMeta: freezed == postsMeta
          ? _self.postsMeta
          : postsMeta // ignore: cast_nullable_to_non_nullable
              as PostsMetaDM?,
      isLoadingMorePosts: null == isLoadingMorePosts
          ? _self.isLoadingMorePosts
          : isLoadingMorePosts // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingPost: null == isCreatingPost
          ? _self.isCreatingPost
          : isCreatingPost // ignore: cast_nullable_to_non_nullable
              as bool,
      feedFilter: null == feedFilter
          ? _self.feedFilter
          : feedFilter // ignore: cast_nullable_to_non_nullable
              as PostsFeedFilter,
      nearbyUsers: null == nearbyUsers
          ? _self._nearbyUsers
          : nearbyUsers // ignore: cast_nullable_to_non_nullable
              as List<NearbyUserDM>,
      usersMeta: freezed == usersMeta
          ? _self.usersMeta
          : usersMeta // ignore: cast_nullable_to_non_nullable
              as NearbyUsersMetaDM?,
      isLoadingMoreUsers: null == isLoadingMoreUsers
          ? _self.isLoadingMoreUsers
          : isLoadingMoreUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUsers: null == isLoadingUsers
          ? _self.isLoadingUsers
          : isLoadingUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      userSortMode: null == userSortMode
          ? _self.userSortMode
          : userSortMode // ignore: cast_nullable_to_non_nullable
              as UserSortMode,
      buzzItems: null == buzzItems
          ? _self._buzzItems
          : buzzItems // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      buzzMeta: freezed == buzzMeta
          ? _self.buzzMeta
          : buzzMeta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
      isLoadingMoreBuzz: null == isLoadingMoreBuzz
          ? _self.isLoadingMoreBuzz
          : isLoadingMoreBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBuzz: null == isLoadingBuzz
          ? _self.isLoadingBuzz
          : isLoadingBuzz // ignore: cast_nullable_to_non_nullable
              as bool,
      floatingButtonKey: freezed == floatingButtonKey
          ? _self.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ));
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsMetaDMCopyWith<$Res>? get postsMeta {
    if (_self.postsMeta == null) {
      return null;
    }

    return $PostsMetaDMCopyWith<$Res>(_self.postsMeta!, (value) {
      return _then(_self.copyWith(postsMeta: value));
    });
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearbyUsersMetaDMCopyWith<$Res>? get usersMeta {
    if (_self.usersMeta == null) {
      return null;
    }

    return $NearbyUsersMetaDMCopyWith<$Res>(_self.usersMeta!, (value) {
      return _then(_self.copyWith(usersMeta: value));
    });
  }

  /// Create a copy of SocialVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<$Res>? get buzzMeta {
    if (_self.buzzMeta == null) {
      return null;
    }

    return $BuzzMetaDMCopyWith<$Res>(_self.buzzMeta!, (value) {
      return _then(_self.copyWith(buzzMeta: value));
    });
  }
}

// dart format on
