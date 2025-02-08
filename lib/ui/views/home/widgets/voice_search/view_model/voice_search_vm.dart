import 'package:flutter/material.dart';
import 'package:foodly_world/core/controllers/input_controller.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';

enum SearchResultsViewMode {
  grid,
  list;

  bool get isGrid => this == grid;
}

enum SmartSearchMode {
  none,
  voice,
  text;

  bool get isVoice => this == voice;
  bool get isText => this == text;
  bool get isOff => this == none;
}

class VoiceSearchVM {
  final bool isInitialized;
  final bool isListening;
  final String recognizedText;
  final List<BusinessDM> searchResults;
  final SearchResultsViewMode viewMode;
  final SmartSearchMode smartSearchMode;
  final InputController inputController;

  const VoiceSearchVM({
    required this.isInitialized,
    required this.isListening,
    required this.recognizedText,
    this.searchResults = const [],
    this.viewMode = SearchResultsViewMode.list,
    this.smartSearchMode = SmartSearchMode.none,
    required this.inputController,
  });

  VoiceSearchVM copyWith({
    bool? isInitialized,
    bool? isListening,
    String? recognizedText,
    List<BusinessDM>? searchResults,
    SearchResultsViewMode? viewMode,
    SmartSearchMode? smartSearchMode,
    InputController? inputController,
  }) {
    return VoiceSearchVM(
      isInitialized: isInitialized ?? this.isInitialized,
      isListening: isListening ?? this.isListening,
      recognizedText: recognizedText ?? this.recognizedText,
      searchResults: searchResults ?? this.searchResults,
      viewMode: viewMode ?? this.viewMode,
      smartSearchMode: smartSearchMode ?? this.smartSearchMode,
      inputController: inputController ?? this.inputController,
    );
  }

  factory VoiceSearchVM.initial() => VoiceSearchVM(
        isInitialized: false,
        isListening: false,
        recognizedText: '',
        inputController: InputController(controller: TextEditingController(), focusNode: FocusNode()),
      );

  String get searchedText =>
      '"${(inputController.text?.isNotEmpty ?? false) ? inputController.text?.trim() : recognizedText}"';
}
