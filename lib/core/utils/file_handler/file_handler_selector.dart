import 'package:flutter/foundation.dart' show kIsWeb;
import 'file_handler.dart';
// Imoport both versions, compiler determines the use case.
import 'file_handler_mobile.dart';
import 'file_handler_web.dart';

FileHandler getFileHandler() {
  if (kIsWeb) {
    return FileHandlerWeb();
  } else {
    return FileHandlerMobile();
  }
}
