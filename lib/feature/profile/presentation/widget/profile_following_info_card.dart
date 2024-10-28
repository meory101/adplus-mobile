import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class ProfileFollowingInfoCard extends StatelessWidget {
  final ProfileInfo? profileInfo;
  const ProfileFollowingInfoCard({super.key,required this.profileInfo});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              AppTextWidget(
                text: '--',
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w700,
                color: AppColorManager.textAppColor,
              ),
              SizedBox(height: AppWidthManager.w2,),

              AppTextWidget(
                text: "followers",
                fontSize: FontSizeManager.fs14,
                color: AppColorManager.textGrey,
              ),
            ],
          ),
          Column(
            children: [
              AppTextWidget(
                text: '--',
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w700,
                color: AppColorManager.textAppColor,
              ),
              SizedBox(height: AppWidthManager.w2,),

              AppTextWidget(
                text: "Following",
                fontSize: FontSizeManager.fs14,
                color: AppColorManager.textGrey,
              ),
            ],
          ),

          Column(
            children: [
              AppTextWidget(
                text: '0/100',
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w700,
                color: AppColorManager.textAppColor,
              ),          SizedBox(height: AppWidthManager.w2,),


              AppTextWidget(
                text: 'Posted Ads',
                fontSize: FontSizeManager.fs14,
                color: AppColorManager.textGrey,
              ),
            ],
          ),


          Column(
            children: [
              AppTextWidget(
                text: profileInfo?.user?.whatsapp ?? '--',
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w700,
                color: AppColorManager.textAppColor,
              ),
              SizedBox(height: AppWidthManager.w2,),
              AppTextWidget(
                text: 'whatsapp',
                fontSize: FontSizeManager.fs14,
                color: AppColorManager.textGrey,
              ),
            ],
          )
        ]

    );
  }
}
