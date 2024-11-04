import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/category_inside_page_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';
import '../widget/home/big_card.dart';
import '../widget/home/full_width_card.dart';
import '../widget/home/home_banners.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/home/standard_card.dart';

/// Eng. Nour Othman(meory)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MainCategory> categories = [];

  List<Widget> generateCards(List<SubCategory> subcategories) {
    List<Widget> cards = [];
    int length = subcategories.length;
    if (length == 1) {
      cards.add(
        FullWidthCard(
          onTap: () {
            onCategoryTaped(subcategories.first);
          },
          title:
          LanguageHelper.checkIfLTR(context: context)?
          subcategories.first.enName ?? "" : subcategories.first.name ?? "",
          imagePath: subcategories.first.photo1 ?? "",

        ),
      );
    } else if (length == 2) {
      cards.add(StandardCard(
          index: 0,
          onTap: () {
            onCategoryTaped(subcategories.first);
          },
          title:
          LanguageHelper.checkIfLTR(context: context)?
          subcategories.first.enName ?? "" : subcategories.first.name ?? "",
          imagePath: subcategories.first.photo1 ?? ""));
      cards.add(BigCard(
          index: 1,
          onTap: () {
            onCategoryTaped(subcategories.last);
          },
          title:
          LanguageHelper.checkIfLTR(context: context)?
          subcategories.last.enName ?? "" : subcategories.last.name ?? "",
          imagePath: subcategories.last.photo1 ?? ""));
    } else if (length == 3) {

      for (int i = 0; i < length; i++) {
        cards.add(StandardCard(
          itemCount: 3,
          index: i,
          onTap: () {
            onCategoryTaped(subcategories[i]);
          },
          title:
          LanguageHelper.checkIfLTR(context: context)?
          subcategories[i].enName ?? "" : subcategories[i].name ?? "",
          imagePath: subcategories[i].photo1 ?? "",
        ));
      }
    } else if (length > 3) {
      for (int i = 0; i < length; i++) {
        if (length % 2 != 0 && i == length - 1) {
          cards.add(
            FullWidthCard(
              onTap: () {
                onCategoryTaped(subcategories[i]);
              },
              title:
              LanguageHelper.checkIfLTR(context: context)?
              subcategories[i].enName ?? "" : subcategories[i].name ?? "",
              imagePath: subcategories[i].photo1 ?? "",
            ),
          );
          return cards;
        }
        i % 3 == 0
            ? cards.add(
          BigCard(
            index: i,
            onTap: () {
              onCategoryTaped(subcategories[i]);
            },
            title:
            LanguageHelper.checkIfLTR(context: context)?
            subcategories[i].enName ?? "" : subcategories[i].name ?? "",
            imagePath: subcategories[i].photo1 ?? "",
          ),
        )
            : cards.add(
          StandardCard(
            index: i,
            onTap: () {
              onCategoryTaped(subcategories[i]);
            },
            title:
            LanguageHelper.checkIfLTR(context: context)?
            subcategories[i].enName ?? "" : subcategories[i].name ?? "",
            imagePath: subcategories[i].photo1 ?? "",
          ),
        );
      }
    }

    return cards;
  }

  onCategoryTaped(SubCategory subCategory) {
    Navigator.of(context).pushNamed(RouteNamedScreens.categoryInsidePage,
        arguments: CategoryInsidePageArgs(subCategory: subCategory));
  }

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
                      return SizedBox(
                          height: AppHeightManager.h50,
                          child:
                          const Center(child: AppCircularProgressWidget()));
                    }
                    categories = state.entity.data ?? [];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppWidthManager.w3Point8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          categories.length,
                              (index) {
                            List<SubCategory> subCategories =
                                categories[index].children ?? [];
                            List<Widget> cards = generateCards(subCategories);
                            return Visibility(
                              visible: cards.isNotEmpty,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: AppHeightManager.h1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextWidget(
                                        text: LanguageHelper.checkIfLTR(
                                            context: context)
                                            ? categories[index].enName ??"--" : categories[index].name??"--",
                                        fontSize: FontSizeManager.fs15,
                                        color: AppColorManager.textAppColor,
                                        fontWeight: FontWeight.w700),
                                    SizedBox(
                                      height: AppHeightManager.h1point8,
                                    ),
                                    Wrap(
                                      children: cards,
                                    )
                                  ],
                                ),
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
