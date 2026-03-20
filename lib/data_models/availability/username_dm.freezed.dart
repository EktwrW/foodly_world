// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsernameDM _$UsernameDMFromJson(Map<String, dynamic> json) {
  return _UsernameDM.fromJson(json);
}

/// @nodoc
mixin _$UsernameDM {
  String get username => throw _privateConstructorUsedError;

  /// Serializes this UsernameDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsernameDMCopyWith<UsernameDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameDMCopyWith<$Res> {
  factory $UsernameDMCopyWith(
          UsernameDM value, $Res Function(UsernameDM) then) =
      _$UsernameDMCopyWithImpl<$Res, UsernameDM>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class _$UsernameDMCopyWithImpl<$Res, $Val extends UsernameDM>
    implements $UsernameDMCopyWith<$Res> {
  _$UsernameDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsernameDMImplCopyWith<$Res>
    implements $UsernameDMCopyWith<$Res> {
  factory _$$UsernameDMImplCopyWith(
          _$UsernameDMImpl value, $Res Function(_$UsernameDMImpl) then) =
      __$$UsernameDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$UsernameDMImplCopyWithImpl<$Res>
    extends _$UsernameDMCopyWithImpl<$Res, _$UsernameDMImpl>
    implements _$$UsernameDMImplCopyWith<$Res> {
  __$$UsernameDMImplCopyWithImpl(
      _$UsernameDMImpl _value, $Res Function(_$UsernameDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$UsernameDMImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsernameDMImpl extends _UsernameDM {
  const _$UsernameDMImpl({required this.username}) : super._();

  factory _$UsernameDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsernameDMImplFromJson(json);

  @override
  final String username;

  @override
  String toString() {
    return 'UsernameDM(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameDMImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameDMImplCopyWith<_$UsernameDMImpl> get copyWith =>
      __$$UsernameDMImplCopyWithImpl<_$UsernameDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsernameDMImplToJson(
      this,
    );
  }
}

abstract class _UsernameDM extends UsernameDM {
  const factory _UsernameDM({required final String username}) =
      _$UsernameDMImpl;
  const _UsernameDM._() : super._();

  factory _UsernameDM.fromJson(Map<String, dynamic> json) =
      _$UsernameDMImpl.fromJson;

  @override
  String get username;

  /// Create a copy of UsernameDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsernameDMImplCopyWith<_$UsernameDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
