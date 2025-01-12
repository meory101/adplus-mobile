import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/empty/empty_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/ads_by_category_cubit/advs_by_category_cubit.dart';

import '../../../../../core/helper/language_helper.dart';
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
import '../../screen/advertisement_details_screen.dart';

class AdsByCategoryListView extends StatelessWidget {
  final SubCategory category;
  const AdsByCategoryListView({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsByCategoryCubit, AdsByCategoryState>(
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

        List<AdData> advs = state.entity.data?.data ?? [];
        if (advs.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppHeightManager.h30,
              ),
              EmptyWidget(
                title: "noResults".tr(),
                subTitle: "couldNotFindAnyResult".tr(),
              )
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: AppHeightManager.h15),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
              child: DynamicHeightGridView(
                crossAxisSpacing: AppWidthManager.w3Point8,
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
                            category: category
                        ),
                      );
                    },
                    child: Container(
                      height: AppHeightManager.h34,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin:
                      EdgeInsets.only(bottom: AppHeightManager.h1point8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadiusManager.r15),
                        color: AppColorManager.lightGreyOpacity6,),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: AppHeightManager.h20,
                                width: AppWidthManager.w100,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  color: AppColorManager.grey,
                                ),
                                child: MainImageWidget(
                                  fit: BoxFit.fill,
                                  height: AppHeightManager.h20,
                                  imageUrl:(advertisement.photos??[]).isNotEmpty ? AppConstantManager
                                      .imageBaseUrl + (advertisement.photos?.first.photo ??
                                      "") :"ب",
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: AppHeightManager.h08),
                                    AppTextWidget(
                                      text:
                                      advertisement.name??"",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      fontSize: FontSizeManager.fs16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    AppTextWidget(
                                      text:
                                      "${advertisement.description??""}\n",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      fontSize: FontSizeManager.fs15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      children: [
                                        AppTextWidget(
                                          text: advertisement.startingPrice
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          fontSize: FontSizeManager.fs16,
                                          color: AppColorManager.subColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          width: AppWidthManager.w1Point2,
                                        ),
                                        AppTextWidget(
                                          text: LanguageHelper.checkIfLTR(
                                              context: context) ? advertisement
                                              .currency?.enName??"" :
                                          advertisement
                                              .currency?.arName??""
                                          ,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          fontSize: FontSizeManager.fs16,
                                          color: AppColorManager.subColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: AppHeightManager.h1point8),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible:
                            state.entity.data?.data?[index].star ==
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
