import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_vm.freezed.dart';

enum ContactRecipient { hello, privacy }

@freezed
class ContactVM with _$ContactVM {
  const factory ContactVM({
    @Default(ContactRecipient.hello) ContactRecipient recipient,
    String? attachmentPath,
    String? attachmentName,
    @Default(false) bool attachmentTooLarge,
  }) = _ContactVM;
}
