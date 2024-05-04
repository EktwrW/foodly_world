import 'package:flutter/foundation.dart'; // Importa foundation para kIsWeb
import 'file_handler.dart';
// Importa ambas versiones, el compilador se asegura de incluir solo lo que se usa.
import 'file_handler_mobile.dart';
import 'file_handler_web.dart';

FileHandler getFileHandler() {
  // Usa kIsWeb para determinar la plataforma
  if (kIsWeb) {
    return FileHandlerWeb();
  } else {
    return FileHandlerMobile();
  }
}
