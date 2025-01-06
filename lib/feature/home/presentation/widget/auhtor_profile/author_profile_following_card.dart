import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/model/user.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../../profile/domain/entity/response/profile_by_username_response_entity.dart';
import '../../screen/other_user_followers_screen.dart';

class AuthorProfileFollowingCard extends StatelessWidget {
  final ProfileByUsernameData? profileInfo;
  final String? userName;

  const AuthorProfileFollowingCard(
      {super.key, required this.profileInfo, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteNamedScreens.followers,
                arguments:
                OtherUserFollowingDataArgs(
                  user: User(
                    username: userName,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                AppTextWidget(
                  text: (profileInfo?.followersCount ?? 0).toString(),
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
              Navigator.of(context).pushNamed(
                RouteNamedScreens.following,
                arguments: OtherUserFollowingDataArgs(
                  user: User(
                    username: userName,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                AppTextWidget(
                  text: (profileInfo?.followingCount ?? 0).toString(),
                  fontSize: FontSizeManager.fs17,
                  fontWeight: FontWeight.w700,
                  color: AppColorManager.textAppColor,
                ),
                SizedBox(height: AppHeightManager.h02),
                AppTextWidget(
                  text: 'following'.tr(),
                  fontSize: FontSizeManager.fs15,
                  color: AppColorManager.textGrey,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          InkWell(
            child: Column(
              children: [
                AppTextWidget(
                  text: (profileInfo?.items ?? 0).toString(),
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
