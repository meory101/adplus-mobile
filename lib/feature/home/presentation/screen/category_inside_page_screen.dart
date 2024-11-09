import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/category_inside_page_shimmer.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/inside_page_category_advs_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/home/home_banners.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import '../../domain/entity/response/get_adv_details_response_entity.dart';
import '../../domain/entity/response/get_categories_response_entity.dart';

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
              child:
              Column(
                children: [
                  HomeBanners(
                    source: EnumManager.insidePageBannerSource,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: insidePageData.length,
                    itemBuilder: (context, index) {
                      List<AttributeTypeList> attributeTypeList =
                          insidePageData[index].attributeTypeList ?? [];
                      currentInsidePageData = insidePageData[index];

                      return Visibility(
                        visible: attributeTypeList.isNotEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                                text: insidePageData[index].attributeName ?? ""),
                            SizedBox(
                              height: AppHeightManager.h1point8,
                            ),
                            DynamicHeightGridView(
                              itemCount: attributeTypeList.length,
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              builder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    entity.page = 1;
                                    List<Attributes> attributes = [];
                                    attributes.add(Attributes(
                                        attributeId:
                                            currentInsidePageData?.attributeId,
                                        value: attributeTypeList[index].option));
                                    entity.attributes = attributes;
                                    Navigator.of(context).pushNamed(
                                        RouteNamedScreens.insidePageCategoryAdvs,
                                        arguments: InsidePageCategoryAdvArgs(
                                          categoryId: widget.args.subCategory.categoryId??-1,
                                            entity: entity));
                                  },
                                  child: DecoratedContainer(
                                      margin: EdgeInsets.only(
                                        bottom: AppHeightManager.h1point8,
                                        right: LanguageHelper.checkIfLTR(
                                                context: context)
                                            ? AppWidthManager.w3Point8
                                            : 0,
                                        left: !LanguageHelper.checkIfLTR(
                                                context: context)
                                            ? AppWidthManager.w3Point8
                                            : 0,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppWidthManager.w3Point8,
                                          vertical:
                                              (attributeTypeList[index].photo ?? "")
                                                      .isNotEmpty
                                                  ? AppHeightManager.h2
                                                  : AppHeightManager.h1point8),
                                      child: Stack(
                                        children: [
                                          Visibility(
                                            visible:
                                                (attributeTypeList[index].photo ?? "")
                                                    .isNotEmpty,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: AppHeightManager.h2point5),
                                              child: MainImageWidget(
                                                height: AppWidthManager.w15,
                                                width: AppWidthManager.w15,
                                                imageUrl:
                                                    AppConstantManager.imageBaseUrl +
                                                        attributeTypeList[index]
                                                            .photo
                                                            .toString(),
                                              ),
                                            ),
                                          ),

                                          Align(
                                            alignment: Alignment.center,
                                            child: AppTextWidget(
                                              maxLines: 2,
                                                textAlign: TextAlign.center,
                                                text: '${attributeTypeList[index].option ??
                                                    ""}\n'),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            ),
                            SizedBox(
                              height: AppHeightManager.h2point5,
                            ),
                          ],
                        ),
                      );
                    },
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
