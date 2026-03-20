// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InputController {
  TextEditingController? get controller => throw _privateConstructorUsedError;
  FocusNode? get focusNode => throw _privateConstructorUsedError;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputControllerCopyWith<InputController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputControllerCopyWith<$Res> {
  factory $InputControllerCopyWith(
          InputController value, $Res Function(InputController) then) =
      _$InputControllerCopyWithImpl<$Res, InputController>;
  @useResult
  $Res call({TextEditingController? controller, FocusNode? focusNode});
}

/// @nodoc
class _$InputControllerCopyWithImpl<$Res, $Val extends InputController>
    implements $InputControllerCopyWith<$Res> {
  _$InputControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      focusNode: freezed == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputControllerImplCopyWith<$Res>
    implements $InputControllerCopyWith<$Res> {
  factory _$$InputControllerImplCopyWith(_$InputControllerImpl value,
          $Res Function(_$InputControllerImpl) then) =
      __$$InputControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextEditingController? controller, FocusNode? focusNode});
}

/// @nodoc
class __$$InputControllerImplCopyWithImpl<$Res>
    extends _$InputControllerCopyWithImpl<$Res, _$InputControllerImpl>
    implements _$$InputControllerImplCopyWith<$Res> {
  __$$InputControllerImplCopyWithImpl(
      _$InputControllerImpl _value, $Res Function(_$InputControllerImpl) _then)
      : super(_value, _then);

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_$InputControllerImpl(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      focusNode: freezed == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
    ));
  }
}

/// @nodoc

class _$InputControllerImpl extends _InputController {
  const _$InputControllerImpl({this.controller, this.focusNode}) : super._();

  @override
  final TextEditingController? controller;
  @override
  final FocusNode? focusNode;

  @override
  String toString() {
    return 'InputController(controller: $controller, focusNode: $focusNode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputControllerImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, focusNode);

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputControllerImplCopyWith<_$InputControllerImpl> get copyWith =>
      __$$InputControllerImplCopyWithImpl<_$InputControllerImpl>(
          this, _$identity);
}

abstract class _InputController extends InputController {
  const factory _InputController(
      {final TextEditingController? controller,
      final FocusNode? focusNode}) = _$InputControllerImpl;
  const _InputController._() : super._();

  @override
  TextEditingController? get controller;
  @override
  FocusNode? get focusNode;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputControllerImplCopyWith<_$InputControllerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
