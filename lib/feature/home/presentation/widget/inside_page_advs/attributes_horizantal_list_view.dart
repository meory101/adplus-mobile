import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/icon_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/drop_down/NameAndId.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'dialog/showAttributeListCheckBox.dart';

class AttributesHorizantalListView extends StatelessWidget {
  final List<CategoryAttributes> filterItems;
  final Function ()onDoneSelecting;
  const AttributesHorizantalListView({super.key,required this.filterItems,required this.onDoneSelecting});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filterItems.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        List<NameAndId> optionsList = [];
        optionsList.add(
            const NameAndId(name: "all", id: "all"));
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
        return Visibility(
          visible: filterItems[index].attributeType?.name == EnumManager.list,
          child: InkWell(
            onTap: () {
              showAttributeListCheckBox(
                context: context,
                options: optionsList,
                currentFilterItemId : filterItems[index].attributeId,
                onDoneSelecting: () {
                  onDoneSelecting();
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColorManager.white,
                border: Border.all(
                    color: AppColorManager
                        .lightGreyOpacity6),
                borderRadius: BorderRadius.circular(
                    AppRadiusManager.r10),
              ),
              height: AppHeightManager.h7,
              width: AppWidthManager.w45,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    AppWidthManager.w3Point8),
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
          ),
        );
      },
    );
  }
}
