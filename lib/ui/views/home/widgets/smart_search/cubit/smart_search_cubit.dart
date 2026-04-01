import 'dart:async' show Completer, Timer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/nlp_search_request_dto.dart';
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
  final NlpSearchRepo _nlpSearchRepo;
  final Logger _logger;
  SmartSearchVM _vm;

  SmartSearchCubit(
    NlpSearchRepo nlpSearchRepo,
    Logger logger,
  )   : _speechToText = SpeechToText(),
        _nlpSearchRepo = nlpSearchRepo,
        _logger = logger,
        _vm = SmartSearchVM.initial(),
        super(SmartSearchState.initial(SmartSearchVM.initial())) {
    _initViewMode();
  }

  Future<void> _initViewMode() async {
    final saved = await di<LocalStorageService>().getString(FoodlyStrings.PREFERRED_VIEW_MODE);
    if (saved == BusinessResultsViewMode.grid.name) {
      _vm = _vm.copyWith(viewMode: BusinessResultsViewMode.grid);
    }
  }

  // Speech recognition is initialized ONLY when the user taps the mic button
  // (via startListening → _initialize). No WidgetsBindingObserver, no automatic
  // retries. This prevents the infinite permission-request loop on Android where
  // SpeechToText (mic + bluetooth), Geolocator (location), and the system's
  // "only one permission dialog at a time" rule create a foreground/background
  // cycle that crashes the app.

  bool _isInitializing = false;

  Future<void> _initialize() async {
    if (_isInitializing) return;
    _isInitializing = true;
    try {
      if (_speechToText.isListening) {
        await _speechToText.stop();
      }

      final available = await _speechToText.initialize(
        onError: _handleError,
        onStatus: (status) => _logger.t('Status: $status'),
        debugLogging: true,
      );

      final textController = TextEditingController();
      final focusNode = FocusNode();

      _vm = _vm.copyWith(
        isInitialized: available,
        isListening: false,
        recognizedText: '',
        inputController: InputController(
          controller: textController,
          focusNode: focusNode,
        ),
      );

      if (available) {
        _vm = _vm.copyWith(micPermissionDenied: false);
        emit(SmartSearchState.initial(_vm));
      } else {
        _vm = _vm.copyWith(micPermissionDenied: true);
        emit(SmartSearchState.error(S.current.speechRecognitionUnavailable, _vm));
      }
    } on Exception catch (e) {
      _logger.e('Error de inicialización: $e');
      emit(SmartSearchState.error(S.current.speechRecognitionError, _vm));
    } finally {
      _isInitializing = false;
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

    di<EventTrackingService>().track(
      'ui.click',
      'SmartSearchCubit',
      section: 'smart_search',
      query: searchText,
    );

    _vm = _vm.copyWith(isBottomBarHidden: true);
    Future.microtask(() => emit(SmartSearchState.searching(_vm)));

    // Device metadata is cached in AuthSessionService at app startup — never null after init.
    final authService = di<AuthSessionService>();
    final result = await _nlpSearchRepo.search(
      NlpSearchRequestDTO(
        query: searchText!,
        latitude: latitude,
        longitude: longitude,
        distanceKm: 10,
        limit: 50,
        userUuid: authService.uuid.isNotEmpty ? authService.uuid : null,
        sessionId: di<EventTrackingService>().sessionId,
        platform: authService.platform,
        deviceInfo: authService.deviceInfo,
      ),
    );

    await result.when(
      success: (data) async {
        _vm = _vm.copyWith(
          searchResults: data.business,
          smartSearchMode: SmartSearchMode.none,
          isBottomBarHidden: true,
          inputController: _vm.inputController.copyWith(
            controller: TextEditingController(text: searchText),
          ),
        );
        await _precacheBusinessImages(data.business);
        emit(SmartSearchState.searchComplete(_vm));
        di<EventTrackingService>().track(
          'search.results_viewed',
          'search_results_page',
          page: 'search_results',
          query: searchText,
          data: {
            'results_count': data.business.length,
            'distance_km': 10,
            'offset': 0,
            'limit': 50,
          },
        );
      },
      failure: (error) async {
        _logger.e('Smart search failed', error: error);
        _vm = _vm.copyWith(
          smartSearchMode: SmartSearchMode.none,
          isBottomBarHidden: false,
          inputController: _vm.inputController.copyWith(
            controller: TextEditingController(text: searchText),
          ),
        );
        emit(SmartSearchState.error(S.current.connectionError, _vm));
      },
    );
  }

  Future<void> _precacheBusinessImages(List<BusinessDM> businesses) {
    final futures = <Future<void>>[];
    for (final b in businesses) {
      final f = _precacheUrlFuture(b.logo);
      if (f != null) futures.add(f);
      for (final img in b.coverImages) {
        final f2 = _precacheUrlFuture(img.url);
        if (f2 != null) futures.add(f2);
      }
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
      onError: (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
    ));
    return completer.future;
  }

  void clearSearch() {
    final newController = TextEditingController();
    final newFocusNode = FocusNode();

    _vm = _vm.copyWith(
      recognizedText: '',
      searchResults: [],
      isBottomBarHidden: false,
      inputController: InputController(
        controller: newController,
        focusNode: newFocusNode,
      ),
    );

    emit(SmartSearchState.initial(_vm));
  }

  void toggleViewMode() {
    final newViewMode =
        _vm.viewMode == BusinessResultsViewMode.grid ? BusinessResultsViewMode.list : BusinessResultsViewMode.grid;

    _vm = _vm.copyWith(viewMode: newViewMode);
    emit(SmartSearchState.searchComplete(_vm));
    di<LocalStorageService>().saveString(FoodlyStrings.PREFERRED_VIEW_MODE, newViewMode.name);
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
      viewMode: _vm.viewMode,
      inputController: InputController(
        controller: TextEditingController(),
        focusNode: FocusNode(),
      ),
    );

    emit(SmartSearchState.initial(_vm));
  }

  void _handleError(SpeechRecognitionError error) {
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
