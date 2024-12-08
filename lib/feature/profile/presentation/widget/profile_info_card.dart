import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/helper/validation_helper.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
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
import 'dart:ui' as ui;

class ProfileInfoCard extends StatefulWidget {
  const ProfileInfoCard({super.key});

  @override
  State<ProfileInfoCard> createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  ProfileInfo? profileInfo;

  onEditTaped() {
    if (AppSharedPreferences.getToken().isEmpty) return;
    Navigator.of(context)
        .pushNamed(RouteNamedScreens.profileModification,
            arguments: ProfileInfoModificationArgs(profileInfo: profileInfo))
        .then(
      (value) {
        context.read<GetProfileInfoCubit>().getProfileInfo(context: context);
      },
    );
  }

  onAddTaped() {
    if (AppSharedPreferences.getToken().isEmpty) return;

    Navigator.of(context).pushNamed(RouteNamedScreens.advertisementLanguage);
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppWidthManager.w25,
                        height: AppWidthManager.w25,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: MainImageWidget(
                          fit: BoxFit.cover,
                          imageUrl: (AppConstantManager.imageBaseUrl +
                              (profileInfo?.user?.photo ?? "")),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onEditTaped,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppSharedPreferences.getToken()
                                            .isEmpty
                                        ? AppColorManager.grey.withOpacity(0.4)
                                        : AppColorManager.mainColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppHeightManager.h1,
                                        horizontal: AppWidthManager.w4),
                                    child: Row(
                                      children: [
                                        AppTextWidget(
                                          text: "edit".tr(),
                                          color: AppColorManager.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: FontSizeManager.fs15,
                                        ),
                                        SizedBox(
                                          width: AppWidthManager.w2,
                                        ),
                                        Icon(
                                          Icons.edit,
                                          size: AppWidthManager.w5,
                                          color: AppColorManager.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppWidthManager.w1Point2,
                          ),
                          InkWell(
                            onTap: onAddTaped,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppSharedPreferences.getToken()
                                            .isEmpty
                                        ? AppColorManager.grey.withOpacity(0.4)
                                        : AppColorManager.pinkAccent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppHeightManager.h1,
                                        horizontal: AppWidthManager.w4),
                                    child: Row(
                                      children: [
                                        AppTextWidget(
                                          text: "newAdv".tr(),
                                          color: AppColorManager.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: FontSizeManager.fs15,
                                        ),
                                        SizedBox(
                                          width: AppWidthManager.w2,
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: AppWidthManager.w5,
                                          color: AppColorManager.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: AppHeightManager.h1point8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextWidget(
                        text: "name".tr(),
                        fontSize: FontSizeManager.fs16,
                        color: AppColorManager.textAppColor,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: AppWidthManager.w1Point2,
                      ),
                      AppTextWidget(
                        text: profileInfo?.user?.name ?? "",
                        fontSize: FontSizeManager.fs16,
                        color: AppColorManager.textAppColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeightManager.h02),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ((profileInfo?.user?.username ?? "").isEmail())
                              ? AppIconManager.email
                              : AppIconManager.phone,
                        ),
                        SizedBox(
                          width: AppWidthManager.w1Point2,
                        ),
                        AppTextWidget(
                          text: profileInfo?.user?.username ??
                              'youAreNotRegisteredYet'.tr(),
                          fontSize: FontSizeManager.fs16,
                          fontWeight: FontWeight.w600,
                          color: AppColorManager.textAppColor,
                        ),
                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: AppTextWidget(
                      text:
                          '${profileInfo?.user?.phone ?? 'noPhoneNumberYet'.tr()}',
                      fontSize: FontSizeManager.fs16,
                      color: AppColorManager.textGrey,
                    ),
                  ),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: AppTextWidget(
                      text:
                          '${profileInfo?.user?.whatsapp ?? 'noWhatsappYet'.tr()}',
                      fontSize: FontSizeManager.fs16,
                      color: AppColorManager.textGrey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextWidget(
                      text: profileInfo?.user?.description ?? '',
                      fontSize: FontSizeManager.fs15,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: AppColorManager.textGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppHeightManager.h05),
              Divider(
                color: AppColorManager.borderGrey,
                thickness: 1.0,
                indent: AppWidthManager.w3Point8,
                endIndent: AppWidthManager.w3Point8,
              ),
              SizedBox(height: AppHeightManager.h05),
              ProfileFollowingInfoCard(
                profileInfo: profileInfo,
              ),
              SizedBox(height: AppHeightManager.h2),
            ],
          ),
        );
      },
    );
  }
}
