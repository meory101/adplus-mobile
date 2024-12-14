import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import 'dart:ui' as ui;

class ProfileFollowingInfoCard extends StatefulWidget {
  final ProfileInfo? profileInfo;

  const ProfileFollowingInfoCard({super.key, required this.profileInfo});

  @override
  State<ProfileFollowingInfoCard> createState() =>
      _ProfileFollowingInfoCardState();
}

class _ProfileFollowingInfoCardState extends State<ProfileFollowingInfoCard> {

  bool isVisitor = AppSharedPreferences
      .getToken()
      .isEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (isVisitor == true) return;
              Navigator.of(context).pushNamed(RouteNamedScreens.myFollowers);
            },
            child: Column(
              children: [
                AppTextWidget(
                  text: (widget.profileInfo?.followersCount ?? 0).toString(),
                  fontSize: FontSizeManager.fs17,
                  fontWeight: FontWeight.w700,
                  color: AppColorManager.textAppColor,
                ),
                SizedBox(height: AppHeightManager.h02),
                AppTextWidget(
                  text: "followers".tr(),
                  fontSize: FontSizeManager.fs15,
                  color: AppColorManager.textGrey,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (isVisitor == true) return;

              Navigator.of(context).pushNamed(RouteNamedScreens.myFollowing);
            },
            child: Column(
              children: [
                AppTextWidget(
                  text: (widget.profileInfo?.followingCount ?? 0).toString(),
                  fontSize: FontSizeManager.fs17,
                  fontWeight: FontWeight.w700,
                  color: AppColorManager.textAppColor,
                ),
                SizedBox(height: AppHeightManager.h02),
                AppTextWidget(
                  text: 'followings'.tr(),
                  fontSize: FontSizeManager.fs15,
                  color: AppColorManager.textGrey,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (isVisitor == true) return;

              Navigator.of(context).pushNamed(RouteNamedScreens.myitem);
            },
            child: Column(
              children: [
                AppTextWidget(
                  text: (widget.profileInfo?.items ?? 0).toString(),
                  fontSize: FontSizeManager.fs17,
                  fontWeight: FontWeight.w700,
                  color: AppColorManager.textAppColor,
                ),
                SizedBox(height: AppHeightManager.h02),
                AppTextWidget(
                  text: 'advertisements'.tr(),
                  fontSize: FontSizeManager.fs15,
                  color: AppColorManager.textGrey,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

