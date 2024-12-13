import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/date_time_helper.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/request/notifications_request_entity.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/response/notifications_response_entity.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/app_bar/main_app_bar.dart';
import '../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../cubit/notification/notification_cubit.dart';
import '../cubit/notification/notification_state.dart';
import '../widgets/notification_list_itme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    initScroll();
    super.initState();
  }

  initScroll() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          initNotifications();
        }
      },
    );
  }

  initNotifications() {
    context.read<NotificationCubit>().getMyNotifications(
        context: context, entity: NotificationsRequestEntity());
  }

  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "notifications".tr(),
      ),
      body: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            NoteMessage.showErrorSnackBar(
                context: context, text: state.error);
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loading &&
              state.entity.data?.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          List<NotificationItem>? notifications =
              state.entity.data?.data ?? [];

          if (notifications.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(
                    text: "noNotifications".tr(),
                    fontSize: FontSizeManager.fs18,
                    fontWeight: FontWeight.w700,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppHeightManager.h05,
                  ),
                  AppTextWidget(
                    text: "youDon’tHaveAnyNotificationsYet".tr(),
                    fontSize: FontSizeManager.fs16,
                    fontWeight: FontWeight.w400,
                    color: AppColorManager.grey,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            controller: scrollController,
            itemCount: notifications.length + (state.isReachedMax == true ? 0 : 1),
            itemBuilder: (context, index) {
              if (index == notifications.length) {
                return Center(
                    child: state.status == CubitStatus.error
                        ? const SizedBox()
                        : const CircularProgressIndicator());
              } else {
                return InkWell(
                    onTap: () {
                      if ((notifications[index].item?.itemId ?? "")
                          .toString()
                          .isEmpty) {
                        return;
                      }
                      Navigator.of(context).pushNamed(
                          RouteNamedScreens.advertisementDetails,
                          arguments: AdvertisementDetailsArgs(
                              advertisement: AdData(
                                  itemId: notifications[index].item?.itemId)));
                    },
                    child: NotificationListItem(
                      notificationItem: notifications[index],
                    ));
              }
            },
          );
        },
      ),
    );
  }
}
