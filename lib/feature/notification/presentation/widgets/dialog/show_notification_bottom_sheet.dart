import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/container/shimmer_container.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../domain/entities/request/mark_read_notification_request_entity.dart';
import '../../../domain/entities/response/notifications_response_entity.dart';
import '../../cubit/mark_read_notification/mark_read_notification_cubit.dart';
import '../../../../../core/injection/injection_container.dart' as di;
import '../../cubit/mark_read_notification/mark_read_notification_state.dart';

void showNotificationBottomSheet(
    {required BuildContext context,
    required Function() onSuccess,
    required NotificationItem notificationItem}) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadiusManager.r5)),
    context: context,
    builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<MarkNotificationCubit>(),
          ),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppHeightManager.h2,
          ),
          width: AppWidthManager.w100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: AppHeightManager.h3,
              ),
              Divider(
                color: AppColorManager.dotGrey,
              ),
              SizedBox(
                height: AppHeightManager.h1,
              ),
              BlocConsumer<MarkNotificationCubit, MarkNotificationState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.error) {
                    NoteMessage.showErrorSnackBar(
                        context: context, text: state.error);
                  }
                  if (state.status == CubitStatus.success) {
                    onSuccess();
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return ShimmerContainer(
                      width: AppWidthManager.w100,
                      height: AppHeightManager.h6,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      context.read<MarkNotificationCubit>().readNotification(
                          context: context,
                          entity: MarkReadNotificationRequestEntity(
                              notificationId: notificationItem.notificationId));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: AppWidthManager.w100,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppWidthManager.w3Point8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_on_rounded,
                            color: AppColorManager.textGrey,
                          ),
                          SizedBox(width: AppWidthManager.w2,),
                          AppTextWidget(
                            text: "convertToReadNotification".tr(),
                            color: AppColorManager.textAppColor,
                            fontSize: FontSizeManager.fs16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: AppHeightManager.h1,
              ),
              Divider(
                color: AppColorManager.dotGrey,
              ),
              SizedBox(
                height: AppHeightManager.h3,
              ),
              MainAppButton(
                margin:
                    EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
                onTap: () {
                  Navigator.of(context).pop();
                },
                alignment: Alignment.center,
                width: AppWidthManager.w100,
                height: AppHeightManager.h6,
                color: AppColorManager.mainColor,
                child: AppTextWidget(
                  text: "close".tr(),
                  color: AppColorManager.white,
                  fontSize: FontSizeManager.fs16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
