import 'dart:typed_data' show Uint8List;

import 'package:dio/dio.dart';

abstract class FileHandler {
  /// Para archivos locales del dispositivo
  Future<MultipartFile?> getMultipartFile(String? filePath);

  /// Para bytes en memoria (imágenes generadas o procesadas)
  Future<MultipartFile?> getMultipartFileFromBytes(Uint8List bytes, String fileName);

  /// Para imágenes desde URLs (providers de autenticación)
  Future<MultipartFile?> getMultipartFileFromUrl(String? imageUrl);
}
