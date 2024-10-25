import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/category_inside_page_shimmer.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_category_inside_page_usecase.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';

import '../../../advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          //TODO change lang
          title: LanguageHelper.checkIfLTR(context: context)
              ? widget.args.subCategory.name ?? ""
              : widget.args.subCategory.name ?? ""),
      body: BlocConsumer<CategoryInsidePageCubit, CategoryInsidePageState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            NoteMessage.showErrorSnackBar(context: context, text: "");
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const CategoryInsidePageShimmer();
          }

          List<Attributes>? insidePageData = state.entity.data ?? [];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
            child: ListView.builder(
              itemCount: insidePageData.length,
              itemBuilder: (context, index) {
                List<AttributeTypeList> attributeTypeList =
                    insidePageData[index].attributeTypeList ?? [];
                return Visibility(
                  visible: attributeTypeList.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                          text: insidePageData[index].attributeName ?? "dd"),
                      SizedBox(
                        height: AppHeightManager.h1point8,
                      ),
                      DynamicHeightGridView(
                        itemCount: attributeTypeList.length,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (context, index) {
                          return DecoratedContainer(
                              margin: EdgeInsets.only(
                                bottom: AppHeightManager.h1point8,
                                right:
                                    LanguageHelper.checkIfLTR(context: context)
                                        ? AppWidthManager.w3Point8
                                        : 0,
                                left:
                                    !LanguageHelper.checkIfLTR(context: context)
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
                                  AppTextWidget(
                                      textAlign: TextAlign.center,
                                      text: attributeTypeList[index].option ??
                                          ""),
                                ],
                              ));
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
