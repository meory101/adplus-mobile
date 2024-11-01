import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_attribute_grid_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_auther_data.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_bottom_sheet.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_images_slider.dart';

import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_adv_details_response_entity.dart';

class AdvertisementDetailsScreen extends StatefulWidget {
  final AdvertisementDetailsArgs args;

  const AdvertisementDetailsScreen({super.key, required this.args});

  @override
  State<AdvertisementDetailsScreen> createState() =>
      _AdvertisementDetailsScreenState();
}

class _AdvertisementDetailsScreenState
    extends State<AdvertisementDetailsScreen> {
  AdvDetails? advDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvDetailsBottomSheet(advDetails: advDetails,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AdvDetailsCubit, AdvDetailsState>(
            listener: (context, state) {
              if (state.status == CubitStatus.error) {
                NoteMessage.showErrorSnackBar(context: context, text: "");
              }
            },
            builder: (context, state) {
              if (state.status == CubitStatus.loading) {
                return const AppCircularProgressWidget();
              }
               advDetails = state.entity.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdvDetailsImagesSlider(advDetails: advDetails),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                            maxLines: 2,
                            fontWeight: FontWeight.w700,
                            fontSize: FontSizeManager.fs15,
                            text: advDetails?.name ?? ""),
                        SizedBox(height: AppHeightManager.h05,),
                        AppTextWidget(
                            maxLines: 2,
                            fontWeight: FontWeight.w600,
                            fontSize: FontSizeManager.fs15,
                            text: advDetails?.startingPrice.toString() ?? ""),
                        SizedBox(height: AppHeightManager.h1point5,),

                        AdvDetailsAutherData(advDetails: advDetails),
                        SizedBox(height: AppHeightManager.h1point5,),

                        AdvDetailsAttributeGridView(advDetails: advDetails),
                        SizedBox(height: AppHeightManager.h1point5,),

                        AppTextWidget(
                            fontWeight: FontWeight.w600,
                            fontSize: FontSizeManager.fs15,
                            text: advDetails?.description ?? ""),

                        SizedBox(height: AppHeightManager.h10,),




                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class AdvertisementDetailsArgs {
  AdData? advertisement;

  AdvertisementDetailsArgs({required this.advertisement});
}
