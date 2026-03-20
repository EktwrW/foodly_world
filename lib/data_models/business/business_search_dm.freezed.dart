// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_search_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessSearchDM _$BusinessSearchDMFromJson(Map<String, dynamic> json) {
  return _BusinessSearchDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessSearchDM {
  @JsonKey(name: 'business')
  List<BusinessDM> get business => throw _privateConstructorUsedError;

  /// Serializes this BusinessSearchDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessSearchDMCopyWith<BusinessSearchDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessSearchDMCopyWith<$Res> {
  factory $BusinessSearchDMCopyWith(
          BusinessSearchDM value, $Res Function(BusinessSearchDM) then) =
      _$BusinessSearchDMCopyWithImpl<$Res, BusinessSearchDM>;
  @useResult
  $Res call({@JsonKey(name: 'business') List<BusinessDM> business});
}

/// @nodoc
class _$BusinessSearchDMCopyWithImpl<$Res, $Val extends BusinessSearchDM>
    implements $BusinessSearchDMCopyWith<$Res> {
  _$BusinessSearchDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
  }) {
    return _then(_value.copyWith(
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessSearchDMImplCopyWith<$Res>
    implements $BusinessSearchDMCopyWith<$Res> {
  factory _$$BusinessSearchDMImplCopyWith(_$BusinessSearchDMImpl value,
          $Res Function(_$BusinessSearchDMImpl) then) =
      __$$BusinessSearchDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'business') List<BusinessDM> business});
}

/// @nodoc
class __$$BusinessSearchDMImplCopyWithImpl<$Res>
    extends _$BusinessSearchDMCopyWithImpl<$Res, _$BusinessSearchDMImpl>
    implements _$$BusinessSearchDMImplCopyWith<$Res> {
  __$$BusinessSearchDMImplCopyWithImpl(_$BusinessSearchDMImpl _value,
      $Res Function(_$BusinessSearchDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
  }) {
    return _then(_$BusinessSearchDMImpl(
      business: null == business
          ? _value._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessSearchDMImpl implements _BusinessSearchDM {
  const _$BusinessSearchDMImpl(
      {@JsonKey(name: 'business') required final List<BusinessDM> business})
      : _business = business;

  factory _$BusinessSearchDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessSearchDMImplFromJson(json);

  final List<BusinessDM> _business;
  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business {
    if (_business is EqualUnmodifiableListView) return _business;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_business);
  }

  @override
  String toString() {
    return 'BusinessSearchDM(business: $business)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessSearchDMImpl &&
            const DeepCollectionEquality().equals(other._business, _business));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_business));

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessSearchDMImplCopyWith<_$BusinessSearchDMImpl> get copyWith =>
      __$$BusinessSearchDMImplCopyWithImpl<_$BusinessSearchDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessSearchDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessSearchDM implements BusinessSearchDM {
  const factory _BusinessSearchDM(
      {@JsonKey(name: 'business')
      required final List<BusinessDM> business}) = _$BusinessSearchDMImpl;

  factory _BusinessSearchDM.fromJson(Map<String, dynamic> json) =
      _$BusinessSearchDMImpl.fromJson;

  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business;

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessSearchDMImplCopyWith<_$BusinessSearchDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
