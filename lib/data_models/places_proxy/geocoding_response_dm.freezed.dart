// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeocodingResponseDM _$GeocodingResponseDMFromJson(Map<String, dynamic> json) {
  return _GeocodingResponseDM.fromJson(json);
}

/// @nodoc
mixin _$GeocodingResponseDM {
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status => throw _privateConstructorUsedError;
  List<GeocodingResultDM> get results => throw _privateConstructorUsedError;

  /// Serializes this GeocodingResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeocodingResponseDMCopyWith<GeocodingResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodingResponseDMCopyWith<$Res> {
  factory $GeocodingResponseDMCopyWith(
          GeocodingResponseDM value, $Res Function(GeocodingResponseDM) then) =
      _$GeocodingResponseDMCopyWithImpl<$Res, GeocodingResponseDM>;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<GeocodingResultDM> results});
}

/// @nodoc
class _$GeocodingResponseDMCopyWithImpl<$Res, $Val extends GeocodingResponseDM>
    implements $GeocodingResponseDMCopyWith<$Res> {
  _$GeocodingResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GeocodingResultDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeocodingResponseDMImplCopyWith<$Res>
    implements $GeocodingResponseDMCopyWith<$Res> {
  factory _$$GeocodingResponseDMImplCopyWith(_$GeocodingResponseDMImpl value,
          $Res Function(_$GeocodingResponseDMImpl) then) =
      __$$GeocodingResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<GeocodingResultDM> results});
}

/// @nodoc
class __$$GeocodingResponseDMImplCopyWithImpl<$Res>
    extends _$GeocodingResponseDMCopyWithImpl<$Res, _$GeocodingResponseDMImpl>
    implements _$$GeocodingResponseDMImplCopyWith<$Res> {
  __$$GeocodingResponseDMImplCopyWithImpl(_$GeocodingResponseDMImpl _value,
      $Res Function(_$GeocodingResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? results = null,
  }) {
    return _then(_$GeocodingResponseDMImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GeocodingResultDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodingResponseDMImpl implements _GeocodingResponseDM {
  const _$GeocodingResponseDMImpl(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required this.status,
      final List<GeocodingResultDM> results = const <GeocodingResultDM>[]})
      : _results = results;

  factory _$GeocodingResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodingResponseDMImplFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  final ProxyStatusEnum status;
  final List<GeocodingResultDM> _results;
  @override
  @JsonKey()
  List<GeocodingResultDM> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'GeocodingResponseDM(status: $status, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodingResponseDMImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_results));

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodingResponseDMImplCopyWith<_$GeocodingResponseDMImpl> get copyWith =>
      __$$GeocodingResponseDMImplCopyWithImpl<_$GeocodingResponseDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodingResponseDMImplToJson(
      this,
    );
  }
}

abstract class _GeocodingResponseDM implements GeocodingResponseDM {
  const factory _GeocodingResponseDM(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      required final ProxyStatusEnum status,
      final List<GeocodingResultDM> results}) = _$GeocodingResponseDMImpl;

  factory _GeocodingResponseDM.fromJson(Map<String, dynamic> json) =
      _$GeocodingResponseDMImpl.fromJson;

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status;
  @override
  List<GeocodingResultDM> get results;

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeocodingResponseDMImplCopyWith<_$GeocodingResponseDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
