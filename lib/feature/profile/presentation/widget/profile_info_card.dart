import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/profile_following_info_card.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_profile_info_response_entity.dart';
import '../cubit/get_profile_cubit/get_profile_info_cubit.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileInfoCubit, GetProfileInfoState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(context: context, text: "");
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return const AppCircularProgressWidget();
        }
        ProfileInfo? profileInfo = state.entity.data;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorManager.textGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(AppRadiusManager.r15),
          ),
          margin: EdgeInsets.all(AppWidthManager.w3Point8),
          padding: EdgeInsets.all(AppWidthManager.w3Point8),
          child: Column(
            children: [
              SizedBox(height: AppHeightManager.h02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: AppWidthManager.w20,
                        height: AppWidthManager.w20,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: MainImageWidget(
                          imageUrl: (AppConstantManager.imageBaseUrl +
                              (profileInfo?.user?.photo ?? "")),
                        ),
                      ),
                      SizedBox(height: AppHeightManager.h1point8),
                      AppTextWidget(
                        text: profileInfo?.user?.name ?? "",
                        fontSize: FontSizeManager.fs16,
                        color: AppColorManager.textAppColor,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: AppHeightManager.h02),
                      AppTextWidget(
                        text: profileInfo?.user?.username ?? "",
                        fontSize: FontSizeManager.fs15,
                        color: AppColorManager.textGrey,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColorManager.textGrey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppHeightManager.h05,
                              horizontal: AppWidthManager.w3Point8),
                          child: const Row(
                            children: [
                              AppTextWidget(text: "Edit"),
                              Icon(Icons.edit)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: AppWidthManager.w3),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColorManager.textGrey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppHeightManager.h05,
                              horizontal: AppWidthManager.w3Point8),
                          child: const Row(
                            children: [
                              AppTextWidget(text: "Share"),
                              Icon(Icons.share)
                            ],
                          ),),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: AppHeightManager.h4),
              ProfileFollowingInfoCard(
                profileInfo: profileInfo,
              ),
            ],
          ),
        );
      },
    );
  }
}
