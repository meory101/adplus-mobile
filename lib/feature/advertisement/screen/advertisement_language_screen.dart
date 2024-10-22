import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/resource/theme_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/advertisement/widget/advertisement_next_button.dart';
import 'package:mzad_damascus/feature/advertisement/widget/language_options_list_view.dart';
import 'package:mzad_damascus/router/router.dart';

import '../../../core/resource/font_manager.dart';
import '../widget/advertisement_app_bar.dart';

class AdvertisementLanguageScreen extends StatefulWidget {
  const AdvertisementLanguageScreen({super.key});

  @override
  State<AdvertisementLanguageScreen> createState() =>
      _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RouteNamedScreens.advertisementCategory);
        },
      ),
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(),
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
              const LanguageOptionsListView(),
              SizedBox(
                height: AppHeightManager.h6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
