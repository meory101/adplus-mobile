import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';

import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';


/// Eng. Nour Othman(meory)

class AdvertisementAppBar extends StatelessWidget {
  final double completePercent;

  const AdvertisementAppBar({super.key, required this.completePercent});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
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
                    text: "back".tr(),
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
      ),
      SizedBox(
        height: AppHeightManager.h1point8,
      ),
      Visibility(
          visible: completePercent != 0,
          child:
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            width: MediaQuery.of(context).size.width,
            height: AppHeightManager.h1point8,
            decoration: BoxDecoration(
              color: AppColorManager.borderGrey,
              borderRadius: BorderRadius.circular(AppRadiusManager.r20),
            ),
            child: Align(
              alignment:
              LanguageHelper.checkIfLTR(context: context)?
              Alignment.topLeft :  Alignment.topRight,
              child: Container(
                width:
                (MediaQuery.of(context).size.width ) * completePercent,
                decoration: BoxDecoration(
                  color:  AppColorManager.mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),)
    ]);
  }
}
