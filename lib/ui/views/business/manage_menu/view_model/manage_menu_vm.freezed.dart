// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_menu_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageMenuVM {
  MenuDM? get menuDM;
  MenuDM? get editMenuDM;
  int get indexView;
  PageController? get controller;
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey;
  bool get editMode;
  bool get avoidFocus;
  GlobalKey<FormState>? get formKey;
  AutovalidateMode get autovalidateMode;

  /// Create a copy of ManageMenuVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManageMenuVMCopyWith<ManageMenuVM> get copyWith =>
      _$ManageMenuVMCopyWithImpl<ManageMenuVM>(
          this as ManageMenuVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManageMenuVM &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM) &&
            (identical(other.editMenuDM, editMenuDM) ||
                other.editMenuDM == editMenuDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.floatingButtonKey, floatingButtonKey) ||
                other.floatingButtonKey == floatingButtonKey) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.avoidFocus, avoidFocus) ||
                other.avoidFocus == avoidFocus) &&
            (identical(other.formKey, formKey) || other.formKey == formKey) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      menuDM,
      editMenuDM,
      indexView,
      controller,
      floatingButtonKey,
      editMode,
      avoidFocus,
      formKey,
      autovalidateMode);

  @override
  String toString() {
    return 'ManageMenuVM(menuDM: $menuDM, editMenuDM: $editMenuDM, indexView: $indexView, controller: $controller, floatingButtonKey: $floatingButtonKey, editMode: $editMode, avoidFocus: $avoidFocus, formKey: $formKey, autovalidateMode: $autovalidateMode)';
  }
}

/// @nodoc
abstract mixin class $ManageMenuVMCopyWith<$Res> {
  factory $ManageMenuVMCopyWith(
          ManageMenuVM value, $Res Function(ManageMenuVM) _then) =
      _$ManageMenuVMCopyWithImpl;
  @useResult
  $Res call(
      {MenuDM? menuDM,
      MenuDM? editMenuDM,
      int indexView,
      PageController? controller,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
      bool editMode,
      bool avoidFocus,
      GlobalKey<FormState>? formKey,
      AutovalidateMode autovalidateMode});

  $MenuDMCopyWith<$Res>? get menuDM;
  $MenuDMCopyWith<$Res>? get editMenuDM;
}

/// @nodoc
class _$ManageMenuVMCopyWithImpl<$Res> implements $ManageMenuVMCopyWith<$Res> {
  _$ManageMenuVMCopyWithImpl(this._self, this._then);

  final ManageMenuVM _self;
  final $Res Function(ManageMenuVM) _then;

