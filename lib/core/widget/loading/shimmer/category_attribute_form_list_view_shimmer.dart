import 'package:flutter/cupertino.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class CategoryAttributeFormListViewShimmer extends StatelessWidget {
  const CategoryAttributeFormListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:  EdgeInsets.zero,

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerContainer(
                width: AppWidthManager.w20,
                height: AppHeightManager.h2,
              ),
              SizedBox(
                height: AppHeightManager.h08,
              ),
              ShimmerContainer(
                width: AppWidthManager.w100,
                height: AppHeightManager.h6,
              ),
              SizedBox(
                height: AppHeightManager.h1point8,
              ),
            ],
          );
      },
    );
  }
}
