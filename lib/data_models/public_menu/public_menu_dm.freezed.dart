// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_menu_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicMenuResponseDM _$PublicMenuResponseDMFromJson(Map<String, dynamic> json) {
  return _PublicMenuResponseDM.fromJson(json);
}

/// @nodoc
mixin _$PublicMenuResponseDM {
  BusinessDM get business => throw _privateConstructorUsedError;
  MenuDM get menu => throw _privateConstructorUsedError;

  /// Serializes this PublicMenuResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicMenuResponseDMCopyWith<PublicMenuResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicMenuResponseDMCopyWith<$Res> {
  factory $PublicMenuResponseDMCopyWith(PublicMenuResponseDM value,
          $Res Function(PublicMenuResponseDM) then) =
      _$PublicMenuResponseDMCopyWithImpl<$Res, PublicMenuResponseDM>;
  @useResult
  $Res call({BusinessDM business, MenuDM menu});

  $BusinessDMCopyWith<$Res> get business;
  $MenuDMCopyWith<$Res> get menu;
}

/// @nodoc
class _$PublicMenuResponseDMCopyWithImpl<$Res,
        $Val extends PublicMenuResponseDM>
    implements $PublicMenuResponseDMCopyWith<$Res> {
  _$PublicMenuResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ) as $Val);
  }

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res> get business {
    return $BusinessDMCopyWith<$Res>(_value.business, (value) {
      return _then(_value.copyWith(business: value) as $Val);
    });
  }

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res> get menu {
    return $MenuDMCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PublicMenuResponseDMImplCopyWith<$Res>
    implements $PublicMenuResponseDMCopyWith<$Res> {
  factory _$$PublicMenuResponseDMImplCopyWith(_$PublicMenuResponseDMImpl value,
          $Res Function(_$PublicMenuResponseDMImpl) then) =
      __$$PublicMenuResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BusinessDM business, MenuDM menu});

  @override
  $BusinessDMCopyWith<$Res> get business;
  @override
  $MenuDMCopyWith<$Res> get menu;
}

/// @nodoc
class __$$PublicMenuResponseDMImplCopyWithImpl<$Res>
    extends _$PublicMenuResponseDMCopyWithImpl<$Res, _$PublicMenuResponseDMImpl>
    implements _$$PublicMenuResponseDMImplCopyWith<$Res> {
  __$$PublicMenuResponseDMImplCopyWithImpl(_$PublicMenuResponseDMImpl _value,
      $Res Function(_$PublicMenuResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
    Object? menu = null,
  }) {
    return _then(_$PublicMenuResponseDMImpl(
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicMenuResponseDMImpl implements _PublicMenuResponseDM {
  _$PublicMenuResponseDMImpl({required this.business, required this.menu});

  factory _$PublicMenuResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicMenuResponseDMImplFromJson(json);

  @override
  final BusinessDM business;
  @override
  final MenuDM menu;

  @override
  String toString() {
    return 'PublicMenuResponseDM(business: $business, menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicMenuResponseDMImpl &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, business, menu);

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicMenuResponseDMImplCopyWith<_$PublicMenuResponseDMImpl>
      get copyWith =>
          __$$PublicMenuResponseDMImplCopyWithImpl<_$PublicMenuResponseDMImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicMenuResponseDMImplToJson(
      this,
    );
  }
}

abstract class _PublicMenuResponseDM implements PublicMenuResponseDM {
  factory _PublicMenuResponseDM(
      {required final BusinessDM business,
      required final MenuDM menu}) = _$PublicMenuResponseDMImpl;

  factory _PublicMenuResponseDM.fromJson(Map<String, dynamic> json) =
      _$PublicMenuResponseDMImpl.fromJson;

  @override
  BusinessDM get business;
  @override
  MenuDM get menu;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicMenuResponseDMImplCopyWith<_$PublicMenuResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
