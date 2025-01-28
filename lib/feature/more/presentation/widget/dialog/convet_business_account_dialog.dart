import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/file_helper.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/convert_business_account_cubit/convert_business_account_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/convert_business_account_cubit/convert_business_account_state.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../core/injection/injection_container.dart' as di;

void showBusinessAccountDialog(
    {required BuildContext context, required Function() onSuccess}) {
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
          create: (context) => di.sl<ConvertBusinessAccountCubit>(),
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
                    text: "businessAccount".tr(),
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
                          text: "businessAccountText".tr(),
                          fontWeight: FontWeight.w600,
                          fontSize: FontSizeManager.fs16,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: AppHeightManager.h1point5,
                        ),
                        BlocConsumer<ConvertBusinessAccountCubit,
                                ConvertBusinessAccountState>(
                            listener: (context, state) {
                          if (state.status == CubitStatus.error) {
                            NoteMessage.showErrorSnackBar(
                                context: context, text: state.error);
                          }
                          if (state.status == CubitStatus.success) {
                            NoteMessage.showSuccessSnackBar(
                                context: context,
                                text: "uploadedSuccessfully".tr());
                            Navigator.of(context).pop();
                          }
                        }, builder: (context, state) {
                          if (state.status == CubitStatus.loading) {
                            return const AppCircularProgressWidget();
                          }
                          return MainAppButton(
                            onTap: () async {
                              File? file = await FileHelper.getFile();
                              if (file == null) return;
                              if (FileHelper.getFileExtension(
                                  fileName:
                                  FileHelper.getFileName(file: file)) ==
                                  'pdf') {
                                context
                                    .read<ConvertBusinessAccountCubit>()
                                    .convertToBusinessAccount(
                                    context: context, file: file);

                                return;
                              }
                              NoteMessage.showErrorSnackBar(
                                  context: context, text: "mustBePdfFile".tr());
                            },

                            padding: EdgeInsets.symmetric(
                                horizontal: AppWidthManager.w10),
                            borderRadius:
                                BorderRadius.circular(AppRadiusManager.r10),
                            height: AppHeightManager.h5,

                            color: AppColorManager.mainColor,
                            alignment: Alignment.center,
                            child: AppTextWidget(
                              text: "chooseFile&Upload".tr(),
                              fontSize: FontSizeManager.fs16,
                              color: AppColorManager.white,
                            ),
                          );
                        }),
                        SizedBox(
                          height: AppHeightManager.h1point5,
                        ),
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
