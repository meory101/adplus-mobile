import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class CategoryInsidePageShimmer extends StatefulWidget {
  const CategoryInsidePageShimmer({super.key});

  @override
  State<CategoryInsidePageShimmer> createState() => _CategoryInsidePageShimmerState();
}

class _CategoryInsidePageShimmerState extends State<CategoryInsidePageShimmer> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(AppWidthManager.w3Point8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
                width: AppWidthManager.w92,
                height: AppHeightManager.h20,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(AppRadiusManager.r10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MainImageWidget(
                  imageUrl: "",
                )),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            ShimmerContainer(
                width: AppWidthManager.w20, height: AppHeightManager.h2),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            Row(
              children: [
                ShimmerContainer(
                    width: AppWidthManager.w40,
                    height: AppHeightManager.h7),
                SizedBox(
                  width: AppHeightManager.h1point8,
                ),
                ShimmerContainer(
                    width: AppWidthManager.w40,
                    height: AppHeightManager.h7),
              ],
            ),
            SizedBox(
              height: AppHeightManager.h2point5,
            ),
            ShimmerContainer(
                width: AppWidthManager.w20, height: AppHeightManager.h2),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ShimmerContainer(
                            width: AppWidthManager.w25,
                            height: AppHeightManager.h10),
                        SizedBox(
                          width: AppHeightManager.h1point8,
                        ),
                        ShimmerContainer(
                            width: AppWidthManager.w25,
                            height: AppHeightManager.h10),
                        SizedBox(
                          width: AppHeightManager.h1point8,
                        ),
                        ShimmerContainer(
                            width: AppWidthManager.w25,
                            height: AppHeightManager.h10),
                      ],
                    ),
                    SizedBox(
                      height: AppHeightManager.h1point8,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