  /// Create a copy of ManageMenuVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuDM = freezed,
    Object? editMenuDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? floatingButtonKey = freezed,
    Object? editMode = null,
    Object? avoidFocus = null,
    Object? formKey = freezed,
    Object? autovalidateMode = null,
  }) {
    return _then(_self.copyWith(
      menuDM: freezed == menuDM
          ? _self.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM?,
      editMenuDM: freezed == editMenuDM
          ? _self.editMenuDM
          : editMenuDM // ignore: cast_nullable_to_non_nullable
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
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      avoidFocus: null == avoidFocus
          ? _self.avoidFocus
          : avoidFocus // ignore: cast_nullable_to_non_nullable
              as bool,
      formKey: freezed == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
    ));
  }

  /// Create a copy of ManageMenuVM
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

  /// Create a copy of ManageMenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res>? get editMenuDM {
    if (_self.editMenuDM == null) {
      return null;
    }

    return $MenuDMCopyWith<$Res>(_self.editMenuDM!, (value) {
      return _then(_self.copyWith(editMenuDM: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ManageMenuVM].
extension ManageMenuVMPatterns on ManageMenuVM {
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
    TResult Function(_ManageMenuVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManageMenuVM() when $default != null:
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
    TResult Function(_ManageMenuVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageMenuVM():
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
    TResult? Function(_ManageMenuVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageMenuVM() when $default != null:
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
    TResult Function(
            MenuDM? menuDM,
            MenuDM? editMenuDM,
            int indexView,
            PageController? controller,
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
            bool editMode,
            bool avoidFocus,
            GlobalKey<FormState>? formKey,
            AutovalidateMode autovalidateMode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManageMenuVM() when $default != null:
        return $default(
            _that.menuDM,
            _that.editMenuDM,
            _that.indexView,
            _that.controller,
            _that.floatingButtonKey,
            _that.editMode,
            _that.avoidFocus,
            _that.formKey,
            _that.autovalidateMode);
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
    TResult Function(
            MenuDM? menuDM,
            MenuDM? editMenuDM,
            int indexView,
            PageController? controller,
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
            bool editMode,
            bool avoidFocus,
            GlobalKey<FormState>? formKey,
            AutovalidateMode autovalidateMode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageMenuVM():
        return $default(
            _that.menuDM,
            _that.editMenuDM,
            _that.indexView,
            _that.controller,
            _that.floatingButtonKey,
            _that.editMode,
            _that.avoidFocus,
            _that.formKey,
            _that.autovalidateMode);
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
    TResult? Function(
            MenuDM? menuDM,
            MenuDM? editMenuDM,
            int indexView,
            PageController? controller,
            GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
            bool editMode,
            bool avoidFocus,
            GlobalKey<FormState>? formKey,
            AutovalidateMode autovalidateMode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageMenuVM() when $default != null:
        return $default(
            _that.menuDM,
            _that.editMenuDM,
            _that.indexView,
            _that.controller,
            _that.floatingButtonKey,
            _that.editMode,
            _that.avoidFocus,
            _that.formKey,
            _that.autovalidateMode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ManageMenuVM extends ManageMenuVM {
  const _ManageMenuVM(
      {this.menuDM,
      this.editMenuDM,
      this.indexView = 0,
      this.controller,
      this.floatingButtonKey,
      this.editMode = false,
      this.avoidFocus = false,
      this.formKey,
      this.autovalidateMode = AutovalidateMode.disabled})
      : super._();

  @override
  final MenuDM? menuDM;
  @override
  final MenuDM? editMenuDM;
  @override
  @JsonKey()
  final int indexView;
  @override
  final PageController? controller;
  @override
  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;
  @override
  @JsonKey()
  final bool editMode;
  @override
  @JsonKey()
  final bool avoidFocus;
  @override
  final GlobalKey<FormState>? formKey;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;

  /// Create a copy of ManageMenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManageMenuVMCopyWith<_ManageMenuVM> get copyWith =>
      __$ManageMenuVMCopyWithImpl<_ManageMenuVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManageMenuVM &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM) &&
            (identical(other.editMenuDM, editMenuDM) ||
                other.editMenuDM == editMenuDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.floatingButtonKey, floatingButtonKey) ||
                other.floatingButtonKey == floatingButtonKey) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.avoidFocus, avoidFocus) ||
                other.avoidFocus == avoidFocus) &&
            (identical(other.formKey, formKey) || other.formKey == formKey) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      menuDM,
      editMenuDM,
      indexView,
      controller,
      floatingButtonKey,
      editMode,
      avoidFocus,
      formKey,
      autovalidateMode);

  @override
  String toString() {
    return 'ManageMenuVM(menuDM: $menuDM, editMenuDM: $editMenuDM, indexView: $indexView, controller: $controller, floatingButtonKey: $floatingButtonKey, editMode: $editMode, avoidFocus: $avoidFocus, formKey: $formKey, autovalidateMode: $autovalidateMode)';
  }
}

/// @nodoc
abstract mixin class _$ManageMenuVMCopyWith<$Res>
    implements $ManageMenuVMCopyWith<$Res> {
  factory _$ManageMenuVMCopyWith(
          _ManageMenuVM value, $Res Function(_ManageMenuVM) _then) =
      __$ManageMenuVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MenuDM? menuDM,
      MenuDM? editMenuDM,
      int indexView,
      PageController? controller,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
      bool editMode,
      bool avoidFocus,
      GlobalKey<FormState>? formKey,
      AutovalidateMode autovalidateMode});

  @override
  $MenuDMCopyWith<$Res>? get menuDM;
  @override
  $MenuDMCopyWith<$Res>? get editMenuDM;
}

/// @nodoc
class __$ManageMenuVMCopyWithImpl<$Res>
    implements _$ManageMenuVMCopyWith<$Res> {
  __$ManageMenuVMCopyWithImpl(this._self, this._then);

  final _ManageMenuVM _self;
  final $Res Function(_ManageMenuVM) _then;

  /// Create a copy of ManageMenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? menuDM = freezed,
    Object? editMenuDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? floatingButtonKey = freezed,
    Object? editMode = null,
    Object? avoidFocus = null,
    Object? formKey = freezed,
    Object? autovalidateMode = null,
  }) {
    return _then(_ManageMenuVM(
      menuDM: freezed == menuDM
          ? _self.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM?,
      editMenuDM: freezed == editMenuDM
          ? _self.editMenuDM
          : editMenuDM // ignore: cast_nullable_to_non_nullable
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
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      avoidFocus: null == avoidFocus
          ? _self.avoidFocus
          : avoidFocus // ignore: cast_nullable_to_non_nullable
              as bool,
      formKey: freezed == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
    ));
  }

  /// Create a copy of ManageMenuVM
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

  /// Create a copy of ManageMenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res>? get editMenuDM {
    if (_self.editMenuDM == null) {
      return null;
    }

    return $MenuDMCopyWith<$Res>(_self.editMenuDM!, (value) {
      return _then(_self.copyWith(editMenuDM: value));
    });
  }
}

// dart format on
