// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_promotions_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedPromoBusinessDM _$SavedPromoBusinessDMFromJson(Map<String, dynamic> json) {
  return _SavedPromoBusinessDM.fromJson(json);
}

/// @nodoc
mixin _$SavedPromoBusinessDM {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_image_path')
  String? get categoryImagePath => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // "open" | "closed" | "opening_soon"
  @JsonKey(name: 'hours_display')
  String? get hoursDisplay => throw _privateConstructorUsedError;

  /// Serializes this SavedPromoBusinessDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPromoBusinessDMCopyWith<SavedPromoBusinessDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPromoBusinessDMCopyWith<$Res> {
  factory $SavedPromoBusinessDMCopyWith(SavedPromoBusinessDM value,
          $Res Function(SavedPromoBusinessDM) then) =
      _$SavedPromoBusinessDMCopyWithImpl<$Res, SavedPromoBusinessDM>;
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
class _$SavedPromoBusinessDMCopyWithImpl<$Res,
        $Val extends SavedPromoBusinessDM>
    implements $SavedPromoBusinessDMCopyWith<$Res> {
  _$SavedPromoBusinessDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _value.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      hoursDisplay: freezed == hoursDisplay
          ? _value.hoursDisplay
          : hoursDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedPromoBusinessDMImplCopyWith<$Res>
    implements $SavedPromoBusinessDMCopyWith<$Res> {
  factory _$$SavedPromoBusinessDMImplCopyWith(_$SavedPromoBusinessDMImpl value,
          $Res Function(_$SavedPromoBusinessDMImpl) then) =
      __$$SavedPromoBusinessDMImplCopyWithImpl<$Res>;
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
class __$$SavedPromoBusinessDMImplCopyWithImpl<$Res>
    extends _$SavedPromoBusinessDMCopyWithImpl<$Res, _$SavedPromoBusinessDMImpl>
    implements _$$SavedPromoBusinessDMImplCopyWith<$Res> {
  __$$SavedPromoBusinessDMImplCopyWithImpl(_$SavedPromoBusinessDMImpl _value,
      $Res Function(_$SavedPromoBusinessDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$SavedPromoBusinessDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImagePath: freezed == categoryImagePath
          ? _value.categoryImagePath
          : categoryImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      hoursDisplay: freezed == hoursDisplay
          ? _value.hoursDisplay
          : hoursDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedPromoBusinessDMImpl implements _SavedPromoBusinessDM {
  const _$SavedPromoBusinessDMImpl(
      {required this.uuid,
      required this.name,
      this.logo,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_image_path') this.categoryImagePath,
      this.status = 'closed',
      @JsonKey(name: 'hours_display') this.hoursDisplay});

  factory _$SavedPromoBusinessDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPromoBusinessDMImplFromJson(json);

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

  @override
  String toString() {
    return 'SavedPromoBusinessDM(uuid: $uuid, name: $name, logo: $logo, categoryId: $categoryId, categoryName: $categoryName, categoryImagePath: $categoryImagePath, status: $status, hoursDisplay: $hoursDisplay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPromoBusinessDMImpl &&
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

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPromoBusinessDMImplCopyWith<_$SavedPromoBusinessDMImpl>
      get copyWith =>
          __$$SavedPromoBusinessDMImplCopyWithImpl<_$SavedPromoBusinessDMImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPromoBusinessDMImplToJson(
      this,
    );
  }
}

abstract class _SavedPromoBusinessDM implements SavedPromoBusinessDM {
  const factory _SavedPromoBusinessDM(
          {required final String uuid,
          required final String name,
          final String? logo,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'category_name') final String? categoryName,
          @JsonKey(name: 'category_image_path') final String? categoryImagePath,
          final String status,
          @JsonKey(name: 'hours_display') final String? hoursDisplay}) =
      _$SavedPromoBusinessDMImpl;

  factory _SavedPromoBusinessDM.fromJson(Map<String, dynamic> json) =
      _$SavedPromoBusinessDMImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String? get logo;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_image_path')
  String? get categoryImagePath;
  @override
  String get status; // "open" | "closed" | "opening_soon"
  @override
  @JsonKey(name: 'hours_display')
  String? get hoursDisplay;

  /// Create a copy of SavedPromoBusinessDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPromoBusinessDMImplCopyWith<_$SavedPromoBusinessDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SavedPromotionsResponseDM _$SavedPromotionsResponseDMFromJson(
    Map<String, dynamic> json) {
  return _SavedPromotionsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$SavedPromotionsResponseDM {
  List<NearbyPromotionDM> get data => throw _privateConstructorUsedError;
  List<SavedPromoBusinessDM> get businesses =>
      throw _privateConstructorUsedError;
  SavedPromosMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this SavedPromotionsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPromotionsResponseDMCopyWith<SavedPromotionsResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPromotionsResponseDMCopyWith<$Res> {
  factory $SavedPromotionsResponseDMCopyWith(SavedPromotionsResponseDM value,
          $Res Function(SavedPromotionsResponseDM) then) =
      _$SavedPromotionsResponseDMCopyWithImpl<$Res, SavedPromotionsResponseDM>;
  @useResult
  $Res call(
      {List<NearbyPromotionDM> data,
      List<SavedPromoBusinessDM> businesses,
      SavedPromosMeta? meta});

  $SavedPromosMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$SavedPromotionsResponseDMCopyWithImpl<$Res,
        $Val extends SavedPromotionsResponseDM>
    implements $SavedPromotionsResponseDMCopyWith<$Res> {
  _$SavedPromotionsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? businesses = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      businesses: null == businesses
          ? _value.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<SavedPromoBusinessDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SavedPromosMeta?,
    ) as $Val);
  }

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedPromosMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $SavedPromosMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedPromotionsResponseDMImplCopyWith<$Res>
    implements $SavedPromotionsResponseDMCopyWith<$Res> {
  factory _$$SavedPromotionsResponseDMImplCopyWith(
          _$SavedPromotionsResponseDMImpl value,
          $Res Function(_$SavedPromotionsResponseDMImpl) then) =
      __$$SavedPromotionsResponseDMImplCopyWithImpl<$Res>;
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
class __$$SavedPromotionsResponseDMImplCopyWithImpl<$Res>
    extends _$SavedPromotionsResponseDMCopyWithImpl<$Res,
        _$SavedPromotionsResponseDMImpl>
    implements _$$SavedPromotionsResponseDMImplCopyWith<$Res> {
  __$$SavedPromotionsResponseDMImplCopyWithImpl(
      _$SavedPromotionsResponseDMImpl _value,
      $Res Function(_$SavedPromotionsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? businesses = null,
    Object? meta = freezed,
  }) {
    return _then(_$SavedPromotionsResponseDMImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      businesses: null == businesses
          ? _value._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<SavedPromoBusinessDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SavedPromosMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedPromotionsResponseDMImpl implements _SavedPromotionsResponseDM {
  const _$SavedPromotionsResponseDMImpl(
      {final List<NearbyPromotionDM> data = const [],
      final List<SavedPromoBusinessDM> businesses = const [],
      this.meta})
      : _data = data,
        _businesses = businesses;

  factory _$SavedPromotionsResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPromotionsResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'SavedPromotionsResponseDM(data: $data, businesses: $businesses, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPromotionsResponseDMImpl &&
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

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPromotionsResponseDMImplCopyWith<_$SavedPromotionsResponseDMImpl>
      get copyWith => __$$SavedPromotionsResponseDMImplCopyWithImpl<
          _$SavedPromotionsResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPromotionsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _SavedPromotionsResponseDM implements SavedPromotionsResponseDM {
  const factory _SavedPromotionsResponseDM(
      {final List<NearbyPromotionDM> data,
      final List<SavedPromoBusinessDM> businesses,
      final SavedPromosMeta? meta}) = _$SavedPromotionsResponseDMImpl;

  factory _SavedPromotionsResponseDM.fromJson(Map<String, dynamic> json) =
      _$SavedPromotionsResponseDMImpl.fromJson;

  @override
  List<NearbyPromotionDM> get data;
  @override
  List<SavedPromoBusinessDM> get businesses;
  @override
  SavedPromosMeta? get meta;

  /// Create a copy of SavedPromotionsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPromotionsResponseDMImplCopyWith<_$SavedPromotionsResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SavedPromosMeta _$SavedPromosMetaFromJson(Map<String, dynamic> json) {
  return _SavedPromosMeta.fromJson(json);
}

/// @nodoc
mixin _$SavedPromosMeta {
  int get total => throw _privateConstructorUsedError;

  /// Serializes this SavedPromosMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPromosMetaCopyWith<SavedPromosMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPromosMetaCopyWith<$Res> {
  factory $SavedPromosMetaCopyWith(
          SavedPromosMeta value, $Res Function(SavedPromosMeta) then) =
      _$SavedPromosMetaCopyWithImpl<$Res, SavedPromosMeta>;
  @useResult
  $Res call({int total});
}

/// @nodoc
class _$SavedPromosMetaCopyWithImpl<$Res, $Val extends SavedPromosMeta>
    implements $SavedPromosMetaCopyWith<$Res> {
  _$SavedPromosMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedPromosMetaImplCopyWith<$Res>
    implements $SavedPromosMetaCopyWith<$Res> {
  factory _$$SavedPromosMetaImplCopyWith(_$SavedPromosMetaImpl value,
          $Res Function(_$SavedPromosMetaImpl) then) =
      __$$SavedPromosMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$$SavedPromosMetaImplCopyWithImpl<$Res>
    extends _$SavedPromosMetaCopyWithImpl<$Res, _$SavedPromosMetaImpl>
    implements _$$SavedPromosMetaImplCopyWith<$Res> {
  __$$SavedPromosMetaImplCopyWithImpl(
      _$SavedPromosMetaImpl _value, $Res Function(_$SavedPromosMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$SavedPromosMetaImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedPromosMetaImpl implements _SavedPromosMeta {
  const _$SavedPromosMetaImpl({this.total = 0});

  factory _$SavedPromosMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPromosMetaImplFromJson(json);

  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'SavedPromosMeta(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPromosMetaImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPromosMetaImplCopyWith<_$SavedPromosMetaImpl> get copyWith =>
      __$$SavedPromosMetaImplCopyWithImpl<_$SavedPromosMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPromosMetaImplToJson(
      this,
    );
  }
}

abstract class _SavedPromosMeta implements SavedPromosMeta {
  const factory _SavedPromosMeta({final int total}) = _$SavedPromosMetaImpl;

  factory _SavedPromosMeta.fromJson(Map<String, dynamic> json) =
      _$SavedPromosMetaImpl.fromJson;

  @override
  int get total;

  /// Create a copy of SavedPromosMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPromosMetaImplCopyWith<_$SavedPromosMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
