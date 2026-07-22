// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotions_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionsVM implements DiagnosticableTreeMixin {
  List<PromotionDM> get promotions;
  String get businessUuid;
  BusinessDM? get businessDM;
  int get indexView;
  PageController? get controller;
  ScrollController? get activePromosScrollController;
  ScrollController? get upcomingPromosScrollController;

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionsVMCopyWith<PromotionsVM> get copyWith =>
      _$PromotionsVMCopyWithImpl<PromotionsVM>(
          this as PromotionsVM, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is PromotionsVM &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions) &&
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
      const DeepCollectionEquality().hash(promotions),
      businessUuid,
      businessDM,
      indexView,
      controller,
      activePromosScrollController,
      upcomingPromosScrollController);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromotionsVM(promotions: $promotions, businessUuid: $businessUuid, businessDM: $businessDM, indexView: $indexView, controller: $controller, activePromosScrollController: $activePromosScrollController, upcomingPromosScrollController: $upcomingPromosScrollController)';
  }
}

/// @nodoc
abstract mixin class $PromotionsVMCopyWith<$Res> {
  factory $PromotionsVMCopyWith(
          PromotionsVM value, $Res Function(PromotionsVM) _then) =
      _$PromotionsVMCopyWithImpl;
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
class _$PromotionsVMCopyWithImpl<$Res> implements $PromotionsVMCopyWith<$Res> {
  _$PromotionsVMCopyWithImpl(this._self, this._then);

  final PromotionsVM _self;
  final $Res Function(PromotionsVM) _then;

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
    return _then(_self.copyWith(
      promotions: null == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessDM: freezed == businessDM
          ? _self.businessDM
          : businessDM // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      indexView: null == indexView
          ? _self.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      activePromosScrollController: freezed == activePromosScrollController
          ? _self.activePromosScrollController
          : activePromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      upcomingPromosScrollController: freezed == upcomingPromosScrollController
          ? _self.upcomingPromosScrollController
          : upcomingPromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
    ));
  }

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get businessDM {
    if (_self.businessDM == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.businessDM!, (value) {
      return _then(_self.copyWith(businessDM: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PromotionsVM].
extension PromotionsVMPatterns on PromotionsVM {
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
    TResult Function(_PromotionsVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM() when $default != null:
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
    TResult Function(_PromotionsVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM():
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
    TResult? Function(_PromotionsVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM() when $default != null:
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
            List<PromotionDM> promotions,
            String businessUuid,
            BusinessDM? businessDM,
            int indexView,
            PageController? controller,
            ScrollController? activePromosScrollController,
            ScrollController? upcomingPromosScrollController)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM() when $default != null:
        return $default(
            _that.promotions,
            _that.businessUuid,
            _that.businessDM,
            _that.indexView,
            _that.controller,
            _that.activePromosScrollController,
            _that.upcomingPromosScrollController);
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
            List<PromotionDM> promotions,
            String businessUuid,
            BusinessDM? businessDM,
            int indexView,
            PageController? controller,
            ScrollController? activePromosScrollController,
            ScrollController? upcomingPromosScrollController)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM():
        return $default(
            _that.promotions,
            _that.businessUuid,
            _that.businessDM,
            _that.indexView,
            _that.controller,
            _that.activePromosScrollController,
            _that.upcomingPromosScrollController);
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
            List<PromotionDM> promotions,
            String businessUuid,
            BusinessDM? businessDM,
            int indexView,
            PageController? controller,
            ScrollController? activePromosScrollController,
            ScrollController? upcomingPromosScrollController)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM() when $default != null:
        return $default(
            _that.promotions,
            _that.businessUuid,
            _that.businessDM,
            _that.indexView,
            _that.controller,
            _that.activePromosScrollController,
            _that.upcomingPromosScrollController);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PromotionsVM extends PromotionsVM with DiagnosticableTreeMixin {
  const _PromotionsVM(
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

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionsVMCopyWith<_PromotionsVM> get copyWith =>
      __$PromotionsVMCopyWithImpl<_PromotionsVM>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _PromotionsVM &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromotionsVM(promotions: $promotions, businessUuid: $businessUuid, businessDM: $businessDM, indexView: $indexView, controller: $controller, activePromosScrollController: $activePromosScrollController, upcomingPromosScrollController: $upcomingPromosScrollController)';
  }
}

/// @nodoc
abstract mixin class _$PromotionsVMCopyWith<$Res>
    implements $PromotionsVMCopyWith<$Res> {
  factory _$PromotionsVMCopyWith(
          _PromotionsVM value, $Res Function(_PromotionsVM) _then) =
      __$PromotionsVMCopyWithImpl;
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
class __$PromotionsVMCopyWithImpl<$Res>
    implements _$PromotionsVMCopyWith<$Res> {
  __$PromotionsVMCopyWithImpl(this._self, this._then);

  final _PromotionsVM _self;
  final $Res Function(_PromotionsVM) _then;

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? promotions = null,
    Object? businessUuid = null,
    Object? businessDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? activePromosScrollController = freezed,
    Object? upcomingPromosScrollController = freezed,
  }) {
    return _then(_PromotionsVM(
      promotions: null == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessDM: freezed == businessDM
          ? _self.businessDM
          : businessDM // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      indexView: null == indexView
          ? _self.indexView
          : indexView // ignore: cast_nullable_to_non_nullable
              as int,
      controller: freezed == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController?,
      activePromosScrollController: freezed == activePromosScrollController
          ? _self.activePromosScrollController
          : activePromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      upcomingPromosScrollController: freezed == upcomingPromosScrollController
          ? _self.upcomingPromosScrollController
          : upcomingPromosScrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
    ));
  }

  /// Create a copy of PromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get businessDM {
    if (_self.businessDM == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.businessDM!, (value) {
      return _then(_self.copyWith(businessDM: value));
    });
  }
}

// dart format on
