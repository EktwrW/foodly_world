// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_promotions_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedPromoBusinessDM {
  String get uuid;
  String get name;
  String? get logo;
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @JsonKey(name: 'category_image_path')
  String? get categoryImagePath;
  String get status; // "open" | "closed" | "opening_soon"
  @JsonKey(name: 'hours_display')
  String? get hoursDisplay;

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedPromoBusinessDMCopyWith<SavedPromoBusinessDM> get copyWith =>
      _$SavedPromoBusinessDMCopyWithImpl<SavedPromoBusinessDM>(
          this as SavedPromoBusinessDM, _$identity);

  /// Serializes this SavedPromoBusinessDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedPromoBusinessDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImagePath, categoryImagePath) ||
                other.categoryImagePath == categoryImagePath) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hoursDisplay, hoursDisplay) ||
                other.hoursDisplay == hoursDisplay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, logo, categoryId,
      categoryName, categoryImagePath, status, hoursDisplay);

  @override
  String toString() {
    return 'SavedPromoBusinessDM(uuid: $uuid, name: $name, logo: $logo, categoryId: $categoryId, categoryName: $categoryName, categoryImagePath: $categoryImagePath, status: $status, hoursDisplay: $hoursDisplay)';
  }
}

/// @nodoc
abstract mixin class $SavedPromoBusinessDMCopyWith<$Res> {
  factory $SavedPromoBusinessDMCopyWith(SavedPromoBusinessDM value,
          $Res Function(SavedPromoBusinessDM) _then) =
      _$SavedPromoBusinessDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? logo,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image_path') String? categoryImagePath,
      String status,
      @JsonKey(name: 'hours_display') String? hoursDisplay});
}

/// @nodoc
class _$SavedPromoBusinessDMCopyWithImpl<$Res>
    implements $SavedPromoBusinessDMCopyWith<$Res> {
  _$SavedPromoBusinessDMCopyWithImpl(this._self, this._then);

  final SavedPromoBusinessDM _self;
  final $Res Function(SavedPromoBusinessDM) _then;

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? logo = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryImagePath = freezed,
    Object? status = null,
    Object? hoursDisplay = freezed,
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
      logo: freezed == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _self.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      hoursDisplay: freezed == hoursDisplay
          ? _self.hoursDisplay
          : hoursDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SavedPromoBusinessDM].
extension SavedPromoBusinessDMPatterns on SavedPromoBusinessDM {
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
    TResult Function(_SavedPromoBusinessDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedPromoBusinessDM() when $default != null:
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
    TResult Function(_SavedPromoBusinessDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromoBusinessDM():
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
    TResult? Function(_SavedPromoBusinessDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromoBusinessDM() when $default != null:
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
            String? logo,
            @JsonKey(name: 'category_id') int? categoryId,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_image_path') String? categoryImagePath,
            String status,
            @JsonKey(name: 'hours_display') String? hoursDisplay)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedPromoBusinessDM() when $default != null:
        return $default(
            _that.uuid,
            _that.name,
            _that.logo,
            _that.categoryId,
            _that.categoryName,
            _that.categoryImagePath,
            _that.status,
            _that.hoursDisplay);
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
            String? logo,
            @JsonKey(name: 'category_id') int? categoryId,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_image_path') String? categoryImagePath,
            String status,
            @JsonKey(name: 'hours_display') String? hoursDisplay)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromoBusinessDM():
        return $default(
            _that.uuid,
            _that.name,
            _that.logo,
            _that.categoryId,
            _that.categoryName,
            _that.categoryImagePath,
            _that.status,
            _that.hoursDisplay);
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
            String? logo,
            @JsonKey(name: 'category_id') int? categoryId,
            @JsonKey(name: 'category_name') String? categoryName,
            @JsonKey(name: 'category_image_path') String? categoryImagePath,
            String status,
            @JsonKey(name: 'hours_display') String? hoursDisplay)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromoBusinessDM() when $default != null:
        return $default(
            _that.uuid,
            _that.name,
            _that.logo,
            _that.categoryId,
            _that.categoryName,
            _that.categoryImagePath,
            _that.status,
            _that.hoursDisplay);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SavedPromoBusinessDM extends SavedPromoBusinessDM {
  const _SavedPromoBusinessDM(
      {required this.uuid,
      required this.name,
      this.logo,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_image_path') this.categoryImagePath,
      this.status = 'closed',
      @JsonKey(name: 'hours_display') this.hoursDisplay})
      : super._();
  factory _SavedPromoBusinessDM.fromJson(Map<String, dynamic> json) =>
      _$SavedPromoBusinessDMFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String? logo;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_image_path')
  final String? categoryImagePath;
  @override
  @JsonKey()
  final String status;
// "open" | "closed" | "opening_soon"
  @override
  @JsonKey(name: 'hours_display')
  final String? hoursDisplay;

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedPromoBusinessDMCopyWith<_SavedPromoBusinessDM> get copyWith =>
      __$SavedPromoBusinessDMCopyWithImpl<_SavedPromoBusinessDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedPromoBusinessDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedPromoBusinessDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImagePath, categoryImagePath) ||
                other.categoryImagePath == categoryImagePath) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hoursDisplay, hoursDisplay) ||
                other.hoursDisplay == hoursDisplay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, logo, categoryId,
      categoryName, categoryImagePath, status, hoursDisplay);

  @override
  String toString() {
    return 'SavedPromoBusinessDM(uuid: $uuid, name: $name, logo: $logo, categoryId: $categoryId, categoryName: $categoryName, categoryImagePath: $categoryImagePath, status: $status, hoursDisplay: $hoursDisplay)';
  }
}

