// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_body_set_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBodySetPasswordDTO _$UserBodySetPasswordDTOFromJson(
    Map<String, dynamic> json) {
  return _UserBodySetPasswordDTO.fromJson(json);
}

/// @nodoc
mixin _$UserBodySetPasswordDTO {
  @JsonKey(name: 'new_password')
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this UserBodySetPasswordDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBodySetPasswordDTOCopyWith<UserBodySetPasswordDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBodySetPasswordDTOCopyWith<$Res> {
  factory $UserBodySetPasswordDTOCopyWith(UserBodySetPasswordDTO value,
          $Res Function(UserBodySetPasswordDTO) then) =
      _$UserBodySetPasswordDTOCopyWithImpl<$Res, UserBodySetPasswordDTO>;
  @useResult
  $Res call({@JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class _$UserBodySetPasswordDTOCopyWithImpl<$Res,
        $Val extends UserBodySetPasswordDTO>
    implements $UserBodySetPasswordDTOCopyWith<$Res> {
  _$UserBodySetPasswordDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBodySetPasswordDTOImplCopyWith<$Res>
    implements $UserBodySetPasswordDTOCopyWith<$Res> {
  factory _$$UserBodySetPasswordDTOImplCopyWith(
          _$UserBodySetPasswordDTOImpl value,
          $Res Function(_$UserBodySetPasswordDTOImpl) then) =
      __$$UserBodySetPasswordDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class __$$UserBodySetPasswordDTOImplCopyWithImpl<$Res>
    extends _$UserBodySetPasswordDTOCopyWithImpl<$Res,
        _$UserBodySetPasswordDTOImpl>
    implements _$$UserBodySetPasswordDTOImplCopyWith<$Res> {
  __$$UserBodySetPasswordDTOImplCopyWithImpl(
      _$UserBodySetPasswordDTOImpl _value,
      $Res Function(_$UserBodySetPasswordDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_$UserBodySetPasswordDTOImpl(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBodySetPasswordDTOImpl implements _UserBodySetPasswordDTO {
  const _$UserBodySetPasswordDTOImpl(
      {@JsonKey(name: 'new_password') required this.newPassword});

  factory _$UserBodySetPasswordDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBodySetPasswordDTOImplFromJson(json);

  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  @override
  String toString() {
    return 'UserBodySetPasswordDTO(newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBodySetPasswordDTOImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBodySetPasswordDTOImplCopyWith<_$UserBodySetPasswordDTOImpl>
      get copyWith => __$$UserBodySetPasswordDTOImplCopyWithImpl<
          _$UserBodySetPasswordDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBodySetPasswordDTOImplToJson(
      this,
    );
  }
}

abstract class _UserBodySetPasswordDTO implements UserBodySetPasswordDTO {
  const factory _UserBodySetPasswordDTO(
          {@JsonKey(name: 'new_password') required final String newPassword}) =
      _$UserBodySetPasswordDTOImpl;

  factory _UserBodySetPasswordDTO.fromJson(Map<String, dynamic> json) =
      _$UserBodySetPasswordDTOImpl.fromJson;

  @override
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Create a copy of UserBodySetPasswordDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBodySetPasswordDTOImplCopyWith<_$UserBodySetPasswordDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
