import 'package:flutter/cupertino.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/text/app_text_widget.dart';


class AdvertisementNextButton extends StatelessWidget {
  final void Function()? onTap;
  const AdvertisementNextButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return    MainAppButton(
      onTap: onTap ,
      alignment: Alignment.center,
      margin: EdgeInsets.all(AppWidthManager.w3Point8),
      color: AppColorManager.mainColor,
      width: AppWidthManager.w100,
      height: AppHeightManager.h6,
      child: AppTextWidget(
          text: "Next",
          fontSize: FontSizeManager.fs16,
          color: AppColorManager.white,
          fontWeight: FontWeight.w500),
    );
  }
}
