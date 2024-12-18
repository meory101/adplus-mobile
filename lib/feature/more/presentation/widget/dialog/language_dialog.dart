import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/key_manger.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/storage/shared/shared_pref.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

/// Eng. Nour Othman(meory)

void showLanguageDialog({required BuildContext context}) {
  String selectedLanguage = AppSharedPreferences.getLanguage();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppRadiusManager.r10))),
        contentPadding: EdgeInsets.only(
            left: AppWidthManager.w4,
            right: AppWidthManager.w4,
            top: AppHeightManager.h05,
            bottom: AppHeightManager.h3),
        insetPadding: EdgeInsets.symmetric(
          horizontal: AppWidthManager.w4,
        ),
        elevation: 0,
        backgroundColor: AppColorManager.white,
        title: AppTextWidget(
          text: "appLanguage".tr(),
          fontWeight: FontWeight.w600,
          fontSize: FontSizeManager.fs18,
          overflow: TextOverflow.visible,
          color: AppColorManager.textAppColor,
          textAlign: TextAlign.center,
        ),
        content: StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextWidget(
                color: AppColorManager.textAppColor,
                text: "changeAppLanguage".tr(),
                fontWeight: FontWeight.w600,
                fontSize: FontSizeManager.fs16,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppHeightManager.h1point5,
              ),
              RadioListTile(
                activeColor: AppColorManager.mainColor,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                contentPadding: EdgeInsets.zero,
                title: AppTextWidget(
                  text: "english".tr(),
                  fontSize: FontSizeManager.fs16,
                  fontWeight: FontWeight.w600,
                ),
                value: AppKeyManager.englishLocalizationCode,
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = AppKeyManager.englishLocalizationCode;
                  });
                },
              ),
              RadioListTile(
                activeColor: AppColorManager.mainColor,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                contentPadding: EdgeInsets.zero,
                title: AppTextWidget(
                  text: "arabic".tr(),
                  fontSize: FontSizeManager.fs16,
                  fontWeight: FontWeight.w600,
                ),
                value: AppKeyManager.arabicLocalizationCode,
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = AppKeyManager.arabicLocalizationCode;
                  });
                },
              ),
            ],
          );
        }),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainAppButton(
                width: MediaQuery.of(context).size.width / 2.6,
                padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w10),
                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                height: AppHeightManager.h5,
                onTap: () {
                  Navigator.of(context).pop();
                },
                color: AppColorManager.white,
                alignment: Alignment.center,
                child: AppTextWidget(
                  text: "cancel".tr(),
                  fontSize: FontSizeManager.fs16,
                ),
              ),
              MainAppButton(
                width: MediaQuery.of(context).size.width / 2.6,
                height: AppHeightManager.h5,
                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                onTap: () async {
                  String languageCode = EasyLocalization.of(context)
                          ?.currentLocale
                          ?.languageCode ??
                      "";

                  if (languageCode == selectedLanguage) {
                    Navigator.pop(context);
                    return;
                  }
                  EasyLocalization.of(context)
                      ?.setLocale(Locale(selectedLanguage))
                      .then((value) {
                    AppSharedPreferences.cashLanguage(
                        language: selectedLanguage);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNamedScreens.splash,
                      (route) => false,
                    );
                  });
                },
                alignment: Alignment.center,
                color: AppColorManager.mainColor,
                child: AppTextWidget(
                  text: "change".tr(),
                  color: AppColorManager.white,
                  fontSize: FontSizeManager.fs16,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
