import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resource/color_manager.dart';
import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';
import '../../image/main_image_widget.dart';

class ProfileInfoCardShimmer extends StatelessWidget {
  const ProfileInfoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorManager.textGrey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(AppRadiusManager.r15),
        ),
        margin: EdgeInsets.all(AppWidthManager.w3Point8),
        padding: EdgeInsets.all(AppWidthManager.w3Point8),
        child:
        Column(
            children: [
              SizedBox(height: AppHeightManager.h02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: AppWidthManager.w20,
                        height: AppWidthManager.w20,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const MainImageWidget(
                            imageUrl: ""),

                      ),
                      SizedBox(height: AppHeightManager.h1point8),
                      ShimmerContainer(width: AppWidthManager.w20,
                          height: AppHeightManager.h2),
                      SizedBox(height: AppHeightManager.h1point8),
                      ShimmerContainer(width: AppWidthManager.w40,
                          height: AppHeightManager.h2),
                      SizedBox(height: AppHeightManager.h05),

                      ShimmerContainer(width: AppWidthManager.w40,
                          height: AppHeightManager.h2),
                      SizedBox(height: AppHeightManager.h05),

                      ShimmerContainer(width: AppWidthManager.w40,
                          height: AppHeightManager.h2),
                    ],
                  ),
                  Row(
                    children: [
                      ShimmerContainer(
                        width: AppWidthManager.w30,
                        height: AppHeightManager.h4,
                      ),

                    ],
                  )
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
