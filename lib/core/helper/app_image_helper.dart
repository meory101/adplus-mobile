import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

abstract class AppImageHelper {
  static Future<File?>? pickImageFrom({required ImageSource source}) async {
    File? tempImage;
    try {
      final photo =
      await ImagePicker().pickImage( source: source,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75,

      );
      if (photo == null) return null;
      tempImage = File(photo.path);
      // tempImage = await _cropImage(imageFile: tempImage);
    } catch (error) {
    }
    return tempImage;
  }
  static Future<List<File?>?>? pickMultiImagesFrom() async {
    List<File>? tempImages  =[];
    try {
    List<XFile?>? photos=
      await ImagePicker().pickMultiImage(
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75,
      );
      if (photos.isEmpty) return null;
     photos.forEach((photo) {
       if((photo?.path??"").isNotEmpty){
         tempImages.add(File(photo!.path));
       }
     },);

    } catch (error) {
    }
    return tempImages;
  }


  static String convertBase46Encoder({required File image}) {
    List<int> imageBytes = image.readAsBytesSync() ?? [];
    return base64Encode(imageBytes);
  }

  static Image convertBase46Decoder({required String image}) {
    return Image.memory(const Base64Decoder().convert(image));
  }
}

// Future<File?> _cropImage({required File imageFile}) async {
//   try {
//     CroppedFile? croppedImg = await ImageCropper()
//         .cropImage(sourcePath: imageFile.path, compressQuality: 75,
//     );
//     if (croppedImg == null) {
//       return null;
//     } else {
//       return File(croppedImg.path);
//     }
//   } catch (e) {
//     print(e);
//   }
//   return null;
// }
