// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuResponse {
  @JsonKey(name: 'menu')
  MenuDM get menuDM => throw _privateConstructorUsedError;

  /// Serializes this MenuResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res, MenuResponse>;
  @useResult
  $Res call({@JsonKey(name: 'menu') MenuDM menuDM});

  $MenuDMCopyWith<$Res> get menuDM;
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res, $Val extends MenuResponse>
    implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuDM = null,
  }) {
    return _then(_value.copyWith(
      menuDM: null == menuDM
          ? _value.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ) as $Val);
  }

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res> get menuDM {
    return $MenuDMCopyWith<$Res>(_value.menuDM, (value) {
      return _then(_value.copyWith(menuDM: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuResponseImplCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$$MenuResponseImplCopyWith(
          _$MenuResponseImpl value, $Res Function(_$MenuResponseImpl) then) =
      __$$MenuResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'menu') MenuDM menuDM});

  @override
  $MenuDMCopyWith<$Res> get menuDM;
}

/// @nodoc
class __$$MenuResponseImplCopyWithImpl<$Res>
    extends _$MenuResponseCopyWithImpl<$Res, _$MenuResponseImpl>
    implements _$$MenuResponseImplCopyWith<$Res> {
  __$$MenuResponseImplCopyWithImpl(
      _$MenuResponseImpl _value, $Res Function(_$MenuResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuDM = null,
  }) {
    return _then(_$MenuResponseImpl(
      menuDM: null == menuDM
          ? _value.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuResponseImpl implements _MenuResponse {
  _$MenuResponseImpl({@JsonKey(name: 'menu') required this.menuDM});

  factory _$MenuResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuResponseImplFromJson(json);

  @override
  @JsonKey(name: 'menu')
  final MenuDM menuDM;

  @override
  String toString() {
    return 'MenuResponse(menuDM: $menuDM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuResponseImpl &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, menuDM);

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuResponseImplCopyWith<_$MenuResponseImpl> get copyWith =>
      __$$MenuResponseImplCopyWithImpl<_$MenuResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuResponseImplToJson(
      this,
    );
  }
}

abstract class _MenuResponse implements MenuResponse {
  factory _MenuResponse({@JsonKey(name: 'menu') required final MenuDM menuDM}) =
      _$MenuResponseImpl;

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$MenuResponseImpl.fromJson;

  @override
  @JsonKey(name: 'menu')
  MenuDM get menuDM;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuResponseImplCopyWith<_$MenuResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuDM _$MenuDMFromJson(Map<String, dynamic> json) {
  return _MenuDM.fromJson(json);
}

/// @nodoc
mixin _$MenuDM {
  String get uuid => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  BusinessDM? get business => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_id')
  int? get businessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get lastUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_food_categories')
  List<CategoryDM> get foodCategories => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_drink_categories')
  List<CategoryDM> get drinkCategories => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_combos')
  List<ItemDM> get combos => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_length')
  int get followersLength => throw _privateConstructorUsedError;

  /// Serializes this MenuDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuDMCopyWith<MenuDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuDMCopyWith<$Res> {
  factory $MenuDMCopyWith(MenuDM value, $Res Function(MenuDM) then) =
      _$MenuDMCopyWithImpl<$Res, MenuDM>;
  @useResult
  $Res call(
      {String uuid,
      int? id,
      BusinessDM? business,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_id') int? businessId,
      @JsonKey(name: 'updated_at') DateTime? lastUpdate,
      @JsonKey(name: 'business_food_categories')
      List<CategoryDM> foodCategories,
      @JsonKey(name: 'business_drink_categories')
      List<CategoryDM> drinkCategories,
      @JsonKey(name: 'business_combos') List<ItemDM> combos,
      @JsonKey(name: 'followers_length') int followersLength});

  $BusinessDMCopyWith<$Res>? get business;
}

/// @nodoc
class _$MenuDMCopyWithImpl<$Res, $Val extends MenuDM>
    implements $MenuDMCopyWith<$Res> {
  _$MenuDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? id = freezed,
    Object? business = freezed,
    Object? businessUuid = null,
    Object? businessId = freezed,
    Object? lastUpdate = freezed,
    Object? foodCategories = null,
    Object? drinkCategories = null,
    Object? combos = null,
    Object? followersLength = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      foodCategories: null == foodCategories
          ? _value.foodCategories
          : foodCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      drinkCategories: null == drinkCategories
          ? _value.drinkCategories
          : drinkCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      combos: null == combos
          ? _value.combos
          : combos // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_value.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_value.business!, (value) {
      return _then(_value.copyWith(business: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuDMImplCopyWith<$Res> implements $MenuDMCopyWith<$Res> {
  factory _$$MenuDMImplCopyWith(
          _$MenuDMImpl value, $Res Function(_$MenuDMImpl) then) =
      __$$MenuDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      int? id,
      BusinessDM? business,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_id') int? businessId,
      @JsonKey(name: 'updated_at') DateTime? lastUpdate,
      @JsonKey(name: 'business_food_categories')
      List<CategoryDM> foodCategories,
      @JsonKey(name: 'business_drink_categories')
      List<CategoryDM> drinkCategories,
      @JsonKey(name: 'business_combos') List<ItemDM> combos,
      @JsonKey(name: 'followers_length') int followersLength});

  @override
  $BusinessDMCopyWith<$Res>? get business;
}

/// @nodoc
class __$$MenuDMImplCopyWithImpl<$Res>
    extends _$MenuDMCopyWithImpl<$Res, _$MenuDMImpl>
    implements _$$MenuDMImplCopyWith<$Res> {
  __$$MenuDMImplCopyWithImpl(
      _$MenuDMImpl _value, $Res Function(_$MenuDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? id = freezed,
    Object? business = freezed,
    Object? businessUuid = null,
    Object? businessId = freezed,
    Object? lastUpdate = freezed,
    Object? foodCategories = null,
    Object? drinkCategories = null,
    Object? combos = null,
    Object? followersLength = null,
  }) {
    return _then(_$MenuDMImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      foodCategories: null == foodCategories
          ? _value._foodCategories
          : foodCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      drinkCategories: null == drinkCategories
          ? _value._drinkCategories
          : drinkCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      combos: null == combos
          ? _value._combos
          : combos // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuDMImpl extends _MenuDM {
  _$MenuDMImpl(
      {required this.uuid,
      this.id,
      this.business,
      @JsonKey(name: 'business_uuid') required this.businessUuid,
      @JsonKey(name: 'business_id') this.businessId,
      @JsonKey(name: 'updated_at') this.lastUpdate,
      @JsonKey(name: 'business_food_categories')
      final List<CategoryDM> foodCategories = const [],
      @JsonKey(name: 'business_drink_categories')
      final List<CategoryDM> drinkCategories = const [],
      @JsonKey(name: 'business_combos') final List<ItemDM> combos = const [],
      @JsonKey(name: 'followers_length') this.followersLength = 0})
      : _foodCategories = foodCategories,
        _drinkCategories = drinkCategories,
        _combos = combos,
        super._();

  factory _$MenuDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuDMImplFromJson(json);

  @override
  final String uuid;
  @override
  final int? id;
  @override
  final BusinessDM? business;
  @override
  @JsonKey(name: 'business_uuid')
  final String businessUuid;
  @override
  @JsonKey(name: 'business_id')
  final int? businessId;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? lastUpdate;
  final List<CategoryDM> _foodCategories;
  @override
  @JsonKey(name: 'business_food_categories')
  List<CategoryDM> get foodCategories {
    if (_foodCategories is EqualUnmodifiableListView) return _foodCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodCategories);
  }

  final List<CategoryDM> _drinkCategories;
  @override
  @JsonKey(name: 'business_drink_categories')
  List<CategoryDM> get drinkCategories {
    if (_drinkCategories is EqualUnmodifiableListView) return _drinkCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinkCategories);
  }

  final List<ItemDM> _combos;
  @override
  @JsonKey(name: 'business_combos')
  List<ItemDM> get combos {
    if (_combos is EqualUnmodifiableListView) return _combos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_combos);
  }

  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;

  @override
  String toString() {
    return 'MenuDM(uuid: $uuid, id: $id, business: $business, businessUuid: $businessUuid, businessId: $businessId, lastUpdate: $lastUpdate, foodCategories: $foodCategories, drinkCategories: $drinkCategories, combos: $combos, followersLength: $followersLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuDMImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            const DeepCollectionEquality()
                .equals(other._foodCategories, _foodCategories) &&
            const DeepCollectionEquality()
                .equals(other._drinkCategories, _drinkCategories) &&
            const DeepCollectionEquality().equals(other._combos, _combos) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      id,
      business,
      businessUuid,
      businessId,
      lastUpdate,
      const DeepCollectionEquality().hash(_foodCategories),
      const DeepCollectionEquality().hash(_drinkCategories),
      const DeepCollectionEquality().hash(_combos),
      followersLength);

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuDMImplCopyWith<_$MenuDMImpl> get copyWith =>
      __$$MenuDMImplCopyWithImpl<_$MenuDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuDMImplToJson(
      this,
    );
  }
}

abstract class _MenuDM extends MenuDM {
  factory _MenuDM(
          {required final String uuid,
          final int? id,
          final BusinessDM? business,
          @JsonKey(name: 'business_uuid') required final String businessUuid,
          @JsonKey(name: 'business_id') final int? businessId,
          @JsonKey(name: 'updated_at') final DateTime? lastUpdate,
          @JsonKey(name: 'business_food_categories')
          final List<CategoryDM> foodCategories,
          @JsonKey(name: 'business_drink_categories')
          final List<CategoryDM> drinkCategories,
          @JsonKey(name: 'business_combos') final List<ItemDM> combos,
          @JsonKey(name: 'followers_length') final int followersLength}) =
      _$MenuDMImpl;
  _MenuDM._() : super._();

  factory _MenuDM.fromJson(Map<String, dynamic> json) = _$MenuDMImpl.fromJson;

  @override
  String get uuid;
  @override
  int? get id;
  @override
  BusinessDM? get business;
  @override
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @override
  @JsonKey(name: 'business_id')
  int? get businessId;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get lastUpdate;
  @override
  @JsonKey(name: 'business_food_categories')
  List<CategoryDM> get foodCategories;
  @override
  @JsonKey(name: 'business_drink_categories')
  List<CategoryDM> get drinkCategories;
  @override
  @JsonKey(name: 'business_combos')
  List<ItemDM> get combos;
  @override
  @JsonKey(name: 'followers_length')
  int get followersLength;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuDMImplCopyWith<_$MenuDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDM _$CategoryDMFromJson(Map<String, dynamic> json) {
  return _CategoryDM.fromJson(json);
}

/// @nodoc
mixin _$CategoryDM {
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  List<ItemDM> get items => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get editingName => throw _privateConstructorUsedError;

  /// Serializes this CategoryDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDMCopyWith<CategoryDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDMCopyWith<$Res> {
  factory $CategoryDMCopyWith(
          CategoryDM value, $Res Function(CategoryDM) then) =
      _$CategoryDMCopyWithImpl<$Res, CategoryDM>;
  @useResult
  $Res call(
      {String name,
      String uuid,
      int? id,
      List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false) bool editingName});
}

/// @nodoc
class _$CategoryDMCopyWithImpl<$Res, $Val extends CategoryDM>
    implements $CategoryDMCopyWith<$Res> {
  _$CategoryDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? id = freezed,
    Object? items = null,
    Object? editingName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      editingName: null == editingName
          ? _value.editingName
          : editingName // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDMImplCopyWith<$Res>
    implements $CategoryDMCopyWith<$Res> {
  factory _$$CategoryDMImplCopyWith(
          _$CategoryDMImpl value, $Res Function(_$CategoryDMImpl) then) =
      __$$CategoryDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      int? id,
      List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false) bool editingName});
}

/// @nodoc
class __$$CategoryDMImplCopyWithImpl<$Res>
    extends _$CategoryDMCopyWithImpl<$Res, _$CategoryDMImpl>
    implements _$$CategoryDMImplCopyWith<$Res> {
  __$$CategoryDMImplCopyWithImpl(
      _$CategoryDMImpl _value, $Res Function(_$CategoryDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? id = freezed,
    Object? items = null,
    Object? editingName = null,
  }) {
    return _then(_$CategoryDMImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      editingName: null == editingName
          ? _value.editingName
          : editingName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDMImpl extends _CategoryDM {
  _$CategoryDMImpl(
      {required this.name,
      required this.uuid,
      this.id,
      required final List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.editingName = false})
      : _items = items,
        super._();

  factory _$CategoryDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDMImplFromJson(json);

  @override
  final String name;
  @override
  final String uuid;
  @override
  final int? id;
  final List<ItemDM> _items;
  @override
  List<ItemDM> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool editingName;

  @override
  String toString() {
    return 'CategoryDM(name: $name, uuid: $uuid, id: $id, items: $items, editingName: $editingName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDMImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.editingName, editingName) ||
                other.editingName == editingName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, id,
      const DeepCollectionEquality().hash(_items), editingName);

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDMImplCopyWith<_$CategoryDMImpl> get copyWith =>
      __$$CategoryDMImplCopyWithImpl<_$CategoryDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDMImplToJson(
      this,
    );
  }
}

abstract class _CategoryDM extends CategoryDM {
  factory _CategoryDM(
      {required final String name,
      required final String uuid,
      final int? id,
      required final List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool editingName}) = _$CategoryDMImpl;
  _CategoryDM._() : super._();

  factory _CategoryDM.fromJson(Map<String, dynamic> json) =
      _$CategoryDMImpl.fromJson;

  @override
  String get name;
  @override
  String get uuid;
  @override
  int? get id;
  @override
  List<ItemDM> get items;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get editingName;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDMImplCopyWith<_$CategoryDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
