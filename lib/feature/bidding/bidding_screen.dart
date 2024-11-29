import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';

import '../../core/helper/language_helper.dart';

class BiddingScreen extends StatefulWidget {
  const BiddingScreen({super.key});

  @override
  State<BiddingScreen> createState() => _BiddingScreenState();
}

class _BiddingScreenState extends State<BiddingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppHeightManager.h2,),

        SizedBox(
          height: AppHeightManager.h40,
          child: MainImageWidget(
            fit: BoxFit.cover,
            imagePath: AppImageManager.rocket,
          ),
        ),
            SizedBox(height: AppHeightManager.h2,),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          width: MediaQuery.of(context).size.width,
          height: AppHeightManager.h2point5,
          decoration: BoxDecoration(
            color: AppColorManager.borderGrey,
            borderRadius: BorderRadius.circular(AppRadiusManager.r20),
          ),
          child: Align(
            alignment:
            LanguageHelper.checkIfLTR(context: context)?
            Alignment.topLeft :  Alignment.topRight,
            child: Container(
              width:AppWidthManager.w40,
              decoration: BoxDecoration(
                color:  AppColorManager.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

            ),
            SizedBox(height: AppHeightManager.h1point8,),
            AppTextWidget(text: "Bidding Coming Soon..",
              textAlign: TextAlign.center,
              color: AppColorManager.textAppColor,
              fontSize: FontSizeManager.fs20,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
