import 'package:foodly_world/ui/shared_widgets/contact/view_model/contact_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.idle(ContactVM vm) = _Idle;
  const factory ContactState.sending(ContactVM vm) = _Sending;
  const factory ContactState.sent(ContactVM vm) = _Sent;
  const factory ContactState.error(String msg, ContactVM vm) = _Error;
}

extension ContactStateX on ContactState {
  ContactVM get vm => maybeWhen(
        idle: (vm) => vm,
        sending: (vm) => vm,
        sent: (vm) => vm,
        error: (_, vm) => vm,
        orElse: () => const ContactVM(),
      );

  bool get isSending => maybeWhen(sending: (_) => true, orElse: () => false);
}
