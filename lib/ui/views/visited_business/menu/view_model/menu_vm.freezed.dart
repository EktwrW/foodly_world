// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuVM {
  MenuDM? get menuDM => throw _privateConstructorUsedError;
  int get indexView => throw _privateConstructorUsedError;
  PageController? get controller => throw _privateConstructorUsedError;
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey =>
      throw _privateConstructorUsedError;

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuVMCopyWith<MenuVM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuVMCopyWith<$Res> {
  factory $MenuVMCopyWith(MenuVM value, $Res Function(MenuVM) then) =
      _$MenuVMCopyWithImpl<$Res, MenuVM>;
  @useResult
  $Res call(
      {MenuDM? menuDM,
      int indexView,
      PageController? controller,
      GlobalKey<FabCircularMenuPlusState>? floatingButtonKey});

  $MenuDMCopyWith<$Res>? get menuDM;
}

/// @nodoc
class _$MenuVMCopyWithImpl<$Res, $Val extends MenuVM>
    implements $MenuVMCopyWith<$Res> {
  _$MenuVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      menuDM: freezed == menuDM
          ? _value.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM?,
      indexView: null == indexView
          ? _value.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      floatingButtonKey: freezed == floatingButtonKey
          ? _value.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ) as $Val);
  }

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res>? get menuDM {
    if (_value.menuDM == null) {
      return null;
    }

    return $MenuDMCopyWith<$Res>(_value.menuDM!, (value) {
      return _then(_value.copyWith(menuDM: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuVMImplCopyWith<$Res> implements $MenuVMCopyWith<$Res> {
  factory _$$MenuVMImplCopyWith(
          _$MenuVMImpl value, $Res Function(_$MenuVMImpl) then) =
      __$$MenuVMImplCopyWithImpl<$Res>;
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
class __$$MenuVMImplCopyWithImpl<$Res>
    extends _$MenuVMCopyWithImpl<$Res, _$MenuVMImpl>
    implements _$$MenuVMImplCopyWith<$Res> {
  __$$MenuVMImplCopyWithImpl(
      _$MenuVMImpl _value, $Res Function(_$MenuVMImpl) _then)
      : super(_value, _then);

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
    return _then(_$MenuVMImpl(
      menuDM: freezed == menuDM
          ? _value.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM?,
      indexView: null == indexView
          ? _value.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      floatingButtonKey: freezed == floatingButtonKey
          ? _value.floatingButtonKey
          : floatingButtonKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FabCircularMenuPlusState>?,
    ));
  }
}

/// @nodoc

class _$MenuVMImpl extends _MenuVM {
  const _$MenuVMImpl(
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

  @override
  String toString() {
    return 'MenuVM(menuDM: $menuDM, indexView: $indexView, controller: $controller, floatingButtonKey: $floatingButtonKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuVMImpl &&
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

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuVMImplCopyWith<_$MenuVMImpl> get copyWith =>
      __$$MenuVMImplCopyWithImpl<_$MenuVMImpl>(this, _$identity);
}

abstract class _MenuVM extends MenuVM {
  const factory _MenuVM(
          {final MenuDM? menuDM,
          final int indexView,
          final PageController? controller,
          final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey}) =
      _$MenuVMImpl;
  const _MenuVM._() : super._();

  @override
  MenuDM? get menuDM;
  @override
  int get indexView;
  @override
  PageController? get controller;
  @override
  GlobalKey<FabCircularMenuPlusState>? get floatingButtonKey;

  /// Create a copy of MenuVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuVMImplCopyWith<_$MenuVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
