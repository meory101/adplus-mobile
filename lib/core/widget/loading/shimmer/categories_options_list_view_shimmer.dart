import 'package:flutter/cupertino.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class CategoriesOptionsListViewShimmer extends StatelessWidget {
  const CategoriesOptionsListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return     Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShimmerContainer(
              boxShape: BoxShape.circle,
              width: AppWidthManager.w10,
              height: AppHeightManager.h3,
            ),
            ShimmerContainer(
              width: AppWidthManager.w70,
              height: AppHeightManager.h4,
            ),
          ],
        ),
        SizedBox(
          height: AppHeightManager.h2,
        )
      ],
    );
  }
}
