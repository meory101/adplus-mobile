import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';

import '../../../resource/color_manager.dart';
import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';
import '../../image/main_image_widget.dart';

class ProfileInfoCardShimmer extends StatelessWidget {
  const ProfileInfoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
        borderRadius: BorderRadius.circular(AppRadiusManager.r15),
        margin: EdgeInsets.all(AppWidthManager.w3Point8),
        padding: EdgeInsets.all(AppWidthManager.w3Point8),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppWidthManager.w28,
                height: AppWidthManager.w28,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const MainImageWidget(
                    imageUrl: ""),

              ),
              SizedBox(height: AppHeightManager.h02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppHeightManager.h1point8),
                  ShimmerContainer(width: AppWidthManager.w30,
                      height: AppHeightManager.h2),
                  SizedBox(height: AppHeightManager.h1point8),
                  ShimmerContainer(width: AppWidthManager.w70,
                      height: AppHeightManager.h2),
                  SizedBox(height: AppHeightManager.h05),

                  ShimmerContainer(width: AppWidthManager.w70,
                      height: AppHeightManager.h2),
                  SizedBox(height: AppHeightManager.h05),
                ],
              ),
              SizedBox(height: AppHeightManager.h05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerContainer(
                    width: AppWidthManager.w30,
                    height: AppHeightManager.h4,

                  ),
                  SizedBox(width: AppWidthManager.w2,),
                  ShimmerContainer(
                    width: AppWidthManager.w30,
                    height: AppHeightManager.h4,
                  ),
                ],
              ),
              SizedBox(height: AppHeightManager.h1),
              Divider(
                color: AppColorManager.borderGrey,
                thickness: 1.0,
                indent: AppWidthManager.w3Point8,
                endIndent: AppWidthManager.w3Point8,
              ),
              SizedBox(height: AppHeightManager.h1),
              ShimmerContainer(
                width: AppWidthManager.w100,
                height: AppHeightManager.h5,
              ),

              SizedBox(height: AppHeightManager.h2),
            ]) );
  }
}
