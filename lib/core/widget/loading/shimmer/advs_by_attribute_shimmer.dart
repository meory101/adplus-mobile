import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class AdvsByAttributeShimmer extends StatelessWidget {
  const AdvsByAttributeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return
          Center(
            child: DynamicHeightGridView(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              crossAxisSpacing: AppWidthManager.w2,
              crossAxisCount: 2,
                 itemCount : 10,
              builder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShimmerContainer(
                        width: AppWidthManager.w45,
                      height: AppHeightManager.h30,),
                    SizedBox(height: AppHeightManager.h1point8,),
                    ShimmerContainer(
                      width: AppWidthManager.w10,
                      height: AppHeightManager.h2,),
                    SizedBox(height: AppHeightManager.h08,),
                    ShimmerContainer(
                      width: AppWidthManager.w20,
                      height: AppHeightManager.h2,),
                  ],
                );
              },
            ),



    );
  }
}
