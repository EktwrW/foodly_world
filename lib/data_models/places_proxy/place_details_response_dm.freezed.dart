// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceDetailsResponseDM _$PlaceDetailsResponseDMFromJson(
    Map<String, dynamic> json) {
  return _PlaceDetailsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceDetailsResponseDM {
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status => throw _privateConstructorUsedError;
  PlaceDM? get result => throw _privateConstructorUsedError;

  /// Serializes this PlaceDetailsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceDetailsResponseDMCopyWith<PlaceDetailsResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsResponseDMCopyWith<$Res> {
  factory $PlaceDetailsResponseDMCopyWith(PlaceDetailsResponseDM value,
          $Res Function(PlaceDetailsResponseDM) then) =
      _$PlaceDetailsResponseDMCopyWithImpl<$Res, PlaceDetailsResponseDM>;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      PlaceDM? result});

  $PlaceDMCopyWith<$Res>? get result;
}

/// @nodoc
class _$PlaceDetailsResponseDMCopyWithImpl<$Res,
        $Val extends PlaceDetailsResponseDM>
    implements $PlaceDetailsResponseDMCopyWith<$Res> {
  _$PlaceDetailsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PlaceDM?,
    ) as $Val);
  }

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceDMCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $PlaceDMCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceDetailsResponseDMImplCopyWith<$Res>
    implements $PlaceDetailsResponseDMCopyWith<$Res> {
  factory _$$PlaceDetailsResponseDMImplCopyWith(
          _$PlaceDetailsResponseDMImpl value,
          $Res Function(_$PlaceDetailsResponseDMImpl) then) =
      __$$PlaceDetailsResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      PlaceDM? result});

  @override
  $PlaceDMCopyWith<$Res>? get result;
}

/// @nodoc
class __$$PlaceDetailsResponseDMImplCopyWithImpl<$Res>
    extends _$PlaceDetailsResponseDMCopyWithImpl<$Res,
        _$PlaceDetailsResponseDMImpl>
    implements _$$PlaceDetailsResponseDMImplCopyWith<$Res> {
  __$$PlaceDetailsResponseDMImplCopyWithImpl(
      _$PlaceDetailsResponseDMImpl _value,
      $Res Function(_$PlaceDetailsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = freezed,
  }) {
    return _then(_$PlaceDetailsResponseDMImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PlaceDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceDetailsResponseDMImpl implements _PlaceDetailsResponseDM {
  const _$PlaceDetailsResponseDMImpl(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required this.status,
      this.result});

  factory _$PlaceDetailsResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceDetailsResponseDMImplFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  final ProxyStatusEnum status;
  @override
  final PlaceDM? result;

  @override
  String toString() {
    return 'PlaceDetailsResponseDM(status: $status, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsResponseDMImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, result);

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsResponseDMImplCopyWith<_$PlaceDetailsResponseDMImpl>
      get copyWith => __$$PlaceDetailsResponseDMImplCopyWithImpl<
          _$PlaceDetailsResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceDetailsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceDetailsResponseDM implements PlaceDetailsResponseDM {
  const factory _PlaceDetailsResponseDM(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      required final ProxyStatusEnum status,
      final PlaceDM? result}) = _$PlaceDetailsResponseDMImpl;

  factory _PlaceDetailsResponseDM.fromJson(Map<String, dynamic> json) =
      _$PlaceDetailsResponseDMImpl.fromJson;

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status;
  @override
  PlaceDM? get result;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceDetailsResponseDMImplCopyWith<_$PlaceDetailsResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
