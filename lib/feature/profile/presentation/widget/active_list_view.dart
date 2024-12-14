import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/dialog/edit_delete_ad_dialog.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/container/decorated_container.dart';
import '../../../../core/widget/drop_down/NameAndId.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../home/presentation/screen/advertisement_details_screen.dart';
import '../../../more/domain/entity/request/myitem_review_request_entiity.dart';
import '../../../more/presentation/cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_cubit.dart';
import '../../../more/presentation/cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_state.dart';
import '../../../more/presentation/screen/update_adv_screen.dart';
import '../../../more/presentation/widget/dialog/delete_ad_dialog.dart';
import '../../../more/presentation/widget/my_advs/adv_card.dart';

class ActiveListView extends StatelessWidget {
  const ActiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyitemReviewCubit, MyitemReviewState>(
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

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length + (state.isReachedMax == true ? 0 : 1),
          itemBuilder: (context, index) {
            if (index == items.length) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteNamedScreens.advertisementDetails,
                          arguments: AdvertisementDetailsArgs(
                              advertisement:
                                  AdData(itemId: items[index].itemId)))
                      .then(
                    (value) {
                      context.read<MyitemReviewCubit>().resetData();
                      context.read<MyitemReviewCubit>().myitemreview(
                          context: context,
                          entity: MyItemReviewRequestEntity());
                    },
                  );
                },
                child: DecoratedContainer(
                  height: AppHeightManager.h17,
                  color: AppColorManager.white,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  margin: EdgeInsets.only(
                      left: AppWidthManager.w3Point8,
                      right: AppWidthManager.w3Point8,
                      bottom: AppHeightManager.h1point8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppRadiusManager.r10)),
                        width: AppWidthManager.w35,
                        child: MainImageWidget(
                          imageUrl: AppConstantManager.imageBaseUrl +
                              (items[index].photos?.first.photo ?? ""),
                        ),
                      ),
                      SizedBox(
                        width: AppWidthManager.w3Point8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: AppHeightManager.h02,
                            ),
                            AppTextWidget(
                                text: items[index].name ?? "",
                                fontSize: FontSizeManager.fs16,
                                color: AppColorManager.textAppColor,
                                fontWeight: FontWeight.w700),
                            AppTextWidget(
                                text: items[index].description ?? "",
                                fontSize: FontSizeManager.fs15,
                                color: AppColorManager.textGrey,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: AppHeightManager.h2,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showEditDeleteAdDialog(
                              context: context,
                              onEditTaped: () {
                                Navigator.of(context)
                                    .pushNamed(RouteNamedScreens.updateAdvs,
                                        arguments:
                                            UpdateAdvArgs(data: items[index]))
                                    .then((value) {
                                  selectedIndex = 2;
                                  Navigator.of(context).pushReplacementNamed(
                                    RouteNamedScreens.mainBottomAppBar,
                                  );
                                });
                              },
                              onDeleteTaped: () {
                                showDeleteAdDialog(
                                    context: context,
                                    item: items[index],
                                    onSuccess: () {
                                      NoteMessage.showSuccessSnackBar(
                                          context: context,
                                          text: "successfullyDone".tr());

                                      selectedIndex = 2;
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                        RouteNamedScreens.mainBottomAppBar,
                                      );
                                    });
                              },
                            );
                          },
                          icon: Icon(Icons.more_vert))
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
