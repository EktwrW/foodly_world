// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_search_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SmartSearchVM {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isListening => throw _privateConstructorUsedError;
  String get recognizedText => throw _privateConstructorUsedError;
  List<BusinessDM> get searchResults => throw _privateConstructorUsedError;
  BusinessResultsViewMode get viewMode => throw _privateConstructorUsedError;
  SmartSearchMode get smartSearchMode => throw _privateConstructorUsedError;
  InputController get inputController => throw _privateConstructorUsedError;
  bool get isBottomBarHidden => throw _privateConstructorUsedError;
  bool get micPermissionDenied => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  NlpSearchPlatform? get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_info')
  DeviceInfoDTO? get deviceInfo => throw _privateConstructorUsedError;

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartSearchVMCopyWith<SmartSearchVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartSearchVMCopyWith<$Res> {
  factory $SmartSearchVMCopyWith(
          SmartSearchVM value, $Res Function(SmartSearchVM) then) =
      _$SmartSearchVMCopyWithImpl<$Res, SmartSearchVM>;
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
class _$SmartSearchVMCopyWithImpl<$Res, $Val extends SmartSearchVM>
    implements $SmartSearchVMCopyWith<$Res> {
  _$SmartSearchVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      smartSearchMode: null == smartSearchMode
          ? _value.smartSearchMode
          : smartSearchMode // ignore: cast_nullable_to_non_nullable
              as SmartSearchMode,
      inputController: null == inputController
          ? _value.inputController
          : inputController // ignore: cast_nullable_to_non_nullable
              as InputController,
      isBottomBarHidden: null == isBottomBarHidden
          ? _value.isBottomBarHidden
          : isBottomBarHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      micPermissionDenied: null == micPermissionDenied
          ? _value.micPermissionDenied
          : micPermissionDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as NlpSearchPlatform?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoDTO?,
    ) as $Val);
  }

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputControllerCopyWith<$Res> get inputController {
    return $InputControllerCopyWith<$Res>(_value.inputController, (value) {
      return _then(_value.copyWith(inputController: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SmartSearchVMImplCopyWith<$Res>
    implements $SmartSearchVMCopyWith<$Res> {
  factory _$$SmartSearchVMImplCopyWith(
          _$SmartSearchVMImpl value, $Res Function(_$SmartSearchVMImpl) then) =
      __$$SmartSearchVMImplCopyWithImpl<$Res>;
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
class __$$SmartSearchVMImplCopyWithImpl<$Res>
    extends _$SmartSearchVMCopyWithImpl<$Res, _$SmartSearchVMImpl>
    implements _$$SmartSearchVMImplCopyWith<$Res> {
  __$$SmartSearchVMImplCopyWithImpl(
      _$SmartSearchVMImpl _value, $Res Function(_$SmartSearchVMImpl) _then)
      : super(_value, _then);

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
    return _then(_$SmartSearchVMImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as BusinessResultsViewMode,
      smartSearchMode: null == smartSearchMode
          ? _value.smartSearchMode
          : smartSearchMode // ignore: cast_nullable_to_non_nullable
              as SmartSearchMode,
      inputController: null == inputController
          ? _value.inputController
          : inputController // ignore: cast_nullable_to_non_nullable
              as InputController,
      isBottomBarHidden: null == isBottomBarHidden
          ? _value.isBottomBarHidden
          : isBottomBarHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      micPermissionDenied: null == micPermissionDenied
          ? _value.micPermissionDenied
          : micPermissionDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as NlpSearchPlatform?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoDTO?,
    ));
  }
}

/// @nodoc

class _$SmartSearchVMImpl extends _SmartSearchVM {
  const _$SmartSearchVMImpl(
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

  @override
  String toString() {
    return 'SmartSearchVM(isInitialized: $isInitialized, isListening: $isListening, recognizedText: $recognizedText, searchResults: $searchResults, viewMode: $viewMode, smartSearchMode: $smartSearchMode, inputController: $inputController, isBottomBarHidden: $isBottomBarHidden, micPermissionDenied: $micPermissionDenied, sessionId: $sessionId, platform: $platform, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartSearchVMImpl &&
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

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartSearchVMImplCopyWith<_$SmartSearchVMImpl> get copyWith =>
      __$$SmartSearchVMImplCopyWithImpl<_$SmartSearchVMImpl>(this, _$identity);
}

abstract class _SmartSearchVM extends SmartSearchVM {
  const factory _SmartSearchVM(
          {required final bool isInitialized,
          required final bool isListening,
          required final String recognizedText,
          final List<BusinessDM> searchResults,
          final BusinessResultsViewMode viewMode,
          final SmartSearchMode smartSearchMode,
          required final InputController inputController,
          final bool isBottomBarHidden,
          final bool micPermissionDenied,
          final String? sessionId,
          final NlpSearchPlatform? platform,
          @JsonKey(name: 'device_info') final DeviceInfoDTO? deviceInfo}) =
      _$SmartSearchVMImpl;
  const _SmartSearchVM._() : super._();

  @override
  bool get isInitialized;
  @override
  bool get isListening;
  @override
  String get recognizedText;
  @override
  List<BusinessDM> get searchResults;
  @override
  BusinessResultsViewMode get viewMode;
  @override
  SmartSearchMode get smartSearchMode;
  @override
  InputController get inputController;
  @override
  bool get isBottomBarHidden;
  @override
  bool get micPermissionDenied;
  @override
  String? get sessionId;
  @override
  NlpSearchPlatform? get platform;
  @override
  @JsonKey(name: 'device_info')
  DeviceInfoDTO? get deviceInfo;

  /// Create a copy of SmartSearchVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartSearchVMImplCopyWith<_$SmartSearchVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
