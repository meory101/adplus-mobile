import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppButton(
      onTap: () {
        Navigator.of(context)
            .pop();
      },
      margin:
      EdgeInsets.symmetric(
          horizontal:
          AppWidthManager
              .w3Point8),
      alignment:
      Alignment.center,
      height:
      AppHeightManager.h6,
      width: AppWidthManager.w60,
      color: AppColorManager
          .mainColor,
      child: AppTextWidget(
        text: "done".tr(),
        color: AppColorManager
            .white,
        fontSize:
        FontSizeManager
            .fs16,
        fontWeight:
        FontWeight.w600,
      ),
    );
  }
}
