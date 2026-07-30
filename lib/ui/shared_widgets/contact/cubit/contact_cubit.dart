import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/ui/shared_widgets/contact/cubit/contact_state.dart';
import 'package:foodly_world/ui/shared_widgets/contact/view_model/contact_vm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart' as uni_io;

class ContactCubit extends Cubit<ContactState> {
  final MeRepo _meRepo;
  ContactVM _vm = const ContactVM();

  ContactCubit(MeRepo meRepo)
      : _meRepo = meRepo,
        super(const ContactState.idle(ContactVM()));

  void setRecipient(ContactRecipient recipient) {
    _vm = _vm.copyWith(recipient: recipient, attachmentTooLarge: false);
    emit(ContactState.idle(_vm));
  }

  Future<void> pickAttachment() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    int sizeBytes;
    try {
      sizeBytes = await uni_io.File(picked.path).length();
    } catch (_) {
      // Web fallback
      sizeBytes = (await picked.readAsBytes()).length;
    }

    if (sizeBytes > 3 * 1024 * 1024) {
      _vm = _vm.copyWith(attachmentPath: null, attachmentName: null, attachmentTooLarge: true);
      emit(ContactState.idle(_vm));
      return;
    }

    _vm = _vm.copyWith(
      attachmentPath: picked.path,
      attachmentName: picked.name,
      attachmentTooLarge: false,
    );
    emit(ContactState.idle(_vm));
  }

  void clearAttachment() {
    _vm = _vm.copyWith(attachmentPath: null, attachmentName: null, attachmentTooLarge: false);
    emit(ContactState.idle(_vm));
  }

  Future<void> send({required String subject, required String message}) async {
    emit(ContactState.sending(_vm));

    final result = await _meRepo.sendContact(
      recipient: _vm.recipient.name,
      subject: subject,
      message: message,
      attachmentPath: _vm.attachmentPath,
    );

    result.when(
      success: (_) => emit(ContactState.sent(_vm)),
      failure: (e) => emit(ContactState.error(e.errorMsg, _vm)),
    );
  }
}
