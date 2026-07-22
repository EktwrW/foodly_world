// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuVM {
  MenuDM? get menuDM;
  int get indexView;
  PageController? get controller;
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey;

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuVMCopyWith<MenuVM> get copyWith =>
      _$MenuVMCopyWithImpl<MenuVM>(this as MenuVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuVM &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.floatingButtonKey, floatingButtonKey) ||
                other.floatingButtonKey == floatingButtonKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, menuDM, indexView, controller, floatingButtonKey);

  @override
  String toString() {
    return 'MenuVM(menuDM: $menuDM, indexView: $indexView, controller: $controller, floatingButtonKey: $floatingButtonKey)';
  }
}

/// @nodoc
abstract mixin class $MenuVMCopyWith<$Res> {
  factory $MenuVMCopyWith(MenuVM value, $Res Function(MenuVM) _then) =
      _$MenuVMCopyWithImpl;
  @useResult
  $Res call(
      {MenuDM? menuDM,
      int indexView,
      PageController? controller,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey});

  $MenuDMCopyWith<$Res>? get menuDM;
}

/// @nodoc
class _$MenuVMCopyWithImpl<$Res> implements $MenuVMCopyWith<$Res> {
  _$MenuVMCopyWithImpl(this._self, this._then);

  final MenuVM _self;
  final $Res Function(MenuVM) _then;

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? floatingButtonKey = freezed,
  }) {
    return _then(_self.copyWith(
      menuDM: freezed == menuDM
          ? _self.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM?,
      indexView: null == indexView
          ? _self.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      floatingButtonKey: freezed == floatingButtonKey
          ? _self.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ));
  }

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res>? get menuDM {
    if (_self.menuDM == null) {
      return null;
    }

    return $MenuDMCopyWith<$Res>(_self.menuDM!, (value) {
      return _then(_self.copyWith(menuDM: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MenuVM].
extension MenuVMPatterns on MenuVM {
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
    TResult Function(_MenuVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuVM() when $default != null:
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
    TResult Function(_MenuVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuVM():
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
    TResult? Function(_MenuVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuVM() when $default != null:
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
    TResult Function(MenuDM? menuDM, int indexView, PageController? controller,
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuVM() when $default != null:
        return $default(_that.menuDM, _that.indexView, _that.controller,
            _that.floatingButtonKey);
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
    TResult Function(MenuDM? menuDM, int indexView, PageController? controller,
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuVM():
        return $default(_that.menuDM, _that.indexView, _that.controller,
            _that.floatingButtonKey);
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
    TResult? Function(MenuDM? menuDM, int indexView, PageController? controller,
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuVM() when $default != null:
        return $default(_that.menuDM, _that.indexView, _that.controller,
            _that.floatingButtonKey);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MenuVM extends MenuVM {
  const _MenuVM(
      {this.menuDM,
      this.indexView = 0,
      this.controller,
      this.floatingButtonKey})
      : super._();

  @override
  final MenuDM? menuDM;
  @override
  @JsonKey()
  final int indexView;
  @override
  final PageController? controller;
  @override
  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuVMCopyWith<_MenuVM> get copyWith =>
      __$MenuVMCopyWithImpl<_MenuVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuVM &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.floatingButtonKey, floatingButtonKey) ||
                other.floatingButtonKey == floatingButtonKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, menuDM, indexView, controller, floatingButtonKey);

  @override
  String toString() {
    return 'MenuVM(menuDM: $menuDM, indexView: $indexView, controller: $controller, floatingButtonKey: $floatingButtonKey)';
  }
}

/// @nodoc
abstract mixin class _$MenuVMCopyWith<$Res> implements $MenuVMCopyWith<$Res> {
  factory _$MenuVMCopyWith(_MenuVM value, $Res Function(_MenuVM) _then) =
      __$MenuVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MenuDM? menuDM,
      int indexView,
      PageController? controller,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey});

  @override
  $MenuDMCopyWith<$Res>? get menuDM;
}

/// @nodoc
class __$MenuVMCopyWithImpl<$Res> implements _$MenuVMCopyWith<$Res> {
  __$MenuVMCopyWithImpl(this._self, this._then);

  final _MenuVM _self;
  final $Res Function(_MenuVM) _then;

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? menuDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? floatingButtonKey = freezed,
  }) {
    return _then(_MenuVM(
      menuDM: freezed == menuDM
          ? _self.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM?,
      indexView: null == indexView
          ? _self.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      floatingButtonKey: freezed == floatingButtonKey
          ? _self.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ));
  }

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res>? get menuDM {
    if (_self.menuDM == null) {
      return null;
    }

    return $MenuDMCopyWith<$Res>(_self.menuDM!, (value) {
      return _then(_self.copyWith(menuDM: value));
    });
  }
}

// dart format on
