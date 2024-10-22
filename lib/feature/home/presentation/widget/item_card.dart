import 'package:flutter/cupertino.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      height: AppHeightManager.h21,
      padding: EdgeInsets.all(AppWidthManager.w3Point8),
      decoration: BoxDecoration(

        color:  AppColorManager.white
        ,
        boxShadow: const [],
        borderRadius: BorderRadius.circular(AppRadiusManager.r15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: AppWidthManager.w25,
            width: AppWidthManager.w25,
            child: MainImageWidget(
              imageUrl:  "dd",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: AppWidthManager.w3Point8,
          ),
          AppTextWidget(
            text:"sub category name",
            color: AppColorManager.mainColor,
            fontSize: FontSizeManager.fs16,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
