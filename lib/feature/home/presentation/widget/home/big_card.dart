import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/resource/theme_manager.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int index;
  final VoidCallback onTap;

  const BigCard(
      {super.key,
        required this.title,
        required this.imagePath,
        required this.onTap,
        required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: AppWidthManager.w60,
            height: AppHeightManager.h20,
            margin: EdgeInsets.only(
              left:   index % 2 == 0
            ? !LanguageHelper.checkIfLTR(context: context)
                ? AppWidthManager.w3Point8
                : 0
              : 0,
                right: index % 2 == 0
                    ? LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w3Point8
                    : 0
                    : 0, ),
            decoration: BoxDecoration(
                boxShadow: ThemeManager.cardShadow,
                color: AppColorManager.lightGreyOpacity6,
                borderRadius: BorderRadius.circular(AppRadiusManager.r10)),
            child: MainImageWidget(
              borderRadius: BorderRadius.circular(AppRadiusManager.r10),
              imageUrl: AppConstantManager.imageBaseUrl + imagePath,
            ),
          ),
          SizedBox(height: AppHeightManager.h1,),

      AppTextWidget(
        text: title,
        fontSize: FontSizeManager.fs16,
        fontWeight: FontWeight.w600,
        color: AppColorManager.black,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
          SizedBox(height: AppHeightManager.h1point8,),
        ],
      ),
    );
  }
}