import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/categories_options_list_view_shimmer.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

import '../../../home/domain/entity/response/get_categories_response_entity.dart';
import '../../../home/presentation/cubit/get_categories_cubit.dart';

class CategoriesOptionsListView extends StatefulWidget {
  const CategoriesOptionsListView({super.key});

  @override
  State<CategoriesOptionsListView> createState() =>
      _CategoriesOptionsListViewState();
}

class _CategoriesOptionsListViewState extends State<CategoriesOptionsListView> {
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return Center(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const CategoriesOptionsListViewShimmer();
                },
              ),
            );
          }
          List<MainCategory>? categories = state.entity.data ?? [];

          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                      value: index,
                      groupValue: selectedCategoryIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedCategoryIndex = index;
                          print(categories[selectedCategoryIndex].categoryId);
                          print('category id');
                        });
                      },
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: AppColorManager.mainColor,
                      contentPadding: EdgeInsets.zero,
                      title: AppTextWidget(
                          text:
                              //TODO change the name based on language
                              LanguageHelper.checkIfLTR(context: context)
                                  ? categories[index].name ?? ""
                                  : categories[index].name ?? ""),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
