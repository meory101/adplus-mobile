import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/helper/lanucher_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';

class AdvDetailsBottomSheet extends StatelessWidget {
  final AdvDetails? advDetails;

  const AdvDetailsBottomSheet({super.key, required this.advDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
      alignment: Alignment.center,
      height: AppHeightManager.h10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MainAppButton(
            onTap: () {
              UrlLauncherHelper.openWhatsapp(
                  phoneNumber: advDetails?.author?.whatsapp ?? "");
            },
            alignment: Alignment.center,
            color: AppColorManager.green,
            height: AppHeightManager.h4,
            borderRadius: BorderRadius.circular(AppRadiusManager.r5),
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
            child: AppTextWidget(
              text: "whatsapp".tr(),
              fontSize: FontSizeManager.fs16,
              fontWeight: FontWeight.w600,
              color: AppColorManager.white,
              maxLines: 2,
            ),
          ),
          MainAppButton(
            onTap: () {
              UrlLauncherHelper.sendMessage(
                  phoneNumber: advDetails?.author?.phone ?? "");
            },
            alignment: Alignment.center,
            color: AppColorManager.lightBlue,
            height: AppHeightManager.h4,
            borderRadius: BorderRadius.circular(AppRadiusManager.r5),
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
            child: AppTextWidget(
              text: "message".tr(),
              fontSize: FontSizeManager.fs16,


              fontWeight: FontWeight.w600,
              color: AppColorManager.white,
            ),
          ),
          MainAppButton(
            onTap: () {
              UrlLauncherHelper.makeCall(
                  phoneNumber: advDetails?.author?.phone ?? "");
            },
            alignment: Alignment.center,
            color: AppColorManager.darkRed,
            height: AppHeightManager.h4,
            borderRadius: BorderRadius.circular(AppRadiusManager.r5),
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
            child: AppTextWidget(
              text: "makeCall".tr(),
              fontSize: FontSizeManager.fs16,
              fontWeight: FontWeight.w600,
              color: AppColorManager.white,
            ),
          )
        ],
      ),
    );
  }
}
