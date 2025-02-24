import 'dart:async' show Timer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Durations, FocusNode, TextEditingController;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_transfer_objects/business_search/business_search_body_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/home/widgets/smart_search/view_model/smart_search_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

export 'package:foodly_world/ui/views/home/widgets/smart_search/view_model/smart_search_vm.dart';

part 'smart_search_state.dart';
part 'smart_search_cubit.freezed.dart';

class SmartSearchCubit extends Cubit<SmartSearchState> {
  final SpeechToText _speechToText;
  Timer? _listenTimer;
  final _businessRepo = di<BusinessRepo>();
  SmartSearchVM _vm;

  SmartSearchCubit()
      : _speechToText = SpeechToText(),
        _vm = SmartSearchVM.initial(),
        super(SmartSearchState.initial(SmartSearchVM.initial())) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      if (_speechToText.isListening) {
        await _speechToText.stop();
      }

      final available = await _speechToText.initialize(
        onError: _handleError,
        onStatus: (status) => di<Logger>().t('Status: $status'),
        debugLogging: true,
      );

      final textController = TextEditingController();
      final focusNode = FocusNode();

      _vm = _vm.copyWith(
        isInitialized: available,
        isListening: false,
        recognizedText: '',
        smartSearchMode: SmartSearchMode.none,
        inputController: InputController(
          controller: textController,
          focusNode: focusNode,
        ),
      );

