import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/container/shimmer_container.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../advertisement/domain/entity/response/get_cities_response_entity.dart';
import '../../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import '../../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_state.dart';

class AdvDetailsAttributeGridView extends StatelessWidget {
  final AdvDetails? advDetails;

  const AdvDetailsAttributeGridView({super.key, required this.advDetails});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, index) {
          if (index == (advDetails?.attributes?.length ?? 0)) {
            return BlocConsumer<GetCitiesCubit, GetCitiesState>(
              listener: (context, state) {
                if (state.status == CubitStatus.error) {}
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return ShimmerContainer(
                      radius: AppRadiusManager.r3,
                      width: AppWidthManager.w20, height: AppHeightManager.h9);
                }
                List<City> cities = state.entity.data ?? [];
                String? cityName;
                cities.forEach((city) {
                  if (city.cityId == advDetails?.cityId) {
                    cityName = LanguageHelper.checkIfLTR(context: context)
                        ? city.enName
                        : city.arName;
                  }
                });
                return DecoratedContainer(
                  padding: EdgeInsets.all(AppWidthManager.w3Point8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextWidget(
                        maxLines: 2,
                        fontWeight: FontWeight.w500,
                        fontSize: FontSizeManager.fs14,
                        text: "city".tr()+'\n',
                      ),
                      AppTextWidget(
                          maxLines: 2,
                          fontWeight: FontWeight.w700,
                          fontSize: FontSizeManager.fs14,
                          text: cityName??""+'\n'),
                    ],
                  ),
                );
              },
            );
          }
          return DecoratedContainer(
            padding: EdgeInsets.all(AppWidthManager.w3Point8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextWidget(
                    maxLines: 2,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSizeManager.fs14,
                    text:( LanguageHelper.checkIfLTR(context: context)
                        ? (advDetails?.attributes?[index].attribute
                        ?.attributeNameEn ??
                        "")
                        : (advDetails
                        ?.attributes?[index].attribute?.attributeName ??
                        ""))+'\n'),
                AppTextWidget(
                    maxLines: 2,
                    fontWeight: FontWeight.w700,
                    fontSize: FontSizeManager.fs14,
                    text: advDetails?.attributes?[index].value ?? ""),
              ],
            ),
          );
        },
        itemCount: (advDetails?.attributes?.length ?? 0) + 1,
        crossAxisCount: 3);
  }
}
