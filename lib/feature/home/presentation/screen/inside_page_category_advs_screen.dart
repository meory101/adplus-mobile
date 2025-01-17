import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/ads_by_category_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/ads_by_category_cubit/advs_by_category_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/inside_page_advs/advs_by_attribute_list_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/inside_page_advs/advs_by_category_list_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/inside_page_advs/cities_drop_down_list.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/loading/shimmer/attribute_list_view_shimmer.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_state.dart';
import '../../domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';
import '../cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import '../widget/inside_page_advs/attributes_horizantal_list_view.dart';
import '../widget/inside_page_advs/dialog/showAttributeListCheckBox.dart';
import 'category_inside_page_screen.dart';

class InsidePageCategoryAdvsScreen extends StatefulWidget {
  final InsidePageCategoryAdvArgs args;

  const InsidePageCategoryAdvsScreen({super.key, required this.args});

  @override
  State<InsidePageCategoryAdvsScreen> createState() =>
      _InsidePageCategoryAdvsScreenState();
}

class _InsidePageCategoryAdvsScreenState
    extends State<InsidePageCategoryAdvsScreen> {
  @override
  void initState() {
    if (widget.args.isAllCategoryAds == true) {
      isAllAdvs = true;
      context.read<AdsByCategoryCubit>().getAdvsByCategory(
          context: context,
          entity: AdsByCategoryRequestEntity(
              page: 1, categoryId: widget.args.category.categoryId));
    } else {
      FilterRequest.entity = AdvsByAttributeRequestEntity();
      FilterRequest.entity = widget.args.entity;
      selectedAttributeMap = {};
      selectedAttributeMap[widget.args.entity.attributes?.first.attributeId ??
          -1] = widget.args.entity.attributes?.first.value ?? [];

      print(widget.args.entity.attributes?.first.value ?? []);
      print('sdlkffffffffffffffffffffffffff');
      getAdvertisements();
    }
    scrollController.addListener(onScroll);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        isAllAdvs = false;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  getAdvertisements() {
    context
        .read<AdvsByAttributeCubit>()
        .getAdvsByAttribute(context: context, entity: FilterRequest.entity);
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - AppHeightManager.h20) {
      if ((FilterRequest.entity.attributes ?? []).isEmpty == true) {
        context.read<AdsByCategoryCubit>().getAdvsByCategory(
              context: context,
              entity: AdsByCategoryRequestEntity(
                  categoryId: widget.args.category.categoryId),
            );
      } else {
        context.read<AdvsByAttributeCubit>().getAdvsByAttribute(
              context: context,
              entity: FilterRequest.entity,
            );
      }
    }
  }

  getData() async {
    FilterRequest.entity.attributes?.forEach(
      (element) {},
    );
    context.read<AdvsByAttributeCubit>().resetData();
    getAdvertisements();
    setState(() {
      isAllAdvs == false;
    });
  }

  final ScrollController scrollController = ScrollController();
  AdData? advertisement;
  bool foundAttribute = false;
  bool isAllAdvs = false;
  int starItemsLength = 0;
  num? starItemAttributeId;
  num? selectedStarIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  MainAppBar(title: ""),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: AppHeightManager.h14,
          ),
          height: AppHeightManager.h16,
          color: AppColorManager.background,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
            child: Column(
              children: [
                BlocConsumer<GetCategoryAttributesCubit,
                    GetCategoryAttributesState>(listener: (context, state) {
                  if (state.status == CubitStatus.error) {
                    NoteMessage.showErrorSnackBar(
                        context: context, text: state.error);
                  }
                }, builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return const AttributeListViewShimmer();
                  }

                  List<CategoryAttributes>? filterItems = [];
                  List<CategoryAttributes>? staredItems = [];
                  if ((state.entity.data?.attributes ?? []).isNotEmpty) {
                    state.entity.data?.attributes?.forEach(
                      (attribute) {
                        if (attribute.star == 0) {
                          filterItems.add(attribute);
                        } else {
                          staredItems.add(attribute);
                        }
                      },
                    );
                  }
                  if (staredItems.isNotEmpty) {
                    starItemsLength =
                        (staredItems.first.attributeTypeList ?? []).length;
                    starItemAttributeId = staredItems.first.attributeId;
                  }

                  if (starItemsLength > 0) {
                    if (selectedStarIndex == -1) {
                      if (widget.args.entity.attributes?.first.attributeId ==
                          starItemAttributeId) {
                        for (int newIndex = 0;
                            newIndex <
                                (staredItems.first.attributeTypeList ?? [])
                                    .length;
                            newIndex++) {
                          String? name =
                              LanguageHelper.checkIfLTR(context: context)
                                  ? (staredItems
                                          .first
                                          .attributeTypeList?[newIndex]
                                          .optionEn ??
                                      "")
                                  : staredItems
                                          .first
                                          .attributeTypeList?[newIndex]
                                          .option ??
                                      "";
                          if (name ==
                              widget.args.entity.attributes?.first.value
                                  ?.first) {
                            selectedStarIndex = newIndex;
                          }
                        }
                      }
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: AppHeightManager.h7,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CitiesDropDownList(),
                              AttributesHorizantalListView(
                                filterItems: filterItems,
                                onDoneSelecting: () {
                                  getData();
                                },
                              ),
                              MainAppButton(
                                onTap: () {
                                  clearFilter();
                                  selectedStarIndex = -1;
                                  selectedAttributeMap[
                                  starItemAttributeId ?? 0] = [];

                                  setState(() {
                                  });
                                },
                                margin:
                                EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
                                alignment: Alignment.center,
                                height: AppHeightManager.h6,
                                width: AppWidthManager.w45,
                                color: AppColorManager.white,
                                outLinedBorde: true,
                                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                                borderColor: AppColorManager.subColor,
                                child: AppTextWidget(
                                  text: "reset".tr(),
                                  color: AppColorManager.subColor,
                                  fontSize: FontSizeManager.fs16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: AppHeightManager.h1point8,
                      ),
                      Visibility(
                        visible: starItemsLength > 0,
                        replacement: AppTextWidget(
                          text: "whatAreYouSearchingFor".tr(),
                          color: AppColorManager.black,
                          fontSize: FontSizeManager.fs16,
                          fontWeight: FontWeight.w600,
                        ),
                        child: SizedBox(
                          height: AppHeightManager.h5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: starItemsLength,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  List<String>? name =[  staredItems.first
                                          .attributeTypeList?[index].optionEn ??"",
                                       staredItems.first
                                          .attributeTypeList?[index].option ??""];
                                  selectedStarIndex = index;
                                  selectedAttributeMap[
                                      starItemAttributeId ?? 0] = [];
                                  selectedAttributeMap[starItemAttributeId ??
                                      0] = name;

                                  List<FilterAttribute> attributes = [];
                                  selectedAttributeMap.forEach(
                                    (key, value) {
                                      if (value.isNotEmpty) {
                                        attributes.add(FilterAttribute(
                                            value: value, attributeId: key));
                                      }
                                    },
                                  );
                                  FilterRequest.entity.attributes =
                                      attributes;
                                  getData();
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: AppHeightManager.h5,
                                  decoration: BoxDecoration(
                                    color: selectedStarIndex == index
                                        ? AppColorManager.mainColor
                                        : AppColorManager.lightGreyOpacity6,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppRadiusManager.r8)),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: AppWidthManager.w2),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppWidthManager.w7,
                                    vertical: AppHeightManager.h1,
                                  ),
                                  child: AppTextWidget(
                                      fontWeight: FontWeight.w600,
                                      color: selectedStarIndex == index
                                          ? AppColorManager.white
                                          : AppColorManager.textAppColor,
                                      text: LanguageHelper.checkIfLTR(
                                              context: context)
                                          ? (staredItems
                                                  .first
                                                  .attributeTypeList?[index]
                                                  .optionEn ??
                                              "")
                                          : staredItems
                                                  .first
                                                  .attributeTypeList?[index]
                                                  .option ??
                                              ""),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: AppHeightManager.h1),
          child: SingleChildScrollView(
            controller: scrollController,
            child: (FilterRequest.entity.attributes ?? []).isEmpty
                ? Column(
                    children: [
                      AdsByCategoryListView(category: widget.args.category),
                      SizedBox(
                        height: AppHeightManager.h2,
                      ),
                    ],
                  )
                : AdvsByAttributeListView(
                    category: widget.args.category,
                  ),
          ),
        ));
  }
}

class InsidePageCategoryAdvArgs {
  AdvsByAttributeRequestEntity entity;
  SubCategory category;
  bool? isAllCategoryAds;

  InsidePageCategoryAdvArgs(
      {required this.entity,
      required this.category,
      required this.isAllCategoryAds});
}

abstract class FilterRequest {
  static AdvsByAttributeRequestEntity entity = AdvsByAttributeRequestEntity();
}
