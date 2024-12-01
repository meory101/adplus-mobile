import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import '../../screen/advertisement_details_screen.dart';

class AdvsByAttributeListView extends StatelessWidget {
  const AdvsByAttributeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvsByAttributeCubit, AdvsByAttributeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status ==
            CubitStatus.loading) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppWidthManager.w3Point8),
            child: Column(
              children: [
                SizedBox(height: AppHeightManager.h15),
                const AdvsByAttributeShimmer(),
              ],
            ),
          );
        }

        List<AdData> advs = state.entity.data?.adData ?? [];

        if (advs.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppHeightManager.h30,
              ),
              AppTextWidget(
                text: "noResults".tr(),
                fontSize: FontSizeManager.fs18,
                fontWeight: FontWeight.w700,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppHeightManager.h05,
              ),
              AppTextWidget(
                text: "couldNotFindAnyResult".tr(),
                fontSize: FontSizeManager.fs16,
                fontWeight: FontWeight.w400,
                color: AppColorManager.grey,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          );
        }

        return Column(
          children: [
            SizedBox(height: AppHeightManager.h15),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
              child: DynamicHeightGridView(
                crossAxisSpacing: AppWidthManager.w2,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: advs.length,
                builder: (context, index) {
                  AdData? advertisement = advs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RouteNamedScreens.advertisementDetails,
                        arguments: AdvertisementDetailsArgs(
                          advertisement: advertisement,
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: AppHeightManager.h30,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                color: AppColorManager.lightGreyOpacity6,
                                borderRadius: BorderRadius.circular(
                                    AppRadiusManager.r15),
                              ),
                              child: MainImageWidget(
                                fit: BoxFit.cover,
                                height: AppHeightManager.h30,
                                imageUrl: AppConstantManager
                                    .imageBaseUrl +
                                    (advertisement.photos?.first.photo ??
                                        ""),
                                borderRadius: BorderRadius.circular(
                                    AppRadiusManager.r15),
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: AppHeightManager.h08),
                                AppTextWidget(
                                  text:
                                  advertisement.name.toString() ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontSize: FontSizeManager.fs15,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppTextWidget(
                                  text: advertisement.startingPrice
                                      .toString() ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontSize: FontSizeManager.fs14,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                    height: AppHeightManager.h1point8),
                              ],
                            )
                          ],
                        ),
                        Visibility(
                          visible:
                          state.entity.data?.adData?[index].star ==
                              EnumManager.star,
                          child: MainAppButton(
                            borderRadius: BorderRadius.circular(
                                AppRadiusManager.r10),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppWidthManager.w3Point8,
                              vertical: AppHeightManager.h04,
                            ),
                            color: AppColorManager.gold,
                            child: AppTextWidget(
                              text: 'featured'.tr(),
                              color: AppColorManager.white,
                              fontSize: FontSizeManager.fs16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Visibility(
                visible: state.isReachedMax == false &&
                    state.status != CubitStatus.error,
                child: const AppCircularProgressWidget())
          ],
        );
      },
    );
  }
}
