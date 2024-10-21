import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

abstract class AppImageHelper {
  static Future<File?>? pickImageFrom({required ImageSource source}) async {

    try {
      final photo =
      await ImagePicker().pickImage(source: source,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75,);
      if(photo==null) return null;
      return File(photo.path);
    }
    catch(e){
      print(e);
    }
    return null;
  }

  static String convertBase46Encoder({required File image}) {
    List<int> imageBytes = image.readAsBytesSync() ?? [];
    return base64Encode(imageBytes);
  }

  static Image convertBase46Decoder({required String image}) {
    return Image.memory(const Base64Decoder().convert(image));
  }
}

