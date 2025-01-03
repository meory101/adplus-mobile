import 'dart:math';

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

final List<Color> colors = [
  AppColorManager.green.withOpacity(0.9),
  AppColorManager.orange.withOpacity(0.15),
  AppColorManager.red.withOpacity(0.15),
  AppColorManager.mainColor.withOpacity(0.15),
  AppColorManager.pinkAccent.withOpacity(0.15),
  AppColorManager.purple.withOpacity(0.15),
];

Color getRandomColor() {
  final random = Random();
  return colors[random.nextInt(colors.length)];
}

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
      child: Container(
        width: AppWidthManager.w25,
        decoration: BoxDecoration(
            color: AppColorManager.background,
            borderRadius: BorderRadius.circular(AppRadiusManager.r10)),
        margin: itemCount == 3
            ? EdgeInsets.only(
          bottom: 0,
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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: AppWidthManager.w25,
              height: AppHeightManager.h20,

              decoration: BoxDecoration(
                  boxShadow: ThemeManager.cardShadow,
                  color: AppColorManager.lightGreyOpacity6,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10)),
              child: MainImageWidget(

                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                imageUrl: AppConstantManager.imageBaseUrl + imagePath,
              ),
            ),
            SizedBox(
              height: AppHeightManager.h1,
            ),
            AppTextWidget(
              text: "$title\n",
              fontSize: FontSizeManager.fs16,
              fontWeight: FontWeight.w600,
              color: AppColorManager.black,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ),
      ),
    );
  }
}
