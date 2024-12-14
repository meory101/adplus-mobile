import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

void showEditDeleteAdDialog(
    {required BuildContext context,
    required Function() onEditTaped,
    required Function() onDeleteTaped}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppRadiusManager.r10))),
        insetPadding: EdgeInsets.symmetric(
          horizontal: AppWidthManager.w4,
        ),
        elevation: 0,
        backgroundColor: AppColorManager.white,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppWidthManager.w3Point8,
              vertical: AppHeightManager.h2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  onEditTaped();
                },
                child: DecoratedContainer(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8,
                      vertical: AppHeightManager.h1),
                  width: AppWidthManager.w100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextWidget(
                          text: 'edit'.tr(),
                          fontSize: FontSizeManager.fs16,
                          color: AppColorManager.textAppColor,
                          fontWeight: FontWeight.w600),
                      Icon(
                        CupertinoIcons.pencil_circle,
                        color: AppColorManager.grey,
                        size: AppHeightManager.h2point9,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppWidthManager.w3Point8,
              ),
              InkWell(
                onTap: () {
                  onDeleteTaped();
                },
                child: DecoratedContainer(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8,
                      vertical: AppHeightManager.h1),
                  width: AppWidthManager.w100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextWidget(
                          text: 'delete'.tr(),
                          fontSize: FontSizeManager.fs16,
                          color: AppColorManager.textAppColor,
                          fontWeight: FontWeight.w600),
                      Icon(
                        CupertinoIcons.delete,
                        color: AppColorManager.grey,
                        size: AppHeightManager.h2point9,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
