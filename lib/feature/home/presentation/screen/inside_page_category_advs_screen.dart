import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/drop_down/NameAndId.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_state.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/widget/drop_down/drop_down_form_field.dart';
import '../../../../core/widget/drop_down/title_drop_down_form_field.dart';
import '../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../core/widget/loading/shimmer/attribute_list_view_shimmer.dart';
import '../../../advertisement/domain/entity/response/get_cities_response_entity.dart';
import '../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import '../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_state.dart';
import '../../../advertisement/presentation/screen/category_attribute_form_screen.dart';
import '../../domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../domain/entity/response/get_adv_details_response_entity.dart';
import '../cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';

class InsidePageCategoryAdvsScreen extends StatefulWidget {
  final InsidePageCategoryAdvArgs args;

  const InsidePageCategoryAdvsScreen({super.key, required this.args});

  @override
  State<InsidePageCategoryAdvsScreen> createState() =>
      _InsidePageCategoryAdvsScreenState();
}

class _InsidePageCategoryAdvsScreenState
    extends State<InsidePageCategoryAdvsScreen> {
  AdvsByAttributeRequestEntity entity = AdvsByAttributeRequestEntity();

  @override
  void initState() {
    getAdvs(widget.args.entity);
    entity  =widget.args.entity;
    scrollController.addListener(onScroll);

    super.initState();
  }


  getAdvs(AdvsByAttributeRequestEntity entity) {
    context
        .read<AdvsByAttributeCubit>()
        .getAdvsByAttribute(context: context, entity: entity);
  }

  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      print('20000000000000000000000000000000000000');

      print(entity.attributes?.length);
      print('20000000000000000000000000000000000000');
      context.read<AdvsByAttributeCubit>().getAdvsByAttribute(
            context: context,
            entity: entity,
          );
    }
  }

  AdData? advertisement;
  Map viewCondition = {};
  Map attributeMap = {};
  Map allAttribute = {};
  bool foundAttribute = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(title: ""),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton:
        SizedBox(
          height: AppHeightManager.h20,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
            child: Column(
              children: [
                SizedBox(
                  height: AppHeightManager.h10,
                ),
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
                  List<CategoryAttributes>? filterItems =
                      state.entity.data?.attributes ?? [];
                  return SizedBox(
                      height: AppHeightManager.h7,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          BlocConsumer<GetCitiesCubit, GetCitiesState>(
                            listener: (context, state) {
                              if (state.status == CubitStatus.error) {
                                NoteMessage.showErrorSnackBar(
                                    context: context, text: state.error);
                              }
                            },
                            builder: (context, state) {
                              if (state.status == CubitStatus.loading) {
                                return ShimmerContainer(
                                    width: AppWidthManager.w45,
                                    height: AppHeightManager.h6);
                              }
                              List<NameAndId> citiesOptions = [];
                              List<City> cities = state.entity.data ?? [];
                              cities.forEach((city) {
                                citiesOptions.add(NameAndId(
                                  name: LanguageHelper.checkIfLTR(
                                          context: context)
                                      ? city.enName ?? ""
                                      : city.arName ?? "",
                                  id: city.cityId.toString(),
                                ));
                              });
                              return SizedBox(
                                height: AppHeightManager.h7,
                                width: AppWidthManager.w45,
                                child: MainDropdownWidget(
                                  hintFontColor: AppColorManager.black,
                                  onChanged: (selectedCity) {
                                    entity.cityId =
                                        num.parse(selectedCity?.id ?? "0");
                                    context
                                        .read<AdvsByAttributeCubit>()
                                        .getAdvsByAttribute(
                                            context: context, entity: entity);
                                  },
                                  hint: 'city'.tr(), // Localized text
                                  options: citiesOptions,
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filterItems.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              List<NameAndId> optionsList = [];
                              optionsList
                                  .add(const NameAndId(name: "all", id: "all"));
                              filterItems[index].attributeTypeList?.forEach(
                                (element) {
                                  optionsList.add(NameAndId(
                                      name: LanguageHelper.checkIfLTR(
                                              context: context)
                                          ? element.optionEn ?? ""
                                          : element.option ?? "",
                                      id: LanguageHelper.checkIfLTR(
                                              context: context)
                                          ? element.optionEn ?? ""
                                          : element.option ?? ""));
                                },
                              );
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return Visibility(
                                          visible: optionsList.isNotEmpty,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColorManager.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppRadiusManager.r10)),
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppWidthManager.w3Point8,
                                            ),
                                            height: AppHeightManager.h40,
                                            width: AppWidthManager.w100,
                                            child: ListView.builder(
                                              itemCount: optionsList.length,
                                              itemBuilder: (context, i) {
                                                Attributes attribute =
                                                    Attributes();
                                                attribute.attributeId =
                                                    filterItems[index]
                                                        .attributeId;
                                                attribute.value =
                                                    optionsList[i].name ?? "";
                                                return InkWell(
                                                  onTap: () {
                                                    if (attribute.value ==
                                                        "all") {
                                                      if (allAttribute[
                                                              filterItems[
                                                                  index]] ==
                                                          true) {
                                                        viewCondition[
                                                                'all${index}'] =
                                                            false;
                                                        for (var optionListElement
                                                            in optionsList) {
                                                          viewCondition[
                                                              optionListElement
                                                                  .name] = false;
                                                          attributeMap[
                                                              optionListElement
                                                                  .name] = null;
                                                        }
                                                        allAttribute[
                                                            filterItems[
                                                                index]] = false;
                                                      } else {
                                                        allAttribute[
                                                            filterItems[
                                                                index]] = true;
                                                        for (var optionListElement
                                                            in optionsList) {
                                                          if (optionListElement
                                                                  .name ==
                                                              "all") {
                                                            viewCondition[
                                                                    'all${index}'] =
                                                                true;
                                                            continue;
                                                          }
                                                          viewCondition[
                                                              optionListElement
                                                                  .name] = true;
                                                          attributeMap[
                                                              optionListElement
                                                                  .name] = Attributes(
                                                              attributeId:
                                                                  filterItems[
                                                                          index]
                                                                      .attributeId,
                                                              value:
                                                                  optionListElement
                                                                      .name);
                                                        }
                                                      }
                                                      setState(() {});
                                                      return;
                                                    }
                                                    if (attributeMap[
                                                            attribute.value] !=
                                                        null) {
                                                      viewCondition[
                                                              'all${index}'] =
                                                          false;
                                                      viewCondition[attribute
                                                          .value] = false;
                                                      attributeMap.remove(
                                                          attribute.value);
                                                    } else {
                                                      viewCondition[attribute
                                                          .value] = true;
                                                      attributeMap[attribute
                                                          .value] = attribute;
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: AppHeightManager
                                                              .h1point8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                AppRadiusManager
                                                                    .r15),
                                                        color: attribute
                                                                    .value ==
                                                                "all"
                                                            ? viewCondition[
                                                                        'all$index'] ??
                                                                    false
                                                                ? AppColorManager
                                                                    .lightGreyOpacity6
                                                                : viewCondition[attribute
                                                                            .value] ??
                                                                        false
                                                                    ? AppColorManager
                                                                        .lightGreyOpacity6
                                                                    : AppColorManager
                                                                        .white
                                                            : viewCondition[attribute
                                                                        .value] ??
                                                                    false
                                                                ? AppColorManager
                                                                    .lightGreyOpacity6
                                                                : AppColorManager
                                                                    .white,
                                                      ),
                                                      padding: EdgeInsets.only(
                                                          left: LanguageHelper
                                                                  .checkIfLTR(
                                                                      context:
                                                                          context)
                                                              ? AppWidthManager
                                                                  .w3
                                                              : AppWidthManager
                                                                  .w1Point2,
                                                          right: LanguageHelper
                                                                  .checkIfLTR(
                                                                      context:
                                                                          context)
                                                              ? AppWidthManager
                                                                  .w1Point2
                                                              : AppWidthManager
                                                                  .w3,
                                                          top: AppHeightManager.h1,
                                                          bottom: AppHeightManager.h05),
                                                      height: AppHeightManager.h7,
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          AppTextWidget(
                                                              text: attribute
                                                                          .value ==
                                                                      "all"
                                                                  ? "all".tr()
                                                                  : optionsList[
                                                                              i]
                                                                          .name ??
                                                                      ""),
                                                          Radio(
                                                            onChanged:
                                                                (value) {},
                                                            groupValue: true,
                                                            value: attribute
                                                                        .value ==
                                                                    "all"
                                                                ? viewCondition[
                                                                    'all$index']
                                                                : viewCondition[
                                                                        attribute
                                                                            .value] ??
                                                                    false,
                                                            activeColor:
                                                                AppColorManager
                                                                    .textAppColor,
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                          )
                                                        ],
                                                      )),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                  ).then((value) {
                                    for (var element in attributeMap.values) {
                                      if (element == null) continue;
                                      entity.attributes?.add(element);
                                    }
                                    context
                                        .read<AdvsByAttributeCubit>()
                                        .getAdvsByAttribute(
                                            context: context, entity: entity);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColorManager.white,
                                    border: Border.all(
                                        color:
                                            AppColorManager.lightGreyOpacity6),
                                    borderRadius: BorderRadius.circular(
                                        AppRadiusManager.r10),
                                  ),
                                  height: AppHeightManager.h7,
                                  width: AppWidthManager.w45,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppWidthManager.w3Point8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTextWidget(
                                            text: LanguageHelper.checkIfLTR(
                                                    context: context)
                                                ? filterItems[index]
                                                        .attributeNameEn ??
                                                    ""
                                                : filterItems[index]
                                                        .attributeName ??
                                                    ""),
                                        SvgPicture.asset(
                                            AppIconManager.arrowMenuDown)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ));
                })
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: BlocConsumer<AdvsByAttributeCubit, AdvsByAttributeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == CubitStatus.loading &&
                  state.entity.data == null) {
                // Initial loading state
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: Column(
                    children: [
                      SizedBox(height: AppHeightManager.h10),
                      const AdvsByAttributeShimmer(),
                    ],
                  ),
                );
              }

              List<AdData> advs = state.entity.data?.adData ?? [];

              return Column(
                children: [
                  SizedBox(height: AppHeightManager.h10),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
                    child: DynamicHeightGridView(
                      crossAxisSpacing: AppWidthManager.w2,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: advs.length +
                          (state.status == CubitStatus.loading ? 1 : 0),
                      builder: (context, index) {
                        if (index == advs.length) {
                          // Show a loading indicator for pagination
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        AdData? advertisement = advs[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              RouteNamedScreens.advertisementDetails,
                              arguments: AdvertisementDetailsArgs(
                                advertisement: advertisement,
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: AppHeightManager.h30,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      color: AppColorManager.lightGreyOpacity6,
                                      borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r15),
                                    ),
                                    child: MainImageWidget(
                                      fit: BoxFit.cover,
                                      height: AppHeightManager.h30,
                                      imageUrl: AppConstantManager
                                              .imageBaseUrl +
                                          (advertisement.photos?.first.photo ??
                                              ""),
                                      borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r15),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: AppHeightManager.h08),
                                      AppTextWidget(
                                        text:
                                            advertisement.name.toString() ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        fontSize: FontSizeManager.fs15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      AppTextWidget(
                                        text: advertisement.startingPrice
                                                .toString() ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        fontSize: FontSizeManager.fs14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                          height: AppHeightManager.h1point8),
                                    ],
                                  )
                                ],
                              ),
                              Visibility(
                                visible:
                                    state.entity.data?.adData?[index].star ==
                                        EnumManager.star,
                                child: MainAppButton(
                                  borderRadius: BorderRadius.circular(
                                      AppRadiusManager.r10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppWidthManager.w3Point8,
                                    vertical: AppHeightManager.h04,
                                  ),
                                  color: AppColorManager.gold,
                                  child: AppTextWidget(
                                    text: 'featured'.tr(),
                                    color: AppColorManager.white,
                                    fontSize: FontSizeManager.fs16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

class InsidePageCategoryAdvArgs {
  AdvsByAttributeRequestEntity entity;
  num categoryId;

  InsidePageCategoryAdvArgs({required this.entity, required this.categoryId});
}
