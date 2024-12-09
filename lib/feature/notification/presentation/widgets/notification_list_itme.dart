import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/response/notifications_response_entity.dart';
import 'package:mzad_damascus/feature/notification/presentation/widgets/dialog/show_notification_bottom_sheet.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/helper/date_time_helper.dart';
import '../../../../core/helper/language_helper.dart';
import 'dart:ui' as ui;
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class NotificationListItem extends StatelessWidget {
  final NotificationItem notificationItem;

  const NotificationListItem({
    super.key,
    required this.notificationItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppWidthManager.w3Point8, right: AppWidthManager.w3Point8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Directionality(
                textDirection: ui.TextDirection.ltr,
                child: AppTextWidget(
                  text: DateTimeHelper.formatDateMonthDayYear(
                      date: notificationItem.createdAt ?? ""),
                  fontSize: FontSizeManager.fs14,
                  color: AppColorManager.grey,
                ),
              ),
              IconButton(
                  onPressed: () {
                    showNotificationBottomSheet(
                        context: context,
                        onSuccess: () {
                          NoteMessage.showSuccessSnackBar(
                              context: context,
                              text: "readNotificationSuccessfully".tr());
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed(
                              RouteNamedScreens.notifications);
                        },
                        notificationItem: notificationItem);
                  },
                  icon: Icon(
                    Icons.more_horiz,
                    color: AppColorManager.grey,
                    size: AppWidthManager.w9,
                  ))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  MainImageWidget(
                    height: AppHeightManager.h7,
                    width: AppHeightManager.h7,
                    borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                    imagePath: AppImageManager.splash,
                    // imageUrl: AppConstantManager.imageBaseUrl + (photo),
                  ),
                  Visibility(
                    visible: notificationItem.isRead == 0,
                    child: CircleAvatar(
                      radius: AppRadiusManager.r5,
                      backgroundColor: AppColorManager.red,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: AppWidthManager.w3Point8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: LanguageHelper.isEnglishData(
                              context: context,
                              data: notificationItem.message ?? "")
                          ? ui.TextDirection.ltr
                          : ui.TextDirection.rtl,
                      child: AppTextWidget(
                        text: notificationItem.message ?? "",
                        maxLines: 3,
                        fontSize: FontSizeManager.fs16,
                        overflow: TextOverflow.ellipsis,
                        color: AppColorManager.textAppColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: AppWidthManager.w3Point8,
              ),
            ],
          ),
          Divider(
            color: AppColorManager.dotGrey,
          )
        ],
      ),
    );
  }
}
