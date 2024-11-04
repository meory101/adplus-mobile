import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/banners_cubit/banners_cubit.dart';
import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../domain/entity/response/banners_response_entity.dart';

/// Eng.Nour Othman(meory)*

class HomeBanners extends StatefulWidget {
  const HomeBanners({super.key});

  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit, BannersState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
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
                      imageUrl: "",
                    ))
              ]);
        }
        List<Banners>? banners = state.entity.data?.data;
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {

                },
                aspectRatio: AppWidthManager.w92 / AppHeightManager.h20,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1,
              ),
              items: List.generate(
                banners?.length ?? 0,
                (index) {
                  return Container(
                      width: AppWidthManager.w92,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppRadiusManager.r15)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MainImageWidget(
                        imageUrl: AppConstantManager.imageBaseUrl+(banners?[index].photo??"")
                      ));
                },
              ),
            ),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            DotsIndicator(
              dotsCount:  banners?.length ?? 0,
              position: selectedIndex,
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
      },
    );
  }
}
