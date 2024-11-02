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

class FullWidthCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String? bgImage;
  final VoidCallback onTap;

  const FullWidthCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.bgImage, // Background image
    required this.onTap, // Make onTap required
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: AppWidthManager.w100,
            height: AppHeightManager.h20,
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