import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/presentation/widget/my_advs/adv_card.dart';

import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/empty/empty_widget.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../domain/entity/request/myitem_review_request_entiity.dart';
import '../../cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_cubit.dart';
import '../../cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_state.dart';

class ActiveAdvListView extends StatelessWidget {
  const ActiveAdvListView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<MyitemReviewCubit, MyitemReviewState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error && state.error.isNotEmpty) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading &&
            state.entity.data?.data == null) {
          return const Center(child: CircularProgressIndicator());
        }


        final items = state.entity.data?.data ?? [];

        if (items.isEmpty) {
          return  EmptyWidget(
            title: "noAdvertisements".tr(),
            subTitle: "noAdvertisements".tr(),

          );
        }

        return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (((state.status != CubitStatus.loading) ||
                      state.status != CubitStatus.loadMore) &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                context.read<MyitemReviewCubit>().myitemreview(
                    context: context, entity: MyItemReviewRequestEntity());
              }
              return true;
            },
            child: ListView.builder(

              padding: EdgeInsets.all(AppWidthManager.w3Point8),
              itemCount:     items.length + (state.isReachedMax==true ? 0 : 1),
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return AdvCard(item: items[index]);
                }
              },
            ));
      },
    );
  }
}
