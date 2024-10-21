
import 'package:flutter/material.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../widget/home_banners.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/newest_items_grid_view.dart';


/// Eng.Nour Othman(meory)*

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppHeightManager.h3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidthManager.w3Point8,
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          text: "Hi Nour!",

                              fontSize: FontSizeManager.fs17,
                              color: AppColorManager.textAppColor,
                              fontWeight: FontWeight.w700
                        ),
                        SizedBox(
                          width: AppWidthManager.w2,
                        ),
                        AppTextWidget(
                          text: "Welcome to Mzad Damascus.",
                              fontSize: FontSizeManager.fs15,
                              color: AppColorManager.textAppColor,
                              fontWeight: FontWeight.w600),

                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIconManager.notification,
                          colorFilter: const ColorFilter.mode(
                              AppColorManager.mainColor,
                              BlendMode.srcIn),
                        ),
                        SizedBox(width: AppWidthManager.w3Point8,),
                        SvgPicture.asset(
                          AppIconManager.search,
                          colorFilter: const ColorFilter.mode(
                              AppColorManager.mainColor,
                              BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppHeightManager.h2,
              ),
              const HomeBanners(),
              SizedBox(
                height: AppHeightManager.h3,
              ),
              Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8,
                    ),
                    child: const NewestItemsGridView(),


              )
            ],
          ),
        ),
      ),
    );
  }
}
