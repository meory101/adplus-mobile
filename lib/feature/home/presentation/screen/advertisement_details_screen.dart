import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/check_favorite_cubit/check_favorite_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/remove_favorite_cubit/remove_favorite_cubit.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_reaction_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/check_like_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/check_like_cubit/check_like_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/remove_like/remove_like_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_attribute_grid_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_auther_data.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_bottom_sheet.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/adv_details_images_slider.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/comments_section.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/storage/shared/shared_pref.dart';
import '../../../../core/widget/bottom_sheet/login_bottom_sheet.dart';
import '../../../../core/widget/loading/shimmer/adv_details_screen_shimmer.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_adv_details_response_entity.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';

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
  void initState() {
    initScreen();
    super.initState();
  }

  initScreen() {
    if (AppSharedPreferences
        .getToken()
        .isEmpty) {
      return;
    }
    context.read<CheckLikeCubit>().checkLike(
      context: context,
      entity: CheckLikeRequestEntity(
        itemId: widget.args.advertisement?.itemId,
      ),
    );
    context.read<CheckFavoriteCubit>().checkFavorite(
      context: context,
      entity: FavoriteRequestEntity(
        itemId: widget.args.advertisement?.itemId,
      ),
    );
  }

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
                text: LanguageHelper.checkIfLTR(context: context) ? "${widget
                    .args.category?.enName ??"Mzad Damascus"}" : "${widget
                    .args.category?.name ??"مزاد دمشق"}",
                fontSize: FontSizeManager.fs16,
                color: AppColorManager.mainColor,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: AppWidthManager.w2,
                  height: AppWidthManager.w2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: EnumManager.biddingStatusColor[
                      state.entity.data?.biddingStatus ?? 0] ??
                          AppColorManager.textAppColor),
                ),
                SizedBox(width: AppWidthManager.w1Point2,),
                AppTextWidget(
                  text: EnumManager.biddingStatus[
                  state.entity.data?.biddingStatus ?? 0] ??
                      "",
                  fontSize: FontSizeManager.fs17,
                  color: EnumManager.biddingStatusColor[
                  state.entity.data?.biddingStatus ?? 0] ??
                      AppColorManager.textAppColor,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              width: AppWidthManager.w3Point8,
            )
          ],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: AppHeightManager.h1point8,),
                                    AppTextWidget(
                                        maxLines: 2,
                                        fontWeight: FontWeight.w600,
                                        fontSize: FontSizeManager.fs17,
                                        text: advDetails?.name ?? ""),
                                    AppTextWidget(
                                        maxLines: 2,
                                        fontWeight: FontWeight.w700,
                                        fontSize: FontSizeManager.fs16,
                                        text: advDetails?.startingPrice
                                            .toString() ??
                                            ""),
                                  ],
                                ),
                              ),
                              SizedBox(width: AppWidthManager.w2,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: AppWidthManager.w5,
                                        backgroundColor: AppColorManager.grey
                                            .withOpacity(0.2),
                                        child: BlocConsumer<RemoveFavoriteCubit,
                                            RemoveFavoriteState>(
                                          listener: (context, state) {
                                            if (state.status ==
                                                CubitStatus.error) {
                                              NoteMessage.showErrorSnackBar(
                                                  context: context,
                                                  text: state.error);
                                            }
                                            if (state.status ==
                                                CubitStatus.success) {
                                              context
                                                  .read<CheckFavoriteCubit>()
                                                  .checkFavorite(
                                                  context: context,
                                                  entity:
                                                  FavoriteRequestEntity(
                                                      itemId: widget
                                                          .args
                                                          .advertisement
                                                          ?.itemId));
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state.status ==
                                                CubitStatus.loading) {
                                              return const AppCircularProgressWidget();
                                            }
                                            return BlocConsumer<
                                                AddFavoriteCubit,
                                                AddFavoriteState>(
                                              listener: (context, state) {
                                                if (state.status ==
                                                    CubitStatus.error) {
                                                  NoteMessage.showErrorSnackBar(
                                                      context: context,
                                                      text: state.error);
                                                }
                                                if (state.status ==
                                                    CubitStatus.success) {
                                                  NoteMessage
                                                      .showSuccessSnackBar(
                                                      context: context,
                                                      text:
                                                      "addedToFavorite"
                                                          .tr());
                                                  context
                                                      .read<
                                                      CheckFavoriteCubit>()
                                                      .checkFavorite(
                                                      context: context,
                                                      entity: FavoriteRequestEntity(
                                                          itemId: widget
                                                              .args
                                                              .advertisement
                                                              ?.itemId));
                                                }
                                              },
                                              builder: (context, state) {
                                                if (state.status ==
                                                    CubitStatus.loading) {
                                                  return const AppCircularProgressWidget();
                                                }
                                                return BlocConsumer<
                                                    CheckFavoriteCubit,
                                                    CheckFavoriteState>(
                                                  listener: (context, state) {
                                                    if (state.status ==
                                                        CubitStatus.error) {
                                                      NoteMessage
                                                          .showErrorSnackBar(
                                                          context: context,
                                                          text:
                                                          state.error);
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    if (state.status ==
                                                        CubitStatus.loading) {
                                                      return const AppCircularProgressWidget();
                                                    }
                                                    bool like = (state.entity
                                                        .data?.exists ??
                                                        false);

                                                    return IconButton(
                                                        onPressed: () {
                                                          if (AppSharedPreferences
                                                              .getToken()
                                                              .isEmpty) {
                                                            showLoginBottomSheet(
                                                                context:
                                                                context);
                                                            return;
                                                          }
                                                          if (like == true) {
                                                            context
                                                                .read<
                                                                RemoveFavoriteCubit>()
                                                                .removeFavorite(
                                                                context:
                                                                context,
                                                                entity:
                                                                FavoriteRequestEntity(
                                                                  itemId: advDetails
                                                                      ?.itemId,
                                                                ));
                                                          } else {
                                                            context
                                                                .read<
                                                                AddFavoriteCubit>()
                                                                .addFavorite(
                                                                context:
                                                                context,
                                                                entity:
                                                                FavoriteRequestEntity(
                                                                  itemId: advDetails
                                                                      ?.itemId,
                                                                ));
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color: like == true
                                                              ? AppColorManager
                                                              .red
                                                              : AppColorManager
                                                              .white,
                                                          size: AppWidthManager
                                                              .w5,
                                                        ));
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppWidthManager.w2,
                                      ),
                                      Row(
                                        children: [
                                          AppTextWidget(
                                              fontWeight: FontWeight.w600,
                                              fontSize: FontSizeManager.fs16,
                                              text:
                                              (advDetails?.likeCount ?? "")
                                                  .toString()),
                                          SizedBox(
                                            width: AppWidthManager.w2,
                                          ),
                                          CircleAvatar(
                                            radius: AppWidthManager.w5,
                                            backgroundColor: AppColorManager
                                                .grey
                                                .withOpacity(0.2),
                                            child: BlocConsumer<RemoveLikeCubit,
                                                RemoveLikeState>(
                                              listener: (context, state) {
                                                if (state.status ==
                                                    CubitStatus.error) {
                                                  NoteMessage.showErrorSnackBar(
                                                      context: context,
                                                      text: state.error);
                                                }
                                                if (state.status ==
                                                    CubitStatus.success) {
                                                  context
                                                      .read<AdvDetailsCubit>()
                                                      .getAdvDetails(
                                                      context: context,
                                                      entity: GetAdvDetailsRequestEntity(
                                                          itemId: widget
                                                              .args
                                                              .advertisement
                                                              ?.itemId));
                                                  context
                                                      .read<CheckLikeCubit>()
                                                      .checkLike(
                                                      context: context,
                                                      entity: CheckLikeRequestEntity(
                                                          itemId: widget
                                                              .args
                                                              .advertisement
                                                              ?.itemId));
                                                }
                                              },
                                              builder: (context, state) {
                                                if (state.status ==
                                                    CubitStatus.loading) {
                                                  return const AppCircularProgressWidget();
                                                }
                                                return BlocConsumer<
                                                    AddReactionCubit,
                                                    AddReactionState>(
                                                  listener: (context, state) {
                                                    if (state.status ==
                                                        CubitStatus.error) {
                                                      NoteMessage
                                                          .showErrorSnackBar(
                                                          context: context,
                                                          text:
                                                          state.error);
                                                    }
                                                    if (state.status ==
                                                        CubitStatus.success) {
                                                      context
                                                          .read<
                                                          AdvDetailsCubit>()
                                                          .getAdvDetails(
                                                          context: context,
                                                          entity: GetAdvDetailsRequestEntity(
                                                              itemId: widget
                                                                  .args
                                                                  .advertisement
                                                                  ?.itemId));
                                                      context
                                                          .read<
                                                          CheckLikeCubit>()
                                                          .checkLike(
                                                          context: context,
                                                          entity: CheckLikeRequestEntity(
                                                              itemId: widget
                                                                  .args
                                                                  .advertisement
                                                                  ?.itemId));
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    if (state.status ==
                                                        CubitStatus.loading) {
                                                      return const AppCircularProgressWidget();
                                                    }
                                                    return BlocConsumer<
                                                        CheckLikeCubit,
                                                        CheckLikeState>(
                                                      listener:
                                                          (context, state) {
                                                        if (state.status ==
                                                            CubitStatus.error) {
                                                          NoteMessage
                                                              .showErrorSnackBar(
                                                              context:
                                                              context,
                                                              text: state
                                                                  .error);
                                                        }
                                                      },
                                                      builder:
                                                          (context, state) {
                                                        if (state.status ==
                                                            CubitStatus
                                                                .loading) {
                                                          return const AppCircularProgressWidget();
                                                        }
                                                        bool like = (state
                                                            .entity
                                                            .data
                                                            ?.exists ??
                                                            false);

                                                        return IconButton(
                                                            onPressed: () {
                                                              if (AppSharedPreferences
                                                                  .getToken()
                                                                  .isEmpty) {
                                                                showLoginBottomSheet(
                                                                    context:
                                                                    context);
                                                                return;
                                                              }
                                                              if (like ==
                                                                  true) {
                                                                context
                                                                    .read<
                                                                    RemoveLikeCubit>()
                                                                    .removeLike(
                                                                    context:
                                                                    context,
                                                                    entity:
                                                                    CheckLikeRequestEntity(
                                                                      itemId:
                                                                      advDetails
                                                                          ?.itemId,
                                                                    ));
                                                              } else {
                                                                context.read<
                                                                    AddReactionCubit>()
                                                                    .addReaction(
                                                                    context:
                                                                    context,
                                                                    entity: AddReactionRequestEntity(
                                                                        itemId: advDetails
                                                                            ?.itemId,
                                                                        reactionType:
                                                                        EnumManager
                                                                            .likeReaction));
                                                              }
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .thumb_up_alt_rounded,
                                                              color: like ==
                                                                  true
                                                                  ? AppColorManager
                                                                  .mainColor
                                                                  : AppColorManager
                                                                  .white,
                                                              size: AppWidthManager
                                                                  .w5,
                                                            ));
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
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
  SubCategory? category;

  AdvertisementDetailsArgs({required this.advertisement, this.category});
}
