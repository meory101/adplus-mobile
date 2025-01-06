
import 'package:flutter/material.dart';

import '../../../../../../core/resource/constant_manager.dart';
import '../../../../../../core/widget/image/main_image_widget.dart';

void showDialogImage({required BuildContext context,required String url}){
  showDialog(context: context, builder: (context) {
    return Dialog(
      child: MainImageWidget(
          fit: BoxFit.fill,
          imageUrl: AppConstantManager.imageBaseUrl+(url)
      ),
    );
  },);
}