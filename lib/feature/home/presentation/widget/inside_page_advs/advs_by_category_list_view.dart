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
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../../more/presentation/widget/my_advs/adv_card.dart';
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
              child: ListView.builder(

                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: advs.length,
                itemBuilder: (context, index) {
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
                    child:  DecoratedContainer(
                      height: AppHeightManager.h17,
                      color: AppColorManager.white,
                      borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                      margin: EdgeInsets.only(
                          left: AppWidthManager.w3Point8,
                          right: AppWidthManager.w3Point8,
                          bottom: AppHeightManager.h1point8),
                      child: Row(
                        children: [
                          Container(
                            width: AppWidthManager.w35,
                            height: AppWidthManager.w35,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(AppRadiusManager.r10)),
                            child: MainImageWidget(
                              imageUrl: AppConstantManager.imageBaseUrl +((advs[index].photos??[]).isNotEmpty?
                              (advs[index].photos?.first.photo ?? "") : ""),
                            ),
                          ),
                          SizedBox(
                            width: AppWidthManager.w3Point8,
                          ),
                          Expanded(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible:
                                  state.entity.data?.data?[index].star ==
                                      EnumManager.star,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MainAppButton(
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
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: AppHeightManager.h02,
                                ),
                                AppTextWidget(
                                    text: advs[index].name ?? "",
                                    fontSize: FontSizeManager.fs16,
                                    color: AppColorManager.textAppColor,
                                    fontWeight: FontWeight.w700),
                                AppTextWidget(
                                    text: advs[index].description ?? "",
                                    fontSize: FontSizeManager.fs15,
                                    color: AppColorManager.textGrey,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: AppHeightManager.h2,
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
                              ],
                            ),
                          )
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
