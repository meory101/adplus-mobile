import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/comment/presentation/cubit/comment_cubit/comment_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/feature/likes/presentation/cubit/likes_cubit/likes_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/activity_card.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/profile_info_card.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/size_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    initProfileScreen();
    super.initState();
  }

  initProfileScreen() {
    context.read<GetProfileInfoCubit>().getProfileInfo(context: context);
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: AppColorManager.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextWidget(
                text: 'profile'.tr(),
                fontSize: FontSizeManager.fs17,
                color: AppColorManager.textAppColor,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfileInfoCard(),
            Divider(
              color: AppColorManager.borderGrey,
              thickness: 1.0,
              indent: AppWidthManager.w3Point8,
              endIndent: AppWidthManager.w3Point8,
            ),
            ActivityCard(
              onActivityTapChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            SizedBox(
              height: AppHeightManager.h2,
            ),
            selectedIndex == 0
                ? BlocConsumer<FavoritesCubit, FavoritesState>(
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
                      List<AdvDetails> favorites =
                          state.entity.data?.data ?? [];
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(RouteNamedScreens.advertisementDetails
                              ,
                                arguments: AdvertisementDetailsArgs(advertisement: AdData(
                                  itemId: favorites[index].itemId
                                ))
                              );
                            },
                            child: Container(
                              height: AppHeightManager.h17,
                              decoration: BoxDecoration(
                                  color: AppColorManager.white,
                                  borderRadius: BorderRadius.circular(
                                      AppRadiusManager.r10)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppWidthManager.w3Point8),
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
                                          (favorites[index].photos?.first.photo ??
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
                                            text: favorites[index].name ??"",
                                            fontSize: FontSizeManager.fs16,
                                            color: AppColorManager.textAppColor,
                                            fontWeight: FontWeight.w700),
                                        AppTextWidget(
                                            text: favorites[index].description ??"",
                                            fontSize: FontSizeManager.fs15,
                                            color: AppColorManager.textGrey,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500),
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
                  )
          :  selectedIndex == 1?

            BlocConsumer<CommentCubit, CommentState>(
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
            )

                :
            BlocConsumer<LikesCubit, LikesState>(
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
                List<AdvDetails> likes =
                    state.entity.data?.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: likes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteNamedScreens.advertisementDetails
                            ,
                            arguments: AdvertisementDetailsArgs(advertisement: AdData(
                                itemId: likes[index].itemId
                            ))
                        );
                      },
                      child: Container(
                        height: AppHeightManager.h17,
                        decoration: BoxDecoration(
                            color: AppColorManager.white,
                            borderRadius: BorderRadius.circular(
                                AppRadiusManager.r10)),
                        margin: EdgeInsets.symmetric(
                            horizontal: AppWidthManager.w3Point8),
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
                                    (likes[index].photos?.first.photo ??
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
                                      text: likes[index].name ??"",
                                      fontSize: FontSizeManager.fs16,
                                      color: AppColorManager.textAppColor,
                                      fontWeight: FontWeight.w700),
                                  AppTextWidget(
                                      text: likes[index].description ??"",
                                      fontSize: FontSizeManager.fs15,
                                      color: AppColorManager.textGrey,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500),
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
            ),


            SizedBox(
              height: AppHeightManager.h3,
            )
          ],
        ),
      ),
    );
  }
}
