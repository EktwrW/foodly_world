// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_promotions_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagePromotionsVM implements DiagnosticableTreeMixin {
  PromotionEditing get editing;
  List<PromotionDM> get promotions;
  InputController? get titleCtrl;
  InputController? get subtitleCtrl;
  InputController? get descriptionCtrl;
  InputController? get promptCtrl;
  TextEditingController? get youtubeUrlCtrl;
  GlobalKey<FormState>? get youtubeUrlFormKey;
  Map<int, bool> get activeDays;
  AutovalidateMode get autovalidateMode;
  PromotionDM? get newPromo;
  BusinessDM? get businessDM;
  int get indexView;
  PageController? get controller;
  (String, MediaType)? get newPromoMediaPath;
  Uint8List? get imageBytes;
  VideoPlayerController? get videoController;
  ScrollController? get activePromosScrollController;
  ScrollController? get upcomingPromosScrollController;

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagePromotionsVMCopyWith<ManagePromotionsVM> get copyWith =>
      _$ManagePromotionsVMCopyWithImpl<ManagePromotionsVM>(
          this as ManagePromotionsVM, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsVM'))
      ..add(DiagnosticsProperty('editing', editing))
      ..add(DiagnosticsProperty('promotions', promotions))
      ..add(DiagnosticsProperty('titleCtrl', titleCtrl))
      ..add(DiagnosticsProperty('subtitleCtrl', subtitleCtrl))
      ..add(DiagnosticsProperty('descriptionCtrl', descriptionCtrl))
      ..add(DiagnosticsProperty('promptCtrl', promptCtrl))
      ..add(DiagnosticsProperty('youtubeUrlCtrl', youtubeUrlCtrl))
      ..add(DiagnosticsProperty('youtubeUrlFormKey', youtubeUrlFormKey))
      ..add(DiagnosticsProperty('activeDays', activeDays))
      ..add(DiagnosticsProperty('autovalidateMode', autovalidateMode))
      ..add(DiagnosticsProperty('newPromo', newPromo))
      ..add(DiagnosticsProperty('businessDM', businessDM))
      ..add(DiagnosticsProperty('indexView', indexView))
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty('newPromoMediaPath', newPromoMediaPath))
      ..add(DiagnosticsProperty('imageBytes', imageBytes))
      ..add(DiagnosticsProperty('videoController', videoController))
      ..add(DiagnosticsProperty(
          'activePromosScrollController', activePromosScrollController))
      ..add(DiagnosticsProperty(
          'upcomingPromosScrollController', upcomingPromosScrollController));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagePromotionsVM &&
            (identical(other.editing, editing) || other.editing == editing) &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions) &&
            (identical(other.titleCtrl, titleCtrl) ||
                other.titleCtrl == titleCtrl) &&
            (identical(other.subtitleCtrl, subtitleCtrl) ||
                other.subtitleCtrl == subtitleCtrl) &&
            (identical(other.descriptionCtrl, descriptionCtrl) ||
                other.descriptionCtrl == descriptionCtrl) &&
            (identical(other.promptCtrl, promptCtrl) ||
                other.promptCtrl == promptCtrl) &&
            (identical(other.youtubeUrlCtrl, youtubeUrlCtrl) ||
                other.youtubeUrlCtrl == youtubeUrlCtrl) &&
            (identical(other.youtubeUrlFormKey, youtubeUrlFormKey) ||
                other.youtubeUrlFormKey == youtubeUrlFormKey) &&
            const DeepCollectionEquality()
                .equals(other.activeDays, activeDays) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.newPromo, newPromo) ||
                other.newPromo == newPromo) &&
            (identical(other.businessDM, businessDM) ||
                other.businessDM == businessDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.newPromoMediaPath, newPromoMediaPath) ||
                other.newPromoMediaPath == newPromoMediaPath) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            (identical(other.videoController, videoController) ||
                other.videoController == videoController) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        editing,
        const DeepCollectionEquality().hash(promotions),
        titleCtrl,
        subtitleCtrl,
        descriptionCtrl,
        promptCtrl,
        youtubeUrlCtrl,
        youtubeUrlFormKey,
        const DeepCollectionEquality().hash(activeDays),
        autovalidateMode,
        newPromo,
        businessDM,
        indexView,
        controller,
        newPromoMediaPath,
        const DeepCollectionEquality().hash(imageBytes),
        videoController,
        activePromosScrollController,
        upcomingPromosScrollController
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ManagePromotionsVM(editing: $editing, promotions: $promotions, titleCtrl: $titleCtrl, subtitleCtrl: $subtitleCtrl, descriptionCtrl: $descriptionCtrl, promptCtrl: $promptCtrl, youtubeUrlCtrl: $youtubeUrlCtrl, youtubeUrlFormKey: $youtubeUrlFormKey, activeDays: $activeDays, autovalidateMode: $autovalidateMode, newPromo: $newPromo, businessDM: $businessDM, indexView: $indexView, controller: $controller, newPromoMediaPath: $newPromoMediaPath, imageBytes: $imageBytes, videoController: $videoController, activePromosScrollController: $activePromosScrollController, upcomingPromosScrollController: $upcomingPromosScrollController)';
  }
}

