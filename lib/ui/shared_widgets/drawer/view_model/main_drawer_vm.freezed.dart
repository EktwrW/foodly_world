// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_drawer_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainDrawerVM {
  SidebarXController get sidebarController =>
      throw _privateConstructorUsedError;
  List<int> get indexHistory => throw _privateConstructorUsedError;

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainDrawerVMCopyWith<MainDrawerVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDrawerVMCopyWith<$Res> {
  factory $MainDrawerVMCopyWith(
          MainDrawerVM value, $Res Function(MainDrawerVM) then) =
      _$MainDrawerVMCopyWithImpl<$Res, MainDrawerVM>;
  @useResult
  $Res call({SidebarXController sidebarController, List<int> indexHistory});
}

/// @nodoc
class _$MainDrawerVMCopyWithImpl<$Res, $Val extends MainDrawerVM>
    implements $MainDrawerVMCopyWith<$Res> {
  _$MainDrawerVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sidebarController = null,
    Object? indexHistory = null,
  }) {
    return _then(_value.copyWith(
      sidebarController: null == sidebarController
          ? _value.sidebarController
          : sidebarController // ignore: cast_nullable_to_non_nullable
              as SidebarXController,
      indexHistory: null == indexHistory
          ? _value.indexHistory
          : indexHistory // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainDrawerVMImplCopyWith<$Res>
    implements $MainDrawerVMCopyWith<$Res> {
  factory _$$MainDrawerVMImplCopyWith(
          _$MainDrawerVMImpl value, $Res Function(_$MainDrawerVMImpl) then) =
      __$$MainDrawerVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SidebarXController sidebarController, List<int> indexHistory});
}

/// @nodoc
class __$$MainDrawerVMImplCopyWithImpl<$Res>
    extends _$MainDrawerVMCopyWithImpl<$Res, _$MainDrawerVMImpl>
    implements _$$MainDrawerVMImplCopyWith<$Res> {
  __$$MainDrawerVMImplCopyWithImpl(
      _$MainDrawerVMImpl _value, $Res Function(_$MainDrawerVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sidebarController = null,
    Object? indexHistory = null,
  }) {
    return _then(_$MainDrawerVMImpl(
      sidebarController: null == sidebarController
          ? _value.sidebarController
          : sidebarController // ignore: cast_nullable_to_non_nullable
              as SidebarXController,
      indexHistory: null == indexHistory
          ? _value._indexHistory
          : indexHistory // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$MainDrawerVMImpl extends _MainDrawerVM {
  const _$MainDrawerVMImpl(
      {required this.sidebarController,
      final List<int> indexHistory = const [0]})
      : _indexHistory = indexHistory,
        super._();

  @override
  final SidebarXController sidebarController;
  final List<int> _indexHistory;
  @override
  @JsonKey()
  List<int> get indexHistory {
    if (_indexHistory is EqualUnmodifiableListView) return _indexHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_indexHistory);
  }

  @override
  String toString() {
    return 'MainDrawerVM(sidebarController: $sidebarController, indexHistory: $indexHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDrawerVMImpl &&
            (identical(other.sidebarController, sidebarController) ||
                other.sidebarController == sidebarController) &&
            const DeepCollectionEquality()
                .equals(other._indexHistory, _indexHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sidebarController,
      const DeepCollectionEquality().hash(_indexHistory));

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainDrawerVMImplCopyWith<_$MainDrawerVMImpl> get copyWith =>
      __$$MainDrawerVMImplCopyWithImpl<_$MainDrawerVMImpl>(this, _$identity);
}

abstract class _MainDrawerVM extends MainDrawerVM {
  const factory _MainDrawerVM(
      {required final SidebarXController sidebarController,
      final List<int> indexHistory}) = _$MainDrawerVMImpl;
  const _MainDrawerVM._() : super._();

  @override
  SidebarXController get sidebarController;
  @override
  List<int> get indexHistory;

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainDrawerVMImplCopyWith<_$MainDrawerVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
