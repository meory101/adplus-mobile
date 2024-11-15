import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_reaction_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_attribute_grid_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_auther_data.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_bottom_sheet.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_images_slider.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/comments_section.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/widget/loading/shimmer/adv_details_screen_shimmer.dart';
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
    return BlocConsumer<AdvDetailsCubit, AdvDetailsState>(
        listener: (context, state) {
      if (state.status == CubitStatus.error) {
        NoteMessage.showErrorSnackBar(context: context, text: state.error);
      }
    }, builder: (context, state) {
      if (state.status == CubitStatus.loading) {
        return const AdvDetailsScreenShimmer();
      }
      advDetails = state.entity.data;
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColorManager.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  LanguageHelper.checkIfLTR(context: context)
                      ? AppIconManager.arrowLeft
                      : AppIconManager.arrowRight,
                  colorFilter: const ColorFilter.mode(
                      AppColorManager.mainColor, BlendMode.srcIn),
                ),
              ),
              SizedBox(
                width: AppWidthManager.w2,
              ),
              AppTextWidget(
                text: "",
                fontSize: FontSizeManager.fs16,
                color: AppColorManager.mainColor,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdvDetailsImagesSlider(advDetails: advDetails),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppWidthManager.w3Point8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                              maxLines: 2,
                              fontWeight: FontWeight.w600,
                              fontSize: FontSizeManager.fs16,
                              text: advDetails?.name ?? ""),
                          SizedBox(
                            height: AppHeightManager.h02,
                          ),
                          AppTextWidget(
                              maxLines: 2,
                              fontWeight: FontWeight.w700,
                              fontSize: FontSizeManager.fs16,
                              text: advDetails?.startingPrice.toString() ?? ""),
                          SizedBox(
                            height: AppHeightManager.h1point5,
                          ),
                          AdvDetailsAutherData(advDetails: advDetails),
                          SizedBox(
                            height: AppHeightManager.h1point5,
                          ),
                          AdvDetailsAttributeGridView(advDetails: advDetails),
                          SizedBox(
                            height: AppHeightManager.h3,
                          ),
                          AppTextWidget(
                              fontWeight: FontWeight.w600,
                              fontSize: FontSizeManager.fs16,
                              text: advDetails?.description ?? ""),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    AppColorManager.grey.withOpacity(0.3),
                                child: BlocConsumer<AddReactionCubit,
                                    AddReactionState>(
                                  listener: (context, state) {
                                    if(state.status == CubitStatus.error){
                                      NoteMessage.showErrorSnackBar(context: context, text: state.error);
                                    }
                                  },
                                  builder: (context, state) {
                                    if(state.status ==CubitStatus.loading){
                                      return const AppCircularProgressWidget();
                                    }
                                    return IconButton(
                                        onPressed: () {
                                          context
                                              .read<AddReactionCubit>()
                                              .addReaction(
                                                  context: context,
                                                  entity:
                                                      AddReactionRequestEntity(
                                                          itemId: advDetails?.itemId,
                                                          reactionType:
                                                              EnumManager
                                                                  .likeReaction));
                                        },
                                        icon: const Icon(
                                          Icons.thumb_up_alt_rounded,
                                          color: AppColorManager.white,
                                        ));
                                  },
                                ),
                              )
                            ],
                          ),
                          CommentsSection(
                            itemId: widget.args.advertisement?.itemId,
                          ),
                          SizedBox(
                            height: AppHeightManager.h12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: AppHeightManager.h02,
                child: Container(
                  color: AppColorManager.white,
                  height: AppHeightManager.h9,
                  child: AdvDetailsBottomSheet(
                    advDetails: advDetails,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AdvertisementDetailsArgs {
  AdData? advertisement;

  AdvertisementDetailsArgs({required this.advertisement});
}
