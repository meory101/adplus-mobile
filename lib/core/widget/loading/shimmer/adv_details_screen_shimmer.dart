import 'package:flutter/material.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class AdvDetailsScreenShimmer extends StatelessWidget {
  const AdvDetailsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppWidthManager.w3Point8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      width: AppWidthManager.w92,
                      height: AppHeightManager.h35,
                    ),
                    SizedBox(
                      height: AppHeightManager.h1point8,
                    ),
                    ShimmerContainer(
                      width: AppWidthManager.w20,
                      height: AppHeightManager.h3,
                    ),
                    SizedBox(
                      height: AppHeightManager.h1,
                    ),
                    ShimmerContainer(
                      width: AppWidthManager.w80,
                      height: AppHeightManager.h3,
                    ),
                    SizedBox(
                      height: AppHeightManager.h04,
                    ),
                    ShimmerContainer(
                      width: AppWidthManager.w80,
                      height: AppHeightManager.h3,
                    ),
                    SizedBox(
                      height: AppHeightManager.h1point8,
                    ),
                    Row(
                      children: [
                        ShimmerContainer(
                          height: AppWidthManager.w15,
                          width: AppWidthManager.w15,
                          boxShape: BoxShape.circle,
                        ),
                        SizedBox(
                          width: AppWidthManager.w2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerContainer(
                              width: AppWidthManager.w25,
                              height: AppHeightManager.h2,
                            ),
                            SizedBox(
                              height: AppHeightManager.h02,
                            ),
                            ShimmerContainer(
                              width: AppWidthManager.w40,
                              height: AppHeightManager.h2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppHeightManager.h1point8,),
                    GridView.builder(
                      itemCount: 9,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: AppWidthManager.w2,
                          mainAxisSpacing: AppWidthManager.w2,
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return ShimmerContainer(
                          width: AppWidthManager.w20,
                          height: AppHeightManager.h10,
                        );
                      },
                    )
                  ]),
            ),
          ),
        ),
      );
  }
}
