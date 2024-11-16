import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/helper/lanucher_helper.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_advs_by_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_comment_cubit/add_comment_cubit.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/add_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/add_follow_cubit/add_follow_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/profile_by_username_cubit/profile_by_username_cubit.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/storage/shared/shared_pref.dart';
import '../../../../core/widget/bottom_sheet/login_bottom_sheet.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../core/widget/loading/shimmer/profile_info_card_shimmer.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../../more/domain/entity/response/myitems_response_entity.dart';
import '../../../profile/domain/entity/response/profile_by_username_response_entity.dart';
import '../cubit/get_advs_by_user_cubit/get_adv_by_user_cubit.dart';
import 'advertisement_details_screen.dart';

class AuthorProfileScreen extends StatefulWidget {
  final AuthorProfileArgs arg;

  const AuthorProfileScreen({super.key, required this.arg});

  @override
  State<AuthorProfileScreen> createState() => _AuthorProfileScreenState();
}

class _AuthorProfileScreenState extends State<AuthorProfileScreen> {
  AdData? advertisement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: "",
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
                if (state.status == CubitStatus.success) {
                  context.read<GetAdvByUserCubit>().getAdvsByUser(
                      context: context,
                      entity: GetAdvsByUserRequestEntity(
                          clientId: state.entity.data?.user?.clientId,
                          page: 1));
                }
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return Column(
                    children: [
                      const ProfileInfoCardShimmer(),
                      SizedBox(
                        height: AppHeightManager.h1point8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppWidthManager.w3Point8),
                        child: const AdvsByAttributeShimmer(),
                      )
                    ],
                  );
                }

                ProfileByUsernameData? profileInfo = state.entity.data;
                return DecoratedContainer(
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  margin: EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
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
                                      imageUrl:
                                          (AppConstantManager.imageBaseUrl +
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
                                            text: 'followers'.tr(),
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          AppTextWidget(
                                            text: (profileInfo?.followersCount ??
                                                    "0")
                                                .toString(),
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
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
                                            text: 'following'.tr(),
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          AppTextWidget(
                                            text: (profileInfo?.followingCount ??
                                                    "0")
                                                .toString(),
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
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
                                            text: 'advertisements'.tr(),
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          AppTextWidget(
                                            text: (profileInfo
                                                        ?.items ??
                                                    "0")
                                                .toString(),
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
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
                      SizedBox(height: AppHeightManager.h1point8),
                      Row(
                        children: [
                          BlocConsumer<AddFollowCubit, AddFollowState>(
                            listener: (context, state) {
                              if (state.status == CubitStatus.error) {
                                NoteMessage.showErrorSnackBar(
                                    context: context, text: state.error);
                              }
                            },
                            builder: (context, state) {
                              if (state.status == CubitStatus.loading) {
                                return ShimmerContainer(
                                  height: AppHeightManager.h4,
                                  width: AppWidthManager.w20,
                                );
                              }
                              return MainAppButton(
                                onTap: () {
                                  if (AppSharedPreferences
                                      .getToken()
                                      .isEmpty) {
                                    showLoginBottomSheet(context: context);
                                    return;
                                  }
                                  context.read<AddFollowCubit>().addFollow(
                                      context: context,
                                      entity: AddFollowRequestEntity(
                                          followingId:
                                              profileInfo?.user?.clientId));
                                },
                                alignment: Alignment.center,
                                borderRadius:
                                    BorderRadius.circular(AppRadiusManager.r5),
                                height: AppHeightManager.h4,
                                color: AppColorManager.mainColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppWidthManager.w6),
                                child: AppTextWidget(
                                  text: "follow".tr(),
                                  color: AppColorManager.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: FontSizeManager.fs15,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: AppWidthManager.w2,
                          ),
                          MainAppButton(
                            onTap: () {
                              UrlLauncherHelper.makeCall(
                                  phoneNumber: profileInfo?.user?.phone ?? "");
                            },
                            alignment: Alignment.center,
                            borderRadius:
                                BorderRadius.circular(AppRadiusManager.r5),
                            height: AppHeightManager.h4,
                            color: AppColorManager.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppWidthManager.w6),
                            child: AppTextWidget(
                              text: "call".tr(),
                              color: AppColorManager.white,
                              fontWeight: FontWeight.w600,

                              fontSize: FontSizeManager.fs15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: AppHeightManager.h2),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            BlocConsumer<GetAdvByUserCubit, GetAdvByUserState>(
              listener: (context, state) {
                if (state.status == CubitStatus.error) {
                  NoteMessage.showErrorSnackBar(
                      context: context, text: state.error);
                }
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppWidthManager.w3Point8),
                    child: const AdvsByAttributeShimmer(),
                  );
                }
                List<AdData>? advs = state.entity.data?.data ?? [];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
                  child: DynamicHeightGridView(
                    crossAxisSpacing: AppWidthManager.w2,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: advs.length,
                    builder: (context, index) {
                      advertisement = advs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteNamedScreens.advertisementDetails,
                              arguments: AdvertisementDetailsArgs(
                                  advertisement: advs[index]));
                        },
                        child: Column(
                          children: [
                            Container(
                                height: AppHeightManager.h30,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  color: AppColorManager.lightGreyOpacity6,
                                  borderRadius: BorderRadius.circular(
                                      AppRadiusManager.r15),
                                ),
                                child: MainImageWidget(
                                  imageUrl: AppConstantManager.imageBaseUrl +
                                      (advertisement?.photos?.first.photo ??
                                          ""),
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
                                  text: advertisement?.name.toString() ?? "",
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
                        ),
                      );
                    },
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