/// @nodoc
abstract mixin class $ManagePromotionsVMCopyWith<$Res> {
  factory $ManagePromotionsVMCopyWith(
          ManagePromotionsVM value, $Res Function(ManagePromotionsVM) _then) =
      _$ManagePromotionsVMCopyWithImpl;
  @useResult
  $Res call(
      {PromotionEditing editing,
      List<PromotionDM> promotions,
      InputController? titleCtrl,
      InputController? subtitleCtrl,
      InputController? descriptionCtrl,
      InputController? promptCtrl,
      TextEditingController? youtubeUrlCtrl,
      GlobalKey<FormState>? youtubeUrlFormKey,
      Map<int, bool> activeDays,
      AutovalidateMode autovalidateMode,
      PromotionDM? newPromo,
      BusinessDM? businessDM,
      int indexView,
      PageController? controller,
      (String, MediaType)? newPromoMediaPath,
      Uint8List? imageBytes,
      VideoPlayerController? videoController,
      ScrollController? activePromosScrollController,
      ScrollController? upcomingPromosScrollController});

  $InputControllerCopyWith<$Res>? get titleCtrl;
  $InputControllerCopyWith<$Res>? get subtitleCtrl;
  $InputControllerCopyWith<$Res>? get descriptionCtrl;
  $InputControllerCopyWith<$Res>? get promptCtrl;
  $PromotionDMCopyWith<$Res>? get newPromo;
  $BusinessDMCopyWith<$Res>? get businessDM;
}

