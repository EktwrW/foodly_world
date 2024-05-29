import 'package:flutter/widgets.dart' show TextEditingController, FocusNode;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_controller.freezed.dart';

@freezed
class InputController with _$InputController {
  const InputController._();

  const factory InputController({
    TextEditingController? controller,
    FocusNode? focusNode,
  }) = _InputController;

  String? get text => controller?.text;
  bool get isFocused => focusNode?.hasFocus ?? false;
}
