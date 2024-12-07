import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/resource/theme_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class LanguageOptionsListView extends StatefulWidget {
  const LanguageOptionsListView({super.key});

  @override
  State<LanguageOptionsListView> createState() =>
      _LanguageOptionsListViewState();
}

class _LanguageOptionsListViewState extends State<LanguageOptionsListView> {
  int selectedLanIndex = 2;
  List<String> title = ["bothLanguages".tr(), "english".tr(), "arabic".tr()];
  List<String> subTitle = [
    "advertisementInfoBothLanguages".tr(),
    "advertisementInfoEnglish".tr(),
    "advertisementInfoArabic".tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
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
              color: selectedLanIndex == index
                  ? AppColorManager.white
                  : AppColorManager.lightGreyOpacity6,
              boxShadow: ThemeManager.cardShadow,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppWidthManager.w3Point8,
              vertical: AppHeightManager.h2point5,
            ),
            margin: EdgeInsets.only(bottom: AppHeightManager.h1point8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextWidget(
                        text: title[index],
                        fontSize: FontSizeManager.fs16,
                        color:selectedLanIndex ==index?  AppColorManager.textAppColor:AppColorManager.grey,
                        fontWeight: FontWeight.w600),
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
                    text: subTitle[index],
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
    );
  }
}
