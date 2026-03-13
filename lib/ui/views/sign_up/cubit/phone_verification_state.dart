sealed class PhoneVerificationState {
  const PhoneVerificationState();
}

class PhoneVerInitial extends PhoneVerificationState {
  const PhoneVerInitial();
}

class PhoneVerSendingCode extends PhoneVerificationState {
  const PhoneVerSendingCode();
}

class PhoneVerCodeSent extends PhoneVerificationState {
  final String verificationId;
  final int? resendToken;
  const PhoneVerCodeSent({required this.verificationId, this.resendToken});
}

class PhoneVerVerifying extends PhoneVerificationState {
  const PhoneVerVerifying();
}

class PhoneVerVerified extends PhoneVerificationState {
  final String idToken;
  const PhoneVerVerified({required this.idToken});
}

class PhoneVerError extends PhoneVerificationState {
  final String message;
  const PhoneVerError({required this.message});
}
