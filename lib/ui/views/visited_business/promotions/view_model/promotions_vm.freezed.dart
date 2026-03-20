// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotions_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PromotionsVM {
  List<PromotionDM> get promotions => throw _privateConstructorUsedError;
  String get businessUuid => throw _privateConstructorUsedError;
  BusinessDM? get businessDM => throw _privateConstructorUsedError;
  int get indexView => throw _privateConstructorUsedError;
  PageController? get controller => throw _privateConstructorUsedError;
  ScrollController? get activePromosScrollController =>
      throw _privateConstructorUsedError;
  ScrollController? get upcomingPromosScrollController =>
      throw _privateConstructorUsedError;

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionsVMCopyWith<PromotionsVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionsVMCopyWith<$Res> {
  factory $PromotionsVMCopyWith(
          PromotionsVM value, $Res Function(PromotionsVM) then) =
      _$PromotionsVMCopyWithImpl<$Res, PromotionsVM>;
  @useResult
  $Res call(
      {List<PromotionDM> promotions,
      String businessUuid,
      BusinessDM? businessDM,
      int indexView,
      PageController? controller,
      ScrollController? activePromosScrollController,
      ScrollController? upcomingPromosScrollController});

  $BusinessDMCopyWith<$Res>? get businessDM;
}

/// @nodoc
class _$PromotionsVMCopyWithImpl<$Res, $Val extends PromotionsVM>
    implements $PromotionsVMCopyWith<$Res> {
  _$PromotionsVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? businessUuid = null,
    Object? businessDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? activePromosScrollController = freezed,
    Object? upcomingPromosScrollController = freezed,
  }) {
    return _then(_value.copyWith(
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessDM: freezed == businessDM
          ? _value.businessDM
          : businessDM // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      indexView: null == indexView
          ? _value.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      activePromosScrollController: freezed == activePromosScrollController
          ? _value.activePromosScrollController
          : activePromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      upcomingPromosScrollController: freezed == upcomingPromosScrollController
          ? _value.upcomingPromosScrollController
          : upcomingPromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
    ) as $Val);
  }

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get businessDM {
    if (_value.businessDM == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_value.businessDM!, (value) {
      return _then(_value.copyWith(businessDM: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromotionsVMImplCopyWith<$Res>
    implements $PromotionsVMCopyWith<$Res> {
  factory _$$PromotionsVMImplCopyWith(
          _$PromotionsVMImpl value, $Res Function(_$PromotionsVMImpl) then) =
      __$$PromotionsVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PromotionDM> promotions,
      String businessUuid,
      BusinessDM? businessDM,
      int indexView,
      PageController? controller,
      ScrollController? activePromosScrollController,
      ScrollController? upcomingPromosScrollController});

  @override
  $BusinessDMCopyWith<$Res>? get businessDM;
}

/// @nodoc
class __$$PromotionsVMImplCopyWithImpl<$Res>
    extends _$PromotionsVMCopyWithImpl<$Res, _$PromotionsVMImpl>
    implements _$$PromotionsVMImplCopyWith<$Res> {
  __$$PromotionsVMImplCopyWithImpl(
      _$PromotionsVMImpl _value, $Res Function(_$PromotionsVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? businessUuid = null,
    Object? businessDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? activePromosScrollController = freezed,
    Object? upcomingPromosScrollController = freezed,
  }) {
    return _then(_$PromotionsVMImpl(
      promotions: null == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
      businessUuid: null == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessDM: freezed == businessDM
          ? _value.businessDM
          : businessDM // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      indexView: null == indexView
          ? _value.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      activePromosScrollController: freezed == activePromosScrollController
          ? _value.activePromosScrollController
          : activePromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      upcomingPromosScrollController: freezed == upcomingPromosScrollController
          ? _value.upcomingPromosScrollController
          : upcomingPromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
    ));
  }
}

/// @nodoc

class _$PromotionsVMImpl extends _PromotionsVM with DiagnosticableTreeMixin {
  const _$PromotionsVMImpl(
      {final List<PromotionDM> promotions = const [],
      this.businessUuid = '',
      this.businessDM,
      this.indexView = 0,
      this.controller,
      this.activePromosScrollController,
      this.upcomingPromosScrollController})
      : _promotions = promotions,
        super._();

  final List<PromotionDM> _promotions;
  @override
  @JsonKey()
  List<PromotionDM> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  @override
  @JsonKey()
  final String businessUuid;
  @override
  final BusinessDM? businessDM;
  @override
  @JsonKey()
  final int indexView;
  @override
  final PageController? controller;
  @override
  final ScrollController? activePromosScrollController;
  @override
  final ScrollController? upcomingPromosScrollController;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromotionsVM(promotions: $promotions, businessUuid: $businessUuid, businessDM: $businessDM, indexView: $indexView, controller: $controller, activePromosScrollController: $activePromosScrollController, upcomingPromosScrollController: $upcomingPromosScrollController)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PromotionsVM'))
      ..add(DiagnosticsProperty('promotions', promotions))
      ..add(DiagnosticsProperty('businessUuid', businessUuid))
      ..add(DiagnosticsProperty('businessDM', businessDM))
      ..add(DiagnosticsProperty('indexView', indexView))
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty(
          'activePromosScrollController', activePromosScrollController))
      ..add(DiagnosticsProperty(
          'upcomingPromosScrollController', upcomingPromosScrollController));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionsVMImpl &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessDM, businessDM) ||
                other.businessDM == businessDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.activePromosScrollController,
                    activePromosScrollController) ||
                other.activePromosScrollController ==
                    activePromosScrollController) &&
            (identical(other.upcomingPromosScrollController,
                    upcomingPromosScrollController) ||
                other.upcomingPromosScrollController ==
                    upcomingPromosScrollController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_promotions),
      businessUuid,
      businessDM,
      indexView,
      controller,
      activePromosScrollController,
      upcomingPromosScrollController);

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionsVMImplCopyWith<_$PromotionsVMImpl> get copyWith =>
      __$$PromotionsVMImplCopyWithImpl<_$PromotionsVMImpl>(this, _$identity);
}

abstract class _PromotionsVM extends PromotionsVM {
  const factory _PromotionsVM(
          {final List<PromotionDM> promotions,
          final String businessUuid,
          final BusinessDM? businessDM,
          final int indexView,
          final PageController? controller,
          final ScrollController? activePromosScrollController,
          final ScrollController? upcomingPromosScrollController}) =
      _$PromotionsVMImpl;
  const _PromotionsVM._() : super._();

  @override
  List<PromotionDM> get promotions;
  @override
  String get businessUuid;
  @override
  BusinessDM? get businessDM;
  @override
  int get indexView;
  @override
  PageController? get controller;
  @override
  ScrollController? get activePromosScrollController;
  @override
  ScrollController? get upcomingPromosScrollController;

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionsVMImplCopyWith<_$PromotionsVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
