import 'package:flutter/cupertino.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class ItemCard extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  const ItemCard({super.key, this.imageUrl,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppHeightManager.h2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.center,
      width: width,
      height: AppHeightManager.h19,
      decoration: BoxDecoration(
        color: AppColorManager.red,
        boxShadow: const [],
        borderRadius: BorderRadius.circular(AppRadiusManager.r15),
      ),
      child: SizedBox(
        child: MainImageWidget(
          imageUrl: imageUrl ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
