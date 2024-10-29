import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../domain/entity/response/advs_by_attribute_response_entity.dart';
import '../cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';

class InsidePageCategoryAdvsScreen extends StatefulWidget {
  final InsidePageCategoryAdvArgs args;

  const InsidePageCategoryAdvsScreen({super.key, required this.args});

  @override
  State<InsidePageCategoryAdvsScreen> createState() =>
      _InsidePageCategoryAdvsScreenState();
}

class _InsidePageCategoryAdvsScreenState
    extends State<InsidePageCategoryAdvsScreen> {
  @override
  void initState() {
    getAdvs(widget.args.entity);
    super.initState();
  }

  getAdvs(AdvsByAttributeRequestEntity entity) {
    context
        .read<AdvsByAttributeCubit>()
        .getAdvsByAttribute(context: context, entity: entity);
  }
  AdData? advertisement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: ''),
      body: SingleChildScrollView(
        child: BlocConsumer<AdvsByAttributeCubit, AdvsByAttributeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == CubitStatus.loading) {
              return const AppCircularProgressWidget();
            }
            List<AdData> advs = state.entity.data?.adData ?? [];
            return InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RouteNamedScreens.advertisementDetails,arguments: AdvertisementDetailsArgs(advertisement: advertisement));
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: AppWidthManager.w2,
                          crossAxisCount: 2,
                          childAspectRatio: 0.6),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: advs.length,
                      itemBuilder: (context, index) {
                         advertisement = advs[index];
                        return Column(
                          children: [
                            Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  color: AppColorManager.lightGreyOpacity6,
                                  borderRadius: BorderRadius.circular(
                                      AppRadiusManager.r15),
                                ),
                                child: MainImageWidget(
                                  imageUrl: AppConstantManager.imageBaseUrl +
                                      (advertisement?.photos?.first.photo ?? ""),
                                  borderRadius: BorderRadius.circular(
                                      AppRadiusManager.r15),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: AppHeightManager.h08,
                                ),
                                AppTextWidget(
                                  text: advertisement?.itemId.toString() ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontSize: FontSizeManager.fs15,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppTextWidget(
                                  text:
                                      advertisement?.startingPrice.toString() ??
                                          "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontSize: FontSizeManager.fs14,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: AppHeightManager.h1point8,
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class InsidePageCategoryAdvArgs {
  AdvsByAttributeRequestEntity entity;

  InsidePageCategoryAdvArgs({required this.entity});
}