/// @nodoc
abstract mixin class _$SavedPromoBusinessDMCopyWith<$Res>
    implements $SavedPromoBusinessDMCopyWith<$Res> {
  factory _$SavedPromoBusinessDMCopyWith(_SavedPromoBusinessDM value,
          $Res Function(_SavedPromoBusinessDM) _then) =
      __$SavedPromoBusinessDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? logo,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image_path') String? categoryImagePath,
      String status,
      @JsonKey(name: 'hours_display') String? hoursDisplay});
}

/// @nodoc
class __$SavedPromoBusinessDMCopyWithImpl<$Res>
    implements _$SavedPromoBusinessDMCopyWith<$Res> {
  __$SavedPromoBusinessDMCopyWithImpl(this._self, this._then);

  final _SavedPromoBusinessDM _self;
  final $Res Function(_SavedPromoBusinessDM) _then;

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? logo = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryImagePath = freezed,
    Object? status = null,
    Object? hoursDisplay = freezed,
  }) {
    return _then(_SavedPromoBusinessDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _self.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      hoursDisplay: freezed == hoursDisplay
          ? _self.hoursDisplay
          : hoursDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SavedPromotionsResponseDM {
  List<NearbyPromotionDM> get data;
  List<SavedPromoBusinessDM> get businesses;
  SavedPromosMeta? get meta;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedPromotionsResponseDMCopyWith<SavedPromotionsResponseDM> get copyWith =>
      _$SavedPromotionsResponseDMCopyWithImpl<SavedPromotionsResponseDM>(
          this as SavedPromotionsResponseDM, _$identity);

  /// Serializes this SavedPromotionsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedPromotionsResponseDM &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.businesses, businesses) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(businesses),
      meta);

  @override
  String toString() {
    return 'SavedPromotionsResponseDM(data: $data, businesses: $businesses, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $SavedPromotionsResponseDMCopyWith<$Res> {
  factory $SavedPromotionsResponseDMCopyWith(SavedPromotionsResponseDM value,
          $Res Function(SavedPromotionsResponseDM) _then) =
      _$SavedPromotionsResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {List<NearbyPromotionDM> data,
      List<SavedPromoBusinessDM> businesses,
      SavedPromosMeta? meta});

  $SavedPromosMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$SavedPromotionsResponseDMCopyWithImpl<$Res>
    implements $SavedPromotionsResponseDMCopyWith<$Res> {
  _$SavedPromotionsResponseDMCopyWithImpl(this._self, this._then);

  final SavedPromotionsResponseDM _self;
  final $Res Function(SavedPromotionsResponseDM) _then;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? businesses = null,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      businesses: null == businesses
          ? _self.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<SavedPromoBusinessDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SavedPromosMeta?,
    ));
  }

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedPromosMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $SavedPromosMetaCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SavedPromotionsResponseDM].
extension SavedPromotionsResponseDMPatterns on SavedPromotionsResponseDM {
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
    TResult Function(_SavedPromotionsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedPromotionsResponseDM() when $default != null:
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
    TResult Function(_SavedPromotionsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromotionsResponseDM():
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
    TResult? Function(_SavedPromotionsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromotionsResponseDM() when $default != null:
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
    TResult Function(List<NearbyPromotionDM> data,
            List<SavedPromoBusinessDM> businesses, SavedPromosMeta? meta)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedPromotionsResponseDM() when $default != null:
        return $default(_that.data, _that.businesses, _that.meta);
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
    TResult Function(List<NearbyPromotionDM> data,
            List<SavedPromoBusinessDM> businesses, SavedPromosMeta? meta)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromotionsResponseDM():
        return $default(_that.data, _that.businesses, _that.meta);
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
    TResult? Function(List<NearbyPromotionDM> data,
            List<SavedPromoBusinessDM> businesses, SavedPromosMeta? meta)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromotionsResponseDM() when $default != null:
        return $default(_that.data, _that.businesses, _that.meta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SavedPromotionsResponseDM implements SavedPromotionsResponseDM {
  const _SavedPromotionsResponseDM(
      {final List<NearbyPromotionDM> data = const [],
      final List<SavedPromoBusinessDM> businesses = const [],
      this.meta})
      : _data = data,
        _businesses = businesses;
  factory _SavedPromotionsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$SavedPromotionsResponseDMFromJson(json);

  final List<NearbyPromotionDM> _data;
  @override
  @JsonKey()
  List<NearbyPromotionDM> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<SavedPromoBusinessDM> _businesses;
  @override
  @JsonKey()
  List<SavedPromoBusinessDM> get businesses {
    if (_businesses is EqualUnmodifiableListView) return _businesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businesses);
  }

  @override
  final SavedPromosMeta? meta;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedPromotionsResponseDMCopyWith<_SavedPromotionsResponseDM>
      get copyWith =>
          __$SavedPromotionsResponseDMCopyWithImpl<_SavedPromotionsResponseDM>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedPromotionsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedPromotionsResponseDM &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._businesses, _businesses) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_businesses),
      meta);

  @override
  String toString() {
    return 'SavedPromotionsResponseDM(data: $data, businesses: $businesses, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$SavedPromotionsResponseDMCopyWith<$Res>
    implements $SavedPromotionsResponseDMCopyWith<$Res> {
  factory _$SavedPromotionsResponseDMCopyWith(_SavedPromotionsResponseDM value,
          $Res Function(_SavedPromotionsResponseDM) _then) =
      __$SavedPromotionsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NearbyPromotionDM> data,
      List<SavedPromoBusinessDM> businesses,
      SavedPromosMeta? meta});

  @override
  $SavedPromosMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$SavedPromotionsResponseDMCopyWithImpl<$Res>
    implements _$SavedPromotionsResponseDMCopyWith<$Res> {
  __$SavedPromotionsResponseDMCopyWithImpl(this._self, this._then);

  final _SavedPromotionsResponseDM _self;
  final $Res Function(_SavedPromotionsResponseDM) _then;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? businesses = null,
    Object? meta = freezed,
  }) {
    return _then(_SavedPromotionsResponseDM(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      businesses: null == businesses
          ? _self._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<SavedPromoBusinessDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SavedPromosMeta?,
    ));
  }

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedPromosMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $SavedPromosMetaCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$SavedPromosMeta {
  int get total;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedPromosMetaCopyWith<SavedPromosMeta> get copyWith =>
      _$SavedPromosMetaCopyWithImpl<SavedPromosMeta>(
          this as SavedPromosMeta, _$identity);

  /// Serializes this SavedPromosMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedPromosMeta &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  @override
  String toString() {
    return 'SavedPromosMeta(total: $total)';
  }
}

/// @nodoc
abstract mixin class $SavedPromosMetaCopyWith<$Res> {
  factory $SavedPromosMetaCopyWith(
          SavedPromosMeta value, $Res Function(SavedPromosMeta) _then) =
      _$SavedPromosMetaCopyWithImpl;
  @useResult
  $Res call({int total});
}

/// @nodoc
class _$SavedPromosMetaCopyWithImpl<$Res>
    implements $SavedPromosMetaCopyWith<$Res> {
  _$SavedPromosMetaCopyWithImpl(this._self, this._then);

  final SavedPromosMeta _self;
  final $Res Function(SavedPromosMeta) _then;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SavedPromosMeta].
extension SavedPromosMetaPatterns on SavedPromosMeta {
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
    TResult Function(_SavedPromosMeta value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedPromosMeta() when $default != null:
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
    TResult Function(_SavedPromosMeta value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromosMeta():
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
    TResult? Function(_SavedPromosMeta value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromosMeta() when $default != null:
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
    TResult Function(int total)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedPromosMeta() when $default != null:
        return $default(_that.total);
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
    TResult Function(int total) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromosMeta():
        return $default(_that.total);
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
    TResult? Function(int total)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedPromosMeta() when $default != null:
        return $default(_that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SavedPromosMeta implements SavedPromosMeta {
  const _SavedPromosMeta({this.total = 0});
  factory _SavedPromosMeta.fromJson(Map<String, dynamic> json) =>
      _$SavedPromosMetaFromJson(json);

  @override
  @JsonKey()
  final int total;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedPromosMetaCopyWith<_SavedPromosMeta> get copyWith =>
      __$SavedPromosMetaCopyWithImpl<_SavedPromosMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedPromosMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedPromosMeta &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  @override
  String toString() {
    return 'SavedPromosMeta(total: $total)';
  }
}

/// @nodoc
abstract mixin class _$SavedPromosMetaCopyWith<$Res>
    implements $SavedPromosMetaCopyWith<$Res> {
  factory _$SavedPromosMetaCopyWith(
          _SavedPromosMeta value, $Res Function(_SavedPromosMeta) _then) =
      __$SavedPromosMetaCopyWithImpl;
  @override
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$SavedPromosMetaCopyWithImpl<$Res>
    implements _$SavedPromosMetaCopyWith<$Res> {
  __$SavedPromosMetaCopyWithImpl(this._self, this._then);

  final _SavedPromosMeta _self;
  final $Res Function(_SavedPromosMeta) _then;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
  }) {
    return _then(_SavedPromosMeta(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
