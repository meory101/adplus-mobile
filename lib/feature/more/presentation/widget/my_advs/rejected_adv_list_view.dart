import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/empty/empty_widget.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/rejected_ads_cubit/rejected_ads_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/rejected_ads_cubit/rejected_ads_state.dart';

import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../domain/entity/request/myitem_request_entity.dart';
import 'adv_card.dart';

class RejectedAdvListView extends StatelessWidget {
  const RejectedAdvListView({super.key});

  @override
  Widget build(BuildContext context) {
         return BlocConsumer<RejectedAdsCubit, RejectedAdsState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error && state.error.isNotEmpty) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
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
                context.read<RejectedAdsCubit>().getRejectedAds(
                    context: context, entity: MyItemRequestEntity());
              }
              return true;
            },
            child: ListView.builder(
              padding: EdgeInsets.all(AppWidthManager.w3Point8),
              itemCount: items.length + (state.isReachedMax == true ? 0 : 1),
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
