import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/home_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/more_screen.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/storage/shared/shared_pref.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../authentication/presentation/screen/login_screen.dart';
import '../../../bidding/bidding_screen.dart';
import '../../../profile/presentation/screen/profile_screen.dart';

int selectedIndex = 0;

class MainBottomAppBar extends StatefulWidget {
  const MainBottomAppBar({super.key});

  @override
  State<MainBottomAppBar> createState() => _MainAppBottomAppBarState();
}

class _MainAppBottomAppBarState extends State<MainBottomAppBar> {
  late final List<Widget> bottomBarScreens;

  @override
  void initState() {
    if (AppSharedPreferences.getToken().isNotEmpty) {
      context.read<GetProfileInfoCubit>().getProfileInfo(context: context);
    }
    bottomBarScreens = [
      const HomeScreen(),
      const BiddingScreen(),
      AppSharedPreferences.getToken().isEmpty
          ? const LoginScreen()
          : const ProfileScreen(),
      MoreScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop == false) {
          setState(() {
            selectedIndex = 0;
          });
        } else {
          FlutterExitApp.exitApp(iosForceExit: true);
        }
      },
      child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: AppHeightManager.h9,
            elevation: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: AppWidthManager.w3Point8,
                right: AppWidthManager.w3Point8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    overlayColor: const WidgetStatePropertyAll(
                        AppColorManager.transparent),
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIconManager.home,
                            colorFilter: ColorFilter.mode(
                                selectedIndex == 0
                                    ? AppColorManager.mainColor
                                    : AppColorManager.grey,
                                BlendMode.srcIn)),
                        AppTextWidget(
                          text: "home".tr(),
                          color: selectedIndex == 0
                              ? AppColorManager.mainColor
                              : AppColorManager.grey,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    overlayColor: const WidgetStatePropertyAll(
                        AppColorManager.transparent),
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIconManager.bidding,
                            colorFilter: ColorFilter.mode(
                                selectedIndex == 1
                                    ? AppColorManager.mainColor
                                    : AppColorManager.grey,
                                BlendMode.srcIn)),
                        AppTextWidget(
                          text: "bidding".tr(),
                          color: selectedIndex == 1
                              ? AppColorManager.mainColor
                              : AppColorManager.grey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: AppWidthManager.w12,
                    width: AppWidthManager.w12,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorManager.mainColor),
                    child: InkWell(
                      overlayColor: const WidgetStatePropertyAll(
                          AppColorManager.transparent),
                      onTap: () {
                        if (AppSharedPreferences.getToken().isEmpty) {
                          Navigator.of(context)
                              .pushNamed(RouteNamedScreens.login);
                          return;
                        }
                        Navigator.of(context)
                            .pushNamed(RouteNamedScreens.advertisementLanguage);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(AppWidthManager.w4),
                        child: SvgPicture.asset(AppIconManager.add,
                            colorFilter: const ColorFilter.mode(
                                AppColorManager.white, BlendMode.srcIn)),
                      ),
                    ),
                  ),
                  InkWell(
                    overlayColor: const WidgetStatePropertyAll(
                        AppColorManager.transparent),
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIconManager.person,
                            colorFilter: ColorFilter.mode(
                                selectedIndex == 2
                                    ? AppColorManager.mainColor
                                    : AppColorManager.grey,
                                BlendMode.srcIn)),
                        AppTextWidget(
                          text: "profile".tr(),
                          color: selectedIndex == 2
                              ? AppColorManager.mainColor
                              : AppColorManager.grey,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    overlayColor: const WidgetStatePropertyAll(
                        AppColorManager.transparent),
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIconManager.more,
                            colorFilter: ColorFilter.mode(
                                selectedIndex == 3
                                    ? AppColorManager.mainColor
                                    : AppColorManager.grey,
                                BlendMode.srcIn)),
                        AppTextWidget(
                          text: "more".tr(),
                          color: selectedIndex == 3
                              ? AppColorManager.mainColor
                              : AppColorManager.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: bottomBarScreens[selectedIndex],
          )),
    );
  }
}
