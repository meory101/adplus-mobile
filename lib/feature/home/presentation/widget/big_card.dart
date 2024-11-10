import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/resource/theme_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';

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
                borderRadius: BorderRadius.circular(AppRadiusManager.r15)),
            child: MainImageWidget(
              borderRadius: BorderRadius.circular(AppRadiusManager.r15),
              imageUrl: AppConstantManager.imageBaseUrl + imagePath,
            ),
          ),
          SizedBox(height: AppHeightManager.h05,),
          AppTextWidget(
            text: title,
            fontSize: FontSizeManager.fs15,
            fontWeight: FontWeight.w700,
            color: AppColorManager.mainColor,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppHeightManager.h1point8,),
        ],
      ),
    );
  }
}