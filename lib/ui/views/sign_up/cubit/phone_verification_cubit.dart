import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  final FirebaseAuth _auth;

  PhoneVerificationCubit() : _auth = FirebaseAuth.instance, super(const PhoneVerInitial());

  Future<void> sendCode(String phoneNumber) async {
    emit(const PhoneVerSendingCode());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Android auto-verification — fires when SMS is auto-read
        emit(const PhoneVerVerifying());
        try {
          final result = await _auth.signInWithCredential(credential);
          final idToken = await result.user?.getIdToken() ?? '';
          await _auth.signOut();
          emit(PhoneVerVerified(idToken: idToken));
        } catch (e) {
          emit(PhoneVerError(message: e.toString()));
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        final msg = switch (e.code) {
          'invalid-phone-number' => 'Invalid phone number. Include country code (e.g. +351...).',
          'too-many-requests' => 'Too many requests. Please try again later.',
          'quota-exceeded' => 'SMS quota exceeded. Please try again later.',
          _ => e.message ?? 'Verification failed. Please try again.',
        };
        emit(PhoneVerError(message: msg));
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(PhoneVerCodeSent(verificationId: verificationId, resendToken: resendToken));
      },
      codeAutoRetrievalTimeout: (_) {
        // Keep current state — user is likely manually entering code
      },
    );
  }

  Future<void> verifyCode({required String verificationId, required String smsCode}) async {
    emit(const PhoneVerVerifying());
    try {
      final credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      final result = await _auth.signInWithCredential(credential);
      final idToken = await result.user?.getIdToken() ?? '';
      await _auth.signOut();
      emit(PhoneVerVerified(idToken: idToken));
    } on FirebaseAuthException catch (e) {
      final msg = switch (e.code) {
        'invalid-verification-code' => 'Incorrect code. Please try again.',
        'session-expired' => 'Code expired. Please request a new one.',
        _ => e.message ?? 'Verification failed.',
      };
      emit(PhoneVerError(message: msg));
    }
  }

  void resetToCodeSent(String verificationId, int? resendToken) =>
      emit(PhoneVerCodeSent(verificationId: verificationId, resendToken: resendToken));
}
