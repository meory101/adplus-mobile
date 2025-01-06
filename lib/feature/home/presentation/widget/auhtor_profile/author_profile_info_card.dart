import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/core/helper/lanucher_helper.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/auhtor_profile/author_profile_following_card.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/check_follow_cubit/check_follow_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/profile_by_username_cubit/profile_by_username_cubit.dart';
import 'dart:ui' as ui;
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/icon_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/storage/shared/shared_pref.dart';
import '../../../../../core/widget/bottom_sheet/login_bottom_sheet.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/container/shimmer_container.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../../core/widget/loading/shimmer/profile_info_card_shimmer.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../../profile/domain/entity/request/add_follow_request_entity.dart';
import '../../../../profile/domain/entity/request/check_follow_request_entity.dart';
import '../../../../profile/domain/entity/request/remove_follow_request_entity.dart';
import '../../../../profile/domain/entity/response/profile_by_username_response_entity.dart';
import '../../../../profile/presentation/cubit/add_follow_cubit/add_follow_cubit.dart';
import '../../../../profile/presentation/cubit/remove_follow_cubit/remove_follow_cubit.dart';
import '../../../../profile/presentation/widget/profile_following_info_card.dart';
import '../../../domain/entity/request/get_advs_by_user_request_entity.dart';
import '../../cubit/get_advs_by_user_cubit/get_adv_by_user_cubit.dart';
import '../../screen/auhter_profile_screen.dart';

class AuthorProfileInfoCard extends StatefulWidget {
  final String userName;
  final Function(GetAdvsByUserRequestEntity) onAdByUserEntityChanged;

  const AuthorProfileInfoCard(
      {super.key,
      required this.onAdByUserEntityChanged,
      required this.userName});

  @override
  State<AuthorProfileInfoCard> createState() => _AuthorProfileInfoCardState();
}

