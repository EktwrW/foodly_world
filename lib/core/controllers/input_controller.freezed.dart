// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InputController {
  TextEditingController? get controller;
  FocusNode? get focusNode;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<InputController> get copyWith =>
      _$InputControllerCopyWithImpl<InputController>(
          this as InputController, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputController &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, focusNode);

  @override
  String toString() {
    return 'InputController(controller: $controller, focusNode: $focusNode)';
  }
}

/// @nodoc
abstract mixin class $InputControllerCopyWith<$Res> {
  factory $InputControllerCopyWith(
          InputController value, $Res Function(InputController) _then) =
      _$InputControllerCopyWithImpl;
  @useResult
  $Res call({TextEditingController? controller, FocusNode? focusNode});
}

/// @nodoc
class _$InputControllerCopyWithImpl<$Res>
    implements $InputControllerCopyWith<$Res> {
  _$InputControllerCopyWithImpl(this._self, this._then);

  final InputController _self;
  final $Res Function(InputController) _then;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_self.copyWith(
      controller: freezed == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      focusNode: freezed == focusNode
          ? _self.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InputController].
extension InputControllerPatterns on InputController {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InputController value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputController() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InputController value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputController():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InputController value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputController() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TextEditingController? controller, FocusNode? focusNode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputController() when $default != null:
        return $default(_that.controller, _that.focusNode);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TextEditingController? controller, FocusNode? focusNode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputController():
        return $default(_that.controller, _that.focusNode);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TextEditingController? controller, FocusNode? focusNode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputController() when $default != null:
        return $default(_that.controller, _that.focusNode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InputController extends InputController {
  const _InputController({this.controller, this.focusNode}) : super._();

  @override
  final TextEditingController? controller;
  @override
  final FocusNode? focusNode;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputControllerCopyWith<_InputController> get copyWith =>
      __$InputControllerCopyWithImpl<_InputController>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputController &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, focusNode);

  @override
  String toString() {
    return 'InputController(controller: $controller, focusNode: $focusNode)';
  }
}

/// @nodoc
abstract mixin class _$InputControllerCopyWith<$Res>
    implements $InputControllerCopyWith<$Res> {
  factory _$InputControllerCopyWith(
          _InputController value, $Res Function(_InputController) _then) =
      __$InputControllerCopyWithImpl;
  @override
  @useResult
  $Res call({TextEditingController? controller, FocusNode? focusNode});
}

/// @nodoc
class __$InputControllerCopyWithImpl<$Res>
    implements _$InputControllerCopyWith<$Res> {
  __$InputControllerCopyWithImpl(this._self, this._then);

  final _InputController _self;
  final $Res Function(_InputController) _then;

  /// Create a copy of InputController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? controller = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_InputController(
      controller: freezed == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      focusNode: freezed == focusNode
          ? _self.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
    ));
  }
}

// dart format on
