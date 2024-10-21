import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/size_manager.dart';
import '../button/main_app_button.dart';
import '../empty/empty_widget.dart';
import '../text/app_text_widget.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EmptyWidget(
          title: "oopsNoConnection".tr(),
          subTitle: "itSeemsYouAreCurrentlyOffline".tr(),
          actions: MainAppButton(
            alignment: Alignment.center,
            width: AppWidthManager.w60,
            height: AppHeightManager.h6,
            color: AppColorManager.teal,
            borderRadius: BorderRadius.circular(
              AppRadiusManager.r15,
            ),
            child: AppTextWidget(
              text: "refresh".tr(),
              color: AppColorManager.white,
              fontSize: FontSizeManager.fs16,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // if (CurrentRoute.currentRouteName != null) {
              //   Navigator.of(context).pushReplacementNamed(CurrentRoute.currentRouteName!);
              // }
            },
          ),
        ),
      ),
    );
  }
}

// class NoInternetArgument {
//   RouteNamedScreens? refreshRoute;
//
//   NoInternetArgument({this.refreshRoute});
// }
