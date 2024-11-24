import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/delete_adv_cubit/delete_advertisement_state.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../advertisement/domain/entity/request/delete_adv_request_entity.dart';
import '../../../../advertisement/presentation/cubit/delete_adv_cubit/delete_advertisement_cubit.dart';
import '../../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../../../core/injection/injection_container.dart' as di;

void showDeleteAdDialog(
    {required BuildContext context,
    required AdData item,
    required Function() onSuccess}) {
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
          create: (context) => di.sl<DeleteAdvertisementCubit>(),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppRadiusManager.r10))),
            insetPadding: EdgeInsets.symmetric(
              horizontal: AppWidthManager.w4,
            ),
            elevation: 0,
            backgroundColor: AppColorManager.white,
            child: Padding(

              padding: EdgeInsets.only(
                  left: AppWidthManager.w4,
                  right: AppWidthManager.w4,
                  top: AppHeightManager.h3,
                  bottom: AppHeightManager.h3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextWidget(
                    text: "delete".tr(),
                    fontWeight: FontWeight.w600,
                    fontSize: FontSizeManager.fs18,
                    overflow: TextOverflow.visible,
                    color: AppColorManager.textAppColor,
                    textAlign: TextAlign.center,
                  ),
                  StatefulBuilder(builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextWidget(
                          color: AppColorManager.textAppColor,
                          text: "deleteAdvertisement".tr(),
                          fontWeight: FontWeight.w600,
                          fontSize: FontSizeManager.fs16,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: AppHeightManager.h1point5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocConsumer<DeleteAdvertisementCubit,
                                DeleteAdvertisementState>(
                              listener: (context, state) {
                                if (state.status == CubitStatus.error) {
                                  NoteMessage.showErrorSnackBar(
                                      context: context, text: state.error);
                                }
                                if (state.status == CubitStatus.success) {
                                  Navigator.of(context).pop();
                                  onSuccess();
                                }
                              },
                              builder: (context, state) {
                                if (state.status == CubitStatus.loading) {
                                  return const AppCircularProgressWidget(
                                    color: AppColorManager.red,
                                  );
                                }
                                return MainAppButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppWidthManager.w10),
                                  borderRadius:
                                      BorderRadius.circular(AppRadiusManager.r10),
                                  height: AppHeightManager.h5,
                                  width: AppWidthManager.w35,
                                  color: AppColorManager.red.withOpacity(0.9),
                                  alignment: Alignment.center,
                                  child: AppTextWidget(
                                    text: "delete".tr(),
                                    fontSize: FontSizeManager.fs16,
                                    color: AppColorManager.white,
                                  ),
                                  onTap: () {
                                    context
                                        .read<DeleteAdvertisementCubit>()
                                        .deleteAdvertisement(
                                            context: context,
                                            entity: DeleteAdvRequestEntity(
                                                itemId: item.itemId));
                                  },
                                );
                              },
                            ),
                            MainAppButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppWidthManager.w10),
                              borderRadius:
                                  BorderRadius.circular(AppRadiusManager.r10),
                              height: AppHeightManager.h5,
                              width: AppWidthManager.w35,
                              color: AppColorManager.white,
                              alignment: Alignment.center,
                              child: AppTextWidget(
                                text: "cancel".tr(),
                                fontSize: FontSizeManager.fs16,
                                color: AppColorManager.black,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  })
                ],
              ),
            ),
          ));
    },
  );
}
