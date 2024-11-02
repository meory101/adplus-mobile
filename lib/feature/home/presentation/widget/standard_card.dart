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

class StandardCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final int index;
  final int? itemCount;

  const StandardCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.onTap,
      this.itemCount,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: AppWidthManager.w25,
            height: AppHeightManager.h20,
            margin: itemCount == 3
                ? EdgeInsets.only(
                    left: LanguageHelper.checkIfLTR(context: context)
                        ? AppWidthManager.w3Point8
                        : 0,
                    right: !LanguageHelper.checkIfLTR(context: context)
                        ? AppWidthManager.w3Point8
                        : 0)
                : EdgeInsets.only(
                    right: index % 2 == 0
                        ? LanguageHelper.checkIfLTR(context: context)
                            ? AppWidthManager.w3Point8
                            : 0
                        : 0,
                    left: index % 2 == 0
                        ? !LanguageHelper.checkIfLTR(context: context)
                            ? AppWidthManager.w3Point8
                            : 0
                        : 0,
                    bottom: AppWidthManager.w3Point8),
            decoration: BoxDecoration(
                boxShadow: ThemeManager.cardShadow,
                color: AppColorManager.lightGreyOpacity6,
                borderRadius: BorderRadius.circular(AppRadiusManager.r15)),
            child: MainImageWidget(
              borderRadius: BorderRadius.circular(AppRadiusManager.r15),
              imageUrl: AppConstantManager.imageBaseUrl + imagePath,
            ),
          ),
          Positioned(
            left: LanguageHelper.checkIfLTR(context: context)
                ? AppWidthManager.w3
                : 0,
            bottom: AppHeightManager.h1point8,
            right: !LanguageHelper.checkIfLTR(context: context)
                ? AppWidthManager.w3
                : 0,
            child: AppTextWidget(
              text: title,
              fontSize: FontSizeManager.fs15,
              fontWeight: FontWeight.w600,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
