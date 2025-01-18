import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/check_ubdate_cubit/check_ubdate_cubit.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/main.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/helper/app_info_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/image_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showedNotificationNoteMessage = false;
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        print('adv id in the splash screeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeen');
        print(advId);
        if (advId != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNamedScreens.advertisementDetails,
            arguments: AdvertisementDetailsArgs(
                advertisement: AdData(itemId: num.parse(advId ?? ""))),
                (route) => false,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNamedScreens.mainBottomAppBar,
                (route) => false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckUbdateCubit, CheckUbdateState>(
      listener: (context, state) {
        if (state.status == CubitStatus.success) {
          final currentBuildNumber =
              int.tryParse(AppInfoHelper.getAppBuildNumber()) ?? 0;
          final serverVersion = int.tryParse(
              state.entity.data?.versionUpdate?.replaceAll('.', '') ??
                  '') ??
              0;

          if (currentBuildNumber > serverVersion) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteNamedScreens.mainBottomAppBar,
                  (route) => false,
            );
          } else {
            print('سوسو');
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: AppHeightManager.h100,
            width: AppWidthManager.w100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImageManager.splash),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextWidget(
                  text: "V ${AppInfoHelper.getAppVersion()}",
                  color: AppColorManager.mainColor,
                ),
                SizedBox(
                  height: AppHeightManager.h1point8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w5),
                  child: SizedBox(
                    height: AppHeightManager.h2,
                    width: AppHeightManager.h2,
                    child: const AppCircularProgressWidget(),
                  ),
                ),
                SizedBox(
                  height: AppHeightManager.h2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}