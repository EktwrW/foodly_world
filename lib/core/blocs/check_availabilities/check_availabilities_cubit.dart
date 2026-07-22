import 'dart:async';

import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'check_availabilities_cubit.freezed.dart';
part 'check_availabilities_state.dart';

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

  void resetToInitialState() => emit(const _Initial());

  void onTextChanged(String text) {
    _textChangeSubject.add(text);
  }

  void _validateAndCheckUsername(String text) {
    if (text.length > 2) {
      _checkUsernameAvailability(text);
    } else {
      emit(const _Initial());
    }
  }

  void _checkUsernameAvailability(String text) async {
    await Future.microtask(() => emit(const _Loading()));

    await _meRepo.checkUsernameAvailability(text).then((result) {
      result.when(
        success: (usernameDM) async {
          if (usernameDM.isAvailable) {
            await Future.microtask(() => emit(const _Available()));
          } else {
            await Future.microtask(() => emit(const _Unavailable()));
          }
        },
        failure: (e) => emit(_Error(e.errorMsg)),
      );
    });
  }
}
