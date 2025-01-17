import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/empty/empty_widget.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/category_inside_page_shimmer.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/inside_page_category_advs_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/category_inside_page/companies_accounts_list_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/home/home_banners.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/inside_page_advs/dialog/showAttributeListCheckBox.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';

void clearFilter() {
  FilterRequest.entity = AdvsByAttributeRequestEntity();
  FilterRequest.entity.attributes = [];
  selectedAttributeMap = {};
}

class CategoryInsidePageScreen extends StatefulWidget {
  final CategoryInsidePageArgs args;

  const CategoryInsidePageScreen({super.key, required this.args});

  @override
  State<CategoryInsidePageScreen> createState() =>
      _CategoryInsidePageScreenState();
}

class _CategoryInsidePageScreenState extends State<CategoryInsidePageScreen> {
  @override
  void initState() {
    getCategoryInsidePage();
    super.initState();
  }

  getCategoryInsidePage() async {
    context.read<CategoryInsidePageCubit>().getCategoryInsidePage(
        context: context,
        entity: CategoryInsidePageRequestEntity(
            categoryId: widget.args.subCategory.categoryId));
  }

  AdvsByAttributeRequestEntity entity = AdvsByAttributeRequestEntity();
  CategoryAttributes? currentInsidePageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          title: LanguageHelper.checkIfLTR(context: context)
              ? widget.args.subCategory.enName ?? ""
              : widget.args.subCategory.name ?? ""),
      body: BlocConsumer<CategoryInsidePageCubit, CategoryInsidePageState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            NoteMessage.showErrorSnackBar(context: context, text: state.error);
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const CategoryInsidePageShimmer();
          }

          List<CategoryAttributes>? insidePageData = state.entity.data ?? [];
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeBanners(
                    source: EnumManager.insidePageBannerSource,
                  ),
                  SizedBox(
                    height: AppHeightManager.h3,
                  ),
                  Visibility(
                    visible: insidePageData.isNotEmpty,
                    replacement: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppHeightManager.h10),
                        child: SizedBox()),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: insidePageData.length,
                      itemBuilder: (context, index) {
                        List<AttributeTypeList> attributeTypeList =
                            insidePageData[index].attributeTypeList ?? [];

                        List<AttributeTypeList> searchDropDown =
                            insidePageData[index].attributeTypeList ?? [];
                        currentInsidePageData = insidePageData[index];

                        return Visibility(
                          visible: attributeTypeList.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppWidthManager.w100,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: AppColorManager.dotGrey))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        AppTextWidget(
                                          text: LanguageHelper.checkIfLTR(
                                                  context: context)
                                              ? insidePageData[index]
                                                      .attributeNameEn ??
                                                  ""
                                              : insidePageData[index]
                                                      .attributeName ??
                                                  "",
                                          fontSize: FontSizeManager.fs17,
                                          fontWeight: FontWeight.w700,
                                          color: AppColorManager.mainColor,
                                        ),
                                        SizedBox(
                                          height: AppHeightManager.h1,
                                        ),
                                        Container(
                                          width: AppWidthManager.w20,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 3,
                                                      color: AppColorManager
                                                          .subColor))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppHeightManager.h2,
                              ),
                              Visibility(
                                visible: insidePageData[index].star == 0,
                                child: TypeAheadField(
                                  onSelected: (value) {
                                    int selectedIndex =
                                        attributeTypeList.indexOf(value);
                                    if (selectedIndex == -1) return;
                                    entity.page = 1;

                                    List<FilterAttribute> attributes = [];
                                    attributes.add(FilterAttribute(
                                        attributeId:
                                            insidePageData[index].attributeId,
                                        value: LanguageHelper.checkIfLTR(
                                                context: context)
                                            ? [
                                                attributeTypeList[selectedIndex]
                                                        .option ??
                                                    "",
                                                attributeTypeList[selectedIndex]
                                                        .optionEn ??
                                                    ""
                                              ]
                                            : [
                                                attributeTypeList[selectedIndex]
                                                        .optionEn ??
                                                    "",
                                                attributeTypeList[selectedIndex]
                                                        .option ??
                                                    ""
                                              ]));

                                    entity.attributes = attributes;

                                    Navigator.of(context)
                                        .pushNamed(
                                      RouteNamedScreens.insidePageCategoryAdvs,
                                      arguments: InsidePageCategoryAdvArgs(
                                        isAllCategoryAds: false,
                                        category: widget.args.subCategory,
                                        entity: entity,
                                      ),
                                    )
                                        .then(
                                      (value) {
                                        clearFilter();
                                      },
                                    );
                                  },
                                  suggestionsCallback: (String pattern) async {
                                    return searchDropDown
                                        .where((item) =>
                                            (LanguageHelper.checkIfLTR(
                                                        context: context)
                                                    ? item.optionEn
                                                    : item.option)
                                                ?.toLowerCase()
                                                .contains(
                                                    pattern.toLowerCase()) ??
                                            false)
                                        .toList();
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: AppTextWidget(
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        text: LanguageHelper.checkIfLTR(
                                                context: context)
                                            ? suggestion.optionEn ?? ""
                                            : suggestion.option ?? "",
                                        fontSize: FontSizeManager.fs15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Visibility(
                                visible: insidePageData[index].star == 0,
                                child: SizedBox(
                                  height: AppHeightManager.h2,
                                ),
                              ),
                              Visibility(
                                visible: attributeTypeList.isNotEmpty,
                                child: DynamicHeightGridView(
                                  itemCount: attributeTypeList.length +
                                      (index == 1 ? 1 : 0),
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  builder: (context, i) {
                                    return i == 0 && index == 1
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(
                                                      RouteNamedScreens
                                                          .insidePageCategoryAdvs,
                                                      arguments:
                                                          InsidePageCategoryAdvArgs(
                                                              isAllCategoryAds:
                                                                  true,
                                                              category: widget
                                                                  .args
                                                                  .subCategory,
                                                              entity: entity))
                                                  .then(
                                                (value) {
                                                  clearFilter();
                                                },
                                              );
                                            },
                                            child: currentInsidePageData
                                                        ?.star ==
                                                    1
                                                ? DecoratedContainer(
                                                    height: AppHeightManager.h6,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                AppHeightManager
                                                                    .h1point5),
                                                    child: AppTextWidget(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: 'allAdvs'.tr(),
                                                      fontSize:
                                                          FontSizeManager.fs15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                : DecoratedContainer(
                                                    alignment: Alignment.center,
                                                    height: AppWidthManager.w30,
                                                    width: AppWidthManager.w30,
                                                    child: AppTextWidget(
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: "allAdvs".tr(),
                                                      fontSize:
                                                          FontSizeManager.fs15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              entity.page = 1;
                                              List<FilterAttribute> attributes =
                                                  [];
                                              attributes.add(FilterAttribute(
                                                  attributeId:
                                                      insidePageData[index]
                                                          .attributeId,
                                                  value: LanguageHelper
                                                          .checkIfLTR(
                                                              context: context)
                                                      ? [
                                                          (attributeTypeList[
                                                                      index == 1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                  .option ??
                                                              ""),
                                                          attributeTypeList[
                                                                      index == 1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                  .optionEn ??
                                                              ""
                                                        ]
                                                      : [
                                                          (attributeTypeList[
                                                                      index == 1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                  .optionEn ??
                                                              ""),
                                                          attributeTypeList[
                                                                      index == 1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                  .option ??
                                                              ""
                                                        ]));
                                              entity.attributes = attributes;
                                              Navigator.of(context)
                                                  .pushNamed(
                                                      RouteNamedScreens
                                                          .insidePageCategoryAdvs,
                                                      arguments:
                                                          InsidePageCategoryAdvArgs(
                                                              isAllCategoryAds:
                                                                  false,
                                                              category: widget
                                                                  .args
                                                                  .subCategory,
                                                              entity: entity))
                                                  .then(
                                                (value) {
                                                  clearFilter();
                                                },
                                              );
                                            },
                                            child: currentInsidePageData
                                                        ?.star ==
                                                    1
                                                ? DecoratedContainer(
                                                    height: AppHeightManager.h6,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                AppHeightManager
                                                                    .h1point5),
                                                    child: AppTextWidget(
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: LanguageHelper
                                                              .checkIfLTR(
                                                                  context:
                                                                      context)
                                                          ? attributeTypeList[
                                                                      index == 1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                  .optionEn ??
                                                              ""
                                                          : attributeTypeList[
                                                                      index == 1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                  .option ??
                                                              "",
                                                      fontSize:
                                                          FontSizeManager.fs15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                : DecoratedContainer(
                                                    height: AppWidthManager.w30,
                                                    width: AppWidthManager.w30,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                AppWidthManager
                                                                    .w3Point8,
                                                            vertical:
                                                                AppHeightManager
                                                                    .h1),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        AppTextWidget(
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.center,
                                                          text: LanguageHelper
                                                                  .checkIfLTR(
                                                                      context:
                                                                          context)
                                                              ? attributeTypeList[index ==
                                                                              1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                      .optionEn ??
                                                                  ""
                                                              : attributeTypeList[index ==
                                                                              1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                      .option ??
                                                                  "",
                                                          fontSize:
                                                              FontSizeManager
                                                                  .fs15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        Visibility(
                                                          visible: (attributeTypeList[index ==
                                                                              1
                                                                          ? i -
                                                                              1
                                                                          : i]
                                                                      .photo ??
                                                                  "")
                                                              .isNotEmpty,
                                                          child:
                                                              MainImageWidget(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    AppRadiusManager
                                                                        .r10),
                                                            height:
                                                                AppWidthManager
                                                                    .w13,
                                                            width:
                                                                AppWidthManager
                                                                    .w13,
                                                            imageUrl: AppConstantManager
                                                                    .imageBaseUrl +
                                                                attributeTypeList[
                                                                        index ==
                                                                                1
                                                                            ? i -
                                                                                1
                                                                            : i]
                                                                    .photo
                                                                    .toString(),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                          );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: AppHeightManager.h2point5,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const CompaniesAccountsListView(),
                  SizedBox(
                    height: AppHeightManager.h2point5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryInsidePageArgs {
  SubCategory subCategory;

  CategoryInsidePageArgs({required this.subCategory});
}
