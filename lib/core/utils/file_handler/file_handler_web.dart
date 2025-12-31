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
      var fileName = xFile.name; // Obtiene directamente el nombre del archivo.

      // If filename is empty (common on web), create a fallback and try to detect type from bytes
      MediaType mediaType;
      if (fileName.isEmpty) {
        mediaType = _detectMediaTypeFromBytes(fileBytes);
        final ext = mediaType.subtype == 'jpeg' ? 'jpg' : mediaType.subtype;
        fileName = 'upload.$ext';
      } else {
        mediaType = _getMediaType(fileName);
      }

      // Crea el MultipartFile usando el contenido y el nombre del archivo.
      return MultipartFile.fromBytes(
        fileBytes,
        filename: fileName,
        contentType: mediaType,
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

  MediaType _detectMediaTypeFromBytes(Uint8List bytes) {
    if (bytes.length >= 4) {
      // PNG header: 89 50 4E 47
      if (bytes[0] == 0x89 && bytes[1] == 0x50 && bytes[2] == 0x4E && bytes[3] == 0x47) {
        return MediaType('image', 'png');
      }

      // JPEG header: FF D8 FF
      if (bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
        return MediaType('image', 'jpeg');
      }

      // GIF header: GIF8
      if (bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46 && bytes[3] == 0x38) {
        return MediaType('image', 'gif');
      }
    }

    return MediaType('application', 'octet-stream');
  }
}