      if (available) {
        emit(SmartSearchState.initial(_vm));
      } else {
        emit(SmartSearchState.error(S.current.speechRecognitionUnavailable, _vm));
      }
    } on Exception catch (e) {
      di<Logger>().e('Error de inicialización: $e');
      emit(SmartSearchState.error(S.current.speechRecognitionError, _vm));
    }
  }

  void startListening() async {
    if (!_speechToText.isAvailable) {
      await _initialize();
    }

    if (!_vm.isListening) {
      _listenTimer?.cancel();
      _listenTimer = null;

      if (_speechToText.isListening) {
        await _speechToText.stop();
        await Future.delayed(const Duration(milliseconds: 100));
      }

      _vm = _vm.copyWith(
        isListening: true,
        recognizedText: '',
      );
      emit(SmartSearchState.listening(_vm));

      try {
        await _speechToText.listen(
          onResult: _onSpeechResult,
          localeId: Intl.getCurrentLocale(),
          listenFor: const Duration(seconds: 30),
          listenOptions: SpeechListenOptions(
            listenMode: ListenMode.search,
            cancelOnError: true,
          ),
        );

        _listenTimer = Timer(const Duration(seconds: 30), stopListening);
      } catch (e) {
        _listenTimer?.cancel();
        _vm = _vm.copyWith(isListening: false);
        emit(SmartSearchState.error(S.current.speechRecognitionError, _vm));
      }
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    final newText = result.recognizedWords;

    _vm = _vm.copyWith(
      recognizedText: newText,
      inputController: _vm.inputController.copyWith(
        controller: TextEditingController(text: newText),
      ),
    );

    if (result.finalResult) {
      emit(SmartSearchState.listening(_vm));
      Future.microtask(() {
        stopListening();
        emit(SmartSearchState.recognized(_vm));
      });
    } else {
      emit(SmartSearchState.listening(_vm));
    }
  }

  Future<void> stopListening() async {
    if (_vm.isListening) {
      await _speechToText.stop();
      _listenTimer?.cancel();
      _listenTimer = null;

      _vm = _vm.copyWith(isListening: false);

      await Future.delayed(Durations.short2);

      emit(SmartSearchState.recognized(_vm));
    }
  }

  void searchBusinesses(double latitude, double longitude) async {
    // Aseguramos obtener el texto correcto según el modo
    final String? searchText;
    if (_vm.smartSearchMode.isVoice) {
      searchText = _vm.recognizedText;
    } else {
      searchText = _vm.inputController.controller?.text;
    }

    if (searchText?.isEmpty ?? true) return;

    emit(SmartSearchState.searching(_vm));

    final result = await _businessRepo.businessSearch(
      BusinessSearchBodyDTO(
        latitude: latitude,
        longitude: longitude,
        voiceText: searchText!,
      ),
    );

    result.when(
      success: (data) {
        _vm = _vm.copyWith(
          searchResults: data.business,
          smartSearchMode: SmartSearchMode.none,
          // Mantenemos el texto en el controller
          inputController: _vm.inputController.copyWith(
            controller: TextEditingController(text: searchText),
          ),
        );
        emit(SmartSearchState.searchComplete(_vm));
      },
      failure: (error) {
        _vm = _vm.copyWith(
          smartSearchMode: SmartSearchMode.none,
          // Mantenemos el texto en caso de error
          inputController: _vm.inputController.copyWith(
            controller: TextEditingController(text: searchText),
          ),
        );
        emit(SmartSearchState.error(error.toString(), _vm));
      },
    );
  }

  void clearSearch() {
    final newController = TextEditingController();
    final newFocusNode = FocusNode();

    _vm = _vm.copyWith(
      recognizedText: '',
      searchResults: [],
      inputController: InputController(
        controller: newController,
        focusNode: newFocusNode,
      ),
    );

    emit(SmartSearchState.initial(_vm));
  }

  void toggleViewMode() {
    final newViewMode =
        _vm.viewMode == SearchResultsViewMode.grid ? SearchResultsViewMode.list : SearchResultsViewMode.grid;

    _vm = _vm.copyWith(viewMode: newViewMode);
    emit(SmartSearchState.searchComplete(_vm));
  }

  void setTextSearchMode() async {
    await _stopListeningIfNeeded();

    final currentText = _vm.recognizedText;
    final textController = TextEditingController(text: currentText);

    _vm = _vm.copyWith(
      smartSearchMode: SmartSearchMode.text,
      recognizedText: currentText,
      isListening: false,
      inputController: InputController(
        controller: textController,
        focusNode: FocusNode(),
      ),
    );

    emit(SmartSearchState.initial(_vm));
  }

  void setVoiceSearchMode() async {
    await _stopListeningIfNeeded();

    final currentText = _vm.inputController.controller?.text ?? '';

    _vm = _vm.copyWith(
      smartSearchMode: SmartSearchMode.voice,
      recognizedText: currentText,
      isListening: false,
      inputController: InputController(
        controller: TextEditingController(text: currentText),
        focusNode: FocusNode(),
      ),
    );

    emit(SmartSearchState.initial(_vm));
    startListening();
  }

  Future<void> _stopListeningIfNeeded() async {
    if (_speechToText.isListening) {
      await _speechToText.stop();
      _listenTimer?.cancel();
      _listenTimer = null;
    }
  }

  void checkForResetToInitial() async {
    if (state is! _SearchComplete) {
      await resetToInitial();
    }
  }

  Future<void> resetToInitial() async {
    _listenTimer?.cancel();
    _listenTimer = null;

    if (_speechToText.isListening) {
      await _speechToText.stop();
    }

    _vm = SmartSearchVM(
      isInitialized: _speechToText.isAvailable,
      isListening: false,
      recognizedText: '',
      inputController: InputController(
        controller: TextEditingController(),
        focusNode: FocusNode(),
      ),
    );

    emit(SmartSearchState.initial(_vm));
  }

  void _handleError(SpeechRecognitionError error) {
    di<Logger>().e('Error de reconocimiento: ${error.errorMsg}');

    _vm = _vm.copyWith(isListening: false);
    emit(SmartSearchState.error(_getErrorMessage(error.errorMsg), _vm));
  }

  String _getErrorMessage(String errorMsg) => switch (errorMsg) {
        'error_no_match' => S.current.audioNotUnderstood,
        'error_speech_timeout' => S.current.noAudioDetected,
        'error_network' => S.current.connectionError,
        _ => S.current.audioProcessingError,
      };

  @override
  Future<void> close() async {
    _listenTimer?.cancel();
    await _speechToText.stop();
    return super.close();
  }
}
