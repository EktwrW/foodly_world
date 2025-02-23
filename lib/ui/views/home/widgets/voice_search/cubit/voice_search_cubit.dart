import 'dart:async' show Timer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Durations, FocusNode, TextEditingController;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_transfer_objects/business_search/business_search_body_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/home/widgets/voice_search/view_model/voice_search_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

export 'package:foodly_world/ui/views/home/widgets/voice_search/view_model/voice_search_vm.dart';

part 'voice_search_state.dart';
part 'voice_search_cubit.freezed.dart';

class VoiceSearchCubit extends Cubit<VoiceSearchState> {
  final SpeechToText _speechToText;
  Timer? _listenTimer;
  final _businessRepo = di<BusinessRepo>();
  VoiceSearchVM _vm;

  VoiceSearchCubit()
      : _speechToText = SpeechToText(),
        _vm = VoiceSearchVM.initial(),
        super(VoiceSearchState.initial(VoiceSearchVM.initial())) {
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

      _vm = _vm.copyWith(
        isInitialized: available,
        isListening: false,
        recognizedText: '',
        smartSearchMode: SmartSearchMode.none,
        inputController: InputController(
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      );

      if (available) {
        emit(VoiceSearchState.initial(_vm));
      } else {
        emit(VoiceSearchState.error(S.current.speechRecognitionUnavailable, _vm));
      }
    } on Exception catch (e) {
      di<Logger>().e('Error de inicialización: $e');
      emit(VoiceSearchState.error(S.current.speechRecognitionError, _vm));
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
      emit(VoiceSearchState.listening(_vm));

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
        emit(VoiceSearchState.error(S.current.speechRecognitionError, _vm));
      }
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _vm = _vm.copyWith(recognizedText: result.recognizedWords);

    if (result.finalResult) {
      emit(VoiceSearchState.listening(_vm));
      Future.microtask(() {
        stopListening();
        emit(VoiceSearchState.recognized(_vm));
      });
    } else {
      emit(VoiceSearchState.listening(_vm));
    }
  }

  Future<void> stopListening() async {
    if (_vm.isListening) {
      await _speechToText.stop();
      _listenTimer?.cancel();
      _listenTimer = null;

      _vm = _vm.copyWith(isListening: false);

      await Future.delayed(Durations.short2);

      emit(VoiceSearchState.recognized(_vm));
    }
  }

  void searchBusinesses(double latitude, double longitude) async {
    final searchText = _vm.smartSearchMode.isVoice ? _vm.recognizedText : _vm.inputController.controller?.text;

    if (searchText?.isEmpty ?? true) return;

    emit(VoiceSearchState.searching(_vm));

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
        );
        emit(VoiceSearchState.searchComplete(_vm));
      },
      failure: (error) {
        _vm = _vm.copyWith(smartSearchMode: SmartSearchMode.none);
        emit(VoiceSearchState.error(error.toString(), _vm));
      },
    );
  }

  void clearSearch() {
    if (_vm.smartSearchMode.isVoice) {
      _vm = _vm.copyWith(
        recognizedText: '',
        searchResults: [],
      );
    } else {
      _vm = _vm.copyWith(
        inputController: InputController(
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        searchResults: [],
      );
    }
    emit(VoiceSearchState.initial(_vm));
  }

  void toggleViewMode() {
    final newViewMode =
        _vm.viewMode == SearchResultsViewMode.grid ? SearchResultsViewMode.list : SearchResultsViewMode.grid;

    _vm = _vm.copyWith(viewMode: newViewMode);
    emit(VoiceSearchState.searchComplete(_vm));
  }

  void setTextSearchMode() async {
    // Detenemos cualquier escucha activa si existe
    if (_speechToText.isListening) {
      await _speechToText.stop();
      _listenTimer?.cancel();
      _listenTimer = null;
    }

    _vm = _vm.copyWith(
      smartSearchMode: SmartSearchMode.text,
      recognizedText: '',
      isListening: false,
      inputController: InputController(
        controller: TextEditingController(),
        focusNode: FocusNode(),
      ),
    );

    emit(VoiceSearchState.initial(_vm));
  }

  void setVoiceSearchMode() async {
    // Primero detenemos cualquier escucha activa
    if (_speechToText.isListening) {
      await _speechToText.stop();
      _listenTimer?.cancel();
      _listenTimer = null;
    }

    // Actualizamos el modo y limpiamos el estado
    _vm = _vm.copyWith(
      smartSearchMode: SmartSearchMode.voice,
      recognizedText: '',
      isListening: false,
      inputController: InputController(
        controller: TextEditingController(),
        focusNode: FocusNode(),
      ),
    );

    emit(VoiceSearchState.initial(_vm));

    // Iniciamos la escucha automáticamente
    startListening();
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

    _vm = VoiceSearchVM(
      isInitialized: _speechToText.isAvailable,
      isListening: false,
      recognizedText: '',
      inputController: InputController(
        controller: TextEditingController(),
        focusNode: FocusNode(),
      ),
    );

    emit(VoiceSearchState.initial(_vm));
  }

  void _handleError(SpeechRecognitionError error) {
    di<Logger>().e('Error de reconocimiento: ${error.errorMsg}');

    _vm = _vm.copyWith(isListening: false);
    emit(VoiceSearchState.error(_getErrorMessage(error.errorMsg), _vm));
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
