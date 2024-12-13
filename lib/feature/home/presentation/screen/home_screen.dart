import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/banners_cubit/banners_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/category_inside_page_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../notification/domain/entities/request/notifications_request_entity.dart';
import '../../../notification/domain/entities/response/notifications_response_entity.dart';
import '../../../notification/presentation/cubit/notification/notification_cubit.dart';
import '../../../notification/presentation/cubit/notification/notification_state.dart';
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
          title: LanguageHelper.checkIfLTR(context: context)
              ? subcategories.first.enName ?? ""
              : subcategories.first.name ?? "",
          imagePath: subcategories.first.photo1 ?? "",
        ),
      );
    } else if (length == 2) {
      cards.add(StandardCard(
          index: 0,
          onTap: () {
            onCategoryTaped(subcategories.first);
          },
          title: LanguageHelper.checkIfLTR(context: context)
              ? subcategories.first.enName ?? ""
              : subcategories.first.name ?? "",
          imagePath: subcategories.first.photo1 ?? ""));
      cards.add(BigCard(
          index: 1,
          onTap: () {
            onCategoryTaped(subcategories.last);
          },
          title: LanguageHelper.checkIfLTR(context: context)
              ? subcategories.last.enName ?? ""
              : subcategories.last.name ?? "",
          imagePath: subcategories.last.photo1 ?? ""));
    } else if (length == 3) {
      for (int i = 0; i < length; i++) {
        cards.add(StandardCard(
          itemCount: 3,
          index: i,
          onTap: () {
            onCategoryTaped(subcategories[i]);
          },
          title: LanguageHelper.checkIfLTR(context: context)
              ? subcategories[i].enName ?? ""
              : subcategories[i].name ?? "",
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
              title: LanguageHelper.checkIfLTR(context: context)
                  ? subcategories[i].enName ?? ""
                  : subcategories[i].name ?? "",
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
                  title: LanguageHelper.checkIfLTR(context: context)
                      ? subcategories[i].enName ?? ""
                      : subcategories[i].name ?? "",
                  imagePath: subcategories[i].photo1 ?? "",
                ),
              )
            : cards.add(
                StandardCard(
                  index: i,
                  onTap: () {
                    onCategoryTaped(subcategories[i]);
                  },
                  title: LanguageHelper.checkIfLTR(context: context)
                      ? subcategories[i].enName ?? ""
                      : subcategories[i].name ?? "",
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
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<NotificationCubit>().resetData();
            context.read<NotificationCubit>().getMyNotifications(
                context: context, entity: NotificationsRequestEntity(page: 1));
            context.read<BannersCubit>().getHomeBanners(
                context: context, source: EnumManager.homeBannerSource);
            return context
                .read<GetCategoriesCubit>()
                .getCategories(context: context);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppHeightManager.h2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidthManager.w3Point8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextWidget(
                        text: LanguageHelper.checkIfLTR(context: context)
                            ? "Mzad Damascus"
                            : "مزاد دمشق",
                        fontSize: FontSizeManager.fs18,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.mainColor,
                      ),
                      SizedBox(
                        width: AppWidthManager.w3Point8,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: AppHeightManager.h1),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RouteNamedScreens.search);
                              },
                              child: SvgPicture.asset(
                                AppIconManager.search,
                                colorFilter: const ColorFilter.mode(
                                    AppColorManager.mainColor, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppWidthManager.w3Point8,
                          ),
                          Visibility(
                            visible: AppSharedPreferences.getToken().isNotEmpty,
                            child: BlocConsumer<NotificationCubit,
                                    NotificationState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if (state.status == CubitStatus.loading) {
                                    return Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(
                                          top: AppHeightManager.h1),
                                      child: ShimmerContainer(
                                          boxShape: BoxShape.circle,
                                          width: AppWidthManager.w7,
                                          height: AppWidthManager.w7),
                                    ));
                                  }
                                  return InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(
                                                RouteNamedScreens.notifications)
                                            .then(
                                          (value) {
                                            context
                                                .read<NotificationCubit>()
                                                .resetData();
                                            context
                                                .read<NotificationCubit>()
                                                .getMyNotifications(
                                                    context: context,
                                                    entity:
                                                        NotificationsRequestEntity(
                                                            page: 1));
                                          },
                                        );
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: AppHeightManager.h5point8,
                                          child: Stack(children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: AppHeightManager.h1),
                                              child: SvgPicture.asset(
                                                AppIconManager.notification,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        AppColorManager
                                                            .mainColor,
                                                        BlendMode.srcIn),
                                              ),
                                            ),
                                            Visibility(
                                              visible: (state.entity.data?.pagination?.totalItems??0) > 0,
                                              child: Positioned(
                                                right: AppWidthManager.w1Point5,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          AppHeightManager.h4),
                                                  child: CircleAvatar(
                                                      radius:
                                                          AppRadiusManager.r8,
                                                      backgroundColor:
                                                          AppColorManager.red,
                                                      child: AppTextWidget(
                                                          color: AppColorManager
                                                              .white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              FontSizeManager
                                                                  .fs14,
                                                          text:
                                                              "${state.entity.data?.pagination?.totalItems}")),
                                                ),
                                              ),
                                            ),
                                          ])));
                                }),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppHeightManager.h2,
                ),
                HomeBanners(
                  source: EnumManager.homeBannerSource,
                ),
                SizedBox(
                  height: AppHeightManager.h3,
                ),
                BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state.status == CubitStatus.loading) {
                        return SizedBox(
                            height: AppHeightManager.h50,
                            child: const Center(
                                child: AppCircularProgressWidget()));
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
                                      bottom: AppHeightManager.h1point8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: AppHeightManager.h1),
                                        color: AppColorManager.lightGreyOpacity6
                                            .withOpacity(0.4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppTextWidget(
                                                text: LanguageHelper.checkIfLTR(
                                                        context: context)
                                                    ? categories[index]
                                                            .enName ??
                                                        ""
                                                    : categories[index].name ??
                                                        "",
                                                fontSize: FontSizeManager.fs17,
                                                color:
                                                    AppColorManager.mainColor,
                                                fontWeight: FontWeight.w700),
                                            AppTextWidget(
                                                text:
                                                    '${(categories[index].itemsCount ?? "0").toString()} ${'advertisement'.tr()}',
                                                fontSize: FontSizeManager.fs16,
                                                color: AppColorManager.textGrey,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                      ),
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
      ),
    );
  }
}
