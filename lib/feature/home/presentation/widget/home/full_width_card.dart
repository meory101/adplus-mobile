import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/resource/theme_manager.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

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
      child: Container(
        width: AppWidthManager.w100,

        decoration: BoxDecoration(
            color: AppColorManager.lightGreyOpacity6,
            borderRadius: BorderRadius.circular(AppRadiusManager.r10)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: AppWidthManager.w100,
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
              maxLines: 2,
              textAlign: TextAlign.center,

              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: AppHeightManager.h2,
            ),
          ],
        ),
      ),
    );
  }
}
