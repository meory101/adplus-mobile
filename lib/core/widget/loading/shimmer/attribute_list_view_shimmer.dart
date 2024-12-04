import 'package:flutter/cupertino.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class AttributeListViewShimmer extends StatelessWidget {
  const AttributeListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppHeightManager.h7,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppWidthManager.w1),
                child: ShimmerContainer(
                    width: AppWidthManager.w45,
                    height: AppHeightManager.h2),
              );
            },
          ),
        ),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
        SizedBox(
          height: AppHeightManager.h5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppWidthManager.w1),
                child: ShimmerContainer(
                    width: AppWidthManager.w20,
                    height: AppHeightManager.h1point8),
              );
            },
          ),
        ),
      ],
    );
  }
}
