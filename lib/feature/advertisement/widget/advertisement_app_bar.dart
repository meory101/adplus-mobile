import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helper/language_helper.dart';
import '../../../core/resource/color_manager.dart';
import '../../../core/resource/font_manager.dart';
import '../../../core/resource/icon_manager.dart';
import '../../../core/widget/text/app_text_widget.dart';
import '../../../router/router.dart';

class AdvertisementAppBar extends StatelessWidget {
  const AdvertisementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              SvgPicture.asset(
                LanguageHelper.checkIfLTR(context: context)
                    ? AppIconManager.arrowMenuLeft
                    : AppIconManager.arrowMenuRight,
                colorFilter: const ColorFilter.mode(
                  AppColorManager.mainColor,
                  BlendMode.srcIn,
                ),
              ),
              AppTextWidget(
                  text: "Back",
                  fontSize: FontSizeManager.fs16,
                  color: AppColorManager.textAppColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteNamedScreens.mainBottomAppBar,
              (route) => false,
            );
          },
          child: SvgPicture.asset(
            AppIconManager.xMark,
            colorFilter: const ColorFilter.mode(
              AppColorManager.mainColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
