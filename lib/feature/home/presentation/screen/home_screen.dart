
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/item_card.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';
import '../widget/home_banners.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Eng. Nour Othman(meory)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// meory12
List<List<SubCategory>> subCategories = [];
List<MainCategory> categories = [];

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

                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppWidthManager.w3Point8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          categories.length,
                          (index) {
                            return Visibility(
                              visible: subCategories[index].isNotEmpty,
                              child: Column(
                                children: [
                                  AppTextWidget(
                                      text: "${categories[index].name}",
                                      fontSize: FontSizeManager.fs15,
                                      color: AppColorManager.textAppColor,
                                      fontWeight: FontWeight.w600),
                                  subCategories[index].isEmpty
                                      ? SizedBox()
                                      : subCategories[index].length == 1
                                          ? ItemCard()
                                          : subCategories[index].length == 3
                                              ? const Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: ItemCard()),
                                                    Expanded(
                                                        flex: 1,
                                                        child: ItemCard()),
                                                    Expanded(
                                                        flex: 1,
                                                        child: ItemCard()),
                                                  ],
                                                )
                                              : Wrap(
                                                  children: List.generate(
                                                    subCategories[index].length,
                                                    (i) {
                                                      return Container(
                                                          margin: EdgeInsets.only(
                                                              right: 2),
                                                          height:
                                                              AppHeightManager
                                                                  .h20,
                                                          width: index % 3 == 0
                                                              ? MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /3
                                                              : MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width/2.6,
                                                          child: ItemCard(
                                                              imageUrl: AppConstantManager
                                                                      .imageBaseUrl +
                                                                  subCategories[
                                                                          index][i]
                                                                      .photo
                                                                      .toString()));
                                                    },
                                                  ),
                                                )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
