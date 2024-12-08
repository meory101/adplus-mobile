import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/feature/comment/presentation/cubit/comment_cubit/comment_cubit.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorites_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/presentation/cubit/likes_cubit/likes_cubit.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class ActivityCard extends StatefulWidget {
  final Function(int) onActivityTapChanged;
  const ActivityCard({super.key,required this.onActivityTapChanged});

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(AppRadiusManager.r10),
      ),
      margin: EdgeInsets.symmetric(horizontal:  AppWidthManager.w3Point8),
      padding: EdgeInsets.all(AppWidthManager.w3Point8),
      child: Column(children: [
        SizedBox(height: AppHeightManager.h1),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex =0;
                    widget.onActivityTapChanged(selectedIndex);

                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: AppHeightManager.h3point4,
                      width: AppHeightManager.h3point4,
                      child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              selectedIndex == 0 ?AppColorManager.mainColor : AppColorManager.textGrey,
                              BlendMode.srcIn),
                          AppIconManager.activity),
                    ),
                    AppTextWidget(
                      text: "active".tr(),
                      fontSize: FontSizeManager.fs16,
                      color: selectedIndex == 0 ? AppColorManager.mainColor : AppColorManager.textGrey,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex =1;
                    widget.onActivityTapChanged(selectedIndex);

                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: AppHeightManager.h3point4,
                      width: AppHeightManager.h3point4,
                      child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              selectedIndex == 1 ? AppColorManager.mainColor : AppColorManager.textGrey,
                              BlendMode.srcIn),
                          AppIconManager.favorites),
                    ),
                    AppTextWidget(
                      text: "favorites".tr(),
                      fontSize: FontSizeManager.fs16,
                      color: selectedIndex == 1 ? AppColorManager.mainColor : AppColorManager.textGrey,
                    ),
                  ],
                ),
              ),


              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex =2;
                    widget.onActivityTapChanged(selectedIndex);

                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: AppHeightManager.h3point4,
                      width: AppHeightManager.h3point4,
                      child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              selectedIndex == 2 ? AppColorManager.mainColor : AppColorManager.textGrey,
                              BlendMode.srcIn),
                          AppIconManager.comments),
                    ),
                    AppTextWidget(
                      text: "comments".tr(),
                      fontSize: FontSizeManager.fs16,
                      color: selectedIndex == 2 ?AppColorManager.mainColor : AppColorManager.textGrey,
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex =3;
                    widget.onActivityTapChanged(selectedIndex);

                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: AppHeightManager.h3point4,
                      width: AppHeightManager.h3point4,
                      child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              selectedIndex == 3 ? AppColorManager.mainColor : AppColorManager.textGrey,
                              BlendMode.srcIn),
                          AppIconManager.likes),
                    ),
                    AppTextWidget(
                      text: "likes".tr(),
                      fontSize: FontSizeManager.fs16,
                      color: selectedIndex == 3 ?AppColorManager.mainColor : AppColorManager.textGrey,
                    ),
                  ],
                ),
              ),

            ]),
        SizedBox(height: AppHeightManager.h1),
      ]),
    );
  }
}
