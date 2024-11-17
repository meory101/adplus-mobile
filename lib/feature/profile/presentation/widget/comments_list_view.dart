import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../../comment/presentation/cubit/comment_cubit/comment_cubit.dart';
import '../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../home/presentation/screen/advertisement_details_screen.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<CommentCubit, CommentState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(
              context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return const AppCircularProgressWidget();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (state.entity.data?.comments??[]).length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(RouteNamedScreens.advertisementDetails
                    ,
                    arguments: AdvertisementDetailsArgs(advertisement: AdData(
                        itemId: state.entity.data?.comments?[index].item?.itemId
                    ))
                );
              },
              child: Container(
                height: AppHeightManager.h17,
                decoration: BoxDecoration(
                    color: AppColorManager.white,
                    borderRadius: BorderRadius.circular(
                        AppRadiusManager.r10)),
                margin: EdgeInsets.only(
                    left: AppWidthManager.w3Point8,
                    right: AppWidthManager.w3Point8,
                    bottom: AppHeightManager.h1point8
                ),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppRadiusManager.r10)),
                      width: AppWidthManager.w35,
                      child: MainImageWidget(
                        imageUrl: AppConstantManager.imageBaseUrl +
                            (state.entity.data?.comments?[index].item?.photos?.first.photo ??
                                ""),
                      ),
                    ),
                    SizedBox(width: AppWidthManager.w3Point8,),
                    Expanded(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: AppHeightManager.h02,
                          ),
                          AppTextWidget(
                              text: state.entity.data?.comments?[index].item?.name ??"",
                              fontSize: FontSizeManager.fs16,
                              color: AppColorManager.textAppColor,
                              fontWeight: FontWeight.w700),
                          AppTextWidget(
                              text: state.entity.data?.comments?[index].item?.description ??"",
                              fontSize: FontSizeManager.fs15,
                              color: AppColorManager.textGrey,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500),
                          AppTextWidget(
                              text: state.entity.data?.comments?[index].comment ??"",
                              fontSize: FontSizeManager.fs16,
                              color: AppColorManager.textAppColor,
                              fontWeight: FontWeight.w700),
                          SizedBox(
                            height: AppHeightManager.h2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
