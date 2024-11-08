import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/size_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../../../core/widget/image/main_image_widget.dart';

/// Eng.Nour Othman(meory)*

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {},
              aspectRatio: AppWidthManager.w92 / AppHeightManager.h20,
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 1,
            ),
            items: [
              Container(
                  width: AppWidthManager.w92,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppRadiusManager.r15)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MainImageWidget(
                      height: AppHeightManager.h10,
                      imagePath: AppImageManager.splash))
            ]),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
        DotsIndicator(
          dotsCount: 2,
          position: 1,
          decorator: DotsDecorator(
            spacing: EdgeInsets.only(
                left: LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w1Point8
                    : 0,
                right: !LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w1Point8
                    : 0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppRadiusManager.r10,
              ),
            ),
            activeSize: Size(
              AppWidthManager.w6,
              AppHeightManager.h08,
            ),
            size: Size(
              AppWidthManager.w1Point5,
              AppWidthManager.w1Point5,
            ),
            activeColor: AppColorManager.mainColor,
            color: AppColorManager.borderGrey,
          ),
        ),
      ],
    );
  }
}
