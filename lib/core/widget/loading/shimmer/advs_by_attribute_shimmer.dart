import 'package:flutter/cupertino.dart';

import '../../../resource/size_manager.dart';
import '../../container/shimmer_container.dart';

class AdvsByAttributeShimmer extends StatelessWidget {
  const AdvsByAttributeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return
          Center(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppWidthManager.w2,
                  crossAxisSpacing: AppWidthManager.w2
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ShimmerContainer(
                    width: AppWidthManager.w40,
                    height: AppHeightManager.h30);
              },
            ),



    );
  }
}
