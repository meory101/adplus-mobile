import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/image/main_image_widget.dart';

class AdvDetailsImagesSlider extends StatefulWidget {
  final AdvDetails? advDetails;
  const AdvDetailsImagesSlider({super.key,required this.advDetails});

  @override
  State<AdvDetailsImagesSlider> createState() => _AdvDetailsImagesSliderState();
}

class _AdvDetailsImagesSliderState extends State<AdvDetailsImagesSlider> {

  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider(
          disableGesture: true,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            aspectRatio:
            AppWidthManager.w92 / AppHeightManager.h50,
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: List.generate(
            widget.advDetails?.photos?.length ?? 0,
                (index) {
              return Container(
                  width: AppWidthManager.w92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppRadiusManager.r15)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MainImageWidget(
                    imageUrl: AppConstantManager.imageBaseUrl +
                        (widget.advDetails?.photos?[index].photo ?? ""),
                  ));
            },
          ),
        ),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
        DotsIndicator(
          dotsCount:  widget.advDetails?.photos?.length ?? 0,
          position: currentIndex,
          decorator: DotsDecorator(
            spacing: EdgeInsets.only(
                left: LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w1Point8
                    : 0,
                right:
                !LanguageHelper.checkIfLTR(context: context)
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
