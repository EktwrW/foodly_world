import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'file_handler.dart';

class FileHandlerWeb implements FileHandler {
  @override
  Future<MultipartFile?> getMultipartFile(String? filePath) async {
    if (filePath?.isEmpty ?? true) return null;

    final xFile = XFile(filePath ?? '');
    final fileBytes = await xFile.readAsBytes();
    final fileName = '${xFile.path.split('/').last}.png';

    return MultipartFile.fromBytes(
      fileBytes,
      filename: fileName,
      contentType: MediaType('image', 'png'),
    );
  }
}
