import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

import 'file_handler.dart';

class FileHandlerMobile implements FileHandler {
  static const _videoExtensions = {
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

  @override
  Future<MultipartFile?> getMultipartFile(String? filePath) async {
    if (filePath?.isEmpty ?? true) return null;
    final file = File(filePath!);
    final rawFileName = file.path.split('/').last;
    final extension = rawFileName.contains('.') ? rawFileName.split('.').last.toLowerCase() : '';

    if (_videoExtensions.contains(extension)) {
      return MultipartFile.fromFileSync(
        file.path,
        contentType: MediaType('video', extension),
        filename: rawFileName,
      );
    }

    // Image: keep existing behaviour (ensure .png extension)
    final fileName = rawFileName.contains('.${FoodlyStrings.PNG}') ? rawFileName : '$rawFileName.${FoodlyStrings.PNG}';
    return MultipartFile.fromFileSync(
      file.path,
      contentType: MediaType(FoodlyStrings.IMAGE, FoodlyStrings.PNG),
      filename: fileName,
    );
  }

  @override
  Future<MultipartFile?> getMultipartFileFromBytes(Uint8List bytes, String filename) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/$filename').writeAsBytes(bytes);
      return MultipartFile.fromFileSync(file.path, filename: filename);
    } catch (e) {
      debugPrint('Error converting bytes to file: $e');
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
}
