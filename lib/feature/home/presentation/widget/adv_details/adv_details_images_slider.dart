import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../home/dialog/show_dialog_image.dart';

class AdvDetailsImagesSlider extends StatefulWidget {
  final AdvDetails? advDetails;

  const AdvDetailsImagesSlider({super.key, required this.advDetails});

  @override
  State<AdvDetailsImagesSlider> createState() => _AdvDetailsImagesSliderState();
}

class _AdvDetailsImagesSliderState extends State<AdvDetailsImagesSlider> {
  int currentIndex = 0;
  CarouselSliderController controller = CarouselSliderController();

  @override
  void dispose() {
    controller = CarouselSliderController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (widget.advDetails?.photos ?? []).isNotEmpty,
      replacement: MainImageWidget(
        width: AppWidthManager.w100,
        height: AppHeightManager.h27,
        imageUrl: "ldl",
      ),
      child: Column(
        children: [
          CarouselSlider(
            disableGesture: true,
            carouselController: controller,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              aspectRatio: AppWidthManager.w100 / AppHeightManager.h27,
              enableInfiniteScroll: true,
              autoPlay: false,
              viewportFraction: 1,
            ),
            items: List.generate(
              widget.advDetails?.photos?.length ?? 0,
              (index) {
                return Stack(
                  children: [
                    InkWell(
                      onLongPress: () {
                        showDialogImage(
                            context: context,
                            url: (widget.advDetails?.photos?[index].photo ??
                                ""));
                      },
                      child: Container(
                          color: AppColorManager.lightGreyOpacity6,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppWidthManager.w100,
                                  height: AppWidthManager.w70,
                                  child: MainImageWidget(
                                    width: AppWidthManager.w100,
                                    height: AppWidthManager.w70,
                                    fit: BoxFit.fill,
                                    imageUrl: AppConstantManager.imageBaseUrl +
                                        (widget.advDetails?.photos?[index]
                                                .photo ??
                                            ""),
                                  ),
                                )
                              ])),
                    ),
                    Positioned(
                        left: 10,
                        top: AppHeightManager.h1,
                        child: InkWell(
                          onTap: () async {
                            String result = widget.advDetails?.name ??
                                "".replaceAll(RegExp(' '), '-');
                            final urlPreview =
                                "https://mazaddimashq.com/adv/${widget.advDetails?.itemId}/$result";
                            await Share.share(
                                'Share this $result ! •\n\n$urlPreview');
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColorManager.mainColor,
                            child: Icon(
                              Icons.share,
                              size: AppWidthManager.w5,
                              color: AppColorManager.white,
                            ),
                          ),
                        )),
                    Positioned(
                        right: 10,
                        top: AppHeightManager.h11,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = selectedIndex +
                                  (LanguageHelper.checkIfLTR(context: context)
                                      ? 1
                                      : -1);
                            });
                            controller.animateToPage(selectedIndex);
                          },
                          child: Center(
                            child: Icon(
                              LanguageHelper.checkIfLTR(context: context)
                                  ? Icons.arrow_forward_ios
                                  : Icons.arrow_back_ios,
                              size: AppWidthManager.w10,
                              color: AppColorManager.mainColor,
                            ),
                          ),
                        )),
                    Positioned(
                      left: 10,
                      top: AppHeightManager.h11,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = selectedIndex +
                                (!LanguageHelper.checkIfLTR(context: context)
                                    ? 1
                                    : -1);
                          });
                          controller.animateToPage(selectedIndex);
                        },
                        child: Center(
                          child: Icon(
                            LanguageHelper.checkIfLTR(context: context)
                                ? Icons.arrow_back_ios
                                : Icons.arrow_forward_ios,
                            size: AppWidthManager.w10,
                            color: AppColorManager.mainColor,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: AppHeightManager.h1point8,
          ),
          // Visibility(
          //   visible: (widget.advDetails?.photos?.length ?? 0) > 1,
          //   child: DotsIndicator(
          //     dotsCount: widget.advDetails?.photos?.length ?? 1,
          //     position: currentIndex,
          //     decorator: DotsDecorator(
          //       spacing: EdgeInsets.only(
          //           left: LanguageHelper.checkIfLTR(context: context)
          //               ? AppWidthManager.w1Point8
          //               : 0,
          //           right: !LanguageHelper.checkIfLTR(context: context)
          //               ? AppWidthManager.w1Point8
          //               : 0),
          //       activeShape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(
          //           AppRadiusManager.r10,
          //         ),
          //       ),
          //       activeSize: Size(
          //         AppWidthManager.w6,
          //         AppHeightManager.h08,
          //       ),
          //       size: Size(
          //         AppWidthManager.w1Point5,
          //         AppWidthManager.w1Point5,
          //       ),
          //       activeColor: AppColorManager.mainColor,
          //       color: AppColorManager.borderGrey,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: AppHeightManager.h2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: AppWidthManager.w2,
                  mainAxisSpacing: AppWidthManager.w2),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.animateToPage(selectedIndex);
                  },
                  child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppRadiusManager.r3)),
                      height: AppHeightManager.h6,
                      width: AppHeightManager.h6,
                      child: MainImageWidget(
                        imageUrl: AppConstantManager.imageBaseUrl +
                            (widget.advDetails?.photos?[index].photo ?? ""),
                      )),
                );
              },
              itemCount: widget.advDetails?.photos?.length ?? 0,
            ),
          )
        ],
      ),
    );
  }
}
