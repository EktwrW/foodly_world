import 'dart:io';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:http_parser/http_parser.dart';

import 'file_handler.dart';

class FileHandlerMobile implements FileHandler {
  @override
  Future<MultipartFile?> getMultipartFile(String? filePath) async {
    if (filePath?.isEmpty ?? true) return null;
    final file = File(filePath!);
    final fileName = file.path.split('/').last.contains('.${FoodlyStrings.PNG}')
        ? file.path.split('/').last
        : '${file.path.split('/').last}.${FoodlyStrings.PNG}';

    return MultipartFile.fromFileSync(file.path,
        contentType: MediaType(FoodlyStrings.IMAGE, FoodlyStrings.PNG), filename: fileName);
  }
}
