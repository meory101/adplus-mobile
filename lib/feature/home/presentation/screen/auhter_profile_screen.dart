import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/profile_by_username_cubit/profile_by_username_cubit.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/loading/shimmer/profile_info_card_shimmer.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../profile/domain/entity/response/profile_by_username_response_entity.dart';
import '../../../profile/presentation/widget/profile_following_info_card.dart';

class AuthorProfileScreen extends StatefulWidget {
  final AuthorProfileArgs arg;

  const AuthorProfileScreen({super.key, required this.arg});

  @override
  State<AuthorProfileScreen> createState() => _AuthorProfileScreenState();
}

class _AuthorProfileScreenState extends State<AuthorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<ProfileByUsernameCubit, ProfileByUsernameState>(
              listener: (context, state) {
                if (state.status == CubitStatus.error) {
                  NoteMessage.showErrorSnackBar(
                      context: context, text: state.error);
                }
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return const ProfileInfoCardShimmer();
                }
      
                ProfileByUsernameData? profileInfo = state.entity.data;
                return DecoratedContainer(
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                   margin: EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
                  padding: EdgeInsets.symmetric(horizontal:  AppWidthManager.w3Point8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: AppWidthManager.w20,
                                    height: AppWidthManager.w20,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: MainImageWidget(
                                      fit: BoxFit.cover,
                                      imageUrl: (AppConstantManager
                                              .imageBaseUrl +
                                          (profileInfo?.user?.photo ?? "")),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppWidthManager.w3Point8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          AppTextWidget(
                                            text: 'followers',
                                            fontSize: FontSizeManager.fs16,
                                            color:
                                                AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          AppTextWidget(
                                            text: (profileInfo?.user
                                                        ?.followersCount ??
                                                    "0")
                                                .toString(),
                                            fontSize: FontSizeManager.fs16,
                                            color:
                                                AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppWidthManager.w3Point8,
                                      ),
                                      Column(
                                        children: [
                                          AppTextWidget(
                                            text: 'following',
                                            fontSize: FontSizeManager.fs16,
                                            color:
                                                AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          AppTextWidget(
                                            text: (profileInfo?.user
                                                        ?.followingCount ??
                                                    "0")
                                                .toString(),
                                            fontSize: FontSizeManager.fs16,
                                            color:
                                                AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppWidthManager.w3Point8,
                                      ),
                                      Column(
                                        children: [
                                          AppTextWidget(
                                            text: 'advertisement',
                                            fontSize: FontSizeManager.fs16,
                                            color:
                                                AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          //todo
                                          AppTextWidget(
                                            text: (profileInfo?.user
                                                        ?.followingCount ??
                                                    "0")
                                                .toString(),
                                            fontSize: FontSizeManager.fs16,
                                            color:
                                                AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
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
                                text: profileInfo?.user?.description ?? '--',
                                fontSize: FontSizeManager.fs15,
                                color: AppColorManager.textAppColor,
                              ),
                              SizedBox(height: AppHeightManager.h02),
                              AppTextWidget(
                                text: profileInfo?.user?.phone ?? '--',
                                fontSize: FontSizeManager.fs16,
                                fontWeight: FontWeight.w600,
                                color: AppColorManager.textAppColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(

                      ),
                      SizedBox(height: AppHeightManager.h2),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class AuthorProfileArgs {
  final String? userName;

  AuthorProfileArgs({required this.userName});
}
