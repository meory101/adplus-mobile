import 'package:flutter/cupertino.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class CommentSectionShimmer extends StatelessWidget {
  const CommentSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
           return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ShimmerContainer(
                  width: AppWidthManager.w10,
                  height: AppWidthManager.w10,
                  boxShape: BoxShape.circle,
                ),
                SizedBox(
                  width: AppHeightManager.h1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                        width: AppWidthManager.w30,
                        height: AppHeightManager.h1point8),
                    SizedBox(
                        height: AppHeightManager.h02
                    ),
                    ShimmerContainer(
                        width: AppWidthManager.w60,
                        height: AppHeightManager.h2),
                  ],
                ),
              ]),
              SizedBox(
                height: AppHeightManager.h1,
              ),
            ],
          );
        });

  }
}
