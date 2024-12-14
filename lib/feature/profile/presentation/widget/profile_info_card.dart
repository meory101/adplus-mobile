import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/helper/validation_helper.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
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
  bool isVisitor = AppSharedPreferences.getToken().isEmpty;

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
        return DecoratedContainer(
          borderRadius: BorderRadius.circular(AppRadiusManager.r15),
          margin: EdgeInsets.all(AppWidthManager.w3Point8),
          padding: EdgeInsets.all(AppWidthManager.w3Point8),
          child: Column(
            children: [
              SizedBox(height: AppHeightManager.h02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: onEditTaped,
                            child: SizedBox(
                              width: AppHeightManager.h3,
                              height: AppHeightManager.h3,
                              child: SvgPicture.asset(
                                AppIconManager.edit,
                                colorFilter: ColorFilter.mode(
                                    isVisitor==true?AppColorManager.grey: AppColorManager.mainColor,
                                    BlendMode.srcIn),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppHeightManager.h1point5,
                          ),
                          InkWell(
                            onTap: onAddTaped,
                            child: Icon(
                              Icons.add_circle_outline_outlined,
                              color:isVisitor==true?AppColorManager.grey: AppColorManager.mainColor,
                              size: AppHeightManager.h3,
                            ),
                          ),
                        ],
                      ),
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
                      Visibility(
                        visible: (profileInfo?.user?.isCompany ?? 0) == 1,
                        replacement: Icon(
                          Icons.person,
                          color: AppColorManager.white,
                          size: AppHeightManager.h3,
                        ),
                        child: Icon(
                          Icons.verified_rounded,
                          color: AppColorManager.mainColor,
                          size: AppHeightManager.h3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeightManager.h1),
                  Visibility(
                      visible: isVisitor==false,
                      child: Column(
                    children: [
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
                    ],
                  )),
                  SizedBox(height: AppHeightManager.h1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedContainer(
                        boxShadow: [],
                        color:
                            AppColorManager.lightGreyOpacity6.withOpacity(0.5),
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
                                    '${profileInfo?.user?.phone ?? 'noPhoneNumberYet'.tr()}',
                                fontSize: FontSizeManager.fs15,
                                color: AppColorManager.textGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppWidthManager.w2,
                      ),
                      DecoratedContainer(
                        boxShadow: [],
                        color:
                            AppColorManager.lightGreyOpacity6.withOpacity(0.5),
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
                                    '${profileInfo?.user?.whatsapp ?? 'noWhatsappYet'.tr()}',
                                fontSize: FontSizeManager.fs15,
                                color: AppColorManager.textGrey,
                              ),
                            ],
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
