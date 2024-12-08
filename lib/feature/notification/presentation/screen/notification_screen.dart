import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/date_time_helper.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/request/notifications_request_entity.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/response/notifications_response_entity.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/widget/app_bar/main_app_bar.dart';
import '../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
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
    print('hereeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    context.read<NotificationCubit>().getMyNotifications(
        context: context, entity: NotificationsRequestEntity(page: 1));
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
            NoteMessage.showErrorSnackBar(context: context, text: state.error);
          }
        }, builder: (context, state) {
          if (state.status == CubitStatus.loading &&
              state.entity.data?.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if ((state.entity.data?.data ?? []).isEmpty) {
            return Text('f');
          }
          List<NotificationItem>? notifications = state.entity.data?.data ?? [];
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if((notifications[index].itemId ?? "").toString().isEmpty){
                    return;
                  }
                  Navigator.of(context).pushNamed(
                      RouteNamedScreens.advertisementDetails,
                      arguments: AdvertisementDetailsArgs(
                          advertisement:
                              AdData(itemId: notifications[index].itemId)));
                },
                child: NotificationListItem(
                    title: notifications[index].message ?? "",
                    body: notifications[index].message ?? "",
                    time: DateTimeHelper.formatDateMonthDayYear(
                        date: notifications[index].createdAt ?? "")),
              );
            },
          );
        }));
  }
}
