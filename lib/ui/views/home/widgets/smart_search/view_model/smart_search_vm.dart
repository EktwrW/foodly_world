import 'package:flutter/material.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart' show BusinessResultsViewMode, NlpSearchPlatform;
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/device_info_dto.dart' show DeviceInfoDTO;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_search_vm.freezed.dart';

enum SmartSearchMode {
  none,
  voice,
  text;

  bool get isVoice => this == voice;
  bool get isText => this == text;
  bool get isOff => this == none;
}

@freezed
abstract class SmartSearchVM with _$SmartSearchVM {
  const SmartSearchVM._();

  const factory SmartSearchVM({
    required bool isInitialized,
    required bool isListening,
    required String recognizedText,
    @Default([]) List<BusinessDM> searchResults,
    @Default(BusinessResultsViewMode.list) BusinessResultsViewMode viewMode,
    @Default(SmartSearchMode.none) SmartSearchMode smartSearchMode,
    required InputController inputController,
    @Default(false) bool isBottomBarHidden,
    @Default(false) bool micPermissionDenied,
    String? sessionId,
    NlpSearchPlatform? platform,
    @JsonKey(name: 'device_info') DeviceInfoDTO? deviceInfo,
  }) = _SmartSearchVM;

  factory SmartSearchVM.initial() => SmartSearchVM(
        isInitialized: false,
        isListening: false,
        recognizedText: '',
        inputController: InputController(
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      );

  String get searchedText =>
      '"${(inputController.text?.isNotEmpty ?? false) ? inputController.text?.trim() : recognizedText}"';
}
