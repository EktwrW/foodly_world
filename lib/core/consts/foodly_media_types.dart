import 'package:dio/dio.dart' show DioMediaType;

/// Define los tipos de medios aceptados por el backend
class MediaTypesConstants {
  const MediaTypesConstants._();

  // Mime types base
  static const String imageType = 'image';
  static const String videoType = 'video';
  static const String applicationType = 'application';

  // Extensiones de imagen admitidas
  static const Set<String> imageExtensions = {
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
  };

  // Extensiones de video admitidas
  static const Set<String> videoExtensions = {
    'mp4',
    'mov',
    'webm',
    'm4v',
    'mkv',
    'avi',
    'wmv',
    'flv',
    '3gp',
    'mpeg',
    'mpg',
    'ts',
  };

  // Mapa de extensiones de video a sus MIME types específicos
  static const Map<String, String> videoMimeTypes = {
    'mp4': 'mp4',
    'mov': 'quicktime',
    'webm': 'webm',
    'm4v': 'x-m4v',
    'mkv': 'x-matroska',
    'avi': 'x-msvideo',
    'wmv': 'x-ms-wmv',
    'flv': 'x-flv',
    '3gp': '3gpp',
    'mpeg': 'mpeg',
    'mpg': 'mpeg',
    'ts': 'mp2t',
  };

  // Mapa de extensiones de imagen a sus MIME types específicos
  static const Map<String, String> imageMimeTypes = {
    'jpg': 'jpeg',
    'jpeg': 'jpeg',
    'png': 'png',
    'gif': 'gif',
    'webp': 'webp',
  };

  /// Verifica si una extensión es una imagen válida
  static bool isValidImageExtension(String extension) {
    return imageExtensions.contains(extension.toLowerCase());
  }

  /// Verifica si una extensión es un video válido
  static bool isValidVideoExtension(String extension) {
    return videoExtensions.contains(extension.toLowerCase());
  }

  /// Obtiene el MediaType correcto basado en la extensión del archivo
  static DioMediaType getMediaType(String extension) {
    final ext = extension.toLowerCase();

    if (isValidImageExtension(ext)) {
      return DioMediaType(imageType, imageMimeTypes[ext] ?? 'png');
    }

    if (isValidVideoExtension(ext)) {
      return DioMediaType(videoType, videoMimeTypes[ext] ?? 'mp4');
    }

    return DioMediaType(applicationType, 'octet-stream');
  }

  /// Obtiene la extensión de un filename
  static String getExtensionFromFileName(String fileName) {
    return fileName.split('.').last.toLowerCase();
  }
}
