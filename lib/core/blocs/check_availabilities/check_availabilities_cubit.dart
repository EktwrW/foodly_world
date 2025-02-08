import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'check_availabilities_state.dart';
part 'check_availabilities_cubit.freezed.dart';

class CheckAvailabilitiesCubit extends Cubit<CheckAvailabilitiesState> {
  final _meRepo = di<MeRepo>();
  final _textChangeSubject = PublishSubject<String>();
  StreamSubscription? _textChangeSubscription;

  CheckAvailabilitiesCubit() : super(const CheckAvailabilitiesState.initial()) {
    _initDebounce();
  }

  void _initDebounce() {
    _textChangeSubscription = _textChangeSubject.debounceTime(const Duration(milliseconds: 150)).listen((text) {
      _validateAndCheckUsername(text);
    });
  }

  @override
  Future<void> close() {
    _textChangeSubscription?.cancel();
    _textChangeSubject.close();
    return super.close();
  }

  bool get isNotInitialState => state is! _Initial;
  bool get isInitialState => state is _Initial;
  bool get isAvailable => state is _Available;
  bool get isUnavailable => state is _Unavailable;
  bool get isLoading => state is _Loading;

  void resetToInitialState() => emit(const _Initial());

  void onTextChanged(String text) {
    _textChangeSubject.add(text); // Agrega el texto al Subject
  }

  void _validateAndCheckUsername(String text) {
    // Ahora es privado
    if (text.length > 2) {
      _checkUsernameAvailability(text);
    } else {
      emit(const _Unavailable());
    }
  }

  void _checkUsernameAvailability(String text) async {
    // Ahora es privado
    await Future.microtask(() => emit(const _Loading()));

    await _meRepo.checkUsernameAvailability(text).then((result) {
      result.when(
        success: (usernameDM) {
          if (usernameDM.isAvailable) {
            emit(const _Available());
          } else {
            emit(const _Unavailable());
          }
        },
        failure: (e) => emit(_Error(e.errorMsg)),
      );
    });
  }
}