class _AuthorProfileInfoCardState extends State<AuthorProfileInfoCard> {
  GetAdvsByUserRequestEntity adByUserEntity = GetAdvsByUserRequestEntity();
  CheckFollowRequestEntity entity = CheckFollowRequestEntity();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileByUsernameCubit, ProfileByUsernameState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
        if (state.status == CubitStatus.success) {
          adByUserEntity.page = 1;
          entity.clientId = state.entity.data?.user?.clientId;
          adByUserEntity.clientId = state.entity.data?.user?.clientId;
          widget.onAdByUserEntityChanged(adByUserEntity);

          context
              .read<GetAdvByUserCubit>()
              .getAdvsByUser(context: context, entity: adByUserEntity);
          if (AppSharedPreferences.getToken().isEmpty) return;
          context
              .read<CheckFollowCubit>()
              .checkFollow(context: context, entity: entity);
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
                padding:
                    EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
                child: const AdvsByAttributeShimmer(),
              )
            ],
          );
        }

        ProfileByUsernameData? profileInfo = state.entity.data;
        return DecoratedContainer(
            borderRadius: BorderRadius.circular(AppRadiusManager.r15),
            margin: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
            padding: EdgeInsets.all(AppWidthManager.w3Point8),
            child: Column(children: [
              SizedBox(height: AppHeightManager.h02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColorManager.mainColor, width: 3)),
                    child: Container(
                      width: AppWidthManager.w28,
                      height: AppWidthManager.w28,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: MainImageWidget(
                        fit: BoxFit.cover,
                        imageUrl: (AppConstantManager.imageBaseUrl +
                            (profileInfo?.user?.photo ?? "")),
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeightManager.h1),
                  AppTextWidget(
                    text: profileInfo?.user?.name ?? "",
                    fontSize: FontSizeManager.fs18,
                    color: AppColorManager.textAppColor,
                    fontWeight: FontWeight.w700,
                  ),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: AppTextWidget(
                      text: profileInfo?.user?.username ?? "",
                      fontSize: FontSizeManager.fs16,
                      color: AppColorManager.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppTextWidget(
                    text: profileInfo?.user?.description ?? "",
                    fontSize: FontSizeManager.fs15,
                    color: AppColorManager.grey,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppHeightManager.h1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if ((profileInfo?.user?.phone ?? "").isEmpty) return;
                          UrlLauncherHelper.makeCall(
                              phoneNumber: profileInfo?.user?.phone ?? '');
                        },
                        child: DecoratedContainer(
                          boxShadow: [],
                          color: AppColorManager.lightGreyOpacity6
                              .withOpacity(0.5),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppWidthManager.w3,
                              vertical: AppHeightManager.h05),
                          borderRadius:
                              BorderRadius.circular(AppRadiusManager.r15),
                          child: Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: AppHeightManager.h2,
                                  color: AppColorManager.mainColor,
                                ),
                                SizedBox(
                                  width: AppWidthManager.w1Point2,
                                ),
                                AppTextWidget(
                                  text:
                                      profileInfo?.user?.phone ?? 'noPhoneNumberYet'.tr(),
                                  fontSize: FontSizeManager.fs15,
                                  color: AppColorManager.textGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppWidthManager.w2,
                      ),
                      InkWell(
                        onTap: () {
                          if ((profileInfo?.user?.whatsapp ?? "").isEmpty) {
                            return;
                          }
                          UrlLauncherHelper.openWhatsapp(
                              phoneNumber: profileInfo?.user?.whatsapp ?? '');
                        },
                        child: DecoratedContainer(
                          boxShadow: [],
                          color: AppColorManager.lightGreyOpacity6
                              .withOpacity(0.5),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppWidthManager.w3,
                              vertical: AppHeightManager.h05),
                          borderRadius:
                              BorderRadius.circular(AppRadiusManager.r15),
                          child: Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: AppHeightManager.h2,
                                  height: AppHeightManager.h2,
                                  child: SvgPicture.asset(
                                    AppIconManager.whatsapp,
                                    colorFilter: ColorFilter.mode(
                                        AppColorManager.mainColor,
                                        BlendMode.srcIn),
                                  ),
                                ),
                                SizedBox(
                                  width: AppWidthManager.w1Point2,
                                ),
                                AppTextWidget(
                                  text:
                                      profileInfo?.user?.whatsapp ?? 'noWhatsappYet'.tr(),
                                  fontSize: FontSizeManager.fs15,
                                  color: AppColorManager.textGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeightManager.h02),
                ],
              ),
              SizedBox(height: AppHeightManager.h05),
              Divider(
                color: AppColorManager.borderGrey,
                thickness: 1.0,
                indent: AppWidthManager.w3Point8,
                endIndent: AppWidthManager.w3Point8,
              ),
              AuthorProfileFollowingCard(userName:widget.userName ,profileInfo: profileInfo,),
              SizedBox(height: AppHeightManager.h2),
              BlocConsumer<RemoveFollowCubit, RemoveFollowState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.error) {
                    NoteMessage.showErrorSnackBar(
                        context: context, text: state.error);
                  }
                  if (state.status == CubitStatus.success) {
                    context
                        .read<CheckFollowCubit>()
                        .checkFollow(context: context, entity: entity);
                    Navigator.of(context).pushReplacementNamed(
                        RouteNamedScreens.authorProfile,
                        arguments:
                        AuthorProfileArgs(userName: widget.userName));
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return ShimmerContainer(
                      height: AppHeightManager.h5,
                      width: AppWidthManager.w80,
                    );
                  }
                  return BlocConsumer<AddFollowCubit, AddFollowState>(
                    listener: (context, state) {
                      if (state.status == CubitStatus.error) {
                        NoteMessage.showErrorSnackBar(
                            context: context, text: state.error);
                      }
                      if (state.status == CubitStatus.success) {
                        context
                            .read<CheckFollowCubit>()
                            .checkFollow(context: context, entity: entity);
                        Navigator.of(context).pushReplacementNamed(
                            RouteNamedScreens.authorProfile,
                            arguments: AuthorProfileArgs(
                                userName: widget.userName));
                      }
                    },
                    builder: (context, state) {
                      if (state.status == CubitStatus.loading) {
                        return ShimmerContainer(
                          height: AppHeightManager.h5,
                          width: AppWidthManager.w80,
                        );
                      }
                      return BlocConsumer<CheckFollowCubit,
                          CheckFollowState>(
                        listener: (context, state) {
                          if (state.status == CubitStatus.error) {
                            NoteMessage.showErrorSnackBar(
                                context: context, text: state.error);
                          }
                        },
                        builder: (context, state) {
                          if (state.status == CubitStatus.loading) {
                            return ShimmerContainer(
                              height: AppHeightManager.h5,
                              width: AppWidthManager.w80,
                            );
                          }
                          bool follow = state.entity.data?.exists ?? false;
                          return MainAppButton(
                            width: AppWidthManager.w80,
                            onTap: () {
                              if (AppSharedPreferences.getToken().isEmpty) {
                                showLoginBottomSheet(context: context);
                                return;
                              }
                              if (follow == true) {
                                context
                                    .read<RemoveFollowCubit>()
                                    .removeFollow(
                                    context: context,
                                    entity: RemoveFollowRequestEntity(
                                        followingId: profileInfo
                                            ?.user?.clientId));
                              } else {
                                context.read<AddFollowCubit>().addFollow(
                                    context: context,
                                    entity: AddFollowRequestEntity(
                                        followingId:
                                        profileInfo?.user?.clientId));
                              }
                            },
                            alignment: Alignment.center,
                            borderRadius:
                            BorderRadius.circular(AppRadiusManager.r15),
                            height: AppHeightManager.h5,
                            color: follow == true
                                ? AppColorManager.textGrey
                                : AppColorManager.mainColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppWidthManager.w6),
                            child: AppTextWidget(
                              text: follow == true
                                  ? "unFollow".tr()
                                  : "follow".tr(),
                              color: AppColorManager.white,
                              fontWeight: FontWeight.w600,
                              fontSize: FontSizeManager.fs15,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: AppHeightManager.h2),
            ]));
      },
    );
  }
}
