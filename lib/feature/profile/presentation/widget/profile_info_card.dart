import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/profile_info_card_shimmer.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_info_modification_screen.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/profile_following_info_card.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_profile_info_response_entity.dart';
import '../cubit/get_profile_cubit/get_profile_info_cubit.dart';

class ProfileInfoCard extends StatefulWidget {
  const ProfileInfoCard({super.key});

  @override
  State<ProfileInfoCard> createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  ProfileInfo? profileInfo;

  onEditTaped(){
    Navigator.of(context).pushNamed(RouteNamedScreens.profileModification,arguments: ProfileInfoModificationArgs(profileInfo: profileInfo)).then((value) {
      context.read<GetProfileInfoCubit>().getProfileInfo(context: context);
    },);
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GetProfileInfoCubit, GetProfileInfoState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
         return const ProfileInfoCardShimmer();
        }


         profileInfo = state.entity.data;
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        text: "username : ${profileInfo?.user?.username ??
                            '--'}",
                        fontSize: FontSizeManager.fs15,
                        color: AppColorManager.textGrey,
                      ),
                      AppTextWidget(
                        text: "email : ${profileInfo?.user?.username ?? '--'}",
                        fontSize: FontSizeManager.fs15,
                        color: AppColorManager.textGrey,
                      ),
                      AppTextWidget(
                        text: "phone : ${profileInfo?.user?.phone ?? '--'}",
                        fontSize: FontSizeManager.fs15,
                        color: AppColorManager.textGrey,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: onEditTaped,
                    child: Row(
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
                                vertical: AppHeightManager.h1,
                                horizontal: AppWidthManager.w4),
                            child: Row(
                              children: [
                                AppTextWidget(text: "Edit",
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeManager.fs15,
                                ),
                                SizedBox(width: AppWidthManager.w2,),
                                Icon(Icons.edit, size: AppWidthManager.w5,)
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: AppHeightManager.h1),
              Divider(
                color: AppColorManager.borderGrey,
                thickness: 1.0,
                indent: AppWidthManager.w3Point8,
                endIndent: AppWidthManager.w3Point8,
              ),
              SizedBox(height: AppHeightManager.h1),
              ProfileFollowingInfoCard(
                profileInfo: profileInfo,
              ), SizedBox(height: AppHeightManager.h2),

            ],
          ),
        );
      },
    );
  }
}
