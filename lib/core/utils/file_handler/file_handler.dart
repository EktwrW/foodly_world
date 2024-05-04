import 'package:dio/dio.dart';

abstract class FileHandler {
  Future<MultipartFile?> getMultipartFile(String? filePath);
}
