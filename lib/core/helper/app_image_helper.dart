import 'dart:convert';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../resource/color_manager.dart';

/// Eng.Nour Othman(meory)*

abstract class AppImageHelper {
  static Future<File?>? pickImageFrom({required ImageSource source}) async {
    File? tempImage;
    try {
      final photo = await ImagePicker().pickImage(
        source: source,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75,
      );
      if (photo == null) return null;
      tempImage = File(photo.path);
      tempImage = await _cropImage(imageFile: tempImage);
    } catch (error) {}
    return tempImage;
  }

  static Future<List<File?>?>? pickMultiImagesFrom() async {
    List<File>? finalImages = [];
    try {
      List<XFile?>? photos = await ImagePicker().pickMultiImage(
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 100,
      );

      if (photos.isEmpty) return null;

      for (XFile? photo in photos) {
        if ((photo?.path ?? "").isNotEmpty) {
          File? croppedFile = await _cropImage(imageFile: File(photo!.path));
          if (croppedFile != null) {
            finalImages.add(croppedFile);
          }
        }
      }

      return finalImages;
    } catch (error) {
      // Handle error (optional)
      print('Error picking images: $error');
      return null;
    }
  }

  static String convertBase46Encoder({required File image}) {
    List<int> imageBytes = image.readAsBytesSync() ?? [];
    return base64Encode(imageBytes);
  }

  static Image convertBase46Decoder({required String image}) {
    return Image.memory(const Base64Decoder().convert(image));
  }

  static Future<File?> _cropImage({required File imageFile}) async {
    try {
      CroppedFile? croppedImg = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        // compressQuality: 75,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: AppColorManager.mainColor,
            toolbarWidgetColor: Colors.white,
            backgroundColor: Colors.black,
            activeControlsWidgetColor: AppColorManager.mainColor,
            cropFrameColor: AppColorManager.mainColor,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: '',
            doneButtonTitle: 'Done',
            cancelButtonTitle: 'Cancel',
            rotateButtonsHidden: false,
            rotateClockwiseButtonHidden: false,
            aspectRatioLockEnabled: true,
          ),
        ],
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );

      if (croppedImg == null) {
        return null;
      }

      return File(croppedImg.path);
    } catch (e) {
      return null;
    }
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
