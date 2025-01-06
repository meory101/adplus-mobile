import 'package:flutter/cupertino.dart';

import '../../../resource/color_manager.dart';
import '../../../resource/size_manager.dart';
import '../../button/main_app_button.dart';
import '../../container/decorated_container.dart';
import '../../container/shimmer_container.dart';
import '../../image/main_image_widget.dart';

class SearchUserListViewShimmer extends StatelessWidget {
  const SearchUserListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return DecoratedContainer(
              margin: EdgeInsets.only(bottom: AppHeightManager.h2point5),
              padding: EdgeInsets.symmetric(
                  vertical: AppHeightManager.h2,
                  horizontal: AppWidthManager.w3Point8),
              child: Column(
                children: [
                  SizedBox(
                    height: AppHeightManager.h1point8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: AppWidthManager.w15,
                            width: AppWidthManager.w15,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle),
                            child: MainImageWidget(
                              imageUrl: "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: AppWidthManager.w2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerContainer(
                                  width: AppWidthManager.w20,
                                  height: AppHeightManager.h1point5),
                              SizedBox(height: AppHeightManager.h1,),
                              ShimmerContainer(
                                  width: AppWidthManager.w40,
                                  height: AppHeightManager.h2)
                            ],
                          )
                        ],
                      ),
                      MainAppButton(
                        height: AppHeightManager.h4,
                        width: AppHeightManager.h6,
                        onTap: () {
                        },
                        borderRadius:
                        BorderRadius.circular(AppRadiusManager.r10),
                        color: AppColorManager.shimmerBaseColor,)
                    ],
                  ),
                ],
              ));
        });
  }
}
