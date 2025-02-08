import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class FileHandlerWeb implements FileHandler {
  @override
  Future<MultipartFile?> getMultipartFile(String? filePath) async {
    try {
      if (filePath == null || filePath.isEmpty) return null;

      final xFile = XFile(filePath);
      final fileBytes = await xFile.readAsBytes();
      final fileName = xFile.name; // Obtiene directamente el nombre del archivo.

      // Crea el MultipartFile usando el contenido y el nombre del archivo.
      return MultipartFile.fromBytes(
        fileBytes,
        filename: fileName,
        contentType: _getMediaType(fileName),
      );
    } catch (e) {
      debugPrint('Error in getMultipartFile (Web): $e');
      return null;
    }
  }

  @override
  Future<MultipartFile?> getMultipartFileFromBytes(Uint8List bytes, String filename) async {
    try {
      if (bytes.isEmpty || filename.isEmpty) return null;

      return MultipartFile.fromBytes(
        bytes,
        filename: filename,
        contentType: _getMediaType(filename),
      );
    } catch (e) {
      debugPrint('Error in getMultipartFileFromBytes (Web): $e');
      return null;
    }
  }

  @override
  Future<MultipartFile?> getMultipartFileFromUrl(String? imageUrl) async {
    if (imageUrl?.isEmpty ?? true) return null;

    final dio = Dio();

    try {
      final response = await dio.get(
        imageUrl!,
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = Uint8List.fromList(response.data);
      return getMultipartFileFromBytes(bytes, 'avatar.png');
    } catch (e) {
      return null;
    }
  }

  MediaType _getMediaType(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'png':
        return MediaType('image', 'png');
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'gif':
        return MediaType('image', 'gif');
      case 'mp4':
        return MediaType('video', 'mp4');
      default:
        return MediaType('application', 'octet-stream');
    }
  }
}
