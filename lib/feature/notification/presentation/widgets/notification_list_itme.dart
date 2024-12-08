import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/app/app.dart';
import '../../../../core/helper/language_helper.dart';
import 'dart:ui' as ui;
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class NotificationListItem extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final void Function()? onTap;

  const NotificationListItem({
    super.key,
    required this.title,
    required this.body,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppHeightManager.h1point8,
          bottom: AppHeightManager.h1point8,
          left: AppWidthManager.w3Point8, right: AppWidthManager.w3Point8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppWidthManager.w3Point8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: "notificationContent".tr(),
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizeManager.fs16,
                  color: AppColorManager.textAppColor,
                ),
                SizedBox(
                  height: AppHeightManager.h1,
                ),
                Directionality(
                  textDirection: LanguageHelper.isEnglishData(
                          context: context, data: body ?? "")
                      ? ui.TextDirection.ltr
                      : ui.TextDirection.rtl,
                  child: AppTextWidget(
                    text: body,
                    maxLines: 1,
                    fontSize: FontSizeManager.fs15,
                    overflow: TextOverflow.ellipsis,
                    color: AppColorManager.textAppColor,
                  ),
                ),
                SizedBox(
                  height: AppHeightManager.h05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: AppTextWidget(
                        text: time,
                        fontSize: FontSizeManager.fs13,
                        color: AppColorManager.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppWidthManager.w3Point8,
          ),
        ],
      ),
    );
  }
}