/// @nodoc
class _$ManagePromotionsVMCopyWithImpl<$Res>
    implements $ManagePromotionsVMCopyWith<$Res> {
  _$ManagePromotionsVMCopyWithImpl(this._self, this._then);

  final ManagePromotionsVM _self;
  final $Res Function(ManagePromotionsVM) _then;

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editing = null,
    Object? promotions = null,
    Object? titleCtrl = freezed,
    Object? subtitleCtrl = freezed,
    Object? descriptionCtrl = freezed,
    Object? promptCtrl = freezed,
    Object? youtubeUrlCtrl = freezed,
    Object? youtubeUrlFormKey = freezed,
    Object? activeDays = null,
    Object? autovalidateMode = null,
    Object? newPromo = freezed,
    Object? businessDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? newPromoMediaPath = freezed,
    Object? imageBytes = freezed,
    Object? videoController = freezed,
    Object? activePromosScrollController = freezed,
    Object? upcomingPromosScrollController = freezed,
  }) {
    return _then(_self.copyWith(
      editing: null == editing
          ? _self.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as PromotionEditing,
      promotions: null == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
      titleCtrl: freezed == titleCtrl
          ? _self.titleCtrl
          : titleCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      subtitleCtrl: freezed == subtitleCtrl
          ? _self.subtitleCtrl
          : subtitleCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      descriptionCtrl: freezed == descriptionCtrl
          ? _self.descriptionCtrl
          : descriptionCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      promptCtrl: freezed == promptCtrl
          ? _self.promptCtrl
          : promptCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      youtubeUrlCtrl: freezed == youtubeUrlCtrl
          ? _self.youtubeUrlCtrl
          : youtubeUrlCtrl // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      youtubeUrlFormKey: freezed == youtubeUrlFormKey
          ? _self.youtubeUrlFormKey
          : youtubeUrlFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      activeDays: null == activeDays
          ? _self.activeDays
          : activeDays // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      newPromo: freezed == newPromo
          ? _self.newPromo
          : newPromo // ignore: cast_nullable_to_non_nullable
              as PromotionDM?,
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
      newPromoMediaPath: freezed == newPromoMediaPath
          ? _self.newPromoMediaPath
          : newPromoMediaPath // ignore: cast_nullable_to_non_nullable
              as (String, MediaType)?,
      imageBytes: freezed == imageBytes
          ? _self.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      videoController: freezed == videoController
          ? _self.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
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

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get titleCtrl {
    if (_self.titleCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.titleCtrl!, (value) {
      return _then(_self.copyWith(titleCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get subtitleCtrl {
    if (_self.subtitleCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.subtitleCtrl!, (value) {
      return _then(_self.copyWith(subtitleCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get descriptionCtrl {
    if (_self.descriptionCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.descriptionCtrl!, (value) {
      return _then(_self.copyWith(descriptionCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get promptCtrl {
    if (_self.promptCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.promptCtrl!, (value) {
      return _then(_self.copyWith(promptCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionDMCopyWith<$Res>? get newPromo {
    if (_self.newPromo == null) {
      return null;
    }

    return $PromotionDMCopyWith<$Res>(_self.newPromo!, (value) {
      return _then(_self.copyWith(newPromo: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
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

/// Adds pattern-matching-related methods to [ManagePromotionsVM].
extension ManagePromotionsVMPatterns on ManagePromotionsVM {
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
            PromotionEditing editing,
            List<PromotionDM> promotions,
            InputController? titleCtrl,
            InputController? subtitleCtrl,
            InputController? descriptionCtrl,
            InputController? promptCtrl,
            TextEditingController? youtubeUrlCtrl,
            GlobalKey<FormState>? youtubeUrlFormKey,
            Map<int, bool> activeDays,
            AutovalidateMode autovalidateMode,
            PromotionDM? newPromo,
            BusinessDM? businessDM,
            int indexView,
            PageController? controller,
            (String, MediaType)? newPromoMediaPath,
            Uint8List? imageBytes,
            VideoPlayerController? videoController,
            ScrollController? activePromosScrollController,
            ScrollController? upcomingPromosScrollController)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM() when $default != null:
        return $default(
            _that.editing,
            _that.promotions,
            _that.titleCtrl,
            _that.subtitleCtrl,
            _that.descriptionCtrl,
            _that.promptCtrl,
            _that.youtubeUrlCtrl,
            _that.youtubeUrlFormKey,
            _that.activeDays,
            _that.autovalidateMode,
            _that.newPromo,
            _that.businessDM,
            _that.indexView,
            _that.controller,
            _that.newPromoMediaPath,
            _that.imageBytes,
            _that.videoController,
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
            PromotionEditing editing,
            List<PromotionDM> promotions,
            InputController? titleCtrl,
            InputController? subtitleCtrl,
            InputController? descriptionCtrl,
            InputController? promptCtrl,
            TextEditingController? youtubeUrlCtrl,
            GlobalKey<FormState>? youtubeUrlFormKey,
            Map<int, bool> activeDays,
            AutovalidateMode autovalidateMode,
            PromotionDM? newPromo,
            BusinessDM? businessDM,
            int indexView,
            PageController? controller,
            (String, MediaType)? newPromoMediaPath,
            Uint8List? imageBytes,
            VideoPlayerController? videoController,
            ScrollController? activePromosScrollController,
            ScrollController? upcomingPromosScrollController)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM():
        return $default(
            _that.editing,
            _that.promotions,
            _that.titleCtrl,
            _that.subtitleCtrl,
            _that.descriptionCtrl,
            _that.promptCtrl,
            _that.youtubeUrlCtrl,
            _that.youtubeUrlFormKey,
            _that.activeDays,
            _that.autovalidateMode,
            _that.newPromo,
            _that.businessDM,
            _that.indexView,
            _that.controller,
            _that.newPromoMediaPath,
            _that.imageBytes,
            _that.videoController,
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
            PromotionEditing editing,
            List<PromotionDM> promotions,
            InputController? titleCtrl,
            InputController? subtitleCtrl,
            InputController? descriptionCtrl,
            InputController? promptCtrl,
            TextEditingController? youtubeUrlCtrl,
            GlobalKey<FormState>? youtubeUrlFormKey,
            Map<int, bool> activeDays,
            AutovalidateMode autovalidateMode,
            PromotionDM? newPromo,
            BusinessDM? businessDM,
            int indexView,
            PageController? controller,
            (String, MediaType)? newPromoMediaPath,
            Uint8List? imageBytes,
            VideoPlayerController? videoController,
            ScrollController? activePromosScrollController,
            ScrollController? upcomingPromosScrollController)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsVM() when $default != null:
        return $default(
            _that.editing,
            _that.promotions,
            _that.titleCtrl,
            _that.subtitleCtrl,
            _that.descriptionCtrl,
            _that.promptCtrl,
            _that.youtubeUrlCtrl,
            _that.youtubeUrlFormKey,
            _that.activeDays,
            _that.autovalidateMode,
            _that.newPromo,
            _that.businessDM,
            _that.indexView,
            _that.controller,
            _that.newPromoMediaPath,
            _that.imageBytes,
            _that.videoController,
            _that.activePromosScrollController,
            _that.upcomingPromosScrollController);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PromotionsVM extends ManagePromotionsVM with DiagnosticableTreeMixin {
  const _PromotionsVM(
      {this.editing = PromotionEditing.none,
      final List<PromotionDM> promotions = const [],
      this.titleCtrl,
      this.subtitleCtrl,
      this.descriptionCtrl,
      this.promptCtrl,
      this.youtubeUrlCtrl,
      this.youtubeUrlFormKey,
      final Map<int, bool> activeDays = const {},
      this.autovalidateMode = AutovalidateMode.disabled,
      this.newPromo,
      this.businessDM,
      this.indexView = 0,
      this.controller,
      this.newPromoMediaPath,
      this.imageBytes,
      this.videoController,
      this.activePromosScrollController,
      this.upcomingPromosScrollController})
      : _promotions = promotions,
        _activeDays = activeDays,
        super._();

  @override
  @JsonKey()
  final PromotionEditing editing;
  final List<PromotionDM> _promotions;
  @override
  @JsonKey()
  List<PromotionDM> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  @override
  final InputController? titleCtrl;
  @override
  final InputController? subtitleCtrl;
  @override
  final InputController? descriptionCtrl;
  @override
  final InputController? promptCtrl;
  @override
  final TextEditingController? youtubeUrlCtrl;
  @override
  final GlobalKey<FormState>? youtubeUrlFormKey;
  final Map<int, bool> _activeDays;
  @override
  @JsonKey()
  Map<int, bool> get activeDays {
    if (_activeDays is EqualUnmodifiableMapView) return _activeDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activeDays);
  }

  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  @override
  final PromotionDM? newPromo;
  @override
  final BusinessDM? businessDM;
  @override
  @JsonKey()
  final int indexView;
  @override
  final PageController? controller;
  @override
  final (String, MediaType)? newPromoMediaPath;
  @override
  final Uint8List? imageBytes;
  @override
  final VideoPlayerController? videoController;
  @override
  final ScrollController? activePromosScrollController;
  @override
  final ScrollController? upcomingPromosScrollController;

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionsVMCopyWith<_PromotionsVM> get copyWith =>
      __$PromotionsVMCopyWithImpl<_PromotionsVM>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ManagePromotionsVM'))
      ..add(DiagnosticsProperty('editing', editing))
      ..add(DiagnosticsProperty('promotions', promotions))
      ..add(DiagnosticsProperty('titleCtrl', titleCtrl))
      ..add(DiagnosticsProperty('subtitleCtrl', subtitleCtrl))
      ..add(DiagnosticsProperty('descriptionCtrl', descriptionCtrl))
      ..add(DiagnosticsProperty('promptCtrl', promptCtrl))
      ..add(DiagnosticsProperty('youtubeUrlCtrl', youtubeUrlCtrl))
      ..add(DiagnosticsProperty('youtubeUrlFormKey', youtubeUrlFormKey))
      ..add(DiagnosticsProperty('activeDays', activeDays))
      ..add(DiagnosticsProperty('autovalidateMode', autovalidateMode))
      ..add(DiagnosticsProperty('newPromo', newPromo))
      ..add(DiagnosticsProperty('businessDM', businessDM))
      ..add(DiagnosticsProperty('indexView', indexView))
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty('newPromoMediaPath', newPromoMediaPath))
      ..add(DiagnosticsProperty('imageBytes', imageBytes))
      ..add(DiagnosticsProperty('videoController', videoController))
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
            (identical(other.editing, editing) || other.editing == editing) &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            (identical(other.titleCtrl, titleCtrl) ||
                other.titleCtrl == titleCtrl) &&
            (identical(other.subtitleCtrl, subtitleCtrl) ||
                other.subtitleCtrl == subtitleCtrl) &&
            (identical(other.descriptionCtrl, descriptionCtrl) ||
                other.descriptionCtrl == descriptionCtrl) &&
            (identical(other.promptCtrl, promptCtrl) ||
                other.promptCtrl == promptCtrl) &&
            (identical(other.youtubeUrlCtrl, youtubeUrlCtrl) ||
                other.youtubeUrlCtrl == youtubeUrlCtrl) &&
            (identical(other.youtubeUrlFormKey, youtubeUrlFormKey) ||
                other.youtubeUrlFormKey == youtubeUrlFormKey) &&
            const DeepCollectionEquality()
                .equals(other._activeDays, _activeDays) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.newPromo, newPromo) ||
                other.newPromo == newPromo) &&
            (identical(other.businessDM, businessDM) ||
                other.businessDM == businessDM) &&
            (identical(other.indexView, indexView) ||
                other.indexView == indexView) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.newPromoMediaPath, newPromoMediaPath) ||
                other.newPromoMediaPath == newPromoMediaPath) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            (identical(other.videoController, videoController) ||
                other.videoController == videoController) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        editing,
        const DeepCollectionEquality().hash(_promotions),
        titleCtrl,
        subtitleCtrl,
        descriptionCtrl,
        promptCtrl,
        youtubeUrlCtrl,
        youtubeUrlFormKey,
        const DeepCollectionEquality().hash(_activeDays),
        autovalidateMode,
        newPromo,
        businessDM,
        indexView,
        controller,
        newPromoMediaPath,
        const DeepCollectionEquality().hash(imageBytes),
        videoController,
        activePromosScrollController,
        upcomingPromosScrollController
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ManagePromotionsVM(editing: $editing, promotions: $promotions, titleCtrl: $titleCtrl, subtitleCtrl: $subtitleCtrl, descriptionCtrl: $descriptionCtrl, promptCtrl: $promptCtrl, youtubeUrlCtrl: $youtubeUrlCtrl, youtubeUrlFormKey: $youtubeUrlFormKey, activeDays: $activeDays, autovalidateMode: $autovalidateMode, newPromo: $newPromo, businessDM: $businessDM, indexView: $indexView, controller: $controller, newPromoMediaPath: $newPromoMediaPath, imageBytes: $imageBytes, videoController: $videoController, activePromosScrollController: $activePromosScrollController, upcomingPromosScrollController: $upcomingPromosScrollController)';
  }
}

/// @nodoc
abstract mixin class _$PromotionsVMCopyWith<$Res>
    implements $ManagePromotionsVMCopyWith<$Res> {
  factory _$PromotionsVMCopyWith(
          _PromotionsVM value, $Res Function(_PromotionsVM) _then) =
      __$PromotionsVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PromotionEditing editing,
      List<PromotionDM> promotions,
      InputController? titleCtrl,
      InputController? subtitleCtrl,
      InputController? descriptionCtrl,
      InputController? promptCtrl,
      TextEditingController? youtubeUrlCtrl,
      GlobalKey<FormState>? youtubeUrlFormKey,
      Map<int, bool> activeDays,
      AutovalidateMode autovalidateMode,
      PromotionDM? newPromo,
      BusinessDM? businessDM,
      int indexView,
      PageController? controller,
      (String, MediaType)? newPromoMediaPath,
      Uint8List? imageBytes,
      VideoPlayerController? videoController,
      ScrollController? activePromosScrollController,
      ScrollController? upcomingPromosScrollController});

  @override
  $InputControllerCopyWith<$Res>? get titleCtrl;
  @override
  $InputControllerCopyWith<$Res>? get subtitleCtrl;
  @override
  $InputControllerCopyWith<$Res>? get descriptionCtrl;
  @override
  $InputControllerCopyWith<$Res>? get promptCtrl;
  @override
  $PromotionDMCopyWith<$Res>? get newPromo;
  @override
  $BusinessDMCopyWith<$Res>? get businessDM;
}

/// @nodoc
class __$PromotionsVMCopyWithImpl<$Res>
    implements _$PromotionsVMCopyWith<$Res> {
  __$PromotionsVMCopyWithImpl(this._self, this._then);

  final _PromotionsVM _self;
  final $Res Function(_PromotionsVM) _then;

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? editing = null,
    Object? promotions = null,
    Object? titleCtrl = freezed,
    Object? subtitleCtrl = freezed,
    Object? descriptionCtrl = freezed,
    Object? promptCtrl = freezed,
    Object? youtubeUrlCtrl = freezed,
    Object? youtubeUrlFormKey = freezed,
    Object? activeDays = null,
    Object? autovalidateMode = null,
    Object? newPromo = freezed,
    Object? businessDM = freezed,
    Object? indexView = null,
    Object? controller = freezed,
    Object? newPromoMediaPath = freezed,
    Object? imageBytes = freezed,
    Object? videoController = freezed,
    Object? activePromosScrollController = freezed,
    Object? upcomingPromosScrollController = freezed,
  }) {
    return _then(_PromotionsVM(
      editing: null == editing
          ? _self.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as PromotionEditing,
      promotions: null == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
      titleCtrl: freezed == titleCtrl
          ? _self.titleCtrl
          : titleCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      subtitleCtrl: freezed == subtitleCtrl
          ? _self.subtitleCtrl
          : subtitleCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      descriptionCtrl: freezed == descriptionCtrl
          ? _self.descriptionCtrl
          : descriptionCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      promptCtrl: freezed == promptCtrl
          ? _self.promptCtrl
          : promptCtrl // ignore: cast_nullable_to_non_nullable
              as InputController?,
      youtubeUrlCtrl: freezed == youtubeUrlCtrl
          ? _self.youtubeUrlCtrl
          : youtubeUrlCtrl // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      youtubeUrlFormKey: freezed == youtubeUrlFormKey
          ? _self.youtubeUrlFormKey
          : youtubeUrlFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      activeDays: null == activeDays
          ? _self._activeDays
          : activeDays // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      newPromo: freezed == newPromo
          ? _self.newPromo
          : newPromo // ignore: cast_nullable_to_non_nullable
              as PromotionDM?,
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
      newPromoMediaPath: freezed == newPromoMediaPath
          ? _self.newPromoMediaPath
          : newPromoMediaPath // ignore: cast_nullable_to_non_nullable
              as (String, MediaType)?,
      imageBytes: freezed == imageBytes
          ? _self.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      videoController: freezed == videoController
          ? _self.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
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

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get titleCtrl {
    if (_self.titleCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.titleCtrl!, (value) {
      return _then(_self.copyWith(titleCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get subtitleCtrl {
    if (_self.subtitleCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.subtitleCtrl!, (value) {
      return _then(_self.copyWith(subtitleCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get descriptionCtrl {
    if (_self.descriptionCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.descriptionCtrl!, (value) {
      return _then(_self.copyWith(descriptionCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res>? get promptCtrl {
    if (_self.promptCtrl == null) {
      return null;
    }

    return $InputControllerCopyWith<$Res>(_self.promptCtrl!, (value) {
      return _then(_self.copyWith(promptCtrl: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionDMCopyWith<$Res>? get newPromo {
    if (_self.newPromo == null) {
      return null;
    }

    return $PromotionDMCopyWith<$Res>(_self.newPromo!, (value) {
      return _then(_self.copyWith(newPromo: value));
    });
  }

  /// Create a copy of ManagePromotionsVM
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
