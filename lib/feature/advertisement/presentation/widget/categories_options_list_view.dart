import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/categories_options_list_view_shimmer.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/category_attribute_form_screen.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';

import '../../../home/domain/entity/response/get_categories_response_entity.dart';
import '../../../home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';

class CategoriesOptionsListView extends StatefulWidget {
  final Function(num) selectCategoryCallBak;

  const CategoriesOptionsListView(
      {super.key, required this.selectCategoryCallBak});

  @override
  State<CategoriesOptionsListView> createState() =>
      _CategoriesOptionsListViewState();
}

class _CategoriesOptionsListViewState extends State<CategoriesOptionsListView> {
  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
        listener: (context, state) {
      if (state.status == CubitStatus.error) {
        NoteMessage.showErrorSnackBar(
            context: context, text:  state.error);
      }
    }, builder: (context, state) {
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
          return Visibility(
            visible: (categories[index].children??[]).isEmpty,
            child: Row(
              children: [
                Flexible(
                  child: RadioListTile(
                    value: index,
                    groupValue: selectedCategoryIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedCategoryIndex = index;
                        if (selectedCategoryIndex != null) {
                          AdvertisementModel.entity?.keywords = categories[selectedCategoryIndex!].keywords;
                          widget.selectCategoryCallBak(
                              categories[selectedCategoryIndex!].categoryId ?? -1);
                        }
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
                            LanguageHelper.checkIfLTR(context: context)
                                ? categories[index].enName ?? ""
                                : categories[index].name ?? ""
                    ,
                      fontSize: FontSizeManager.fs16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
