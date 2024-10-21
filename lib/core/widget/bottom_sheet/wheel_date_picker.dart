import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/size_manager.dart';
import '../button/main_app_button.dart';
import '../text/app_text_widget.dart';


void showWheelDatePicker(
    {required BuildContext context,
      required Function(DateTime) onDateSelected}) {
  DateTime selectedDate = DateTime(DateTime.now().year - 12);
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColorManager.white,
    builder: (BuildContext builder) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadiusManager.r10),
          color: AppColorManager.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: AppHeightManager.h30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                color: AppColorManager.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w5),
                child: CupertinoDatePicker(

                  initialDateTime: DateTime(DateTime.now().year - 12),
                  onDateTimeChanged: (DateTime? pickedDate) {
                    if (pickedDate != null) {
                      selectedDate = pickedDate;
                    }
                  },
                  itemExtent: AppHeightManager.h5,

                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  minimumDate: DateTime(1950),
                  maximumDate: DateTime(DateTime.now().year - 12),
                ),
              ),
            ),
            SizedBox(
              height: AppHeightManager.h2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainAppButton(
                  width: MediaQuery.of(context).size.width / 2.6,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  height: AppHeightManager.h5,
                  onTap: () {
                    onDateSelected(selectedDate);
                    Navigator.of(context).pop();

                  },
                  color: AppColorManager.mainColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "save".tr(),
                    fontSize: FontSizeManager.fs16,
                    color: AppColorManager.white,
                  ),
                ),
                SizedBox(
                  width: AppWidthManager.w2,
                ),
                MainAppButton(
                  width: MediaQuery.of(context).size.width / 2.6,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  height: AppHeightManager.h5,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: AppColorManager.white,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "cancel".tr(),
                    fontSize: FontSizeManager.fs16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppHeightManager.h2,
            ),
          ],
        ),
      );
    },
  );
}






