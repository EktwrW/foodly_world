// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buzz_item_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuzzResponseDM _$BuzzResponseDMFromJson(Map<String, dynamic> json) {
  return _BuzzResponseDM.fromJson(json);
}

/// @nodoc
mixin _$BuzzResponseDM {
  List<BuzzItemDM> get data => throw _privateConstructorUsedError;
  BuzzMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this BuzzResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuzzResponseDMCopyWith<BuzzResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuzzResponseDMCopyWith<$Res> {
  factory $BuzzResponseDMCopyWith(
          BuzzResponseDM value, $Res Function(BuzzResponseDM) then) =
      _$BuzzResponseDMCopyWithImpl<$Res, BuzzResponseDM>;
  @useResult
  $Res call({List<BuzzItemDM> data, BuzzMetaDM? meta});

  $BuzzMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$BuzzResponseDMCopyWithImpl<$Res, $Val extends BuzzResponseDM>
    implements $BuzzResponseDMCopyWith<$Res> {
  _$BuzzResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuzzResponseDM
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
              as List<BuzzItemDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
    ) as $Val);
  }

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuzzMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $BuzzMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BuzzResponseDMImplCopyWith<$Res>
    implements $BuzzResponseDMCopyWith<$Res> {
  factory _$$BuzzResponseDMImplCopyWith(_$BuzzResponseDMImpl value,
          $Res Function(_$BuzzResponseDMImpl) then) =
      __$$BuzzResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BuzzItemDM> data, BuzzMetaDM? meta});

  @override
  $BuzzMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$BuzzResponseDMImplCopyWithImpl<$Res>
    extends _$BuzzResponseDMCopyWithImpl<$Res, _$BuzzResponseDMImpl>
    implements _$$BuzzResponseDMImplCopyWith<$Res> {
  __$$BuzzResponseDMImplCopyWithImpl(
      _$BuzzResponseDMImpl _value, $Res Function(_$BuzzResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = freezed,
  }) {
    return _then(_$BuzzResponseDMImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuzzItemDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BuzzMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuzzResponseDMImpl implements _BuzzResponseDM {
  const _$BuzzResponseDMImpl(
      {final List<BuzzItemDM> data = const [], this.meta})
      : _data = data;

  factory _$BuzzResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuzzResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'BuzzResponseDM(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuzzResponseDMImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuzzResponseDMImplCopyWith<_$BuzzResponseDMImpl> get copyWith =>
      __$$BuzzResponseDMImplCopyWithImpl<_$BuzzResponseDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuzzResponseDMImplToJson(
      this,
    );
  }
}

abstract class _BuzzResponseDM implements BuzzResponseDM {
  const factory _BuzzResponseDM(
      {final List<BuzzItemDM> data,
      final BuzzMetaDM? meta}) = _$BuzzResponseDMImpl;

  factory _BuzzResponseDM.fromJson(Map<String, dynamic> json) =
      _$BuzzResponseDMImpl.fromJson;

  @override
  List<BuzzItemDM> get data;
  @override
  BuzzMetaDM? get meta;

  /// Create a copy of BuzzResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuzzResponseDMImplCopyWith<_$BuzzResponseDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuzzMetaDM _$BuzzMetaDMFromJson(Map<String, dynamic> json) {
  return _BuzzMetaDM.fromJson(json);
}

/// @nodoc
mixin _$BuzzMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this BuzzMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuzzMetaDMCopyWith<BuzzMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuzzMetaDMCopyWith<$Res> {
  factory $BuzzMetaDMCopyWith(
          BuzzMetaDM value, $Res Function(BuzzMetaDM) then) =
      _$BuzzMetaDMCopyWithImpl<$Res, BuzzMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$BuzzMetaDMCopyWithImpl<$Res, $Val extends BuzzMetaDM>
    implements $BuzzMetaDMCopyWith<$Res> {
  _$BuzzMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$BuzzMetaDMImplCopyWith<$Res>
    implements $BuzzMetaDMCopyWith<$Res> {
  factory _$$BuzzMetaDMImplCopyWith(
          _$BuzzMetaDMImpl value, $Res Function(_$BuzzMetaDMImpl) then) =
      __$$BuzzMetaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$$BuzzMetaDMImplCopyWithImpl<$Res>
    extends _$BuzzMetaDMCopyWithImpl<$Res, _$BuzzMetaDMImpl>
    implements _$$BuzzMetaDMImplCopyWith<$Res> {
  __$$BuzzMetaDMImplCopyWithImpl(
      _$BuzzMetaDMImpl _value, $Res Function(_$BuzzMetaDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$BuzzMetaDMImpl(
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
class _$BuzzMetaDMImpl implements _BuzzMetaDM {
  const _$BuzzMetaDMImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});

  factory _$BuzzMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuzzMetaDMImplFromJson(json);

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
    return 'BuzzMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuzzMetaDMImpl &&
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

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuzzMetaDMImplCopyWith<_$BuzzMetaDMImpl> get copyWith =>
      __$$BuzzMetaDMImplCopyWithImpl<_$BuzzMetaDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuzzMetaDMImplToJson(
      this,
    );
  }
}

abstract class _BuzzMetaDM implements BuzzMetaDM {
  const factory _BuzzMetaDM(
      {@JsonKey(name: 'current_page') final int currentPage,
      @JsonKey(name: 'last_page') final int lastPage,
      @JsonKey(name: 'per_page') final int perPage,
      final int total}) = _$BuzzMetaDMImpl;

  factory _BuzzMetaDM.fromJson(Map<String, dynamic> json) =
      _$BuzzMetaDMImpl.fromJson;

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

  /// Create a copy of BuzzMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuzzMetaDMImplCopyWith<_$BuzzMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuzzItemDM _$BuzzItemDMFromJson(Map<String, dynamic> json) {
  return _BuzzItemDM.fromJson(json);
}

/// @nodoc
mixin _$BuzzItemDM {
  String get uuid => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_type')
  String get subType => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_photo')
  String? get businessPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_name')
  String? get entityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BuzzItemDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuzzItemDMCopyWith<BuzzItemDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuzzItemDMCopyWith<$Res> {
  factory $BuzzItemDMCopyWith(
          BuzzItemDM value, $Res Function(BuzzItemDM) then) =
      _$BuzzItemDMCopyWithImpl<$Res, BuzzItemDM>;
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
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$BuzzItemDMCopyWithImpl<$Res, $Val extends BuzzItemDM>
    implements $BuzzItemDMCopyWith<$Res> {
  _$BuzzItemDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      subType: null == subType
          ? _value.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as String,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPhoto: freezed == businessPhoto
          ? _value.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      menuUuid: freezed == menuUuid
          ? _value.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuzzItemDMImplCopyWith<$Res>
    implements $BuzzItemDMCopyWith<$Res> {
  factory _$$BuzzItemDMImplCopyWith(
          _$BuzzItemDMImpl value, $Res Function(_$BuzzItemDMImpl) then) =
      __$$BuzzItemDMImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$BuzzItemDMImplCopyWithImpl<$Res>
    extends _$BuzzItemDMCopyWithImpl<$Res, _$BuzzItemDMImpl>
    implements _$$BuzzItemDMImplCopyWith<$Res> {
  __$$BuzzItemDMImplCopyWithImpl(
      _$BuzzItemDMImpl _value, $Res Function(_$BuzzItemDMImpl) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$BuzzItemDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      subType: null == subType
          ? _value.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as String,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPhoto: freezed == businessPhoto
          ? _value.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      menuUuid: freezed == menuUuid
          ? _value.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuzzItemDMImpl implements _BuzzItemDM {
  const _$BuzzItemDMImpl(
      {required this.uuid,
      this.message = '',
      @JsonKey(name: 'sub_type') this.subType = '',
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_photo') this.businessPhoto,
      @JsonKey(name: 'menu_uuid') this.menuUuid,
      @JsonKey(name: 'entity_name') this.entityName,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$BuzzItemDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuzzItemDMImplFromJson(json);

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

  @override
  String toString() {
    return 'BuzzItemDM(uuid: $uuid, message: $message, subType: $subType, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, menuUuid: $menuUuid, entityName: $entityName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuzzItemDMImpl &&
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
                other.createdAt == createdAt));
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
      createdAt);

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuzzItemDMImplCopyWith<_$BuzzItemDMImpl> get copyWith =>
      __$$BuzzItemDMImplCopyWithImpl<_$BuzzItemDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuzzItemDMImplToJson(
      this,
    );
  }
}

abstract class _BuzzItemDM implements BuzzItemDM {
  const factory _BuzzItemDM(
          {required final String uuid,
          final String message,
          @JsonKey(name: 'sub_type') final String subType,
          @JsonKey(name: 'business_uuid') final String? businessUuid,
          @JsonKey(name: 'business_name') final String businessName,
          @JsonKey(name: 'business_photo') final String? businessPhoto,
          @JsonKey(name: 'menu_uuid') final String? menuUuid,
          @JsonKey(name: 'entity_name') final String? entityName,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$BuzzItemDMImpl;

  factory _BuzzItemDM.fromJson(Map<String, dynamic> json) =
      _$BuzzItemDMImpl.fromJson;

  @override
  String get uuid;
  @override
  String get message;
  @override
  @JsonKey(name: 'sub_type')
  String get subType;
  @override
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @override
  @JsonKey(name: 'business_name')
  String get businessName;
  @override
  @JsonKey(name: 'business_photo')
  String? get businessPhoto;
  @override
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid;
  @override
  @JsonKey(name: 'entity_name')
  String? get entityName;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of BuzzItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuzzItemDMImplCopyWith<_$BuzzItemDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
