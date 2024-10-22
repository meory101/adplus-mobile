import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/resource/theme_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';

import '../../../core/resource/font_manager.dart';

class AdvertisementLanguageScreen extends StatefulWidget {
  const AdvertisementLanguageScreen({super.key});

  @override
  State<AdvertisementLanguageScreen> createState() =>
      _AdvertisementScreenState();
}

int selectedLanIndex = 0;

class _AdvertisementScreenState extends State<AdvertisementLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MainAppButton(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          height: AppHeightManager.h100,
          width: AppWidthManager.w100,
          margin: EdgeInsets.only(
            top: AppHeightManager.h9,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: AppWidthManager.w3Point8,
              vertical: AppHeightManager.h2point5),
          decoration: BoxDecoration(
            color: AppColorManager.white,
            boxShadow: ThemeManager.dialogShadow,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppRadiusManager.r20),
              topRight: Radius.circular(AppRadiusManager.r20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  SvgPicture.asset(
                    AppIconManager.xMark,
                    colorFilter: const ColorFilter.mode(
                      AppColorManager.mainColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              AppTextWidget(
                  text: "Choose Language",
                  fontSize: FontSizeManager.fs16,
                  color: AppColorManager.textAppColor,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: AppHeightManager.h1point8,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedLanIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == selectedLanIndex
                                ? AppColorManager.mainColor
                                : AppColorManager.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppRadiusManager.r15),
                        ),
                        color: AppColorManager.white,
                        boxShadow: ThemeManager.cardShadow,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidthManager.w3Point8,
                        vertical: AppHeightManager.h2point5,
                      ),
                      margin:
                          EdgeInsets.only(bottom: AppHeightManager.h1point8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextWidget(
                                  text: "Both Languages",
                                  fontSize: FontSizeManager.fs16,
                                  color: AppColorManager.textAppColor,
                                  fontWeight: FontWeight.w500),
                              Visibility(
                                visible: selectedLanIndex == index,
                                child: SvgPicture.asset(
                                  AppIconManager.done,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorManager.mainColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppHeightManager.h2,
                          ),
                          AppTextWidget(
                              text:
                                  "your Advertisment will appear for users that use this application in english language pla pla pla ",
                              fontSize: FontSizeManager.fs15,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              color: AppColorManager.textGrey,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
