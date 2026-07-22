// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_search_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SmartSearchVM {
  bool get isInitialized;
  bool get isListening;
  String get recognizedText;
  List<BusinessDM> get searchResults;
  BusinessResultsViewMode get viewMode;
  SmartSearchMode get smartSearchMode;
  InputController get inputController;
  bool get isBottomBarHidden;
  bool get micPermissionDenied;
  String? get sessionId;
  NlpSearchPlatform? get platform;
  @JsonKey(name: 'device_info')
  DeviceInfoDTO? get deviceInfo;

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SmartSearchVMCopyWith<SmartSearchVM> get copyWith =>
      _$SmartSearchVMCopyWithImpl<SmartSearchVM>(
          this as SmartSearchVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SmartSearchVM &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isListening, isListening) ||
                other.isListening == isListening) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText) &&
            const DeepCollectionEquality()
                .equals(other.searchResults, searchResults) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.smartSearchMode, smartSearchMode) ||
                other.smartSearchMode == smartSearchMode) &&
            (identical(other.inputController, inputController) ||
                other.inputController == inputController) &&
            (identical(other.isBottomBarHidden, isBottomBarHidden) ||
                other.isBottomBarHidden == isBottomBarHidden) &&
            (identical(other.micPermissionDenied, micPermissionDenied) ||
                other.micPermissionDenied == micPermissionDenied) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInitialized,
      isListening,
      recognizedText,
      const DeepCollectionEquality().hash(searchResults),
      viewMode,
      smartSearchMode,
      inputController,
      isBottomBarHidden,
      micPermissionDenied,
      sessionId,
      platform,
      deviceInfo);

  @override
  String toString() {
    return 'SmartSearchVM(isInitialized: $isInitialized, isListening: $isListening, recognizedText: $recognizedText, searchResults: $searchResults, viewMode: $viewMode, smartSearchMode: $smartSearchMode, inputController: $inputController, isBottomBarHidden: $isBottomBarHidden, micPermissionDenied: $micPermissionDenied, sessionId: $sessionId, platform: $platform, deviceInfo: $deviceInfo)';
  }
}

/// @nodoc
abstract mixin class $SmartSearchVMCopyWith<$Res> {
  factory $SmartSearchVMCopyWith(
          SmartSearchVM value, $Res Function(SmartSearchVM) _then) =
      _$SmartSearchVMCopyWithImpl;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isListening,
      String recognizedText,
      List<BusinessDM> searchResults,
      BusinessResultsViewMode viewMode,
      SmartSearchMode smartSearchMode,
      InputController inputController,
      bool isBottomBarHidden,
      bool micPermissionDenied,
      String? sessionId,
      NlpSearchPlatform? platform,
      @JsonKey(name: 'device_info') DeviceInfoDTO? deviceInfo});

  $InputControllerCopyWith<$Res> get inputController;
}

