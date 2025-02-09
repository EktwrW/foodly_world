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

  VoiceSearchCubit()
      : _speechToText = SpeechToText(),
        super(VoiceSearchState.initial(VoiceSearchVM.initial())) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final available = await _speechToText.initialize(
        onError: _handleError,
        onStatus: (status) => di<Logger>().t('Status: $status'),
        debugLogging: true,
      );

      final vm = VoiceSearchVM(
        isInitialized: available,
        isListening: false,
        recognizedText: '',
        inputController: InputController(controller: TextEditingController(), focusNode: FocusNode()),
      );

      if (available) {
        emit(VoiceSearchState.initial(vm));
      } else {
        emit(VoiceSearchState.error(S.current.speechRecognitionUnavailable, vm));
      }
    } on Exception catch (e) {
      di<Logger>().e('Error de inicialización: $e');
      emit(VoiceSearchState.error(S.current.speechRecognitionError, VoiceSearchVM.initial()));
    }
  }

  void startListening() async {
    final currentVm = state.maybeMap(
      initial: (s) => s.vm,
      listening: (s) => s.vm,
      recognized: (s) => s.vm,
      error: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    // Reinicializar si es necesario
    if (!_speechToText.isAvailable) {
      await _initialize();
    }

    if (!currentVm.isListening) {
      _listenTimer?.cancel();
      _listenTimer = null;

      if (_speechToText.isListening) {
        await _speechToText.stop();
        await Future.delayed(const Duration(milliseconds: 100));
      }

      final listeningVm = currentVm.copyWith(
        isListening: true,
        recognizedText: '',
      );
      emit(VoiceSearchState.listening(listeningVm));

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
        emit(VoiceSearchState.error(
          S.current.speechRecognitionError,
          listeningVm.copyWith(isListening: false),
        ));
      }
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    final currentVm = state.maybeMap(
      listening: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    if (result.finalResult) {
      // Primero emitimos el estado con el texto final
      final updatedVm = currentVm.copyWith(
        recognizedText: result.recognizedWords,
      );
      emit(VoiceSearchState.listening(updatedVm));

      // Luego, después de un micro-delay, detenemos la escucha
      Future.microtask(() {
        stopListening();
        emit(VoiceSearchState.recognized(updatedVm));
      });
    } else {
      final updatedVm = currentVm.copyWith(
        recognizedText: result.recognizedWords,
      );
      emit(VoiceSearchState.listening(updatedVm));
    }
  }

  Future<void> stopListening() async {
    final currentVm = state.maybeMap(
      listening: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    if (currentVm.isListening) {
      await _speechToText.stop();
      _listenTimer?.cancel();
      _listenTimer = null;

      final stoppedVm = currentVm.copyWith(
        isListening: false,
      );

      // Asegurarnos que el speechToText está completamente detenido
      await Future.delayed(Durations.short2);

      emit(VoiceSearchState.recognized(stoppedVm));
    }
  }

  void searchBusinesses(double latitude, double longitude) async {
    final currentVm = state.maybeMap(
      recognized: (s) => s.vm,
      initial: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    // Obtenemos el texto de búsqueda según el modo
    final searchText =
        currentVm.smartSearchMode.isVoice ? currentVm.recognizedText : currentVm.inputController.controller?.text;

    if (searchText?.isEmpty ?? true) return;

    emit(VoiceSearchState.searching(currentVm));

    final result = await _businessRepo.businessSearch(
      BusinessSearchBodyDTO(
        latitude: latitude,
        longitude: longitude,
        voiceText: searchText!,
      ),
    );

    result.when(
      success: (data) {
        final updatedVm = currentVm.copyWith(searchResults: data.business, smartSearchMode: SmartSearchMode.none);
        emit(VoiceSearchState.searchComplete(updatedVm));
      },
      failure: (error) {
        emit(VoiceSearchState.error(
          error.toString(),
          currentVm.copyWith(smartSearchMode: SmartSearchMode.none),
        ));
      },
    );
  }

  void clearSearch() {
    final currentVm = state.maybeMap(
      orElse: () => VoiceSearchVM.initial(),
    );

    if (currentVm.smartSearchMode.isVoice) {
      emit(VoiceSearchState.initial(
        currentVm.copyWith(
          recognizedText: '',
          searchResults: [],
        ),
      ));
    } else {
      emit(VoiceSearchState.initial(
        currentVm.copyWith(
          inputController: InputController(controller: TextEditingController(), focusNode: FocusNode()),
          searchResults: [],
        ),
      ));
    }
  }

  void toggleViewMode() {
    final currentVm = state.maybeMap(
      searchComplete: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    final newViewMode =
        currentVm.viewMode == SearchResultsViewMode.grid ? SearchResultsViewMode.list : SearchResultsViewMode.grid;

    emit(VoiceSearchState.searchComplete(
      currentVm.copyWith(viewMode: newViewMode),
    ));
  }

  void setTextSearchMode() {
    final currentVm = state.maybeMap(
      initial: (s) => s.vm,
      recognized: (s) => s.vm,
      searchComplete: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    emit(VoiceSearchState.initial(
      currentVm.copyWith(
        smartSearchMode: SmartSearchMode.text,
        recognizedText: '',
        isListening: false,
      ),
    ));
  }

  void setVoiceSearchMode() {
    final currentVm = state.maybeMap(
      initial: (s) => s.vm,
      recognized: (s) => s.vm,
      searchComplete: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    emit(VoiceSearchState.initial(
      currentVm.copyWith(
        smartSearchMode: SmartSearchMode.voice,
        inputController: InputController(controller: TextEditingController(), focusNode: FocusNode()),
      ),
    ));
  }

  void checkForResetToInitial() => state == VoiceSearchState.searchComplete(state.vm) ? null : resetToInitial();

  Future<void> resetToInitial() async {
    _listenTimer?.cancel();
    _listenTimer = null;

    if (_speechToText.isListening) {
      _speechToText.stop();
    }

    emit(VoiceSearchState.initial(
      VoiceSearchVM(
        isInitialized: _speechToText.isAvailable,
        isListening: false,
        recognizedText: '',
        inputController: InputController(controller: TextEditingController(), focusNode: FocusNode()),
      ),
    ));
  }

  void _handleError(SpeechRecognitionError error) {
    final currentVm = state.maybeMap(
      listening: (s) => s.vm,
      orElse: () => VoiceSearchVM.initial(),
    );

    di<Logger>().e('Error de reconocimiento: ${error.errorMsg}');
    emit(VoiceSearchState.error(
      _getErrorMessage(error.errorMsg),
      currentVm.copyWith(isListening: false),
    ));
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
