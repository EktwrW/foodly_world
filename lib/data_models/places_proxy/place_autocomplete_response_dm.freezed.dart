// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_autocomplete_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceAutocompleteResponseDM _$PlaceAutocompleteResponseDMFromJson(
    Map<String, dynamic> json) {
  return _PlaceAutocompleteResponseDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceAutocompleteResponseDM {
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status => throw _privateConstructorUsedError;
  List<PlacePredictionDM> get predictions => throw _privateConstructorUsedError;

  /// Serializes this PlaceAutocompleteResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceAutocompleteResponseDMCopyWith<PlaceAutocompleteResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAutocompleteResponseDMCopyWith<$Res> {
  factory $PlaceAutocompleteResponseDMCopyWith(
          PlaceAutocompleteResponseDM value,
          $Res Function(PlaceAutocompleteResponseDM) then) =
      _$PlaceAutocompleteResponseDMCopyWithImpl<$Res,
          PlaceAutocompleteResponseDM>;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<PlacePredictionDM> predictions});
}

/// @nodoc
class _$PlaceAutocompleteResponseDMCopyWithImpl<$Res,
        $Val extends PlaceAutocompleteResponseDM>
    implements $PlaceAutocompleteResponseDMCopyWith<$Res> {
  _$PlaceAutocompleteResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? predictions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      predictions: null == predictions
          ? _value.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<PlacePredictionDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceAutocompleteResponseDMImplCopyWith<$Res>
    implements $PlaceAutocompleteResponseDMCopyWith<$Res> {
  factory _$$PlaceAutocompleteResponseDMImplCopyWith(
          _$PlaceAutocompleteResponseDMImpl value,
          $Res Function(_$PlaceAutocompleteResponseDMImpl) then) =
      __$$PlaceAutocompleteResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<PlacePredictionDM> predictions});
}

/// @nodoc
class __$$PlaceAutocompleteResponseDMImplCopyWithImpl<$Res>
    extends _$PlaceAutocompleteResponseDMCopyWithImpl<$Res,
        _$PlaceAutocompleteResponseDMImpl>
    implements _$$PlaceAutocompleteResponseDMImplCopyWith<$Res> {
  __$$PlaceAutocompleteResponseDMImplCopyWithImpl(
      _$PlaceAutocompleteResponseDMImpl _value,
      $Res Function(_$PlaceAutocompleteResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? predictions = null,
  }) {
    return _then(_$PlaceAutocompleteResponseDMImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      predictions: null == predictions
          ? _value._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<PlacePredictionDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceAutocompleteResponseDMImpl
    implements _PlaceAutocompleteResponseDM {
  const _$PlaceAutocompleteResponseDMImpl(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required this.status,
      final List<PlacePredictionDM> predictions = const <PlacePredictionDM>[]})
      : _predictions = predictions;

  factory _$PlaceAutocompleteResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlaceAutocompleteResponseDMImplFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  final ProxyStatusEnum status;
  final List<PlacePredictionDM> _predictions;
  @override
  @JsonKey()
  List<PlacePredictionDM> get predictions {
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predictions);
  }

  @override
  String toString() {
    return 'PlaceAutocompleteResponseDM(status: $status, predictions: $predictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceAutocompleteResponseDMImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_predictions));

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceAutocompleteResponseDMImplCopyWith<_$PlaceAutocompleteResponseDMImpl>
      get copyWith => __$$PlaceAutocompleteResponseDMImplCopyWithImpl<
          _$PlaceAutocompleteResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceAutocompleteResponseDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceAutocompleteResponseDM
    implements PlaceAutocompleteResponseDM {
  const factory _PlaceAutocompleteResponseDM(
          {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
          required final ProxyStatusEnum status,
          final List<PlacePredictionDM> predictions}) =
      _$PlaceAutocompleteResponseDMImpl;

  factory _PlaceAutocompleteResponseDM.fromJson(Map<String, dynamic> json) =
      _$PlaceAutocompleteResponseDMImpl.fromJson;

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status;
  @override
  List<PlacePredictionDM> get predictions;

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceAutocompleteResponseDMImplCopyWith<_$PlaceAutocompleteResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