/// @nodoc
class _$SmartSearchVMCopyWithImpl<$Res>
    implements $SmartSearchVMCopyWith<$Res> {
  _$SmartSearchVMCopyWithImpl(this._self, this._then);

  final SmartSearchVM _self;
  final $Res Function(SmartSearchVM) _then;

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isListening = null,
    Object? recognizedText = null,
    Object? searchResults = null,
    Object? viewMode = null,
    Object? smartSearchMode = null,
    Object? inputController = null,
    Object? isBottomBarHidden = null,
    Object? micPermissionDenied = null,
    Object? sessionId = freezed,
    Object? platform = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_self.copyWith(
      isInitialized: null == isInitialized
          ? _self.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _self.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: null == recognizedText
          ? _self.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _self.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      smartSearchMode: null == smartSearchMode
          ? _self.smartSearchMode
          : smartSearchMode // ignore: cast_nullable_to_non_nullable
              as SmartSearchMode,
      inputController: null == inputController
          ? _self.inputController
          : inputController // ignore: cast_nullable_to_non_nullable
              as InputController,
      isBottomBarHidden: null == isBottomBarHidden
          ? _self.isBottomBarHidden
          : isBottomBarHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      micPermissionDenied: null == micPermissionDenied
          ? _self.micPermissionDenied
          : micPermissionDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as NlpSearchPlatform?,
      deviceInfo: freezed == deviceInfo
          ? _self.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoDTO?,
    ));
  }

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res> get inputController {
    return $InputControllerCopyWith<$Res>(_self.inputController, (value) {
      return _then(_self.copyWith(inputController: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SmartSearchVM].
extension SmartSearchVMPatterns on SmartSearchVM {
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
    TResult Function(_SmartSearchVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SmartSearchVM() when $default != null:
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
    TResult Function(_SmartSearchVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SmartSearchVM():
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
    TResult? Function(_SmartSearchVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SmartSearchVM() when $default != null:
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
            bool isInitialized,
            bool isListening,
            String recognizedText,
            List<BusinessDM> searchResults,
            BusinessResultsViewMode viewMode,
            SmartSearchMode smartSearchMode,
            InputController inputController,
            bool isBottomBarHidden,
            bool micPermissionDenied,
            String? sessionId,
            NlpSearchPlatform? platform,
            @JsonKey(name: 'device_info') DeviceInfoDTO? deviceInfo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SmartSearchVM() when $default != null:
        return $default(
            _that.isInitialized,
            _that.isListening,
            _that.recognizedText,
            _that.searchResults,
            _that.viewMode,
            _that.smartSearchMode,
            _that.inputController,
            _that.isBottomBarHidden,
            _that.micPermissionDenied,
            _that.sessionId,
            _that.platform,
            _that.deviceInfo);
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
            bool isInitialized,
            bool isListening,
            String recognizedText,
            List<BusinessDM> searchResults,
            BusinessResultsViewMode viewMode,
            SmartSearchMode smartSearchMode,
            InputController inputController,
            bool isBottomBarHidden,
            bool micPermissionDenied,
            String? sessionId,
            NlpSearchPlatform? platform,
            @JsonKey(name: 'device_info') DeviceInfoDTO? deviceInfo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SmartSearchVM():
        return $default(
            _that.isInitialized,
            _that.isListening,
            _that.recognizedText,
            _that.searchResults,
            _that.viewMode,
            _that.smartSearchMode,
            _that.inputController,
            _that.isBottomBarHidden,
            _that.micPermissionDenied,
            _that.sessionId,
            _that.platform,
            _that.deviceInfo);
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
            bool isInitialized,
            bool isListening,
            String recognizedText,
            List<BusinessDM> searchResults,
            BusinessResultsViewMode viewMode,
            SmartSearchMode smartSearchMode,
            InputController inputController,
            bool isBottomBarHidden,
            bool micPermissionDenied,
            String? sessionId,
            NlpSearchPlatform? platform,
            @JsonKey(name: 'device_info') DeviceInfoDTO? deviceInfo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SmartSearchVM() when $default != null:
        return $default(
            _that.isInitialized,
            _that.isListening,
            _that.recognizedText,
            _that.searchResults,
            _that.viewMode,
            _that.smartSearchMode,
            _that.inputController,
            _that.isBottomBarHidden,
            _that.micPermissionDenied,
            _that.sessionId,
            _that.platform,
            _that.deviceInfo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SmartSearchVM extends SmartSearchVM {
  const _SmartSearchVM(
      {required this.isInitialized,
      required this.isListening,
      required this.recognizedText,
      final List<BusinessDM> searchResults = const [],
      this.viewMode = BusinessResultsViewMode.list,
      this.smartSearchMode = SmartSearchMode.none,
      required this.inputController,
      this.isBottomBarHidden = false,
      this.micPermissionDenied = false,
      this.sessionId,
      this.platform,
      @JsonKey(name: 'device_info') this.deviceInfo})
      : _searchResults = searchResults,
        super._();

  @override
  final bool isInitialized;
  @override
  final bool isListening;
  @override
  final String recognizedText;
  final List<BusinessDM> _searchResults;
  @override
  @JsonKey()
  List<BusinessDM> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final BusinessResultsViewMode viewMode;
  @override
  @JsonKey()
  final SmartSearchMode smartSearchMode;
  @override
  final InputController inputController;
  @override
  @JsonKey()
  final bool isBottomBarHidden;
  @override
  @JsonKey()
  final bool micPermissionDenied;
  @override
  final String? sessionId;
  @override
  final NlpSearchPlatform? platform;
  @override
  @JsonKey(name: 'device_info')
  final DeviceInfoDTO? deviceInfo;

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SmartSearchVMCopyWith<_SmartSearchVM> get copyWith =>
      __$SmartSearchVMCopyWithImpl<_SmartSearchVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SmartSearchVM &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isListening, isListening) ||
                other.isListening == isListening) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.smartSearchMode, smartSearchMode) ||
                other.smartSearchMode == smartSearchMode) &&
            (identical(other.inputController, inputController) ||
                other.inputController == inputController) &&
            (identical(other.isBottomBarHidden, isBottomBarHidden) ||
                other.isBottomBarHidden == isBottomBarHidden) &&
            (identical(other.micPermissionDenied, micPermissionDenied) ||
                other.micPermissionDenied == micPermissionDenied) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInitialized,
      isListening,
      recognizedText,
      const DeepCollectionEquality().hash(_searchResults),
      viewMode,
      smartSearchMode,
      inputController,
      isBottomBarHidden,
      micPermissionDenied,
      sessionId,
      platform,
      deviceInfo);

  @override
  String toString() {
    return 'SmartSearchVM(isInitialized: $isInitialized, isListening: $isListening, recognizedText: $recognizedText, searchResults: $searchResults, viewMode: $viewMode, smartSearchMode: $smartSearchMode, inputController: $inputController, isBottomBarHidden: $isBottomBarHidden, micPermissionDenied: $micPermissionDenied, sessionId: $sessionId, platform: $platform, deviceInfo: $deviceInfo)';
  }
}

/// @nodoc
abstract mixin class _$SmartSearchVMCopyWith<$Res>
    implements $SmartSearchVMCopyWith<$Res> {
  factory _$SmartSearchVMCopyWith(
          _SmartSearchVM value, $Res Function(_SmartSearchVM) _then) =
      __$SmartSearchVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isListening,
      String recognizedText,
      List<BusinessDM> searchResults,
      BusinessResultsViewMode viewMode,
      SmartSearchMode smartSearchMode,
      InputController inputController,
      bool isBottomBarHidden,
      bool micPermissionDenied,
      String? sessionId,
      NlpSearchPlatform? platform,
      @JsonKey(name: 'device_info') DeviceInfoDTO? deviceInfo});

  @override
  $InputControllerCopyWith<$Res> get inputController;
}

/// @nodoc
class __$SmartSearchVMCopyWithImpl<$Res>
    implements _$SmartSearchVMCopyWith<$Res> {
  __$SmartSearchVMCopyWithImpl(this._self, this._then);

  final _SmartSearchVM _self;
  final $Res Function(_SmartSearchVM) _then;

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isInitialized = null,
    Object? isListening = null,
    Object? recognizedText = null,
    Object? searchResults = null,
    Object? viewMode = null,
    Object? smartSearchMode = null,
    Object? inputController = null,
    Object? isBottomBarHidden = null,
    Object? micPermissionDenied = null,
    Object? sessionId = freezed,
    Object? platform = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_SmartSearchVM(
      isInitialized: null == isInitialized
          ? _self.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _self.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: null == recognizedText
          ? _self.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _self._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      smartSearchMode: null == smartSearchMode
          ? _self.smartSearchMode
          : smartSearchMode // ignore: cast_nullable_to_non_nullable
              as SmartSearchMode,
      inputController: null == inputController
          ? _self.inputController
          : inputController // ignore: cast_nullable_to_non_nullable
              as InputController,
      isBottomBarHidden: null == isBottomBarHidden
          ? _self.isBottomBarHidden
          : isBottomBarHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      micPermissionDenied: null == micPermissionDenied
          ? _self.micPermissionDenied
          : micPermissionDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as NlpSearchPlatform?,
      deviceInfo: freezed == deviceInfo
          ? _self.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoDTO?,
    ));
  }

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res> get inputController {
    return $InputControllerCopyWith<$Res>(_self.inputController, (value) {
      return _then(_self.copyWith(inputController: value));
    });
  }
}

// dart format on
