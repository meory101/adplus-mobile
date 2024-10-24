import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

/// Eng. Nour Othman(meory)

class NewestItemsGridView extends StatelessWidget {
  const NewestItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
            text: "cars",
            fontSize: FontSizeManager.fs16,
            color: AppColorManager.textAppColor,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(AppWidthManager.w3Point8),
                alignment: Alignment.center,
                height: AppHeightManager.h21,
                padding: EdgeInsets.all(AppWidthManager.w3Point8),
                decoration: BoxDecoration(
                  color: AppColorManager.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColorManager.grey,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    )
                  ],
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
                        imageUrl: AppImageManager.placeholder,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: AppWidthManager.w3Point8,
                    ),
                    AppTextWidget(
                      text: "sub category",
                      color: AppColorManager.mainColor,
                      fontSize: FontSizeManager.fs16,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(AppWidthManager.w3Point8),
                alignment: Alignment.center,
                height: AppHeightManager.h21,
                padding: EdgeInsets.all(AppWidthManager.w3Point8),
                decoration: BoxDecoration(
                  color: AppColorManager.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColorManager.grey,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    )
                  ],
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
                        imageUrl: AppImageManager.placeholder,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: AppWidthManager.w3Point8,
                    ),
                    AppTextWidget(
                      text: "sub category",
                      color: AppColorManager.mainColor,
                      fontSize: FontSizeManager.fs16,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
      ],
    );
  }
}
