// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_address_component_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceAddressComponentDM _$PlaceAddressComponentDMFromJson(
    Map<String, dynamic> json) {
  return _PlaceAddressComponentDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceAddressComponentDM {
  @JsonKey(name: 'long_name')
  String get longName => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_name')
  String get shortName => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;

  /// Serializes this PlaceAddressComponentDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceAddressComponentDMCopyWith<PlaceAddressComponentDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAddressComponentDMCopyWith<$Res> {
  factory $PlaceAddressComponentDMCopyWith(PlaceAddressComponentDM value,
          $Res Function(PlaceAddressComponentDM) then) =
      _$PlaceAddressComponentDMCopyWithImpl<$Res, PlaceAddressComponentDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'long_name') String longName,
      @JsonKey(name: 'short_name') String shortName,
      List<String> types});
}

/// @nodoc
class _$PlaceAddressComponentDMCopyWithImpl<$Res,
        $Val extends PlaceAddressComponentDM>
    implements $PlaceAddressComponentDMCopyWith<$Res> {
  _$PlaceAddressComponentDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = null,
    Object? shortName = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceAddressComponentDMImplCopyWith<$Res>
    implements $PlaceAddressComponentDMCopyWith<$Res> {
  factory _$$PlaceAddressComponentDMImplCopyWith(
          _$PlaceAddressComponentDMImpl value,
          $Res Function(_$PlaceAddressComponentDMImpl) then) =
      __$$PlaceAddressComponentDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'long_name') String longName,
      @JsonKey(name: 'short_name') String shortName,
      List<String> types});
}

/// @nodoc
class __$$PlaceAddressComponentDMImplCopyWithImpl<$Res>
    extends _$PlaceAddressComponentDMCopyWithImpl<$Res,
        _$PlaceAddressComponentDMImpl>
    implements _$$PlaceAddressComponentDMImplCopyWith<$Res> {
  __$$PlaceAddressComponentDMImplCopyWithImpl(
      _$PlaceAddressComponentDMImpl _value,
      $Res Function(_$PlaceAddressComponentDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = null,
    Object? shortName = null,
    Object? types = null,
  }) {
    return _then(_$PlaceAddressComponentDMImpl(
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceAddressComponentDMImpl implements _PlaceAddressComponentDM {
  const _$PlaceAddressComponentDMImpl(
      {@JsonKey(name: 'long_name') required this.longName,
      @JsonKey(name: 'short_name') required this.shortName,
      final List<String> types = const <String>[]})
      : _types = types;

  factory _$PlaceAddressComponentDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceAddressComponentDMImplFromJson(json);

  @override
  @JsonKey(name: 'long_name')
  final String longName;
  @override
  @JsonKey(name: 'short_name')
  final String shortName;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'PlaceAddressComponentDM(longName: $longName, shortName: $shortName, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceAddressComponentDMImpl &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longName, shortName,
      const DeepCollectionEquality().hash(_types));

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceAddressComponentDMImplCopyWith<_$PlaceAddressComponentDMImpl>
      get copyWith => __$$PlaceAddressComponentDMImplCopyWithImpl<
          _$PlaceAddressComponentDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceAddressComponentDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceAddressComponentDM implements PlaceAddressComponentDM {
  const factory _PlaceAddressComponentDM(
      {@JsonKey(name: 'long_name') required final String longName,
      @JsonKey(name: 'short_name') required final String shortName,
      final List<String> types}) = _$PlaceAddressComponentDMImpl;

  factory _PlaceAddressComponentDM.fromJson(Map<String, dynamic> json) =
      _$PlaceAddressComponentDMImpl.fromJson;

  @override
  @JsonKey(name: 'long_name')
  String get longName;
  @override
  @JsonKey(name: 'short_name')
  String get shortName;
  @override
  List<String> get types;

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceAddressComponentDMImplCopyWith<_$PlaceAddressComponentDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
