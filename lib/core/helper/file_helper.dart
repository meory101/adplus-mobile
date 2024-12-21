import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
// import 'package:file_picker/file_picker.dart';


/*nour othman*/

abstract class FileHelper {
  static Future<File?> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      return file;
    }
    return null;
  }

  static String convertToBase64({required File? file}) {
    if(file==null) return"";
    List<int> imageBytes = file.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  static String getFileName({required File file}) {
    return path.basename(file.path);
  }

  static String getFileExtension({required String fileName}) {
    return path.extension(fileName).replaceAll('.', '');
  }

  static String addHeaderToBase64(
      {required String base64Data, required String extension}) {
    String base64Header = 'data:image/$extension;base64,';
    return base64Header + base64Data;
  }
}
