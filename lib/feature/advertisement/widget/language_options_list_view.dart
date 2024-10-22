import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resource/color_manager.dart';
import '../../../core/resource/font_manager.dart';
import '../../../core/resource/icon_manager.dart';
import '../../../core/resource/size_manager.dart';
import '../../../core/resource/theme_manager.dart';
import '../../../core/widget/text/app_text_widget.dart';

class LanguageOptionsListView extends StatefulWidget {
  const LanguageOptionsListView({super.key});

  @override
  State<LanguageOptionsListView> createState() =>
      _LanguageOptionsListViewState();
}

class _LanguageOptionsListViewState extends State<LanguageOptionsListView> {
  int selectedLanIndex = 0;

  @override
  Widget build(BuildContext context) {
    return

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
            margin: EdgeInsets.only(bottom: AppHeightManager.h1point8),
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
    );
  }
}
