import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';
import '../widget/home_banners.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/newest_items_grid_view.dart';

/// Eng.Nour Othman(meory)*

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// meory
List<List<SubCategory>> subCategories = [];
List<GlobalKey> columnKey = [];
List<Category> categories =[];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppHeightManager.h3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidthManager.w3Point8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                            text: "Hi Nour!",
                            fontSize: FontSizeManager.fs17,
                            color: AppColorManager.textAppColor,
                            fontWeight: FontWeight.w700),
                        SizedBox(
                          width: AppWidthManager.w2,
                        ),
                        AppTextWidget(
                            text: "Welcome to Mzad Damascus.",
                            fontSize: FontSizeManager.fs15,
                            color: AppColorManager.textAppColor,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIconManager.notification,
                          colorFilter: const ColorFilter.mode(
                              AppColorManager.mainColor, BlendMode.srcIn),
                        ),
                        SizedBox(
                          width: AppWidthManager.w3Point8,
                        ),
                        SvgPicture.asset(
                          AppIconManager.search,
                          colorFilter: const ColorFilter.mode(
                              AppColorManager.mainColor, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppHeightManager.h2,
              ),
              const HomeBanners(),
              SizedBox(
                height: AppHeightManager.h3,
              ),
              BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return const Center(
                        child: AppCircularProgressWidget(),
                      );
                    }
                    categories = state.entity.data ?? [];

                    categories.forEach(
                      (category) {
                        subCategories.add(category.children ?? []);
                      },
                    );
                    columnKey = List.generate(categories.length, (index) {
                      return GlobalKey();
                    });

                    return

                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppWidthManager.w3Point8),
                          child: AppTextWidget(
                              text: "Discover Categories",
                              fontSize: FontSizeManager.fs16,
                              color: AppColorManager.textAppColor,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: AppHeightManager.h1point8,
                        ),
                        SizedBox(
                          height: AppHeightManager.h45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Scrollable.ensureVisible(
                                      curve: Curves.ease,
                                      duration: const Duration(seconds: 1),
                                      columnKey[index].currentContext!);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      width: AppHeightManager.h27,
                                      height: AppHeightManager.h35,
                                      margin: EdgeInsets.only(
                                          right: !LanguageHelper.checkIfLTR(
                                                  context: context)
                                              ? AppWidthManager.w3Point8
                                              : index == 9
                                                  ? AppWidthManager.w3Point8
                                                  : 0,
                                          left: LanguageHelper.checkIfLTR(
                                                  context: context)
                                              ? AppWidthManager.w3Point8
                                              : index == 0
                                                  ? AppWidthManager.w3Point8
                                                  : 0),
                                      decoration: BoxDecoration(
                                        color: AppColorManager.white,
                                        borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r20,
                                        ),
                                      ),
                                      child: MainImageWidget(
                                        height: AppHeightManager.h35,
                                        imageUrl:
                                            "${AppConstantManager.imageBaseUrl}${categories[index].photo ?? ""}",
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                          vertical: AppWidthManager.w3Point8),
                                      width: AppHeightManager.h27,
                                      height: AppHeightManager.h4,
                                      decoration: BoxDecoration(
                                        color: AppColorManager.white,
                                        borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r10,
                                        ),
                                      ),
                                      child: AppTextWidget(
                                        text: LanguageHelper.checkIfLTR(
                                                context: context)
                                            ? categories[index].name ?? ""
                                            : categories[index].name ?? "",
                                        color: AppColorManager.textAppColor,
                                        fontSize: FontSizeManager.fs16,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Column(
                          children: List.generate(
                            categories.length,
                                (index) {
                              return Column(
                                  key: columnKey[index], children:[ NewestItemsGridView()]);
                            },
                          ),
                        )
                      ],
                    );
                  }),


              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: AppWidthManager.w3Point8,
              //   ),
              //   child: BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
              //     listener: (context, state) {},
              //     builder: (context, state) {
              //       if (state.status == CubitStatus.loading) {
              //         return Center(
              //           child: AppCircularProgressWidget(),
              //         );
              //       }
              //       return NewestItemsGridView();
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
