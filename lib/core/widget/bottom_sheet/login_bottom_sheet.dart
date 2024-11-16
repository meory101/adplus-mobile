import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../router/router.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/size_manager.dart';
import '../button/main_app_button.dart';
import '../text/app_text_widget.dart';

void showLoginBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: AppHeightManager.h1point5,
            horizontal: AppWidthManager.w2point5),
        height: AppHeightManager.h15,
        decoration: BoxDecoration(
            color: AppColorManager.white,
            boxShadow: [
              BoxShadow(
                color: AppColorManager.lightGreyOpacity6,
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(AppRadiusManager.r10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextWidget(
              text: "pleaseLoginToContinue".tr(),
              fontWeight: FontWeight.w600,
              fontSize: FontSizeManager.fs16,
              overflow: TextOverflow.visible,
              color: AppColorManager.textAppColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppHeightManager.h3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainAppButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppWidthManager.w10),
                      borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                      height: AppHeightManager.h5,
                      onTap: () {

                        Navigator.of(context).pushNamed(
                            RouteNamedScreens.login);
                      },
                      color: AppColorManager.mainColor,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "logIn".tr(),
                        fontSize: FontSizeManager.fs16,
                        color: AppColorManager.white,
                      ),
                    ),
                    MainAppButton(
                      width: AppWidthManager.w38,
                      height: AppHeightManager.h5,
                      borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      alignment: Alignment.center,
                      color: AppColorManager.white,
                      child: AppTextWidget(
                        text: "cancel".tr(),
                        color: AppColorManager.textAppColor,
                        fontSize: FontSizeManager.fs16,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
