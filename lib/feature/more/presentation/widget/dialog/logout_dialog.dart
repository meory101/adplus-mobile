import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/storage/shared/shared_pref.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../../authentication/presentation/cubit/logout cubit/logout_cubit.dart';
import '../../../../authentication/presentation/cubit/logout cubit/logout_state.dart';
import '../../../../../core/injection/injection_container.dart' as di;

void showLogoutDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
          create: (context) => di.sl<LogoutCubit>(),
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
                    text: "logout".tr(),
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
                          text: "areYouSureYouWantToLogout".tr(),
                          fontWeight: FontWeight.w600,
                          fontSize: FontSizeManager.fs16,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                    ),
                        SizedBox(
                          height: AppHeightManager.h1point5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BlocConsumer<LogoutCubit, LogoutState>(
                                listener: (context, state) {
                                  if (state.status == CubitStatus.error) {
                                    NoteMessage.showErrorSnackBar(
                                        context: context, text: state.error);
                                  }
                                  if (state.status == CubitStatus.success) {
                                    AppSharedPreferences.clear();
                                    NoteMessage.showSuccessSnackBar(
                                        context: context,
                                        text: "youAreVisitorNow".tr());
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      RouteNamedScreens.mainBottomAppBar,
                                      (route) => false,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  if (state.status == CubitStatus.loading) {
                                    return ShimmerContainer(
                                        width: AppWidthManager.w40,
                                        height: AppHeightManager.h6);
                                  }
                                  return MainAppButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppWidthManager.w3Point8),
                                    borderRadius: BorderRadius.circular(
                                        AppRadiusManager.r10),
                                    height: AppHeightManager.h5,
                                    color: AppColorManager.mainColor,
                                    alignment: Alignment.center,
                                    child: AppTextWidget(
                                      text: "logout".tr(),
                                      fontSize: FontSizeManager.fs16,
                                      color: AppColorManager.white,
                                    ),
                                    onTap: () {
                                      context
                                          .read<LogoutCubit>()
                                          .logout(context: context);
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: MainAppButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppWidthManager.w3Point8),
                                borderRadius:
                                    BorderRadius.circular(AppRadiusManager.r10),
                                height: AppHeightManager.h5,
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
