import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/dialog_container.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../widget/advertisement_app_bar.dart';
import '../widget/advertisement_next_button.dart';



class AdvertisementScreen extends StatefulWidget {
  const AdvertisementScreen({super.key});

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {
        },
      ),
      body:
      DialogContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(
                completePercent: 0,
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              AppTextWidget(
                  text: "Choose city",
                  fontSize: FontSizeManager.fs16,
                  color: AppColorManager.textAppColor,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: AppHeightManager.h1point8,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
